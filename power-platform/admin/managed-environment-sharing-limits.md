---
title: Limit sharing 
description: Limit how broadly makers can share canvas apps and solution-aware cloud flows in your Managed Environments.
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/23/2025
author: mikferland-msft 
ms.author: miferlan
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin
contributors:
  - arjunmayur
  - yingchin
  - sericks
ms.custom:
  - admin-security
  - NewPPAC
  - sfi-image-nochange
---
# Limit sharing

<!-- https://go.microsoft.com/fwlink/?linkid=2194484 and 2211538 -->

In Managed Environments, admins can limit how broadly users can share canvas apps, flows, and agents. 

To configure these rules:

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select a managed environment.
1. In the command bar, **Edit Managed Environments**.
1. The sharing rules are located in the **Manage sharing** section.
1. Choose the desired settings, then select **Save** to apply the changes.
   
### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select a managed environment.
1. In the command bar, **Edit Managed Environments**.
1. The sharing rules are located in the **Manage sharing** section.
1. Choose the desired settings, then select **Save** to apply the changes.
---

:::image type="content" source="media/managed-environment-limit-sharing.png" alt-text="Screenshot of an Edit Environment Management settings screen, with Limit sharing highlighted.":::

## Canvas app sharing rules

| Canvas app sharing rule | Description |
| --- | --- |
| Don't set limits | Select to not limit sharing canvas apps. |
| Exclude sharing with security groups | Select if users aren't allowed to share canvas apps with any security groups or with everyone. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, you can control the maximum number of users with whom a canvas app can be shared. |

## Solution-aware cloud flow sharing rules

| Solution-aware cloud flow sharing rules | Description |
| --- | --- |
| Let people share solution-aware cloud flows | **When selected:** Users can share solution-aware cloud flows and agent flows with any number of individuals or security groups. <br><br> **When not selected:** Users can't share their cloud flows or agent flows with any individual or security group.|

## Agent sharing rules 

| Agent sharing rule | Description |
| --- | --- |
| Let people grant **Editor** permissions when agents are shared | **When selected:** Owners and editors can share with any individual as an editor.<br><br>**When not selected:** Owners and editors can't share with an individual as an editor. This control doesn't affect the ability of owners or editors to share with viewers.  |
| Let people grant **Viewer** permissions when agents are shared | **When selected:** Owners and editors can share with any individual as a viewer and any security group.<br><br>**When not selected:** Owners and editors can't share with an individual as a viewer, nor can they share with a security group. This control doesn't prevent them from sharing their copilots with individuals as editors. |
| Only share with individuals (no security groups) | If this setting is selected, owners and editors can only share with individuals as viewers. They can't share with a security group. This control doesn't affect an owner's or editor's ability to share with individuals as editors. |
| Limit number of viewers who can access each agent | If **Only share with individuals (no security groups)** is selected, you can control the maximum number of viewers with whom an agent can be shared with. |

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/production-ready-preview-powerplatform.md)]

To learn more about **Editor** and **Viewer** permissions on agents, go to [Copilot Studio security and governance](/microsoft-copilot-studio/security-and-governance).

> [!NOTE]
> Sharing rules are enforced when users try to share an app, flow, or agent. This restriction doesn't impact any existing users who already have access to the app, flow, or agent before the application of the sharing rules. However, if an app, flow, or agent is out of compliance after rules are set, only unsharing is allowed until the app, flow, or agent is compliant with the new rules.
> 
> After sharing rules are set in the Power Platform admin center, it may take up to an hour for them to start getting enforced.
>
> Sharing rules in Dataverse for Teams environments don't impact sharing to a Team when you select **Publish to Teams**. However, when a user attempts to share with individuals or groups in a Team other than the one bound to the environment, the sharing limits are enforced. 

If a user tries to share a canvas app, solution-aware cloud flow, or agent that contradicts the sharing rules, they're informed as shown.

:::image type="content" source="media/limit-sharing-cloud-flows.png" alt-text="If a user tries to share a canvas app, solution-aware cloud flow, or agent that contradicts the sharing rules, an error message is displayed.":::

## Use PowerShell to set sharing limits

You can also use PowerShell to set and remove sharing limits.

### Set sharing limits

Here's a PowerShell script that prevents canvas apps from being shared with security groups and limits the number of individuals that the canvas app can be shared with to 20.

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

Here's a PowerShell script that turns off sharing for solution-aware cloud flows.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'solutionCloudFlows-limitSharingMode' -Value "disableSharing" -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```

Here's a PowerShell script that prevents agents from being shared with security groups and limits the number of viewers that can access an agent to 20.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'bot-limitSharingMode' -Value "ExcludeSharingToSecurityGroups" -Force
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'bot-maxLimitUserSharing' -Value "20" -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```

Here's a PowerShell script that turns off the ability to share your agents with individuals as Editors.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'bot-authoringSharingDisabled' -Value True -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```
Set 'bot-authoringSharingDisabled' to False to enable sharing with individuals as Editors. 

### Remove sharing limits

Here's a PowerShell script that removes the canvas app sharing limits.

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

To remove sharing limits for solution-aware cloud flows, run the following script.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'solutionCloudFlows-limitSharingMode' -Value "noLimit" -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```

To remove limits on sharing your agent with security groups or individuals as Viewers, run the following script.

```powershell
# Retrieve the environment
$environment = Get-AdminPowerAppEnvironment -EnvironmentName <EnvironmentId>

# Update the Managed Environment settings
$governanceConfiguration = $environment.Internal.properties.governanceConfiguration
$governanceConfiguration.settings.extendedSettings | Add-Member -MemberType NoteProperty -Name 'bot-limitSharingMode' -Value "noLimit" -Force

# Save the updated Managed Environment settings
Set-AdminPowerAppEnvironmentGovernanceConfiguration -EnvironmentName <EnvironmentId> -UpdatedGovernanceConfiguration $governanceConfiguration
```

## Surface your organization’s governance error content 
If you specify governance, error message content to appear in error messages, it's included in the error message displayed to users. Learn more in [PowerShell governance error message content commands](powerapps-powershell.md#governance-error-message-content-commands).

### Related content
[Managed Environments overview](managed-environment-overview.md) <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md) <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md) 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
