---
title: Power Platform managed identity overview (preview)
description: Learn about managed identity for Power Platform and Dynamics 365 apps.
author: ritesp
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/30/2024
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Power Platform managed identity overview (preview)

[This article is prerelease documentation and is subject to change.]

Power Platform managed identity allows enterprises to securely connect with Azure resources that support Azure managed identity from Dataverse plug-ins without the need for managing the credentials. 

Power Platform managed identity relies on the [workload identities](/entra/workload-id/workload-identities-overview) based on [federated identity credentials](/graph/api/resources/federatedidentitycredentials-overview?view=graph-rest-1.0&preserve-view=true) (FIC). Power Platform managed identity creates [user-assigned managed identities](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp) (UAMI) or application registration for your application in the Microsoft Entra ID tenant of the enterprises. FIC is configured on UAMI or application registration to enable managed identity support for Dataverse plug-ins.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are subject to supplemental terms of use, and are available before an official release so that customers can get early access and provide feedback.

## Key benefits
Power Platform managed identity provides the following, key benefits:

- Simplifies authentication and reduces the need for credentials management. 
- Improves security by reducing the attack surface. 
- Enables seamless authentication to other Azure services.

## Supported scenarios
Enterprises can securely connect to Azure resources that support managed identity from their IP/ISV [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins). For example, enterprises can use managed identity to connect to their Azure Key Vault from Dataverse plug-ins to retrieve sensitive information, like keys and secrets, without needing to manage credentials.

## Supported services
The following table lists the services that support Power Platform managed identity.

| Area      | Power Platform services | Availability|
|-----------|-------------------------|-------------------------|
| Dataverse | [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) | Preview |

## Known limitations
Managed identity support for [dependent, assembly plug-ins](/power-apps/developer/data-platform/build-and-package#dependent-assemblies) is not supported.

## Next steps
[Set up Power Platform managed identity](set-up-managed-identity.md)



