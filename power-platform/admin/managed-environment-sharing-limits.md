---
title: Limit sharing 
description: Limit how broadly makers can share canvas apps, Microsoft 365 Copilot agents, and custom agents in your Managed Environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/21/2024
author: mikferland-msft 
ms.author: miferlan
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
contributors:
- arjunmayur
---
# Limit sharing 

<!-- https://go.microsoft.com/fwlink/?linkid=2194484 and 2211538 -->

In Managed Environments, admins can limit how broadly users can share canvas apps, custom agents, and Microsoft 365 Copilot agents. To configure these rules, select a Managed Environment from the environments list in the Power Platform admin center. Then, select **Edit Managed Environments** in the command bar. The sharing rules are located in the **Manage sharing** section.

:::image type="content" source="media/managed-environment-limit-sharing.png" alt-text="Screenshot of an Edit Environment Management settings screen, with Limit sharing highlighted.":::

## Sharing rules

| Canvas app sharing rules | Description |
| --- | --- |
| Don't set limits | Select to not limit sharing canvas apps. |
| Exclude sharing with security groups | Select if users aren't allowed to share canvas apps with any security groups or with everyone. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, you can control the maximum number of users with whom a canvas app can be shared. |

| Custom agent and Microsoft 365 Copilot agents sharing rules | Description |
| --- | --- |
| Let people grant Editor permissions when Microsoft 365 Copilot agents and custom agents are shared | **When selected:** Owners and editors can share with any individual as an editor.<br><br>**When not selected:** Owners and editors can't share with an individual as an editor. This control doesn't affect the ability of owners or editors to share with viewers.  |
| Let people grant Viewer permissions when Microsoft 365 Copilot agents and custom agents are shared | **When selected:** Owners and editors can share with any individual as a viewer and any security group.<br><br>**When not selected:** Owners and editors can't share with an individual as a viewer, nor can they share with a security group. This control doesn't prevent them from sharing their copilots with individuals as editors. |
| Only share with individuals (no security groups) | **When selected:** Owners and editors can only share with individuals as viewers. They can't share with a security group.<br><br>**When not selected:** Owners and editors can't share with individuals as viewers. They can't share with a security group.|
| Limit number of viewers who can access each Microsoft 365 Copilot agent and custom agent | If **Only share with individuals (no security groups)** is selected, you can control the maximum number of viewers with whom a Microsoft 365 Copilot agent and custom agent can be shared with. |

> [!IMPORTANT]
>
> - The ability to share Microsoft 365 Copilot agents and custom agents is a preview feature.
> - Preview features aren't meant for production use and might have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

To learn more about editor and viewer permissions on Microsoft 365 Copilot agents and custom agents, go to [Copilot Studio security and governance](/microsoft-copilot-studio/security-and-governance).

> [!NOTE]
> Sharing rules are enforced when users try to share an app or agent. This won't impact any existing users who already have access to the app or agent prior to the application of the sharing rules. However, if an app or agent is out of compliance after rules are set, only unsharing is allowed until the app or agent is compliant with the new rules.
> 
> After sharing rules are set in the Power Platform admin center, it may take up to an hour for them to start getting enforced.
>
> Sharing rules in Dataverse for Teams environments do not impact sharing to a Team when you select **Publish to Teams**. However, when a user attempts to share with individuals or groups in a Team other than the one bound to the environment, the sharing limits are enforced. 

If a user tries to share a canvas app that contradicts the sharing rules, the user is informed, as shown below.

:::image type="content" source="media/managed-environment-canvas-app-sharing-rule.png" alt-text="Screenshot of a message when canvas app doesn't respect sharing rule.":::

If a user tries to share a agent when sharing with viewers is turned off, the user is informed, as shown below.

:::image type="content" source="media/share-this-copilot-error.png" alt-text="Screenshot of a message when copilot doesn't respect sharing rule.":::

## Use PowerShell to set sharing limits

You can also use PowerShell to set and remove sharing limits.

### Set sharing limits

Here's a PowerShell script that excludes sharing a canvas app with security groups and excludes sharing a canvas app with more than 20 individuals within a Managed Environment.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'limitSharingMode' -Value "excludeSharingToSecurityGroups" -Force
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'maxLimitUserSharing' -Value "20" -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```

Here's a PowerShell script that prevents copilots from being shared with security groups and limits the number of viewers that can access a copilot to 20 within a Managed Environment.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'bot-limitSharingMode' -Value "ExcludeSharingToSecurityGroups" -Force
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'bot-maxLimitUserSharing' -Value "20" -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```

Here's a PowerShell script that turns off the ability to share your copilots with editors.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'bot-authoringSharindgDisabled -Value True -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```
### Remove sharing limits

Here's a PowerShell scripts that removes the canvas app sharing limits that were configured in the script above.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'limitSharingMode' -Value "noLimit" -Force
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'maxLimitUserSharing' -Value "-1" -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```

## Surface your organization’s governance error content 
If you specify governance error message content to appear in error messages, it will be included in the error message displayed to users. See [PowerShell governance error message content commands](powerapps-powershell.md#governance-error-message-content-commands).

### Related content
[Managed Environments overview](managed-environment-overview.md) <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md) <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md) 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
