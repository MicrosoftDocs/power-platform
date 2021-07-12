---
title: "Preview: Programmability and Extensibility - Power Platform API - 2021-02-01 - List environments | Microsoft Docs"
description: Power Platform API Reference - List environments
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 03/19/2021
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Preview: List environments

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can list environments for your tenant.

## Authentication

For more information about permissions and how to select them, see [Authentication](programmability-authentication.md).

## HTTP request

```http
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
GET https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/scopes/admin/environments?api-version=2020-10-01&$expand=properties.capacity,properties.addons
```

## Request headers

| Header         | Value                     |
|----------------|---------------------------|
| Authorization  | Bearer {token} (required) |
| Content-Type   | application/json          |

## Request body

Don't supply a request body for this method.

## Response

The response is always a **200 OK** response, unless you aren't correctly authenticated. 

## Example

```json
{
  "value": [
    {
      "id": "/providers/Microsoft.BusinessAppPlatform/scopes/admin/environments/5ca1c616-6060-46ba-abc1-18d312f1cb3a",
      "type": "Microsoft.BusinessAppPlatform/scopes/environments",
      "location": "unitedstates",
      "name": "5ca1c616-6060-46ba-abc1-18d312f1cb3a",
      "properties": {
        "azureRegion": "westus",
        "displayName": "My Power Platform Environment",
        "description": "This is my environment purpose description",
        "createdTime": "2020-10-22T04:38:17.8550157Z",
        "createdBy": {
          "id": "0f747967-84c4-4f29-84c2-682fb00390c8",
          "displayName": "ServicePrincipal",
          "type": "ServicePrincipal",
          "tenantId": "5ca1c616-6060-46ba-abc1-18d312f1cb3a"
        },
        "lastModifiedTime": "2021-02-22T18:38:08.4718532Z",
        "provisioningState": "Succeeded",
        "creationType": "User",
        "environmentSku": "Sandbox",
        "isDefault": false,
        "capacity": [
          {
            "capacityType": "Database",
            "actualConsumption": 1392.68,
            "ratedConsumption": 1392.68,
            "capacityUnit": "MB",
            "updatedOn": "2021-02-23T04:41:01Z"
          },
          {
            "capacityType": "File",
            "actualConsumption": 1567.697,
            "ratedConsumption": 1567.697,
            "capacityUnit": "MB",
            "updatedOn": "2021-02-23T04:41:01Z"
          },
          {
            "capacityType": "Log",
            "actualConsumption": 0,
            "ratedConsumption": 0,
            "capacityUnit": "MB",
            "updatedOn": "2021-02-23T04:41:01Z"
          }
        ],
        "addons": [
          {
            "addonType": "AppPass",
            "allocated": 1,
            "addonUnit": "Unit"
          },
          {
            "addonType": "PerFlowPlan",
            "allocated": 0,
            "addonUnit": "Unit"
          },
          {
            "addonType": "PortalViews",
            "allocated": 0,
            "addonUnit": "Unit"
          },
          {
            "addonType": "PortalLogins",
            "allocated": 0,
            "addonUnit": "Unit"
          },
          {
            "addonType": "AI",
            "allocated": 0,
            "addonUnit": "Unit"
          },
          {
            "addonType": "AppPassForTeams",
            "allocated": 0,
            "addonUnit": "Unit"
          },
          {
            "addonType": "PAUnattendedRPA",
            "allocated": 0,
            "addonUnit": "Unit"
          }
        ],
        "clientUris": {
          "admin": "https://admin.powerplatform.microsoft.com/environments/5ca1c616-6060-46ba-abc1-18d312f1cb3a/hub",
          "maker": "https://make.powerapps.com/environments/5ca1c616-6060-46ba-abc1-18d312f1cb3a/home"
        },
        "runtimeEndpoints": {
          "microsoft.BusinessAppPlatform": "https://unitedstates.api.bap.microsoft.com",
          "microsoft.CommonDataModel": "https://unitedstates.api.cds.microsoft.com",
          "microsoft.PowerApps": "https://unitedstates.api.powerapps.com",
          "microsoft.Flow": "https://unitedstates.api.flow.microsoft.com",
          "microsoft.PowerAppsAdvisor": "https://unitedstates.api.advisor.powerapps.com",
          "microsoft.ApiManagement": "https://management.usa.azure-apihub.net"
        },
        "databaseType": "CommonDataService",
        "linkedEnvironmentMetadata": {
          "resourceId": "3b48b422-0b37-4070-8054-601867eb8b23",
          "friendlyName": "My Power Platform Environment",
          "uniqueName": "96c28a9e98934bf798bb71c9d92134",
          "domainName": "org0fadb1dd",
          "version": "9.2.21013.00152",
          "instanceUrl": "https://org0fadb1dd.crm.dynamics.com/",
          "instanceApiUrl": "https://org0fadb1dd.api.crm.dynamics.com",
          "baseLanguage": 1033,
          "instanceState": "Ready",
          "createdTime": "2020-10-22T04:38:24.003Z",
          "backgroundOperationsState": "Enabled",
          "scaleGroup": "NAMCRMLIVESG644",
          "platformSku": "Standard"
        },
        "notificationMetadata": {
          "state": "NotSpecified",
          "branding": "NotSpecific"
        },
        "retentionPeriod": "P7D",
        "states": {
          "management": {
            "id": "Ready"
          },
          "runtime": {
            "id": "Enabled"
          }
        },
        "updateCadence": {
          "id": "Frequent"
        },
        "retentionDetails": {
          "retentionPeriod": "P7D",
          "backupsAvailableFromDateTime": "2021-02-16T05:42:52.2822636Z"
        },
        "protectionStatus": {
          "keyManagedBy": "Microsoft"
        },
        "cluster": {
          "number": "108"
        },
        "connectedGroups": []
      }
    }
  ]
}
```
