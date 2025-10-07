---
title: Control environment creation and management | Microsoft Docs
description: Control who can create and manage environments in the Power Platform admin center.
author: Mattp123
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/17/2024
ms.subservice: admin
ms.author: matp
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
  - marcelbf
ms.custom:
  - NewPPAC
  - sfi-ga-nochange
---
# Control who can create and manage environments in Power Platform

With the new provisioning model, users with the correct licenses can create an environment as long as 1 GB of capacity is available. When you complete the steps in this article to restrict who can create environments, only users who have the following admin security roles can create new environments in the Power Platform admin center:

- Global admins
- Dynamics 365 admins
- Power Platform admins

## Control environment creation in the Power Platform admin center

To restrict environment creation and management to admins from the Power Platform admin center, follow these steps:

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Tenant settings** to open the Tenant settings page.

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Settings** to open the Tenant settings page.
---

In the **Tenant settings** page, select one of these environment-type creation settings:

   - Developer environment assignments
   - Production environment assignments
   - Trial environment assignments

1. Select **Only specific admins**.
1. Select **Save**.
1. Repeat the steps for each environment type that you want to restrict.

> [!NOTE]
> Environments created before the restriction remain manageable by their creators even after the restriction is applied. Restriction prevents any new environments being created and managed. 

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
