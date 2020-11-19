---
title: "Manage users | MicrosoftDocs"
description: "Provides information aboout the multiple layers of security make up the security model of Microsoft Power Platform"
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
# Manage users

What sets Microsoft Power Platform apart from other low-code options that are used in your organization already (through Excel or Access) or other Shadow IT, point-solution software as a service (SaaS) providers is that everything is governed and authenticated through Azure Active Directory (Azure AD). You need to sign in with your work or school Azure AD account in order to use this service. This means that as an admin, you have full visibility of everything your makers and users do—it's governable, automatable, auditable, and manageable by default.

Conceptually, security in the platform is there to ensure users can do the work they need with the least amount of friction, while still protecting the data and services.

The following is a high-level look at how the multiple layers of security make up the security model of Microsoft Power Platform:

- Users are authenticated by Azure AD, and use can be restricted using conditional access policies.

- Licensing is the first control-gate to allowing access to Power Apps components.

- Ability to create apps and flows is controlled by security roles in the context of environments.

- A user’s ability to see and use Power Apps resources is controlled by sharing the application with the user. Sharing of Power Apps canvas apps is done directly with the user or Azure AD group. Sharing of Power Apps model-driven apps is done via assigning the user the appropriate Microsoft Dataverse security role.

- Environments act as security boundaries allowing different security needs to be implemented in each environment.

- Flows and apps use connectors. The specific connections credentials and associated service entitlements determine permissions when apps use the connectors.

- Environments with a Dataverse instance add support for more advanced security models that are specific to controlling access to data and services in that Dataverse instance.

- Connector use can be further restricted with data loss prevention (DLP) policies. Cross-tenant inbound and outbound restrictions can also be applied to the connectors.

It’s important to note that when accessing data sources via connectors, all the underlying security that the data source offers is in addition to the layers of security described above. Power Apps and Power Automate don't provide users with access to the connector data source they don’t already have. Users should only have access to data that they really require access to. Few connectors allow implicit sharing for data services like SQL Server, and Azure Blob storage can be blocked in default and other environments with the DLP policy feature to block connectors.

