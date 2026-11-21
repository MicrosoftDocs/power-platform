---
title: "Tutorial: Provision a new environment with an ERP-based template  | Microsoft Docs"
description: This tutorial demonstrates how to use the Power Platform to Provision an environment with finance and operations apps installed.
author: laneswenka
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: reference
ms.date: 11/20/2026
ai-usage: ai-generated
ms.subservice: admin
ms.author: laswenka
ms.contributors:
  - lsuresh
  - prbhansali
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

- You can't provision finance and operations apps in Power Platform unless you have a license assigned that grants this permission. An example license is Dynamics 365 Finance or Dynamics 365 Supply Chain Management for customers, and Dynamics 365 Operations Application Partner Sandbox for partners and ISVs. This license must be assigned by your license administrator to your user account in Microsoft Entra. Review the licenses currently assigned to you in the Subscription table on the [MyAccount](https://portal.office.com/account/?ref=MeControl) page.

- You must have at least 1 gigabyte of available Operations and Dataverse database capacities. For more information, see [Manage storage and capacity](../finance-operations-storage-capacity.md).

### Knowing which template to provision

All Dynamics 365 environment templates require that the tenant has purchased a related license. However, users who are assigned the Power Platform Administrator role or the Dynamics 365 Administrator role in Microsoft Entra ID don't require a full user license to create or manage these environments. If the role was just recently assigned, note there's a 12 hour cache before the provisioning system allows a user without a license to create a new environment.

The following table shows the mapping between various finance and operations apps licenses and their template details.

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

You can provision a new environment with finance and operations apps preinstalled using the Power Platform admin center or PowerShell.

### [Admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the **New** button. Enter details for your environment. Keep the following points in mind:
    - The environment name must be globally unique because it impacts the finance and operations URL.
    - If you want to use preview releases of finance and operations, select the **Get new features early** option.
    - Select **Yes** for **Add a Dataverse data store**.
1. Select **Next**. On the following screen, complete the following tasks:
    - Select a security group to restrict access to the environment.
    - Select **Yes** for the **Enable Dynamics 365 apps** option.
    - Choose an available template such as Finance (preview), Supply Chain Management (preview), and so on.
1. Select **Save**.

### [PowerShell](#tab/PowerShell)

1. Open your PowerShell console application.
1. Install the required module.
   
    ```powershell
    Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
    ```
1. Add your Power Platform account.
   
    ```powershell
    Add-PowerAppsAccount -Endpoint prod
    ```
1. Construct the JSON object for template parameters.

    ```powershell
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
    ```
1. Provision the new environment (replace values as needed, and ensure your chosen environment name is globally unique and under 20 characters). Set `-LocationName` to a location code, such as `canada` or `unitedstates`. For the location codes that support finance and operations apps, see [Regional availability for finance and operations apps](unified-environment-types-and-templates.md#regional-availability-for-finance-and-operations-apps).

    ```powershell
    New-AdminPowerAppEnvironment -DisplayName "MyUniqueNameHere" -EnvironmentSku Sandbox -Templates "D365_FinOps_Finance" -TemplateMetadata $jsonObject -LocationName "canada" -ProvisionDatabase
    ```

    If the command returns `MacroRegionRequired` (`macroRegion must be specified for this request`), your tenant must select a macro region instead of a location. Follow the steps in [Provision in a macro region](#provision-in-a-macro-region).

#### Provision in a macro region

Depending on your tenant's eligibility, you might need to select a macro region geography, such as North America or Asia-Pacific, instead of a specific location when you create an environment. The platform then assigns a datacenter region within that macro region. For more information, see [Power Platform and Dynamics 365 macro region geography](../macro-regions.md).

The `Microsoft.PowerApps.Administration.PowerShell` module doesn't have a macro region parameter, so call the [Power Platform API](/rest/api/power-platform/) from PowerShell instead. These steps require the [MSAL.PS](https://www.powershellgallery.com/packages/MSAL.PS) module and an [app registration configured for the Power Platform API](../programmability-authentication-v2.md).

1. Sign in and request a token for the Power Platform API. Replace the client and tenant ID placeholders with your own values.

    ```powershell
    Import-Module MSAL.PS

    $ClientId = "<application (client) ID of your app registration>"
    $TenantId = "<directory (tenant) ID>"
    $ApiBase  = "https://api.powerplatform.com"
    $ApiVer   = "2024-10-01"

    $auth = Get-MsalToken -ClientId $ClientId -TenantId $TenantId -Scope "$ApiBase/.default" -Interactive
    $headers = @{ Authorization = "Bearer $($auth.AccessToken)" }
    ```

2. Use the [Get Supported Locations](/rest/api/power-platform/environmentmanagement/environment-provisioning/get-supported-locations) API to check how your tenant selects a location and to list the macro regions available to it.

    ```powershell
    $locations = Invoke-RestMethod -Method Get -Uri "$ApiBase/environmentmanagement/provisioning/locations?api-version=$ApiVer" -Headers $headers
    $locations.locationSelectionMode
    $locations.macroRegions | Format-Table macroRegionId, displayName
    ```

    If `locationSelectionMode` is `MacroRegion`, use a `macroRegionId` value from the output, such as `north-america`, in the next step. If it's `Region`, use `New-AdminPowerAppEnvironment` with `-LocationName` as shown earlier.

3. Use the [Provision New Environment](/rest/api/power-platform/environmentmanagement/environment-provisioning/provision-new-environment) API to create the environment in the macro region. This request reuses the `$jsonObject` template parameters that you created earlier. Set `macroRegion` to the ID you selected, and replace the other values as needed.

    ```powershell
    $body = @{
        displayName    = "MyUniqueNameHere"
        environmentSku = "Sandbox"
        databaseType   = "CommonDataService"
        macroRegion    = "north-america"
        linkedEnvironmentMetadata = @{
            baseLanguageCode = 1033
            currency         = @{ code = "USD" }
            templates        = @("D365_FinOps_Finance")
            templateMetadata = $jsonObject
        }
    } | ConvertTo-Json -Depth 10

    Invoke-RestMethod -Method Post -Uri "$ApiBase/environmentmanagement/provisioning/environments?api-version=$ApiVer" -Headers $headers -Body $body -ContentType "application/json"
    ```

    Provisioning continues in the background. To check its progress, go to **Manage** > **Environments** in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

> [!IMPORTANT]
> If you require the user interface (UI), follow the steps in [Tutorial: Install the Finance and Operations Provisioning App](./tutorial-install-finance-operations-provisioning-app.md). You can't currently use the UI to create new developer-focused sandbox and production environments that have finance and operations apps.

---

## Delete the environment

In this procedure, delete the environment you previously created. Deleting an environment is an action commonly done by admins who want to free up the Dataverse and Operations storage consumed by this environment for other needs. An environment can be deleted using the Power Platform admin center or PowerShell.

### [Admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**.
1. Select an appropriate environment, and then select the **Delete** button in the command bar at the top of the page. Confirm that you want to delete the environment and proceed.

### [PowerShell](#tab/PowerShell)

Use the following script to delete the previously created environment. Set the **environmentID** appropriately.

```powershell
#Remove the previously created environment by ID
Remove-AdminPowerAppEnvironment -EnvironmentName [Guid]
```
---
