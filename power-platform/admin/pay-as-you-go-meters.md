---
title: "Preview: Pay-as-you-go meters| MicrosoftDocs"
description: About the pay-as-you-go meters.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/02/2021
ms.subservice: admin
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Preview: Pay-as-you-go meters

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

If you are using Pay-as-you-go, usage of apps and any Dataverse or Power Platform request usage above included amounts is billed against the Azure subscription using Azure meters. The Power Apps per app meter measures the app usage. The Dataverse capacity add-on meter measures Dataverse usage across database, file, and logs. The Power Platform requests capacity add-on meter measures the API calls. As soon as you link your environment to an Azure subscription, all three meters are automatically enabled.

## How do meters work?

| **Meter** | **What is counted?** | **What is billed?** |
|------|--------|--------|
| Power Apps per app | The total number of unique monthly active users of each app and portal in a pay-as-you-go environment. </br>An active user is someone who opens an app/portal at least once in the given month. </br>Repeat access of an app/portal by a user is not counted. Users with Power Apps per user licenses are not counted. | $10/active user/app/month |
| Dataverse | For database storage, any usage above 1 GB per pay-as-you-go environment. </br>For file storage, any usage above 1 GB per pay-as-you-go environment. </br>If auditing is enabled, any resulting log storage usage will be counted. | For usage above 1 GB for database: $48 per GB/month</br>For usage above 1 GB for file: $2.40 per GB/month </br>For any log usage: $12 per GB/month |
| Power Platform requests (coming soon) | Each user in a pay-as-you-go enabled environment will get a daily entitlement of Power Platform requests based on their license. With Power Apps per app meter, you get an entitlement of 6000 API calls/per user/app/day. This will be sufficient for most customers and for those with high scale scenarios any Power Platform Requests needed above that entitlement will be counted | 0.00004$ per request/day above the daily entitled limits |

For detailed pricing information, see [Power Apps pricing](https://powerapps.microsoft.com/pricing/).

> [!NOTE]
> As of Public Preview (November 1, 2021), if you link an environment to an Azure subscription, the Power Platform requests meter will not be reported or billed. Users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages. Reporting and billing will be turned on in the weeks following the Public Preview announcement.

### Power Apps per app meter 

The Power Apps per app meter enables users to use any type of app without needing to have a Power Apps license. Power Apps per app meter provides access to both canvas apps and model-driven apps, and portals for authenticated users.

The Power Apps per app meter measures the number of unique users who opened the app or a portal at least once in an environment in a month. You are charged only for the unique users who opened the app in a month irrespective of how many users have access to the app. For example, if 100 users have access to the app, but only 10 users used the app in a month, then you are charged only for those 10 users. Users can access the same app any number of times over the course of the month and still only be counted as one monthly active user of that app. However, if users run multiple apps, they will be counted as monthly active users for each app they run that month.

For example, an environment has three apps, App A, B, and C and this environment is now enabled for pay-as-you-go:

> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

# [Image](#tab/image)

Environment with three apps

:::image type="content" source="media/pay-as-you-go-three-example-apps.png" alt-text="Example of three apps enabled for pay-as-you-go":::

# [Table](#tab/table)

Environment with three apps

|Active users  |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**App A**     | User #1 and #2       |         | User #1 and #2       |
|**App B**     | User #3, #4, and #5       |         | User #1 and #2          |
|**App C**     | User #6, #7, #8, and #9        |         | User #1 and #2            |
| **Total active users:** | **9** = 9 different <br /> users each active <br /> in 1 app |  **0** apps had active <br />usage | **6** = 2 users each <br /> active in 3 apps |

Example pricing

|   |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**App A**     | 2 active users        | 0 active users         | 2 active users         |
|**App B**     | 3 active users         | 0 active users         | 2 active users         |
|**App C**     | 4 active users         | 0 active users         | 2 active users         |
|**Total cost:**     | **$90** <br /> (9 * $10/active user/app)       | **$0** <br />(0 * $10/active user/app)        | **$60** <br /> (6 * $10/active user/app)       |

If a user has a Power Apps per user license, the user is not counted in the meter. If a user has a [Microsoft 365 license](pricing-billing-skus.md#power-appspower-automate-for-microsoft-365) which provides access to Power Apps and is using an app with standard connectors, the user is not counted in the meter. See below for how users are counted in the Power Apps per app meter. 

|    |    |     |
|----|------|-------|
|  | App with Standard connectors    | App with Premium connectors    |
| Unlicensed user   | ![Checkmark outline](media/checkmark.png) | ![Checkmark outline](media/checkmark.png) |
| User with Power Apps for Microsoft 365 plan | Not counted    | ![Checkmark outline](media/checkmark.png) |
| User with Power Apps per user plan          | Not counted     | Not counted    |

> [!NOTE]
> If an environment already has [app passes assigned](about-powerapps-perapp.md) and the environment is enabled for pay-as-you-go, app passes are ignored and not consumed. You can reallocate those app passes to a different environment. 

---


### Dataverse capacity meter

The Dataverse pay-as-you-go meters let you pay for your usage of all three categories of Dataverse storage (database, log, and file) using an Azure subscription.

When an environment becomes a pay-as-you-go environment (meaning those that are linked to an Azure subscription), it stops consuming storage from the tenant-wide Dataverse storage pool. Instead, its consumption is billed to Azure. In pay-as-you-go environments, the first 1 GB of Dataverse database storage and the first 1 GB of Dataverse file storage capacity will not be billed to Azure. However, any log storage capacity will immediately be billed to Azure. Note that log storage capacity us only used if you decide to turn on auditing for an environment.

Measurement for each category of Dataverse storage usage will happen three times per day (90 measurements per month) at 08:00 UTC, 16:00 UTC, and 00:00 UTC. The usage snapshot in that 8-hour period is then multiplied by 1/90<sup>th</sup> to get the fractional usage of storage during the measurement period. This fractional usage will be multiplied by the monthly per GB rate and shown in Azure cost management. The total amount will be summed and billed based on the customer's Azure billing cycle.

> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

# [Image](#tab/image)

:::image type="content" source="media/pay-as-you-go-measured-usage-above-per-environment-entitlements.png" alt-text="Measured usage above per environment entitlements":::

# [Table](#tab/table)

Measured usage *above* entitlements of 1GB Database and 1GB File

|Storage category  |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**Database**<br />Per environment <br /> entitlement 1 GB    | 0.5 GB        | 1.5 GB        | 2.5 GB        |
|**File**<br />Per environment <br /> entitlement 1 GB      |  2 GB       | 5 GB        |  10 GB       |
|**Log**<br />No environment <br /> base entitlement      |  0 GB       |  0.2 GB       | 0.4 GB        |


Example pricing

|         |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**Database**     |  0.5 GB * $48 = $24       | 1.5 GB * $48 = $72         | 2.5 GB * $48 = $120         |
|**File**     | 2 GB * $2.40 = $4.80         | 5 GB * $2.40 = $12         | 10 GB * $2.40 = $24         |
|**Log**     | No usage         | 0.2 GB * $12 = $2.40         | 0.4 GB * $12 = $4.80         |
|**Total cost:**     | **$28.80**        |  **$86.40**      |  **$148.80**       |

---

### Power Platform request meter (coming soon)

> [!NOTE]
> As of Public Preview (November 1, 2021), if you link an environment to an Azure subscription this meter will not be reported or billed. Users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages. Reporting and billing will be turned on in the weeks following the Public Preview announcement.

Each Power Platform license includes a large entitlement of Power Platform requests which is designed to be sufficient for most customers and scenarios. For customers with extremely high scale scenarios who need to exceed these entitlements, the Power Platform requests meter enables them to scale without getting throttled and only pay for the Power Platform requests used above those entitlements.

For more information on Power Platform requests and the entitlements that are included in each Power Platform license, see  [Requests limits and allocations](api-request-limits-allocations.md).

Power Platform request entitlements are structured as daily entitlements (requests/day). In pay-as-you-go environments (meaning those that are linked to an Azure subscription), users and flows that go above their daily entitlement will be billed to the Azure subscription. In a pay-as-you-go environment, with Power Apps per app meter, you get an entitlement of 6000 API calls/per user/app/day. Note that flows still need to be licensed with a base licensed (either Power Automate per user, Power Automate per flow, or Office).

In the example below, User A is licensed with a Power Apps per user license and Flow A is licensed with a Power Automate per flow license. The number of Power Platform requests consumed by User A and Flow B are measured daily and any usage above the daily entitlement is multiplied by a $/request rate and shown in Azure Cost Management. The total amount will be summed and billed based on the customer's Azure billing cycle.

> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

# [Image](#tab/image)

:::image type="content" source="media/pay-as-you-go-measured-usage-above-entitlements.png" alt-text="Measured usage above entitlements":::

# [Table](#tab/table)

Measured usage *above* limits

|   |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**User A** <br />Power Apps per <br />user license with <br />40 K requests/day <br /> entitlement |  0 K     | 10 K        | 0 K        |
|**Flow A** <br />Power Automate <br />per flow license <br /> with 250 K requests/day <br /> entitlement  | 0 K          |  100 K         |  50 K         |

Example pricing

|   |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**Power Platform** <br />**Requests**     | No usage        | 110 K * $0.00004 = $4.40       | 50 K * $0.00004 = $2.00        |
|**Total cost:**     |  $0.00       | $4.40        | $2.00        |

---


## Next step

[Preview: Set up pay-as-you-go](pay-as-you-go-set-up.md)


### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]
