---
title: Control environment creation and management | Microsoft Docs
description: Control who can create and manage environments in the Power Platform admin center.
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/16/2023
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
contributors:
  - marcelbf
---
# Control who can create and manage environments in the Power Platform admin center 

With the new provisioning model, those with the correct licenses can create an environment as long as 1GB of capacity is available. To restrict environment creation and management to admins, do the following:

1. Sign in to the Microsoft Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com).
2. Select the **Gear** icon (![Gear icon.](media/selection-rule-gear-button.png)) in the upper-right corner of the Microsoft Power Platform site.
3. Select **Power Platform settings**. 
4. Select **Only specific admins**.

   > [!div class="mx-imgBorder"] 
   > ![Specify Global admins.](./media/governance-setting.png "Specify Global admins")

The following admins will be able to create new environments in the Power Platform admin center:

- Global admins
- Dynamics 365 admins
- Power Platform admins

> [!NOTE]
> Environments created prior to restriction can still be managed after restriction by those who created the environment. Restriction will prevent any new environments being created and managed. 

## Developer environments

Developer environments are special environments intended only for use by the owner. You can restrict users from creating developer type environments from Power Platform admin center, but if the user has a **Microsoft Power Apps for Developer** license, a developer environment will be auto-created next time the user logs in.

To restrict users from creating developer type environments, admins can use following PowerShell command:

```powershell
$requestBody = [pscustomobject]@{
powerPlatform = [pscustomobject]@{
governance = [pscustomobject]@{
disableDeveloperEnvironmentCreationByNonAdminUsers  = $True
}
}
}

Set-TenantSettings -RequestBody $requestBody
```

To permanently remove the auto-creation of developer environments, a member of the Power Platform related [service admin roles](/power-platform/admin/use-service-admin-role-manage-tenant) must perform the following actions:

- Remove the **Microsoft Power Apps for Developer** license. More information: [Service plan IDs for licensing](/azure/active-directory/enterprise-users/licensing-service-plan-reference).
- Disable [self-service sign-up](/azure/active-directory/enterprise-users/directory-self-service-signup).
- Explicitly block all "internal" consent plans in the tenant using PowerShell:
```powershell
Remove-AllowedConsentPlans -Types @("Internal", "Viral")
```
More information: [Block trial licenses commands](/power-platform/admin/powerapps-powershell#block-trial-licenses-commands).

## Control environment creation through PowerShell

Download and install the admin PowerShell cmdlets as described [here](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.1). For more information about our cmdlets, see [PowerShell support for Power Apps](powerapps-powershell.md).

Use the following commands to restrict environment creation to Global admins, Dynamics 365 admins, and Power Platform admins. 

```powershell
$settings = @{ DisableEnvironmentCreationByNonAdminUsers = $true }
Set-TenantSettings $settings
```

## FAQ

### Can I disable trial environment creation for users in the tenant?
Yes. Use the following PowerShell commands to restrict trial environment creation.

```powershell
$settings = @{ DisableTrialEnvironmentCreationByNonAdminUsers = $true }
Set-TenantSettings $settings
```

Download and install the admin PowerShell cmdlets as described [here](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.1). For more information about our cmdlets, see [PowerShell support for Power Apps](powerapps-powershell.md).




[!INCLUDE[footer-include](../includes/footer-banner.md)]
