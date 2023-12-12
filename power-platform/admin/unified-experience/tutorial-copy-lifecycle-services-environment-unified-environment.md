---
title: "Tutorial: Copy a Lifecycle Services environment to a unified environment (preview) | Microsoft Docs"
description: This tutorial will demonstrate how to perform environment copy with respect to unified environments.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 09/13/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Copy a Lifecycle Services environment to a unified environment (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Finance and operations apps have been reimagined as an application hosted by Microsoft Dataverse. A common function for administrators of finance and operations apps is to copy environments. Historically, this has been done in Microsoft Dynamics 365 Lifecycle Services, but now everything can be managed in the Power Platform admin center.

In this tutorial, you'll learn how to:

- Prepare the source environment
- Copy the environment to the target

As an example of this scenario, a customer who operates their finance and operations apps environments through the Lifecycle Services site today would like to copy their production environment data into their new, unified, developer environment in the Power Platform admin center.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Before you begin

The target environment in this tutorial is always a unified environment that contains finance and operations apps hosted by Microsoft Dataverse.  To learn how to deploy one of these environments, see [Tutorial: Provision a new environment with an ERP-based template (preview)](./tutorial-deploy-new-environment-with-ERP-template.md).

The source environment in this tutorial is always a finance and operations apps environment in Lifecycle Services that was set up through the [Power Platform integration](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration).

Ensure that both the source and target environments are provisioned in the same region. For general information on copying environments, refer to [Copy an environment](../copy-environment.md).

## Prepare the source environment

Before the source environment can be copied, you must perform several steps to ensure that data and code copy correctly to the target environment.  Without performing these steps, code or data loss can occur. 

### Install or update the latest Dynamics 365 Finance and Operations Platform Tools app

> [!NOTE]
> This application is necessary in the source environment because it helps to store the X++ code in Microsoft Dataverse. This allows the code to copy to the target environment alongside the data.  Without this, data loss can occur.

1. In the Power Platform admin center, select **Environments**.
2. Select the source environment from which you want to start the copy. From the **Resources** menu, select **Dynamics 365 apps**.

:::image type="content" source="media/copy-to-ode-view-apps.png" alt-text="Viewing Dynamics 365 apps from the environment resources menu.":::

You should see **Dynamics 365 Finance and Operations Platform Tools** in the list of available apps.

If you see **Update Available** in the **Status** for Dynamics 365 Finance and Operations Platform Tools, select the link, agree to the terms, and select **Update**.

:::image type="content" source="media/copy-to-ode-platform-tools.png" alt-text="Dynamics 365 Finance and Operations platform tools showing an Update available status.":::

If Dynamics 365 Finance and Operations Platform Tools is not listed, select **Install App** to add this app to your organization.

From the list on the right side, find and select the **Dynamics 365 Finance and Operations Platform Tools** app, select **Install**, and follow the instructions to install.

:::image type="content" source="media/copy-to-ode-install-apps.png" alt-text="Install Dynamics 365 apps menu.":::

### Convert finance and operations apps packages to the new unified package format

This step is used to convert the existing **Software deployable package**, typically used by Lifecycle Services, into a new, unified, deployment package format. The package format is changed to align with other Dynamics 365 applications hosted by Microsoft Dataverse.

Run the following command using ModelUtil.exe from Windows PowerShell. You can find the .exe in PackagesLocalDirectoryDev/bin.

```PowerShell
.\ModelUtil.exe -convertToUnifiedPackage -file=<PathToYourPackage>.zip -outputpath=<OutputPath>
```

## Upload the unified deployable package to the source environment

This deploy command makes no changes to the finance and operations environment hosted in Lifecycle Services, nor does it require any downtime to apply this package on either the operations environment or the Dataverse environment. This is done to upload and save the customizations into Dataverse storage so they can be copied. 

1. Install [PAC CLI](https://aka.ms/PowerAppsCLI).
2. [Authenticate and connect to source Dataverse](../../developer/cli/reference/auth.md#pac-auth-create).
3. Run the following:

```
pac auth list
pac auth select --index 1
pac package deploy --logConsole --package <OutputPath>\<Package>.dll
```

# [Power Platform admin center](#tab/PPAC)

## Begin the copy operation

In the Power Platform admin center, go to the source environment you want to copy.  From there, select the **Copy** button in the top action pane.  In the slider window that appears, choose to copy **Everything**, which incorporates both the Dataverse and X++ source code, as well as the data from the source.  Select the **Target** environment to be the unified, developer environment.

# [PowerShell](#tab/PowerShell)

## Copy via PowerShell

Load the PowerShell console and execute the following commands to generate the environment. For more information on how to install and use the PowerShell module, see [Get started with PowerShell for Power Platform Administrators](../powershell-getting-started.md).

```PowerShell
#Install the module
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_Microsoft Entra ID"
$SPNId = "YOUR_AZURE_APPLICATION_REGISTRATION_CLIENT_ID"
$ClientSecret = "YOUR_AZURE_APPLICATION_CLIENT_SECRET"
$SourceEnvironmentID = "YOUR_SOURCE_ENVIRONMENT_ID_HERE"
$TargetEnvironmentID = "YOUR_TARGET_ENVIRONMENT_ID_HERE"

Write-Host "Creating a session against the Power Platform API"

Add-PowerAppsAccount -Endpoint prod -TenantID $TenantId -ApplicationId $SPNId -ClientSecret $ClientSecret

    $copyToRequest = \[pscustomobject\]@{
        SourceEnvironmentId = $SourceEnvironmentID
        TargetEnvironmentName = "Copied from source"
        CopyType = "FullCopy"
        SkipAuditData: true
    }

Copy-PowerAppEnvironment -EnvironmentName $TargetEnvironmentID -CopyToRequestDefinition $copyToRequest
```
---