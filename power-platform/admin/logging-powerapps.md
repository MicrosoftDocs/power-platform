---
title: Power Apps activity logging
description: Activity logging for Power Apps 
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/30/2024
author: amchern
ms.subservice: admin
ms.author: amchern 
ms.reviewer: sericks 
search.audienceType: 
  - admin
---

# Power Apps activity logging

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Apps activities are tracked from the [Microsoft Purview compliance portal](/purview/purview). 

Follow these steps.

1. Sign in to the [Microsoft Purview compliance portal](https://compliance.microsoft.com) as a tenant admin.

2. Select **Search** > **Audit log search**. 

   > [!div class="mx-imgBorder"] 
   > ![Audit log search.](media/audit-log-search.png "Audit log search")

Within the **Audit log search** screen, Power Platform admins can search audit logs across many popular services including eDiscovery, Exchange, Power BI, Microsoft Entra ID, Microsoft Teams, customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), and Microsoft Power Apps.

Once the **Audit log search** screen is accessed, an administrator can filter for specific activities by pulling down the **Activities** dropdown and searching for **PowerApps app activities V2**.

## What events are audited
Logging takes place at the SDK layer, which means a single action can trigger multiple events that are logged. The following are a sample of user events you can audit.

|Event  |Description  |
|---------|---------|
|Created app   |When the app gets created for the first time by a maker |
|Launched app    |When the app gets launched |
|Marked app as Featured   |Every time the app is marked as Featured|
|Restored app version   |The version of the app when restored|
|Edited app    |Any updates made to the app by the maker|
|Published app     |When the app is published and is made available to others in the environment|
|Edited app permission  |Every time a user's permissions to the app is changed|
|Deleted app |When the app is deleted  |
|Marked app as Hero |Every time the app is marked as Hero  |
|Deleted app permission |Every time a user's permissions to the app is removed  |
|Removed app as Hero  |Every time the app is unset as Hero |
|Removed app as Featured    |Every time the app is unset as Featured  |
|Patched app   |Every time the app is patched|
|Deleted app version   |The version of the app when deleted|
|Consented to the app's APIs    | When the current user has consented to the application's APIs|
|Imported new canvas app |Every time new canvas app is imported |
|Imported existing canvas app   |Every time existing canvas app is imported |
|Published solution canvas app version |When canvas app version from solution is published |
|Added DataLossPreventionEvaluationResult | When data policy evaluation occurs for the App |
|Admin restored deleted app    |When the deleted app is restored by the admin|
|Admin set desired logical name  |When the desired logical name of the app is set by the admin|
|Admin modified app owner |When the app owner is modified by the admin  |
|Admin modified app permissions |When the app permissions are modified by admin   |
|Admin deleted app |When the app is deleted by the admin |
|Admin set quarantine state |When the quarantine state of the app is set by the admin|
|Admin set conditional access   |When the conditional access of the app is set by the admin|
|Admin set bypass consent state |When the bypass consent state of the app is set by the admin|
|Admin set app as featured |Every time the app is marked as Featured by the admin |
|Admin allowed third party apps | When third party apps were allowed by the admin |

## Schema
Schemas define which Power Apps fields are sent to the Microsoft Purview compliance portal.  Some fields are common to all applications that send audit data to Microsoft Purview, while others are specific to Power Apps activities. The value in the **PropertyCollection** field is specific to each Power Apps activity type. To identify Power Apps activities, look for nested schema property **powerplatform.analytics.resource.type** with value **PowerApp** within the **PropertyCollection** property. Below is an example of the activity-specific schema.

```
[
    {
        "Name": "powerplatform.analytics.resource.power_app.display_name",
        "Value": "Test canvas app"
    },
    {
        "Name": "powerplatform.analytics.resource.power_app.id",
        "Value": "a81399c4-8e32-4460-b0d6-69d7d6c404e5"
    },
    {
        "Name": "powerplatform.analytics.resource.environment.name",
        "Value": "Contoso (default)"
    },
    {
        "Name": "powerplatform.analytics.resource.environment.id",
        "Value": "default-99ca106f-36df-429e-9998-b6131ea7cc86"
    },
    {
        "Name": "version",
        "Value": "1.0"
    },
    {
        "Name": "type",
        "Value": "PowerPlatformAdministratorActivityRecord"
    },
    {
        "Name": "powerplatform.analytics.operation.is_successful",
        "Value": "True"
    },
    {
        "Name": "powerplatform.analytics.resource.telemetry_correlation.id",
        "Value": "8c423c52-ebc3-47b5-a604-a8b98bbce92a"
    },
    {
        "Name": "enduser.ip_address",
        "Value": "::ffff:172.172.34.12"
    },
    {
        "Name": "user_agent.original",
        "Value": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0"
    },
    {
        "Name": "powerplatform.analytics.resource.type",
        "Value": "PowerApp"
    },
    {
        "Name": "powerplatform.analytics.activity.name",
        "Value": "AdminDeleteApp"
    },
    {
        "Name": "powerplatform.analytics.activity.id",
        "Value": "f88c7b59-6908-4f40-8489-7eca71b531b0"
    },
    {
        "Name": "enduser.id",
        "Value": "e5568c4f-015e-49d6-bf04-16c14301e9a3"
    },
    {
        "Name": "enduser.principal_name",
        "Value": "admin@M365DS679477.onmicrosoft.com"
    },
    {
        "Name": "enduser.role",
        "Value": "Admin"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.id",
        "Value": "99ca106f-36df-429e-9998-b6131ea7cc86"
    }
]

```

## Review your audit data using reports in Microsoft Purview compliance portal

You can review your audit data in the Microsoft Purview compliance portal. See [Search the audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide&preserve-view=true).

To use the preconfigured Power Apps reports, go to https://protection.office.com > **Search & investigation** > **Audit log search** and select the **Power Apps app activities** tab.

> [!div class="mx-imgBorder"] 
> ![Audit log search Power Apps.](media/audit-log-search-pa.png "Audit log search Power Apps")

### Related information
 [Search the audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide&preserve-view=true)<br/>
 [Office 365 Management APIs overview](/office/office-365-management-api/office-365-management-apis-overview)<br/>
 [Permissions in the Security & Compliance Center](/office365/securitycompliance/permissions-in-the-security-and-compliance-center)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
