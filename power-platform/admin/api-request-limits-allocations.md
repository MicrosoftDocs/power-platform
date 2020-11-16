---
title: Requests limits and allocations | Microsoft Docs
description: Requests limits and allocations
author: dileepsinghmicrosoft
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/02/2020
ms.author: dileeps
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

Effective October 2019, to help ensure service levels, availability, and quality, there are entitlement limits to the number of requests users can make each day across Power Apps, Power Automate, AI Builder, Power Virtual Agents, and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).

## What is a Microsoft Power Platform request?

Requests in Microsoft Power Platform consist of various actions that a user makes across various products. At a high level, below is what constitute an API request:

- **Power Apps** – all API requests to connectors and Microsoft Dataverse.
- **Power Automate** – all API requests to connectors, HTTP actions, and built-in actions from initializing variables to a simple compose action. Both succeeded and failed actions count towards these limits. Additionally, retries and additional requests from pagination count as action executions as well. 
- **Common Data Service** – all create, read, update, and delete (CRUD), assign, and share operations including user-driven and internal system requests required to complete CRUD transactions, as well as special operations like share or assign. These can be from any client or application and using any endpoint (SOAP or REST). These include, but are not limited to, plug-ins, classic workflows, and custom controls making the earlier-mentioned operations.

> [!NOTE]
> For Dataverse, there is be a small set of system internal operations that are excluded from limits, such as login, logout, and system metadata operations.

The table below will describe the common requests limits as well as the allocation that a user gets based on the type of license assigned to the user.

## Request limits based on user licenses

All the users of Microsoft Power Platform have limits on the number of requests based on the license they are assigned. The following table defines the number of requests a user can make in a 24-hour period: 

| User licenses | Number of API requests / 24 hours |
| ------------- | --------------------------------- |
| Dynamics 365 Enterprise applications<sup>1</sup> | 20,000 |
| Dynamics 365 Professional<sup>2</sup> | 10,000 |
| Dynamics 365 Team Member | 5,000 |
| Power Apps per user plan<sup>3</sup> | 5,000 |
| Power Automate per user plan<sup>3</sup>  | 5,000 |
| Office licenses (that include Power Apps/Power Automate)<sup>4</sup>  | 2,000 |
| Power Apps per app plan | 1,000 per user pass |
| Non-licensed users | See *Non-licensed user* section below |

<sup>1</sup> Dynamics 365 Enterprise applications include Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365  Project Service Automation, Dynamics 365 Retail, Dynamics 365 Talent, Dynamics 365 Customer Engagement plan.

<sup>2</sup> Dynamics 365 Professional includes Dynamics 365 Sales Professional, Dynamics 365 Customer Service Professional.

<sup>3</sup> The per user plans include the previous Plan 1 and Plan 2.

<sup>4</sup> See **Appendix B** for Microsoft 365 licenses that include Power Apps and Power Automate capabilities in the [Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).

If a user has multiple plans assigned from different product lines, the total number of requests allowed would be the sum of requests allocated to each license type. For example, if a user has both a Dynamics 365 Customer Service Enterprise license as well as a Power Apps per user license then that user will have a total of 20000 + 5000 = 25000 requests available per 24 hours.

If a user has multiple licenses allocated within the same product line, for example if a user has a Dynamics 365 Customer Service Enterprise license as the base license and a Dynamics 365 Sales Enterprise license attached, the total number of requests would be what is provided by the base license - Dynamics 365 Customer Service.


## Power Apps and Power Automate capacity add-on

Power Apps and Power Automate capacity add-on allows customers to increase the limits for a given user. These will be assignable to any user who has a Power Apps or Power Automate license as well as a Dynamics 365 license. 

Each capacity add-on raises the request limits by an additional 10,000 per 24 hours. Multiple capacity add-ons can also be assigned to the same user.

> [!NOTE] 
> Currently, capacity add-ons cannot be assigned to users (including application, administrative, and non-interactive users), because of the transition period. Assignment will be supported once the transition period ends, during 2020 Release Wave 2.

## Requests limits not based on licensed users or flows

The Dataverse provides the ability to have identities that do not require any user license to interact with the service. There are four types of
these users:

-   [Application users](create-users-assign-online-security-roles.md#create-an-application-user)
-   [Non-interactive users](create-users-assign-online-security-roles.md#create-a-non-interactive-user-account)
-   [Administrative users](create-users-assign-online-security-roles.md#create-an-administrative-user-account)
-   [SYSTEM user](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/systemuser?view=dynamics-ce-odata-9#operations)

Additionally there are special free (\$0) licenses which are used to interact with Dynamics 365 applications like Dynamics 365 Marketing. See [How Marketing is licensed](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/purchase-setup#how-marketing-is-licensed).

For these identities, every tenant will get base request capacity per tenant that can only be used by these users and not by users with standard licenses.

This base request capacity is based on the type of subscription, as follows:

1. If a tenant has at least one Dynamics 365 enterprise subscription, they will get 100,000 requests per 24 hours.
2. If a tenant has at least one Dynamics 365 professional subscription, they will get 50,000 requests per 24 hours.
3. If a tenant has at least one Microsoft Power Apps or Power Automate subscription, they will get 25,000 requests per 24 hours.

If a tenant has multiple types of subscriptions, their base request capacity will use the subscription with the larger number of requests. For example, if a customer has both Dynamics 365 Customer Service (100,000 requests) and Power Apps per user (25,000 requests) subscriptions, their base request capacity will be 100,000 requests per 24 hours.

Base request capacity is defined at the tenant level and can only be used by non-licensed users, application users, and users who have free ($0) licenses.

After base request capacity is exhausted, customers can increase this capacity by purchasing a Power Apps and Power Automate capacity add-on.

The Power Automate per flow plan allows capacity to be specifically reserved for a single flow, irrespective of the owner of the flow. Each flow assigned to the per flow plan gets 15,000 per 24 hours. This does not use the base request capacity at the tenant level.

## Other applicable limits

Apart from the daily API request limit, there are other service protection limits specific to each service. These limits may be lower or higher than the daily per user limits for a 24-hour period. As with the daily limits, these limits help maintain the quality of service by protecting the service from malicious or noisy behavior that would otherwise disrupt service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Dataverse  limits](https://docs.microsoft.com/powerapps/developer/common-data-service/api-limits): applicable for model-driven apps and customer engagement apps (such as Dynamics 365 Sales and Customer Service), Power Apps, and Power Automate connecting to Dataverse/customer engagement apps
- [Power Automate limits](https://docs.microsoft.com/flow/limits-and-config): applicable for automated, scheduled, and instant flows
- [Limits in connectors](https://docs.microsoft.com/connectors/): applicable for Power Automate and Power Apps

## Frequently asked questions

### What tools can I use to monitor and analyze API requests across the platform?

Today, the Power Platform Admin Center contains [reports on Dataverse API requests](https://docs.microsoft.com/power-platform/admin/analytics-common-data-service). This reporting today accounts for interactive and non-interactive traffic. This helps you to quickly view adoption and user metrics for your organization. If your apps or flows primarily use the Dataverse, then these reports can serve as good approximations of the total usage of your solutions.

Additionally, for Power Automate usage specifically, you can see the action usage for a given flow by selecting the **Analytics** action from the flow properties page, and this works across all types of actions. However, if your apps or flows do not use the Dataverse, then at this time there are no reports available in the Power Platform Admin center, although this will be available during 2020 Release Wave 2. Administrators will also be notified via email about overages as a part of 2020 Release Wave 2.

### What happens if a user or integration exceeds request capacity?

When users exceed their limits, administrators can see this in the admin center (see above). You can do either one of the following:

- Adjust the app or flow to use fewer API requests

- Purchase the **Power Apps and Power Automate capacity add-on** for your organization. 

Users won't be blocked from using an app or flow for occasional and reasonable overages at this point in time. However, if a user or flow exceeds the limits consistently for an extended period of time (more than 14 days), that user may be disabled or flow turned off.

In addition, there are other applicable limits for [Dataverse](https://docs.microsoft.com/powerapps/developer/common-data-service/api-limits), [Power Automate](https://docs.microsoft.com/flow/limits-and-config), and [Connectors](https://docs.microsoft.com/connectors/) that might directly impact your users, and those limits may not have any affordance for occasional or reasonable overages. Flow owners will be notified via email if their flow is failing or encountering such limits, so be sure to monitor email for notifications about such flows.

### Will there be a transition period for existing customers?

Yes, for the year of 2020, *all* customers are in a transition period. That means that enforcement of the limits is not as strict compared to once the transition period ends, which will be after the full reporting is available in the Power Platform admin center (2020 release wave 2). This does not mean there are *no* daily limits - it simply means that the currently enforced limits are more generous than the stated limits, in order to prevent potential unintended impact on your apps or flows.

Additionally, as enforcement is currently less strict, there is no facility to yet assign the **Power Apps and Power Automate capacity add-on** to a user. However, it is recommended that you purchase these add-ons now to remain within your license terms and to be prepared for when the transition period ends. 

### Will my integrations stop working if application users exceed base request capacity?

We do not currently stop integrations for occasional and reasonable overages. Administrators can see usage in the Power Platform admin center (for the Dataverse, with general reporting coming during 2020 release wave 2). However, at this time, if a user or flow exceeds the limits consistently for an extended period of time, that user may be disabled or flow turned off.

Once the transition period ends, certain operations will additionally be blocked when a tenant exceeds their Power Platform request limits. These blocked operations will primarily be in administration and customization areas, but not limited to these operations (and may expand into other areas as well, depending on the overage scenarios). 

### What account's limits are used for classic workflows or Power Automate flows?

It depends if the process is run on-demand or in the background. Instant flows, which are run on-demand, will use the limits of the account who started the process. On the other hand, workflows or automated/scheduled flows that run in the background will always use the limits of the owner of the process irrespective of why the process started or what accounts are used for connections inside of the process.

### Do the Microsoft Power Platform request limits roll over from day to day or month to month?

No. As it is a service performance limit, all the Power Platform request limits are calculated on a rolling 24-hour period. If they aren't consumed, they don't roll over to the next day or next month.

### Does each application user, non-interactive user, administrative user, or SYSTEM user get their own tenant-level limit?

No. Tenant level limits are shared across all application users, non-interactive users, administrative users, or SYSTEM user within the tenant.

### Do the requests generated from classic Dataverse workflows and plug-ins in Dataverse count against the request limits?

Yes, if these requests are making CRUD, assign, or share&ndash;type requests, they will count. In the case of classic workflows, this includes actions such as checking conditions, starting child workflows or stopping workflows. However, requests generated internally from the platform aren't counted, such as: sdkmessagerequest, solutioncomponentdefinition, and ribbonclientmetadatareporting.

### Should I use a third-party data integration tool instead of Power Automate to avoid hitting my limits?

No, third-party data integration tools are subject to the exact same limits as scheduled, instant, or automated flows. Thus, there is no difference whether you choose to use Power Automate or a third-party tool. Moreover, requests from Power Automate to the Dataverse are not double-counted, a flow that calls one action will only count as one request against their limit, not two.

### See also
[Dataverse API limits overview](https://docs.microsoft.com/powerapps/maker/common-data-service/api-limits-overview)
