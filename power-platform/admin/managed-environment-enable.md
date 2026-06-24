---
title: Enable managed environments
description: Learn how to enable managed environments for Power Platform in the admin center or PowerShell.
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/24/2026
author: mikferland-msft
ms.author: miferlan
ms.contributors: 
  - ellenwehrle
  - syalandur
contributors:
  - sidhartg
  - akadrno
  - miferland-msft
  - ellenwehrle
  - syalandur24
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Enable managed environments

Admins enable, disable, and edit managed environments in the Power Platform admin center. Admins can also use PowerShell to disable managed environments. This article explains the permissions you need to manage environments and the steps to get started in the Microsoft Power Platform admin center or with PowerShell.

## Permissions

To enable or edit managed environments, you need the Power Platform Administrator or Dynamics 365 Administrator role in Microsoft Entra ID. You can learn more about these roles in [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

- Any user with permission to view environment details can see the managed environments property for an environment.
- Users with the Delegated Admin role or the Environment Admin security role can't change the managed environments property in an environment.

> [!IMPORTANT]
> - The managed environments property must be the same in the source and destination before you can start to copy and restore environment lifecycle operations.
> - Dataverse is required to use managed environments for production, sandbox, or trial environment types. Developer environments don't require Dataverse to enable managed environments.

## Enable or edit managed environments in the admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. In the navigation pane, select **Manage**, and then in the **Manage** pane, select **Environments**.

1. Select the ellipsis next to an environment, and then in the menu, select **Enable Managed Environments**. If the environment is already managed, select **Edit Managed Environments**.

1. Configure the settings, and then select **Enable** or **Save**.

## Enable managed environments using PowerShell

Admins can also use PowerShell to enable managed environments. The following PowerShell script enables it for a single environment.

```powershell
$GovernanceConfiguration = [pscustomobject] @{ 
    protectionLevel = "Standard" 
    settings = [pscustomobject]@{ 
        extendedSettings = @{} 
    }
} 

Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentID> -UpdatedGovernanceConfiguration $GovernanceConfiguration 
```

## Copy managed environment settings using PowerShell

Admins can use PowerShell to copy settings from one managed environment to another environment. If the target environment isn't a managed environment, copying settings also enables it as a managed environment.

```powershell
#Get settings from the source managed environment
$sourceEnvironment = Get-AdminPowerAppEnvironment -EnvironmentName <SourceEnvironmentId>

# Copy the settings from the source managed environment above to the target environment
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <TargetEnvironmentId> -UpdatedGovernanceConfiguration $sourceEnvironment.Internal.properties.governanceConfiguration
```

## Disable managed environments using PowerShell

Admins can use PowerShell to remove the managed environments property from an environment. Before you disable managed environments, make sure none of the managed environments capabilities are in use.

Here's an example PowerShell script that calls the API to set the managed environments property:

```powershell
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"
}
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentID> -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration
```

### Related content

- [Managed environments overview](managed-environment-overview.md)
- [Usage insights](managed-environment-usage-insights.md)
- [Limit sharing](managed-environment-sharing-limits.md)
- [Data policies](managed-environment-data-policies.md)
- [Licensing](managed-environment-licensing.md)
- [View license consumption (preview)](view-license-consumption-issues.md)
- [Tenant settings](tenant-settings.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
