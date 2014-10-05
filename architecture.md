---
layout: page
title: Architecture
longtitle: Project architecture
shortcut: true
permalink: /sc-architecture/
---

The goal of this project is to design an architecture able to **collect** data from remote sensor networks, to **store** them and to give **access** to them in a **efficient** way.

1. Sensors: **Collect** environmental data
2. Routing network: **Transport** data from sensors to the SmartCampus middleware
3. Middleware & API: A cloud-based middleware allowing the **storage** and the **retrieval** of data

<a href="/assets/threeaxis.png"><img src="/assets/threeaxis.png" height="50%" width="50%" alt="three axis illustration"></a>


## Sensor networks
The SmartCampus sensor networks are build around a two-stage topology: 

* Sensors and Sensors platforms
* Bridge

<a href="/assets/network.png"><img src="/assets/network.png" height="50%" width="50%" alt="sensor network illustration"></a>


### Sensors and Sensors platforms
**Sensors** are considered as black boxes, transforming a physical quantity into a measurment. 

**Sensor platforms** aggregates several sensors connected to it. The board is usually implemented by a micro-controller (e.g. Arduino). The platform also adds metadata such as the sensor name and the current timestamp. The responsability of a board is to collect the data and send them to its associated bridge.

As sensor platform are often runned by a micro-controller, it is possible to embed executable code. 

### Bridge
The bridge responsibility is to aggregate data streams for several boards. The different boards can be connected to the bridge using physical links (e.g. USB) or wireless protocols (e.g. Zigbee). The bridge is connected to the Internet and send the received data to the SmartCampus middleware.

The bridge also acts as a *virtual sensor board* to query and manage sensors if the real sensor board can't embed code.


## Middleware

The middleware is a cloud-based application offering three destinct APIs:
1. Reception API used by the bridges to send data
2. Configuration API to support the remote configuration of sensor networks
3. Data API used to interact with the collected datasets

It is designed to scale verticaly (e.g. for storage purpose by enlarging the databases size) and horizontaly (e.g. load-balancing requests). The scalability has been tested thanks to a sensor simulator developped by Romain Alexandre, Cécile Camillieri, Fabien Foerster and Jérôme Rancati (see Related projects).

The data API is also designed to support *Virtual Sensors* (server-side transformation rules applied on data - e.g. Celsius to Farenheit temperature conversion)

## SmartCampus @ I3S

### Sensors and sensors platforms

We have developped a *SmartCampusOS* on Arduino sensor platforms allowing the dynamic querying and management of sensor.

The code embedded on Arduino has been designed and implemented by Jean Oudot and Cyril Cecchinel. The very last version of SmartCampusOS is [avalaible on Github](https://github.com/SmartCampus/ArduinoSensorServer/tree/master/CodeArduino). 
This embedded OS allow a **remote** user to:

* manage sensors (addition, deletion, updating, sleep)
* manage and get informations on the sensor board (reboot, timestamp, board name)
* use wire and wireless communication (USB or Zigbee)
* fetch peridodically sensors for new values
	
The sensor network deployed at I3S allow the collection of *temperature*, *light* and *door opening*. We use Groove, Electronic Bricks and DFRobot sensors. Sensors platforms can either use USB or Zigbee communications.

### Bridges

Bridges are nano-computer (Raspberry Pi and Cubieboard) executing a ARM optimized Linux distribution. The program aggregating data from sensor platforms is a standard Java application. This applicaion has been designed and implemented by Jean Oudot and Cyril Cecchinel and is [avalaible on Github](https://github.com/SmartCampus/bridge/tree/master). It also offering a configuration API to remotly 1) set up the sensor plateforms and 2) assign endpoint for measures.

### Middleware

The middleware has been designed and implemented by Cyril Cecchinel, Thomas Di'Meco, Matthieu Jimenez and Laura Martellotto and is [avalaible on Github](https://github.com/SmartCampus/middleware/tree/master). The middleware has been deployed on two virtual servers at I3S: 

* A collection server used to collect data
* [An access server]("http://smartcampus.unice.fr/data-api/sensors/") used to expose the Data API to developers

Some datasets are already available and their number and size increase day after day!

