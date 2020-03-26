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

![A screenshot of a cell phone Description automatically generated](media/3363ebde703fa8e4f3c3b31ac505c266.png)

### DLP Customizer

Canvas app that allows you to add Custom Connectors to the Business Data Group
of a DLP Policy, or to enable HTTP Connectors to a DLP Policy. For more
information read [http and custom connector support for dlp
policies](https://docs.microsoft.com/en-us/business-applications-release-notes/october18/microsoft-flow/http-and-custom-connector-support-for-dlp-policies)

**Permission**: Intended to be used only by admins, Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

### Set New App Owner

Canvas app that an admin can use to discover apps by app or maker name, and set
a new *app owner* or add new viewers and editors.

For more information on application permissions see [canvas apps - share
app](https://docs.microsoft.com/en-us/powerapps/maker/canvas-apps/share-app).

**Permission**: Intended to be used only by admins, Power Platform Service Admin
or Global Admin permission required. Share with your CoE Admins.

![A screenshot of a cell phone Description automatically generated](media/9f6ed8e6c6ec8d3bd7513a1a04d3698c.png)

## Power BI Report

Provides a wholistic view with visualizations and insights of data in the CDS
entities: Environments, Power Apps Apps, Flows, Connectors, Connection
References, Makers and Audit Logs.

Note that the roll up fields for the App and Flow counts in Environment may take
up to 12 hours to populate.

![](media/6f6cd8d695705b33336cb36f92224e97.png)

## Audit Log Custom Connector

The Audit Logs are usage logs and log in events. They are normally accessible
from the Security and Compliance Center. We collect them here for the Power BI
to show usage of applications across the tenant. For more info on these logs
see:

- basic auth
- oAuth (supports MFA)

(need to add details here)