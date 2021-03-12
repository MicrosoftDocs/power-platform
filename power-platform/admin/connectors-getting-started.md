---
title: Programmability and Extensibility - Power Platform for Admins Management Connectors - Getting started | Microsoft Docs
description: Power Platform API getting started.
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 02/22/2021
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Get started with Power Platform for Admins Management Connectors
A connector is a proxy or a wrapper around an API that allows the underlying service to talk to the Power Platform API. It provides a way for users to connect their accounts and leverage a set of pre-built actions and triggers to build their apps and workflows.

These connectors are ready-made for environment management and other common activities for Power Platform administrators.  

## Components of a Connector
Each connector offers a set of operations classified as 'Actions' and 'Triggers'. Once you connect to the underlying service, these operations can be easily leveraged within your apps and workflows.

### Actions
Actions are changes directed by a user. For example, you would use an action to look up, write, update, or delete data in a SQL database. All actions directly map to operations defined in the Swagger.

### Triggers
Several connectors provide triggers that can notify your app when specific events occur. For example, the FTP connector has the OnUpdatedFile trigger. You can build either a Logic App or a flow that listens to this trigger and performs an action whenever the trigger fires.

There are two types of triggers.

**Polling Triggers**: These triggers call your service at a specified frequency to check for new data. When new data is available, it causes a new run of your workflow instance with the data as input.

**Push Triggers**: These triggers listen for data on an endpoint, that is, they wait for an event to occur. The occurrence of this event causes a new run of your workflow instance.  Support for Push type triggers will be added in a future release.

## Create your first workflow
To create your first workflow using the Power Platform for Admins connectors, see the below articles for getting started with Power Automate and the connector reference.  

* [Get started with your first Power Automate flow](https://docs.microsoft.com/en-us/power-automate/get-started-logic-flow)
* [Power Platform for Admins connector reference](https://docs.microsoft.com/en-us/connectors/powerplatformforadmins/)