---
title: Requests limits and allocations | Microsoft Docs
description: FAQ for licensing PowerApps and Microsoft Flow
author: dileepsinghmicrosoft
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/29/2019
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


<!-- from editor: Because it's not October yet, I suggest changing "there are" to "there will be". 
Do you want to remove "for Customer Engagement" to be in compliance with the updated naming? 
-->


Starting in October 2019, to help ensure service levels, availability, and quality, there are limits to the number of requests users can make across Dynamics 365 for Customer Engagement apps, PowerApps, and Microsoft Flow. These limits are based on various parameters like the number of requests, throughput, and concurrency, and help prevent users running applications that could interfere with each other based on resource constraints.

This document describes the common requests limits as well as the allocations that users get based on the types of license assigned to them.

## Microsoft Power Platform requests allocations based on licenses 

All the users of Microsoft Power Platform can use a certain number of requests based on the license they are assigned. The following table defines the number of requests a user can make in a 24-hour period:

| User licenses                              | Number of API requests / 24 hours                              |
|------------------------------------------------|-----------------------------------------------------------|
| Dynamics 365 Enterprise applications<sup>*</sup>         | 20,000                                          |
| Dynamics 365 Professional <sup>**</sup>                 | 10,000                                           |
| Dynamics 365 Team Member                       | 5,000                                                     |
| PowerApps per user plan                        | 5,000                                                     |
| Microsoft Flow per user plan                             | 5,000                                                     |
| Office licenses (that include PowerApps/Microsoft Flow)  | 2,000                                                     |
| Application user / Non-interactive users       | [See section below](#non-licensed-usersapplication-users) |

<sup>*</sup>Dynamics 365 Enterprise applications include Dynamics 365 for Sales Enterprise, Dynamics 365 for Customer Service Enterprise, Dynamics 365 for Field Service, Dynamics 365 for Project Service Automation, Dynamics 365 for Retail, Dynamics 365 for Talent. 

<sup>**</sup>Dynamics 365 Professional includes Dynamics 365 for Sales Professional, Dynamics 365 for Customer Service Professional.

Users who are running apps and flows without a user license through the PowerApps per app plan or the Microsoft Flow per flow plan are granted the following
per-user API request entitlement.

| Add-on                | Number of API requests  |
|-------------------------|---------------------|
| PowerApps per app plan  | 1,000 per user pass |
| Microsoft Flow per flow plan      | 15,000 per flow     |

If a user has multiple plans assigned from different product lines, the total number of requests allowed would be the sum of requests allocated
to each license type. For example, if a user has both a Dynamics 365 for Customer Service Enterprise plan as well as a PowerApps per app plan, then that
user will have a total of 20000 + 1000 = 21000 requests available per 24 hours.

If a user has multiple licenses allocated within the same product line, for example if a user has a Dynamics 365 for Customer Service Enterprise license as the base license and a Dynamics 365 for Sales Enterprise license attached, the total number of requests would be what is provided by the base license - Dynamics 365
for Customer Service.

### PowerApps and Microsoft Flow capacity add-on

PowerApps and Microsoft Flow capacity add-on allows customers to purchase additional requests which can be assigned to any user who has a PowerApps/ Microsoft Flow license as well as Dynamics 365 license. These can be assigned to an application, and administrative and non-interactive users.

Each capacity add-on provides an additional 10,000 requests/24 hours which can be assigned to any user. Multiple capacity add-ons can also be assigned to the same
user.

## Non-licensed users/application users

The Common Data Service also provides the ability to have identities that do not require any user license to interact with the service. There are three types of
these users:
- [Application users](https://docs.microsoft.com/dynamics365/customer-engagement/admin/create-users-assign-online-security-roles#create-an-application-user)
- [Non-interactive users](https://docs.microsoft.com/dynamics365/customer-engagement/admin/create-users-assign-online-security-roles#create-a-non-interactive-user-account)
- [Administrative users](https://docs.microsoft.com/dynamics365/customer-engagement/admin/create-users-assign-online-security-roles#create-an-administrative-user-account).

Request limits are applicable to these users, like licensed users. By default, since these users do not have any licenses assigned to them, they are
allocated zero requests. However, PowerApps and Microsoft Flow capacity add-on can be assigned to these users; required to enable app usage for these users.

## Service protection limits currently applicable

Apart from the new daily API request limit, there are other service protections limits specific to various services which exist currently. These limits are usually much higher when compared to the daily per user entitlements for a 24-hour period. Limits help maintain the quality of service by protecting the service from malicious or noisy behavior that would otherwise disrupt service for all customers.

Review the following resources for information about *current* service protection limits for each service:

- [Common Data Service API request limits](https://docs.microsoft.com/powerapps/developer/common-data-service/api-limits): applicable for Dynamics 365 for Customer Engagement apps, PowerApps, and Microsoft Flow connecting to Common Data Service/Dynamics 365
- [Microsoft Flow limits](https://docs.microsoft.com/flow/limits-and-config#looping-and-debatching-limits): applicable for Microsoft Flow
- [Limits in connectors](https://docs.microsoft.com/connectors/): applicable for Microsoft Flow and PowerApps

## What is a Microsoft Power Platform request? 

Requests in Microsoft Power Platform consist of various actions which a user makes across various products. At a high level, below is what constitute an API call:

- **Connectors** – all API requests to connectors from PowerApps or Microsoft Flow
- **Microsoft Flow** – all Microsoft Flow step actions
- **Common Data Service** – all CRUD operations, as well as special operations like “share” or “assign”. These can be from any client or application and using any endpoint SOAP or REST. These include but are not limited to plug-ins, async workflows, and custom controls making the above mentioned operations.

Note that for Common Data Service, there will be a small set of system internal operations that are excluded, like login and logout, along with system metadata operations like getClientMetadata.
