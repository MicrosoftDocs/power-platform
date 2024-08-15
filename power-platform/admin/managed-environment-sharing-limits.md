---
title: Limit sharing 
description: Limit how broadly makers can share canvas apps in your managed environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2023
author: mikferland-msft 
ms.author: miferlan
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Limit sharing 

<!-- https://go.microsoft.com/fwlink/?linkid=2194484 and 2211538 -->

In Managed Environments, admins can limit how broadly users can share canvas apps, custom copilots, and copilot extensions. To configure these rules, select a managed environment from the environments list in the Power Platform admin center. Then, select **Edit Managed Environments** in the command bar. The sharing rules are located in the **Limit sharing** section.

:::image type="content" source="media/managed-environment-limit-sharing.png" alt-text="Screenshot of an Edit Environment Management settings screen, with Limit sharing highlighted.":::

## Sharing rules

| Canvas App Sharing rules | System behavior when selected |
| --- | --- |
| Don't set limits | Select to not limit sharing canvas apps. |
| Exclude sharing with security groups | Select if users aren't allowed to share canvas apps with any security groups or with everyone. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, you can control the maximum number of users with whom a canvas app can be shared. |

| Custom Copilot and Copilot Extension Sharing rules | System behavior when selected |
| --- | --- |
| “Let people grant Editor permissions when copilots and extensions are shared” is selected | Owners and Editors can share with any individual as an Editor. |
| “Let people grant Editor permissions when copilots and extensions are shared” is not selected | Owners and Editors cannot share with an individual as an Editor. This control will not affect the Owner or Editors’ ability to share with Viewers. |
| “Let people grant Viewer permissions when copilots and extensions are shared” is selected | Owners and Editors can share with any individual as a Viewer and any security group. |
| “Let people grant Viewer permissions when copilots and extensions are shared” is not selected | Owners and Editors cannot share with an individual as a Viewer nor will they be able to share with a security group. This control will not prevent them from sharing their copilots with individuals as Editors. |
| Only share with individuals (no security groups) | Owners and Editors can only share with individuals as Viewers. They will not be able to share with a security group. |
| Limit number of viewers who can access each copilot and extension | If **Only share with individuals (no security groups)** is selected, you can control the maximum number of Viewers with whom a custom copilot and copilot extensions can be shared with. |

To learn more about Editor and Viewer permissions on custom copilots and copilot extensions, go to: https://learn.microsoft.com/en-us/microsoft-copilot-studio/security-and-governance


> [!NOTE]
> Sharing rules are enforced when users try to share an app or copilot. This won't impact any existing users who already have access to the app or copilot prior to the application of the sharing rules. However, if an app or copilot is out of compliance after rules are set, only un-sharing will be allowed until the app or copilot is compliant with the new rules.
> 
> After sharing rules are set in the Power Platform admin center, it may take up to an hour for them to start getting enforced.
>
> Sharing rules in Dataverse for Teams environments do not impact sharing to a Team when you select **Publish to Teams**. However, when a user attempts to share with individuals or groups in a Team other than the one bound to the environment, the sharing limits are enforced. 

If a user tries to share a canvas app or copilot that contradicts the sharing rules, they will be informed as shown below.

:::image type="content" source="media/managed-environment-canvas-app-sharing-rule.png" alt-text="Screenshot of a message when canvas app doesn't respect sharing rule.":::

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

Here's a PowerShell script that prevents copilots from being shared with security groups and limits the number of Viewers that can access a copilot to 20 within a Managed Environment.

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

Here's a PowerShell script to disable sharing your copilots with Editors.

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

### See also
[Managed Environments overview](managed-environment-overview.md) <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md) <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md) 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
