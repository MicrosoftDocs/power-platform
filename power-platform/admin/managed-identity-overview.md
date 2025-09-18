---
title: Power Platform managed identity overview
description: Learn about managed identity for Power Platform and Dynamics 365 apps.
author: abhijananddv
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/18/2025
ms.subservice: admin
ms.author: abhijanand
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Power Platform managed identity overview

Power Platform managed identity allows enterprises to securely connect with Azure resources that support Azure managed identity from Dataverse plug-ins without the need for managing the credentials. 

Power Platform managed identity relies on the [workload identities](/entra/workload-id/workload-identities-overview) based on [federated identity credentials](/graph/api/resources/federatedidentitycredentials-overview?view=graph-rest-1.0&preserve-view=true) (FIC). Power Platform managed identity creates [user-assigned managed identities](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp) (UAMI) or application registration for your application in the Microsoft Entra ID tenant of the enterprises. FIC is configured on UAMI or application registration to support managed identity for Dataverse plug-ins.


## Key benefits
Power Platform managed identity provides the following key benefits:

- Simplifies authentication and reduces the need for credentials management. 
- Improves security by reducing the attack surface. 
- Allows seamless authentication to other Azure services.

## Supported scenarios
Enterprises can securely connect to Azure resources that support managed identity from their IP/ISV [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins). For example, enterprises can use managed identity to connect to their Azure Key Vault from Dataverse plug-ins to retrieve sensitive information, like keys and secrets, without needing to manage credentials.

## Supported services
The following table lists the services that support Power Platform managed identity.

| Area      | Power Platform services | Availability|
|-----------|-------------------------|-------------------------|
| Dataverse |<ul><li>[Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins)</li><li>[Dependent, assembly plug-ins](/power-apps/developer/data-platform/build-and-package#dependent-assemblies)</li></ul>| GA |

## Next steps
[Set up Power Platform managed identity](set-up-managed-identity.md)



