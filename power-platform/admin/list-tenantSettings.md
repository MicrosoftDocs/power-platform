---
title: "Preview: Programmability and Extensibility - Power Platform API - 2020-10-01 - List tenant settings | Microsoft Docs"
description: Power Platform API Reference - List tenant settings
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 09/01/2021
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Preview: List tenant settings

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can list settings applicable to your tenant.

## Authentication

For more information about permissions and how to select them, see [Authentication](programmability-authentication.md).

## HTTP request

```http
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
GET https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/listtenantsettings?api-version=2020-10-01
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
    "walkMeOptOut": false,
    "disableNPSCommentsReachout": false,
    "disableNewsletterSendout": false,
    "disableEnvironmentCreationByNonAdminUsers": false,
    "disablePortalsCreationByNonAdminUsers": false,
    "disableSurveyFeedback": false,
    "disableTrialEnvironmentCreationByNonAdminUsers": false,
    "disableCapacityAllocationByEnvironmentAdmins": false,
    "disableSupportTicketsVisibleByAllUsers": false,
    "powerPlatform": {
        "search": {
            "disableDocsSearch": false,
            "disableCommunitySearch": false,
            "disableBingVideoSearch": false
        },
        "teamsIntegration": {
            "shareWithColleaguesUserLimit": 10000
        },
        "powerApps": {
            "disableShareWithEveryone": false,
            "enableGuestsToMake": false
        }
    }
}
```
## Definitions

| Property | Type | Description |
|----------|------|-------------|
|walkMeOptOut| Boolean | Ability to opt out of guided experiences using WalkMe in Power Platform.  Default is false.|
|disableNPSCommentsReachout| Boolean | Ability to disable re-surveying users who left prior feedback via NPS prompts in Power Platform.  Default is false.|
|disableNewsletterSendout | Boolean | XX|
|disableEnvironmentCreationByNonAdminusers | Boolean | Restrict all environments to be created by Tenant Admins, Power Platform Admins, or Dynamics365 Service Admins.  Default is false.|
|disablePortalsCreationByNonAdminusers | Boolean | Restrict all portals to be created by Tenant Admins, Power Platform Admins, or Dynamics365 Service Admins.  Default is false.|
|disableSurveyFeedback | Boolean | Ability to disable all NPS survey feedback prompts in Power Platform.  Default is false.|
|disableTrialEnvironmentCreationByNonAdminusers | Boolean | Restrict all trial environments to be created by Tenant Admins, Power Platform Admins, or Dynamics365 Service Admins.  Default is false.|
|disableCapacityAllocationByEnvironmentAdmins | Boolean | XX|
|disableSupportTicketsVisibleByAllUsers | Boolean | XX|
|powerPlatform.search.disableDocsSearch | Boolean | XX|
|powerPlatform.search.disableCommunitySearch | Boolean | XX|
|powerPlatform.search.disableBingVideoSearch | Boolean | XX|
|powerPlatform.teamsIntegration.shareWithColleaguesUserLimit | Integer | XX|
|powerPlatform.powerApps.disableShareWithEveryone | Boolean | Ability to disable the SHare With Everyone capability in all Power Apps.  Default is false.|
|powerPlatform.powerApps.enableGuestsToMake | Boolean | Ability to allow guest users in your tenant to create Power Apps.  Default is false.|
