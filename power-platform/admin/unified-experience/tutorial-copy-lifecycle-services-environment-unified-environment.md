---
title: "Tutorial: Copy a Lifecycle Services environment to a unified environment  | Microsoft Docs"
description: This tutorial demonstrates how to perform environment copy with respect to unified environments.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 10/11/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Copy a Lifecycle Services environment to a unified environment 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Finance and operations apps have been reimagined as an application hosted by Microsoft Dataverse. A common function for administrators of finance and operations apps is to copy environments. Historically, this has been done in Microsoft Dynamics Lifecycle Services, but now everything can be managed in the Power Platform admin center.

In this tutorial, learn how to copy a Lifecycle Services environment to a unified environment.

As an example of this scenario, a customer who operates their finance and operations apps environments through the Lifecycle Services site today would like to copy their production environment data into their new, unified, developer environment in the Power Platform admin center.

## Before you begin

The target environment in this tutorial is always a unified environment that contains finance and operations apps hosted by Microsoft Dataverse. To learn how to deploy one of these environments, see [Tutorial: Provision a new environment with an ERP-based template ](./tutorial-deploy-new-environment-with-ERP-template.md).

The source environment in this tutorial is always a finance and operations apps environment in Lifecycle Services that was set up through the [Power Platform integration](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration).

Ensure that both the source and target environments are provisioned in the same region. For general information on copying environments, refer to [Copy an environment](../copy-environment.md).

# [Power Platform admin center](#tab/PPAC)

## Begin the copy operation

In the Power Platform admin center, go to the source environment you want to copy. From there, select the **Copy** button in the top action pane.  In the slider window that appears, choose to copy **Everything**, which incorporates both the Dataverse and X++ source code, and the data from the source. Select the **Target** environment to be the unified, developer environment.

# [PowerShell](#tab/PowerShell)

## Copy via PowerShell

Load the PowerShell console and execute the following commands to copy the environment. For more information on how to install and use the PowerShell module, see [Get started with PowerShell for Power Platform Administrators](../powershell-getting-started.md).

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
