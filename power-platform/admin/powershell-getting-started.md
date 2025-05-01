---
title: Programmability and Extensibility - PowerShell - Getting started | Microsoft Docs
description: PowerShell getting started with Microsoft Power Platform programmability tools.
author: laneswenka
ms.reviewer: sericks
ms.collection: get-started
ms.topic: reference
ms.date: 07/23/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Get started with PowerShell for Power Platform Administrators

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
PowerShell for Power Platform Administrators cmdlets are designed for managing and administering Microsoft Power Platform environments, Power Apps, and Power Automate flows. Use PowerShell for Power Platform Administrators when you want to build automated tools that interact with these resources. 

This article helps you get started with the PowerShell module and teaches the core concepts behind it.

## Installation
The easiest way to get started with the PowerShell module is by installing it on your local machine. Follow the instructions in [Installation](powershell-installation.md) to import the module, or to update an outdated version you might have installed previously.

## Sign in to Microsoft Power Platform
Sign in interactively with the Add-PowerAppsAccount cmdlet. 

```PowerShell
Add-PowerAppsAccount -Endpoint prod
```

Alternatively, you can sign in with a client ID and secret or certificate.  To do this, you need to [Create a service principal](powershell-create-service-principal.md).

```PowerShell
$appId = "CLIENT_ID_FROM_AZURE_APP"
$secret = "SECRET_FROM_AZURE_APP"
$tenantId = "TENANT_ID_FROM_AZURE_APP"

Add-PowerAppsAccount -Endpoint prod -TenantID $tenantId -ApplicationId $appId -ClientSecret $secret -Verbose
```

### Prerequisite
To perform the administration operations in the cmdlets, you'll need the following:

- Any of these roles from Microsoft Entra ID, Tenant admin, Power Platform administrator, Dynamics 365 Service Administrator, can access the Power Apps admin PowerShell cmdlets. These roles no longer require a Power Apps plan for administrative access to the Power Apps admin PowerShell cmdlets. However, these administrators need to sign in to the Power Platform admin center at least once before using the PowerShell cmdlets. If this isn't done, the cmdlets fail with an authorization error.

- Power Platform administrator or Dynamics 365 administrator permissions are required if you need to search through another user's resources. Note that environment admins only have access to those environments and environment resources for which they have permissions.

- For Dataverse for Teams environments, you must be a Power Platform administrator to manage environments from which you aren't the owner of the team in Microsoft Teams.
