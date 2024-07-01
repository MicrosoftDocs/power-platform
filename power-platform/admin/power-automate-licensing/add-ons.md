---
title: "Types of Power Automate add-ons"
description: "Add-ons for Power Automate licensing."
author: msftman
ms.topic: overview
ms.date: 05/01/2024
ms.author: kenseongtan
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# Types of Power Automate add-ons

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

<br>

## Power Automate capacity add-ons

A capacity add-on is object-centric: it's allocated to a Power Automate object (cloud flow, machine, hosted machine, hosted machine group) and it provides this object specific autonomous entitlements (regardless of the user licenses owned by makers interacting with the object). Its role is exactly identical to a [capacity license](types.md#standalone-capacity-licenses).

![Power Automate capacity add-ons](../media/RPA-license/capacity-add-ons-2.png)

### Unattended RPA add-on (legacy)

> [!IMPORTANT]
> - The [Power Automate Process license](types.md#power-automate-process-license) has replaced the Unattended RPA add-on (same price with more entitlements)
> - The already purchased Unattended RPA add-on units are considered legacy and should not be renewed but replaced by Power Automate Process units.
> - Process licenses and Unattended RPA add-ons have been combined in a single capacity pool and can be used interchangeably within Power Automate (allocated to cloud flows or machines). They have exactly the same value and role.

The Unattended RPA add-on provides the [unattended RPA entitlement](types.md#entitlements-to-usage-of-robotic-process-automation-rpa) needed to trigger a desktop flow in unattended mode on a standard machine (unattended mode refers to a desktop flow execution without human supervision). 

When allocated to a machine, an Unattended RPA add-on becomes an unattended bot. Each unattended bot on a machine entitles the machine to carry one unattended desktop flow run at a time. Unattended bots can be deployed on a local or remote desktop, or in a virtualized environment. Discover [how to allocate an unattended bot to a machine](/power-automate/desktop-flows/capacity-process#allocate-process-capacity-to-a-machine).

When an unattended run is triggered through an unattended bot, Power Automate securely signs into the user's machine on user's behalf, executes the desktop flow actions on the target applications, and then signs out of the device.

> [!NOTE]
> - Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Microsoft 365, you must purchase the [M365 - Unattended license](deployoffice/overview-licensing-activation-microsoft-365-apps.md#unattended-license) in addition to the Power Automate Unattended RPA add-on.

Unattended RPA scenarios, without human interaction, are applicable for example to scenarios such as processing invoices and entering them into a legacy application automatically or scheduled financial reconciliation across multiple systems that can only be automated by clicking user interfaces.
  
### Hosted RPA add-on  (legacy)

> [!IMPORTANT]
> - The [Power Automate Hosted Process license](types.md#power-automate-hosted-process-license) has replaced the Hosted RPA add-on (same price with more entitlements)
> - The existing Hosted RPA add-ons have been automatically converted into Power Automate Hosted Process licenses: no action needs to be taken

The Hosted RPA add-on provides the [hosted RPA entitlement](types.md#entitlements-to-usage-of-robotic-process-automation-rpa) enabling [RPA with zero infrastructure](/power-automate/desktop-flows/hosted-rpa-overview.md). 

It's needed to provision a hosted machine in the two following scenarios:
- [Individual hosted machines](/power-automate/desktop-flows/hosted-machines.md), enable developers to build or test automation and business users to run automation.
- [Hosted machine groups](/power-automate/desktop-flows/hosted-machine-groups.md), automatically scale workloads to optimize unattended automation in production, delivering improved business process continuity and governance at scale.

Hence, at provisionning of any hosted machine (individual or part of a group), a Hosted RPA add-on is automatically auto-allocated to it and becomes a hosted bot:
- When allocated to a standalone hosted machine, the hosted bot and its underlying Hosted RPA add-on remains allocated to the hosted machine until it gets deleted.
- When allocated to hosted machine within a hosted machine group (at hosted machine group scaling), the hosted bot and its underlying Hosted RPA add-on are later automatically released once the hosted machine gets turned-off at workload down-scaling.

Each hosted bot can carry one unattended desktop flow run at a time. Individual hosted machines also support attended runs if the user has a [Power Automate Premium](types.md#user-licenses) license.

> [!NOTE]
> - Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Microsoft 365, you must purchase the [M365 - Unattended license](deployoffice/overview-licensing-activation-microsoft-365-apps.md#unattended-license) in addition to the Power Automate Unattended RPA add-on.

<br>

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

<br>

## Power Automate storage add-ons

A storage add-on provides data storage space to support scalling of operations.

![Power Automate storage add-ons](../media/RPA-license/storage-add-ons-1.png)

### Process Mining add-on

### Dataverse storage capacity add-on

