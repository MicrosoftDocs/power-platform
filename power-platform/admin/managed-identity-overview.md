---
title: Power Platform Managed Identity
description: Learn about Managed Identity for Power Platform and Dynamics 365 apps.
author: ritesp
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/18/2024
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Power Platform Managed Identity overview

Power Platform managed identity will allow Enterprises to securely connect with Azure resources supporting Azure Managed Identity from the Power Platform Dataverse plug-ins without the need of managing the credentials and renewing it. 
Power Platform managed identity relies on the [workload identities](https://learn.microsoft.com/en-us/entra/workload-id/workload-identities-overview) based on 
[Federated Identity Credentials](https://learn.microsoft.com/en-us/graph/api/resources/federatedidentitycredentials-overview?view=graph-rest-1.0) (FIC).
Power Platform Managed Identity creates [user assigned managed identity](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp) (UAMI) or application registration for your application in Microsoft Entra ID tenant of the Enterprises. 
FIC is configured on UAMI or application registration to enable managed identity support for Dataverse plug-ins.

## Key benefits
Power Platform Managed Identity provides following key benefits
- Simplifies authentication and reduces the need for credentials management. 
- Improves security by reducing the attack surface. 
- Enables seamless authentication to other Azure services.

## Supported Scenarios
Enterprises will be able to securely connect to the Azure resources supporting Managed Identity from their 1P/ISV [Dataverse Plug-ins](/power-apps/developer/data-platform/plug-ins) 
and [Dependent assembly plug-ins](/power-apps/developer/data-platform/build-and-package#dependent-assemblies). Example, enterprises will be able to use managed identity to connect to their azure key vault from Dataverse plug-ins to retrieve sensitive information like keys, secrets etc. without needing to manage credentials.

## Supported services
The following table lists the services that support Power Platform Managed Identity.

| Area      | Power Platform services | Availability|
|-----------|-------------------------|-------------------------|
| Dataverse | <ul><li>[Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins)</li><li>[Dependent assembly plug-ins](/power-apps/developer/data-platform/build-and-package#dependent-assemblies)</li></ul> | Preview |

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

## Licensing requirements
Licensing requirements for Power Platform Managed Identity will be announced near to General Availability.



