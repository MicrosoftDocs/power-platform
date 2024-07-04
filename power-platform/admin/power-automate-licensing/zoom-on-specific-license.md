---
title: Zoom on specific licenses
description: Learn about each license
author: cvassallo
contributors:
  - cvassallo
  - samathur
  - PriyaKodukula
  - v-aangie
  - kenseongtan
ms.subservice: admin
ms.topic: overview
ms.date: 07/04/2024
ms.author: cvassallo
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---
## Zoom on specific licenses

## Power Automate Process license

A Power Automate Process license can be allocated to a machine or to a cloud flow.

|Process license scenarios<br>______________________________|Description<br>_______________________________________________________________________________________|
|----------|-------|
|__Environment assignment__|To be used by a cloud flow or a machine, a Process capacity license first needs to be assigned to the environment where the cloud flow or the machine is located. Learn [how to allocate a Process capacity license to an environment](/power-platform/admin/capacity-add-on.md#allocate-or-change-capacity-in-an-environment).|
|__Cloud flow allocation__<sup>1</sup>|Allocated to a cloud flow, a Power Automate Process license entitles it to use standard, premium, and custom connectors while being accessed by unlimited users within the organization (regardless of their user license). Each Process license allocated to a cloud flow entitles it to 250k daily Power Platform Request (stackable limit). <br><br>Discover [how to allocate a Process license to a cloud flow](/power-automate/desktop-flows/capacity-process#allocate-process-capacity-to-a-cloud-flow).<br><br>A cloud flow that has been allocated a Process license becomes a 'process flow'. Process flows have their plan switch to "Process plan" and a process-flow can be associated to other cloud flows (excluding other process-flows). <br><br>A cloud flow associated to a process-flow is also covered by the Process license allocated to the process-flow. Its plan switches to "This flow is associated to run on process plan", its runs are considered 'in-context' or the Process license and its PPR consumption is counted against the Process license PPR entitlement. A process-flow can be associated to a maximum of 25 cloud flows. <br><br>Discover [how to associate flows to a process flow](/power-automate/desktop-flows/capacity-process#associate-flows-to-a-process-flow).|
|__Machine allocation__|Allocated to a machine, it becomes an unattended bot<sup>2</sup>. Each unattended bot on a machine entitles the machine to carry one unattended desktop flow run at a time.<br><br>Machines can be manually allocated unattended bots or be set to auto-allocate themselves when required by a run in unattended mode. Note that any unattended bot allocation (manual or automatic) on a machine remains until a manual de-allocation occurs. To prevent a machine from auto-allocating itself Process capacity, disable its auto-allocation setting.<br><br>Any cloud flow targeting a machine with unattended bot(s) is automatically covered by the machine's bot(s) and considered to be a 'process flow' (with the flow association capability) and is entitled to a 250k daily Power Platform Request (non-stackable limit). Those cloud flows have their plan automatically switch to "Process plan inherited from machine"<sup>3</sup>.<br><br>Discover [how to allocate a Process license to a machine](/power-automate/desktop-flows/capacity-process#allocate-process-capacity-to-a-machine).|
|__Utilization management__|You can visualize and manage all Process licenses allocated to cloud flows and machines within an environment using the [Process capacity utilization](/power-automate/desktop-flows/capacity-utilization-process) page<sup>4</sup>.|

_1. Process allocation to cloud flows and flow association to process flows is not yet completely available_ <br>
_2. Each machine - depending on its OS - can support a maximum number of unattended bots (equal to the maximum number of Windows session the machine can concurrently open)._ <br>
_3. Cloud flow with "Process plan inherited from machine" are not yet available_ <br>
_4. Breakdown of cloud flow allocations is not yet available in the process capacity utilization page_

> [!NOTE]
> - Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Microsoft 365, you must purchase the [M365 - Unattended license](deployoffice/overview-licensing-activation-microsoft-365-apps.md#unattended-license) in addition to the Process license.
> - The Process license has replaced the [Unattended RPA add-on](add-ons.md#unattended-roa-add-on) (same price with more entitlements).
> - The existing Unattended RPA add-ons have been upgraded to align on the Process license: once assigned to an environment, they now have exactly the same role as Process licenses and those two SKUs can be used interchangeably (allocated to cloud flows or machines).


## Power Automate Hosted Process license

A Power Automate Hosted Process can be used by an individual hosted machine, by a hosted machine group (or by a cloud flow / a machine acting as a Process license):

|Hosted Process license scenarios<br>____________________________________|Description<br>_______________________________________________________________________________________|
|----------|-------|
|__Environment assignment__|To be used by a hosted machine or a hosted machine group (or by a cloud / flow a machine), a Hosted Process capacity license first needs to be assigned to the environment where the hosted machine or the hosted machine group is located. <br><br>Learn [how to allocate a Hosted Process capacity license to an environment](/power-platform/admin/capacity-add-on.md#allocate-or-change-capacity-in-an-environment).|
|__Hosted machine allocation__|A hosted machine enables developers to build, test and run automation on a constantly active (= turned-on) hosted machine. <br><br>At creation of an individual hosted machine, a Hosted RPA add-on is auto-allocated to it and becomes a hosted bot. This hosted bot is pulled from the available hosted pool<sup>1</sup> and is automatically released back to the pool at manual deletion of the hosted machine.|
|__Hosted machine group allocation__|A hosted machine group enables developers to run automation on an auto-scaling group of hosted machines. It is continuously adjusting the number of hosted machines turned-on to the desktop flow workload. <br><br>One hosted bot is automatically pulled from the available hosted pool<sup>1</sup> and temporarily allocated to the hosted machine group when it scales up: any new hosted machine turned-on in the group consumes one extra hosted bot. The hosted bot is automatically released to the available hosted pool<sup>1</sup>by the hosted machine group when it scales down (= when one of its hosted machines is turned-off). <br><br>An hosted machine group has two scaling settings: <br>- Max bots: the maximum number of hosted bots it can auto-allocate itself to turn-on hosted machines. <br>- Committed bots: the guaranteed number of hosted bots it can immediately auto-allocate itself when required.<br><br>The key benefits of hosted machine groups are: <br>- Auto-scalability delivering high processing parallelization and reacting to demand spikes <br> - [Load balancing](/power-automate/desktop-flows/hosted-machine-groups.md#load-balance-hosted-machine-group)<sup>2</sup> accross multiple hosted machine groups which optimizes the hosted bot utilization rate.<br><br> Any cloud flow targeting a hosted machine or hosted machine group in unattended mode is automatically covered by the machines' hosted bot and considered to be a 'process flow' (with the flow association capability) and is entitled to a 250k daily Power Platform Request (non-stackable limit). Those cloud flows have their plan automatically switch to "Process plan inherited from machine"<sup>3</sup>.<br><br>|
|__Hosted Process usage as a Process license__<sup>4</sup>|The Power Automate Hosted Process is a superset of the Power Automate Process which means it can provide the same entitlements as the Process license and act as one. <br><br>When all Process licenses in an environment are already allocated to machines and cloud flows (or when there is no Process license assigned to the environment), the Hosted Process licenses will be used instead of the Process license at any new allocation to machines / cloud flows IF the setting "Allow hosted capacity to be used as Process capacity" (in Admin Center) was enabled by the environment admin.|
|__Utilization management__|You can visualize and manage all Hosted Process licenses allocated to hosted machines and hosted machine groups within an environment using the [Hosted Process capacity utilization](/power-automate/desktop-flows/capacity-utilization-hosted) page.|

_1. The available hosted pool supports all hosted machine groups auto-scaling operations: the hosted machine groups pull hosted bots from it when they scale up and are throttled (= can't scale-up) when the available hosted pool is empty_ <br>
_2. Load balancing refers to the ability of multiple hosted machine group to scale-up and down at different moments using the same available hosted pool. The load balancing governance is managed through the max bots and committed bots scaling settings._ <br>
_3. Cloud flow with "Process plan inherited from machine" are not yet available_  <br>
_4. The Power Automate Hosted Process superset behaviour (allowing it to be applied to machines and cloud flows) and Admin Center setting are not yet available, in the meantime any organization with [Process overage](/power-automate/desktop-flows/capacity-utilization-process#capacity-overage) that could be covered by its Hosted Process licenses should ignore the Process overage ._ 

## Power Automate Free license

If you sign in with your work or school email address, you get all capabilities included in the Power Automate Free license. If you have a non-business user account (such as an account that ends with @outlook.com or @gmail.com), you can still use Power Automate with the Power Automate Free license. Go to [Power Automate](https://flow.microsoft.com/) and then select **Try free**.

> [!NOTE]
> You can't share flows when you use the Free license.

To know which users have the Power Automate Free license, admins can go to the [Microsoft 365 admin portal](https://admin.microsoft.com/), sign in, select **Billing** > **Licenses** to see how many Free licenses are assigned vs available:

![Image of free licenses](../media/power-automate-licensing/trial-licenses.png)

Select **Assigned licenses** to see which users have Free license.

## Power Automate Trial license

A user can self-provision a Power Automate Trial license from within the Power Automate portal. This trial lasts for 90 days. For example, when a Power Automate Free user tries to create a desktop flow, the user is prompted to start a Trial that includes usage of premium connectors, attended RPA and unattended RPA:

![Start free trial from within Power Automate](../media/power-automate-licensing/free-trial-inline.png)

#### How can admins allow or block Power Automate Trial licenses (self-assisted)?

Admins can use PowerShell cmdlets to enable or disable self-assisted trials. Once disabled, all existing licenses of the specified type are removed from all users in the tenant. These trials aren't recoverable. Additionally, it blocks all further assignment of licenses of that type. Admins can enable self-assisted trials at any time.

[Learn how to create a trial (subscription-based) environment in the Power Platform admin center](../trial-environments.md#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center).

#### Is Power Automate Trial license available in government clouds?

No, Power Automate Trial licenses aren't available work in government clouds (GCC). Those organizations can only purchase licenses with volume discounting.

## Admin-managed trial licenses

Admin-managed trial licenses are trial versions of the Power Automate Premium, Power Automate Process, or Power Automate Hosted Process licenses. They bear the same entitlements but have a 30 days lifetime. 

Global admins can provision those trial licenses on the Microsoft 365 admin center and assign them to users / environments. An admin-managed trial has an end date that can be extended once (another 30 days). 

> [!NOTE]
> - Admin-managed trials are different from the Power Automate Trial license (self-provisioned).
> - When using an admin-managed trial SKU, the SKU name might not say Trial.

Follow these steps to get started.

1. Sign in to [the Microsoft 365 admin center](https://admin.microsoft.com/).

2. Under the **Billing** section, select **Purchase services**.

3. Search for **Power Automate**, and then select a license.

   ![Select a licensing plan](../media/power-automate-licensing/select-plan.png)

4. Select the details of a license, and then select **Start free trial**.

   ![Start a free trial](../media/power-automate-licensing/start-free-trial.png)

5. You see a confirmation similar to this one.

   ![Start a free trial confirmation](../media/power-automate-licensing/start-free-trial-confirmation.png)

After the free trial starts, go to **Billing** > **Licenses** to see the 25 new licenses available for you to assign to users.

#### How can I create an admin trial, check expiry and extend trials?

Follow these instructions to [create an admin trial, check expiry, and extend trials](../trial-environments.md#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center).

## Power Automate seeded licenses

Licenses inherited from other Microsoft products can provide limited capabilities within Power Automate : they are referred to as seeded licenses. Some common seeded licenses include Microsoft 365 license, Dynamics 365 Enterprise license, Power Apps Premium license, etc. 

Learn more on [Power Automate seeded licenses](seeded-licenses.md). 

## Power Automate legacy licenses

|License name<br>____________________________|License type<br>___________________|Entitlements<br>____________________________________________________________________________________________|
-------|------|------|
Power Automate Per-user plan|User license (legacy)|The Power Automate Premium license has replaced this license (it provides more entitlements for the same price). <br><br>The already purchased Per-user plan licenses are still usable but considered legacy and they shouldn't be renewed but instead replaced by Power Automate Premium licenses.|
Power Automate Per-flow plan|Capacity (legacy) allocated to cloud flow|The Power Automate Process license has replaced this license. <br><br>The already purchased Per-flow plan licenses are still usable but considered legacy and they shouldn't be renewed but instead replaced by Power Automate Process licenses.|
P1 and P2 plans|User license (legacy)|These grandfathered licenses are no longer available for purchase nor via autorenewal after December 31, 2020.|

> [!IMPORTANT]
> __To organizations with active Power Automate P1 and P2 plans__:
> 
> Organizations with these licenses with renewals that are due on or after January 1, 2021 need to transition to the Power Automate Premium user license or to the Power Apps Premium user license to continue using the Microsoft Power Platform services. Organizations with active contracts that started before January 1, 2021 with grandfathered licenses will continue to be supported until the contract end date. Contact your Microsoft account representative for more information or purchase the replacing licenses.

## Power Apps Developer plan

There's a [free Power Apps Developer plan to learn about Power Platform](https://powerapps.microsoft.com/communityplan/). You aren't allowed to use it in production but can try out things and have access to all premium connectors. You can use this free developer plan also in a free [Microsoft 365 developer tenant](https://developer.microsoft.com/microsoft-365/dev-program). Business process flows and RPA flows can't be created in an environment with the Power Apps Developer plan.

<br>

## Entitlements of free / trial / legacy licenses

||Free license<br>____________________________|Trial license <br>____________________________|Per-user plan (legacy) <br>____________________________|Per-flow plan (legacy)<br>____________________________|
|----------|-------|---------------------|--------------|-------|
|__Applied to__|User|User|User|Cloud flow|
|__Daily PPR limit  <sup>1</sup>__|6k per user||40k per user|250k per Per-flow plan<sup>2</sup>|
|__Standard connectors__|Included|Included|Included|Included|
|__Premium connectors__|Not included|Included|Included|Included|
|__Custom connectors__|Not included|Included|Included|Included|
|__Attended RPA__|Not included|One attended bot included|Not included|Not included|
|__Unattended RPA__|Not included|One unattended bot included|Not included|Not included|
|__Hosted RPA__|Not included|Not included|Not included|Not included|
|__Business process flows__|Not included|Included|Included|Included|
|__On-premises gateways__|Not included|Included|Included|Included|
|__Process mining__|Not included|Included|Not included|Not included|
|__Process mining data storage__|Not included|Not included|Not included|Not included|
|__AI Builder credits__|Not included|Not included|Not included|Not included|
|__Dataverse database storage__|Not included|Not included|250-MB per license|50-MB per license|
|__Dataverse file storage__|Not included|Not included|2-GB per license|200-MB per license|

_1. The Power Platform Requests are subjected to higher limits during the transition period ([see details](power-automate-request-limit.md))._ <br>
_2. Only one Per-flow plan can be allocated to a cloud flow (no multi-allocation), PPR limits can't be stacked_
