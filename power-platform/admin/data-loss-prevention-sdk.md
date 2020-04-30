---
title: "DLP SDK | MicrosoftDocs"
description: Power Platform Data Loss Prevention (DLP) SDK
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/05/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Power Platform Data Loss Prevention (DLP) SDK 

This topic introduces the capabilities of the DLP SDKs and shows you how DLP can help you manage your tenant and environment policy with experiences ranging from creating, reading, updating, to removing DLP policies. More information : [Data loss prevention policies](wp-data-loss-prevention.md).

## What this sample does

This sample calls DLP APIs in Microsoft.PowerApps.Administration.PowerShell to create, read, update and remove DLP policy.

## How this sample works

This sample provides some DLP scenarios about how to call DLP APIs for your reference. You can run the sample and see the result.

## How to run this sample

https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/admin-center

1. Install the latest package (your powershell should be run as Admin): <br/>
   `Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force`
2. Edit RunSamples.ps1 and make the following changes:
   - Replace $TenantAdminName value to your tenant admin account
   - Replace $TenantAdminPassword value to your tenant admin account password
   - Replace $EnvironmentAdminName value to your environment admin account
   - Replace $EnvironmentAdminPassword value to your environment admin account password
3. RunSamples.ps1

