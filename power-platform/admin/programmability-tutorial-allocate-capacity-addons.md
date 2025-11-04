---
title: "Tutorial: Allocate add-ons to environments | Microsoft Docs"
description: Learn how to allocate add-ons to environments manually, as well as programmatically.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/03/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Allocate add-ons to environments 

Add-ons provide extra capabilities that Power Apps, Power Automate flows, and other resources can use. These capabilities can be assigned at the environment level in the Power Platform admin center and are made available based on prior license purchases. To learn more about add-on management, reporting, and access control, see [Add-on capacity management](./capacity-add-on.md).

In this tutorial, you'll learn to:

> [!div class="checklist"]
> + Manually allocate an add-on to an environment in the Power Platform admin center.
> + Allocate add-ons, at scale, using PowerShell.
> + Unassign an add-on.
  
As an example of this scenario, a customer who has purchased AI Builder credits and Power Automate per Process flows can assign those add-ons to an environment to account for usage in that environment.


## Allocate an add-on to an environment

To start, sign in as a Power Platform administrator and allocate AI Builder credits to the environment where they'll be used.

Not all add-ons are available in the Power Platform admin center UI. As new add-ons become available, they're often first surfaced using API and programmability tools to get customer feedback before making them more generally available in the UI. Such an example is the Power Automate per Process add-on, which can be allocated using PowerShell, as shown in the following PowerShell example.

> [!TIP]
> For full REST API reference, visit [Currency allocation](/rest/api/power-platform/licensing/currency-allocation).

# [Power Platform admin center](#tab/PPAC)

### Manually allocate an add-on from the Power Platform admin center

1. In the Power Platform admin center, select **Resources** > **Capacity**.  
2. Scroll down to the **Add-ons** section and select the **Manage** link.

    :::image type="content" source="media/tutorial-allocate-addons1.png" alt-text="Select the Manage link.":::

3. Select an environment and review all of the various add-ons you could assign. Keep in mind that you can only adjust add-ons for those that you have previously purchased.  

    In this example, we add 500 AI Builder credits to the environment.

    :::image type="content" source="media/tutorial-allocate-addons2.png" alt-text="Select an environment and review all of the various add-ons you could assign.":::

4. Select **Save**.

# [Power Automate / Logic Apps](#tab/Automate)

### Allocate an add-on using Power Automate flows or Logic Apps

Add a new action to the canvas, searching for "Allocate and deallocate the currencies for the environment".  Set the parameters to higher numeric values to perform assignment.

:::image type="content" source="media/tutorial-allocate-addons-flow1.png" alt-text="Allocate and deallocate the currencies screenshot.":::

# [PowerShell](#tab/PowerShell)

### Allocate an add-on using PowerShell

Load your PowerShell console and execute the following commands to allocate add-ons to a specific environment. In this example, select the same environment used in the manual example in the Power Platform admin center, but you could query for several environments and loop through each one, as required. In the example below, we used the new **PowerAutomatePerProcess** add-on type, which isn't yet available in the Power Platform admin center UI.

For a list of all add-on types, see [Definitions: External Currency Type](/rest/api/power-platform/licensing/currency-allocation/get-currency-allocation-by-environment#externalcurrencytype).

```powershell
#Install the module
Install-Module -Name Az.Accounts

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_Microsoft Entra ID"
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

Power Platform API reference: [Currency Allocation - Patch Currency Allocation By Environment](/rest/api/power-platform/licensing/currency-allocation/patch-currency-allocation-by-environment)

## Unassign an add-on
You can unassign an add-on. This is also commonly done by admins who wish to reclaim capacity for other purposes.

# [Power Platform admin center](#tab/PPAC)

### Unassign an add-on from the Power Platform admin center

1. Sign in to the Power Platform admin center and select **Resources** > **Capacity**.
3. Select **Manage** in the **Add-ons** section.
4. Find your environment and remove the AI Builder credits allocation that was assigned earlier in this article.
5. Select **Save**.

# [Power Automate / Logic Apps](#tab/Automate)

### Unassign an add-on using Power Automate flows or Logic Apps

Add a new action to the canvas, searching for "Allocate and deallocate the currencies for the environment".  Set the parameters to lower numeric values to perform unassignment.

:::image type="content" source="media/tutorial-allocate-addons-flow1.png" alt-text="Allocate and deallocate the currencies screenshot.":::

# [PowerShell](#tab/PowerShell)

### Unassign an add-on using PowerShell
Use the following script to unassign an add-on.  You must change the **environmentID** to one that matches your environment.

```powershell
#Install the module
Install-Module -Name Az.Accounts

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_Microsoft Entra ID"
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
Power Platform API reference: [Currency Allocation - Patch Currency Allocation By Environment](/rest/api/power-platform/licensing/currency-allocation/patch-currency-allocation-by-environment)
