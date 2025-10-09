---
title: Programmability and Extensibility - Power Platform API - 2020-10-01 - List tenant settings (preview) 
description: Power Platform API Reference - List tenant settings
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 01/10/2025
ms.update-cycle: 180-days
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contributors:
- DBEKI 
- arjunmayur 
- bibekTimalsina948
- dannylevymsft
ms.contributors:
- pandeyashish
ms.collection: bap-ai-copilot
---

# List tenant settings (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

You can list settings applicable to your tenant.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Authentication

For more information about permissions and how to select them, go to [Authentication - legacy](programmability-authentication.md).

## HTTP request

```http
Authorization: Bearer eyJ0eXAiOi..
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
            "disableShareWithEveryone": true,
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
|walkMeOptOut| Boolean | This is a legacy setting that is no longer used by the platform. Default value is false.|
|disableNPSCommentsReachout| Boolean | Ability to disable re-surveying users who left prior feedback via NPS prompts in Power Platform. Default value is false.|
|disableNewsletterSendout | Boolean | Ability to disable the newsletter sendout feature. Default value is false.|
|disableEnvironmentCreationByNonAdminusers | Boolean | Restrict all environments to be created by tenant admins, Power Platform admins, or Dynamics 365 service admins. Default value is false.|
|disablePortalsCreationByNonAdminusers | Boolean | Restrict all portals to be created by tenant admins, Power Platform admins, or Dynamics 365 service admins. Default value is false.|
|disableSurveyFeedback | Boolean | Ability to disable all NPS survey feedback prompts in Power Platform. Default value is false.|
|disableTrialEnvironmentCreationByNonAdminusers | Boolean | Restrict all trial environments to be created by tenant admins, Power Platform admins, or Dynamics 365 service admins. Default value is false.|
|disableCapacityAllocationByEnvironmentAdmins | Boolean | Ability to disable capacity allocation by environment administrators. Default value is false.|
|disableSupportTicketsVisibleByAllUsers | Boolean | Allows users, who already have access to the **Support** page in Power Platform admin center, to see support requests created by other users in the tenant. Default value is True, which means this feature is turned off by default.|
|powerPlatform.search.disableDocsSearch | Boolean | When this setting is true, users in the environment can see a message that indicates Microsoft Learn and documentation search categories have been turned off by the administrator. Default value is false.|
|powerPlatform.search.disableCommunitySearch | Boolean | When this setting is true, users in the environment can see a message that indicates community and blog search categories have been turned off by the administrator. Default value is false.|
|powerPlatform.search.disableBingVideoSearch | Boolean | When this setting is true, users in the environment can see a message that indicates video search categories have been turned off by the administrator. Default value is false.|
|powerPlatform.powerApps.disableShareWithEveryone | Boolean | Ability to turn off the **Share with Everyone** capability for nonadmin users in all Power Apps. Default value is true.|
|powerPlatform.powerApps.enableCanvasAppInsights | Boolean | Allow users to collect telemetry data about their app in Azure Application Insights. Setting this to **False**  blocks the transmission of this data. |
|powerPlatform.powerApps.DisableConnectionSharingWithEveryone | Boolean | Gets or sets a value indicating whether non-admin users in the tenant can share connections with everyone. Default value is false. |
|powerPlatform.powerApps.enableGuestsToMake | Boolean | Ability to allow guest users in your tenant to create Power Apps. Default value is false.|
|powerPlatform.powerApps.disableMembersIndicator | Boolean | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.powerApps.disableMakerMatch | Boolean | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.powerApps.disableUnusedLicenseAssignment | Boolean | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.powerApps.disableCreateFromImage | Boolean | Allow people to use AI to generate an app based on an image. Default value is false.|
|powerPlatform.powerApps.disableCreateFromFigma | Boolean | Allow people to create a canvas app based on a Figma file. Default value is false.|
|powerPlatform.teamsIntegration.shareWithColleaguesUserLimit | Integer | Maximum value setting for the number of users in a security group used to share an app built using Power Apps on Microsoft Teams. Default value is 10000 but can be increased or decreased, as required.|
|powerPlatform.powerAutomate.disableCopilot | Boolean | Disables cloud flows copilot in Power Automate.<br><br>It doesn't control the ability to add AI-related connectors or actions in the flow designer. For example, the Skills connector or AI Builder creates text with a GPT action. Default value is false.|
|powerPlatform.powerAutomate.disableCopilotWithBing | Boolean | Disables the copilot-enhanced help feature within Power Automate to enhance answers on product documentation through Bing Search. Default value is false.|
|powerPlatform.powerAutomate.disableFlowRunResubmission | Boolean | When this setting is **True**, Power Automate cloud flows initiated using instant triggers can't utilize the flow run resubmission function to restart a previous flow run.  Default value is **True**.  Set the value to **False** to allow users to resubmit previous flow runs that were started with instant triggers.
|powerPlatform.environments.preferredEnvironmentLocation | String | Explicitly set the default location (Geo) for environments that are created without a location (Geo) specified. This includes Teams environments.|
|powerPlatform.environments.disablePreferredDataLocationForTeamsEnvironment | Boolean | Ignore the Teams group-preferred data location when provisioning a Teams environment. Default value is false.|
|powerPlatform.governance.disableAdminDigest | Boolean | Disables the weekly admin digest email for Managed Environments. Default value is false. |
|powerPlatform.governance.disableDeveloperEnvironmentCreationByNonAdminusers | Boolean | Restrict all developer environments to be created by tenant admins, Power Platform admins, or Dynamics 365 service admins. Default is false.|
|powerPlatform.governance.enableDefaultEnvironmentRouting | Boolean | Enables the Default Environment routing feature that creates personal, developer environments for new makers. Default value is false. |
|powerPlatform.governance.policy.enableDesktopFlowDataPolicyManagement | Boolean | When this setting is true, admins can view and manage desktop flow action groups in data policies in the Power Platform admin center. Default value is false.|
|powerPlatform.governance.policy.enableAzureCommercialConnectionsFromUsGov | Boolean | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.licensing.disableUseOfUnassignedAIBuilderCredits| Boolean | Ability to use unallocated AI Builder credits in environments without allocated credits. Default value is true. |
|powerPlatform.licensing.disableBillingPolicyCreationByNonAdminUsers | Boolean | This is a legacy setting that is no longer used by the platform. Default value is false.|
|powerPlatform.licensing.enableTenantCapacityReportForEnvironmentAdmins | Boolean | Ability to allow tenant, Power Platform, or Dynamics 365 admins to grant permissions to an environment administrator to view the **Capacity summary** tab. Default value is false.|
|powerPlatform.licensing.storageCapacityConsumptionWarningThreshold | INT | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.licensing.EnableTenantLicensingReportForEnvironmentAdmins | Boolean | Ability to allow tenant, Power Platform, or Dynamics 365 admins to grant permissions to an environment administrator to view the tenant-scoped license reports. Default value is false.|
|powerPlatform.licensing.ApplyAutoClaimToOnlyManagedEnvironments | Boolean | Allows admins to choose if the license autoclaim policies are applied on Managed Environments or all environments, including standard ones. Default is true.|
|powerPlatform.champions.disableChampionsInvitationReachout | Boolean | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.champions.disableSkillsMatchInvitationReachout | Boolean | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.intelligence.disableCopilot | Boolean | Allow canvas editors and admins to get AI-powered answers to how-to questions. Currently in preview. Default value is false.|
|powerPlatform.intelligence.enableOpenAiBotPublishing | Boolean | This setting isn't currently used by the platform but might be used in the future.|
|powerPlatform.intelligence.disableCopilotFeedback | Boolean | When using Copilot in Power Apps, allow users to submit feedback to Microsoft. Default value is false.|
|powerPlatform.intelligence.disableCopilotFeedbackMetadata | Boolean | When using Copilot in Power Apps, allow users to share their prompts, questions, and requests with Microsoft. Default value is true.|
|powerPlatform.modelExperimentation.enableModelDataSharing | Boolean | Ability to allow Microsoft to read Power Automate Copilot AI feature customer data (inputs and outputs) and provide improved models. Default value is false.|
|powerPlatform.modelExperimentation.disableDataLogging | Boolean | Ability to disable data logging and remove all data logged for Power Automate Copilot AI feature customer data (inputs and outputs). Default value is false.|
|powerPlatform.catalogSettings.powerCatalogAudienceSetting | Enum |This setting is reserved for future use. No enforcement is driven by this setting at the current time.|
|powerPlatform.gccCommercialSettings.disableGccCommercialAccess | Boolean |Turning on this setting allows connections to resources in Azure commercial that operate and send data outside the Power Platform US Government compliance boundary. This is specifically used to allow access to commercial resources from GCC cloud versions of Power Platform Connectors.|


[!INCLUDE[footer-include](../includes/footer-banner.md)]
