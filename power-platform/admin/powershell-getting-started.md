---
title: Programmability and Extensibility - PowerShell - Getting started | Microsoft Docs
description: PowerShell getting started with Power Platform programmability tools.
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 02/22/2021
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Get started with PowerShell for Power Platform Administrators
PowerShell for Power Platform Administrators cmdlets are designed for managing and administering Power Platform environments, Power Apps, and Power Automate flows. Use PowerShell for Power Platform Administrators when you want to build automated tools that interact with these resources. 

This article helps you get started with the PowerShell module and teaches the core concepts behind it.

## Installation
The easiest way to get started with the PowerShell module is by installing it on your local machine. Follow the instructions in [Installation](powershell-installation.md) to import the module, or to update an outdated version you might have installed previously.

## Sign in to Power Platform
Sign in interactively with the Add-PowerAppsAccount cmdlet. 

```PowerShell
Add-PowerAppsAccount -Endpoint prod
```

Alternatively, you can sign in with a client ID and secret or certificate.  To do this, you will need to [Create a Service Principal](powershell-create-service-principal.md).

```PowerShell
$appId = "CLIENT_ID_FROM_AZURE_APP"
$secret = "SECRET_FROM_AZURE_APP"
$tenantId = "TENANT_ID_FROM_AZURE_APP"

Add-PowerAppsAccount -Endpoint prod -TenantID $tenantId -ApplicationId $appId -ClientSecret $secret -Verbose
```

### Prerequisite
To perform the administration operations in the cmdlets, you'll need the following:

A user with any of these roles, Global admins, Azure Active Directory Global admins, or Dynamics 365 admin, can access the Power Apps admin PowerShell cmdlets. These roles no longer require a Power Apps plan for administrative access to the Power Apps admin PowerShell cmdlets. However, these administrators need to sign in to the Power Platform admin center at least once before using the PowerShell cmdlets. If this is not done, the cmdlets will fail with an authorization error.

Microsoft 365 Global admin or an Azure Active Directory Global Administrator, or Dynamics 365 admin permissions if you need to search through another user's resources. Note that Environment Admins only have access to those environments and environment resources for which they have permissions.