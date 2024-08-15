---
title: Types of Power Automate licenses
description: Learn about types of Power Automate licenses.
author: cvassallo
contributors:
  - cvassallo
  - samathur
  - PriyaKodukula
  - v-aangie
  - kenseongtan
ms.subservice: admin
ms.topic: overview
ms.date: 06/24/2024
ms.author: cvassallo
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# Types of Power Automate licenses

Entitlements to use [Power Automate capabilities](#license-entitlements) (standard connectors, premium connectors, attended RPA, and more) are obtained via licenses and add-ons. This article focuses on licenses. Learn more in [Types of Power Automate add-ons](add-ons.md). 

The Power Automate licenses are categorized as follows:

:::image type="content" source="../media/RPA-license/licenses-3.png" alt-text="Screenshot of Power Automate licenses.":::

|License type |License scope |Description |
|-------|------|------|
|User license| User-centric: a user license is assigned to a user.|It entitles the user to access specific capabilities.|
|Capacity license| Automation-centric: a capacity license is allocated to a Power Automate automation (cloud flow, machine, hosted machine, hosted machine group).|It provides the automation entitlements (the same way a user license provides entitlements to a user).|

You can purchase those licenses on the [Power Automate Pricing](https://flow.microsoft.com/pricing/) page or from your [Microsoft 365 Admin Center](https://admin.microsoft.com/) (if you're an admin). [Learn more on purchasing](buy-licenses.md).

> [!TIP]
>
> - As alternative to licenses, an organization can enable its environments to use the [Pay-as-you-go model](/power-platform/admin/pay-as-you-go-overview) and get started building flows without any license requirement or upfront costs.
> - Within a Pay-as-you-go environment all premium capabilities (including RPA) are available

Extra details on the Power Platform licensing model can be found in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). 

## User licenses

:::image type="content" source="../media/RPA-license/standalone_user_licenses-2.png" alt-text="Screenshot of user licenses.":::

To create, test, run, and monitor Power Automate automations (cloud flows or desktop flows), users need to be individually licensed. 
Hereunder the list of available Power Automate user licenses: 

# [**Power Automate Premium license**](#tab/power-automate-premium)

#### Power Automate Premium

|License name |Power Automate Premium |
|--------|--------|
|**License type**|User license (paid)|
|**Entitlements**|We recommend the Power Automate Premium license for all users, as it gives them the full set of capabilities to create both API based and desktop automations.<br><br>This license allows users to create, run, and share unlimited cloud flows (within [PPR limits](/power-platform/admin/api-request-limits-allocations#request-limits-in-power-automate) for API-based automation (with standard, premium, and custom connectors) and to automate their legacy applications simulating a human behavior such as keyboard or mouse keys and movement (with desktop flows through robotic process automation (RPA).<br><br>More precisely regarding the [premium RPA entitlements](/power-automate/desktop-flows/premium-features), this license includes the ability for users to register their workstation, to create unlimited desktop flows, and to execute their desktop flows in attended mode on their registered machine through an attended bot borne by the license. <br><br>Additionally, this license also includes full access to process mining capabilities and the provisioning of AI Builder credits, which support AI consuming scenarios like form processing, object detection, text classification, and more.|
|**User category**|The Power Automate Premium license suits users looking to build automations and take advantage of the full spectrum of Power Automate capabilities.|

# [**Power Automate Trial license**](#tab/power-automate-trial)

#### Power Automate trial

|License name |Power Automate trial |
|--------|--------|
|**License type**|User license (90 days trial)|
|**Entitlements**|This self-assisted trial license provides a user with the same capabilities as a Power Automate Premium license (except for AI builder credits and storage capacity). <br><br>The Trial license bears the extra capability to execute their desktop flows in unattended mode on their registered machine through an unattended bot borne by the license.|
|**User category**|The Power Automate Trial license suits users eager to discover how desktop flows can be leveraged as a way to create automations.|

Learn more about the [Power Automate trial](deep-dive-on-specific-license.md#power-automate-trial-license) license.

# [**Power Automate Free license**](#tab/power-automate-free)

#### Power Automate Free

|License name |Power Automate Free |
|--------|--------|
|**License type**|User license (free)|
|**Entitlements**|This license provides basic access to Power Automate allowing users to create and run (but not share) unlimited cloud flows (within [PPR limits](/power-platform/admin/api-request-limits-allocations#request-limits-in-power-automate)) restricted to standard connectors only.|
|**User category**|The Power Automate Free license suits users eager to discover how cloud flows can be leveraged as a way to create automations.|

Learn more about the [Power Automate Free](deep-dive-on-specific-license.md#power-automate-free-license) license.

---

## Capacity licenses

:::image type="content" source="../media/RPA-license/standalone_capacity_licenses-2.png" alt-text="Screenshot of capacity licenses.":::

In addition to user licenses, organizations can upgrade their automation scenarios with capacity licenses, which are allocated to Power Automate automations (cloud flows, machines, hosted machines, hosted machine groups) and provide these automations autonomous entitlements (regardless of the user license owned by persons interacting with those automations). 

Hereunder the list of available Power Automate capacity licenses: 

# [**Power Automate Process license**](#tab/power-automate-process)

#### Power Automate Process

|License name |Power Automate Process |
|--------|--------|
|**License type**|Capacity license (paid)|
|**Allocated automation**|- Cloud flow <br>- Standard machine|
|**Entitlements**|Allocated to a cloud flow, a Power Automate Process license entitles it to use standard, premium, and custom connectors while being accessed by unlimited users within the organization (regardless of their user license). Each Process license allocated to a cloud flow entitles it to 250k daily [Power Platform Request](/power-platform/admin/api-request-limits-allocations#Request-limits-in-power-automate) (stackable limit). <br><br>Multiple cloud flows part of the same business process (invoicing process, ticketing process, etc.) can be associated together and covered by the same Process licenses.<br><br>Allocated to a machine, a Process license becomes an unattended bot. Each unattended bot can carry one unattended desktop flow run at a time<sup>1</sup>.|
|**Will benefit**|Organizations looking to automate their business processes at scale using cloud flows or RPA desktop automations or a combination of both.|

> 1. When an unattended run is triggered, the unattended bot securely signs into the machine on user's behalf, executes the desktop flow actions on the target applications, and then signs out of the device.

Learn more about the [Power Automate Process](deep-dive-on-specific-license.md#power-automate-process-license) license.

# [**Power Automate Hosted Process license**](#tab/power-automate-hosted-process)

#### Power Automate Hosted Process

|License name |Power Automate Hosted Process |
|--------|--------|
|**License type**|Capacity license (paid)|
|**Allocated object**|- Hosted machine <br>- Hosted machine group<br>- Cloud flow<br>- Machine|
|**Entitlements**|The Hosted Process license enables [RPA with zero infrastructure](/power-automate/desktop-flows/hosted-rpa-overview) (= no physical machine management on the user side). Each Hosted Process license bears one hosted bot, which enables the creation of one Microsoft hosted machine requires.<br><br>Those hosted machines can be created as individual hosted machines or as part of hosted machine groups, which provide 1) auto-scalability delivering high processing parallelization and reacting to demand spikes and 2) [load balancing](/power-automate/desktop-flows/hosted-machine-groups#load-balance-hosted-machine-group)<sup>1</sup> across multiple hosted machine groups, which optimizes the hosted bot utilization rate.<br><br>The Power Automate Hosted Process is also a superset of the Power Automate Process, which means it can provide the same entitlements as the Process license (allocated to a cloud flow or to a machine).<sup>2</sup>|
|**Will benefit**|Organizations looking to enable their RPA desktop automations quickly and at scale while freeing up the previously required management of physical resources and thus reducing costs.|

> 1. Load balancing refers to the ability of multiple hosted machine groups to scale-up and down at different moments using a common hosted pool. The load balancing governance is managed through the max bots and committed bots scaling settings.

> 2. The Power Automate Hosted Process superset behavior (allowing it to be applied to machines and cloud flows) isn't yet available, in the meantime any organization with [Process overage](/power-automate/desktop-flows/capacity-utilization-process#capacity-overage) that could be covered by its Hosted Process licenses should ignore the Process overage.

Learn more about the [Power Automate Hosted Process](deep-dive-on-specific-license.md#power-automate-hosted-process-license) license.

---

> [!IMPORTANT]
> __Can my organization only purchase and use capacity licenses within an environment?__
>
> Capacity licenses are not meant to replace user licenses within an environment as some essential capabilities are only available to licensed users to create automations. Capacity licenses can grant higher [PPR](/power-platform/admin/api-request-limits-allocations#Request-limits-in-power-automate) to such flows built using the premium user licenses:
> - Allocation of a Process license to a machine (required by the unattended mode) still prerequires the machine to have been registered by a Power Automate Premium user.
> - Multiple monitoring pages in the Power Automate portal are displayed only to Power Automate Premium users (workqueue page, machine list page, desktop flow list page, etc.).

## Compare Power Automate licenses

Hereunder a table detailing each license [entitlement](#license-entitlements):

||Premium license |Process license |Hosted Process license |
|----------|-------|---------------------|--------------|
|__Applied to__|User|- Cloud flow <br>- Machine|- Hosted machine <br>- Hosted machine group<br>- Cloud flow <br>- Machine|
|__<b>Capacity Limits</b>__||||
|__Daily PPR limit<sup>1</sup>__|40k per user|250k per Process license<sup>2</sup>|250k per Hosted Process license<sup>2</sup>|
|__Process mining data storage__|50 MB per license<sup>4</sup>|Not included|Not included|
|__AI Builder credits__|5000 per month|5000 per month|5000 per month|
|__Dataverse database storage__|250 MB per license|50 MB per license|50 MB per license|
|__Dataverse file storage__|2 GB per license|200 MB per license|200 MB per license|
|__Standard connectors__|Included|Included|Included|
|__<b>Connectors</b>__||||
|__Premium connectors__|Included|Included|Included|
|__Premium connectors__|Included|Included|Included|
|__Custom connectors__|Included|Included|Included|
|__<b>Desktop Automation</b>__||||
|__Attended RPA__|One attended bot included|Not included|Not included|
|__Unattended RPA__|Not included|One unattended bot included|One unattended bot included<sup>3</sup>|
|__Hosted RPA__|Not included|Not included|One hosted bot included|
|__<b>Other</b>__||||
|__Process mining__|Included|Not included|Not included|
|__Business process flows__|Included|Included|Included|
|__On-premises gateways__|Included|Included|Included|


> 1. The Power Platform requests are subjected to higher limits during the transition period. Learn more in [Request limits in Power Automate](/power-platform/admin/api-request-limits-allocations#request-limits-in-power-automate).

> 2. When multiple units of Process licenses are allocated to a cloud flow, their PPR limits are stacked.

> 3. As the Hosted Process license is a superset of the Process license, each hosted bot can also appear as an unattended bot, which allows to run in unattended mode on the hosted machine / hosted machine group.

> 4. Up to 100 GB per tenant.

## License entitlements

Licenses have entitlements and each entitlement gives access to a specific Power Automate capability. Hereunder the list of entitlements that licenses can provide:

:::image type="content" source="../media/RPA-license/entitlement_list.png" alt-text="Screenshot of license entitlements.":::

# [**Connector types**](#tab/connector-types)

#### Entitlements to usage of connector types in cloud flows
A [connector](/connectors/overview) represents the underlying service (such as OneDrive, SharePoint, Salesforce, etc.) with which a cloud flow can interact. It provides a way for a user to connect its cloud flow to a third-party account (such as a Salesforce account) and use a set of prebuilt actions and triggers.

|Entitlement to  |Entitlement description |
|----------|-------|
|Standard connectors|The [standard connectors](/connectors/connector-reference/connector-reference-standard-connectors) entitlement is needed to add a standard connector to a cloud flow and trigger it.|
|Premium connectors|The [premium connectors](/connectors/connector-reference/connector-reference-standard-connectors) entitlement is needed to add a premium connector to a cloud flow and trigger it.|
|Custom connectors|The [custom connectors](/connectors/custom-connectors) entitlement is needed to create a connector with its own triggers and actions when an app / a service does't have a prebuilt connector.|

# [**Robotic Process Automation**](#tab/rpa)

#### Entitlements to usage of Robotic process automation (RPA)
[Robotic process automation (RPA)](/power-automate/desktop-flows/introduction) is needed to interact with applications, which are lacking a prebuilt connector and which don't have APIs that could be used to build a custom connector. With RPA, you automate applications by teaching Power Automate for Desktop to mimic the mouse movements and keyboard entries of a human user, as if a robot was using the computer. 

|Entitlement to |Entitlement description |
|----------|-------|
|Attended RPA|The attended RPA entitlement is needed to perform most of the RPA related operations: register a machine, access RPA management portal pages, add premium and custom actions to desktop flows, share desktop flows, create desktop flows in non-default environments and trigger desktop flows in __attended mode__ through an attended bot (in default attended mode or in Picture-in-picture attended mode). <br><br>Attended run mode refers to a desktop flow execution with human supervision, it's materialized by __attended bots__: the Trial user license and the Premium user license bear one attended bot each.<br><br> When an attended run is triggered, the attended bot securely accesses the machine already is use by the user and executes the desktop flow actions on the target applications.<br><br> Picture-in-picture attended mode refers to attended desktop flows executions within a virtual window that replicates the user's desktop, so that they can continue working on their machine while the automation is running in parallel.|
|Unattended RPA|The unattended RPA entitlement is needed to trigger desktop flows in __unattended mode__ through an unattended bot. <br><br>Unattended run mode refers to a desktop flow execution without human supervision, it's materialized by __unattended bots__: the Trial user license and the Process license bear one unattended bot each (to be allocated to a machine for the Process license). <br><br> When an unattended run is triggered, the unattended bot securely signs into the  machine on user's behalf, executes the desktop flow actions on the target applications, and then signs out of the device.|
|Hosted RPA|The hosted RPA entitlement is needed to create and turn-on a __Microsoft hosted machine__ (individual hosted machine or part of a hosted machine group) thus enabling [RPA with zero infrastructure](/power-automate/desktop-flows/hosted-rpa-overview) (= no physical machine management on the user side).<br><br>An active (= turned-on) hosted machine is materialized by an __hosted bot__: each Hosted Process license bears one hosted bot.<br><br>As the Hosted Process license is a superset of the Process license, the hosted entitlement implicitly includes the unattended entitlement, meaning that each hosted bot can also be seen as an unattended bot (= provides the unattended run mode capability on the hosted machines (individual or part of a group)).|

To learn more about the premium RPA capabilities, go to [Premium RPA features](/power-automate/desktop-flows/premium-features).

# [**Other capabilities**](#tab/other-capabilities)

#### Entitlements to other Power Automate capabilities

|Entitlement to |Entitlement description |
|----------|-------|
|Business process flows|The [business process flows](/power-automate/business-process-flows-overview) entitlement is needed to create a business process flow. Business process flows provide a guide for people to get work done they offer a streamlined user experience that leads people through the processes their organization defined.|
|On premises gateway|The [on-premises data gateway](/power-automate/gateway-reference) entitlement is needed to create and use an on-premises data gateway. It acts as a bridge to provide quick and secure data transfer between on-premises data and several Microsoft cloud services. With gateways, organizations can keep databases and other data sources on-premises and securely use that on-premises data in cloud services.|
|Process mining|The process mining entitlement is needed to use the process mining and task mining capabilities of Power Automate.|

# [**Consumptive credit and storage**](#tab/consumptive-credit-and-storage)

#### Consumptive credits and storage entitlements

|Entitlement to |Entitlement description |
|----------|-------|
|AI Builder credits|With [AI builder](/power-automate/use-ai-builder), you add intelligence to your automations, predict outcomes, and help improve business performance. AI Builder capacity is expressed in the form of "service credits." Service credits serve as the single (common) currency across all the scenarios that AI Builder supports. Available service credits are deducted when AI Builder services are used. For instance, you could use these credits to extract data from a few documents with _form processing_ or perform hundreds of basic text extractions. Different scenarios (for example, forms processing, prediction, etc.) consume service credits at different rates. Learn more about [AI builder licensing](/power-platform/admin/powerapps-flow-licensing-faq).|
|Dataverse database and file storage|Data volume continues to grow exponentially as businesses advance their digital transformation journey and bring data together across their organizations. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today's organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs. Microsoft Dataverse capacity storage is optimized for relational data (database), attachments (file), and audit logs (log). Some Power Automate license provide a tenant-wide entitlement for each of these three storage types. You can buy more storage in 1-GB add-on increments. Learn more about [Dataverse capacity storage](../capacity-storage.md).|
|Process mining data storage|The process mining capability in Power Automate is suited for discovery of inefficiencies in organization-wide processes. It enables you to gain a deep understanding of your processes using event log files that you can get from your system of recording (apps you use in your processes). The process mining capability displays maps of your processes with data and metrics to recognize performance issues.|

---

### How can I show my current entitlements?

In the Power Automate portal, select **Settings** > **View my licenses**:

:::image type="content" source="../media/RPA-license/view-my-licenses-4.png" alt-text="Screenshot of how to view your licenses.":::

> [!NOTE]
> - The user license(s) display in the section _My licenses_.
> - The capacity license(s) (and capacity add-ons) display in the section _Environment capacities_.
> - The user entitlement (in context of environment capacities) display in the _Capabilities_ section with a green check mark.

## Seeded licenses
Learn more about power automate capabilities included in [Seeded licenses](deep-dive-on-specific-license.md#power-automate-seeded-licenses) 

## Legacy licenses
Learn more about power automate capabilities included in [Legacy licenses](deep-dive-on-specific-license.md#power-automate-legacy-licenses) 
