---
title: "Pay-as-you-go meters | MicrosoftDocs"
description: If you're using a pay-as-you-go plan, three meters determine how much you'll pay based on usage of apps, Dataverse storage, and Power Platform requests.
author: Kavishi
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/15/2022
ms.subservice: admin
ms.author: kaagar
ms.reviewer: jimholtz 
contributors:
  - ShawnNandiMSFT
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Pay-as-you-go meters

When you choose to use pay-as-you-go, usage of Power Platform services is billed to your Azure subcription using Azure meters. The table below describes each meter and how it measures usage. Note that when you link an environment to an Azure subscription, all of these meters are automatically enabled for the environment, so any usage of Power Platform services in that environment will be billed according to the details shown in this article.

## How do meters work?

| Meter | What is counted? | What is billed? |
|------|--------|--------|
| Power Apps per-app | The total number of unique monthly active users of each app and portal in a pay-as-you-go environment. </br>An active user is someone who opens an app/portal at least once in the given month. </br>Repeat access of an app/portal by a user isn't counted. Users with Power Apps per-user licenses aren't counted. Users with a Dynamics 365 license that provides access to per user license won't be counted.| $10 per active user/app/month |
| Power Automate flow runs (preview)| Flow runs for premium cloud flows and desktop flows. <br /> Users with Power Automate per user licenses (for example Power Automate Per User, Power Automate Per User with attended RPA) are excluded from flow run charges when using a feature within their license entitlements. <br />Flows using a Power Automate per flow license are excluded from the meter charges.  | $0.60 per flow run for Power Automate cloud flow runs and desktop flow runs (attended mode) <br /> $3.00 per flow run for Power Automate desktop flow runs (unattended mode)  |
| Dataverse | For database storage, any usage above 1 GB per pay-as-you-go environment. </br>For file storage, any usage above 1 GB per pay-as-you-go environment. </br>If auditing is enabled, any resulting log storage usage will be counted. | For usage above 1 GB for database: $48 per GB/month</br>For usage above 1 GB for file: $2.40 per GB/month </br>For any log usage: $12 per GB/month |
| Power Platform requests (coming soon) | Each user in a pay-as-you-go enabled environment will get a daily entitlement of Power Platform requests based on their license. With the Power Apps and Power Automate per-app meter, you get an entitlement of 6,000 API calls per user/app/day. This will be sufficient for most customers. For those with high-scale scenarios, any Power Platform requests above that entitlement will be counted. | 0.00004$ per request/day above the daily entitled limits |

For detailed pricing information, see [Power Apps and Power Automate pricing.](https://powerapps.microsoft.com/pricing/)

> [!NOTE]
> In May 2022, we will release a preview of the Power Platform requests meter. During this preview we will report on usage of Power Platform requests, however, we will not bill for this usage until we reach general availability (GA) for this meter. If you link an environment to an Azure subscription, users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages.

### Power Apps per-app meter 

The Power Apps per-app meter enables users to use any type of app without needing to have a Power Apps license. The Power Apps per-app meter provides access to both canvas and model-driven apps, and portals for authenticated users.

The Power Apps per-app meter measures the number of unique users who opened the app or a portal at least once in an environment over the course of a month. You're only charged for the unique users who actually opened the app, regardless of how many users have access to it. Users can access the same app any number of times over the course of a month and will only be counted as one unique monthly active user of that app. However, if users run multiple apps, they'll be counted as active users for each app they run that month.

For example, an environment has three apps: App A, App B, and App C. This environment is now enabled for pay-as-you-go pricing:

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

---

If a user has a Power Apps per-user license, the user isn't counted in the meter. If a user has a [Microsoft 365 license](pricing-billing-skus.md#power-appspower-automate-for-microsoft-365), which provides access to Power Apps and is using an app with standard connectors, the user is also not counted in the meter. See below for more on how users are counted in the Power Apps per-app meter. 

|License type  |App with standard connectors|App with premium connectors|
|----|------|-------|
| Unlicensed user   | Charged via Azure subscription.  | Charged via Azure subscription.  |
| Unlicensed user but Power Apps per-app license is available in an environment   | Charged via Azure subscription. App passes aren't consumed.    | Charged via Azure subscription. App passes aren't consumed.  |
| User with Power Apps for Microsoft 365 plan          | Not counted in the meter.    | Charged via Azure subscription.    |
| User with Power Apps per-user plan          | Not counted in the meter.    | Not counted in the meter.    |

> [!NOTE]
> If an environment already has [app passes assigned](about-powerapps-perapp.md) and is enabled for pay-as-you-go, app passes are ignored and not consumed. You can reallocate those app passes to a different environment. 

### Power Automate meters (preview)

The Power Automate meters enable users to build and/or run premium Power Automate flows and to pay for their usage based on the number of times these flows run instead of purchasing standalone Power Automate licenses.   

A flow can either run in the cloud, on a desktop with a user (attended), or on a desktop without user interaction (unattended): 

- Flows that run in the cloud or attended cost $0.60 per run 
- Flows that run unattended cost $3.00 per run  

To make it easy to test and fix your flows no charges will be incurred if you're testing your flow in the designer or resubmitting failed runs. Additionally, if you use the "Child flow" feature for cloud flows or attended flows, there will only be a single charge for the parent flow run, no charges will be incurred for child flow runs. For unattended flows, both parent and child flow runs will be charged.  

#### Users and flows with standalone Power Automate licenses 

Flow runs triggered by users with Power Automate per user licenses (for example Power Automate Per User, Power Automate Per User with attended RPA) aren't charged provided they're using a Power Automate feature within their license entitlements.  

Example: if a user with a Power Automate per user license runs a cloud flow in a pay-as-you-go environment, that flow run won't be charged as it is part of the Power Automate per user license entitlement. But, if the same user runs a flow with attended RPA, that flow run will be charged to the customer’s Azure subscription because RPA isn't part of the Power Automate per user license entitlement.  

If a flow is licensed with a Power Automate per flow plan, any flow runs of that flow won't be changed to the customer’s Azure subscription.  

Note that when determining whether a flow run should be charged or not:  

- For automated or scheduled flows, the license entitlements of the flow owner will apply.  
- For instant and Power Apps-triggered flows, the license entitlements of the user running the flow will apply. 

Note that customers can't use the Power Automate unattended RPA add-on subscription in a pay-as-you-go environment.  

Example: if an environment has Unattended bot add-on units assigned and then PAYG is enabled for that environment, every unattended flow run in the environment will be charged. Any Unattended bots add-on units are ignored and can be reassigned to other environments.  

#### Flows running in the context of a Power App 

Power Automate flows can either be triggered directly via a user in a Power App, or, run in the background automatically in response to automated triggers, such as a new item being added to a SharePoint list. Charges are different depending on the method: 

- Flows triggered directly from a Power App will have no additional cost since by running the Power App, the user’s standalone Power Apps license or the Power Apps PAYG meter will cover their usage of Power Automate.  
- For flows running in response to an automated trigger (owned by a user without a Power Apps or Power Automate license), you have the flexibility to choose between the following options: 
  - Pay the normal run rates called out above -- charged $0.60 or $3.00 depending on where it runs (this in the default behavior), or, 
  - For cloud flows only, if the flow uses the same data sources as a Power App, you can link that flow to the app using a [PowerShell script](powerapps-powershell.md#associate-in-context-flows-to-a-power-app). When you link a flow to an app, usage will be covered by the user’s standalone Power Apps license or the Power Apps PAYG meter.  

#### Choose the right subscription to save costs
Prepaid flows and Pay-as-you-go flows can co-exist in same environments as Pay-as-you-go plan complements prepaid subscriptions. Admins can understand usage patterns using Power platform admin center reports and move users to pre-pay licenses for optimal pricing.

 - Pay-as-you-go is optimal for seasonal flows or flows with less runs but more users
 - Prepaid is optimal for personal automation flows and flows with lot of runs
 
|Flow |Month #1 flow runs  |Month #2 flow runs |Month #3 flow runs |Charges for 3 months using prepaid licenses| Charges for 3 months using Pay-as-you-go| Recommendation|
|---------|---------|---------|---------|-------------|-------------|------------|
|**Flow1** - Automated/Scheduled flow -  1 user running the flow | 100      |  25       |   20     | 3months x $15 Per user license = $45| 145 runs x $0.60/run = $87|Power Automate per user license|
|**Flow 2**- Instant flow – 10 users running the flow| 100      |  25       |   20     |3months x 10 users x $15per user license = $450| 145 runs x $0.60/run = $87|Pay-as-you-go|
|**Flow 3** – attended RPA- 10 users running the flow | 100      |  25       |   20     | 3months x 10 users x $40 per user with attended RPA = $1200| 145 runs x $0.60/run = $87)|Pay-as-you-go|
| **Flow 4** – Unattended RPA – 2 concurrent runs| 100      |  25       |   20     |3 months x ($40 per user with attended RPA+2 bots x $150 per unattended addon) = $1020|145 runs x $3/run = $435 |Pay-as-you-go|
| **Flow 5** – Seasonal flow - 1 user running the flow| 0      |  0      |   40     |3 month x $15 Per user license = $45|40 runs x $0.60/run = $24|Pay-as-you-go|
|**Flow 6** – Organizational flow running under service account/service principal | 100      |  25       |   20     | 3months x $100 per flow license = $300| 145 runs x $0.60/run = $87|Pay-as-you-go|
 
> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

### Dataverse capacity meter

Dataverse pay-as-you-go meters let you pay for your usage of all three categories of Dataverse storage (database, log, and file) using an Azure subscription.

When an environment becomes enabled for pay-as-you-go and is linked to an Azure subscription, it stops consuming storage from the tenant-wide Dataverse storage pool. Instead, its consumption is billed to Azure. In pay-as-you-go environments, the first 1 GB of Dataverse database storage and 1 GB of file storage capacity aren't billed to Azure. However, any log storage capacity will immediately be billed. Note that log storage capacity is only used if you decide to turn on auditing for an environment.

The measurement of usage for each category of Dataverse storage will happen three times per day (90 measurements per month) at 08:00 UTC, 16:00 UTC, and 00:00 UTC. The usage snapshot in each 8-hour period is then multiplied by 1/90<sup>th</sup> to get the fractional usage of storage during the measurement period. This fractional usage will be multiplied by the monthly per GB rate and shown in Azure Cost Management. The total amount will be summed and billed based on the customer's Azure billing cycle.

> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

# [Image](#tab/image)

:::image type="content" source="media/pay-as-you-go-measured-usage-above-per-environment-entitlements.png" alt-text="Measured usage above per environment entitlements":::

# [Table](#tab/table)

Measured usage *above* entitlements of 1 GB Database and 1 GB File

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
> In May 2022, we will release a preview of the Power Platform requests meter. During this preview we will report on usage of Power Platform requests, however, we will not bill for this usage until we reach general availability (GA) for this meter. If you link an environment to an Azure subscription, users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages.

Each Power Platform license includes a large entitlement of Power Platform requests, designed to be sufficient for most customers and scenarios. For customers with extremely high-scale scenarios, the Power Platform requests meter enables them to scale without getting throttled and only pay for the Power Platform requests used above those entitlements.

For more information on Power Platform requests and the entitlements that are included in each license, go to [Requests limits and allocations](api-request-limits-allocations.md).

Power Platform request entitlements are structured as daily entitlements (requests/day). In pay-as-you-go environments, users and flows that go above their daily entitlement will be billed to the linked Azure subscription. With the Power Apps and Power Automate per-app meter, you get an entitlement of 6,000 API calls per user/app/day. Note that flows still need to be licensed with a base license (either Power Automate per-user, Power Automate per-flow, or Office).

In the example below, User A is licensed with a Power Apps and Power Automate per-user license and Flow A is licensed with a Power Automate per-flow license. The number of Power Platform requests consumed by User A and Flow B are measured daily and any usage above the daily entitlement is multiplied by a $/request rate and shown in Azure Cost Management. The total amount will be summed and billed based on the customer's Azure billing cycle.

> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

# [Image](#tab/image)

:::image type="content" source="media/pay-as-you-go-measured-usage-above-entitlements.png" alt-text="Measured usage above entitlements":::

# [Table](#tab/table)

Measured usage *above* limits

|   |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**User A** <br />Power Apps and Power Automate <br />per user license with <br />40 K requests/day <br /> entitlement |  0 K     | 10 K        | 0 K        |
|**Flow A** <br />Power Automate and Power Automate <br />per flow license <br /> with 250 K requests/day <br /> entitlement  | 0 K          |  100 K         |  50 K         |

Example pricing

|   |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**Power Platform** <br />**Requests**     | No usage        | 110 K * $0.00004 = $4.40       | 50 K * $0.00004 = $2.00        |
|**Total cost:**     |  $0.00       | $4.40        | $2.00        |

---


## Next step

[Set up pay-as-you-go](pay-as-you-go-set-up.md)







[!INCLUDE[footer-include](../includes/footer-banner.md)]
