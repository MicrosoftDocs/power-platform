---
title: "Core Components | MicrosoftDocs"
description: "The CoE Starter Kit core components provide the core to get started with setting up a Center of Excellence (CoE). They sync all your resources into entities and build admin apps on top of that to help you get more visibility of what apps, flows, and makers are in your environment."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Use core components

These components provide the core to get started with setting up a Center of Excellence (CoE). They sync all your resources into entities and build admin apps on top of that to help you get more visibility of what apps, flows, and makers are in your environment. Additionally, apps like the DLP Editor and Set New App Owner help with daily admin tasks. The Core Components solution contains assets relevant only to admins. More information: [Set up core components](setup-core-components.md)

Here's a breakdown of the assets that form the core components:

- **Catalog tenant resources**
  - [Common Data Service entities](#entities): Environments, apps, flows, and more
  - [Admin | Sync Template v2 (flows)](#flows): All apps, flows, custom connectors, connectors, model-driven apps
  - [Admin | Sync Audit Log (flow)](#flows)
  - [Power BI dashboard](#power-bi-report)
  - [Power Platform Admin View (model-driven app)](#apps)
- **DLP strategy and visibility**
  - [DLP Editor (canvas app)](#apps)
  - [DLP Customizer (canvas app)](#apps)
- **Change app ownership**
  - [Set New App Owner (canvas app)](#apps)

## Entities

- **Environment** Represents the Environment object, which contains apps, flows, and connectors.
- **PowerApps App** Represents an app.
- **Flow** Represents a flow.
- **Flow Action Detail** Represents the set of actions that occur in a flow.
- **PowerApps Connector** Represents a standard or custom connector.
- **Connection Reference** The linking table for the many-to-many relationships among connectors (PowerApps Connector) and flows (Flows) and/or apps (PowerApps App).
- **Maker** Represents a user who has created an app, flow, custom connector, or environment.
- **Audit Log** Represents session details for Power Apps.
- **CoE Settings** Settings configurations live in a record in this entity. This is an important entity to populate data into during the setup process, because it contains details that are important for configuring the branding and support aspect of the solution.
- **Sync Flow Errors** Represents the daily occurrence of sync flow errors to provide a summary email to an admin.

## Security roles

- **Power Platform Admin SR** Gives full access to create, read, write, and delete operations on the custom entities.

- **Power Platform Maker SR** Gives read and write access to the custom entities (environments, apps, and so on).

- **Power Platform User SR**  Gives read-only access to the resources in the custom entities.

## Flows

### Admin \| Sync Audit Logs

Uses the Office 365 Audit Logs custom connector to write audit log data into the Common Data Service Audit Log entity. This will generate a view of usage for Power Apps. More information: [Set up the Audit Log connector](setup-auditlog.md)

### Admin \| Sync Template v2

Runs on a schedule, and updates environments. This and subsequent Sync Template v2 flows are an optimized version of the Sync Template v1, split into separate flows to make them easier to read and modify.

Running this flow will also trigger the rest of the sync flows indirectly by updating the environment records in the Common Data Service instance you instantiated.

### Admin \| Sync Template v2 (Apps)

Runs when an environment is created or modified, and gets app information. Also updates the record if apps are deleted.

### Admin \| Sync Template v2 (Flows)

Runs when an environment is created or modified, and gets flow information. Also updates the record if flows are deleted.

### Admin \| Sync Template v2 (Connectors)

Runs once daily on a schedule, and gets connector information.

### Admin \| Sync Template v2 (Custom Connector)

Runs when an environment is created or modified, and gets custom connector information.

### Admin \| Sync Template v2 (Sync Flow Errors)

Runs on a schedule, and sends an email to the admin about environments that failed to sync (with a
link to the flow instance).

## Apps

### DLP Editor

Canvas app that reads and updates data loss prevention (DLP) policies while showing a list of apps that
are affected by the policy configurations.

Use this app to:

- Make changes to DLP policies.
- See what impact each change will have.
- Mitigate the risk of DLP changes' breaking a flow or an app by contacting makers.

More information: [Introduction to data groups](https://docs.microsoft.com/power-platform/admin/introduction-to-data-groups)

**Permission**: Intended to be used only by admins: Power Platform Service Admin or Global Admin permission required. Share with your CoE admins.

![DLP Editor](media/coe51.png "DLP Editor")

### DLP Customizer

Canvas app you can use to add custom connectors to the Business Data Group of a DLP policy, or to enable HTTP connectors to a DLP policy. More information: [HTTP and custom connector support for DLP policies](https://docs.microsoft.com/business-applications-release-notes/october18/microsoft-flow/http-and-custom-connector-support-for-dlp-policies)

**Permission**: Intended to be used only by admins: Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![DLP Customizer](media/coe52.png)

### Set New App Owner

Canvas app that an admin can use to discover apps by app or maker name, and set a new app owner or add new viewers and editors. More information: [Share a canvas app in Power Apps](https://docs.microsoft.com/powerapps/maker/canvas-apps/share-app)

**Permission**: This app is intended to be used only by admins: Power Platform Service Admin or Global Admin permission required. Share with your CoE admins.

![Set New App Owner](media/coe53.png "Set New App Owner")

### Power Platform Admin View

A model-driven app that provides an interface used to browse items in Common Data Service custom entities. It provides access to views and forms for the custom entities in the solution.

![Power Platform Admin View model-driven app](media/coe54.png "Power Platform Admin View model-driven app")

## Power BI Report

Provides a holistic view with visualizations and insights of data in the Common Data Service entities: Environments, Power Apps Apps, Flows, Connectors, Connection References, Makers, and Audit Logs.

Follow the [setup instructions](setup-powerbi.md) to set up the Power BI dashboard. Learn how to use it in [Learn about the CoE dashboard](power-bi.md).

![CoE Power BI dashboard](media/coe1.png "CoE Power BI dashboard")
