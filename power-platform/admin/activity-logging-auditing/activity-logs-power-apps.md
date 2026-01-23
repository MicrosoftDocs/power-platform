---
title: View Power Apps activity logs in Microsoft Purview
description: Learn how to access Power Apps activity logs in Microsoft Purview and explore what canvas apps activities you can view. 
ms.component: pa-admin
ms.topic: how-to
ms.date: 01/22/2026
author: grbarker
ms.subservice: admin
ms.author: grbarker
contributors:
  - amchern 
  - EllenWehrle 
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# View Power Apps activity logs in Microsoft Purview

You can view many Microsoft Power Apps activities in Microsoft Purview, such as:

- canvas app creation
- usage
- patching
- deletion by specific users

You can also view activity logs within specific date ranges to gain insights.

Regularly view Microsoft Power Apps activities in Microsoft Purview to:

- maintain governance, compliance, and security
- gain operational insights
- identify and troubleshoot problems
- mitigate failures

This article covers prerequisites, how to access your data in Microsoft Purview's compliance portal, and details about Power Apps events and schema.

## Prerequisites

To view Power Apps activity logs in Microsoft Purview, make sure you:

- Review and complete all the [prerequisites](activity-logs-overview.md#prerequisites) in the overview article.
- Are an admin with a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Are assigned either the *Audit Logs* or *View-Only Audit Logs* role in Microsoft Purview.

Learn more:

- [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)
- [Auditing overview](/power-apps/developer/data-platform/auditing/overview)
- [Learn more about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]

## Explore Power Apps activities

The SDK layer handles logging. A single action can trigger multiple events that the system logs. The following table lists a sample of user events you can audit.

|**Event**  |**Description**  |
|---------|---------|
|Created app   |A maker creates the app for the first time. |
|Launched app    |The app is launched. |
|Marked app as Featured   |Every time the app is marked as *Featured*.|
|Restored app version   |The version of the app when restored.|
|Edited app    |Any updates the maker makes to the app.|
|Published app     |The app is published and is made available to others in the environment.|
|Edited app permission  |Every time a user's permissions to the app change.|
|Deleted app |When the app is deleted. |
|Marked app as Hero |Every time the app is marked as *Hero*.  |
|Deleted app permission |Every time a user's permissions to the app are removed.  |
|Removed app as Hero  |Every time the app is unset as *Hero*. |
|Removed app as Featured    |Every time the app is unset as *Featured*.  |
|Patched app   |Every time the app is patched.|
|Deleted app version   |The version of the app when deleted.|
|Consented to the app's APIs    | The current user consents to the application's APIs.|
|Imported new canvas app |Every time a new canvas app is imported. |
|Imported existing canvas app   |Every time an existing canvas app is imported. |
|Published solution canvas app version |A canvas app version from solution is published. |
|Added `DataLossPreventionEvaluationResult` | The data policy evaluation occurs for the app. |
|Admin restored deleted app    |The admin restores the deleted app.|
|Admin set desired logical name  |The admin sets the desired logical name of the app.|
|Admin modified app owner |The admin modifies the app owner.  |
|Admin modified app permissions |The admin modifies the app permissions.   |
|Admin deleted app |The admin deletes the app. |
|Admin set quarantine state |The admin sets the quarantine state of the app.|
|Admin set conditional access   |The admin sets the conditional access of the app.|
|Admin set bypass consent state |The admin sets the bypass consent state of the app.|
|Admin set app as featured |Every time the admin marks the app as *Featured*. |
|Admin allowed third party apps | The admin allows third party apps. |

## Schema

Schemas define which Power Apps fields are sent to the Microsoft Purview compliance portal. Some fields are common to all applications that send audit data to Microsoft Purview, while others are specific to Power Apps activities. The value in the `PropertyCollection` field is specific to each Power Apps activity type. To identify Power Apps activities, look for nested schema property `powerplatform.analytics.resource.type` with value `PowerApp` within the `PropertyCollection` property. Here's an example of the activity-specific schema.

```json
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

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
