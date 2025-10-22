---
title: "Tutorial: Perform a transaction-less copy between environments"
description: This tutorial demonstrates how to perform a transaction-less copy between unified environments.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 04/01/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contirubutors:
  - tapas1447 
---

# Tutorial: Perform a transaction-less copy between environments 

Environment copy for finance and operations apps has traditionally been a full copy, meaning it includes the entire database worth of configuration, master data, and transactions.  While helpful for debugging specific situations, this full copy has a side effect of significantly increasing the storage consumption for both finance and operations apps and Dataverse.  

:::image type="content" source="media/transactionless-copy-process.png" alt-text="Diagram of the copy process.":::

In this tutorial, learn how to:

- Prepare the source environment
- Copy the environment to the target

As an example of this scenario, assume that a customer would like to reduce their storage consumption on their sandbox and unified developer environments, where there's no need for having 100% of the transactions from production. To achieve this reduction, the customer copies their production environment directly to their unified, developer environment and specifies that transactions are to be skipped.

## Before you begin

The target environment in this tutorial is always a unified environment that contains finance and operations apps hosted by Dataverse. To learn how to deploy one of these environments, go to [Tutorial: Provision a new environment with an ERP-based template ](./tutorial-deploy-new-environment-with-ERP-template.md).

The source environment in this tutorial can either be an environment controlled by Lifecycle Services, or it can be another unified environment hosted by Dataverse.  

- Be sure that both the source and target environments are provisioned in the same region. 
- For general information on copying environments, go to [Copy an environment](../copy-environment.md).
- For general information on copying unified environments, go to [Copy a unified environment](../unified-experience/tutorial-copy-lifecycle-services-environment-unified-environment.md).

### Transactional tables
To ensure that the resulting environment is still functional after the copy is completed, all of the transactional tables must be cleared together. Due to the highly normalized schema of finance and operations apps, skipping even one table in a joined relationship could result in breaking behavior in the user interface and in business logic after the copy finishes.  

By using metadata present on the X++ tables, all transaction tables and their related tables can be truncated as part of transaction-less copy. This includes custom tables and ISV-sourced tables as long as the **Table Group** property is one of the following:

- Transaction (4)
- WorksheetHeader (5)
- WorksheetLine (6)
- Worksheet (9)
- TransactionHeader (10)
- TransactionLine (11)
- Staging (12)

# [Power Platform admin center](#tab/PPAC)

## Begin the transactionless copy operation

In the Power Platform admin center, go to the source environment you want to copy. From there, select the **Copy** button in the command bar. In the window that appears, there's an option, **Transactionless Copy**, which by default is set to **Yes**, as shown in the image.

:::image type="content" source="media/transactionless-copy-for-unified-environments.png" alt-text="Diagram for transactionless copy option.":::

If you want transactions to be copied over to the target environment, change this option to **No**, as shown in the image.

:::image type="content" source="media/disable-transactionless-copy-for-unified-environments.png" alt-text="Diagram for disabling transactionless copy.":::

# [PowerShell](#tab/PowerShell)

## Transactionless copy through PowerShell

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
        SkipAuditData = true
        ExecuteAdvancedCopyForFinanceAndOperations = true
    }

Copy-PowerAppEnvironment -EnvironmentName $TargetEnvironmentID -CopyToRequestDefinition $copyToRequest
```
This PowerShell command executes a full copy between the source and the target environment, allowing for the code, software, master, and reference data to be copied. The transaction tables are then truncated before the environment is made available to the administrator.
