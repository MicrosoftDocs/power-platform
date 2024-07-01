.---
title: "Type of Power Automate add-ons"
description: "Add-ons for Power Automate licensing."
author: msftman
ms.topic: overview
ms.date: 05/01/2024
ms.author: kenseongtan
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# Type of Power Automate add-ons

Entitlements to use [Power Automate capabilities](types.md#license-entitlements) (standard connectors, premium connectors, attended RPA, etc.) are obtained via licenses and add-ons. This article focusses on add-ons (for details on licenses, visit the [types of Power Automate licenses](types.md) page). 

The Power Automate add-ons are categorized as follows:

- capacity add-ons
- consumptive add-ons
- storage add-ons

![Power Automate add-ons](../media/RPA-license/add-ons-3.png)

|Add-on type<br>_________________________|Description<br>______________________________________________________________________________________________________________________|
|-------|------|
|Capacity add-on|A capacity add-on is allocated to a Power Automate object (cloud flow, machine, etc.). It provides the object specific autonomous entitlements (the same way a user license provides entitlements to a user).|
|Consumptive add-on|A consumptive add-on provides a monthly quantity of units (AI builder credits, Power Platform requests) which are consumed and destroyed after usage.|
|Storage add-on|A storage add-on provides data storage space to support scalling of various Power Automate operations.|

## Power Automate capacity add-ons

A capacity add-on is object-centric: it's allocated to a Power Automate object (cloud flow, machine, hosted machine, hosted machine group) and it provides this object specific autonomous entitlements (regardless of the user licenses owned by makers interacting with the object). Its role is exactly identical to a [capacity license](types.md#standalone-capacity-licenses).

![Power Automate capacity add-ons](../media/RPA-license/capacity-add-ons-2.png)

### Unattended RPA add-on (legacy)

The Unattended RPA add-on provides the unattended RPA entitlement needed to trigger a desktop flow in unattended mode on a standard machine (unattended mode refers to a desktop flow execution without human supervision). 

When allocated to a machine, an Unattended RPA add-on becomes an unattended bot. Each unattended bot on a machine entitles the machine to carry one unattended desktop flow run at a time. Unattended bots can be deployed on a local or remote desktop, or in a virtualized environment.

When an unattended run is triggered through an unattended bot, Power Automate securely signs into the user's machine on user's behalf, executes the desktop flow actions on the target applications, and then signs out of the device.

Unattended RPA scenarios, without human interaction, are applicable for example to scenarios such as processing invoices and entering them into a legacy application automatically or scheduled financial reconciliation across multiple systems that can only be automated by clicking user interfaces.

> [!IMPORTANT]
> - The [Power Automate Process license](types.md#power-automate-process-license) has replaced the Unattended RPA add-on (same price with more entitlements)
> - The already purchased Unattended RPA add-on units are considered legacy and should not be renewed but replaced by Power Automate Process units.
> - Process licenses and Unattended RPA add-ons have been combined in a single capacity pool and can be used interchangeably within Power Automate (allocated to cloud flows or machines). They have exactly the same value and role.
> - Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Microsoft 365, you must purchase the [M365 - Unattended license](deployoffice/overview-licensing-activation-microsoft-365-apps.md#unattended-license) in addition to the Power Automate Unattended RPA add-on.
    
### Hosted RPA add-on  (legacy)

> [!IMPORTANT]
> - The Power Automate Hosted RPA add-on has been converted into the [Power Automate Hosted Process license](types.md#standalone-capacity-licenses)
> - The already purchased Hosted RPA add-on units were automatically converted to Power Automate Hosted Process licenses and no action needs to be taken

Desktop flows can have varying levels of workload throughout a period of time. For example, desktop flows for processing invoices or schedule reconciliation across multiple systems might have a monthly peak period. As desktop flows require a physical or virtual machine to run on, most organizations would provision machines to cope with requests during peak periods, leaving machine underutilized for most of the remaining time.

The Power Automate Hosted Process license provides Microsoft hosted machine capacity, enabling RPA with zero infrastructure. The Hosted Process license supports two scenarios:
- Individual hosted machines, enable developers to build or test automation and business users to run automation.
- Hosted machine groups, automatically scale workloads to optimize unattended automation in production, delivering improved business process continuity and governance at scale.

The following are important points you should be aware of regarding the Hosted Process license:
- One Hosted Process license includes the capacity to one Microsoft hosted machine and unattended RPA bot. All desktop flows (RPA) running on the machine and cloud flows (DPA) that are part of the business process are also covered by the license.
- One Hosted Process license can also be used as a process license to run unattended automation on a customer managed bot machine.
- You can purchase more AI Builder capacity; AI Builder service credit capacity is pooled at the tenant level.
- Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Office, the Microsoft 365, you must purchase the unattended license in addition to the Power Automate Hosted Process license.
  
> [!NOTE]
> The Hosted Process licenses the machines and not the user. The Premium user plan is required to run attended RPA, and for RPA developers to build and manage desktop flows on the Power Automate portal. To learn more about the Premium RPA features that come with the Premium user plan, go to [Premium RPA features](/power-automate/desktop-flows/premium-features).
   
## Power Automate consumptive add-ons

A consumptive add-on provides a monthly quantity of consumptive units which are consumed by flow runs and destroyed after usage (AI builder credits, Power Platform requests entitlement).

![Power Automate consumptive add-ons](../media/RPA-license/consumptive-add-ons-1.png)

### AI builder capacity add-on

AI Builder is licensed as an add-on to standalone Power Apps and Power Automate licensing and to Dynamics 365 licenses. AI Builder is licensed on a capacity basis. AI Builder capacity is expressed as *service credits*. Service credits serve as the single (common) currency across all the scenarios supported by AI Builder. The available service credits decrease when you use AI Builder services. Different scenarios (for example, forms processing, prediction, etc.) use service credits at different rates. Purchase the appropriate number of AI Builder capacity add-on units based on anticipated usage across all scenarios.

Each unit of AI Builder capacity add-on includes 1 million service credits per month. For example, a customer who requires 4.7 million service credits per month (based on anticipated usage), should purchase five units of AI Builder capacity add-on.

> [!NOTE]
>
> - Purchased service credits can be used from AI Builder models included within Power Automate, Power Apps, and Dynamics 365 applications.
> - Service credits are deducted / consumed for both training and production usage
> - Service credits are pooled across the tenant.

##### FAQs about the AI builder add-on

I have a Power Automate per user with RPA plan and I got AI builder credits as part of the plan. Can I transfer the credits to someone else?

No. AI builder service credits are pooled at the tenant level and can't be assigned to a particular user. So, any user who runs a flow that needs AI builder service credits needs to use credits from the pool.

### Power Platform Requests add-on

Power Apps and Power Automate capacity add-ons increase the daily Power Platform requests limits for workloads that need more usage capacity than their allocation. These add-ons provide an additional 50,000 daily Power Platform requests per unit for $50/month. Unused Power Platform requests don't carry over from day to day. You can purchase these add-ons at any time and they remain part of the subscription for the remainder of the subscription term.

You can't assign Power Platform requests capacity add-on packs to users or flows during the [transition period](types.md#transition-period). However, Microsoft recommends that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends.

If Power Automate is throttling your flows, try [Pay-as-you-go](faqs.md#power-platform-requests-pay-as-you-go) to ensure that none of the flows in the environment are throttled. If you can't use Pay-as-you-go, purchase add-ons and create a Microsoft support ticket with the flow details and add-on details so that the support team can provide exceptions for your throttled flows.

## Power Automate storage add-ons

A storage add-on provides data storage space to support scalling of operations.

![Power Automate storage add-ons](../media/RPA-license/storage-add-ons-1.png)

### Process Mining add-on

### Dataverse storage capacity add-on

