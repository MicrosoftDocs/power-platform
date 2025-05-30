---
title: Control environment creation and management | Microsoft Docs
description: Control who can create and manage environments in the Power Platform admin center.
author: Mattp123
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/17/2024
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
contributors:
  - marcelbf
---
# Control who can create and manage environments in Power Platform

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

With the new provisioning model, those users with the correct licenses can create an environment as long as 1 GB of capacity is available. When you complete the steps in this article to restrict who can create environments, only users who have the following admin security roles can create new environments in the Power Platform admin center:

- Global admins
- Dynamics 365 admins
- Power Platform admins

## Control environment creation in the Power Platform admin center

To restrict environment creation and management to admins from the Power Platform admin center, follow these steps:

1. Sign in to the Microsoft Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com), and select **Settings** on the left navigation pane.
1. From the **Tenant settings** list, select from the following environment type creation settings:

   - Developer environment assignments
   - Production environment assignments
   - Trial environment assignments

1. Select **Only specific admins**.
1. Select **Save**.

Repeat the steps for each environment type that you want to restrict.

> [!NOTE]
> Environments created prior to restriction can still be managed after restriction by those who created the environment. Restriction will prevent any new environments being created and managed. 

## Developer environments

Developer environments are special environments intended only for use by the owner. You can restrict users from creating developer type environments from Power Platform admin center.
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

Yes. You can follow the steps in this article to [control environment creation in the Power Platform admin center](#control-environment-creation-in-the-power-platform-admin-center) or use the following PowerShell commands to restrict trial environment creation.

```powershell
$settings = @{ DisableTrialEnvironmentCreationByNonAdminUsers = $true }
Set-TenantSettings $settings
```

Download and install the admin PowerShell cmdlets as described [here](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.1). For more information about our cmdlets, see [PowerShell support for Power Apps](powerapps-powershell.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
