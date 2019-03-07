---
title: "Security | MicrosoftDocs"
description: About security.
ms.custom: ""
ms.date: 09/27/2018
ms.reviewer: ""
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
ms.assetid: 83200632-a36b-4401-ba41-952e5b43f939
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Security

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

In this section of the paper we are going to look at how the PowerApps platform handles security from user authentication to authorization which allows users perform actions with data and services. Conceptually, security in the platform is there to ensure users can do the work they need to do with the least amount of friction, while still protecting the data and services. Security in the platform can be implemented as a simple security model with broad access all the way to highly complex security models where users have specific record and field level access. The following is a high-level look at how a security model is implemented in PowerApps.

- Users are authenticated by Azure Active Directory (AAD)
- Licensing is the first control-gate to allowing access to PowerApps components
- Ability to create applications and flows is controlled by security roles in the context of environments
- A user’s ability to see and use PowerApps is controlled by sharing the application with the user. Sharing of PowerApps canvas apps is done directly with the user or AAD group. Sharing of PowerApps model-drive apps is done via CDS security roles
- Environments act as security boundaries allowing different security needs to be implemented in each environment
- Flows and Canvas apps use connectors, the specific connections credentials and associated service entitlements determine permissions when apps use the connectors
- Environments with a Common Data Service for Apps (CDS) instance add support for more advanced security models that are specific to controlling access to data and services in that CDS instance.