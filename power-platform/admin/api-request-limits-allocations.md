---
title: Requests limits and allocations | Microsoft Docs
description: Requests limits and allocations
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/28/2021
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Requests limits and allocations

Originally announced in October 2019, Power Platform Request entitlement limits exist to help ensure service levels, availability, and quality of the platform. There are limits to the number of requests users can make each day across Power Apps, Power Automate, Power Virtual Agents, and Dynamics 365 applications.

## What is a Microsoft Power Platform request?

Requests in Microsoft Power Platform consist of various actions that a user makes across various products. At a high level, below is what constitutes an API request:

- **Power Apps** – all API requests to connectors and Microsoft Dataverse.
- **Power Automate** – all API requests to connectors, process advisor analysis, HTTP actions, and built-in actions from initializing variables to a simple compose action. Both succeeded and failed actions count towards these limits. Additionally, retries and other requests from pagination count as action executions as well.
- **Power Virtual Agents** - API requests (or calls) to Power Automate flows from within a chatbot conversation.
- **Dataverse** – all create, read, update, and delete (CRUD), assign, and share operations including user-driven and internal system requests required to complete CRUD transactions, and special operations like share or assign. These can be from any client or application (including Dynamics 365) and using any endpoint (SOAP or REST). These include, but are not limited to, plug-ins, classic workflows, and custom controls making the earlier-mentioned operations.

> [!NOTE]
> For Dataverse, there is a small set of system internal operations that are excluded from limits, such as login, logout, and system metadata operations.

The sections below describe the request types and the entitlement limits established for each.

## Licensed user request entitlement limits

All the users of Microsoft Power Platform have limits on the number of requests based on the license they are assigned. The following table defines the number of requests a user can make in a 24-hour period:

| Products | Requests per paid license per 24 hours |
|--------------|-------------------|
| Paid licensed users for Power Platform (excludes Power Apps per App and Power Automate per flow) and Dynamics 365 (excludes D365 Team Member detailed below<sup>1</sup>)    | 40,000     |
| [Power Apps pay-as-you-go plan](https://go.microsoft.com/fwlink/?linkid=2173947), and paid licensed users for Power Apps per app, Microsoft 365 apps with Power Platform access, and Dynamics 365 Team Member (detailed below<sup>2</sup>) | 6,000        |
| Power Automate per flow plan<sup>3<sup>   | 250,000    |

<sup>1</sup> This category includes paid licenses for Power Apps per user plan (which includes the previous Power Apps Plan 1 and Power Apps Plan 2 licenses), Power Automate per user plan (which includes the previous Power Apps Plan 1 and Power Apps Plan 2 licenses), Power Virtual Agents initial sessions pack, Power Virtual Agents additional sessions pack, Dynamics 365 Sales Premium, Dynamics 365 Sales Enterprise, Dynamics 365 Sales Professional, Dynamics 365 Customer Service Enterprise, Dynamics 365 Customer Service Professional, Dynamics 365 Field Service, Microsoft Relationship Sales, Dynamics 365 Project Service Automation, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Finance, Dynamics 365 Project Operations, Dynamics 365 Supply Chain Management, Dynamics 365 Customer Engagement plan, Dynamics 365 Unified Ops plan, Dynamics 365 Plan, Dynamics CRM Online Enterprise, and Dynamics CRM Online Professional.

<sup>2</sup> This category includes the Power Apps pay-as-you-go plan, and paid licenses Power Apps per app plan, Dynamics 365 Team Member, Dynamics CRM Online Basic, Dynamics CRM Online Essential, Dynamics AX Self-Serve, Microsoft 365 licenses, and Microsoft Project Online (Plan 1, Plan 3, and Plan 5). See **Appendix B** in the [Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130) for Microsoft 365 licenses that include Power Apps and Power Automate capabilities. 

<sup>3</sup> The Power Automate per flow plan allows capacity to be specifically reserved for a single flow, irrespective of the owner of the flow. This does not use the non-licensed user request entitlements at the tenant level.

### Other details

Power Platform Request entitlements are only granted with paid base licenses in the Dynamics 365 'base + attach' licensing model. Attach licenses do not include entitlements. For example, if a user has a Dynamics 365 Customer Service Enterprise as the base license and Dynamics 365 Sales Enterprise as an attach license, the total request entitlement would be what is provided by the base license - Dynamics 365 Customer Service Enterprise.

If a user has multiple paid licenses assigned to them, the total number of requests allowed would be the sum of requests entitled for each license. For example, if a user has both a Dynamics 365 Customer Service Enterprise base license and a Power Apps per user license then that user will have a total of 40,000 + 40,000 = 80,000 requests available per 24 hours.

Power Virtual Agents requests are counted from Power Automate flows triggered from a Power Virtual Agents chatbot. Power Virtual Agents initial sessions pack and additional sessions pack both receive the same daily Power Platform Request entitlements.

## Non-licensed user request entitlement limits

A separate entitlement limit is established for certain activities that do not require a user license to interact with the service. These limits are defined and pooled at the tenant level. Dataverse enables you to have identities that do not require any user license to interact with the service. These include:

- [Application users](create-users.md#create-an-application-user)
- [Non-interactive users](create-users.md#create-a-non-interactive-user-account)
- [Administrative users](create-users.md#create-an-administrative-user-account)
- [SYSTEM user](/dynamics365/customer-engagement/web-api/systemuser?view=dynamics-ce-odata-9#operations)

Additionally, there are special free ($0) licenses, which are used to interact with Dynamics 365 applications like Dynamics 365 Marketing. See [How Marketing is licensed](/dynamics365/customer-engagement/marketing/purchase-setup#user-and-portal-licensing) for more details.

For these non-licensed identities, every tenant will get an initial base request entitlement per tenant determined by what paid licenses are on the tenant, plus accrued entitlements determined by the quantity of paid Dynamics 365 Enterprise and Professional licenses.<sup>1</sup> This entitlement pool can only be used by these non-licensed users and not by users with assigned interactive user licenses.

| Products                                                    | Pooled non-licensed tenant-level requests per 24 hours                              |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Dynamics 365 Enterprise & Professional applications<sup>1</sup> | 500,000 base requests + 5,000 requests accrued per USL<sup>1</sup> up to 10,000,000 max |
| Power Apps (all licenses)                                       | 25,000 base requests with no per-license accrual for the tenant                         |
| Power Automate (all licenses)                                   | 25,000 base requests with no per-license accrual for the tenant                         |

<sup>1</sup> This category includes licenses for Dynamics 365 Sales Premium, Dynamics 365 Sales Enterprise, Dynamics 365 Sales Professional, Dynamics 365 Customer Service Enterprise, Dynamics 365 Customer Service Professional, Dynamics 365 Field Service, Microsoft Relationship Sales, Dynamics 365 Project Service Automation, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Finance, Dynamics 365 Project Operations, Dynamics 365 Supply Chain Management, Dynamics 365 Customer Engagement plan, Dynamics 365 Unified Ops plan, Dynamics 365 Plan, Dynamics CRM Online Enterprise, and Dynamics CRM Online Professional.

### Additional details

Certain products operate in the concept of a service principal and will have their entitlement limits accrued to the non-licensed user pool. This is the best way to align entitlements with how the product operates on the platform.

If a tenant has multiple types of subscriptions, their non-licensed user request capacity will use the product line subscription with the larger number of requests. For example, if a customer has both Dynamics 365 Customer Service Enterprise base license subscriptions (500,000 minimum requests + accrued entitlements) and Power Apps per user subscriptions (25,000 requests/day), their pooled tenant-level request capacity will be 500,000 minimum requests + accrued entitlements per 24 hours.

## What happens if a licensed or non-licensed user exceeds entitlements

Power Platform Request entitlements have been updated and substantially increased in late 2021 to be at levels that are significantly higher than typical usage for most customers. With the updated entitlements, expectations are that very few users would exceed the documented limits. If you anticipate exceeding the non-licensed user limits, reach out to your reseller or Microsoft Account team to discuss a custom solution.

Any possible high usage enforcement will not happen until six months after Power Platform Request usage reporting has been generally available in the Power Platform Admin Center. Admin reports are expected to be available in the first quarter of calendar 2022.

Microsoft reserves the right to enforce entitlement limits for overages. If a customer encounters high usage enforcement, they can expect some form of throttling. Customers can purchase additional capacity to avoid high usage enforcement or move their environment to [pay-as-you-go](pay-as-you-go-overview.md) and pay for actual usage above daily entitlement limits.  

## Power Apps and Power Automate capacity add-on

Customers that observe in reporting that they are frequently using more requests than entitlement limits can avoid high usage enforcement by purchasing the Power Apps and Power Automate capacity add-on. This add-on allows customers to increase the entitlement limits for specific high usage licensed users or high usage non-licensed users. Each capacity add-on raises the request entitlements by another 50,000 per 24 hours. Multiple capacity add-ons can be assigned to increase entitlements.

> [!NOTE]
> Currently, capacity add-ons cannot be assigned to users (including application, administrative, and non-interactive users). The functionality for assignment of capacity add-ons will be aligned to the timing of high usage enforcement.

## Other applicable limits

Apart from the daily Power Platform Request entitlement limits, there are other service protection limits specific to each service. As with the daily request entitlements, these limits help maintain the quality of service by protecting the service from malicious or noisy behavior that would otherwise disrupt service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Dataverse limits](/powerapps/developer/common-data-service/api-limits): applicable for model-driven apps and customer engagement apps (such as Dynamics 365 Sales and Customer Service), Power Apps, and Power Automate connecting to Dataverse/customer engagement apps
- [Power Automate limits](/power-automate/limits-and-config): applicable for automated, scheduled, and instant flows
- [Limits in connectors](/connectors/): applicable for Power Automate and Power Apps

## Frequently asked questions

### What tools can I use to monitor and analyze Power Platform requests across the platform?

Reporting for Power Platform Request usage will be in the Power Platform admin center when generally available, expected in the first quarter of calendar 2022. This reporting will initially be a downloadable Excel format with daily reporting of request usage versus entitlements.

Until those reports are available, the Power Platform admin center contains [reports on Dataverse API requests](analytics-common-data-service.md). This reporting accounts for interactive and non-interactive traffic. This helps you to quickly view adoption and user metrics for your organization. If your apps or flows primarily use Dataverse, then these reports can serve as good approximations of the total usage of your solutions.

Additionally, for Power Automate usage specifically, you can see the action usage for a given flow by selecting the **Analytics** action from the flow properties page, and this works across all types of actions.

### What are the timelines for Power Platform Request entitlement limits?

The concept of entitlement limits was first introduced in late 2019 and documented entitlement limits were substantially increased in late 2021. Generally available reporting for Power Platform Requests is expected in the first quarter of calendar 2022. Any potential high usage enforcement wouldn't start until six months after reports have been made available. Assignment of add-on capacity packs should be aligned to high usage enforcement.

### What account's limits are used for classic workflows or Power Automate flows?

It depends if the process is run on-demand or in the background. Instant flows, which are run on-demand, will use the limits of the account who started the process. On the other hand, workflows or automated/scheduled flows that run in the background will always use the limits of the owner of the process irrespective of why the process started or what accounts are used for connections inside of the process.

### Do the Microsoft Power Platform request entitlements roll over from day to day or month to month?

No. All the Microsoft Power Platform Request exist for a 24-hour period. If they aren't consumed, they do not roll over to the next day nor do they accumulate within a month.

### Does each application user, non-interactive user, administrative user, or SYSTEM user get their own tenant-level limit?

No. Tenant level limits are shared across all application users, non-interactive users, administrative users, or SYSTEM user within the tenant.

### Do the requests generated from classic Dataverse workflows and plug-ins in Dataverse count against the request limits?

Yes, if these requests are making CRUD, assign, or share–type requests, they will count. In the case of classic workflows, this includes actions such as checking conditions, starting child workflows, or stopping workflows. However, requests generated internally from the platform aren't counted, such as: sdkmessagerequest, solutioncomponentdefinition, and ribbonclientmetadatareporting.

### Should I use a third-party data integration tool instead of Power Automate to avoid hitting my limits?

No, third-party data integration tools are subject to the exact same limits as scheduled, instant, or automated flows. Thus, there is no difference whether you choose to use Power Automate or a third-party tool. Moreover, requests from Power Automate to the Dataverse are not double-counted, a flow that calls one action will only count as one request against their limit, not two.

<!-- 
## Request limits based on user licenses

All the users of Microsoft Power Platform have limits on the number of requests based on the license they are assigned. The following table defines the number of requests a user can make in a 24-hour period: 

| User licenses | Number of API requests / 24 hours |
| ------------- | --------------------------------- |
| Dynamics 365 Enterprise applications<sup>1</sup> | 20,000 |
| Dynamics 365 Professional<sup>2</sup> | 10,000 |
| Dynamics 365 Team Member | 5,000 |
| Power Apps per user plan<sup>3</sup> | 5,000 |
| Power Automate per user plan<sup>3</sup>  | 5,000 |
| Office licenses (that include Power Apps, Power Automate, or Power Virtual Agents)<sup>4</sup>  | 2,000 |
| Power Apps per app plan | 1,000 per app pass |
| Non-licensed users | See [Requests limits not based on licensed users or flows](#requests-limits-not-based-on-licensed-users-or-flows) below |

<sup>1</sup> Dynamics 365 Enterprise applications include Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Project Service Automation, Dynamics 365 Commerce, Dynamics 365 HR, Dynamics 365 Customer Engagement plan, Dynamics 365 Finance, Dynamics 365 Project Operations, and Dynamics 365 Supply Chain Management.

<sup>2</sup> Dynamics 365 Professional includes Dynamics 365 Sales Professional, Dynamics 365 Customer Service Professional.

<sup>3</sup> The per user plans include the previous Plan 1 and Plan 2.

<sup>4</sup> See **Appendix B** for Microsoft 365 licenses that include Power Apps and Power Automate capabilities in the [Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).

If a user has multiple plans assigned from different product lines, the total number of requests allowed would be the sum of requests allocated to each license type. For example, if a user has both a Dynamics 365 Customer Service Enterprise license as well as a Power Apps per user license then that user will have a total of 20000 + 5000 = 25000 requests available per 24 hours.

If a user has multiple licenses allocated within the same product line, for example if a user has a Dynamics 365 Customer Service Enterprise license as the base license and a Dynamics 365 Sales Enterprise license attached, the total number of requests would be what is provided by the base license - Dynamics 365 Customer Service.


## Power Apps and Power Automate capacity add-on

A Power Apps and Power Automate capacity add-on allows customers to increase the limits for a given user. These will be assignable to any user who has a Power Apps, Power Automate, or applicable Dynamics 365 license.

Each capacity add-on raises the request limits by another 10,000 per 24 hours. Multiple capacity add-ons can also be assigned to the same user.

> [!NOTE] 
> Currently, capacity add-ons cannot be assigned to users (including application, administrative, and non-interactive users), because of the transition period (see [FAQ](#will-there-be-a-transition-period-for-existing-customers)) below. Assignment will be supported once the transition period ends.

## Requests limits not based on licensed users or flows

Dataverse enables you to have identities that do not require any user license to interact with the service. There are four types of
these users:

-   [Application users](create-users.md#create-an-application-user)
-   [Non-interactive users](create-users.md#create-a-non-interactive-user-account)
-   [Administrative users](create-users.md#create-an-administrative-user-account)
-   [SYSTEM user](/dynamics365/customer-engagement/web-api/systemuser?view=dynamics-ce-odata-9#operations)

Additionally there are special free (\$0) licenses, which are used to interact with Dynamics 365 applications like Dynamics 365 Marketing. See [How Marketing is licensed](/dynamics365/customer-engagement/marketing/purchase-setup#user-and-portal-licensing).

For these identities, every tenant will get base request capacity per tenant that can only be used by these users and not by users with standard licenses.

This base request capacity is based on the type of subscription, as follows:

1. If a tenant has at least one Dynamics 365 enterprise subscription, they will get 100,000 requests per 24 hours.
2. If a tenant has at least one Dynamics 365 professional subscription, they will get 50,000 requests per 24 hours.
3. If a tenant has at least one Microsoft Power Apps or Power Automate subscription, they will get 25,000 requests per 24 hours.

If a tenant has multiple types of subscriptions, their base request capacity will use the subscription with the larger number of requests. For example, if a customer has both Dynamics 365 Customer Service (100,000 requests) and Power Apps per user (25,000 requests) subscriptions, their base request capacity will be 100,000 requests per 24 hours.

Base request capacity is defined at the tenant level and can only be used by non-licensed users, application users, and users who have free ($0) licenses.

After base request capacity is exhausted, customers can increase this capacity by purchasing a Power Apps and Power Automate capacity add-on.

The Power Automate per flow plan allows capacity to be specifically reserved for a single flow, irrespective of the owner of the flow. Each flow assigned to the per flow plan gets 15,000 per 24 hours. This does not use the base request capacity at the tenant level.

## Power Virtual Agents capacity and limits

When you purchase a Power Virtual Agents license, your tenant will get 30,000 API calls every 24 hours. These API calls are only consumed by Power Automate flows that are triggered from a Power Virtual Agents chatbot.

You can purchase multiple Power Virtual Agents capacity add-ons. Each add-on will increase the number of requests by 15,000. 

## Other applicable limits

Apart from the daily API request limit, there are other service protection limits specific to each service. These limits may be lower or higher than the daily per user limits for a 24-hour period. As with the daily limits, these limits help maintain the quality of service by protecting the service from malicious or noisy behavior that would otherwise disrupt service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Dataverse  limits](/powerapps/developer/common-data-service/api-limits): applicable for model-driven apps and customer engagement apps (such as Dynamics 365 Sales and Customer Service), Power Apps, and Power Automate connecting to Dataverse/customer engagement apps
- [Power Automate limits](/power-automate/limits-and-config): applicable for automated, scheduled, and instant flows
- [Limits in connectors](/connectors/): applicable for Power Automate and Power Apps

## Frequently asked questions

### What tools can I use to monitor and analyze API requests across the platform?

Today, the Power Platform admin center contains [reports on Dataverse API requests](./analytics-common-data-service.md). This reporting today accounts for interactive and non-interactive traffic. This helps you to quickly view adoption and user metrics for your organization. If your apps or flows primarily use the Dataverse, then these reports can serve as good approximations of the total usage of your solutions.

Additionally, for Power Automate usage specifically, you can see the action usage for a given flow by selecting the **Analytics** action from the flow properties page, and this works across all types of actions. However, if your apps or flows do not use the Dataverse, then there are no reports available in the Power Platform admin center at this time.

### What happens if a user or integration exceeds request capacity?

When users exceed their limits, administrators can see this in the admin center (see above). You can do either one of the following:

- Adjust the app or flow to use fewer API requests

- Purchase the **Power Apps and Power Automate capacity add-on** for your organization. 

Users won't be blocked from using an app or flow for occasional and reasonable overages at this point in time. However, if a user or flow exceeds the limits consistently for an extended period of time (more than 14 days), that user may be disabled or flow turned off.

In addition, there are other applicable limits for [Dataverse](/powerapps/developer/common-data-service/api-limits), [Power Automate](/power-automate/limits-and-config), and [Connectors](/connectors/) that might directly impact your users, and those limits may not have any affordance for occasional or reasonable overages. Flow owners will be notified via email if their flow is failing or encountering such limits, so be sure to monitor email for notifications about such flows.

### Will there be a transition period for existing customers?

Yes, all customers are in a transition period. That means that enforcement of the limits is not as strict compared to once the transition period ends, which will be after the full reporting is available in the Power Platform admin center. This does not mean there are *no* daily limits - it simply means that the currently enforced limits are more generous than the stated limits, in order to prevent potential unintended impact on your apps or flows.

Additionally, as enforcement is currently less strict, there is no facility to yet assign the **Power Apps and Power Automate capacity add-on** to a user. However, it is recommended that you purchase these add-ons now to remain within your license terms and to be prepared for when the transition period ends. 

### Will my integrations stop working if application users exceed base request capacity?

We do not currently stop integrations for occasional and reasonable overages. For flows that use Dataverse, administrators can see usage in the Analytics section of the Power Platform admin center. However, at this time, if a user or flow exceeds the limits consistently for an extended period of time, that user may be disabled or flow turned off.

Once the transition period ends, certain operations will additionally be blocked when a tenant exceeds their Microsoft Power Platform request limits. These blocked operations will primarily be in administration and customization areas, but not limited to these operations (and may expand into other areas as well, depending on the overage scenarios). 

### What account's limits are used for classic workflows or Power Automate flows?

It depends if the process is run on-demand or in the background. Instant flows, which are run on-demand, will use the limits of the account who started the process. On the other hand, workflows or automated/scheduled flows that run in the background will always use the limits of the owner of the process irrespective of why the process started or what accounts are used for connections inside of the process.

### Do the Microsoft Power Platform request limits roll over from day to day or month to month?

No. As it is a service performance limit, all the Microsoft Power Platform request limits are calculated on a rolling 24-hour period. If they aren't consumed, they don't roll over to the next day or next month.

### Does each application user, non-interactive user, administrative user, or SYSTEM user get their own tenant-level limit?

No. Tenant level limits are shared across all application users, non-interactive users, administrative users, or SYSTEM user within the tenant.

### Do the requests generated from classic Dataverse workflows and plug-ins in Dataverse count against the request limits?

Yes, if these requests are making CRUD, assign, or share&ndash;type requests, they will count. In the case of classic workflows, this includes actions such as checking conditions, starting child workflows, or stopping workflows. However, requests generated internally from the platform aren't counted, such as: sdkmessagerequest, solutioncomponentdefinition, and ribbonclientmetadatareporting.

### Should I use a third-party data integration tool instead of Power Automate to avoid hitting my limits?

No, third-party data integration tools are subject to the exact same limits as scheduled, instant, or automated flows. Thus, there is no difference whether you choose to use Power Automate or a third-party tool. Moreover, requests from Power Automate to the Dataverse are not double-counted, a flow that calls one action will only count as one request against their limit, not two.
-->


### See also
[Dataverse API limits overview](/powerapps/maker/common-data-service/api-limits-overview) <br />
[Power Automate limits and configuration](/power-automate/limits-and-config)





[!INCLUDE[footer-include](../includes/footer-banner.md)]
