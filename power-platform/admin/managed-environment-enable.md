---
title: Enable Managed Environments (preview)
description: Learn how to enable Managed Environments for Power Platform in the admin center or PowerShell.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/11/2022
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
# Enable Managed Environments (preview)

<!-- https://go.microsoft.com/fwlink/?linkid=2194805 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Admins can enable, disable, and edit Managed Environments in the Power Platform admin center. Admins can also use PowerShell to disable Managed Environments.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Permissions

- You must be an admin to enable or edit Managed Environments. That is, you must have the global admin, Power Platform service admin, or Dynamics 365 admin Azure Active Directory role.
- Any user with permission to see environment details can view the Managed Environments property for an environment.  
- Users with the Delegated Admin role or the Environment Admin security role aren't allowed to change the Managed Environments property in an environment.

> [!IMPORTANT]
> Copy and restore environment lifecycle operations require the Managed Environments property to be the same in the source and destination before the operation can start.

## Enable or edit Managed Environments in the admin center

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), in the left panel, select **Environments**.

1. Select the check mark to the left of an environment.

1. On the command bar, select **Enable Managed Environments**. If the environment is already managed, select **Edit Managed Environments**.

1. Configure the settings, and then select **Enable**.

:::image type="content" source="media/managed-environment-enable.png" alt-text="Screenshot of the Enable Environment Management screen.":::

| Setting | Description |
| --- | --- |
| **[Weekly digest](managed-environment-weekly-digests.md)** | |
| Include this environment | Select to include the environment in the weekly digest. |
| Email recipients | Enter email addresses to receive weekly analytics about your top apps and flows, your most impactful makers, and inactive resources you can safely clean up. |
| **[Limit sharing](managed-environment-sharing-limits.md)** | |
| Exclude sharing with security groups | Select if makers aren't allowed to share canvas apps with any security groups. Admins may share with a limit on who an app can be shared with. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, select to limit the number of people makers can share canvas apps with. |
| **[Data policies](managed-environment-data-policies.md)** | |
| See active data policies for this environment | View the policies that define the consumer connectors that specific data can be shared with. |

## Disable Managed Environments using PowerShell

Admins can use PowerShell to remove the Managed Environments property on an environment. The environment must not be using any Managed Environments capabilities.

Here's an example PowerShell script that calls the API to set the Managed Environments property:

```powershell
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"
 }
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentID> -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration
```

## Known limitations
1. The Managed Environments state cannot be activated on Developer environments. 
2. In the Power Platform admin center, Environment Admins are not allowed to activate managed environments. Environment Admins are able to see the 'Enable Managed Environment' action in the environment details page.

### See also
[Managed Environments overview](managed-environment-overview.md)  
[Weekly digests](managed-environment-weekly-digests.md)  
[Sharing limits](managed-environment-sharing-limits.md)  
[Data policies](managed-environment-data-policies.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
