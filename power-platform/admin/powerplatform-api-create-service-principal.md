---
title: "Creating a service principal application using API (preview) | Microsoft Docs"
description: Power Platform API and service principal authentication
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 05/30/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Creating a service principal application using API (preview) 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Authenticating via username and password is often not ideal, especially with the rise of multifactor authentication.  In such cases, service principal (or client credentials flow) authentication is preferred.  This can be done by both registering a new service principal application in your own Microsoft Entra tenant and then registering that same application with Power Platform.

## Registering an admin management application
First, the client application needs to be registered in your Microsoft Entra tenant.  To set this up, review the [Authentication](programmability-authentication.md) article for Power Platform APIs.  

After your client application is registered in Microsoft Entra ID, it also needs to be registered with Microsoft Power Platform.  Today, there's no way to do this via the Power Platform admin center; it must be done programmatically via Power Platform API or PowerShell for Power Platform administrators.  A service principal can't register itself—by design, the application must be registered by an administrator username and password context.  This ensures that the application is created by someone who is an administrator for the tenant.

To register a new management application, use the following Request with a bearer token obtained using username and password authentication:

```HTTP
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
PUT https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/adminApplications/{CLIENT_ID_FROM_AZURE_APP}?api-version=2020-10-01
```

## Make requests as the service principal 
Now that it has been registered with Microsoft Power Platform, you can authenticate as the service principal itself.  Use the following request to query for your management application list.  This can use a bearer token obtained using client credential authentication flow:

```HTTP
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
GET https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/adminApplications?api-version=2020-10-01
```

## Limitations of service principals
Currently, service principal authentication works for environment management, tenant settings, and Power Apps management.  APIs related to Flow are supported for service principal authentication in situations where a license isn't required, as it isn't possible to assign licenses to service principal identities in Microsoft Entra ID.

Service principal applications are treated within Power Platform similar to how normal users are with the Power Platform Administrator role assigned.  Granular roles and permissions can't be assigned to limit their capabilities.  The application doesn't get any special role assigned in Microsoft Entra ID, as this is how platform services treat requests made by service principals.