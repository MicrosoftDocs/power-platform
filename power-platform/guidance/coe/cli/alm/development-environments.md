---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator Developer environments"
description: "Summary of how to add a maker development environment to the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Development Environments

Each maker will need a development environment created. Advanced makers can use a community environment to work in. Community environments can be accessed from the sign-up page [https://powerapps.microsoft.com/developerplan/](https://powerapps.microsoft.com/developerplan/) with **Get Started Free**

## Microsoft Power Platform for Developer Licenses

One approach for organizations to manage and assign development environments to makers. To sign up for the developer plan to your organization you will may to enable viral sign-up to have the license assigned to your organization.

1. Check if ad-hoc subscriptions are enabled in your tenant

```powershell
Import-Module -Name MSOnline
Connect-MsolService
Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
```

1. If **AllowAdHocSubscriptions** is false then will need to temporarily enable AllowAdHocSubscriptions

```powershell
Set-MsolCompanySettings -AllowAdHocSubscriptions $true 
```

1. Verify that only Viral consent plan using [Get-AllowedConsentPlans](/powershell/module/microsoft.powerapps.administration.powershell/get-allowedconsentplans) is enabled as Administrator

```powershell
Import-Module -Name Microsoft.PowerApps.Administration.PowerShell
Get-AllowedConsentPlans
```

1. The results should be {Viral}. If it does not have this value then can update consent plans using [Add-AllowedConsentPlans](/powershell/module/microsoft.powerapps.administration.powershell/add-allowedconsentplans) and [Remove-AllowedConsentPlans](/powershell/module/microsoft.powerapps.administration.powershell/remove-allowedconsentplans)

```powershell
Add-AllowedConsentPlans -Type Viral
Remove-AllowedConsentPlans -Type Internal
```

1. Once these steps are completed then complete the sign-up process using [https://powerapps.microsoft.com/developerplan/](https://powerapps.microsoft.com/developerplan/) with **Get Started Free**

1. The license type **Microsoft Power Apps for Developers** can how be [assigned to users](/microsoft-365/admin/manage/assign-licenses-to-users) or [Azure Active Groups](/azure/active-directory/enterprise-users/licensing-groups-assign)

1. If the AllowAdHocSubscriptions value was changed to true then can update to value to false

```powershell
Set-MsolCompanySettings -AllowAdHocSubscriptions $false 
```

1. Makers who have been assigned the license can now visit [https://make.powerapps.com](https://make.powerapps.com) and a development environment will be created

## Admin Maker Setup

As Azure DevOps Administrator the following command will add the required service connection to the development environment and setup security for the user

```bash
coe alm maker add \
  -o https://dev.azure.com/dev12345 \
  -p alm-sandbox \
  -e https://contoso-dev-user1.crm.dynamics.com \
  -u username@contoso.com
```

More information on the [core alm maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/maker/add.md) command

## Read Next

- Complete the [Install Overview](./overview.md#install-overview)

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
