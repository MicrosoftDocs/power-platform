---
title: Limit sharing 
description: Limit how broadly makers can share canvas apps and solution-aware cloud flows in your Managed Environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/11/2024
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

In Managed Environments, admins can limit how broadly users can share canvas apps. To configure these rules, select a managed environment from the environments list in the Power Platform admin center. Then, select **Edit Managed Environments** in the command bar. The sharing rules are located in the **Limit sharing** section.

:::image type="content" source="media/managed-environment-limit-sharing.png" alt-text="Screenshot of an Edit Environment Management settings screen, with Limit sharing highlighted.":::

## Sharing rules

| Sharing rules | System behavior when selected |
| --- | --- |
| Don't set limits | Select to not limit sharing canvas apps. |
| Exclude sharing with security groups | Select if users aren't allowed to share canvas apps with any security groups or with everyone. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, you can control the maximum number of users with whom a canvas app can be shared. |

| Solution-aware cloud flow sharing rules | System behavior when selected |
| --- | --- |
| Let people share solution-aware cloud flows | **When selected:** Users can share solution-aware cloud flows with any number of individuals or security groups. <br><br> **When unselected:** Users can't share their cloud flows with any individual or security group.|


> [!NOTE]
> Sharing rules are enforced when users try to share an app or flow. This doesn't impact any existing users who already have access to the app or flow prior to the application of the sharing rules. However, if an app or flow is out of compliance after rules are set, only un-sharing is allowed until the app or flow is compliant with the new rules.
> 
> After sharing rules are set in the Power Platform admin center, it may take up to an hour for them to start getting enforced.
>
> Sharing rules in Dataverse for Teams environments do not impact sharing to a Team when you select **Publish to Teams**. However, when a user attempts to share with individuals or groups in a Team other than the one bound to the environment, the sharing limits are enforced. 

If a user tries to share a canvas app or solution-aware cloud flow that contradicts the sharing rules, they're informed as shown below.

:::image type="content" source="media/limit-sharing-cloud-flows.png" alt-text="Screenshot of a user being blocked from sharing a flow.":::

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

### Remove sharing limits

Here's a PowerShell script that removes the sharing limits that were configured in the script above.

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
In the script above, you can substitute 'limitSharingMode' for 'solutionCloudFlows-limitSharingMode' to allow sharing for solution cloud flows. 

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
