---
title: "Preview: Programmability and Extensibility - Power Platform API - 2020-10-01 - Create dataverse application user | Microsoft Docs"
description: Power Platform API Reference - Create dataverse application user
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 01/31/2022
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Preview: Create dataverse application user

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Using this endopint you can create an application user in a target Dataverse based environment.  Callers of this endpoint must either be Power Platform administrators, Global administrators, or a Power Platform Service Principal application.

## Authentication

For more information about permissions and how to select them, see [Authentication](programmability-authentication.md).

## HTTP request

```http
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
GET https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/scopes/admin/environments/{environmentIdGuid}/addAppUser?api-version=2020-10-01
```

## Request headers

| Header         | Value                     |
|----------------|---------------------------|
| Authorization  | Bearer {token} (required) |
| Content-Type   | application/json          |

## Request body

```json
{
  "servicePrincipalAppId": "AzureAD_App_Registration_ClientID"
}
```


## Response

The response is always a **200 OK** response, unless you aren't correctly authenticated. 

## Example

```json
{
  "servicePrincipalAppId": "9995c1c2-619a-4b72-9ee6-4c44f5f586c5"
}
```

After performing this action, you can confirm that the service principal from your AzureAD tenant was added to the Dataverse environment as an application user.  This can be validated by going to the Power Platform admin center under the specified environment -> **settings** -> **Application users**.  This always adds the application user as a System Administrator.
