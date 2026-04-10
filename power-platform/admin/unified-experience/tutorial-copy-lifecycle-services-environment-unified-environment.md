---
title: "Tutorial: Copy a Lifecycle Services environment to a unified environment  | Microsoft Docs"
description: This tutorial demonstrates how to perform environment copy with respect to unified environments.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 04/10/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contributors:
  - tapas1447

---

# Tutorial: Copy a Lifecycle Services environment to a unified environment 

Finance and operations apps have been reimagined as an application hosted by Microsoft Dataverse. A common function for administrators of finance and operations apps is to copy environments. Historically, this has been done in Microsoft Dynamics Lifecycle Services, but now everything can be managed in the Power Platform admin center.

In this tutorial, learn how to copy a Lifecycle Services (LCS) environment to a unified environment.

As an example of this scenario, a customer who operates their finance and operations apps environments through the Lifecycle Services site today would like to copy their production environment data into their new, unified, developer environment in the Power Platform admin center.

## Before you begin

The target environment in this tutorial is always a unified environment that contains finance and operations apps hosted by Microsoft Dataverse. To learn how to deploy one of these environments, see [Tutorial: Provision a new environment with an ERP-based template ](./tutorial-deploy-new-environment-with-ERP-template.md).

The source environment in this tutorial is always a finance and operations apps environment in Lifecycle Services that was set up through the [Power Platform integration](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration).

Ensure that both the source and target environments are provisioned in the same region. For general information on copying environments, refer to [Copy an environment](../copy-environment.md).

## Copy options

When you copy an environment that contains finance and operations apps, you can configure the following options to control what data is included in the copy.

| Option | Description |
|--------|-------------|
| **Everything** | Copies all application data (both Dataverse and finance and operations data), users, customizations, and schemas from the source environment. This is the most common option for refreshing sandbox or developer environments from production. |
| **Customizations and schemas only** | Copies users, customizations, and schemas from the source environment, but doesn't copy application data. Use this option when you need a clean environment with your configuration but no production data. For a list of Dataverse tables truncated with this option, see [Copy an environment](../copy-environment.md). |
| **Transactionless copy** | Performs a full copy but truncates finance and operations transaction tables in the target environment after the copy completes, significantly reducing storage consumption. For detailed instructions, see [Tutorial: Perform a transaction-less copy between environments](./tutorial-perform-transactionless-copy.md). |
| **Skip audit data** | Excludes audit log data from the copy. Copying audit logs can significantly increase the time required to complete the operation. By default, audit data is skipped. |

> [!NOTE]
> When you combine these options, the **Transactionless copy** option applies only to an **Everything** copy. Selecting **Customizations and schemas only** already excludes all application data, so the transactionless option has no effect.

# [Power Platform admin center](#tab/PPAC)

## Begin the copy operation

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), go to the source environment you want to copy.
1. Select the **Copy** button in the command bar. The **Copy environment** pane is displayed.
1. Configure the following settings:
    - **Copy over**: Select **Everything** to copy all data, customizations, and schemas. Select **Customizations and schemas only** to copy the environment structure without application data.
    - **Transactionless Copy**: When copying **Everything**, this option appears and defaults to **Yes**. Set it to **No** if you need all transaction data in the target environment. For more information, see [Tutorial: Perform a transaction-less copy between environments](./tutorial-perform-transactionless-copy.md).
    - **Target**: Select the unified sandbox or developer environment to overwrite with the copy.
1. Select **Copy** to start the operation.

# [PowerShell](#tab/PowerShell)

## Copy via PowerShell

Load the PowerShell console and execute the following commands to copy the environment. For more information on how to install and use the PowerShell module, see [Get started with PowerShell for Power Platform Administrators](../powershell-getting-started.md).

### Everything copy (full copy)

```PowerShell
#Install the module
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell

# Set variables for your session
$TenantId = "YOUR_TENANT_GUID_FROM_Microsoft Entra ID"
$SourceEnvironmentID = "YOUR_SOURCE_ENVIRONMENT_ID_HERE"
$TargetEnvironmentID = "YOUR_TARGET_ENVIRONMENT_ID_HERE"

Write-Host "Creating a session against the Power Platform API"

Add-PowerAppsAccount -Endpoint prod -TenantID $TenantId

    $copyToRequest = \[pscustomobject\]@{
        SourceEnvironmentId = $SourceEnvironmentID
        TargetEnvironmentName = "Copied from source"
        CopyType = "FullCopy"
        SkipAuditData = $true
    }

Copy-PowerAppEnvironment -EnvironmentName $TargetEnvironmentID -CopyToRequestDefinition $copyToRequest
```

### Customizations and schemas only copy

```PowerShell
    $copyToRequest = \[pscustomobject\]@{
        SourceEnvironmentId = $SourceEnvironmentID
        TargetEnvironmentName = "Copied from source"
        CopyType = "MinimalCopy"
        SkipAuditData = $true
    }

Copy-PowerAppEnvironment -EnvironmentName $TargetEnvironmentID -CopyToRequestDefinition $copyToRequest
```

### Transactionless copy

```PowerShell
    $copyToRequest = \[pscustomobject\]@{
        SourceEnvironmentId = $SourceEnvironmentID
        TargetEnvironmentName = "Copied from source"
        CopyType = "FullCopy"
        SkipAuditData = $true
        ExecuteAdvancedCopyForFinanceAndOperations = $true
    }

Copy-PowerAppEnvironment -EnvironmentName $TargetEnvironmentID -CopyToRequestDefinition $copyToRequest
```

The following table describes each parameter in the copy request.

| Parameter | Description |
|-----------|-------------|
| `SourceEnvironmentId` | The environment ID of the source environment to copy from. |
| `TargetEnvironmentName` | A display name assigned to the target environment after the copy. |
| `CopyType` | Set to `"FullCopy"` for an **Everything** copy, or `"MinimalCopy"` for a **Customizations and schemas only** copy. |
| `SkipAuditData` | Set to `$true` to exclude audit logs from the copy (recommended). Set to `$false` to include audit logs, which increases copy duration. |
| `ExecuteAdvancedCopyForFinanceAndOperations` | Set to `$true` to perform a transactionless copy that truncates finance and operations transaction tables in the target environment after the copy completes. Only applies when `CopyType` is `"FullCopy"`. |

---

## Different copy or restore scenarios

| Source environment | Target environment                                              | Copy or restore supported |
|:------------------|:----------------------------------------------------------------|:------------------------|
| LCS sandbox                            | Power Platform admin center: Unified developer environment                              | Yes                     |
| LCS production                         | Power Platform admin center: Unified developer environment                              | Yes                     |
| LCS sandbox                            | Power Platform admin center: Unified sandbox environment                                | Yes                     |
| LCS cloud-hosted environment                             | Power Platform admin center: Any unified environment                                     | No                      |
| Power Platform admin center: Unified developer environment     | Power Platform admin center:  Unified sandbox environment                                | No                      |
| Power Platform admin center: Unified developer environment     | Power Platform admin center:  Unified production environment                             | No                      |
| Power Platform admin center: Unified sandbox environment       | Power Platform admin center:  Unified developer environment                              | Yes                     |
| Power Platform admin center: Unified production environment    | Power Platform admin center:  Unified developer environment                              | Yes                     |
| Power Platform admin center: Unified sandbox environment       | Power Platform admin center:  Unified production environment                             | No                      |
| Power Platform admin center: Unified production environment    | Power Platform admin center:  Unified sandbox environment                                | Yes                     |

### If the target environment isn't managed in the Power Platform admin center
If the target environment isn't managed in the Power Platform admin center, the copy operation is going to copy only Dataverse data, not finance and operations data.
