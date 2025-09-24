---
title: Requests limits and allocations
description: Power Platform requests limits and allocations
author: samathur
contributors:
  - amiyapatr-zz
  - samathur
  - cvassallo
  - v-aangie
  - ShawnNandiMSFT 
  - PriyaKodukula 
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/24/2025
ms.subservice: admin
ms.author: samathur
ms.reviewer: angieandrews
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---
# Requests limits and allocations

Power Platform requests limits exist to help ensure service levels, availability, and quality of the platform. There are limits to the number of requests users can make each day across Power Apps, Power Automate, Microsoft Copilot Studio, and Dynamics 365 applications.

## What is a Microsoft Power Platform request?

Requests in Microsoft Power Platform consist of various actions that a user makes across various products. At a high level, the following list is what constitutes an API request:

- **Power Apps**: All API requests to connectors and Microsoft Dataverse.
- **Power Automate**: All API requests to connectors, process advisor analysis, HTTP actions, and built-in actions from initializing variables to a simple compose action. Both succeeded and failed actions count towards these limits. Additionally, retries and other requests from pagination count as action executions. Learn more in [What counts as Power Platform request?](power-automate-licensing/faqs.md#what-counts-as-power-platform-request)
- **Microsoft Copilot Studio**: API requests (or calls) to Power Automate flows from within a chatbot conversation.
- **Dataverse**: All create, read, update, and delete (CRUD), assign, and share operations including user-driven and internal system requests required to complete CRUD transactions, and special operations like share or assign. These operations can be from any client or application (including Dynamics 365) and using any endpoint (SOAP or REST). These operations include, but aren't limited to, plug-ins, classic workflows, and custom controls making the earlier-mentioned operations.

> [!NOTE]
> For Dataverse, there's a small set of system internal operations that are excluded from limits, such as login, logout, and system metadata operations.

The following sections describe the request types and the limits established for each.

## Licensed user request limits

All the users of Microsoft Power Platform have limits on the number of requests based on the license they're assigned. The following table defines the number of requests a user can make in a 24-hour period:

| Products | Requests per paid license per 24 hours |
|--------------|-------------------|
| Paid licensed users for Power Platform (excludes Power Apps per App, Power Automate per flow, and Microsoft Copilot Studio) and Dynamics 365 excluding Dynamics 365 Team Member<sup>1</sup>    | 40,000     |
| [Power Apps pay-as-you-go plan](https://go.microsoft.com/fwlink/?linkid=2173947), and paid licensed users for Power Apps per app, Microsoft 365 apps with Power Platform access, and Dynamics 365 Team Member<sup>2</sup> | 6,000        |
| Power Automate per flow plan<sup>3</sup>, Microsoft Copilot Studio base offer, and Microsoft Copilot Studio add-on pack<sup>4</sup>   | 250,000    |
| Paid Power Apps Portals login | 200 |

<sup>1</sup> This category includes paid licenses for Power Apps per user plan (which includes the previous Power Apps Plan 1 and Power Apps Plan 2 licenses), Power Automate per user plan (which includes the previous Flow Plan 1 and Flow Plan 2 licenses), Dynamics 365 Sales Premium, Dynamics 365 Sales Enterprise, Dynamics 365 Sales Professional, Dynamics 365 Customer Service Enterprise, Dynamics 365 Customer Service Professional, Dynamics 365 Field Service, Microsoft Relationship Sales, Microsoft Industry Cloud, Dynamics 365 Project Service Automation, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Finance, Dynamics 365 Project Operations, Dynamics 365 Supply Chain Management, Dynamics 365 Customer Engagement plan, Dynamics 365 Unified Ops plan, Dynamics 365 Plan, Dynamics 365 for Operations Device, Dynamics 365 for Operations Activity, Dynamics AX Online Device, Dynamics AX Online Task, Dynamics CRM Online Enterprise, and Dynamics CRM Online Professional.

<sup>2</sup> This category includes the Power Apps pay-as-you-go plan, and paid licenses Power Apps per app plan, Dynamics 365 Team Member, Dynamics CRM Online Basic, Dynamics CRM Online Essential, Dynamics AX Self-Serve, Microsoft 365 licenses, and Microsoft Project Online (Plan 1, Plan 3, and Plan 5). Learn more in **Appendix B** in the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130) for Microsoft 365 licenses that include Power Apps and Power Automate capabilities.

<sup>3</sup> The Power Automate per flow plan allows capacity to be specifically reserved for a single flow, irrespective of the owner of the flow. This plan doesn't use the non-licensed user request limits at the tenant level.

<sup>4</sup> Microsoft Copilot Studio requests are counted from Power Automate flows triggered from a Microsoft Copilot Studio chatbot.  Microsoft Copilot Studio initial sessions pack and additional sessions pack both receive the same daily Power Platform Request limits.

### Other details

Power Platform Request limits are only included with paid base licenses in the Dynamics 365 'base + attach' licensing model. Attach licenses don't include separate limits. For example, if a user has a Dynamics 365 Customer Service Enterprise as the base license and Dynamics 365 Sales Enterprise as an attach license, the total request limit would be what is provided by the base license - Dynamics 365 Customer Service Enterprise.

If a user has multiple paid licenses assigned to them, the total number of requests allowed is the sum of requests allowed for each license. For example, if a user has both a Dynamics 365 Customer Service Enterprise base license and a Power Apps per user license then that user has a total of 40,000 + 40,000 = 80,000 requests available per 24 hours.

Microsoft Copilot Studio requests are counted from Power Automate flows triggered from a Microsoft Copilot Studio chatbot. Microsoft Copilot Studio initial sessions pack and additional sessions pack both receive the same daily Power Platform Request limits.

## Non-licensed user request limits

A separate limit is established for certain activities(for example: A background process that migrates data between databases) that don't require a user to interact with the service. These limits are defined and pooled at the tenant level. Dataverse enables you to have identities that don't require any user to interact with the service. These include:

- [Application users](create-users.md#create-an-application-user)
- [Non-interactive users](create-users.md#create-a-non-interactive-user-account)
- [Administrative users](create-users.md#create-an-administrative-user-account)
- [SYSTEM user](/power-apps/developer/data-platform/webapi/reference/systemuser#operations)

Additionally, there are special free ($0) licenses, which are used to interact with Dynamics 365 applications like Dynamics 365 Marketing. Learn more in [How Marketing is licensed](/dynamics365/customer-engagement/marketing/purchase-setup#user-and-portal-licensing).

For these non-licensed identities, every tenant gets an initial base request limit per tenant determined by what paid licenses are on the tenant, plus accrued limits determined by the quantity of paid Dynamics 365 Enterprise and Professional licenses.<sup>1</sup> This pool can only be used by these non-licensed users and not by users with assigned interactive user licenses.

| Products                                                        | Pooled non-licensed tenant-level requests per 24 hours                                  |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Dynamics 365 Enterprise & Professional applications<sup>1</sup> | 500,000 base requests + 5,000 requests accrued per USL<sup>1</sup> up to 10,000,000 max<sup>2</sup> |
| Power Apps (all licenses)                                       | 25,000 base requests with no per-license accrual for the tenant                         |
| Power Automate (all licenses)                                   | 25,000 base requests with no per-license accrual for the tenant                         |

<sup>1</sup> This category includes licenses for Dynamics 365 Sales Premium, Dynamics 365 Sales Enterprise, Dynamics 365 Sales Professional, Dynamics 365 Customer Service Enterprise, Dynamics 365 Customer Service Professional, Dynamics 365 Field Service, Microsoft Relationship Sales, Dynamics 365 Project Service Automation, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Finance, Dynamics 365 Project Operations, Dynamics 365 Supply Chain Management, Dynamics 365 Customer Engagement plan, Dynamics 365 Unified Ops plan, Dynamics 365 Plan, Dynamics CRM Online Enterprise, and Dynamics CRM Online Professional.  Power Platform Request accrued non-licensed tenant-level limits are only granted with paid base licenses in the Dynamics 365 'base + attach' licensing model.

<sup>2</sup>If you anticipate exceeding the non-licensed user limits, reach out to your reseller or Microsoft Account team to discuss a custom solution.

### Additional details

Certain products operate in the concept of a service principal and will have their limits accrued to the non-licensed user pool. This is the best way to align limits with how the product operates on the platform.

If a tenant has multiple types of subscriptions, their non-licensed user request capacity uses the product line subscription with the larger number of requests. For example, if a customer has both Dynamics 365 Customer Service Enterprise base license subscriptions (500,000 minimum requests + accrued limits) and Power Apps per user subscriptions (25,000 requests/day), their pooled tenant-level request capacity will be 500,000 minimum requests + accrued limits per 24 hours.

## What happens if a licensed or non-licensed user exceeds limits

Power Platform Request limits were updated and substantially increased in late 2021 to be at levels that are significantly higher than typical usage for most customers. With the updated limits, expectations are that very few users would exceed the documented limits. If you anticipate exceeding the non-licensed user limits, reach out to your reseller or Microsoft Account team to discuss a custom solution.

Any possible high usage enforcement won't happen until six months after Power Platform Request usage reporting is generally available in the Power Platform admin center.

Microsoft reserves the right to enforce  limits for overages. If a customer encounters high usage enforcement, they can expect some form of throttling. Customers can purchase more capacity to avoid high usage enforcement or move their environment to [pay-as-you-go](pay-as-you-go-overview.md) and pay for actual usage above daily limits.  

## Power Platform Request capacity add-on

Customers that observe in reporting that they're frequently using more requests than limits can avoid high usage enforcement by purchasing the Power Platform Request capacity add-on. This add-on allows customers to increase the limits for specific high usage licensed users or high usage non-licensed users. Each capacity add-on raises the request limit by another 50,000 per 24 hours. Multiple capacity add-ons can be assigned to increase limits.

You can't assign Power Platform requests capacity add-on packs to users or flows during the [transition period](#power-automate-transition-period). However, Microsoft recommends that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends. 

If your Power Automate flows are being throttled, try [Pay-as-you-go](power-automate-licensing/faqs.md#power-platform-requests-pay-as-you-go) to ensure none of the flows in the environment are throttled. If you can't use Pay-as-you-go, purchase [Process license](power-automate-licensing/types.md#capacity-licenses) or add-ons and create a Microsoft support ticket with the flow details and add-on details so that the support team can provide exceptions for your throttled flows.

> [!NOTE]
> Currently, capacity add-ons can't be assigned to users (including application, administrative, and non-interactive users). The functionality for assignment of capacity add-ons will be aligned to the timing of high usage enforcement.

## Other applicable limits

Apart from the daily Power Platform Request limits, there are other service protection limits specific to each service. As with the daily request limits, these limits help maintain the quality of service by protecting the service from malicious or noisy behavior that would otherwise disrupt service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Dataverse limits](/powerapps/developer/common-data-service/api-limits): applicable for model-driven apps and customer engagement apps (such as Dynamics 365 Sales and Customer Service), Power Apps, and Power Automate connecting to Dataverse/customer engagement apps
- [Power Automate limits](/power-automate/limits-and-config): applicable for automated, scheduled, and instant flows
- [Limits in connectors](/connectors/): applicable for Power Automate and Power Apps

## View detailed Power Platform request usage information in the Power Platform admin center (preview) 

To view the consumption of Power Platform requests for licensed users, non-licensed users, and per flow licensed flow runs.

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. On the navigation menu to the left, select **Capacity**.

3. On the **Summary** tab, select **Download reports** in the **Add-ons** section.

   :::image type="content" source="media/ppac-downloadreports.png" alt-text="Screenshot that shows the Capacity page in the Power Platform admin center and highlights the link to download reports.":::

4. Select **New** from the menu.

   :::image type="content" source="media/download-report-new.png" alt-text="Screenshot that shows the Download Reports page in the Power Platform admin center and highlights the button to create a new download report.":::

5. Select **Microsoft Power Platform requests** in the **Choose a report** box.

   :::image type="content" source="media/request-download-report.png" alt-text="Screenshot that shows the dropdown menu for the Power Platform requests reports.":::

6. Select the required type of report, and then select **Submit**.

7. Once the report is ready, select **Download** to download the report as an Excel CSV file.

> [!NOTE]
> These reports are in preview and currently limited to Power Automate API requests. API requests from Dataverse, Microsoft Copilot Studio, and Power Apps aren't included at this time.
> 
There are two limitations with the **Licensed user** preview report.
>
> - The entitlements for licensed users are showing up in the reporting per user per day per environment. The limits should apply at the per user per day level. When looking at reporting, understand that the limits are per user per day, using the entitlement quantity only one time per day, not summing entitlements for the same user potentially multiple times.
> - The **Licensed user** report will not show correct entitlements for users licensed via the Power Apps per app license or Power Apps per app pay-as-you-go meter. Entitlements for such users will be shown as 0 when in fact they should be shown as 6000 (request per 24-hour period as previously outlined).

### Licensed user report

The [Licensed user](api-request-limits-allocations.md#licensed-user-request-limits) report shows the Power Platform request usage per user per day and the users entitled quantity. The downloadable report contains the following fields: 

| Field                                                    | Description                              |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Environment ID | The unique Power Platform environment identifier. |
| Environment Name | The display name of environment.                         |
| Caller ID                              | The unique identifier of the calling identity which maps to Active Directory ID. This can be null or empty.    |
| Caller Type | The type of caller identity. Applicable value for licensed user report is User. |
| Usage Datetime | The date and time of when the usage was captured (UTC). | 
| Entitled quantity | The total of any Power Platform request limits for the user. | 
| Total consumed quantity | The total Power Automate API usage. |
| Power Automate Requests | Number of Power Platform requests originating from Power Automate. | 


Here's a sample of a detailed usage report:

:::image type="content" source="media/ppr-licensed-user-report.png" alt-text="Image showing an example of the licensed user report." lightbox="media/ppr-licensed-user-report.png":::

### Non-licensed user report

The [Non-licensed user](api-request-limits-allocations.md#non-licensed-user-request-limits) report shows the Power Platform request usage per day for non-licensed users and the total entitlement for non-licensed users for that tenant. The downloadable report contains the following fields:

| Field	| Description | 
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Power platform request entitlement for this tenant	| The total daily entitlement for non-licensed power platform requests for this tenant. |
| Environment ID	| The unique Power Platform environment identifier. |
| Environment Name	| The display name of environment. |
| Caller ID	| The unique identifier of the calling identity. This can be null or empty. |
| Caller Type	| The type of caller identity. Applicable values are System, Non-Interactive/Application.   |
| Resource Type	| The type of resource. Applicable value currently is Power Automate. |
| Resource ID	| The unique resource identifier. Based on the Resource Type&mdash;Power Automate Flow ID. This can be null or empty. |
| Meter Category	| The top level meter in this case Power Platform request.    |
| Meter Subcategory  | 	The detailed classification of what generated the request, which is Power Automate. |
| Usage Datetime | 	The date and time of when the usage was captured (UTC). |
| Consumed Quantity | 	Usage of Power Platform requests.  |

Here's a sample of a detailed usage report:

:::image type="content" source="media/non-licensed-user-report.png" alt-text="Image showing an example of the non-licensed user report." lightbox="media/non-licensed-user-report.png":::

### Per Flow report

The Per Flow Licensed Flows downloadable report contains the following fields:

| Field	| Description |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Environment ID	| The unique Power Platform environment identifier. |
| Environment Name	| The display name of environment. |
| Environment Region	| Not available during preview. |
| Caller ID	| The unique identifier of the Flow. This can be null or empty.  |
| Caller Type	| The type of caller identity. Applicable values are Flow. |
| Usage Datetime	| The date and time of when the usage was captured (UTC). |
| Entitled Quantity	| The value of any included entitlement for the flow.  |
| Consumed Quantity	| Usage of Power Platform requests.  |

Here's a sample of a detailed usage report:

:::image type="content" source="media/ppr-per-flow-licensed-flows.png" alt-text="Image showing an example of the per flow-licensed report.":::

## Request limits in Power Automate

> [!IMPORTANT]
> Desktop flow executions don't consume Power Platform requests

To ensure Power Automate service availability and quality, there are limits to the number of Power Platform requests (PPR) users can make across their cloud flows. Those limits are set against normal flow usage patterns in both five minutes and per 24 hour intervals.

The 24 hour limit is based on the user license or on the Process / Per-flow plan license allocated to a cloud flow
  - If a user has a Power Automate Premium license, they can make 40,000 Power Platform requests across all of their cloud flows in a tenant within a 24 hour period. This limit includes requests the platform makes to third party connectors too. 
  - If a cloud flow has a Process license, the flow, its child flows, and its associated flows can make 250,000 Power Platform requests across all users of the flow in a 24 hour period.
  - If a cloud flow has a Per-flow plan (legacy), the flow can make 250,000 Power Platform requests across all users of the flow in a 24 hour period.


To prevent a usage-heavy flow or user from impacting other users, this capacity is tracked based on consumption at an individual user or flow level and it can't be pooled at any other level like environment or tenant levels. The 24 hours is a sliding window, meaning that anytime a cloud flow runs, the system looks at the requests in the past 24 hours to determine if the user is at their limit. For example, two users in a tenant might have Premium licenses, and each user gets 40,000 requests per 24 hour period. If the first person uses more than 40,000 requests 24 hour period, their flows slow down and don't impact the second user who only used 20,000 requests and still has 20,000 requests remaining.

Currently all organizations are in [a transition period](/power-platform/admin/power-automate-licensing/types#transition-period) during which higher transition period limits apply. Once transition period ends, the official limits are applicable. Build your cloud flows based on official limits. 

The five-minute limit is 100,000 requests and it's independent of a user's license. For example, flows with a Process license can make 250,000 requests in 24 hours but they can't make more than 100,000 requests within five minutes.

Power Automate request limits per license:

|License name|PPR official limit per 24 hours|PPR transition period limit per 24 hours|
|--------|--------|----------|
Power Automate Premium|40k per user | 200k per cloud flow|
Power Automate Process|250k per license | 500k per license|
Power Automate Hosted Process|250k per license | 500k per license|
Power Automate Per-user plan (legacy)|40k per user | 200k per cloud flow|
Power Automate Per-flow plan (legacy)|250k per license | 500k per license|
Power Automate Free|6k per user| 10k per cloud flow|
Office 365|6k per user| 10k per cloud flow|
Power Apps Premium|40k per user | 200k per cloud flow|
Dynamics 365 professional|40k per user | 200k per cloud flow|
Dynamics 365 Enterprise applications|40k per user | 200k per cloud flow|
Dynamics 365 Team member|6k per user| 10k per cloud flow|

Learn more about [Power Automate licenses](/power-platform/admin/power-automate-licensing/types).

> [!NOTE]
> - The Power Automate Process licenses can be stacked on a cloud flow to increase its PRR limit
> - [FAQ on Power Platform Request within Power Automate](/power-platform/admin/power-automate-licensing/faqs#power-platform-requests-questions) 


### Power Automate transition period

All organizations are in a transition period. That means that enforcement isn't strict and PPR limits are higher. The transition period ends after [Power Platform admin center reports](/power-platform/admin/api-request-limits-allocations#view-detailed-power-platform-request-usage-information-in-the-power-platform-admin-center-preview) are generally available. Organizations then have six months to analyze their usage and purchase licenses that are appropriate before strict enforcement on license limits begins.

Here are a few things to be aware of during the transition period:

1. The transition period doesn't mean that there are no daily limits. It means that the currently enforced limits are more generous than the official limits to prevent potential unintended impact on your apps or flows.

2. These transition period limits are applied at the cloud flow level during the transition period. Additionally, a separate per user level limit of 1,000,000 cloud flow actions is applied during the transition period to ensure users don't exceed 1M actions across all their flow runs in a day. After the transition period ends, the actual limits will be applied at user level for Premium licenses and cloud flow level for Process / Per flow-plan licenses.

3. During the transition period, manual cloud flows don't use the flow owners/flow invokers limits. Every manual cloud flow has a performance profile of Medium (100,000 requests/flow/24 hours). After the transition period, manual cloud flows will use the request limits of invoking user.

4. Since the limits are more generous during the transition period, stacking of user licenses isn't supported. If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow uses the higher plan (Dynamics 365 plan).

5. Power Platform requests capacity add-on packs aren't assignable to users or cloud flows during the transition period. However, Microsoft recommends that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends. If your cloud flows are currently being throttled, purchase add-ons and create a support ticket with the flow details and add-on details so that the support team can provide exceptions for your throttled flows.

6. Seeded license users can only use cloud flows within the context of the app. Learn more in the [seeded licenses](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license) section. The enforcement on license limits is less strict during transition period and Microsoft recommends that you remain within your license terms to avoid any disruptions when the transition period ends.

## Frequently asked questions

### What tools can I use to monitor and analyze Power Platform requests across the platform?

Reporting for Power Platform request usage in preview is available in the Power Platform admin center. These reports are currently limited to Power Automate API requests. API requests from Dataverse, Microsoft Copilot Studio, and Power Apps aren't included at this time.

### What are the timelines for Power Platform Request limits?

The concept of limits was first introduced in late 2019 and documented limits were substantially increased in late 2021. Public preview reporting for Power Platform Requests rolled out in June 2022. Following a public preview period, the reports move to general availability. There's no current ETA for when GA  happens. Any potential high usage enforcement won't start until at least six months after reports are generally available. However, Power Automate continues to throttle at transition limits until enforcement. Learn more in [FAQs](power-automate-licensing/faqs.md#power-platform-requests-questions).

### What account's limits are used for classic workflows or Power Automate flows?

It depends if the process is run on-demand or in the background. Instant flows, which are run on-demand, use the limits of the account who started the process. On the other hand, workflows or automated/scheduled flows that run in the background always use the limits of the owner of the process irrespective of why the process started or what accounts are used for connections inside of the process. Learn more in [Whose Power Platform request limits are used by the flow?](power-automate-licensing/faqs.md#whose-power-platform-request-limits-are-used-by-the-cloud-flow).

### Do the Microsoft Power Platform request limit roll over from day to day or month to month?

No it doesn't. All the Microsoft Power Platform requests exist for a 24-hour period. If they aren't consumed, they don't roll over to the next day nor do they accumulate within a month.

### Does each application user, non-interactive user, administrative user, or SYSTEM user get their own tenant-level limit?

No they don'. Tenant level limits are shared across all application users, non-interactive users, administrative users, or SYSTEM user within the tenant.

### Do the requests generated from classic Dataverse workflows and plug-ins in Dataverse count against the request limits?

Yes, if these requests are making CRUD, assign, or share–type requests, they count. Regarding classic workflows, this logic includes actions such as checking conditions, starting child workflows, or stopping workflows. However, requests generated internally from the platform aren't counted, such as: sdkmessagerequest, solutioncomponentdefinition, and ribbonclientmetadatareporting.

### Should I use a third-party data integration tool instead of Power Automate to avoid hitting my limits?

No, third-party data integration tools are subject to the exact same limits as scheduled, instant, or automated flows. Thus, there's no difference whether you choose to use Power Automate or a third-party tool. Moreover, requests from Power Automate to the Dataverse aren't double-counted, a flow that calls one action only counts as one request against their limit, not two.

## Related information

- [Dataverse API limits overview](/powerapps/maker/common-data-service/api-limits-overview) <br />
- [Power Automate limits and configuration](/power-automate/limits-and-config)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
