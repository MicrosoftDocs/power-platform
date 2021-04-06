---
title: Programmability and Extensibility - PowerShell - Creating a service principal | Microsoft Docs
description: PowerShell for Power Platform Administrators and service principal authentication
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 03/19/2021
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Creating a service principal application via PowerShell
Authenticating via username and password is often not ideal, especially with the rise of multifactor authentication.  In such cases, service principal (or client credentials flow) authentication is preferred.

## Registering an admin management application
First, the client application needs to be registered in your Azure Active Directory (Azure AD) tenant.  To set this up, review the [Authentication](programmability-authentication.md) article for Power Platform APIs because the same application setup is required for PowerShell.

After your client application is registered in Azure AD, it also needs to be registered with Microsoft Power Platform.  Today, there's no way to do this via the Power Platform admin center; it must be done programmatically via Power Platform API or PowerShell for Power Platform administrators.  A service principal cannot register itself—by design, the application must be registered by an **administrator username and password context**.  This ensures that the application is created knowingly by someone who is an administrator for the tenant.

To register a new management application, use the following script:

```PowerShell
$appId = "CLIENT_ID_FROM_AZURE_APP"

# Login interactively with a tenant administrator for Power Platform
Add-PowerAppsAccount -Endpoint prod -TenantID $tenantId 

# Register a new application, this gives the SPN / client application same permissions as a tenant admin
New-PowerAppManagementApp -ApplicationId $appId
```
## Make requests as the service principal 
Now that it has been registered with Microsoft Power Platform, you can authenticate as the service principal itself.  Use the following script to query for your environment list:

```PowerShell
$appId = "CLIENT_ID_FROM_AZURE_APP"
$secret = "SECRET_FROM_AZURE_APP"
$tenantId = "TENANT_ID_FROM_AZURE_APP"

Add-PowerAppsAccount -Endpoint prod -TenantID $tenantId -ApplicationId $appId -ClientSecret $secret -Verbose
Get-AdminPowerAppEnvironment
```

## Limitations of service principals
Currently, service principal authentication works for environment management, tenant settings, and Power Apps management.  Any cmdlets related to Flow are not supported for this kind of authentication.  This support will be added in the future.
