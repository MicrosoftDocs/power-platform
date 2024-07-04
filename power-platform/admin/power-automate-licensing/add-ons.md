---
title: Types of Power Automate add-ons
description: Learn about types of Power Automate add-ons.
author: msftman
ms.topic: overview
ms.date: 07/04/2024
ms.author: cvassallo
contributors:
  - kenseongtan
  - cvassallo
  - samathur
  - v-aangie
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
|Capacity add-on|A capacity add-on is allocated to a Power Automate object (cloud flow, machine, etc.). It provides the object autonomous entitlements (the same way a user license provides entitlements to a user).|
|Consumptive add-on|A consumptive add-on provides a monthly quantity of units (AI builder credits, Power Platform requests) which are consumed and destroyed after usage.|
|Storage add-on|A storage add-on provides data storage space to support scalling of various Power Automate operations.|

You can purchase those add-ons on [Power Automate Pricing](https://flow.microsoft.com/pricing/) page or from your [Microsoft 365 Admin Center](https://admin.microsoft.com/) (if you are an admin).

<br>

## Power Automate capacity add-ons

A capacity add-on is object-centric: it's allocated to a Power Automate object (cloud flow, machine, hosted machine, hosted machine group) and it provides this object specific autonomous entitlements (regardless of the user licenses owned by persons interacting with the object). Its role is exactly identical to a [capacity license](types.md#capacity-licenses).

There are two Power Automate (legacy) capacity add-ons:
![Unattended RPA and Hosted RPA capacity add-ons](../media/RPA-license/capacity-add-ons-2.png)

### Unattended RPA add-on (legacy)

> [!IMPORTANT]
> - The [Power Automate Process license](deep-dive-on-specific-license.md#power-automate-process-license) has replaced the Unattended RPA add-on (same price with more entitlements).
> - The already purchased Unattended RPA add-ons are considered legacy and shouldn't be renewed but instead replaced by Power Automate Process licenses.
> - The existing Unattended RPA add-ons have however been upgraded to align on the Process license: once assigned to an environment, they now have exactly the same role as Process licenses and those two SKUs can be used interchangeably (allocated to cloud flows or machines).

The Unattended RPA add-on provides the [unattended RPA entitlement](types.md#entitlements-to-usage-of-robotic-process-automation-rpa) needed to trigger a desktop flow in unattended mode on a standard machine (unattended mode refers to a desktop flow execution without human supervision). 

|<br>_________________________________|Standard machine (physical or virtual)<br>__________________________________________________________________________________________________________|
|-------|------|
|__Scenario description__|When allocated to a machine, an Unattended RPA add-on becomes an unattended bot. Each unattended bot on a machine entitles the machine to carry one unattended desktop flow run at a time<sup>1</sup>. |
|__Unattended bot allocation__|Unattended bots can be manually allocated to machines or automatically allocated to them at runtime<sup>2</sup>. <br><br>Discover [how to allocate an unattended bot to a machine](/power-automate/desktop-flows/capacity-process#allocate-process-capacity-to-a-machine).|
|__Unattended bot release__|Unattended bots needs to be manually deallocated from the machine.|
|__Unattended bot settings__|Each machine - depending on its OS - can support a maximum number of unattended bots (equal to the maximum number of Windows session the machine can concurrently open).<br><br>For example some Windows server can open 10 Windows session at the same time and can therefore be allocated up to 10 unattended bots.|
|__Scenario benefits__|- Unattended mode enablement on the machine<sup>3</sup> <br>- Multi-session management through multi-allocation <br>- Reduced machine management through auto-allocation at desktop flow runtime|

_1. When an unattended run is triggered through an unattended bot, Power Automate securely signs into the user's machine on user's behalf, executes the desktop flow actions on the target applications, and then signs out of the device._ <br>
_2. Unattended bot can be auto-allocated at desktop flow unattended runtime if the machine setting 'Enable auto-allocation' is ON and the machine needs an additional bot to perform the run._ <br>
_3. A standard machine with no unattended bot cannot run unattended except when the user has a [Trial license](deep-dive-on-specific-license.md#power-automate-trial-license)._ 

Unattended RPA scenarios, without human interaction, are applicable for example to scenarios such as processing invoices and entering them into a legacy application automatically or scheduled financial reconciliation across multiple systems that can only be automated by clicking user interfaces.

As the Unattended RPA add-on has been upgraded to align on the Process license, learn about its extra-capabilities (to cover cloud flows invoking the machine with unattended bot(s) / to be allocated to a cloud flow directly) on the [Process license](deep-dive-on-specific-license.md#power-automate-process-license) documentation.
  
### Hosted RPA add-on  (legacy)

> [!IMPORTANT]
> - The [Power Automate Hosted Process license](deep-dive-on-specific-license.md#power-automate-hosted-process-license) has replaced the Hosted RPA add-on (same price with more entitlements)
> - The existing Hosted RPA add-ons have been automatically converted into Power Automate Hosted Process licenses: no action needs to be taken

The Hosted RPA add-on provides the [hosted RPA entitlement](types.md#entitlements-to-usage-of-robotic-process-automation-rpa) enabling [RPA with zero infrastructure](/power-automate/desktop-flows/hosted-rpa-overview) (= no physical machine management on the user side).

The add-on is needed to provision a Microsoft hosted machine in the two following scenarios:
- [Individual hosted machine](/power-automate/desktop-flows/hosted-machines)
- [Hosted machine group](/power-automate/desktop-flows/hosted-machine-groups)

At provisioning of any hosted machine (individual or within a group), a Hosted RPA add-on is auto-allocated to it and becomes a __hosted bot__.

|<br>__________________________|Hosted machine<br>______________________________________________|Hosted machine group<br>__________________________________________________________|
|-------|------|------|
|__Scenario description__|A hosted machine enables developers to build, test and run automation on a constantly active (= turned-on) hosted machine.|A hosted machine group enables developers to run automation on an auto-scaling group of hosted machines. <br><br>It is continuously adjusting the number of hosted machines turned-on to the desktop flow workload.|
|__Hosted bot allocation__|One hosted bot is automatically pulled from the available hosted pool<sup>1</sup> and allocated to the individual hosted machine at its creation.|One hosted bot is automatically pulled from the available hosted pool<sup>1</sup> and temporarily allocated to the hosted machine group when it scales up: any new hosted machine turned-on in the group consumes one extra hosted bot.|
|__Hosted bot release__|The hosted bots is automatically released to the available hosted pool<sup>1</sup> at manual deletion of the hosted machine.|The hosted bot is automatically released to the available hosted pool<sup>1</sup> by the hosted machine group when it scales down (= when one of its hosted machines is turned-off).|
|__Hosted bot settings__|None|An hosted machine group has two scaling settings:<br>- __Max bots__: the maximum number of hosted bots it can auto-allocate itself to turn-on hosted machines.<br>- __Committed bots__: the guaranteed number of hosted bots it can immediately auto-allocate itself when required.|
|__Scenario benefits__|- Hosted machine constantly turned-on <br> - Reaction time|- Auto-scalability delivering high processing parallelization and reacting to demand spikes<br>- [Load balancing](/power-automate/desktop-flows/hosted-machine-groups#load-balance-hosted-machine-group)<sup>2</sup> accross multiple hosted machine groups which optimizes the hosted bot utilization rate|

_1. The available hosted pool supports all hosted machine groups auto-scaling operations: the hosted machine groups pull hosted bots from it when they scale up and are throttled (= can't scale-up) when the available hosted pool is empty_ <br>
_2. Load balancing refers to the ability of multiple hosted machine group to scale-up and down at different moments using the same available hosted pool. The load balancing governance is managed through the max bots and committed bots scaling settings._

Each hosted bot can carry one unattended desktop flow run at a time (and so can be seen as an unattended bot too). Individual hosted machines also support attended runs if the user has a [Power Automate Premium](types.md#user-licenses) license or a [Trial license](deep-dive-on-specific-license.md#power-automate-trial-license).<br>

As the Hosted RPA add-ons have been converted into Hosted Process licenses, learn about their extra-capabilities (to cover cloud flows invoking hosted machines / to be used as Process licenses) on the [Hosted Process license](deep-dive-on-specific-license.md#power-automate-hosted-process-license) documentation.

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

You can't assign Power Platform requests capacity add-on packs to users or flows during the [transition period](api-request-limits-allocations#power-automate-transition-period). However, Microsoft recommends that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends.

If Power Automate is throttling your flows, try [Pay-as-you-go](faqs.md#power-platform-requests-pay-as-you-go) to ensure that none of the flows in the environment are throttled. If you can't use Pay-as-you-go, purchase add-ons and create a Microsoft support ticket with the flow details and add-on details so that the support team can provide exceptions for your throttled flows.

<br>

## Power Automate storage add-ons

A storage add-on provides data storage space to support scalling of operations.

![Power Automate storage add-ons](../media/RPA-license/storage-add-ons-1.png)

### Process Mining add-on

### Dataverse storage capacity add-on

