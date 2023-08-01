---
title: "Tutorial: Allocate add-ons to environments (preview) | Microsoft Docs"
description: Learn how to use allocate add-ons to environments manually, as well as programmatically.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 08/01/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Allocate add-ons to environments (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Add-ons provide extra capabilities that Power Apps, Power Automate flows, and other resources can utilize. These capabiities can be assigned at the environment-level in the Power Platform admin center, and are made available based on prior license purchases. To learn more about add-on management, reporting, and access control, see [Add-on capacity management](./capacity-add-on.md).

In this tutorial, you'll learn how to:

- Go to the Power Platform admin center and manually allocate an add-on to an environment.
- Allocate add-ons at scale using PowerShell.
- Unassign the add-on when finished.

As an example of this scenario, a customer who has purchased AI Builder credits and Power Automate per Process flows can assign those add-ons to an environment to account for usage in that environment.

> [!IMPORTANT]
> This is a preview feature.
> Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Allocate an add-on to an environment

To start, log in as a Power Platform administrator and allocate AI Builder credits to the environment where they will be used.

Not all add-ons are available in the Power Platform admin center UI.  As new add-ons become available, they are often first surfaced using API and programmability tools to get customer feedback before making them more generally available in the UI.  Such an example is the Power Automate per Process add-on, which can be allocated using PowerShell, as shown in the following PowerShell example.

# [Power Platform admin center](#tab/PPAC)

### Manual allocation from the Power Platform admin center

1. After you sign in to the Power Platform admin center, select **Resources** > **Capacity**.  
2. Scroll down to the **Add-ons** section and select the **Manage** link.

    :::image type="content" source="media/tutorial-allocate-addons1.png" alt-text="Select the Manage link.":::

3. Select an environment and review all of the various add-ons you could assign. Keep in mind that you can only adjust add-ons for those that you have previously purchased.  

    In this example, we will add 500 AI Builder credits to the environment, and then select **Save**.

    :::image type="content" source="media/tutorial-allocate-addons2.png" alt-text="Select an environment and review all of the various add-ons you could assign.":::

# [PowerShell](#tab/PowerShell)

### Automated allocation via PowerShell

Load your PowerShell console and execute the following commands to allocate add-ons to a specific environment. In this example, we are selecting the same environment shown from the manual example in the admin center, but you could query for several environments and loop through each one as required.  Note that in the PowerShell example below, we are using the new **PowerAutomatePerProcess** add-on type, which is not yet available in the Power Platform admin center UI.

For a list of all add-on types, see [Definitions: External Currency Type](/rest/api/power-platform/licensing/currency-allocation/get-currency-allocation-by-environment#externalcurrencytype).

```powershell
#Install the module
Install-Module -Name Az.Accounts

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_AAD"
$EnvironmentId = "YOUR_POWER_PLATFORM_ENVIRONMENT_ID_HERE"

Write-Host "Creating a session against the Power Platform API"

Connect-AzAccount
$AccessToken = Get-AzAccessToken -TenantId $TenantId -ResourceUrl "https://api.powerplatform.com/"

$headers = @{ 'Authorization' = 'Bearer '+$AccessToken.Token }
$headers.Add('Content-Type', 'application/json')

$patchRequestBody =  "{`"currencyAllocations`": `"[{currencyType: `"PowerAutomatePerProcess`", allocated:1}]`" }"

Write-Host "Calling patch to adjust add-on allocations..."

$patchRequestResponse = Invoke-RestMethod -Method Patch -Uri "https://api.powerplatform.com/licensing/environments/$EnvironmentId/allocations?api-version=2022-03-01-preview" 
-Headers $headers -Body $patchRequestBody

$patchRequestResponse

```
---

## Unassign the add-on when finished
You can unassign an add-on. This is also commonly done by admins who wish to reclaim capacity for other purposes.

# [Power Platform admin center](#tab/PPAC)

### Unassign the add-on from the Power Platform admin center

1. Sign in to the Power Platform admin center and select **Resources** > **Capacity**.
2. Select the **Add-ons** tab.
3. Select **Manage**.
4. Find your environment and remove the AI Builder Credits allocation.
5. Select **Save**.

# [PowerShell](#tab/PowerShell)

### Unassign the add-on using PowerShell
Use the following script to remove the prior allocation.  You must change the **environmentID** to one that matches your environment.

```powershell
#Install the module
Install-Module -Name Az.Accounts

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_AAD"
$EnvironmentId = "YOUR_POWER_PLATFORM_ENVIRONMENT_ID_HERE"

Write-Host "Creating a session against the Power Platform API"

Connect-AzAccount
$AccessToken = Get-AzAccessToken -TenantId $TenantId -ResourceUrl "https://api.powerplatform.com/"

$headers = @{ 'Authorization' = 'Bearer '+$AccessToken.Token }
$headers.Add('Content-Type', 'application/json')

$patchRequestBody =  "{`"currencyAllocations`": `"[{currencyType: `"PowerAutomatePerProcess`", allocated:0}]`" }"

Write-Host "Calling patch to adjust add-on allocations..."

$patchRequestResponse = Invoke-RestMethod -Method Patch -Uri "https://api.powerplatform.com/licensing/environments/$EnvironmentId/allocations?api-version=2022-03-01-preview" 
-Headers $headers -Body $patchRequestBody

$patchRequestResponse
```
---
