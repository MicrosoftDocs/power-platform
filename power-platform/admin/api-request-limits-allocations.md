---
title: Requests limits and allocations | Microsoft Docs
description: FAQ for licensing PowerApps and Microsoft Flow
author: dileepsinghmicrosoft
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/01/2019
ms.author: dileeps
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Requests limits and allocations

Effective October 2019, to help ensure service levels, availability and quality, there are entitlement limits to the number of requests users can make each day across model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service) PowerApps, and Microsoft Flow.

## What is a Microsoft Power Platform request?

Requests in Microsoft Power Platform consist of various actions which a user makes across various products. At a high level, below is what constitute an API call:

- **Connectors** – all API requests to connectors from PowerApps or Microsoft Flow

- **Microsoft Flow** – all Microsoft Flow step actions

- **Common Data Service** – all CRUD operations, as well as special operations like “share” or “assign”. These can be from any client or application and using any endpoint SOAP or REST. These include but are not limited to plug-ins, async workflows, and custom controls making the above mentioned operations.

Note that for Common Data Service, there will be a small set of system internal operations that are excluded, like login, logout, and system metadata operations like getClientMetadata.

This table below will describe the common requests limits as well as the allocation which a user gets based on the type of license assigned to the user.

## Microsoft Power Platform requests allocations based on licenses

All the users of Microsoft Power Platform can use a certain number of requests based on the license they are assigned. The following table defines the number of requests a user can make in a 24-hour period:

| **User licenses**                                        | **Number of API requests / 24 hours**                                                                                                         |
|----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Dynamics 365 Enterprise applications<sup>1</sup>                  | 20,000                                                                                                                                        |
| Dynamics 365 Professional <sup>2</sup>                          | 10,000                                                                                                                                        |
| Dynamics 365 Team Member                                 | 5,000                                                                                                                                         |
| PowerApps per user plan                                  | 5,000                                                                                                                                         |
| Microsoft Flow per user plan                             | 5,000                                                                                                                                         |
| Office licenses (that include PowerApps/Microsoft Flow)  | 2,000                                                                                                                                         |
| Application user / Non-interactive users                 | [See section below](https://docs.microsoft.com/power-platform/admin/api-request-limits-allocations#non-licensed-usersapplication-users) |


<sup>1</sup>Dynamics 365 Enterprise applications include Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365  Project Service Automation, Dynamics 365 Retail, Dynamics 365 Talent.

<sup>2</sup>Dynamics 365 Professional includes Dynamics 365 Sales Professional, Dynamics 365 Customer Service Professional.


Users who are running apps and flows without a user license through the PowerApps per app plan or flows licensed through the Microsoft Flow per flow plan are granted the following API request entitlement.


| **Non User Licenses **       | **Number of API requests / 24 hours** |
|------------------------------|---------------------------------------|
| PowerApps per app plan       | 1,000 per user pass                   |
| Microsoft Flow per flow plan | 15,000 per flow                       |


If a user has multiple plans assigned from different product lines, the total number of requests allowed would be the sum of requests allocated to each license type. For example, if a user has both a Dynamics 365 Customer Service Enterprise license as well as a PowerApps per user license , then that user will have a total of 20000 + 5000 = 25000 requests available per 24 hours.

If a user has multiple licenses allocated within the same product line, for example if a user has a Dynamics 365 Customer Service Enterprise license as the base license and a Dynamics 365 Sales Enterprise license attached, the total number of requests would be what is provided by the base license - Dynamics 365 Customer Service.


## PowerApps and Microsoft Flow capacity add-on

PowerApps and Microsoft Flow capacity add-on allows customers to purchase additional requests which can be assigned to any user who has a PowerApps/Microsoft Flow license as well as Dynamics 365 license. These can be assigned to an application, and administrative and non-interactive users.

Each capacity add-on provides an additional 10,000 requests/24 hours which can be assigned to any user. Multiple capacity add-ons can also be assigned to the same user.

## Non-licensed users/application users/Users with special free licenses

Common Data Service also provides the ability to have identities that do not require any user license to interact with the service. There are three types of
these users:

-   [Application users](https://docs.microsoft.com/dynamics365/customer-engagement/admin/create-users-assign-online-security-roles#create-an-application-user)

-   [Non-interactive users](https://docs.microsoft.com/dynamics365/customer-engagement/admin/create-users-assign-online-security-roles#create-a-non-interactive-user-account)

-   [Administrative users](https://docs.microsoft.com/dynamics365/customer-engagement/admin/create-users-assign-online-security-roles#create-an-administrative-user-account).

Additionally there are special free (\$0) licenses which are used to interact with Dynamics 365 applications like Dynamics 365 Marketing. See [How Marketing is licensed](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/purchase-setup#how-marketing-is-licensed).

For these users, every tenant will get base request capacity per tenant which can only be used by these users and not by users with standard licenses.

This base request capacity would be based on the type of subscription and would be as follows:

1. If a tenant has at least one Dynamics 365 enterprise subscription, they will get 100,000 requests per 24 hours

2. If a tenant has at least one Dynamics 365 professional subscription, they will get 50,000 requests per 24 hours

3. If a tenant has at least one Microsoft PowerApps or Flow subscription, they will get 25,000 requests per 24 hours.

If a tenant has multiple type of subscriptions, their base request capacity would be max of two subscriptions. For example, if a customer has both Dynamics 365 Customer Service and PowerApps per user subscription, their base request capacity would be 100,000 Requests per 24 hours.

Base Request Capacity would be at tenant level and can only be used by non-licensed users, application users and users which has free ($0) licenses.

Once the Base Request capacity is exhausted, customers can increase this capacity by purchasing PowerApps and Microsoft Flow capacity add-on.

## Service protection limits currently applicable

Apart from the new daily API request limit, there are other service protection limits specific to various services that exist currently. These limits are usually much higher when compared to the daily per user entitlements for a 24-hour period. Limits help maintain the quality of service by protecting the service from malicious or noisy behavior that would otherwise disrupt service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Common Data Service API request limits](https://docs.microsoft.com/powerapps/developer/common-data-service/api-limits): applicable for model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service), PowerApps, and Microsoft Flow connecting to Common Data Service/model-driven apps in Dynamics 365

- [Microsoft Flow limits](https://docs.microsoft.com/flow/limits-and-config#looping-and-debatching-limits): applicable for Microsoft Flow

- [Limits in connectors](https://docs.microsoft.com/connectors/): applicable for Microsoft Flow and PowerApps


## Frequently asked questions

### What happens if any user exceeds Request capacity?

If any user exceeds request capacity, admin for the tenant/environment would be notified and would be able to assign PowerApps and Microsoft Flow request capacity to that user.

End users will not be blocked from using the app for occasional and reasonable overages at this point of time.

### Will my Integrations stop working if application users exceeds Base Request capacity?

Integrations will not be stopped for occasional and reasonable overages at this point of time. Administrators would be notified about overages and will be able to add PowerApps and Microsoft Flow request capacity to be compliant.

### Will there be a transition period for existing customers?

Yes, all existing customers will have a transition period until October 1, 2020 or the expiration of their current subscription term, whichever is longer.

During this transition period reporting would be made available to customers which shows the API consumption.

### What tools can admin use to monitor/analyze API requests across the platform?

Usage reports and monitoring capabilities would be made available in Power Platform Admin Center soon and would be the best way to monitor/analyze usage for API requests. 

### Do the Power Platform Requests entitlements roll over from day to day or month to month?

No. All the power platform request entitlements are calculated on a rolling 24-hour period. If they are not consumed, they don’t roll over to the next day or next month.

### Will the requests generated from Async workflows and Plug-ins in CDS count against the Request limits?

Yes, if these requests are making CRUD, assign or share type of calls, they would count. However, calls generated internally from the platform are not going to be accounted.

