---
title: "CoE ALM Accelerator for Power Platform developer environments (Deprecated)"
description: "Summary of how to add a maker development environment to the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 05/23/2023

ms.topic: concept-article
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# CoE ALM Accelerator for Power Platform developer environments (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

Each maker needs a development environment created. Advanced makers can use a community environment to work in. Community environments can be accessed from the sign-up page at [https://powerapps.microsoft.com/developerplan/](https://powerapps.microsoft.com/developerplan/), then select **Get started free**.

## Power Platform for developer licenses

One approach to app development is for organizations is to manage and assign development environments to makers. To sign up for the developer plan for your organization, you may need to enable viral sign-up to have the license assigned to your organization.

1. Check if ad-hoc subscriptions are enabled in your tenant.

   ```powershell
   Import-Module -Name MSOnline
   Connect-MsolService
   Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
   ```

1. The value of **AllowAdHocSubscriptions** must be false. If the value isn't false, then you need to temporarily enable AllowAdHocSubscriptions.

   ```powershell
   Set-MsolCompanySettings -AllowAdHocSubscriptions $true 
   ```

1. Verify that only the Viral consent plan is enabled using [Get-AllowedConsentPlans](/powershell/module/microsoft.powerapps.administration.powershell/get-allowedconsentplans).

   ```powershell
   Import-Module -Name Microsoft.PowerApps.Administration.PowerShell
   Get-AllowedConsentPlans
   ```

1. The results should be {Viral}. If it doesn't have this value, you can update the consent plan using [Add-AllowedConsentPlans](/powershell/module/microsoft.powerapps.administration.powershell/add-allowedconsentplans) and [Remove-AllowedConsentPlans](/powershell/module/microsoft.powerapps.administration.powershell/remove-allowedconsentplans).

   ```powershell
   Add-AllowedConsentPlans -Type Viral
   Remove-AllowedConsentPlans -Type Internal
   ```

1. Complete the sign-up process using [https://powerapps.microsoft.com/developerplan/](https://powerapps.microsoft.com/developerplan/) by selecting **Get started free**.

1. The license type **Microsoft Power Apps for Developers** can now be [assigned to users](/microsoft-365/admin/manage/assign-licenses-to-users) or [Microsoft Entra Groups](/azure/active-directory/enterprise-users/licensing-groups-assign)

1. If the AllowAdHocSubscriptions value was changed to true, you can update to value to false.

   ```powershell
   Set-MsolCompanySettings -AllowAdHocSubscriptions $false 
   ```

1. Makers who have been assigned the license can go to [https://make.powerapps.com](https://make.powerapps.com) to create a development environment.

## Admin maker setup

As an Azure DevOps services administrator, running the following commands add the required service connection to the development environment and set up security for the user.

   ```bash
   coe alm maker add \
   -o https://dev.azure.com/dev12345 \
   -p alm-sandbox \
   -e https://contoso-dev-user1.crm.dynamics.com \
   -u username@contoso.com
   ```

More information: [Core ALM maker add](https://aka.ms/coe-cli/help/alm/maker/add)

## Read next

- Complete the [Install overview](./overview.md#install-overview).

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
