---
title: Enable Managed Environments
description: Learn how to enable Managed Environments for Power Platform in the admin center or PowerShell.
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/01/2025
author: mikferland-msft
ms.author: miferlan
ms.contributor: ellenwehrle
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Enable Managed Environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- https://go.microsoft.com/fwlink/?linkid=2194805 and 2211456 -->

Admins enable, disable, and edit Managed Environments in the Power Platform admin center. Admins can also use PowerShell to disable Managed Environments. This article explains the permissions you need to manage environments and the steps to get started in the Microsoft Power Platform admin center or with PowerShell.

## Permissions

To enable or edit Managed Environments, you need the Power Platform Administrator or Dynamics 365 Administrator role in Microsoft Entra ID. You can learn more about these roles in [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

- Any user with permission to view environment details can see the Managed Environments property for an environment.
- Users with the Delegated Admin role or the Environment Admin security role can't change the Managed Environments property in an environment.

> [!IMPORTANT]
> The Managed Environments property must be the same in the source and destination before you can start copy and restore environment lifecycle operations.

## Enable or edit Managed Environments in the admin center

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage** and then in the manage pane, select **Environments**.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.

3. Select the check mark to the left of an environment.

4. On the command bar, select **Enable Managed Environments**. If the environment is already managed, select **Edit Managed Environments**. 

5. Configure the settings, and then select **Enable** or **Save**.

:::image type="content" source="media/managed-environment-enable/managed-environments-enable.png" alt-text="Screenshot of the Enable Managed Environments panel you can access in the Power Platform admin center.":::

Use the following settings to increase visibility and control for the selected environment.

| Setting | Description |
| --- | --- |
| **[Limit sharing](managed-environment-sharing-limits.md)** | Help reduce risk by limiting how widely canvas apps can be shared. |
| Don't set limits | Select to not limit sharing of canvas apps. |
| Exclude sharing with security groups | Select if makers aren't allowed to share canvas apps with any security groups. Admins may share with a limit on who an app can be shared with. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, select to limit the number of people that makers can share canvas apps with. |
| Enable AI-generated app descriptions (preview) | If descriptions of apps are blank, AI is used to generate them. This happens when an app is published and can help people understand what the purpose of an app is. |
| **[Usage insights](managed-environment-usage-insights.md)** | Select to include insights for this environment in the weekly email digest. |
| **[Data policies](managed-environment-data-policies.md)** | Help safeguard your organizational data by limiting the connectors available.|
| See active data policies for this environment | View the policies that define the consumer connectors that specific data can be shared with. |

## Enable Managed Environments using PowerShell

Admins can also use PowerShell to enable Managed Environments. The following PowerShell script enables it for a single environment.

```powershell
$GovernanceConfiguration = [pscustomobject] @{ 
    protectionLevel = "Standard" 
    settings = [pscustomobject]@{ 
        extendedSettings = @{} 
    }
} 

Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentID> -UpdatedGovernanceConfiguration $GovernanceConfiguration 
```

## Copy Managed Environment settings using PowerShell

Admins can use PowerShell to copy settings from one Managed Environment to another environment. If the target environment isn't a Managed Environment, copying settings also enables it as a Managed Environment.

```powershell
#Get settings from the source Managed Environment
$sourceEnvironment = Get-AdminPowerAppEnvironment -EnvironmentName <SourceEnvironmentId>

# Copy the settings from the source Managed Environment above to the target environment
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <TargetEnvironmentId> -UpdatedGovernanceConfiguration $sourceEnvironment.Internal.properties.governanceConfiguration
```

## Disable Managed Environments using PowerShell

Admins can use PowerShell to remove the Managed Environments property from an environment. Before you disable Managed Environments, make sure none of the Managed Environments capabilities are in use.

Here's an example PowerShell script that calls the API to set the Managed Environments property:

```powershell
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"
}
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentID> -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration
```

### See also

- [Managed Environments overview](managed-environment-overview.md)
- [Usage insights](managed-environment-usage-insights.md)
- [Limit sharing](managed-environment-sharing-limits.md)
- [Data policies](managed-environment-data-policies.md)
- [Licensing](managed-environment-licensing.md)
- [View license consumption (preview)](view-license-consumption-issues.md)
- [Tenant settings](tenant-settings.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
