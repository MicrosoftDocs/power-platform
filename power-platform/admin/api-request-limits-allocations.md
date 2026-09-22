---
title: Requests limits and allocations
description: Power Platform requests limits and allocations
author: EllenWehrle
contributors:
  - amiyapatr-zz
  - samathur
  - cvassallo
  - v-aangie
  - ShawnNandiMSFT 
  - PriyaKodukula
  - EllenWehrle
  - dileepsinghmicrosoft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/08/2026
ms.subservice: admin
ms.author: matow
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
ai-usage: ai-assisted
---
# Requests limits and allocations

Power Platform request limits help ensure service levels, availability, and quality of the platform. You can make only a limited number of requests each day across Power Apps, Power Automate, Microsoft Copilot Studio, and Dynamics 365 applications.

## What is a Microsoft Power Platform request?

Requests in Microsoft Power Platform are actions that a user takes across different products.

- **Power Apps**: All API requests to connectors and Microsoft Dataverse.
- **Power Automate**: All API requests to connectors, process advisor analysis, HTTP actions, and built-in actions from initializing variables to a simple compose action. Both successful and failed actions count toward these limits. Retries and requests from pagination also count as action executions. Learn more in [What counts as an action](power-automate-licensing/faqs.md#what-counts-as-an-action).
- **Microsoft Copilot Studio**: API requests (or calls) to Power Automate flows.
- **Dataverse**: All create, read, update, and delete (CRUD), assign, and share operations including user-driven and internal system requests required to complete CRUD transactions, and special operations like share or assign. These operations can be from any client or application (including Dynamics 365) and use any endpoint (SOAP or REST). These operations include plug-ins, classic workflows, and custom controls that perform the earlier mentioned operations.

> [!NOTE]
> Dataverse excludes a small set of internal system operations from limits, such as login, logout, and system metadata operations.

Agent flows are metered through Microsoft Copilot Studio rather than through Power Platform requests, so the limits in this article don't apply to them. Learn more in the [Microsoft Copilot Studio Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2320995).

The following sections describe the request types and the limits established for each.

## Licensed user request limits

All Microsoft Power Platform users have request limits based on their assigned license. The following table shows the number of requests a user can make in a 24-hour period:

| Products | Requests per paid license per 24 hours |
|--------------|-------------------|
| Paid licensed users for Power Platform (excludes Power Apps per App, Power Automate per flow, and Microsoft Copilot Studio) and Dynamics 365 excluding Dynamics 365 Team Member<sup>1</sup>    | 40,000     |
| [Power Apps pay-as-you-go plan](https://go.microsoft.com/fwlink/?linkid=2173947), and paid licensed users for Power Apps per app, Microsoft 365 apps with Power Platform access, and Dynamics 365 Team Member<sup>2</sup> | 6,000        |
| Power Automate per flow plan<sup>3</sup>, Microsoft Copilot Studio base offer, and Microsoft Copilot Studio add-on pack<sup>4</sup>   | 250,000    |
| Paid Power Apps Portals login | 200 |

<sup>1</sup> This category includes paid licenses for Power Apps per user plan (which includes the previous Power Apps Plan 1 and Power Apps Plan 2 licenses), Power Automate per user plan (which includes the previous Flow Plan 1 and Flow Plan 2 licenses), Dynamics 365 Sales Premium, Dynamics 365 Sales Enterprise, Dynamics 365 Sales Professional, Dynamics 365 Customer Service Enterprise, Dynamics 365 Customer Service Professional, Dynamics 365 Field Service, Microsoft Relationship Sales, Microsoft Industry Cloud, Dynamics 365 Project Service Automation, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Finance, Dynamics 365 Project Operations, Dynamics 365 Supply Chain Management, Dynamics 365 Customer Engagement plan, Dynamics 365 Unified Ops plan, Dynamics 365 Plan, Dynamics 365 for Operations Device, Dynamics 365 for Operations Activity, Dynamics AX Online Device, Dynamics AX Online Task, Dynamics CRM Online Enterprise, and Dynamics CRM Online Professional.

<sup>2</sup> This category includes the Power Apps pay-as-you-go plan, and paid licenses Power Apps per app plan, Dynamics 365 Team Member, Dynamics CRM Online Basic, Dynamics CRM Online Essential, Dynamics AX Self-Serve, Microsoft 365 licenses, and Microsoft Project Online (Plan 1, Plan 3, and Plan 5). Learn more in **Appendix B** in the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130) for Microsoft 365 licenses that include Power Apps and Power Automate capabilities.

<sup>3</sup> The Power Automate per flow plan allows capacity to be specifically reserved for a single flow, irrespective of the owner of the flow. This plan doesn't use the non-licensed user request limits at the tenant level.

<sup>4</sup> Microsoft Copilot Studio requests are counted from Power Automate flows triggered from a Microsoft Copilot Studio chatbot. Microsoft Copilot Studio initial sessions pack and additional sessions pack both receive the same daily Power Platform Request limits.

### More licensed user request limit details

Power Platform request limits are included only with paid base licenses in the Dynamics 365 *base + attach* licensing model. Attach licenses don't include separate limits. For example, if a user has Dynamics 365 Customer Service Enterprise as the base license and Dynamics 365 Sales Enterprise as an attach license, the total request limit is what the base license provides - Dynamics 365 Customer Service Enterprise.

If a user has multiple paid licenses, the total number of requests allowed is the sum of requests for each license. For example, if a user has both a Dynamics 365 Customer Service Enterprise base license and a Power Apps per user license then that user has a total of 40,000 + 40,000 = 80,000 requests available per 24 hours.

The capability to run apps built in Cowork is included with Power Apps Premium. Power Platform requests generated when running these apps count toward the license's limit of 40,000 requests per user per 24-hour period. This capability isn't included with Power Apps per app, Power Apps pay-as-you-go, or Dynamics 365 licenses that include Power Apps capabilities. Usage of AI-powered runtime, such as agents and Work IQ APIs, is not included in these limits and consumes Copilot Credits. Refer to the [Copilot Credits Guide](https://go.microsoft.com/fwlink/?linkid=2368800) and the [Microsoft Copilot Studio Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2320995) for additional information.

Microsoft Copilot Studio requests are counted from Power Automate flows triggered from a Microsoft Copilot Studio chatbot or agent. Microsoft Copilot Studio initial sessions pack and additional sessions pack both receive the same daily Power Platform Request limits.


## Non-licensed user request limits

A separate limit applies to activities that don't require user interaction, such as a background process that migrates data between databases. These limits are defined and pooled at the tenant level. Dataverse enables you to have identities that don't require any user to interact with the service. These identities include:

- [Application users](create-users.md#create-an-application-user)
- [Non-interactive users](create-users.md#create-a-non-interactive-user-account)
- [Administrative users](create-users.md#create-an-administrative-user-account)
- [SYSTEM user](/power-apps/developer/data-platform/webapi/reference/systemuser#operations)

There are also special free ($0) licenses, which you can use to interact with Dynamics 365 applications like Dynamics 365 Marketing. Learn more in [How Marketing is licensed](/dynamics365/customer-engagement/marketing/purchase-setup#user-and-portal-licensing).

For these non-licensed identities, every tenant gets an initial base request limit per tenant that's determined by what paid licenses are on the tenant, plus accrued limits determined by the quantity of paid Dynamics 365 Enterprise and Professional licenses.<sup>1</sup> This pool can only be used by these non-licensed users and not by users with assigned interactive user licenses.

| Products                                                        | Pooled non-licensed tenant-level requests per 24 hours                                  |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Dynamics 365 Enterprise & Professional applications<sup>1</sup> | 500,000 base requests + 5,000 requests accrued per USL<sup>1</sup> up to 10,000,000 max<sup>2</sup> |
| Power Apps (all licenses)                                       | 25,000 base requests with no per-license accrual for the tenant                         |
| Power Automate (all licenses)                                   | 25,000 base requests with no per-license accrual for the tenant                         |

<sup>1</sup> This category includes licenses for Dynamics 365 Sales Premium, Dynamics 365 Sales Enterprise, Dynamics 365 Sales Professional, Dynamics 365 Customer Service Enterprise, Dynamics 365 Customer Service Professional, Dynamics 365 Field Service, Microsoft Relationship Sales, Dynamics 365 Project Service Automation, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Finance, Dynamics 365 Project Operations, Dynamics 365 Supply Chain Management, Dynamics 365 Customer Engagement plan, Dynamics 365 Unified Ops plan, Dynamics 365 Plan, Dynamics CRM Online Enterprise, and Dynamics CRM Online Professional.  Power Platform Request accrued non-licensed tenant-level limits are only granted with paid base licenses in the Dynamics 365 'base + attach' licensing model.

<sup>2</sup>If you think you might exceed the non-licensed user limits, contact your reseller or Microsoft account team to discuss a custom solution.

### More non-licensed user request limit details

Certain products operate with the concept of a service principal and accrue their limits to the non-licensed user pool. This approach best aligns limits with how the product operates on the platform.

A Power Automate cloud flow owned by a service principal doesn't use the non-licensed user pool if it has a Process or Per-flow license, belongs to a [flow group](/power-automate/flow-groups) that has a Process license assigned, or has a designated licensed user. When you designate a licensed user, the flow uses that user's action limits.

If a tenant has multiple types of subscriptions, their non-licensed user request capacity uses the product line subscription with the larger number of requests. For example, if a customer has both Dynamics 365 Customer Service Enterprise base license subscriptions (500,000 minimum requests + accrued limits) and Power Apps per user subscriptions (25,000 requests/day), their pooled tenant-level request capacity is 500,000 minimum requests + accrued limits per 24 hours.

## What happens if a licensed or non-licensed user exceeds limits

Power Platform request limits were updated and substantially increased in late 2021 to be at levels that are significantly higher than typical usage for most customers. With the updated limits, expectations are that few users would exceed the documented limits. If you anticipate exceeding the non-licensed user limits, reach out to your reseller or Microsoft Account team to discuss a custom solution.

Enforcement of the official limits won't start until at least six months after Power Automate usage reporting is generally available.

Microsoft reserves the right to enforce limits for overages. If you experience high usage enforcement, you might see throttling. To avoid it, bring usage within your entitlement or add capacity for the identity or flow that exceeds it. Connector limits, Dataverse service protection limits, and other service protection limits are separate from the daily request limits and apply however much request capacity you hold.

## Power Platform requests add-on

The Power Platform requests add-on increases the request limit for a specific high usage licensed user or high usage non-licensed user. Each add-on raises the limit by another 50,000 requests per 24 hours, and you can assign multiple add-ons to increase it further.

You can't currently assign Power Platform requests add-on packs to users or flows. To give a specific flow its own entitlement, use a Process license instead.

### Add capacity to a Power Automate cloud flow

You can't assign the Power Platform requests add-on to a specific cloud flow, so it isn't the lever for a single throttled flow. Assign a [Process license](power-automate-licensing/types.md#capacity-licenses) to the flow instead. A Process license gives the flow its own entitlement of 250,000 Power Platform requests per 24 hours, independent of the licenses held by the people who use it. The flow must be in a [solution](/power-automate/create-flow-solution).

You have two ways to allocate that capacity:

- **Assign the license directly to the flow.** If one flow needs more than 250,000 requests per 24 hours, stack up to 10 Process licenses on it. Each license adds another 250,000 requests per 24 hours.
- **Assign the license to a [flow group](/power-automate/flow-groups).** Up to 25 solution-aware cloud flows share the group's 250,000 requests per 24 hours. Add every parent and child flow that should use the shared capacity, because child flows don't inherit capacity from a parent. You can't stack licenses on a flow group.

> [!NOTE]
> The Power Automate Per-flow plan is a legacy license that the Process license replaced. Flows that already have a Per-flow license keep their 250,000 requests per 24 hours, but you can allocate only one Per-flow license to a flow, its limits can't be stacked, and it can't be assigned to a flow group. Use Process licenses for new capacity, and replace Per-flow licenses rather than renewing them.

Learn more in [What happens when my flow runs too many actions?](power-automate-licensing/faqs.md#what-happens-when-my-flow-runs-too-many-actions)

## Other applicable limits

In addition to the daily Power Platform request limits, each service has other service protection limits. Like the daily request limits, these limits help maintain the quality of service by protecting the service from malicious or noisy behavior that disrupts service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Dataverse limits](/powerapps/developer/common-data-service/api-limits): applicable for model-driven apps and customer engagement apps (such as Dynamics 365 Sales and Customer Service), Power Apps, and Power Automate connecting to Dataverse/customer engagement apps
- [Power Automate limits](/power-automate/limits-and-config): applicable for automated, scheduled, and instant flows
- [Limits in connectors](/connectors/): applicable for Power Automate and Power Apps

## View detailed Power Platform request usage information in the Power Platform admin center (preview)

To view the consumption of Power Platform requests for licensed users, non-licensed users, and per flow licensed flow runs, take these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. On the **Licensing** pane, select **Capacity add-ons** to view the *Capacity* page.
1. On the **Summary** tab, scroll down to the *Add-ons* section and select **Download reports**.

   :::image type="content" source="media/api-request-limits-allocations/capacity-download-reports.png" alt-text="Screenshot that shows the Capacity page in the Power Platform admin center and highlights the link to download reports." lightbox="media/api-request-limits-allocations/capacity-download-reports.png":::

1. On the *Downloadable Reports* page, select **New** from the command bar.
1. Expand the **Choose a report** box and select **Microsoft Power Platform requests**.
1. Select the required scope of the report:

    - Licensed User
    - Non-licensed User
    - Per Flow Licensed Flows

1. Select **Submit**.
1. Once the report is ready, select **Download** to download the report as an Excel CSV file.

> [!NOTE]
> These reports are in preview and currently limited to Power Automate API requests. API requests from Dataverse, Microsoft Copilot Studio, and Power Apps aren't included at this time.
>
> There are two limitations with the **Licensed user** preview report.
>
> - The entitlements for licensed users are showing up in the reporting per user per day per environment. The limits should apply at the per user per day level. When looking at reporting, understand that the limits are per user per day, using the entitlement quantity only one time per day, not summing entitlements for the same user potentially multiple times.
> - The **Licensed user** report doesn't show correct entitlements for users licensed via the Power Apps per app license or Power Apps per app pay-as-you-go meter. Entitlements for such users is shown as 0, when in fact, they should be shown as 6000 (request per 24-hour period as previously outlined).

### Licensed user report

The [**Licensed user**](api-request-limits-allocations.md#licensed-user-request-limits) report shows the Power Platform request usage per user per day and the users' entitled quantity. The downloadable report contains the following fields:

| Field                                                    | Description                              |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Environment ID | The unique Power Platform environment identifier. |
| Environment Name | The display name of environment.                         |
| Caller ID                              | The unique identifier of the calling identity that maps to Active Directory ID. This value can be null or empty.    |
| Caller Type | The type of caller identity. Applicable value for licensed user report is User. |
| Usage Datetime | The date and time of when the usage was captured (UTC). |
| Entitled quantity | The total of any Power Platform request limits for the user. |
| Total consumed quantity | The total Power Automate API usage. |
| Power Automate Requests | Number of Power Platform requests originating from Power Automate. |

Here's a sample of a detailed usage report:

:::image type="content" source="media/ppr-licensed-user-report.png" alt-text="Screenshot of the licensed user report in the Power Platform admin center, displaying a table with columns for Environment ID, Environment Name, Caller ID, Caller Type, Usage Datetime, Entitled quantity, Total consumed quantity, and Power Automate Requests. The table lists several rows of sample data, showing unique environment identifiers, user IDs, usage dates and times, entitlement values, and request counts." lightbox="media/ppr-licensed-user-report.png":::

### Non-licensed user report

The [**Non-licensed user**](api-request-limits-allocations.md#non-licensed-user-request-limits) report shows the Power Platform request usage per day for non-licensed users and the total entitlement for non-licensed users for that tenant. The downloadable report contains the following fields:

| Field    | Description |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Power Platform request entitlement for this tenant    | The total daily entitlement for non-licensed Power Platform requests for this tenant. |
| Environment ID    | The unique Power Platform environment identifier. |
| Environment Name    | The display name of environment. |
| Caller ID    | The unique identifier of the calling identity. This value can be null or empty. |
| Caller Type    | The type of caller identity. Applicable values are System, Non-Interactive, and Application.   |
| Resource Type    | The type of resource. The only applicable value currently is Power Automate. |
| Resource ID    | The unique resource identifier. Based on the Resource Type&mdash;Power Automate Flow ID. This value can be null or empty. |
| Meter Category    | The top level meter, which is Power Platform request.    |
| Meter Subcategory  |     The detailed classification of what generated the request, which is Power Automate. |
| Usage Datetime |     The date and time of when the usage was captured (UTC). |
| Consumed Quantity |     Usage of Power Platform requests.  |

Here's a sample of a detailed usage report:

:::image type="content" source="media/non-licensed-user-report.png" alt-text="Screenshot of the Non-licensed user report in the Power Platform admin center, displaying a table with columns for Environment ID, Environment Name, Caller ID, Caller Type, Resource Type, Resource ID, Meter Category, Meter Subcategory, Usage Datetime, and Consumed Quantity. The table lists several rows of sample data." lightbox="media/non-licensed-user-report.png":::

### Per flow licensed flows report

The **Per flow licensed flows** downloadable report contains the following fields:

| Field    | Description |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Environment ID    | The unique Power Platform environment identifier. |
| Environment Name    | The display name of environment. |
| Environment Region    | Not available during preview. |
| Caller ID    | The unique identifier of the flow. This value can be null or empty.  |
| Caller Type    | The type of caller identity. Applicable values are *Flow*. |
| Usage Datetime    | The date and time of when the usage was captured (UTC). |
| Entitled Quantity    | The value of any included entitlement for the flow.  |
| Consumed Quantity    | Usage of Power Platform requests.  |

:::image type="content" source="media/ppr-per-flow-licensed-flows.png" alt-text="Screenshot of the per-flow user report in the Power Platform admin center, displaying a table with columns and rows filled with sample data. " lightbox="media/non-licensed-user-report.png":::

## Request limits in Power Automate

> [!IMPORTANT]
> Desktop flow executions don't consume Power Platform requests.

To ensure Power Automate service availability and quality, there are limits to the number of Power Platform requests (PPR) users can make across their cloud flows. The system sets those limits against normal flow usage patterns in both five-minute and 24-hour intervals.

The 24-hour limit is based on the user license or on the Process or per flow plan license allocated to a cloud flow:

- If a user has a Power Automate Premium license, they can make 40,000 Power Platform requests across all of their cloud flows in a tenant within a 24-hour period. This limit includes requests the platform makes to non-Microsoft connectors.
- If a cloud flow has a Process license, the flow, its child flows, and its associated flows can make 250,000 Power Platform requests across all users of the flow in a 24-hour period.
- If a cloud flow has a per flow plan (legacy), the flow can make 250,000 Power Platform requests across all users of the flow in a 24-hour period.

To prevent a usage-heavy flow or user from impacting other users, the system tracks this capacity based on consumption at an individual user or flow level and it can't be pooled at any other level like environment or tenant levels. The 24 hours is a sliding window, meaning that anytime a cloud flow runs, the system looks at the requests in the past 24 hours to determine if the user is at their limit. For example, two users in a tenant might have Premium licenses, and each user gets 40,000 requests per 24-hour period. If the first person uses more than 40,000 requests in a 24-hour period, their flows slow down and don't impact the second user who only used 20,000 requests and still has 20,000 requests remaining.

All organizations are currently in [a transition period](#power-automate-transition-period). During this time, Premium and seeded license limits are applied per cloud flow, not per user: each flow gets one limit that everyone who runs it shares, not a limit added up from individual users. Per-user entitlements still exist during the transition, but they aren't the ones being applied yet. Once the transition period ends, enforcement switches to the per-user limits. Process and per-flow capacity licenses don't change; they're flow-level both now and after. Design your cloud flows for the per-user limits that take effect once the transition ends. See [what changes when the transition period ends](#power-automate-transition-period).
The five-minute limit is 100,000 requests and it's independent of a user's license. For example, flows with a Process license can make 250,000 requests in 24 hours but they can't make more than 100,000 requests within five minutes.

Power Automate request limits per license:

|License name|PPR official limit per 24 hours|PPR transition period limit per 24 hours|
|--------|--------|----------|
|Power Automate Premium|40k per user | 200k per cloud flow|
|Power Automate Process|250k per license | 500k per license|
|Power Automate Hosted Process|250k per license | 500k per license|
|Power Automate Per-user plan (legacy)|40k per user | 200k per cloud flow|
|Power Automate Per-flow plan (legacy)|250k per license | 500k per license|
|Power Automate Free|6k per user| 10k per cloud flow|
|Office 365|6k per user| 10k per cloud flow|
|Power Apps Premium|40k per user | 200k per cloud flow|
|Dynamics 365 professional|40k per user | 200k per cloud flow|
|Dynamics 365 Enterprise applications|40k per user | 200k per cloud flow|
|Dynamics 365 Team member|6k per user| 10k per cloud flow|

Learn more about [Power Automate licenses](/power-platform/admin/power-automate-licensing/types).

> [!NOTE]
>
> - You can stack multiple Power Automate Process licenses on a single cloud flow. Each additional license adds 250,000 PPR to the flow's daily entitlement. The flow must be in a [solution](/power-automate/create-flow-solution).
> - Learn more:
    > - [Can I assign multiple Process licenses to a single cloud flow?](/power-platform/admin/power-automate-licensing/faqs#can-i-assign-multiple-process-licenses-to-a-single-cloud-flow)
    > - [FAQ on Power Platform Request within Power Automate](/power-platform/admin/power-automate-licensing/faqs#power-platform-requests-questions)

### Power Automate transition period

All organizations are in a transition period. During this period, you apply limits for Premium and seeded licenses per cloud flow instead of per user, so flows aren't unexpectedly disrupted while usage reporting matures. The transition period doesn't mean there are no daily limits.

The following table summarizes what changes when the transition period ends.

| Behavior | During the transition period | After the transition period |
|---|---|---|
| Where limits apply | Cloud flow level | User level for Premium licenses; cloud flow level for Process and Per-flow licenses |
| Stacking user licenses | Not supported. Same rule as after the transition period: a flow's limit follows its license context, not a combined total across the user's plans | Still not supported. Each license's limits apply separately to the flows running in that license's context, not as a combined total |
| Power Platform requests add-ons | Not assignable to users or cloud flows | No change currently planned |
| Seeded licenses | Cloud flows must run within the context of the app, though this isn't strictly enforced yet | Cloud flows must run within the context of the app |

Two points that hold throughout:

- **Power Platform requests add-ons aren't the lever for a single throttled flow.** You can't assign the add-on to a cloud flow, and during the transition period you can't assign it at all. To give a specific flow its own entitlement, assign a [Process license](power-automate-licensing/types.md#capacity-licenses) to it or to a [flow group](/power-automate/flow-groups) that contains it. If a flow is throttled, assign a Process license to it.
- **Stay within your license terms now.** Remaining compliant during the transition period avoids disruption when it ends. Learn more about [seeded licenses](power-automate-licensing/deep-dive-on-specific-license.md).

The **Licensing** > **Power Automate** > **Usage** area in the Power Platform admin center has superseded the downloadable [Power Platform request reports](#view-detailed-power-platform-request-usage-information-in-the-power-platform-admin-center-preview). Use it to prepare by finding flows and users that exceed their official limits, and license them with a Process license or a flow group.

## Frequently asked questions

### What tools can I use to monitor and analyze Power Platform requests across the platform?

Reporting for Power Platform request usage in preview is available in the Power Platform admin center. These reports are currently limited to Power Automate API requests. API requests from Dataverse, Microsoft Copilot Studio, and Power Apps aren't included at this time.

### What are the timelines for Power Platform Request limits?

Enforcement of the official limits won't start until at least six months after Power Automate usage reporting is generally available, so you have time to analyze usage and buy the licenses you need. Until enforcement begins, Power Automate continues to throttle at the [transition period](#power-automate-transition-period) limits. Learn more in [Power Automate licensing FAQ](power-automate-licensing/faqs.md#action-limits-and-capacity-questions).

### What account limits do classic workflows or Power Automate flows use?

It depends on whether the process runs on demand or in the background. Instant flows, which run on demand, use the limits of the account that starts the process. Workflows or automated and scheduled flows that run in the background always use the limits of the owner of the process, regardless of why the process started or which accounts are used for connections within the process. Learn more in [Whose action limits does the cloud flow use?](power-automate-licensing/faqs.md#whose-action-limits-does-the-cloud-flow-use)

### Do Microsoft Power Platform request limits roll over from day to day or month to month?

No, they don't. All Microsoft Power Platform requests exist for a 24-hour period. If you don't consume them, they don't roll over to the next day and they don't accumulate within a month.

### Does each application user, non-interactive user, administrative user, or system user get their own tenant-level limit?

No, they don't. All application users, non-interactive users, administrative users, and system users within the tenant share tenant-level limits.

### Do requests generated from classic Dataverse workflows and plug-ins in Dataverse count against the request limits?

Yes, if these requests make CRUD, assign, or share-type requests, they count. For classic workflows, this logic includes actions such as checking conditions, starting child workflows, or stopping workflows. However, requests generated internally from the platform don't count, such as `sdkmessagerequest`, `solutioncomponentdefinition`, and `ribbonclientmetadatareporting`.

### Should I use a non-Microsoft data integration tool instead of Power Automate to avoid hitting my limits?

No. Non-Microsoft data integration tools are subject to the exact same limits as scheduled, instant, or automated flows. There's no difference whether you choose to use Power Automate or a non-Microsoft tool. Requests from Power Automate to Dataverse aren't double-counted. A flow that calls one action only counts as one request against your limit, not two.

### Related information

- [Dataverse API limits overview](/powerapps/maker/common-data-service/api-limits-overview)
- [Power Automate limits and configuration](/power-automate/limits-and-config)

