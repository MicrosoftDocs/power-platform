---
title: "Create a Dataverse application user (preview) | Microsoft Docs"
description: Power Platform API Reference - Create a Dataverse application user
author: laneswenka
ms.reviewer: sericks
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 07/23/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Create a Dataverse application user (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use this endpoint to create an application user in a target environment.  Callers of this endpoint must either be Power Platform administrators or a Power Platform Service Principal application.

## Authentication

For more information about permissions and how to select them, see [Authentication - legacy](programmability-authentication.md).

## HTTP request

```http
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
POST https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/scopes/admin/environments/{environmentIdGuid}/addAppUser?api-version=2020-10-01
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

After performing this action, you can confirm that the service principal from your Microsoft Entra tenant was added to the environment as an application user. This can be validated by going to the Power Platform admin center, select **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Application users**. This always adds the application user as a System Administrator.





[!INCLUDE[footer-include](../includes/footer-banner.md)]
