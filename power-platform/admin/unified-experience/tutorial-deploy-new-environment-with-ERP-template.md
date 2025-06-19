---
title: "Tutorial: Provision a new environment with an ERP-based template  | Microsoft Docs"
description: This tutorial demonstrates how to use the Power Platform to Provision an environment with finance and operations apps installed.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 06/19/2025
ms.subservice: admin
ms.author: laswenka
ms.contributors:
  - lsuresh
contributors:
  - lavanyapg
search.audienceType: 
  - admin
---

# Tutorial: Provision a new environment with an ERP-based template

Finance and operations apps are reimagined as an application hosted by Microsoft Dataverse. No longer do customers need to provision their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 platform applications. Additionally, most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this tutorial, learn how to:

- Go to the Power Platform admin center and create a new environment using a template based on your assigned license.
- Provision a developer-focused sandbox using PowerShell to use with X++ code.
- Delete an environment when no longer in use.

As an example of this scenario, a customer who operates their finance and operations apps environments in Microsoft Dynamics Lifecycle Services can provision one of the newer, developer-focused sandboxes in the Power Platform admin center. 

## Environment provisioning

The easiest way to get finance and operations apps up and running in Power Platform is to create a new environment using a template. A template is simply an efficiency in terms of creating a Dataverse-based Power Platform environment with several applications preinstalled. In this scenario, the finance and operations ERP application are installed automatically upon environment creation.

### Before you begin

You can't provision finance and operations apps in Power Platform unless you have a license assigned that grants this permission. An example license is Dynamics 365 Finance or Dynamics 365 Supply Chain Management for customers, and Dynamics 365 Operations Application Partner Sandbox for partners and ISVs. This must be assigned by your license administrator to your user account in Microsoft Entra. You can review the licenses currently assigned to you in the Subscription table on the [MyAccount](https://portal.office.com/account/?ref=MeControl) page.

You also must have at least 1 gigabyte of available Operations and Dataverse database capacities. For more information, see [Manage storage and capacity](../finance-operations-storage-capacity.md).

### Knowing which template to provision

All Dynamics 365 environment templates are associated with their related full user licenses. This means that the admin user in the Power Platform admin center must have a full license assigned to them to be able to create one of these environments, and the same holds true when using tools like PowerShell as well. The following table shows the mapping between various finance and operations apps licenses and their template details.

| License | Template name | Template ID | Comments |
| ----------- | ----------- |----------- |----------- |
| Dynamics 365 Finance| Finance (preview) | D365_FinOps_Finance |  |
| Dynamics 365 Supply Chain Management (preview) | Supply Chain Management (preview) | D365_FinOps_SCM |  |
| Dynamics 365 Project Operations | Project Operations Integrated (preview) | D365_FinOps_ProjOps |  |
| Dynamics 365 Operations Application Partner Sandbox | Project Operations Integrated (preview) | D365_FinOps_ProjOps | |
| Dynamics 365 Commerce| Commerce (preview) | D365_FinOps_Commerce | This template is available only for trials. |

### Known limitations

Be sure to check out the latest known limitations available in the overview article [Unified admin experience for finance and operations apps](finance-operations-apps-overview.md#known-limitations).

## Step-by-step provisioning guide

To create a new environment where finance and operations apps are preinstalled, perform the following steps:

Open your PowerShell console application, and run the following commands to generate the environment. Note the variables, so that you can change the input values as required. If you want to use a service principal, follow the instructions in [Creating a service principal application using PowerShell](../powershell-create-service-principal.md).

In the following script, the **DevToolsEnabled** parameter determines whether your sandbox environment is provisioned with support for X++ development, or whether it becomes a traditional sandbox environment for user acceptance testing (UAT) and training purposes. If you set the value to **true**, you can do development. If you set the value to **false** or omit the parameter, you receive a traditional sandbox environment that has finance and operations apps installed.

```powershell
#Install the module
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell

Write-Host "Creating a session against the Power Platform API"

Add-PowerAppsAccount -Endpoint prod

#To construct the json object to pass in
$jsonObject= @" 
{ 
 "PostProvisioningPackages": 
 [ 
 { 
 "applicationUniqueName": "msdyn_FinanceAndOperationsProvisioningAppAnchor", 
"parameters": "DevToolsEnabled=true|DemoDataEnabled=true" 
 } 
 ] 
} 
"@ | ConvertFrom-Json

# To kick off new environment Provisionment
# IMPORTANT - This has to be a single line, after the copy & paste the command
New-AdminPowerAppEnvironment -DisplayName "MyUniqueNameHere" -EnvironmentSku Sandbox -Templates "D365_FinOps_Finance" -TemplateMetadata $jsonObject -LocationName "Canada" -ProvisionDatabase
```

In the given example, we used the **Finance** environment template. See the table reference given earlier for all templates available by license. Also note that your environment name must be **globally unique and less than 20 characters** because that derives the environment URL. There are plans to add upfront validation in the future.

> [!IMPORTANT]
> If you require the UI, follow the steps in [Tutorial: Install the Finance and Operations Provisioning App](./tutorial-install-finance-operations-provisioning-app.md). 

> [!IMPORTANT]
> You can't currently use the user interface (UI) to create new sandbox and production environments that have finance and operations apps. However, this capability is planned for a future release.

## Delete the environment

In this step, delete the environment you previously created. Deleting an environment is an action commonly done by admins who want to reclaim capacity for other purposes. An environment can be deleted using the Power Platform admin center, or PowerShell as follows.

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. 
1. Select a specific environment, and then select the **Delete** button in the action bar at the top of the page. Confirm that you want to delete the environment and proceed.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using administrator credentials.
1. Go to **Environments**. 
1. Select a specific environment, and then select the **Delete** button in the action bar at the top of the page. Confirm that you want to delete the environment and proceed.

# [PowerShell](#tab/PowerShell)

Use the following script to delete the previously created environment. Set the **environmentID** appropriately.

```powershell
#Remove the previously created environment by ID
Remove-AdminPowerAppEnvironment -EnvironmentName [Guid]
```

This operation starts the deletion process and frees up the Dataverse and Operations storage consumed by this environment for other needs.

---
