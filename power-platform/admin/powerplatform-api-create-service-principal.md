---
title: Programmability and Extensibility - Power Platform API - Creating a service princpal | Microsoft Docs
description: Power Platform API and service principal authentication.
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

# Creating a service principal application via API
Often times authenticating via username and password is not ideal, especially with the rise of Multi-factor authentication (MFA).  In such cases, Service Principal ( or client credentials flow ) authentication is preferred.

## Registering an admin management application
First and foremost, the client application needs to be registered in your Azure Active Directory tenant.  To get this setup, review the [Authentication](linkhere.co) article for Power Platform APIs as the same application setup is required for PowerShell.

After your client application is registered in Azure Active Directory, it also needs to be registered with Power Platform.  Today, there is no way to do this via the Power Platform admin center, it must be done programmatically via Power Platform API or PowerShell for Power Platform Administrators.  A Service Principal cannot register itself, by design the application must be registered by an administrator username and password context.  This ensures that the application is created knowingly by someone who is an administrator for the tenant.

To register a new management application, use the following Request with a bearer token obtained usering username and password authentication:
```HTTP
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
PUT https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/adminApplications/{CLIENT_ID_FROM_AZURE_APP}?api-version=2021-02-01
```
## Make requests as the service principal 
Now that it has been registered with Power Platform, you can authenticate as the service principal itself.  Use the below request to query for your management application list.  This can use a bearer token obtained using client credential authentication flow:

```HTTP
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
GET https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/adminApplications?api-version=2021-02-01
```

## Limitations of Service Principals
As of now, Service Principal authentication works for Environment management, Tenant settings, andPower App management.  Any APIs related to Flow are not supported for this kind of authentication.  This support will be added in the future.