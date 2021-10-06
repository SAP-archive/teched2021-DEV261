![Kyma runtime](kyma-runtime.svg =250)
# DEV261 - Build Extensions with SAP BTP, Kyma Runtime

## Description

This repository contains the material for the SAP TechEd 2021 session called DEV261 - "Build Extensions with SAP BTP, Kyma Runtime".  

## Overview

This session introduces attendees to making use of the advantages that come along with Kubernetes in the context of their SAP BTP projects. SAP BTP, Kyma runtime is the fully managed Kubernetes runtime based on the open-source project "Kyma". This cloud-native solution allows the developers to extend SAP solutions with serverless Functions and combine them with containerized microservices. The offered functionality ensures smooth consumption of SAP and non-SAP applications, running workloads in a highly scalable environment, and building event- and API-based extensions.

During this session, you will learn how to make use of SAP BTP services in the context of a Kyma-based project. You will see how to 
- setup your continous integration and delivery pipeline using "[SAP Continuous Integration and Delivery](https://discovery-center.cloud.sap/serviceCatalog/continuous-integration-&-delivery)" for deploying an HTML5 app into the [SAP Launchpad service](https://discovery-center.cloud.sap/serviceCatalog/launchpad-service), 
- make use of [SAP HANA Cloud](https://discovery-center.cloud.sap/serviceCatalog/sap-hana-cloud), 
- and setup a connection to on-premise systems using the "[SAP Connectivity Service](https://discovery-center.cloud.sap/serviceCatalog/connectivity-service).

## Requirements

To follow the exercises in this repository, you need to have a free SAP BTP trial account or you make use of the free tier inside your SAP BTP global account. Details are described on [SAP.com](https://www.sap.com/products/business-technology-platform/trial.html).

Furthermore, you need to have the following tools and frameworks installed on your computer:
- [kubectl](https://developers.sap.com/tutorials/cp-kyma-download-cli.html) to interact with Kyma runtime via command-line interface (CLI),
- [nodejs version 14.\*](https://nodejs.org/en/download/),
- [SAP Cloud Connector](https://tools.hana.ondemand.com/#cloud) to setup the later communication from SAP BTP, Kyma runtime via SAP BTP Connectivity Service to your local compter emulating an on-premise system,

It is recommended to enable SAP BTP, Kyma runtime upfront as the creation of the runtime can take up to one hour. Simply follow the [SAP developer tutorial](https://developers.sap.com/tutorials/cp-kyma-getting-started.html). 

## Exercises

Provide the exercise content here directly in README.md using [markdown](https://guides.github.com/features/mastering-markdown/) and linking to the specific exercise pages, below is an example.

- [Getting Started](exercises/ex0/)
- [Exercise 1 - First Exercise Description](exercises/ex1/)
    - [Exercise 1.1 - Exercise 1 Sub Exercise 1 Description](exercises/ex1#exercise-11-sub-exercise-1-description)
    - [Exercise 1.2 - Exercise 1 Sub Exercise 2 Description](exercises/ex1#exercise-12-sub-exercise-2-description)
- [Exercise 2 - Second Exercise Description](exercises/ex2/)
    - [Exercise 2.1 - Exercise 2 Sub Exercise 1 Description](exercises/ex2#exercise-21-sub-exercise-1-description)
    - [Exercise 2.2 - Exercise 2 Sub Exercise 2 Description](exercises/ex2#exercise-22-sub-exercise-2-description)

  
**OR** Link to the Tutorial Navigator for example...

Start the exercises [here](https://developers.sap.com/tutorials/abap-environment-trial-onboarding.html).

**IMPORTANT**

Your repo must contain the .reuse and LICENSES folder and the License section below. DO NOT REMOVE the section or folders/files. Also, remove all unused template assets(images, folders, etc) from the exercises folder. 

## How to obtain support

Support for the content in this repository is available during the actual time of the online session for which this content has been designed. Otherwise, you may request support via the [Issues](../../issues) tab.

## License
Copyright (c) 2021 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
