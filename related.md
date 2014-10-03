---
layout: page
title: Related projects
longtitle: Related projects
shortcut: true
permalink: /sc-related/
---
	Projects using directly or indirectly the SmartCampus infrastructure

## Captah
*Ivan Logre*

## Composition of Data collection policies on a sensor network
*Cyril Cecchinel*

Facing the problem of managing tremendous amounts of data, a commonly approach is to rely on sensor pooling and to push data collected by sensor in a cloud-based platforms.  Consequently, sensors cannot be exploited at
the same time and one needs to rely on data mining solutions to extract and exploit relevant data according to usage scenarios.

To develop software that fully exploits an large scale sensing infrastructure, it must be considered as a white box. But the developer tasks is then more complex as they have to deal with tedious low-level details of implementation out of their main business concerns.

This project proposes a tooled approch named *COSmIC*  (Composition Operators for Sensing InfrastruCtures) that tackle issues encountered by developers when they are using small-scale (e.g. University campus) sensor networks (lack of reusability, no sensor sharing, platform heterogenity and low-level programing) 

[*Link to the COSmIC tool*](https://github.com/ace-design/cosmic/)

## Sensor Simulation Framework
*Romain Alexandre, Cécile Camillieri, Fabien Foerster, Jérôme Rancati*

Cloud-based middleware should be designed to receive data from an increasing number of sensors. Most of the time, developpers do not have the budget to buy hundreds of sensors and bulding sensor networks is not a part of their business concerns. Therefore, testing the scalability of their products can become an issue.

This project brings to developpers a framework allowing the simulation of sensors. Two kinds of simulations are provided: 

* The replay of previously captured sensor data
* Predict the data that could be provided by sensors, using the definition and use of mathematical laws

These simulations can be performed in real time (e.g. to test the retrieval function of a middleware) or in virtual time. This latter allows to generate several months of data in a fast time in order to fill the middleware's database.

[Link to the simulator framework](https://github.com/SmartCampus/SimulationFramework)


## Sensor Visu Like
*Christian Brel, Emmanuel Pouthier*
