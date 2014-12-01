#!/bin/bash
GIT_MIDDLEWARE=https://github.com/SmartCampus/middleware.git
TARGET=/smartcampus
function pause(){
   read -p "$*"
}

echo "-------------------------------------"
echo "SmartCampus middleware - Installation"
echo "-------------------------------------"
echo -e
echo "This program will install the SmartCampus middleware..."
echo "* The middleware will be installed in $TARGET (make sure you have permissions to write in)"
echo "* Make sure you have an internet connection"
echo -e
pause "Press any key to continue ..."
echo -e
echo "Testing the environment..."
if [ -d "$TARGET" ]; then
 echo "[ERROR] $TARGET already exists. Aborting..."
 exit
else
 mkdir "$TARGET"
 if [ -d "$TARGET" ]; then
 echo "$TARGET created"
 else
 echo "[ERROR] Impossible to create $TARGET (perhaps you don't have the right privileges ?) Aborting..."
 fi
fi
echo "Download and install dependencies (you might be asked for your root password)..."
echo "The overall process can take some minutes... Have a break and drink a coffee :)"
pause "Press any key to continue ..."
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

sudo apt-get install -y maven
sudo apt-get install -y git

sudo apt-get install -y python3
sudo apt-get install -y python-pip
sudo pip install tornado
sudo pip install eve

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

sudo apt-get install -y postgresql
echo -e
echo "Download latest stable SmartCampus middleware version..."
git clone https://github.com/SmartCampus/middleware.git $TARGET
sudo chown -R $USER $TARGET
echo -e
echo "Configure Postgresql Database..."
sudo -u postgres psql postgres < $TARGET/database/SensorsData.sql
echo -e
echo "Configure MongoDB Database..."
echo -e "use ConfigDatabase" > create_mongodb_tmp.js
mongo < create_mongodb_tmp.js
rm create_mongodb_tmp.js
chmod +x $TARGET/scripts/*.sh
echo -e
echo "SmartCampus middleware is now installed !"
exit