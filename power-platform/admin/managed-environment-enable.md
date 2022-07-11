---
title: "Enable Managed Environments | MicrosoftDocs"
description: Learn how to enable Managed Environments.
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
# Enable Managed Environments

<!-- https://go.microsoft.com/fwlink/?linkid=2194805 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Admins can enable Managed Environments using the [Power Platform admin center](managed-environment-enable.md) or by using PowerShell. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Permissions

- Users with either the global admin, Power Platform service admin or Dynamics 365 admin Azure Active Directory roles are allowed to enable Managed Environments. 
- Any user with permission to see environment details can retrieve the Managed Environments property for the environment.  
- Users with the Delegated Admin role aren't allowed to change the Managed Environments property in an environment. 
- Users with the Environment Admin security role aren't allowed to change the Managed Environments property in an environment.  

> [!IMPORTANT]
> Copy and restore environment lifecycle operations requires the Managed Environments property to be the same between source and destination before the respective environment lifecycle operation can start. 

## Enable or edit Managed Environments in the Power Platform admin center

Follow these steps to enable Managed Environments.

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select the check mark to the left of an environment. 

3. On the command bar, for an unmanaged environment, select **Enable Managed Environments**. For a managed environment, select **Edit Managed Environments**.

3. Configure Managed Environments settings and then select **Enable**.

:::image type="content" source="media/managed-environment-enable.png" alt-text="Select Managed Environments.":::

|Setting  |Description  |
|---------|---------|
|**[Weekly digest](managed-environment-weekly-digests.md)**     |         |
|Include this environment     | Select to have the selected environment be managed.       |
|Email recipients     | Add the email addresses of those who will receive weekly analytics about your top apps and flows, your most impactful makers, and inactive resources you can safely clean up.        |
|**[Limit sharing](managed-environment-sharing-limits.md)**     |         |
|Exclude sharing with security groups     | Enable so [makers](/power-apps/learning-catalog/app-maker) can't share canvas apps with any security groups. <br />Admins get the option to proceed with setting a limit on individuals shared to.        |
|Limit total individuals who can be shared to    | Enable so makers can't share canvas apps with more individuals than specified in the text box. <br /> You must enable **Exclude sharing with security groups** to enable this setting.        |
|**[Data policies](managed-environment-data-policies.md)**     |         |
|See active data policies for this environment     | Create policies that define the consumer connectors that specific data can be shared with.         |

## Disable Managed Environments using PowerShell

Admins can remove the Managed Environments property on an environment using the available API if respective environment is not using any of the capabilities available. The following is an example script on how to call the API to set the Managed Environments property using PowerShell: 

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
[Managed Environments overview](managed-environment-overview.md) <br />
[Weekly digests](managed-environment-weekly-digests.md) <br />
[Sharing limits](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)




[!INCLUDE[footer-include](../includes/footer-banner.md)]


