---
title: Pay-as-you-go meters 
description: If you're using a pay-as-you-go plan, 3 meters determine how much you pay based on usage of apps, Dataverse storage, and Power Platform requests.
author: amiyapatr-zz
ms.component: pa-admin
ms.topic: concept-article
ms.date: 02/07/2025
ms.subservice: admin
ms.author: ampatra
ms.reviewer: sericks 
contributors:
  - ShawnNandiMSFT
  - sericks007
  - kenseongtan
search.audienceType: 
  - admin
---
# Pay-as-you-go meters

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

When you choose to use pay-as-you-go, usage of Power Platform services is billed to your Azure subscription using Azure meters. The following table describes each meter and how it measures usage. When you link an environment to an Azure subscription, all of these meters are automatically enabled for the environment, so any usage of Power Platform services in that environment is billed according to the details shown in this article.

## How do meters work?

| Meter | What is counted? | What is billed? |
|------|--------|--------|
| Power Apps per-app | The total number of unique monthly active users of each app in a pay-as-you-go environment. </br>An active user is someone who opens an app at least once in the given month. </br>Repeat access of an app by a user isn't counted. Users with Power Apps per-user licenses aren't counted. Users with a Dynamics 365 license that provides access to per user license aren't counted.| $10 per active user/app/month |
| [Power Automate flow runs (preview)](/power-platform/admin/pay-as-you-go-meters?tabs=image#power-automate-meters-preview)| Flow runs for premium cloud flows and desktop flows. <br/>Flows with standard connectors are excluded from charges. <br /> Users with Power Automate per user licenses (for example Power Automate Per User, Power Automate Per User with attended RPA) are excluded from flow run charges when using a feature within their license entitlements. <br /> Similarly, flows using a Power Automate per flow license are excluded from run charges when using a feature within their license entitlements. | $0.60 per flow run for Power Automate cloud flow runs and desktop flow runs in attended mode <br /> $3.00 per flow run for Power Automate desktop flow runs in unattended mode  <br /> $3.00 per flow run for Power Automate desktop flow runs with hosted robotic process automation (RPA) (preview) which includes hosted machines and hosted machine groups |
| Dataverse | For database storage, any usage exceeding 1 GB or the allocated capacity per pay-as-you-go environment. </br>For file storage, any usage exceeding 1 GB or the allocated capacity per pay-as-you-go environment. </br>If auditing is turned on, any resulting log storage usage exceeding allocated capacity is counted. | For usage above 1 GB for database: $48 per GB/month</br>For usage above 1 GB for file: $2.40 per GB/month </br>For any log usage: $12 per GB/month |
| [Power Platform requests (coming soon)](/power-platform/admin/power-automate-licensing/types#pay-as-you-go)| Each user in a pay-as-you-go enabled environment gets a daily entitlement of Power Platform requests based on their license. See [License limits](/power-platform/admin/api-request-limits-allocations#licensed-user-request-limits). This is sufficient for most customers. For those with high-scale scenarios, any Power Platform requests above that entitlement is counted. | 0.00004$ per request/day above the daily entitled limits |
| [Power Pages (preview)](#power-pages-meters-preview) | Unique monthly active users of Power Pages websites.</br>An active authenticated user is someone who logs in to the website at least once in the given month.<br>Users who authenticate to a website (by logging in using any auth provider) are counted as authenticated active users. Repeat access by a user within the calendar month isn't counted. Users with Power Apps per-user license or Dynamics 365 enterprise licenses that provides access to website won't be counted.</br>Users who don't authenticate to a website are counted as anonymous active users. Repeat access of the website by a user within the calendar month isn't counted as long as the anonymous user ID stored in the cookie isn't deleted or changed. | $4 per active authenticated user/website/month</br>$0.30 per active anonymous user/website/month |
| Copilot Studio | A billable Copilot Studio message is a request or message sent to the Copilot triggering an action or response. Any agent or custom Copilot usage is billed through Copilot Studio message meter.| $0.01 per message  |

For detailed pricing information, see [Power Apps and Power Automate pricing.](https://powerapps.microsoft.com/pricing/)

> [!NOTE]
> In June 2022, we released a preview of the Power Platform requests meter. During this preview we report on usage of Power Platform requests, however, we'll not bill for this usage until we reach general availability (GA) for this meter. If you link an environment to an Azure subscription, users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages.

### Power Apps per-app meter 

The Power Apps per-app meter enables users to use any type of app without needing to have a Power Apps license. The Power Apps per-app meter provides access to both canvas, and model-driven apps for authenticated users.

The Power Apps per-app meter measures the number of unique users who opened the app at least once in an environment over the course of a month. You're only charged for the unique users who actually opened the app, regardless of how many users have access to it. Users can access the same app any number of times over the course of a month and will only be counted as one unique monthly active user of that app. However, if users run multiple apps, they're counted as active users for each app they run that month.

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
| **Total active users:** | **9** = 9 different <br /> users each active <br /> in one app |  **0** apps had active <br />usage | **6** = 2 users each <br /> active in three apps |

Example pricing

|   |Month #1  |Month #2  |Month #3  |
|---------|---------|---------|---------|
|**App A**     | Two active users        | No active users         | Two active users         |
|**App B**     | Three active users         | No active users         | Two active users         |
|**App C**     | Four active users         | No active users         | Two active users         |
|**Total cost:**     | **$90** <br /> (9 x $10/active user/app)       | **$0** <br />(0 x $10/active user/app)        | **$60** <br /> (6 x $10/active user/app)       |

---

If a user has a Power Apps per-user license, the user isn't counted in the meter. If a user has a [Microsoft 365 license](pricing-billing-skus.md#power-apps-and-power-automate-for-microsoft-365), which provides access to Power Apps and is using an app with standard connectors, the user is also not counted in the meter. See below for more on how users are counted in the Power Apps per-app meter. 

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

A flow can either run in the cloud, on a desktop with a user in attended mode, on a desktop without user interaction in unattended mode, or on a Microsoft hosted machine with hosted machine group: 

- Premium flows that run in the cloud or attended cost $0.60 per run 
- Premium flows that run unattended cost $3.00 per run  
- Premium flows that run with hosted RPA (preview) which includes hosted machines and hosted machine groups cost $3.00 per run (preview)

> [!NOTE]
> Premium flows that run with hosted RPA (preview) which includes hosted machines and hosted machine groups are currently available in preview and will be reported under the "Unattended RPA Flow Run" meter subcategory. Pricing for this feature is subject to change when it becomes generally available (GA).

To make it easy to test and fix your flows, no charges are incurred if you're testing your flow in the designer or resubmitting failed runs. If you use the "Child flow" feature for cloud flows or attended flows, there's only a single charge for the parent flow run, no charges are incurred for child flow runs. For unattended flows, both parent and child flow runs are charged. 

> [!NOTE]
> During the public preview, there may be limits on the maximum number of runs that are charged to a single flow in a pay-as-you-go environment per day. Starting on 9/1, the limit is 1000 per day subject to change during the preview period. The downloadable pay-as-you-go report in the Power Platform admin center shows the full and accurate number of flow runs, but the number billed to Azure may be lower. We recommend that any flows with a high number of runs use a Power Automate per flow plan, as that is a fixed price per month.

#### Users and flows with standalone Power Automate licenses 

Flow runs of flows with standard connectors aren't charged. Flow runs triggered by users with Power Automate per user licenses (for example Power Automate Per User, Power Automate Per User with attended RPA) aren't charged provided they're using a Power Automate feature within their license entitlements.  

Example: If a user with a Power Automate per user license runs a cloud flow in a pay-as-you-go environment, that flow run won't be charged as it's part of the Power Automate per user license entitlement. But, if the same user runs a flow with attended RPA, that flow run is charged to the customer’s Azure subscription because RPA isn't part of the Power Automate per user license entitlement.  

If a flow is licensed with a Power Automate per flow plan, any flow runs of that flow aren't charged to the customer’s Azure subscription.  

When determining whether a flow run is charged or not:  

- For automated or scheduled flows, the license entitlements of the flow owner apply.  
- For instant and Power Apps-triggered flows, the license entitlements of the user running the flow apply. 

Customers can't use the Power Automate unattended RPA add-on subscription in a pay-as-you-go environment.  

Example: If an environment has Unattended bot add on units assigned and then pay-as-you-go is turned on for that environment, every unattended flow run in the environment is charged. Any Unattended bots add-on units are ignored and can be reassigned to other environments.  

If the owner of a flow is service principal, the flow runs are charged unless the flow has a per-flow license. 

> [!NOTE]
> Assigning a Power Automate per user/per flow license ensures that any runs of the flow doesn't trigger Power Automate flow run meter if the flow features are within their license entitlements. But, if the flow uses more Power platform requests than the [limits](/power-platform/admin/api-request-limits-allocations#licensed-user-request-limits), Power platform request meter is triggered for any overages.

|User |Standard flow runs  |Premium cloud flow runs |Attended RPA flow runs |Unattended RPA runs| Azure billable runs|
|---------|----------------------|----------------|--------------|-------------|-------------|
|**User with Office license** | 10 runs(not charged)     | 10 runs      |  5 runs   | 5 runs| 20 runs
|**User with no license (Power Automate free license** | 10 runs(not charged)      | 10 runs      |  5 runs   | 5 runs| 20 runs
|**User with Power Automate per user license** | 10 runs(not charged)      | 10 runs(not charged)      |  5 runs   | 5 runs| 10 runs
|**User with Power Automate per user with attended RPA** | 10 runs(not charged)      | 10 runs  (not charged)     |  5 runs (not charged)   | 5 runs| 5 runs
|**User with Power Apps per user with flow runs out of the app context** | 10 runs (not charged)      | 10 runs      |  5 runs   | 5 runs| 15 runs

#### Flows running in the context of an app

Power Automate flows can either be triggered directly via a user in an app or run in the background automatically in response to automated triggers, such as a new item being added to a SharePoint list. Charges are different depending on the method: 

- Flows triggered directly from an app created using Power Apps have no extra cost since by running the Power App, the user’s standalone Power Apps license or the Power Apps pay-as-you-go meter covers their usage of Power Automate.  
- For flows running in response to an automated trigger (owned by a user without a Power Apps or Power Automate license), you have the flexibility to choose between the following options: 
  - Pay the normal run rates called out above - charged $0.60 or $3.00 depending on where it runs (this in the default behavior), or, 
  - For cloud flows only, if the flow uses the same data sources as a Power App, you can link that flow to the app using a [PowerShell script](powerapps-powershell.md#associate-in-context-flows-to-an-app). When you link a flow to an app, usage is covered by the user’s standalone Power Apps license or the Power Apps pay-as-you-go meter.  

#### Choose the right subscription to save costs
Prepaid flows and Pay-as-you-go flows can coexist in same environments as Pay-as-you-go plan complements prepaid subscriptions. Admins can understand usage patterns using Power platform admin center reports and move users to prepay licenses for optimal pricing.

 - Pay-as-you-go is optimal for seasonal flows or flows with fewer runs but more users
 - Prepaid is optimal for personal automation flows and flows with lot of runs
 
|Flow |Month #1 flow runs  |Month #2 flow runs |Month #3 flow runs |Charges for three months using prepaid licenses| Charges for three months using Pay-as-you-go| Recommendation|
|---------|---------|---------|---------|-------------|-------------|------------|
|**Flow1** - Automated/Scheduled flow -  1 user running the flow | 100      |  25       |   20     | Three months x $15 Per user license = $45| 145 runs x $0.60/run = $87|Power Automate per user license|
|**Flow 2**- Instant flow – 10 users running the flow| 100      |  25       |   20     |Three months x 10 users x $15per user license = $450| 145 runs x $0.60/run = $87|Pay-as-you-go|
|**Flow 3** – attended RPA - 10 users running the flow | 100      |  25       |   20     | Three months x 10 users x $40 per user with attended RPA = $1200| 145 runs x $0.60/run = $87)|Pay-as-you-go|
| **Flow 4** – Unattended RPA – 2 concurrent runs| 100      |  25       |   20     |Three months x ($40 per user with attended RPA+2 bots x $150 per unattended addon) = $1020|145 runs x $3/run = $435 |Pay-as-you-go|
| **Flow 5** – Seasonal flow - 1 user running the flow| 0      |  0      |   40     |3 month x $15 Per user license = $45|40 runs x $0.60/run = $24|Pay-as-you-go|
|**Flow 6** – Organizational flow running under service account/service principal | 100      |  25       |   20     | Three months x $100 per flow license = $300| 145 runs x $0.60/run = $87|Pay-as-you-go|
 
> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

### Power Pages meters (preview)

The Power Pages meters enable customers to pay for usage of their Power Pages websites based on the number of unique active users of those websites, instead of estimating and purchasing capacity beforehand.  

There are two different meters:
1. Authenticated users cost $4 per active user/website/month
1. Anonymous users cost $0.30 per active user/website/month

> [!NOTE]
> Customers can view usage of the Power Pages meters in the [downloadable Power Platform pay-as-you report](pay-as-you-go-usage-costs.md) effective November 2022. Billing for these meters is effective December 2022.

#### Authenticated user meter

The Power Pages Authenticated user meter measures total number of unique monthly authenticated active users of each website in a pay-as-you-go environment.
 
An authenticated active user is someone who logs in to the website (using any auth provider) at least once in the given month. Repeat logins on the same website by a user in the calendar month isn't  counted. However, if a user logs in to multiple websites present in the same environment, the user is counted as an active user for each website they log into that month. 

Users with Power Apps per-user license or a Dynamics 365 enterprise license that provides access to website aren't counted. 
 
To make it easy to try websites, any website running in trial mode isn't counted in the meter. Similarly to make it easy to do development and testing, any website running in private mode is also not counted in the meter. 

For example, an environment has three websites: **website A**, **website B**, and **website C**. This environment is now enabled for pay-as-you-go pricing:

| Active users | Month #1 | Month #2 | Month #3 |
| - | - | - | - |
| Website A | User #1 and #2 | | User #1 and #2 |
| Website B | User #3, #4, and #5 | | User #1 and #2 |
| Website C | User #6, #7, #8, and #9 | | User #1 and #2 |
| Total active users: | 9 = 9 different users each active in one website | 0 website had active usage | 6 = 2 users each active in three websites |
| Total cost: | $36</br>(9 x $4/active user/website) | $0</br>(0 x $0/active user/website) | $24</br>(6 x $4/active user/website) |

> [!NOTE]
> The prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

#### Anonymous user meter

The Power Pages anonymous user meter measures total number of unique monthly anonymous active users of each website in a pay-as-you-go environment. 

An anonymous active user is someone who browses any page of the website at least once in the given month.  
For Anonymous users, uniqueness is determined through a unique anonymous user ID stored in a browser cookie. 

Repeat access of the website by a user isn't counted as long as the anonymous user ID stored in the cookie remains same. If the user accesses the site using different browsers or devices or cleans up browser cookies, then a new unique anonymous user ID is generated and user would be counted as a different user. 
  
Also, to make it easy to try websites, any website running in trial mode isn't counted in the meter. Similarly to make it easy to do development and testing, any website running in private mode is also not counted in the meter. 
 
There are several scenarios in which a user who has anonymously browsed the website won't be counted in the meter. The scenarios are described below: 

- If the user accesses specific pages related to authentication, such as: sign in, register, invitation, and externalauthenticationcallback. 
- If the user accesses specific pages like the ones starting with **/_**, for example: **/_services**, and **/_resource**.
- If the user accesses a page that returns a redirect response (http 3xx status), an error response (http 5xx status), or any http 4xx response.
- If a user is accessing only static resources like CSS, JavaScript, or images.
- If a user is browsing anonymously and later logs in to the website within same day (UTC timezone), then that user is only counted as an authenticated user and isn't counted as an anonymous user.
- Bots and crawler access of the anonymous pages of the website isn't counted.

If you use a monitoring system setup to test website availability periodically, its usage of the website isn't counted if it sends a nonbrowser user agent header. If your monitoring system sends a user agent of any standard browser, it might be counted as an anonymous user. We recommend to targeting your monitoring service at the **/_services/about** page of your website to ensure that it isn't counted.

> [!NOTE]
> When an environment is enabled for pay-as-you-go, any capacity for Power Apps portal logins/page views or Power Pages authenticated user/anonymous user prepaid capacity that is assigned to the environment is ignored and not consumed. You can reallocate this capacity to a different environment.

### Dataverse capacity meter

Dataverse pay-as-you-go meters let you pay for your usage of all three categories of Dataverse storage (database, log, and file) using an Azure subscription.

When an environment is enabled for pay-as-you-go and linked to an Azure subscription, any storage consumption exceeding the allocated capacity is billed to Azure. If no capacity is allocated to the environment, all storage consumption is billed directly to Azure. For pay-as-you-go environments, the first 1 GB of Dataverse database storage and 1 GB of file storage are included at no charge. However, any log storage consumption is billed immediately. Log storage is utilized only if auditing is enabled for the environment.

The measurement of usage for each category of Dataverse storage happens once per day (30 measurements per month) . The usage snapshot in each snapshot is then multiplied by 1/30<sup>th</sup> to get the fractional usage of storage during the measurement period. This fractional usage is multiplied by the monthly per GB rate and shown in Azure Cost Management. The total amount is summed and billed based on the customer's Azure billing cycle.

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
|**Database**     |  0.5 GB x $48 = $24       | 1.5 GB x $48 = $72         | 2.5 GB x $48 = $120         |
|**File**     | 2 GB x $2.40 = $4.80         | 5 GB x $2.40 = $12         | 10 GB x $2.40 = $24         |
|**Log**     | No usage         | 0.2 GB x $12 = $2.40         | 0.4 GB x $12 = $4.80         |
|**Total cost:**     | **$28.80**        |  **$86.40**      |  **$148.80**       |

---

### Power Platform request meter (coming soon)

> [!NOTE]
> In June 2022, we released a preview of the Power Platform requests meter. During this preview, we report on usage of Power Platform requests, however, we won't bill for this usage until we reach general availability (GA) for this meter. If you link an environment to an Azure subscription, users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages.

Each Power Platform license includes a large entitlement of Power Platform requests, designed to be sufficient for most customers and scenarios. For customers with extremely high-scale scenarios, the Power Platform requests meter enables them to scale without getting throttled and only pay for the Power Platform requests used above those entitlements.

For more information on Power Platform requests and the entitlements that are included in each license, go to [Requests limits and allocations](api-request-limits-allocations.md).

Power Platform request entitlements are structured as daily entitlements (requests/day). In pay-as-you-go environments, users and flows that go above their daily entitlement are billed to the linked Azure subscription. With the Power Apps and Power Automate per-app meter, you get an entitlement of 6,000 API calls per user/app/day. Flows still need to be licensed with a base license (either Power Automate per-user, Power Automate per-flow, or Office).

In the example below, User A is licensed with a Power Apps and Power Automate per-user license and Flow A is licensed with a Power Automate per-flow license. The number of Power Platform requests consumed by User A and Flow B are measured daily and any usage above the daily entitlement is multiplied by a $/request rate and shown in Azure Cost Management. The total amount is summed and billed based on the customer's Azure billing cycle.

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
|**Power Platform** <br />**Requests**     | No usage        | 110 K x $0.00004 = $4.40       | 50 K x $0.00004 = $2.00        |
|**Total cost:**     |  $0.00       | $4.40        | $2.00        |

---


## Next step

[Set up pay-as-you-go](pay-as-you-go-set-up.md)







[!INCLUDE[footer-include](../includes/footer-banner.md)]
