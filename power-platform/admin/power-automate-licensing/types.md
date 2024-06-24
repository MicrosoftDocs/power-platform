---
title: Types of Power Automate licenses
description: Learn about types of Power Automate licenses.
author: cvassallo
contributors:
  - cvassallo
  - samathur
  - PriyaKodukula
  - v-aangie
ms.subservice: admin
ms.topic: overview
ms.date: 06/24/2024
ms.author: cvassallo
ms.reviewer: angieandrews
search.audienceType: 
  - admin
ms.collection: bap-ai-copilot
---

# Types of Power Automate licenses

Rights to use [Power Automate capabilities](#license-entitlements) (standard connectors, premium connectors, attended RPA, etc.) are obtained via licenses. Those licenses are available either as:
- standalone licenses tied to the Power Automate product (divided in two categories: user-licenses and capacity-licenses).
- seeded licenses (user-licenses only) inherited by licenses tied to other Microsoft products, they offer limited capabilities on Power Automate.

![Power Automate licenses](../media/RPA-license/licenses.png)

> [!NOTE]
>
> - A user-license is user-centric: it's assigned to a user and it entitles this user to access [specific capabilities](#license-entitlements)
> - A capacity-license is object-centric: it's consumed by a Power Automate object (cloud flow, machine, hosted machine, hosted machine group) and it provides this object specific autonomous entitlements (regardless of the user-licenses owned by makers interacting with the object)
> - As alternative to licenses, an organization can enable its environments to use the [Pay-as-you-go model](/power-platform/admin/pay-as-you-go-overview) and get started building flows without any license requirement or upfront costs. 

## Standalone licenses

You can purchase the standalone licenses on [Power Automate Pricing](https://flow.microsoft.com/pricing/) page.

### Standalone user-licenses

![Standalone user licenses](../media/RPA-license/standalone_user_licenses.png)

Users who need to create general-purpose automations (with the premium connectors entitlement), to have full flexibility (with the custom connectors entitlement) or to interact with applications mimicking mouse movement of a human user (with the Robotic Process Automation attended entitlement) should consider a Power Automate Premium license.

Here-after the list of standalone Power Automate user-licenses:

|License name<br>____________________________|License type<br>___________________|Entitlements<br>____________________________________________________________________________________________|
-------|------|------|
Power Automate Premium|User license|This license allows users to create and run unlimited cloud flows (within [PPR limits](#power-platform-requests)) for API-based automation (with standard, premium and custom connectors) and to automate their legacy applications mimicking mouse movement of a human user (with desktop flows through Robotic process automation (RPA)). More precisely on the RPA side, this license includes the ability for users to register their workstation, to create unlimited desktop flows, and to execute their desktop flows in attended mode on their registered machine. <br><br>Additionally, this license also includes full access to process mining functionalities and provisioning of AI Builder credits, which support AI consuming scenarios like forms processing, object detection, prediction, text classification, and recognition.|
[Power Automate Free](#power-automate-free-license)|User license (free)|This license provides basic access to Power Automate allowing users to create and run unlimited cloud flows (within [PPR limits](#power-platform-requests)) restricted to standard connectors only. This license also restricts users to share their flows.|
[Power Automate Trial](#power-automate-trial-license)|User license <br>(90 days trial)|This self-assisted trial license provides a user with the same capabilities as a Power Automate Premium license (except for AI builder credits and storage capacities) and with the extra capability to execute their desktop flows in unattended mode on their registered machine (without unattended bot requirement).|
Power Automate Per-user plan|User license ([legacy](#entitlements-of-all-standalone-licenses-including-legacy))|The Power Automate Premium license has replaced this license (it provides more entitlements for the same price). It's no longer available for purchase from the pricing page but organizations can still purchase it via deal desk.|
P1 and P2 plans|User license (legacy)|These grandfathered licenses are no longer available for purchase nor via autorenewal after December 31, 2020.|

> [!IMPORTANT]
> __To organizations with active Power Automate P1 and P2 plans__:
> 
> Organizations with these licenses with renewals that are due on or after January 1, 2021 need to transition to the Power Automate Premium user-license or to the Power Apps Premium user-license to continue using the Microsoft Power Platform services. Organizations with active contracts that started before January 1, 2021 with grandfathered licenses will continue to be supported until the contract end date. Starting October 1, 2024, these plans will no longer be usable. Contact your Microsoft account representative for more information or purchase the replacing licenses.

### Standalone capacity-licenses

![Standalone capacity licenses](../media/RPA-license/standalone_capacity_licenses.png)

In addition to user-licenses, organizations can upgrade their automation scenarios with capacity licenses, which are consumed by Power Automate objects (cloud flows, machines, hosted machines, hosted machine groups) and entitles these objects to be licensed autonomously (regardless of user-license owned by makers interacting with those objects). 

|License name<br>__________________________|License type<br>_______________|Consumer object<br>___________________________|Entitlements<br>___________________________________________________________________|
------|------|------|------
Power Automate Process|Capacity|- Cloud flow <br>- Standard machine|Allocated to a cloud flow, a Power Automate Process license entitles it to use standard, premium, and custom connectors while being accessed by unlimited users (regardless of their user-license) within the organization. Each Process license allocated to a cloud flow entitles it to 250k daily [Power Platform Request](#power-platform-requests) (stackable limit). <br><br>Allocated to a machine, it becomes an unattended bot each unattended bot on a machine entitles the machine to carry one unattended desktop flow run at a time.
Power Automate Hosted Process|Capacity|- Hosted machine <br>- Hosted machine group<br>- Cloud flow<br>- Machine|The Power Automate Hosted Process is a superset of the Power Automate Process it can provide the same entitlements as the Process license (allocated to a cloud flow or to a machine) but it's also able to support an alternative scenario the provisioning of Microsoft hosted machine (standalone or within a hosted machine group), enabling RPA with zero infrastructure.
Power Automate Per-flow plan|Capacity ([legacy](#entitlements-of-all-standalone-licenses-including-legacy))|- Cloud flow|The Power Automate Process license has replaced this license. It's no longer available for purchase from pricing page but customers can still purchase it via deal desk.

> [!IMPORTANT]
> Capacity licenses can't replace all user licenses within an environment as some essential capabilities are only available to licensed users
> - Allocation of a Process license to a machine (as required by the unattended mode) still prerequires the machine to have been registered by a Power Automate Premium user.
> - Multiple monitoring pages in the Power Automate portal are displayed only to Power Automate Premium users (workqueue page, machine list page, desktop flow list page, etc.).
> <br>
> Hosted Process licenses are not yet usable on machines and cloud flows, in the meantime any Hosted Process license in an environment allows it to go in Process overage (which overage quantity should be ignored if the Hosted Process licenses exceed it)

## Compare standalone Power Automate licenses

Here-bellow a table detailing each license [entitlement](#license-entitlements):

||Premium license<br>____________________________|Process license<br>____________________________|Hosted Process license<br>____________________________|
|----------|-------|---------------------|--------------|
|__Applied to__|User|- Cloud flow <br>- Machine|- Cloud flow <br>- Machine <br>- Hosted machine <br>- Hosted machine group|
|__Daily PPR limit  <sup>1</sup>__|40k per user|250k per Process license <sup>2</sup>|250k per Hosted Process license <sup>2</sup>|
|__Standard connectors__|Included|Included|Included|
|__Premium connectors__|Included|Included|Included|
|__Custom connectors__|Included|Included|Included|
|__Attended RPA__|Included|Not included|Not included|
|__Unattended RPA__|Not included|One unattended bot included|One unattended bot included <sup>3</sup>|
|__Hosted RPA__|Not included|Not included|One hosted bot included <sup>3</sup>|
|__Business process flows__|Included|Included|Included|
|__On-premises gateways__|Included|Included|Included|
|__Process mining__|Included|Not included|Not included|
|__Process mining data storage__|50 MB per license <sup>4</sup>|Not included|Not included|
|__AI Builder credits__|5000 per month|5000 per month|5000 per month|
|__Dataverse database storage__|250 MB per license|50 MB per license|50 MB per license|
|__Dataverse file storage__|2 GB per license|200 MB per license|200 MB per license|

_1 The Power Platform Requests are subjected to higher limits during the transition period ([see details](#power-platform-requests))._ <br>
_2 When multiple units of Process licenses are allocated to a cloud flow, their PPR limits are stacked._ <br>
_3 The Hosted Process license provides an unattended bot when allocated to a standard machine __OR__ a hosted bot when used by a hosted machine (which can be a standalone hosted machine or be part of a hosted machine group)._<br>
_4 Up to 100 GB per tenant._

## License entitlements

Licenses have entitlements and each entitlement gives access to a specific Power Automate capability. Here-bellow the list of entitlements that licenses can provide:

![License entitlements](../media/RPA-license/entitlement_list.png)

### How can I see my current entitlements ?

In the Power Automate portal, click on the __Settings__ and on __View my licenses__ :

![License entitlements](../media/RPA-license/view-my-licenses-2.png)

> [!NOTE]
> - The user license(s) are displayed in the section _My licenses_
> - The capacity license(s) (and add-ons) are displayed in the section _Environment capacities_
> - The user entitlement are displayed in the _Capabilities_ section with a green check mark

### Entitlements to usage of connector types in cloud flows

A [connector](/connectors/overview) represents the underlying service (such as OneDrive, SharePoint, Salesforce, etc.) with which a cloud flow can interact. It provides a way for a user to connect its cloud flow to a third-party account (such as a Salesforce account) and use a set of prebuilt actions and triggers.

|Entitlement to<br>____________________________|Entitlement description<br>________________________________________________________________________________________________________________|
|----------|-------|
|Standard connectors|The [standard connectors](/connectors/connector-reference/connector-reference-standard-connectors) entitlement is needed to add a standard connector to a cloud flow and trigger it. It's included in all [seeded licenses](#seeded-licenses) and all [standalone licenses](#standalone-licenses). We're continuously adding more standard connectors.|
|Premium connectors|The [premium connectors](/connectors/connector-reference/connector-reference-standard-connectors) entitlement is needed to add a premium connector to a cloud flow and trigger it. It's included in the Power Automate Premium user-license, the Power Automate Process capacity-license, and the Power Automate Hosted Process capacity-license. It can also be included in some [seeded licenses](#seeded-licenses) when the cloud flow is in context of an app.|
|Custom connectors|The [custom connectors](/connectors/custom-connectors) entitlement is needed to create a connector with its own triggers and actions when an app / a service does't have a prebuilt connector. It's included in the Power Automate Premium user-license, the Power Automate Process capacity-license, and the Power Automate Hosted Process capacity-license. It can also be included in some [seeded licenses](#seeded-licenses) when the cloud flow is in context of an app.|

### Entitlements to usage of Robotic process automation (RPA)

[Robotic process automation (RPA)](/power-automate/desktop-flows/introduction) is needed to interact with applications, which are lacking a prebuilt connector and which don't have APIs that could be used to build a custom connector. With RPA, you automate applications by teaching Power Automate for Desktop to mimic the mouse movements and keyboard entries of a human user, as if a robot was using the computer.

|Entitlement to<br>____________________________|Entitlement description<br>________________________________________________________________________________________________________________|
|----------|-------|
|Attended RPA|The attended RPA entitlement is needed to register a machine, access RPA management portal pages, add premium RPA actions to a desktop flow, share a desktop flow and trigger a desktop flow in attended mode. Attended mode refers to a desktop flow execution with human supervision. This entitlement is also needed to create any desktop flow in non-default environments. It's included in the Power Automate Premium user-license.|
|Unattended RPA|The unattended RPA entitlement is needed to trigger a desktop flow in unattended mode on a standard machine (unattended mode refers to a desktop flow execution without human supervision). It's included in the Power Automate Process capacity-license and the Power Automate Hosted Process capacity-license.|
|Hosted RPA|The hosted RPA entitlement is needed to create a hosted machine or a hosted machine group. It's included in the Power Automate Hosted Process capacity-license.|

### Entitlements to other Power Automate capabilities

|Entitlement to<br>____________________________|Entitlement description<br>________________________________________________________________________________________________________________|
|----------|-------|
|Business process flows|The [business process flows](/power-automate/business-process-flows-overview) entitlement is needed to create a business process flow. Business process flows provide a guide for people to get work done they offer a streamlined user experience that leads people through the processes their organization has defined. It's included in the Power Automate Premium user-license, the Power Automate Process capacity-license, and the Power Automate Hosted Process capacity-license. It can also be included in some [seeded licenses](#seeded-licenses) when the cloud flow is in context of an app.|
|On premises gateway|The [on-premises data gateway](/power-automate/gateway-reference) entitlement is needed to create and use an on-premises data gateway. It acts as a bridge to provide quick and secure data transfer between on-premises data and several Microsoft cloud services. With gateways, organizations can keep databases and other data sources on-premises and securely use that on-premises data in cloud services. It's included in the Power Automate Premium user-license, the Power Automate Process capacity-license, and the Power Automate Hosted Process capacity-license. It can also be included in some [seeded licenses](#seeded-licenses) when the cloud flow is in context of an app.|
|Process mining|The process mining entitlement is needed to use the process mining and task mining capabilities of Power Automate. It's included in the Power Automate Premium user-license.|


### Credits and storage entitlements

|Entitlement to<br>____________________________|Entitlement description<br>________________________________________________________________________________________________________________|
|----------|-------|
|AI Builder credits|With [AI builder](/power-automate/use-ai-builder), you add intelligence to your automations, predict outcomes, and help improve business performance. AI Builder capacity is expressed in the form of "service credits." Service credits serve as the single (common) currency across all the scenarios that AI Builder supports. Available service credits are deducted when AI Builder services are used. For instance, you could use these credits to extract data from a few documents with _form processing_ or perform hundreds of basic text extractions. Different scenarios (for example, forms processing, prediction, etc.) consume service credits at different rates. Each Power Automate Premium license grants you 5,000 credits per month, allowing you to assess the capabilities in AI Builder. Learn more about [AI builder licensing](/power-platform/admin/powerapps-flow-licensing-faq).|
|Dataverse database and file storage|Data volume continues to grow exponentially as businesses advance their digital transformation journey and bring data together across their organizations. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today's organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs. Microsoft Dataverse capacity storage is optimized for relational data (database), attachments (file), and audit logs (log). Power Automate standalone license customers receive a tenant-wide default entitlement for each of these three storage types. You can buy more storage in 1-GB increments. Learn more about [Dataverse capacity storage](../capacity-storage.md).|
|Process mining data storage|The process mining capability in Power Automate is suited for discovery of inefficiencies in organization-wide processes. It enables you to gain a deep understanding of your processes using event log files that you can get from your system of recording (apps you use in your processes). The process mining capability displays maps of your processes with data and metrics to recognize performance issues. Each Power Automate Premium license grants you 50-MB storage capacity that can be pooled to a max of 100-100-GB per tenant.|


## Seeded licenses

Users gain limited rights to use Power Automate if they inherited seeded plans from licenses tied to other Microsoft products:
- Microsoft 365 (formerly Office 365) / Dynamics 365 Enterprise / Dynamics 365 Professional / Dynamics 365 Team Member
- Power Apps Per-app plan / Power Apps Premium / Power Apps Plan 1 or Plan 2 (legacy)
- Windows licenses

Those licenses entitle the user to create and run cloud flows with standard connectors. They can also entitle them to create and run a cloud flow with premium and custom connectors if the flow is in-context and associated to the application from which the seeded plan is inherited. 

> [!NOTE]
> - Example 1: if a cloud flow uses premium connectors, is owned by a user with a Power Apps Premium license, associated to a Power App and triggered by the app, any user can run the flow if they have a Power Apps license.
> - Example 2: a cloud flow created within a Dynamics 365/App using a Power Apps can connect to the following
>   - To any data source within the use rights of the Dynamics 365/App created using Power Apps.
>   - Directly with the Dynamics 365/App created using Power Apps (via built-in triggers/actions).

If the cloud flow is isolated and has nothing to do with the application, then a standalone Power Automate Premium must be purchased. You can find more details can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### Compare seeded licenses

Here-bellow a table detailing each seeded license [entitlement](#license-entitlements):

||Power Apps Premium<br>_______________|Office <br>365<br>_______________|Dynamics 365 professional <sup>1</sup><br>_______________|Dynamics 365 Enterprise applications <sup>2</sup><br>___________________________|Dynamics 365 Team member<br>_______________|Windows licenses<br>_______________|
|----------|-------|---------------------|--------------|--------------|--------------|--------------|
|__Applied to__|User|User|User|User|User|Machine|
|__Daily PPR limit__|40k per user|6k per user|40k per user|40k per user|6k per user|Not included|
|__Standard connectors__|Included|Included|Included|Included|Included|Not included|
|__Premium connectors__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Not included|
|__Custom connectors__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>3,5</sup>|Not included|
|__Attended RPA__|Not included|Not included|Not included|Not included|Not included|Included with limitations<sup>6</sup>|
|__Unattended RPA__|Not included|Not included|Not included|Not included|Not included|Not included|
|__Hosted RPA__|Not included|Not included|Not included|Not included|Not included|Not included|
|__Business process flows__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Not included|
|__On-premises gateways__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Not included|
|__Process mining__|Not included|Not included|Not included|Not included|Not included|Not included|
|__Process mining data storage__|Not included|Not included|Not included|Not included|Not included|Not included|
|__AI Builder credits__|500|Not included|Not included|Not included|Not included|Not included|
|__Dataverse database storage__|250-MB per license|Not included|Not included|Not included|Not included|Not included|
|__Dataverse file storage__|2-GB per license|Not included|Not included|Not included|Not included|Not included|

_1 Dynamics 365 Sales Professional and Dynamics 365 Customer Service Professional_ <br>
_2 Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Project Service Automation, Dynamics 365 Retail, Dynamics 365 Talent, and Dynamics 365 Customer Engagement plan_ <br>
_3 In Dataverse for Teams environments (included in [specific Office licenses)](../powerapps-flow-licensing-faq.md#which-microsoft-365-subscriptions-include-dataverse-for-teams-and-microsoft-copilot-studio-capabilities-with-teams), users can use custom connectors built on Azure and Dataverse_ <br>
_4 Only included if cloud flow is in-context & associated to a Power App_ <br>
_5 Only included if cloud flow is in-context & associated to a Dynamic 365 app_ <br>
_6 Only includes local execution of desktop flow (no orchestration)_ <br>



## Power Platform requests

> [!IMPORTANT]
> Desktop flow executions don't consume Power Platform requests

To ensure service availability and quality, there are limits to the number of Power Platform requests (PPR) users can make across all Power Platform products. PPR limits are set against normal usage patterns in both five minutes and per 24 hour intervals. Most organizations don't exceed these limits.

The 24 hour limit is based on the user license or on the Process / Per-flow plan license allocated to a cloud flow
  - If a user has a Power Automate Premium license, they can make 40,000 Power Platform requests across all of their cloud flows in a tenant within a 24 hour period. This limit includes requests the platform makes to third party connectors too. 
  - If a cloud flow has a Process license, the flow, its child flows, and its associated flows can make 250,000 Power Platform requests across all users of the flow in a 24 hour period.
  - If a cloud flow has a Per-flow plan (legacy), the flow can make 250,000 Power Platform requests across all users of the flow in a 24 hour period.


To prevent a usage-heavy flow or user from impacting other users, this capacity is tracked based on consumption at an individual user or flow level and it can't be pooled at any other level like environment or tenant levels. The 24 hours is a sliding window, meaning that anytime a cloud flow runs, the system looks at the requests in the past 24 hours to determine if the user is at their limit. For example, two users in a tenant may have Premium licenses, and each user gets 40,000 requests per 24 hour period. If the first person uses more than 40,000 requests 24 hour period, their flows slow down and don't impact the second user who only used 20,000 requests and still has 20,000 requests remaining.

Currently all organizations are in [a transition period](/power-platform/admin/power-automate-licensing/types#transition-period) during which higher transition period limits apply. Once transition period ends, the official limits are applicable. Build your cloud flows based on official limits. 

The five-minute limit is 100,000 requests and it's independent of a user's license. For example, flows with a Process license can make 250,000 requests in 24 hours but they can't make more than 100,000 requests within five minutes.

Power Platform request limits per license:

|License name|PPR official limit per 24 hours|PPR transition period limit per 24 hours|
|--------|--------|----------|
Power Automate Premium|40k per user | 200k per cloud flow|
Power Automate Process|250k per license | 500k per license|
Power Automate Hosted Process|250k per license | 500k per license|
Power Automate Per-user plan (legacy)|40k per user | 200k per cloud flow|
Power Automate Per-flow plan (legacy)|250k per license | 500k per license|
Power Automate Free|6k per user| 10k per cloud flow|
Office 365|6k per user| 10k per cloud flow|
Power Apps Premium|40k per user | 200k per cloud flow|
Dynamics 365 professional|40k per user | 200k per cloud flow|
Dynamics 365 Enterprise applications|40k per user | 200k per cloud flow|
Dynamics 365 Team member|6k per user| 10k per cloud flow|

> [!NOTE]
> - The Power Automate Process licenses can be stacked on a cloud flow to increase its PRR limit
> - [FAQ on Power Platform Request within Power Automate](faqs.md#power-platform-requests-questions) 


### Transition period

All organizations are in a transition period. That means that enforcement isn't strict and PPR limits are higher. The transition period ends after [Power Platform admin center reports](/power-platform/admin/api-request-limits-allocations#view-detailed-power-platform-request-usage-information-in-the-power-platform-admin-center-preview) are generally available. Organizations then have six months to analyze their usage and purchase licenses that are appropriate before strict enforcement on license limits begins.

Here are a few things to be aware of during the transition period:

1. The transition period doesn't mean that there are no daily limits. It means that the currently enforced limits are more generous than the official limits to prevent potential unintended impact on your apps or flows. See [Requests limits and allocations](../api-request-limits-allocations.md) to understand both license limits and transition period limits. 

2. These transition period limits are applied at the cloud flow level during the transition period. Additionally, a separate per user level limit of 1,000,000 cloud flow actions is applied during the transition period to ensure users don't exceed 1M actions across all their flow runs in a day. After the transition period ends, the actual limits will be applied at user level for Premium licenses and cloud flow level for Process / Per flow-plan licenses.

3. During the transition period, manual cloud flows don't use the flow owners/flow invokers limits. Every manual cloud flow has a performance profile of Medium (100,000 requests/flow/24 hours). After the transition period, manual cloud flows will use the request limits of invoking user.

4. Since the limits are more generous during the transition period, [stacking of user licenses isn't supported](../api-request-limits-allocations.md). If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow uses the higher plan (Dynamics 365 plan).

5. Power Platform requests capacity add-on packs aren't assignable to users or cloud flows during the transition period. However, Microsoft recommends that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends. If your cloud flows are currently being throttled, purchase add-ons and create a support ticket with the flow details and add-on details so that the support team can provide exceptions for your throttled flows.

6. Seeded license users can only use cloud flows within the context of the app. To learn more, see [seeded licenses](#seeded-licenses) section. The enforcement on license limits is less strict during transition period and Microsoft recommends that you remain within your license terms to avoid any disruptions when the transition period ends.

## Zoom on specific licenses

### Power Automate Free license

If you sign in with your work or school email address, you get all capabilities included in the Power Automate Free license. If you have a non-business user account (such as an account that ends with @outlook.com or @gmail.com), you can still use Power Automate with the Power Automate Free license. Go to [Power Automate](https://flow.microsoft.com/) and then select **Try free**.

> [!NOTE]
> You can't share flows when you use the Free license.

To know which users have the Power Automate Free license, admins can go to the [Microsoft 365 admin portal](https://admin.microsoft.com/), sign in, select **Billing** > **Licenses** to see how many Free licenses are assigned vs available:

![Image of trial licenses](../media/power-automate-licensing/trial-licenses.png)

Select **Assigned licenses** to see which users have Free license.

### Power Automate Trial license

A user can self-provision a Power Automate Trial license from within the Power Automate portal. For example, when a user tries to create a desktop flow without a Power Automate Premium license, the user is prompted to start a Trial that includes usage of premium connectors, attended RPA and unattended RPA. This trial lasts for 90 days.

![Start free trial from within Power Automate](../media/power-automate-licensing/free-trial-inline.png)

#### How can admins allow or block Power Automate Trial licenses (self-assisted)?

Admins can use PowerShell cmdlets to enable or disable self-assisted trials. Once disabled, all existing licenses of the specified type are removed from all users in the tenant. These trials aren't recoverable. Additionally, it blocks all further assignment of licenses of that type. Admins can enable self-assisted trials at any time.

[Learn how to create a trial (subscription-based) environment in the Power Platform admin center](../trial-environments.md#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center).

#### Is Power Automate Trial license available in government clouds?

No, Power Automate Trial licenses aren't available work in government clouds (GCC). Those organizations can only purchase licenses with volume discounting.

### Admin managed trial licenses

Global admins use the Microsoft 365 admin center to get Power Automate Premium, Power Automate Process, or Power Automate Hosted Process trials and assign them to users / environments. These trials are for 30 days. Global admins can add a trial (subscription-based) environment to their tenant, or new organizations can sign up for a new tenant and become the global admin. For new organizations, an admin-managed subscription is created with a specific number of licenses (usually 25); admins control which users get licenses. assigned to them. An admin-managed subscription has an end date that can be extended once (another 30 days). 

> [!NOTE]
> - Admin managed trials are different from the Power Automate Trial license (self-assisted).
> - When using an admin managed trial SKU, the SKU name might not say Trial.

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

#### How can I convert a trial environment to a production environment?

You can convert either type of trial environments to a production environment by switching it to consume from paid capacity, keeping it from being disabled and deleted. After it becomes a production environment, it follows the paid license lifecycle

### Power Apps Developer plan

There's a [free Power Apps Developer plan to learn about Power Platform](https://powerapps.microsoft.com/communityplan/). You aren't allowed to use it in production but can try out things and have access to all premium connectors. You can use this free developer plan also in a free [Microsoft 365 developer tenant](https://developer.microsoft.com/microsoft-365/dev-program). Business process flows and RPA flows can't be created in an environment with the Power Apps Developer plan.

## Entitlements of all standalone licenses including legacy

||Free license<br>____________________________|Per-user plan (legacy) <br>____________________________|Premium license<br>____________________________|Trial license <br>____________________________|Per-flow plan (legacy)<br>____________________________|Process license<br>____________________________|Hosted Process license<br>____________________________|
|----------|-------|---------------------|--------------|-------|---------------------|--------------|--------------|
|__Applied to__|User|User|User|User|Cloud flow|- Cloud flow <br>- Machine|- Cloud flow <br>- Machine <br>- Hosted machine <br>- Hosted machine group|
|__Daily PPR limit  <sup>1</sup>__|6k per user|40k per user|40k per user||250k per Per-flow plan|250k per Process license <sup>2</sup>|250k per Hosted Process license <sup>2</sup>|
|__Standard connectors__|Included|Included|Included|Included|Included|Included|Included|
|__Premium connectors__|Not included|Included|Included|Included|Included|Included|Included|
|__Custom connectors__|Not included|Included|Included|Included|Included|Included|Included|
|__Attended RPA__|Not included|Not included|Included|Included|Not included|Not included|Not included|
|__Unattended RPA__|Not included|Not included|Not included|Included|Not included|One unattended bot included|One unattended bot included <sup>3</sup>|
|__Hosted RPA__|Not included|Not included|Not included|Not included|Not included|Not included|One hosted bot included <sup>3</sup>|
|__Business process flows__|Not included|Included|Included|Included|Included|Included|Included|
|__On-premises gateways__|Not included|Included|Included|Included|Included|Included|Included|
|__Process mining__|Not included|Not included|Included|Included|Not included|Not included|Not included|
|__Process mining data storage__|Not included|Not included|50-MB per license <sup>4</sup>|Not included|Not included|Not included|Not included|
|__AI Builder credits__|Not included|Not included|5000 per month|Not included|Not included|5000 per month|5000 per month|
|__Dataverse database storage__|Not included|250-MB per license|250-MB per license|Not included|50-MB per license|50-MB per license|50-MB per license|
|__Dataverse file storage__|Not included|2-GB per license|2-GB per license|Not included|200-MB per license|200-MB per license|200-MB per license|

_1 The Power Platform Requests are subjected to higher limits during the transition period ([see details](#power-platform-requests))._ <br>
_2 When multiple units of Process licenses are allocated to a cloud flow, their PPR limits are stacked._ <br>
_3 The Hosted Process license provides an unattended bot when allocated to a standard machine __OR__ a hosted bot when used by a hosted machine (which can be a standalone hosted machine or be part of a hosted machine group)._<br>
_4 Up to 100 GB per tenant._
