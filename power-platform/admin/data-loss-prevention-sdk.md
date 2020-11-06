---
title: "DLP SDK | MicrosoftDocs"
description: Power Platform data loss prevention (DLP) SDK
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/09/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Power Platform data loss prevention (DLP) SDK 

This topic introduces the capabilities of the DLP SDK and shows you how DLP can help you manage your tenant and environment policy with experiences ranging from creating, reading, updating, to removing DLP policies. More information : [Data loss prevention policies](wp-data-loss-prevention.md)

## How to run this sample

1. Download or clone the [Samples repo](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/admin-center) so that you have a local copy.

2. Open **PowerShell ISE** as an admin.

3. Run the following command:

    ```powershell
    Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force
    ```

4. Edit RunSamples.ps1 and make the following changes:
   - Replace $TenantAdminName value with your tenant admin account
   - Replace $TenantAdminPassword value with your tenant admin account password
   - Replace $EnvironmentAdminName value with your environment admin account
   - Replace $EnvironmentAdminPassword value with your environment admin account password

   Note: the tenant admin account should not be used as an environment admin account.

5. Run RunSamples.ps1.

## What this sample does

This sample calls DLP APIs in Microsoft.PowerApps.Administration.PowerShell to create, read, update and remove DLP policies. Below are the scenarios supported by the SDK.

1. Create a tenant-level policy that classifies connectors into **Business**, **Non-business**, and **Blocked** groups. 
2. Create policy for all environments except certain environments that classifies connectors into **Business**, **Non-business**, and **Blocked** groups. 
3. Create policy for single environment that classifies connectors into **Business**, **Non-business**, and **Blocked** groups. 
4. Get list of tenant-level policies (all environments). 
5. Update policy to move connector across groups (**Business**, **Non-business**, and **Blocked**). 
6. Test compatibility of existing policies that previously used legacy powershell APIs and now use new PowerShell APIs. 

## How this sample works

This sample provides some DLP scenarios about how to call DLP APIs for your reference. You can run the sample and see the result.

