---
title: "Security in Microsoft Dataverse | MicrosoftDocs"
description: Provides information about the security concepts in Microsoft Dataverse.
ms.date: 10/18/2023

ms.topic: overview
ms.custom: "admin-security"
ms.collection: get-started
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
- sripod
- paulliew
---
# Security in Microsoft Dataverse

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

This section provides information on how [**Microsoft Dataverse**](/powerapps/maker/common-data-service/data-platform-intro), the underlying data platform for Power Platform components, handles security from user authentication to authorization that allows users to perform actions with data and services. Conceptually, security in Dataverse is there to ensure users can do the work they need to do with the least amount of friction, while still protecting the data and services. Security in Dataverse can be implemented as a simple security model with broad access all the way to highly complex security models where users have specific record and field level access. 

The following is a high-level overview of how security model is implemented in Dataverse.

- Users are authenticated by Microsoft Entra ID.
- Licensing is the first control-gate to allowing access to Power Apps components.
- Ability to create applications and flows is controlled by security roles in the context of environments.
- A user's ability to see and use apps is controlled by sharing the application with the user. Sharing of [canvas apps](/powerapps/maker/canvas-apps/getting-started) is done directly with a user or Microsoft Entra group but is still subject to Dataverse security roles. Sharing of [model-driven apps](/powerapps/maker/model-driven-apps/model-driven-app-overview) is done via Dataverse security roles.
- Environments act as security boundaries allowing different security needs to be implemented in each environment.
- Flows and Canvas apps use connectors, the specific connections credentials and associated service entitlements determine permissions when apps use the connectors.
- Environments with Dataverse add support for more advanced security models that are specific to controlling access to data and services in the environment with a Dataverse database.
- To manage security settings, you must be a system administrator in Dataverse. For more information, see [Manage Microsoft Dataverse settings](admin-settings.md).

> [!TIP]
> To learn about how to help secure and govern Microsoft Power Platform apps like Power Automate, check out [Introduction to Power Automate security and governance](/training/modules/security-governance-intro/).

### Related content
[Security overview](security/security-overview.md)<br/>
[Data storage in Power Platform](security/data-storage.md)<br/>
[What is Dataverse?](/powerapps/maker/common-data-service/data-platform-intro)<br/>
[Security concepts in Dataverse](wp-security-cds.md)<br />
[How access to a record is determined](how-record-access-determined.md)<br />
[Data loss prevention policies](wp-data-loss-prevention.md)<br />
[Block access by location with Microsoft Entra Conditional Access](restrict-access-online-trusted-ip-rules.md)<br />
[Cross-tenant inbound and outbound restrictions](cross-tenant-restrictions.md)<br />
[Control user access to environments: security groups and licenses](control-user-access.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
