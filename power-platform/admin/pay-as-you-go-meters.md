---
title: "Preview: Pay-as-you-go meters| MicrosoftDocs"
description: About the pay-as-you-go meters.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/26/2021
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

[Need intro for meters...]

## How do meters work?

| **Meter** | **What is counted?** | **What is billed?** |
|------|--------|--------|
| Power Apps per app | Total number of unique monthly users of each app and portal in the pay-as-you-go environment.</br>A unique monthly user is a user who opens an app/portal at least once in the given month.</br>Repeat access of an app/portal by a user is not counted.</br>Users with Power Apps per user licenses are not counted. | $10/active user/app/month |
| Dataverse capacity | For database storage, any usage above 1GB per pay-as-you-go environment.</br>For file storage, any usage above 1GB per pay-as-you-go environment.</br>If auditing is enabled, any resulting log storage usage will be counted. | For usage above 1GB for database: $48 per GB/month</br>For usage above 1GB for file: $2.40 per GB/month</br>For any log usage: $12 per GB/month |
| Power Platform requests (Coming soon) | Each user in a pay-as-you-go enabled environment will get a daily entitlement of Power Platform requests based on their license. With Power Apps per app meter, you get an entitlement of 2K API calls/per user/app/day. This will be sufficient for most customers and for those with high scale scenarios any Power Platform Requests needed above that entitlement will be counted | $0.0002 per request/day above the daily entitled limits |

For detailed pricing information, see [Power Apps pricing](https://powerapps.microsoft.com/pricing/).

Note: as of Public Preview (11/01/21) if you link an environment to an Azure subscription, Power Platform requests meter will not be reported or billed. Users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages. Reporting and billing will be turned on in the weeks following the Public Preview announcement.

### Power Apps per app meter 

The Power Apps per app meter enables users to use any type of app without needing to have a Power Apps license. Power Apps per app meter provides access to both canvas apps and model apps, as well as portal for authenticated users.

The Power Apps Per App meter measures the number of unique users who opened the app or a portal at least once in an environment in a month. You are charged only for the unique users who opened the app in a month irrespective of how many users have access to the app. For example, if 100 users have access to the app, but only 10 users used the app in a month, then you are charged only for those 10 users. Users can access the same app any number of times over the course of the month and still only be counted as 1 monthly active user of that app. However, if users run multiple apps, they will be counted as monthly active users for each app they run that month.

Let's say an environment has three apps, App A, B, and C and this environment is now enabled for pay-as-you-go:

Note: the prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

:::image type="content" source="media/pay-as-you-go-three-example-apps.png" alt-text="Example of three apps enabled for pay-as-you-go":::

If a user has a Power Apps per user license, user is not counted in the meter. If a user has a [Microsoft 365 license](pricing-billing-skus.md#power-appspower-automate-for-microsoft-365) which provides access to Power Apps and is using an app with standard connectors, user is not counted in the meter. See below for how users are counted in the Power Apps per app meter. 

|    |    |     |
|----|------|-------|
|  | App with Standard connectors    | App with Premium connectors    |
| Unlicensed user   | ![Checkmark outline](media/checkmark.png) | ![Checkmark outline](media/checkmark.png) |
| User with Power Apps for Microsoft 365 plan | Not counted    | ![Checkmark outline](media/checkmark.png) |
| User with Power Apps per user plan          | Not counted     | Not counted    |

Note: If an environment already has [app passes assigned](about-powerapps-perapp) and then the environment is enabled for pay-as-you-go, app passes are ignored and not consumed. You can reallocate those app passes to a different environment.

### Dataverse meter

The Dataverse pay-as-you-go meters let you pay for your usage of all three categories of Dataverse storage (database, log, and file) using an Azure subscription.

When an environment becomes a pay-as-you-go environment (meaning those that are linked to an Azure subscription), it stops consuming storage from the tenant wide Dataverse storage pool. Instead, its consumption is billed to Azure. In pay-as-you-go environments, the first 1GB of Dataverse database storage and the first 1GB of Dataverse file storage capacity will not be billed to Azure. However, any log storage capacity will immediately be billed to Azure. Note that log storage capacity us only used if you decide to turn on auditing for an environment.

Measurement for each category of Dataverse storage usage will happen three times per day (90 measurements per month) at 08:00 UTC, 16:00 UTC, and 00:00 UTC. The usage snapshot in that 8-hour period is then multiplied by 1/90<sup>th</sup> to get the fractional usage of storage during the measurement period. This fractional usage will be multiplied by the monthly per GB rate and shown in Azure cost management. The total amount will be summed and billed based on the customer's Azure billing cycle

Note: the prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

:::image type="content" source="media/pay-as-you-go-measured-usage-above-per-environment-entitlements.png" alt-text="Measured usage above per environment entitlements":::

### Power Platform request meter

Note: as of Public Preview (11/01/21) if you link an environment to an Azure subscription this meter will not be reported or billed. Users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages. Reporting and billing will be turned on in the weeks following the Public Preview announcement.

Each Power Platform license includes a large entitlement of Power Platform requests which is designed to sufficient for most customers and scenarios. For customers with extremely high scale scenarios who need to exceed these entitlements, the Power Platform requests meter enables them to scale without getting throttled and only pay for the Power Platform requests used above those entitlements.

For more information on Power Platform requests and the entitlements that are included in each Power Platform license please visit \[ ADD LINK: aka.ms/platformlimits\].

Power Platform request entitlements are structured as daily entitlements (requests/day). In pay-as-you-go environments (meaning those that are linked to an Azure subscription), users and flows that go above their daily entitlement will be billed to the Azure subscription. In a pay-as-you-go environment, with Power Apps per app meter, you get an entitlement of 2K API calls/per user/app/day. Note that flows still need to be licensed with a base licensed (either Power Automate per user, Power Automate per flow, or Office).

In the example below User A is licensed with a Power Apps per user license and Flow A is licensed with a Power Automate per flow license. The number of Power Platform requests consumed by User A and Flow B are measured daily and any usage above the daily entitlement is multiplied by a $/request rate and shown in Azure Cost Management. The total amount will be summed and billed based on the customer's Azure billing cycle.

Note: the prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

:::image type="content" source="media/pay-as-you-go-measured-usage-above-entitlements.png" alt-text="Measured usage above entitlements":::


### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]
