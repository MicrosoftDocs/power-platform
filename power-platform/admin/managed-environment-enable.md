---
title: Enable Managed Environments
description: Learn how to enable Managed Environments for Power Platform in the admin center or PowerShell.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/12/2022
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
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
# Enable Managed Environments

<!-- https://go.microsoft.com/fwlink/?linkid=2194805 and 2211456 -->

Admins can enable, disable, and edit Managed Environments in the Power Platform admin center. Admins can also use PowerShell to disable Managed Environments.

## Permissions

- You must be an admin to enable or edit Managed Environments. That is, you must have the global admin, Power Platform service admin, or Dynamics 365 admin Azure Active Directory role.
- Any user with permission to see environment details can view the Managed Environments property for an environment.  
- Users with the Delegated Admin role or the Environment Admin security role aren't allowed to change the Managed Environments property in an environment.

> [!IMPORTANT]
> Copy and restore environment lifecycle operations require the Managed Environments property to be the same in the source and destination before the operation can start.

## Enable or edit Managed Environments in the admin center

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), in the left panel, select **Environments**.

![ME1](https://user-images.githubusercontent.com/40268197/195863412-33bb1fd0-d3f7-4f38-8021-43a40842c5c7.PNG)

2. Select the check mark to the left of an environment.

![ME2](https://user-images.githubusercontent.com/40268197/195863414-974610ed-f3d4-4a5a-a9f4-5727306569bb.png)

3. On the command bar, select **Enable Managed Environments**. If the environment is already managed, select **Edit Managed Environments**. 

![ME3](https://user-images.githubusercontent.com/40268197/195863416-5aa74f90-ddd2-4706-99ce-8102f701cd83.png)

4. Configure the settings, and then select **Enable** or **Save**.

![ME4](https://user-images.githubusercontent.com/40268197/195863879-3d02fedc-27ed-4b0c-86c9-ad0b452e45ce.png)

Use the following settings to increase visibility and control for the selected environment.

| Setting | Description |
| --- | --- |
| **[Limit sharing](managed-environment-sharing-limits.md)** | Help reduce risk by limiting how widely canvas apps can be shared. |
| Don't set limits | Select to not limit sharing canvas apps. |
| Exclude sharing with security groups | Select if makers aren't allowed to share canvas apps with any security groups. Admins may share with a limit on who an app can be shared with. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, select to limit the number of people makers can share canvas apps with. |
| **[Usage insights](managed-environment-usage-insights.md)** | Select to include insights for this environment in the weekly email digest. |
| **[Data policies](managed-environment-data-policies.md)** | Help safeguard your organizational data by limiting the connectors available.|
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

- The Managed Environments state cannot be activated on developer environments. 


### See also
[Managed Environments overview](managed-environment-overview.md)  <br /> 
[Usage insights](managed-environment-usage-insights.md)  <br />
[Sharing limits](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
