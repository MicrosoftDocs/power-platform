---
title: "Enable environment management | MicrosoftDocs"
description: Learn how to enable environment management.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/27/2022
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
  - alaug 
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enable environment management

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Intro paragraph.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

Admins can enable environment management using the [Power Platform admin center](managed-environment-enable.md) or by calling the API from PowerShell. 

UX workflow here

Admins can remove the Managed Environment property on an environment using the available API if respective environment is not using any of the capabilities available. The following is an example on how to call the API to set the Managed Environment property using PowerShell: 

```powershell
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"
 }
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentID> -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration
```

## Permissions

- Users with either the global admin, Power Platform service admin or Dynamics 365 admin AAD roles are allowed to enable environment management. 
- Any user with permission to see environment details can retrieve the Managed Environment property for the environment.  
- Users with the delegated admin role are not allowed to change the Managed Environment property on an environment. 
- Users with the Environment Admin security role are not allowed to change the Managed Environment property on an environment.  

> [!IMPORTANT]
> Copy and restore environment lifecycle operations require Managed Environment property to be the same between source and destination before the respective environment lifecycle operation can start. 

### See also  



[!INCLUDE[footer-include](../includes/footer-banner.md)]


