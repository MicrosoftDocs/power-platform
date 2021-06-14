---
title: Programmability and Extensibility - Power Platform for Admins management connectors - Getting started | Microsoft Docs
description: Power Platform API getting started
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 03/19/2021
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Get started with Power Platform for Admins management connectors
A connector is a proxy or a wrapper around an API that allows the underlying service to talk to the Power Platform API. It provides a way for users to connect their accounts and leverage a set of prebuilt actions and triggers to build their apps and workflows.

These connectors are ready-made for environment management and other common activities for Microsoft Power Platform administrators.  

## Components of a connector
Each connector offers a set of operations classified as *actions* and *triggers*. Once you connect to the underlying service, these operations can be easily leveraged within your apps and workflows.

### Actions
Actions are changes directed by a user. For example, you would use an action to look up, write, update, or delete data in a Microsoft Azure SQL database. All actions directly map to operations defined in [Swagger](/aspnet/core/tutorials/web-api-help-pages-using-swagger?view=aspnetcore-5.0).

### Triggers
Several connectors provide triggers that can notify your app when specific events occur. For example, the FTP connector has the OnUpdatedFile trigger. You can build either a logic app or a flow that listens to this trigger and performs an action whenever the trigger fires.

There are two types of triggers:

- **Polling triggers**: These triggers call your service at a specified frequency to check for new data. When new data is available, it causes a new run of your workflow instance with the data as input.

- **Push triggers**: These triggers listen for data on an endpoint—that is, they wait for an event to occur. The occurrence of this event causes a new run of your workflow instance.  Support for push-type triggers will be added in a future release.

## Create your first workflow
To create your first workflow using the Power Platform for Admins connectors, see the following articles for getting started with Power Automate and the connector reference.  

- [Create a cloud flow in Power Automate](/power-automate/get-started-logic-flow)
- [Power Platform for Admins](/connectors/powerplatformforadmins)
