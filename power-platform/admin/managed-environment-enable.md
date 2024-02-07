---
title: Enable Managed Environments
description: Learn how to enable Managed Environments for Power Platform in the admin center or PowerShell.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/14/2023
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Enable Managed Environments

<!-- https://go.microsoft.com/fwlink/?linkid=2194805 and 2211456 -->

Admins can enable, disable, and edit Managed Environments in the Power Platform admin center. Admins can also use PowerShell to disable Managed Environments.

## Permissions

- You must be an admin to enable or edit Managed Environments. That is, you must have the role of global admin, Power Platform service admin, or Dynamics 365 admin Microsoft Entra ID.
- Any user with permission to see environment details can view the Managed Environments property for an environment.  
- Users with the Delegated Admin role or the Environment Admin security role aren't allowed to change the Managed Environments property in an environment.

> [!IMPORTANT]
> Copy and restore environment lifecycle operations require the Managed Environments property to be the same in the source and destination before the operation can start.

## Enable or edit Managed Environments in the admin center

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), in the left panel, select **Environments**.

2. Select the check mark to the left of an environment.

3. On the command bar, select **Enable Managed Environments**. If the environment is already managed, select **Edit Managed Environments**. 

4. Configure the settings, and then select **Enable** or **Save**.

:::image type="content" source="media/managed-environment-enable.png" alt-text="Screenshot of the Enable Managed Environments screen.":::

Use the following settings to increase visibility and control for the selected environment.

| Setting | Description |
| --- | --- |
| **[Limit sharing](managed-environment-sharing-limits.md)** | Help reduce risk by limiting how widely canvas apps can be shared. |
| Don't set limits | Select to not limit sharing of canvas apps. |
| Exclude sharing with security groups | Select if makers aren't allowed to share canvas apps with any security groups. Admins may share with a limit on who an app can be shared with. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, select to limit the number of people that makers can share canvas apps with. |
| **[Usage insights](managed-environment-usage-insights.md)** | Select to include insights for this environment in the weekly email digest. |
| **[Data policies](managed-environment-data-policies.md)** | Help safeguard your organizational data by limiting the connectors available.|
| See active data policies for this environment | View the policies that define the consumer connectors that specific data can be shared with. |

## Enable Managed Environments using PowerShell

Admins can also use PowerShell to enable Managed Environments. Below is a PowerShell script that enables it for a single environment.

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

Admins can use PowerShell to copy settings from one Managed Environment to another environment. If the target environment wasn't a Managed Environment, copy settings will also enable it as a Managed Environment. 

```powershell
#Get settings from the source Managed Environment
$sourceEnvironment = Get-AdminPowerAppEnvironment -EnvironmentName <SourceEnvironmentId>

# Copy the settings from the source Managed Environment above to the target environment
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <TargetEnvironmentId> -UpdatedGovernanceConfiguration $sourceEnvironment.Internal.properties.governanceConfiguration
```

## Disable Managed Environments using PowerShell

Admins can use PowerShell to remove the Managed Environments property on an environment. Before disabling Managed Environments, the administrator must ensure that none of the Managed Environments capabilities are in use.

Here's an example PowerShell script that calls the API to set the Managed Environments property:

```powershell
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"
}
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentID> -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration
```

### See also
[Managed Environments overview](managed-environment-overview.md)  <br /> 
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]