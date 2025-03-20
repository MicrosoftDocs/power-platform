---
title: "Tutorial: Backup and restore unified environment  | Microsoft Docs"
description: This tutorial demonstrates how to perform environment backup and restore with respect to unified environments.
author: tapa
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/21/2024
ms.subservice: admin
ms.author: tapa
search.audienceType: 
  - admin
---

# Tutorial: Backup and restore unified environment

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Finance and operations apps are reimagined as an application hosted by Microsoft Dataverse. A common function for administrators of finance and operations apps is to take backup and restore those backups to unified environments. Historically, this kind of operation is performed in Microsoft Dynamics Lifecycle Services for finance and operations environments, but now for unified environments, everything can be managed in the Power Platform admin center.

In this tutorial, learn how to take backup of an environment and restore to a unified environment.

## Before you begin

The target environment in this tutorial is always a unified environment that contains finance and operations apps hosted by Microsoft Dataverse. To learn how to deploy one of these environments, see [Tutorial: Provision a new environment with an ERP-based template ](./tutorial-deploy-new-environment-with-ERP-template.md).

The source environment in this tutorial can either be a similar unified environment that contains finance and operations apps hosted by Microsoft Dataverse or a finance and operations apps environment in Lifecycle Services that was set up through the [Power Platform integration](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration).

Ensure that both the source and target environments are provisioned in the same region. For general information on backup and restore environments in power platform admin center, refer to [Back up and restore environments](../backup-restore-environments.md).

# [Power Platform admin center](#tab/PPAC)

## Begin the restore operation

In the Power Platform admin center, go to the source environment you want to take the back up or restore. From there, select the **Backup + Restore** button in the top action pane.  
To understand the system and manual backups and how to take manual backup, refer to [Back up and restore environments](../backup-restore-environments.md). 
To restore the environment, select **Restore or manage** option, and then choose the appropriate system or manual backup. Then select the **Target** environment to be the unified environment.

# [PowerShell](#tab/PowerShell)

## Backup via PowerShell

Load the PowerShell console and execute the following commands to backup the environment. For more information on how to install and use the PowerShell module, see [Get started with PowerShell for Power Platform Administrators](../powershell-getting-started.md).

```PowerShell
#Install the module
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_Microsoft Entra ID"
$SPNId = "YOUR_AZURE_APPLICATION_REGISTRATION_CLIENT_ID"
$ClientSecret = "YOUR_AZURE_APPLICATION_CLIENT_SECRET"
$EnvironmentID = "YOUR_ENVIRONMENT_ID_HERE"

Write-Host "Creating a session against the Power Platform API"

Add-PowerAppsAccount -Endpoint prod -TenantID $TenantId -ApplicationId $SPNId -ClientSecret $ClientSecret

    $backupRequest = \[pscustomobject\]@{
        Label = "this is a label"
        Notes = "this is a note"
    }

Backup-PowerAppEnvironment -EnvironmentName $EnvironmentID -BackupRequestDefinition $backupRequest
```

## Restore via PowerShell

Load the PowerShell console and execute the following commands to restore the environment. For more information on how to install and use the PowerShell module, see [Get started with PowerShell for Power Platform Administrators](../powershell-getting-started.md).

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

    $restoreRequest = \[pscustomobject\]@{
        SourceEnvironmentId = $SourceEnvironmentID
        TargetEnvironmentName = "Restored Environment"
        RestorePointDateTime = $datetime.ToString("yyyy-MM-dd HH:mm:ss")
        SkipAuditData: true
    }

Restore-PowerAppEnvironment -EnvironmentName $TargetEnvironmentID -RestoreToRequestDefinition $restoreRequest
```
---
