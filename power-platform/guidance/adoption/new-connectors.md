---
title: "Monitor new connectors - Microsoft Power Platform | MicrosoftDocs"
description: "Evaluate the impact of a new connector and choose to allow business data to be shared with the new service by moving the connector to the business data group in your DLP policies."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Monitor new connectors

Our large ecosystem of software as a service (SaaS) connectors enables you to connect apps, data, and devices in the cloud. Examples of popular connectors include SharePoint, Office 365, Microsoft Teams or Azure services.

More information: [Connector reference overview](https://docs.microsoft.com/connectors/connector-reference/)

New connectors—both Microsoft first party and third party—are added constantly, and as an administrator you should be aware of new connectors and ensure they are classified accordingly in your [Data loss prevention (DLP) policies](https://docs.microsoft.com/power-platform/admin/wp-data-loss-prevention).

Templates in Power Automate are available to help you get notifications when new connectors are added:

- [List new Microsoft flow connectors template](https://flow.microsoft.com/galleries/public/templates/5a6ef26db3b749ed88b7afb377d11ecf/list-new-microsoft-flow-connectors/)
- [Get a list of new Power Apps, flows, and connectors template](https://flow.microsoft.com/galleries/public/templates/0b2ffb0174724ad6b4681728c0f53062/get-list-of-new-powerapps-flows-and-connectors/)

Configure those flows in your environment to receive regular notifications about new connectors.

Evaluate the impact of a new connector and choose to allow business data to be shared with the new service by moving the connector to the business data group in your DLP policies. Depending on the [default data group](https://docs.microsoft.com/power-platform/admin/wp-data-loss-prevention#default-data-group-for-new-connectors) for new connectors set on each DLP policy, in addition to your Environment and DLP strategy in your tenant, you'll have to update multiple policies and consider the impact of use cases and makers in each environment.
