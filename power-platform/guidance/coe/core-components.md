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
# Use Core Components

These components provide the core to get started with setting up a CoE – they sync all your resources into entities and build admin apps on top of that to help you get more visibility of what apps, flows and makers are in your environment. Additionally, apps like the DLP Editor and Set New App Owner help with daily admin tasks.  The Core Components solution only contains assets relevant to admins.

Learn how to [set up the core components](setup-core-components.md).

Here's a breakdown of the assets that form the core components

- **Catalog tenant resources**
  - CDS Entities: Environments, Apps, Flows
  - Admin | Sync Template v2 (Flows) – all, Apps, Flows, Custom Connectors, Connectors, Model Driven Apps
  - Admin | Sync Audit Log (Flow)
  - Power BI Dashboard
  - Custom Connector for Office 365 Audit Logs
  - Power Platform Admin View (Model Driven App)
- **DLP Strategy and Visibility**
  - DLP Editor (Canvas App)
  - DLP Customizer (Canvas App)
- **Change App Ownership**
  - Set New App Owner (Canvas App)

## Entities

- **Environment**
Represents the Environment object, which contains Power Apps, Flows and Connectors.
- **PowerApps App**
Represents a Power Apps App.
- **Flow** Represents a flow.
- **PowerApps Connector** Represents a standard or custom connector.
- **Connection Reference** The linking table for the many to many relationships between Connectors (PowerApps Connector) and flows (Flow) / Power Apps (PowerApps App)
- **Maker** Represents a user who has created a Power App, flow, Custom Connector or Environment.
- **Audit Log** Represents session details for Power Apps.
- **CoE Settings** Settings configurations live in a record here. This is an important entity to populate data into during the setup process, because it contains details that are important for configuring the branding and support aspect of the solution
- **Sync Flow Errors** Represents daily occurrence of Sync Flow errors to provide a summary email to admin

## Security Roles

- **Power Platform Admin SR** Gives full access to create, read, write and delete operations on the custom entities.

- **Power Platform Maker SR** Gives read and write access to the custom entities (e.g., Environments, Apps, etc).

- **Power Platform User SR**  Gives read only access to the resources in the custom entities.

## Flows

### Admin \| Sync Audit Logs

Uses the Office 365 Audit logs custom connector to write audit log data into the
CDS Audit Log entity. This will generate a view of usage for Power Apps. This
flow also comes in a separate package outside of the solution when you download
the CoE Starter Kit because it's easier to import the package separately with
the custom connector. Follow the instructions in the audit log section to learn
more.

### Admin \| Sync Template v2

Runs on a schedule and updates environments. This and subsequent 'Sync Template
V2' flows are an optimized version of the Sync Template V1, split out into
separate Flows to make it easier to read and modify.

Running this flow will also trigger the rest of the Sync flows indirectly by
updating the Environment records in the CDS instance you instantiated.

### Admin \| Sync Template v2 (Apps)

Runs when an environment is created/modified and gets App information, also
updates record if Apps are deleted.

### Admin \| Sync Template v2 (Flows)

Runs when an environment is created/modified and gets flow information, also
updates record if flows are deleted.

### Admin \| Sync Template v2 (Connectors)

Runs once daily on a schedule and gets Connector information.

### Admin \| Sync Template v2 (Custom Connector)

Runs when an environment is created/modified and gets Custom Connector
information.

### Admin \| Sync Template v2 (Sync Flow Errors)

Runs on a schedule and sends an email of environments that failed to sync with a
link to the flow instance to the admin

## Apps

### DLP Editor

Canvas app that reads and updates DLP policies while showing a list of apps that
are affected by the policy configurations.

Use this app to make changes to the DLP policies to see what impact it will
have, and mitigate the risk of breaking a Flow / App through DLP changes by
contacting makers.

To learn more about DLP data groups, read [introduction to data
groups](https://docs.microsoft.com/en-us/power-platform/admin/introduction-to-data-groups)

**Permission**: Intended to be used only by admins, Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![DLP Editor](media/coedlp1.png)

### DLP Customizer

Canvas app that allows you to add Custom Connectors to the Business Data Group
of a DLP Policy, or to enable HTTP Connectors to a DLP Policy. For more
information read [http and custom connector support for dlp
policies](https://docs.microsoft.com/en-us/business-applications-release-notes/october18/microsoft-flow/http-and-custom-connector-support-for-dlp-policies)

**Permission**: Intended to be used only by admins, Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![DLP Customizer](media/coedlp2.png)

### Set New App Owner

Canvas app that an admin can use to discover apps by app or maker name, and set
a new *app owner* or add new viewers and editors.

For more information on application permissions see [canvas apps - share
app](https://docs.microsoft.com/en-us/powerapps/maker/canvas-apps/share-app).

**Permission**: Intended to be used only by admins, Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![Set New App Owner](media/coeowner1.png)

