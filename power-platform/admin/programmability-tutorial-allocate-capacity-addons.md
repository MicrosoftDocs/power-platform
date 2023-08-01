---
title: "Tutorial: Allocate add-ons to environments (preview) | Microsoft Docs"
description: This tutorial will demonstrate how to use allocate add-ons to environments manually as well as programmatically.
author: laneswenka
ms.reviewer: laneswenka
ms.component: pa-admin
ms.topic: reference
ms.date: 07/31/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Allocate add-ons to environments (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Add-ons provide extra capabilities that Power Apps, Power Automate Flows, and other resources can utilize.  These are assignable at the environment level in Power Platform admin center, and are made available based on prior license purchases.  

In this tutorial, you'll learn how to:

- Visit the admin center and manually allocate an add-on to an environment
- Allocate add-ons using PowerShell to perform this action at scale
- Unassign the add-on when finished

As an example of this scenario, a customer who has purchased Power Apps app passes can assign those to an environment to allow anyone in those environments to use the apps without an individual license.  

> [!IMPORTANT]
> Power Platform APIs and tools are in preview.  Portions of this tutorial may change in the future.

## Login and allocate

To start, we will login as a Power Platform administrator and will allocate an app pass to a particular environment.

### Before you begin

Is there anything we need to make people aware of before they get started??

# [Power Platform admin center](#tab/PPAC)

### Manual allocation from the admin center

Once logged in to the admin center, visit the **Resources** -> **Capacity** page.  From there, scroll down to the **Add-ons** section and click the **Manage** link.

<img src="media/tutorial-allocate-addons1.png" width="400px" />

On the next screen, select an environment and review all of the various add-ons you could assign.  As a reminder, you can only adjust add-ons for those you have previously purchased.  In this example, we will add 500 AI Builder Credits to the environment and click **Save**.

<img src="media/tutorial-allocate-addons2.png" width="400px" />

# [PowerShell](#tab/PowerShell)

### Automated allocation via PowerShell

Load up your PowerShell console and execute the following commands to allocate add-ons to a given environment.  In this example, we are selecting the same environment shown from the manual example in the admin center, but you could query for several environments and loop through each one as required.  Note the variables so that you can change the input values as required. 

```powershell
#Install the module
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_AAD"
$SPNId = "YOUR_AZURE_APPLICATION_REGISTRATION_CLIENT_ID"
$ClientSecret = "YOUR_AZURE_APPLICATION_CLIENT_SECRET"
$capacityDetailsList = @()

Write-Host "Creating a session against the Power Platform API"

Add-PowerAppsAccount -Endpoint prod -TenantID $TenantId -ApplicationId $SPNId -ClientSecret $ClientSecret
```
---

## Unassign the add-on when finished
In this step, we will clean up the allocation previously assigned.  This is also commonly done by admins who wish to reclaim capacity for other purposes.

# [Power Platform admin center](#tab/PPAC)

### Cleanup from the UI

Return to the Capacity page and click the **Manage** button in the Add-ons section.  From there, find the previous environment and remove the AI Builder Credits allocation and click **Save**.


# [PowerShell](#tab/PowerShell)

### Cleanup via PowerShell
Use the below script to remove the prior allocation.  Note to change the environmentID to one that matches your environment.

```powershell
#fetch environment list with capacity populated.  This is only possible when calling full environment list
$environmentsList = Get-AdminPowerAppEnvironment -Capacity
```
---

## Related articles
