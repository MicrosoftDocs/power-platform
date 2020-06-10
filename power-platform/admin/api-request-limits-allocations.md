---
title: Requests limits and allocations | Microsoft Docs
description: FAQ for licensing Power Apps and Power Automate
author: dileepsinghmicrosoft
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/04/2020
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

Effective October 2019, to help ensure service levels, availability and quality, there are entitlement limits to the number of requests users can make each day across model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service) Power Apps, and Power Automate.

## What is a Microsoft Power Platform request?

Requests in Microsoft Power Platform consist of various actions which a user makes across various products. At a high level, below is what constitute an API call:

- **Connectors** – all API requests to connectors from Power Apps or Power Automate

- **Microsoft Power Automate** – all Power Automate step actions

- **Common Data Service** – all CRUD operations, as well as special operations like "share" or "assign". These can be from any client or application and using any endpoint SOAP or REST. These include but are not limited to plug-ins, async workflows, and custom controls making the above mentioned operations.

Note that for Common Data Service, there will be a small set of system internal operations that are excluded, like login, logout, and system metadata operations like getClientMetadata.

This table below will describe the common requests limits as well as the allocation which a user gets based on the type of license assigned to the user.

## Microsoft Power Platform requests allocations based on licenses

All the users of Microsoft Power Platform can use a certain number of requests based on the license they are assigned. The following table defines the number of requests a user can make in a 24-hour period: 

| **User licenses**                                        | **Number of API requests / 24 hours**                                                                                                         |
|----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Dynamics 365 Enterprise applications<sup>1</sup>                  | 20,000                                                                                                                                        |
| Dynamics 365 Professional <sup>2</sup>                          | 10,000                                                                                                                                        |
| Dynamics 365 Team Member                                 | 5,000                                                                                                                                         |
| Power Apps per user plan                                  | 5,000                                                                                                                                         |
| Power Automate per user plan                             | 5,000                                                                                                                                         |
| Office licenses (that include Power Apps/Power Automate)<sup>3</sup>  | 2,000                                                                                                                                         |
| Application user / Non-interactive users                 | See *Non-licensed user* section below |


<sup>1</sup>Dynamics 365 Enterprise applications include Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365  Project Service Automation, Dynamics 365 Retail, Dynamics 365 Talent, Dynamics 365 Customer Engagement plan.

<sup>2</sup>Dynamics 365 Professional includes Dynamics 365 Sales Professional, Dynamics 365 Customer Service Professional.

<sup>3</sup>See **Appendix D** for Microsoft 365 licenses that include Power Apps and Power Automate capabilities in the [Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).


Users who are running apps and flows without a user license through the Power Apps per app plan or flows licensed through the Power Automate per flow plan are granted the following API request entitlement.


| **Non User Licenses **       | **Number of API requests / 24 hours** |
|------------------------------|---------------------------------------|
| Power Apps per app plan       | 1,000 per user pass                   |
| Power Automate per flow plan | 15,000 per flow                       |


If a user has multiple plans assigned from different product lines, the total number of requests allowed would be the sum of requests allocated to each license type. For example, if a user has both a Dynamics 365 Customer Service Enterprise license as well as a Power Apps per user license , then that user will have a total of 20000 + 5000 = 25000 requests available per 24 hours.

If a user has multiple licenses allocated within the same product line, for example if a user has a Dynamics 365 Customer Service Enterprise license as the base license and a Dynamics 365 Sales Enterprise license attached, the total number of requests would be what is provided by the base license - Dynamics 365 Customer Service.


## Power Apps and Power Automate capacity add-on

Power Apps and Power Automate capacity add-on allows customers to purchase additional requests. Eventually, these may be assigned to any user who has a Power Apps/Power Automate license as well as a Dynamics 365 license. 

Each capacity add-on provides an additional 10,000 requests/24 hours which can be assigned to any user. Multiple capacity add-ons can also be assigned to the same user.

> [!NOTE] 
> Power Apps and Power Automate capacity add-ons cannot be assigned to users yet. Assignment will be possible later in calendar year 2020. When supported these may be assigned to application and administrative and non-interactive users.

## Non-licensed users/application users/Users with special free licenses 

Common Data Service also provides the ability to have identities that do not require any user license to interact with the service. There are three types of
these users:

-   [Application users](create-users-assign-online-security-roles.md#create-an-application-user)

-   [Non-interactive users](create-users-assign-online-security-roles.md#create-a-non-interactive-user-account)

-   [Administrative users](create-users-assign-online-security-roles.md#create-an-administrative-user-account). 

Additionally there are special free (\$0) licenses which are used to interact with Dynamics 365 applications like Dynamics 365 Marketing. See [How Marketing is licensed](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/purchase-setup#how-marketing-is-licensed).

For these users, every tenant will get base request capacity per tenant that can only be used by these users and not by users with standard licenses.

This base request capacity is based on the type of subscription, as follows:

1. If a tenant has at least one Dynamics 365 enterprise subscription, they will get 100,000 requests per 24 hours.

2. If a tenant has at least one Dynamics 365 professional subscription, they will get 50,000 requests per 24 hours.

3. If a tenant has at least one Microsoft Power Apps or Power Automate subscription, they will get 25,000 requests per 24 hours.

If a tenant has multiple types of subscriptions, their base request capacity will use the subscription with the larger number of requests. For example, if a customer has both Dynamics 365 Customer Service (100,000 requests) and Power Apps per user (25,000 requests) subscriptions, their base request capacity will be 100,000 requests per 24 hours.

Base request capacity is defined at the tenant level and can only be used by non-licensed users, application users, and users who have free ($0) licenses.

After base request capacity is exhausted, customers can increase this capacity by purchasing a Power Apps and Power Automate capacity add-on.

## Service protection limits currently applicable

Apart from the new daily API request limit, there are other service protection limits specific to various services that exist currently. These limits are usually much higher when compared to the daily per user entitlements for a 24-hour period. Limits help maintain the quality of service by protecting the service from malicious or noisy behavior that would otherwise disrupt service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Common Data Service API request limits](https://docs.microsoft.com/powerapps/developer/common-data-service/api-limits): applicable for model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service), Power Apps, and Power Automate connecting to Common Data Service/model-driven apps in Dynamics 365

- [Microsoft Power Automate limits](https://docs.microsoft.com/flow/limits-and-config#looping-and-debatching-limits): applicable for Power Automate

- [Limits in connectors](https://docs.microsoft.com/connectors/): applicable for Power Automate and Power Apps


## Frequently asked questions

### What happens if any user exceeds request capacity?

If any user exceeds their request capacity, the admin for the tenant/environment is notified. The admin can assign Power Apps and Power Automate request capacity to that user.

Users won't be blocked from using the app for occasional and reasonable overages at this point in time.

### Will my integrations stop working if application users exceed base request capacity?

Integrations won't be stopped for occasional and reasonable overages at this point in time. Admins will be notified about overages and will be able to add Power Apps and Power Automate request capacity to be compliant.

### Will there be a transition period for existing customers?

Yes, all existing customers will have a transition period until reporting is made available in Power Platform Admin Center, or the expiration of their current subscription term, whichever is longer.

During this transition period, reporting that shows the API consumption will be made available to customers.

### What tools can an admin use to monitor and analyze API requests across the platform?

Usage reports and monitoring capabilities will be made available in Power Platform admin center soon, and will be the best way to monitor and analyze usage for API requests. 

### Do the Power Platform request entitlements roll over from day to day or month to month?

No. All the Power Platform request entitlements are calculated on a rolling 24-hour period. If they aren't consumed, they don't roll over to the next day or next month.

### Will the requests generated from async workflows and plug-ins in Common Data Service count against the request limits?

Yes, if these requests are making CrUD, assign, or share&ndash;type calls, they will count. However, calls generated internally from the platform aren't going to be counted.

### See also
[Common Data Service API limits overview](https://docs.microsoft.com/powerapps/maker/common-data-service/api-limits-overview)
