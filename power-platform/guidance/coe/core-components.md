---
title: "Core components | MicrosoftDocs"
description: "The CoE Starter Kit core components provide the core to get started with setting up a Center of Excellence (CoE). They sync all your resources into entities and build admin apps on top of that to help you get more visibility of the apps, flows, and makers in your environment."
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

These components provide the core to get started with setting up a Center of Excellence (CoE). They sync all your resources into entities and build admin apps on top of that to help you get more visibility of the apps, flows, and makers in your environment. Additionally, apps like the DLP Editor and Set App Permissions help with daily admin tasks. The Core Components solution contains assets relevant only to admins. More information: [Set up core components](setup-core-components.md)

## Demo: Core Components

Watch how to use the Core Components solution.

> [!VIDEO https://www.youtube.com/embed/l0kJQAeKthw]

## What's in the solution

Here's a breakdown of the assets that form the core components:

- **Catalog tenant resources**
  - [Common Data Service entities](#entities): Environments, apps, flows, and more
  - [Admin | Sync Template v2 (flows)](#flows): All apps, flows, flow action details, custom connectors, connectors, model-driven apps, shared with information, chatbots.
  - [Admin | Sync Audit Log (flow)](#flows)
  - [Power BI dashboard](#power-bi-report)
  - [Power Platform Admin View (model-driven app)](#apps)
- **DLP strategy and visibility**
  - [DLP Editor (canvas app)](#apps)
  - [DLP Customizer (canvas app)](#apps)
- **Bulk change permissions for apps and flow**
  - [Set App Permissions (canvas app)](#apps)
  - [Set Flow Permissions (canvas app)](#apps)

## Entities

The [Sync Flows](#flows) of the CoE Starter Kit sync your tenant resources to the following CDS entities. All entities provide information on name, created by/on, modified by/on as well as resource specific information.

- **Environment** Represents the Environment object, which contains apps, flows, and connectors. The following information is available for each environment:
  - Enviornment ID
  - Display Name
  - CDS Instance URL
  - Created on
  - Environment Maker (Created by)
  - Region
  - Type (Trial, Developer, Production)
  - Number of Apps (rollup)
  - Number of Flows (rollup)
  - Number of Custom Connectors (rollup)
- **PowerApps App** Represents an app. The following information is available for each app:

  - Display Name
  - App ID
  - Environment
  - Owner
  - Created on
  - Modified on
  - Published on
  - Last Launched on (if collecting [Audit Log](setup-auditlog.md) information is configured)
  - App Plan Classification (Standard, Premium, Extended)
  - Shared Users
  - Shared Groups
  - Shared With Tenant (yes/no)
  - App Type (Canvas, Model Driven, SharePoint Form App)
  - App Orphaned

- **Flow** Represents a flow. The following information is available for each flow:

  - Display Name
  - Flow ID
  - Environment
  - Owner
  - Created on
  - Modified on
  - State (Started, Suspended, Stopped)
  - Flow Orphaned
  - Flow Trigger
- **Flow Action Detail** Represents the set of actions that occur in a flow. This entity has a n:1 link with the Flow entity. The following information is available for each action or trigger:
  - Type (Scope, ForEach, Microsoft 365 Users)
  - Operation (for connectors, such as Send Email, List Items)
  - Is Trigger (yes/no)
- **PowerApps Connector** Represents a standard or custom connector. The following information is available for each connector:
  - Connector ID
  - Display Name
  - Icon Background Color and Uri
  - Is Custom Connector (yes/no)
  - Maker (for Custom Connectors)
  - Publisher
  - Tier (Standard/Premium)
- **Connection Reference** The linking table for the many-to-many relationships among connectors (PowerApps Connector) and flows (Flows) and/or apps (PowerApps App).
- **Maker** Represents a user who has created an app, flow, custom connector, or environment. The following information is available for each maker (retrieved from Microsoft 365 Users Profiles):
  - Display Name
  - ID
  - eMail (User Principal Name)
  - City
  - Country
  - Department
  - Job Title
  - Office
  - Number of Apps (rollup)
  - Number of Flows (rollup)
- **Audit Log** Represents session details for Power Apps. The following information is available for each audit log entry:
  - Operation (Launched App, Deleted App, Deleted Flow)
  - App/Flow Id
  - User City, Country, Department, Job Title (from Microsoft 365)
  - Audit Log Event Time
- **CoE Settings** Settings configurations live in a record in this entity. This is an important entity to populate data into during the setup process, because it contains details that are important for configuring the branding and support aspect of the solution. The following settings are available to configure:
  - Brand Logo
  - Company Name
  - Primary Color
  - Secondary Color
  - End User Support eMail
  - Maker Support eMail
  - Link to Community Channel
  - Link to Learning Material
  - Link to Policy Documents
  - Tenant Type (Public, GCC)
- **Sync Flow Errors** Represents the daily occurrence of sync flow errors to provide a summary email to an admin. The following information is available for each sync flow error:
  - Flow Instance URL
  - Environment
  - Created on
- **Power Platform User** Represents who an app is shared with. The following information is available for each user:
  - Display Name
  - ID
  - Group Size (for Users it is set to 1, for Groups it will be the Group Size according to Azure AD)
  - Type (User, Group, Tenant)
  - User Principal Name (for Users)
- **Power Platform User Role** Represents the role a Power Platform User has for a specific app, this has a 1:n relationship with Power Platform User and PowerApps App. The following information is available for each role:
  - App
  - Power Platform User
  - Role Name (Owner, CanEdit, CanView)
  - Friendly Role Name (Owner, Co-Owner, Viewer)
- **PVA** Represents a Power Virtual Agent. The following information is available for each bot:
  - Display Name
  - ID
  - Created On
  - Owner
  - Modified on
  - Last Launched on
  - Total # of Sessions
  - Number of Components (rollup)
  - Number of Flows (rollup)
  - Status
  - Environment
  - Is Bot orphaned (yes/no)
- **PVA Component** Represents a Power Virtual Agent Component, such as a topic. The following information is available for each bot component:
  - Name
  - ID
  - Component Created on
  - Description
  - Display Name
  - Enviornment
  - Modified on
  - State
  - Type (Topic, Entity)
  - Uses Flow (yes/no)
- **PVA Component Flow** Represents a flow triggered as part of a Power Virtual Agent. The following information is available for each bot component flow:
  - Name
  - ID
  - Created on/by

## Security roles

- **Power Platform Admin SR** Gives full access to create, read, write, and delete operations on the custom entities.

- **Power Platform Maker SR** Gives read and write access to the custom entities (environments, apps, and so on).

- **Power Platform User SR**  Gives read-only access to the resources in the custom entities.

> [!NOTE]
> To easily explore and manage data stored in CDS, we recommend you install the [Microsoft PowerApps Office Add-in](https://appsource.microsoft.com/product/office/WA104380330?tab=Overview).<br><br>
> More information about its usage can be found in the following blog post. [Working with data in the Common Data Service for Apps using the Excel Add-in!](https://powerapps.microsoft.com/blog/cds-for-apps-excel-importexport/).

## Flows

### Admin \| Sync Template v2

Runs on a daily schedule, retrieves the environments in your tenant using [List Environments as Admin](https://docs.microsoft.com/connectors/powerplatformforadmins/#list-environments-as-admin) and creates or updates a record per environment in the Environment CDS entity.

Running this flow will also trigger the rest of the sync flows indirectly by updating the environment records in the Common Data Service instance you instantiated.

### Admin \| Sync Template v2 (Apps)

Runs when an environment is created or modified, and gets app information using [Get Apps as Admin](https://docs.microsoft.com/connectors/powerappsforadmins/#get-apps-as-admin), information is then created or updated in the PowerApps App entity.

### Admin \| Sync Template v2 (Flows)

Runs when an environment is created or modified, and gets flow information using [List Flows as Admin](https://docs.microsoft.com/connectors/flowmanagement/#list-flows-as-admin). Also updates the record if flows are deleted.

### Admin \| Sync Template v2 (Flow Action Details)

Runs once daily on a schedule, and gets the actions and triggers for all flows.

> [!WARNING]
> This flow uses [Get Flow as Admin](https://docs.microsoft.com/connectors/flowmanagement/#get-flow-as-admin) for every indivdual flow in your tenant, to get action and trigger details. Thus, it can be a very time and resource consuming flow to run.
Turning this flow on is optional, and only recommended if you are looking to perform action-level reporting or analysis, such as reporting on who is using the Send Email action of the Microsoft 365 Outlook connector.

### Admin \| Sync Template v2 (Connectors)

Runs once daily on a schedule, and gets connector information using [Get Connectors](https://docs.microsoft.com/connectors/powerappsforappmakers/#get-connectors), information such as the connector name, publisher and tier are stored.

### Admin \| Sync Template v2 (Custom Connector)

Runs when an environment is created or modified, and gets custom connector information using [Get Custom Connector](https://docs.microsoft.com/connectors/powerappsforadmins/#get-custom-connectors-as-admin), information such as the name, endpoint and created by/on are stored.

### Admin \| Sync Template v2 (Model Driven Apps)

Runs when an environment is created or modified, and gets model-driven app information. This information is retrieved from underlying CDS entities and requires the user running the flow to have System Administrator privileges to the environment.

### Admin \| Sync Template v2 (Power Apps User Shared With))

Runs when a PowerApps App record (canvas app) is created or modified, and gets who the app is shared with using [Get App Role Assignments as Admin](https://docs.microsoft.com/connectors/powerappsforadmins/#get-app-role-assignments-as-admin).

### Admin \| Sync Template v2 (PVA)

Runs when an environment is created or updated, and retrieves Power Virtual Agent (bot) information. This information is retrieved from underlying CDS entities and requires the user running the flow to have System Administrator privileges to the environment.

Turning this flow is optional; and only recommended if you are using Power Virtual Agents in your tenant and interested in getting tenant wide overview.

### Admin \| Sync Template v2 (Check Deleted)

This flow runs weekly, and compares CoE to the tenant to determine if any objects were deleted since last run. Either just marks them as deleted (if env var *Also Delete from CoE* = no) or deletes them from the CoE (if *Also Delete from CoE* = yes).

### Admin \| Sync Template v2 (Sync Flow Errors)

Runs on a schedule, and sends an email to the admin about environments that failed to sync (with a link to the flow instance).

### Admin \| Sync Template v2 (RPA)

Runs when an environment is created or updated, and retrieves UI flow information. This information is retrieved from underlying CDS entities and requires the user running the flow to have System Administrator privileges to the environment.

Turning this flow is optional; and only recommended if you are using UI flows in your tenant and interested in getting tenant wide overview.

### Admin \| Sync Template v2 (UI flow runs)

This flow runs on a schedule, and gets UI flow run history and session details.
Turning this flow is optional; and only recommended if you are using UI flows in your tenant and interested in getting tenant wide overview.

## Apps

<!--### DLP Editor

Canvas app that reads and updates data loss prevention (DLP) policies while showing a list of apps that are affected by the policy configurations.

Use this app to:

- Make changes to DLP policies.
- See what impact each change will have.
- Mitigate the risk of DLP changes' breaking a flow or an app by contacting makers.

More information: [Introduction to data groups](https://docs.microsoft.com/power-platform/admin/introduction-to-data-groups)

**Permission**: Intended to be used only by admins: Power Platform Service Admin or Global Admin permission required. Share with your CoE admins.

![DLP Editor](media/coe51.png "DLP Editor")

### DLP Customizer

Canvas app you can use to add custom connectors to the Business Data Group of a DLP policy, or to enable HTTP connectors to a DLP policy. More information: [HTTP and custom connector support for DLP policies](https://docs.microsoft.com/business-applications-release-notes/october18/microsoft-flow/http-and-custom-connector-support-for-dlp-policies)

**Permission**: Intended to be used only by admins: Power Platform Service Admin or Global Admin permission required. Share with your CoE Admins.

![DLP Customizer](media/coe52.png)-->

### Set App Permissions

Canvas app that an admin can use to discover apps by app name, environment, or owner name, and change app permissions.

Use this app to:

- Set a new app owner
- Add new viewers and editors
- Remove app permissions
- Change app permissions from Editors to Viewers or Viewers to Editors

It will also let you find apps that have been orphaned by the owner having left your organization, and clean them up. 

More information: [Share a canvas app in Power Apps](https://docs.microsoft.com/powerapps/maker/canvas-apps/share-app)

**Permission**: This app is intended to be used only by admins: Power Platform Service Admin or Global Admin permission required. Share with your CoE admins.

![Set App Permissions](media/SetAppPerms.png "Set App Permissions")

### Set Flow Permissions

Similar to the Set App Permissions app, this canvas app lets an admin discover flows by flow name, environment, or owner name.

Use this app to:

- Add new viewers and editors
- Remove flow permissions

Ownership cannot be changed for flows.

The app will also let you find flows that have been orphaned by the owner having left your organization, and clean them up.

More information: [Create Team Flows](https://docs.microsoft.com/power-automate/create-team-flows)

**Permission**: This app is intended to be used only by admins: Power Platform Service Admin or Global Admin permission required. Share with your CoE admins.

![Set App Permissions](media/SetFlowPerms.png "Set Flow Permissions")

### Power Platform Admin View

A model-driven app that provides an interface used to browse items in Common Data Service custom entities. It provides access to views and forms for the custom entities in the solution.

Use this app to:

- Get a quick overview of resources in your tenant
- Learn about your makers, connectors, apps and flows
- Find out who apps are shared with
- Add additional information, such as notes and risk assessments, to your resources
- Complete [App Audits](example-processes.md)

![Power Platform Admin View model-driven app](media/coe-mda1.png "Power Platform Admin View model-driven app")

At a quick glance, this app also allows you to view who an app is shared with, what roles (edit or view) the users have and - for groups - what the group size is.

![Power Platform Admin View - View who an app is shared with](media/coe-mda2.png "Power Platform Admin View - View who an app is shared with")

## Power BI Report

Provides a holistic view with visualizations and insights of data in the Common Data Service entities: Environments, Power Apps Apps, Flows, Connectors, Connection References, Makers, and Audit Logs.

Follow the [setup instructions](setup-powerbi.md) to set up the Power BI dashboard. Learn how to use it in [Learn about the CoE dashboard](power-bi.md).

![CoE Power BI dashboard](media/coe1.png "CoE Power BI dashboard")
