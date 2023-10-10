---
title: "Programmability and Extensibility - Power Platform API - 2020-10-01 - List tenant settings (preview) | Microsoft Docs"
description: Power Platform API Reference - List tenant settings
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 06/14/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contributors:
- bibekTimalsina948 
---

# List tenant settings (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can list settings applicable to your tenant.

## Authentication

For more information about permissions and how to select them, see [Authentication - legacy](programmability-authentication.md).

## HTTP request

```http
Authorization: Bearer eyJ0eXAiOi...
Host: api.bap.microsoft.com
Accept: application/json
POST https://api.bap.microsoft.com/providers/Microsoft.BusinessAppPlatform/listtenantsettings?api-version=2020-10-01
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
        },
        "modelExperimentation": {
            "enableModelDataSharing": false,
            "disableDataLogging": false
        },
        "catalogSettings": {
            "powerCatalogAudienceSetting": All
        }   
    }
}
```
## Definitions

| Property | Type | Description |
|----------|------|-------------|
|walkMeOptOut| Boolean | This is a legacy setting that is no longer used by the platform.  Default is false.|
|disableNPSCommentsReachout| Boolean | Ability to disable re-surveying users who left prior feedback via NPS prompts in Power Platform.  Default is false.|
|disableNewsletterSendout | Boolean | Ability to disable the newsletter sendout feature. Default is false.|
|disableEnvironmentCreationByNonAdminusers | Boolean | Restrict all environments to be created by Tenant Admins, Power Platform Admins, or Dynamics365 Service Admins.  Default is false.|
|disablePortalsCreationByNonAdminusers | Boolean | Restrict all portals to be created by Tenant Admins, Power Platform Admins, or Dynamics365 Service Admins.  Default is false.|
|disableSurveyFeedback | Boolean | Ability to disable all NPS survey feedback prompts in Power Platform.  Default is false.|
|disableTrialEnvironmentCreationByNonAdminusers | Boolean | Restrict all trial environments to be created by Tenant Admins, Power Platform Admins, or Dynamics365 Service Admins.  Default is false.|
|disableCapacityAllocationByEnvironmentAdmins | Boolean | Ability to disable capacity allocation by environment administrators. Default is false.|
|disableSupportTicketsVisibleByAllUsers | Boolean | Ability to disable support ticket creation by non-admin users in the tenant. Default is false.|
|powerPlatform.search.disableDocsSearch | Boolean | When this setting is true, users in the environment will see a message that Microsoft Learn and Documentation search categories have been turned off by the administrator in the search results page.  Default is false.|
|powerPlatform.search.disableCommunitySearch | Boolean | When this setting is true, users in the environment will see a message that Community and Blog search categories have been turned off by the administrator in the search results page.  Default is false.|
|powerPlatform.search.disableBingVideoSearch | Boolean | When this setting is true, users in the environment will see a message that Video search categories have been turned off by the administrator in the search results page.  Default is false.|
|powerPlatform.powerApps.disableShareWithEveryone | Boolean | Ability to disable the Share With Everyone capability for non-admin users in all Power Apps.  Default is false.|
|powerPlatform.powerApps.enableGuestsToMake | Boolean | Ability to allow guest users in your tenant to create Power Apps.  Default is false.|
|powerPlatform.powerApps.disableMembersIndicator | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.powerApps.disableMakerMatch | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.powerApps.disableUnusedLicenseAssignment | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.powerApps.disableCreateFromImage | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.powerApps.disableCreateFromFigma | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.powerApps.disableConnectionSharingWithEveryone | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.teamsIntegration.shareWithColleaguesUserLimit | Integer | Maximum value setting for the number of users in a security group used to share an app built using Power Apps on Microsoft Teams.  Default is 10000 but can be increased or decreased as required.|
|powerPlatform.powerAutomate.disableCopilot | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.powerAutomate.disableCopilotWithBing | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.environments.preferredEnvironmentLocation | String | Explicitly set the default location (Geo) for environments that are created without a location (Geo) specified. This includes Teams environments.|
|powerPlatform.environments.disablePreferredDataLocationForTeamsEnvironment | Boolean | Ignore the Teams group preferred data location when provisioning a Teams environment. Default is false.|
|powerPlatform.governance.disableAdminDigest | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.governance.disableDeveloperEnvironmentCreationByNonAdminusers | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.governance.enableDefaultEnvironmentRouting | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.governance.policy.enableDesktopFlowDataPolicyManagement | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.governance.policy.enableAzureCommercialConnectionsFromUsGov | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.licensing.disableUseOfUnassignedAIBuilderCredits| Boolean | Ability to use unallocated AI Builder credits in environments without allocated credits. Default is true. |
|powerPlatform.licensing.disableBillingPolicyCreationByNonAdminUsers | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.licensing.enableTenantCapacityReportForEnvironmentAdmins | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.licensing.storageCapacityConsumptionWarningThreshold | INT? | NEEDS DESCRIPTION.|
|powerPlatform.licensing.EnableTenantLicensingReportForEnvironmentAdmins | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.licensing.ApplyAutoClaimToOnlyManagedEnvironments | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.champions.disableChampionsInvitationReachout | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.champions.disableSkillsMatchInvitationReachout | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.intelligence.disableCopilot | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.intelligence.enableOpenAiBotPublishing | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.intelligence.disableCopilotFeedback | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.intelligence.disableCopilotFeedbackMetadata | Boolean | NEEDS DESCRIPTION.|
|powerPlatform.modelExperimentation.enableModelDataSharing | Boolean | Ability to allow Microsoft to read Power Automate Copilot AI feature customer data (inputs and outputs) and provide improved models.  Default is false.|
|powerPlatform.modelExperimentation.disableDataLogging | Boolean | Ability to disable data logging and remove all data logged for Power Automate Copilot AI feature customer data (inputs and outputs).  Default is false.|
|powerPlatform.catalogSettings.powerCatalogAudienceSetting | Enum |This setting is reserved for future use. No enforcement is driven by this setting at the current time.|


[!INCLUDE[footer-include](../includes/footer-banner.md)]
