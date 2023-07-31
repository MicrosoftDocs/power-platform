---
title: "Tutorial: Provision a new environment with an ERP-based template (preview) | Microsoft Docs"
description: This tutorial will demonstrate how to use the Power Platform to deploy an environment with Finance and Operations apps installed.
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

# Tutorial: Provision a new environment with an ERP-based template (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Finance and operations apps have been re-imagined as an application hosted by Microsoft Dataverse.  No longer do customers need to deploy their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 platform applications.  Additionally, most administrative actions in Power Platform are available via UI and API based experience.

In this tutorial, you'll learn how to:

- Visit the admin center and create a new environment using a template based on your assigned license
- Deploy a developer-focused sandbox using PowerShell to use with X++
- Delete the environment when no longer in use

As an example of this scenario, a customer who operates their finance and operations apps environments via Lifecycle Services (LCS) portal today would like to try deploying one of the newer developer-focused sandboxes in Power Platform admin center.  

> [!IMPORTANT]
> Unified admin experiences for finance and operations apps are in preview.  Portions of this tutorial may change in the future.

## Environment deployment

The easiest way to get finance and operations apps up and running in Power Platform is to create a new environment via template.  A template is simply an efficiency in terms of creating a Dataverse-based Power Platform enviornment with several applications pre-installed.  In this scenario, the finance and operations ERP application will be installed automatically upon environment creation.

### Before you begin

You cannot deploy finance and operations apps in Power Platform unless you have a license assigned that grants this permission.  An example license is Dynamics 365 Finance or Dynamics 365 Supply Chain Management for customers, and Dynamics 365 Operations Application Partner Sandbox for partners and ISVs.  This must be assigned by your license administrator to your user account in Microsoft Entra (formerly known as Azure Active Directory).

You also must have at least 1 gigabyte of available Operations and Dataverse database capacities.  For more information see [Manage storage capacity](https://aka.ms/).

# [Power Platform admin center](#tab/PPAC)

### Create from the admin center

To start off, in this tutorial we'll use a Logic Apps workflow.  A Power Automate flow is also acceptable, and any other orchestration engine that your company prefers to use for automation.  All of the calls to retrieve the data will be using RESTful APIs so any tooling that supports REST will work with this tutorial.

# [PowerShell](#tab/PowerShell)

### Create from PowerShell

Use the below script to initialize some variables that we'll use throughout the tutorial.  Optionally, you may use Username/Password authentication but it isn't advised.

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

## Delete the environment
In this section, we'll fetch the environment list that you administer.  This can be done via API and PowerShell.

# [Power Platform admin center](#tab/PPAC)

### Cleanup from the UI

Now is the time to call the Power Platform API.  We’ll use the List Environments endpoint to retrieve all of our environments and their metadata, specifically with the $expand parameter for capacity.  This also uses the Authorization header with the Bearer Token we received in the previous section from Azure AD.  If you used username/password context, you can also enter that Bearer Token at this step as well.

> [!div class="mx-imgBorder"] 
> ![Use the List Environments endpoint to retrieve all environments and their metadata.](media/capacity6.png "Use the List Environments endpoint to retrieve all environments and their metadata")

We then parse the Power Platform API response into a strongly typed object using this JSON schema with the 'Parse JSON' action:

> [!div class="mx-imgBorder"] 
> ![Parse the Power Platform API response into a strongly typed object.](media/capacity7.png "Parse the Power Platform API response into a strongly typed object")

# [PowerShell](#tab/PowerShell)

### Cleanup via PowerShell
Use the below script to pull a list of all environments you're the administrator over.  Using the new "-Capacity" flag you can add capacity consumption information for each environment retrieved.

```powershell
#fetch environment list with capacity populated.  This is only possible when calling full environment list
$environmentsList = Get-AdminPowerAppEnvironment -Capacity
```
---


## Related articles
