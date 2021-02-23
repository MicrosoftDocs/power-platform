---
title: Programmability and Extensibility - PowerShell - Creating a service princpal | Microsoft Docs
description: PowerShell for Power Platform Administrators and service principal authentication.
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

# Creating a service principal application via PowerShell
Often times authenticating via username and password is not ideal, especially with the rise of Multi-factor authentication (MFA).  In such cases, Service Principal ( or client credentials flow ) authentication is preferred.

## Registering an admin management application
First and foremost, the client application needs to be registered in your Azure Active Directory tenant.  To get this setup, review the [Authentication](linkhere.co) article for Power Platform APIs as the same application setup is required for PowerShell.

After your client application is registered in Azure Active Directory, it also needs to be registered with Power Platform.  Today, there is no way to do this via the Power Platform admin center, it must be done programmatically via Power Platform API or PowerShell for Power Platform Administrators.  A Service Principal cannot register itself, by design the application must be registered by an administrator username and password context.  This ensures that the application is created knowingly by someone who is an administrator for the tenant.

To register a new management application, use the following script:
```PowerShell
$appId = "CLIENT_ID_FROM_AZURE_APP"

# Login interactively with a tenant administrator for Power Platform
Add-PowerAppsAccount -Endpoint prod -TenantID $tenantId 

# Register a new application, this gives the SPN / client application same permissions as a tenant admin
New-PowerAppManagementApp -ApplicationId $appId
```
## Make requests as the service principal 
Now that it has been registered with Power Platform, you can authenticate as the service principal itself.  Use the below script to query for your environment list:

```PowerShell
$appId = "CLIENT_ID_FROM_AZURE_APP"
$secret = "SECRET_FROM_AZURE_APP"
$tenantId = "TENANT_ID_FROM_AZURE_APP"

Add-PowerAppsAccount -Endpoint prod -TenantID $tenantId -ApplicationId $appId -ClientSecret $secret -Verbose
Get-AdminPowerAppEnvironment
```

## Limitations of Service Principals
As of now, Service Principal authentication works for Environment management, Tenant settings, andPower App management.  Any cmdlets related to Flow are not supported for this kind of authentication.  This support will be added in the future.