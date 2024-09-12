---
title: "Power Apps activity logging| MicrosoftDocs"
description: Activity logging for Power Apps 

ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/07/2023
author: Zeffin
ms.subservice: admin
ms.author: sericks 
ms.reviewer: sericks 
search.audienceType: 
  - admin
---
# Power Apps activity logging

Power Apps activities are tracked from the [Microsoft Purview compliance portal](/purview/purview). 

Follow these steps.

1. Sign in to the [Microsoft Purview compliance portal](https://compliance.microsoft.com) as a tenant admin.

2. Select **Search** > **Audit log search**. 

   > [!div class="mx-imgBorder"] 
   > ![Audit log search.](media/audit-log-search.png "Audit log search")

Within the **Audit log search** screen, Power Platform admins can search audit logs across many popular services including eDiscovery, Exchange, Power BI, Microsoft Entra ID, Microsoft Teams, customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), and Microsoft Power Apps.

Once the Audit log search screen is accessed, an administrator can filter for specific activities by pulling down the **Activities** dropdown and searching for **PowerApps app activities V2**.

## What events are audited
Logging takes place at the SDK layer which means a single action can trigger multiple events that are logged. The following are a sample of user events you can audit.

|Event  |Description  |
|---------|---------|
|CreatePowerApp   |When the app gets created for the first time by a maker |
|LaunchPowerApp    |When the app gets launched |
|MarkPowerAppAsFeatured   |Every time the app is marked as Featured|
|PromotePowerAppVersion   |The version of the app when restored|
|UpdatePowerApp    |Any updates made to the app by the maker|
|PublishPowerApp     |When the app is published and is made available to others in the environment|
|PowerAppPermissionEdited  |Every time a user's permissions to the app is changed|
|DeletePowerApp |When the app is deleted  |
|MarkPowerAppAsHero |Every time the app is marked as Hero  |
|PowerAppPermissionDeleted |Every time a user's permissions to the app is removed  |
|RemoveHeroApp  |Every time the app is unset as Hero |
|RemoveFeaturedApp    |Every time the app is unset as Featured  |
|PatchPowerApp   |Every time the app is patched|
|DeletePowerAppVersion   |The version of the app when deleted|
|RecordScopesConsent    | When the current user has consented to the application's APIs|
|ImportNewCanvasApp |Every time new canvas app is imported |
|ImportExistingCanvasApp   |Every time existing canvas app is imported |
|PublishSolutionCanvasAppVersion |When canvas app version from solution is published |
|AppDlpEvaluationResultChange | When DLP evaluation occurs for the App |
|AdminRestoreDeletePowerApp    |When the deleted app is restored by the admin|
|AdminSetAppDesiredLogicalName  |When the desired logical name of the app is set by the admin|
|AdminModifyAppOwner |When the app owner is modified by the admin  |
|AdminModifyAppPermissions |When the app permissions is modified by admin   |
|AdminDeleteApp |When the app is deleted by the admin |
|AdminQuarantineApp |When the quarantine state of the app is set by the admin|
|AdminSetAppConditionalAccess   |When the conditional access of the app is set by the admin|
|AdminSetAppBypassConsent |When the bypass consent state of the app is set by the admin|
|AdminSetAppAsFeatured |Every time the app is marked as Featured by the admin |
|AdminSetAllowedThirdPartyApps | When third party apps were allowed by the admin |


## Base schema
Schemas define which Power Apps fields are sent to the Microsoft Purview compliance portal.  Some fields are common to all applications that send audit data to Microsoft Purview, while others are specific to Power Apps. To identify Power Apps activities, look for schema property **powerplatform.analytics.resource.type** with value **PowerAppsApp**. Below is an example of the schema.

```
[
    {
        "Name": "powerplatform.analytics.resource.tenant.governance.api_policy.additional_resources",
        "Value": "<<json>>"
    },
    {
        "Name": "powerplatform.analytics.resource.display_name",
        "Value": "CreatePowerApp"
    },
    {
        "Name": "powerplatform.analytics.resource.id",
        "Value": "CreatePowerApp"
    },
    {
        "Name": "powerplatform.analytics.resource.type",
        "Value": "PowerAppsApp"
    },
    {
        "Name": "version",
        "Value": "1.0"
    },
    {
        "Name": "type",
        "Value": "PowerPlatformAdministratorActivityRecord"
    }
]

```

## Review your audit data using reports in Microsoft Purview compliance portal

You can review your audit data in the Microsoft Purview compliance portal. See [Search the audit log in the compliance Center](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide&preserve-view=true).

To use the preconfigured Power Apps reports, go to https://protection.office.com > **Search & investigation** > **Audit log search** and select the **Power Apps app activities** tab.

> [!div class="mx-imgBorder"] 
> ![Audit log search Power Apps.](media/audit-log-search-pa.png "Audit log search Power Apps")

### See also
 [Search the audit log in the compliance Center](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide&preserve-view=true)<br/>
 [Office 365 Management APIs overview](/office/office-365-management-api/office-365-management-apis-overview)<br/>
 [Permissions in the Security & Compliance Center](/office365/securitycompliance/permissions-in-the-security-and-compliance-center)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
