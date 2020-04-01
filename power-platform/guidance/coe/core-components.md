---
title: "Core Components | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Use Core components

These components provide the core to get started with setting up a CoE – they sync all your resources into entities and build admin apps on top of that to help you get more visibility of what apps, flows and makers are in your environment. Additionally, apps like the DLP Editor and Set New App Owner help with daily admin tasks.  The Core Components solution contains assets relevant only to admins.

Learn how to [set up the core components](setup-core-components.md).

Here's a breakdown of the assets that form the core components:

- **Catalog tenant resources**
  - [CDS Entities](#entities): Environments, Apps, Flows,...
  - [Admin | Sync Template v2 (Flows)](#flows) – all, Apps, Flows, Custom Connectors, Connectors, Model Driven Apps
  - [Admin | Sync Audit Log (Flow)](#flows)
  - [Power BI Dashboard](#power-bi-report)
  - [Power Platform Admin View (Model Driven App)](#apps)
- **DLP Strategy and Visibility**
  - [DLP Editor (Canvas App)](#apps)
  - [DLP Customizer (Canvas App)](#apps)
- **Change App Ownership**
  - [Set New App Owner (Canvas App)](#apps)

## Entities

- **Environment**
Represents the Environment object, which contains apps, flows and connectors
- **PowerApps App**
Represents a Power Apps app
- **Flow** Represents a flow
- **PowerApps Connector** Represents a standard or custom connector
- **Connection Reference** The linking table for the many to many relationships between Connectors (PowerApps Connector) and flows (Flow) / Power Apps (PowerApps App)
- **Maker** Represents a user who has created a Power App, flow, Custom Connector or Environment
- **Audit Log** Represents session details for Power Apps
- **CoE Settings** Settings configurations live in a record here. This is an important entity to populate data into during the setup process, because it contains details that are important for configuring the branding and support aspect of the solution.
- **Sync Flow Errors** Represents daily occurrence of Sync Flow errors to provide a summary email to admin

## Security Roles

- **Power Platform Admin SR** Gives full access to create, read, write and delete operations on the custom entities

- **Power Platform Maker SR** Gives read and write access to the custom entities (e.g., Environments, Apps, etc)

- **Power Platform User SR**  Gives read only access to the resources in the custom entities

## Flows

### Admin \| Sync Audit Logs

Uses the Office 365 Audit logs custom connector to write audit log data into the
CDS Audit Log entity. This will generate a view of usage for Power Apps. Follow the [setup instructions](setup-auditlog.md) to learn more.

### Admin \| Sync Template v2

Runs on a schedule and updates environments. This and subsequent 'Sync Template
V2' flows are an optimized version of the Sync Template V1, split out into
separate Flows to make it easier to read and modify.

Running this flow will also trigger the rest of the Sync flows indirectly by
updating the Environment records in the CDS instance you instantiated.

### Admin \| Sync Template v2 (Apps)

Runs when an environment is created/modified and gets App information; also
updates record if Apps are deleted

### Admin \| Sync Template v2 (Flows)

Runs when an environment is created/modified and gets flow information; also
updates record if flows are deleted

### Admin \| Sync Template v2 (Connectors)

Runs once daily on a schedule and gets Connector information

### Admin \| Sync Template v2 (Custom Connector)

Runs when an environment is created/modified and gets Custom Connector
information

### Admin \| Sync Template v2 (Sync Flow Errors)

Runs on a schedule and sends an email to the admin about environments that failed to sync, with a
link to the flow instance

## Apps

### DLP Editor

Canvas app that reads and updates Data Loss Prevention (DLP) policies while showing a list of apps that
are affected by the policy configurations.

Use this app to

- make changes to the DLP policies
- see what impact each change will have
- mitigate the risk of breaking a Flow / App through DLP changes by
contacting makers.

To learn more about DLP data groups, read [introduction to data
groups](https://docs.microsoft.com/power-platform/admin/introduction-to-data-groups)

**Permission**: Intended to be used only by admins: Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![DLP Editor](media/coe51.png)

### DLP Customizer

Canvas app that allows you to add Custom Connectors to the Business Data Group
of a DLP Policy, or to enable HTTP Connectors to a DLP Policy. For more
information read [http and custom connector support for DLP
policies](https://docs.microsoft.com/business-applications-release-notes/october18/microsoft-flow/http-and-custom-connector-support-for-dlp-policies).

**Permission**: Intended to be used only by admins: Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![DLP Customizer](media/coe52.png)

### Set New App Owner

Canvas app that an admin can use to discover apps by app or maker name, and set
a new *app owner* or add new viewers and editors.

For more information on application permissions see [Share a canvas app in Power Apps](https://docs.microsoft.com/powerapps/maker/canvas-apps/share-app).

**Permission**: Intended to be used only by admins: Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![Set New App Owner](media/coe53.png)

### Power Platform Admin View

A model driven app that provides an interface used to navigate the items in the CDS custom entities. It provides access to views and forms for the custom entities in the solution.

![ower Platform Admin View Model Driven App](media/coe54.png)

## Power BI Report

Provides a wholistic view with visualizations and insights of data in the CDS entities: Environments, Power Apps Apps, Flows, Connectors, Connection References, Makers and Audit Logs.

Follow the [setup instructions](setup-powerbi.md) to set up the Power BI dashboard, and learn how to use it under [Learn about the CoE Dashboard](power-bi.md).

![CoE Power BI Dashboard](media/coe1.png)
