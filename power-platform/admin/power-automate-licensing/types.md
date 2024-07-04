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

Entitlements to use [Power Automate capabilities](#license-entitlements) (standard connectors, premium connectors, attended RPA, etc.) are obtained via licenses and add-ons. This article focusses on licenses (for details on add-ons, visit the [types of Power Automate add-ons](add-ons.md) page). 

The Power Automate licenses are categorized as follows:
![Power Automate licenses](../media/RPA-license/licenses-2.png)

|License type<br>__________________|License scope<br>__________________________________________________________|Description<br>_______________________________________________________________|
|-------|------|------|
|User license| User-centric: a user license is assigned to a user.|It entitles the user to access [specific capabilities](#license-entitlements).|
|Capacity license| Object-centric: a capacity license is allocated to a Power Automate object (cloud flow, machine, hosted machine, hosted machine group).|It provides the object autonomous entitlements (the same way a user license provides entitlements to a user).|

You can purchase those licenses on [Power Automate Pricing](https://flow.microsoft.com/pricing/) page or from your [Microsoft 365 Admin Center](https://admin.microsoft.com/) (if you are an admin). [Learn more](buy-licenses.md)

> [!NOTE]
> 
> As alternative to licenses, an organization can enable its environments to use the [Pay-as-you-go model](/power-platform/admin/pay-as-you-go-overview) and get started building flows without any license requirement or upfront costs. 

## User licenses

![User licenses](../media/RPA-license/standalone_user_licenses.png)

To create, test, run and monitor Power Automate automations (cloud flows or destkop flows), users need to be individualy licensed. 

Hereunder the list of available Power Automate user licenses: 

|License name<br>____________________________|License type<br>___________________|Entitlements<br>____________________________________________________________________________________________|
-------|------|------|
Power Automate Premium|User license|This is the license we recommend for all users as it gives them the full set of capabilities to create both API based and desktop automations.<br><br>This license allows users to create, run and shared unlimited cloud flows (within [PPR limits](api-request-limits-allocations.md#Request-limits-in-power-automate) for API-based automation (with standard, premium and custom connectors) and to automate their legacy applications simulating a human behavior such as keyboard or mouse keys and movement (with desktop flows through Robotic process automation (RPA).<br><br>More precisely regarding the [premium RPA entitlements](/power-automate/desktop-flows/premium-features), this license includes the ability for users to register their workstation, to create unlimited desktop flows, and to execute their desktop flows in attended mode on their registered machine through an attended bot beared by the license. <br><br>Additionally, this license also includes full access to process mining functionalities and the provisioning of AI Builder credits, which support AI consuming scenarios like form processing, object detection, text classification, etc.<br><br>The license will suit users looking to __plainly take advantage of Power Automate__.|
[Power Automate Free](deep-dive-on-specific-license.md#power-automate-free-license)|User license (free)|This license provides basic access to Power Automate allowing users to create and run (but not share) unlimited cloud flows (within [PPR limits](api-request-limits-allocations.md#Request-limits-in-power-automate)) restricted to standard connectors only.<br><br>The license will suit users eager to __discover cloud flows__.|
[Power Automate Trial](deep-dive-on-specific-license.md#power-automate-trial-license)|User license <br>(90 days trial)|This self-assisted trial license provides a user with the same capabilities as a Power Automate Premium license (except for AI builder credits and storage capacities). <br><br>The Trial license bears the extra capability to execute their desktop flows in unattended mode on their registered machine through an unattended bot beared by the license.<br><br>The license will suit users eager to __discover desktop flows__.|

##  Capacity licenses

![ capacity licenses](../media/RPA-license/standalone_capacity_licenses.png)

In addition to user licenses, organizations can upgrade their automation scenarios with capacity licenses, which are allocated to Power Automate objects (cloud flows, machines, hosted machines, hosted machine groups) and provide these objects autonomous entitlements (regardless of the user license owned by persons interacting with those objects). 

|License name<br>__________________________|License type<br>_______________|Allocated object<br>___________________________|Entitlements<br>___________________________________________________________________|
------|------|------|------
[Power Automate Process](deep-dive-on-specific-license.md#power-automate-process-license)|Capacity|- Cloud flow <br>- Standard machine|Allocated to a cloud flow, a Power Automate Process license entitles it to use standard, premium, and custom connectors while being accessed by unlimited users within the organization (regardless of their user license). Each Process license allocated to a cloud flow entitles it to 250k daily [Power Platform Request](api-request-limits-allocations.md#Request-limits-in-power-automate) (stackable limit). <br><br>Multiple cloud flows part of the same business process (invoicing process, ticketing process, etc.) can be associated together and covered by the same Process license(s).<br><br>Allocated to a machine, a Process license becomes an unattended bot. Each unattended bot can carry one unattended desktop flow run at a time<sup>1</sup>. 
[Power Automate Hosted Process](deep-dive-on-specific-license.md#power-automate-hosted-process-license)|Capacity|- Hosted machine <br>- Hosted machine group<br>- Cloud flow<br>- Machine|The Hosted Process license enables [RPA with zero infrastructure](/power-automate/desktop-flows/hosted-rpa-overview) (= no physical machine management on the user side). Each Hosted Process license bears one hosted bot and each Microsoft hosted machine requires one hosted bot to be turned-on.<br><br>Those hosted machines can be created as individual hosted machines or as part of hosted machine groups which provide 1) auto-scalability delivering high processing parallelization and reacting to demand spikes and 2) [load balancing](/power-automate/desktop-flows/hosted-machine-groups.md#load-balance-hosted-machine-group)<sup>2</sup> accross multiple hosted machine groups which optimizes the hosted bot utilization rate.<br><br>The Power Automate Hosted Process is also a superset of the Power Automate Process which means it can provide the same entitlements as the Process license (allocated to a cloud flow or to a machine).<sup>3</sup>|

_1. When an unattended run is triggered, the unattended bot securely signs into the machine on user's behalf, executes the desktop flow actions on the target applications, and then signs out of the device._ <br>
_2. Load balancing refers to the ability of multiple hosted machine group to scale-up and down at different moments using the same available hosted pool. The load balancing governance is managed through the max bots and committed bots scaling settings._ <br>
_3. The Power Automate Hosted Process superset behaviour (allowing it to be applied to machines and cloud flows) is not yet available, in the meantime any organization with [Process overage](/power-automate/desktop-flows/capacity-utilization-process#capacity-overage) that could be covered by its Hosted Process licenses should ignore the Process overage ._ 

> [!IMPORTANT]
> __Can my organization only purchase and use capacity licenses within an environment?__
> 
> Capacity licenses usually can't replace all user licenses within an environment as some essential capabilities are only available to licensed users:
> - Allocation of a Process license to a machine (required by the unattended mode) still prerequires the machine to have been registered by a Power Automate Premium user.
> - Multiple monitoring pages in the Power Automate portal are displayed only to Power Automate Premium users (workqueue page, machine list page, desktop flow list page, etc.).

## Compare Power Automate licenses

Hereunder a table detailing each license [entitlement](#license-entitlements):

||Premium license<br>____________________________|Process license<br>____________________________|Hosted Process license<br>____________________________|
|----------|-------|---------------------|--------------|
|__Applied to__|User|- Cloud flow <br>- Machine|- Cloud flow <br>- Machine <br>- Hosted machine <br>- Hosted machine group|
|__Daily PPR limit  <sup>1</sup>__|40k per user|250k per Process license <sup>2</sup>|250k per Hosted Process license <sup>2</sup>|
|__Standard connectors__|Included|Included|Included|
|__Premium connectors__|Included|Included|Included|
|__Custom connectors__|Included|Included|Included|
|__Attended RPA__|One attended bot included|Not included|Not included|
|__Unattended RPA <sup>3</sup>__|Not included|One unattended bot included|One unattended bot included <sup>4</sup>|
|__Hosted RPA__|Not included|Not included|One hosted bot included|
|__Business process flows__|Included|Included|Included|
|__On-premises gateways__|Included|Included|Included|
|__Process mining__|Included|Not included|Not included|
|__Process mining data storage__|50 MB per license <sup>5</sup>|Not included|Not included|
|__AI Builder credits__|5000 per month|5000 per month|5000 per month|
|__Dataverse database storage__|250 MB per license|50 MB per license|50 MB per license|
|__Dataverse file storage__|2 GB per license|200 MB per license|200 MB per license|

_1. The Power Platform Requests are subjected to higher limits during the transition period ([see details](api-request-limits-allocations.md#Request-limits-in-power-automate))._ <br>
_2. When multiple units of Process licenses are allocated to a cloud flow, their PPR limits are stacked._ <br>
_3. Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Microsoft 365, you must purchase the [M365 - Unattended license](deployoffice/overview-licensing-activation-microsoft-365-apps.md#unattended-license) in addition to the Power Automate Unattended RPA add-on._ <br>
_4. As the Hosted Process license is a superset of the Process license, each hosted bot can also be seen as an unattended bot which allows to run in unattended mode on the hosted machine / hosted machine group_<br>
_5. Up to 100 GB per tenant._

## License entitlements

Licenses have entitlements and each entitlement gives access to a specific Power Automate capability. Hereunder the list of entitlements that licenses can provide:

![License entitlements](../media/RPA-license/entitlement_list.png)

### How can I see my current entitlements ?

In the Power Automate portal, click on __Settings__ and on __View my licenses__:

![View my licenses](../media/RPA-license/view-my-licenses-4.png)

> [!NOTE]
> - The user license(s) are displayed in the section _My licenses_
> - The capacity license(s) (and capacity add-ons) are displayed in the section _Environment capacities_
> - The user entitlement are displayed in the _Capabilities_ section with a green check mark

### Entitlements to usage of connector types in cloud flows

A [connector](/connectors/overview) represents the underlying service (such as OneDrive, SharePoint, Salesforce, etc.) with which a cloud flow can interact. It provides a way for a user to connect its cloud flow to a third-party account (such as a Salesforce account) and use a set of prebuilt actions and triggers.

|Entitlement to<br>____________________________|Entitlement description<br>___________________________________________________________________________________________________________|
|----------|-------|
|Standard connectors|The [standard connectors](/connectors/connector-reference/connector-reference-standard-connectors) entitlement is needed to add a standard connector to a cloud flow and trigger it.|
|Premium connectors|The [premium connectors](/connectors/connector-reference/connector-reference-standard-connectors) entitlement is needed to add a premium connector to a cloud flow and trigger it.|
|Custom connectors|The [custom connectors](/connectors/custom-connectors) entitlement is needed to create a connector with its own triggers and actions when an app / a service does't have a prebuilt connector.|

### Entitlements to usage of Robotic process automation (RPA)

[Robotic process automation (RPA)](/power-automate/desktop-flows/introduction) is needed to interact with applications, which are lacking a prebuilt connector and which don't have APIs that could be used to build a custom connector. With RPA, you automate applications by teaching Power Automate for Desktop to mimic the mouse movements and keyboard entries of a human user, as if a robot was using the computer. 

|Entitlement to<br>____________________________|Entitlement description<br>___________________________________________________________________________________________________________|
|----------|-------|
|Attended RPA|The attended RPA entitlement is needed to perform most of the RPA related operations: register a machine, access RPA management portal pages, add premium and custom actions to desktop flows, share desktop flows, create desktop flows in non-default environments and trigger desktop flows in __attended mode__ through an attended bot (in default attended mode or in Picture-in-picture attended mode). <br><br>Attended run mode refers to a desktop flow execution with human supervision, it is materialized by __attended bots__: the Trial user license and the Premium user license bear one attended bot each.<br><br> When an attended run is triggered, the attended bot securely access the machine already is use by the user and executes the desktop flow actions on the target applications.<br><br> Picture-in-picture attended mode refers to attended desktop flows executions within a virtual window that replicates ther user's desktop, so that they can continue working on their machine while the automation is running in parallel.|
|Unattended RPA|The unattended RPA entitlement is needed to trigger desktop flows in __unattended mode__ through an unattended bot. <br><br>Unattended run mode refers to a desktop flow execution without human supervision, it is materialized by __unattended bots__: the Trial user license and the Process license bear one unattended bot each (to be allocated to a machine for the Process license). <br><br> When an unattended run is triggered, the unattended bot securely signs into the  machine on user's behalf, executes the desktop flow actions on the target applications, and then signs out of the device.|
|Hosted RPA|The hosted RPA entitlement is needed to create and turn-on a __Microsoft hosted machine__ (individual hosted machine or part of a hosted machine group) thus enabling [RPA with zero infrastructure](/power-automate/desktop-flows/hosted-rpa-overview) (= no physical machine management on the user side).<br><br>An active (= turned-on) hosted machine is materialized by an __hosted bot__: each Hosted Process license bears one hosted bot.<br><br>As the Hosted Process license is a superset of the Process license, the hosted entitlement implicitely includes the unattended entitlement, meaning that each hosted bot can also be seen as an unattended bot (= provides the unattended run mode capability on the hosted machines (individual or part of a group)).|

To learn more about the premium RPA capabilities, go to [Premium RPA features](/power-automate/desktop-flows/premium-features).

### Entitlements to other Power Automate capabilities

|Entitlement to<br>____________________________|Entitlement description<br>___________________________________________________________________________________________________________|
|----------|-------|
|Business process flows|The [business process flows](/power-automate/business-process-flows-overview) entitlement is needed to create a business process flow. Business process flows provide a guide for people to get work done they offer a streamlined user experience that leads people through the processes their organization has defined.|
|On premises gateway|The [on-premises data gateway](/power-automate/gateway-reference) entitlement is needed to create and use an on-premises data gateway. It acts as a bridge to provide quick and secure data transfer between on-premises data and several Microsoft cloud services. With gateways, organizations can keep databases and other data sources on-premises and securely use that on-premises data in cloud services.|
|Process mining|The process mining entitlement is needed to use the process mining and task mining capabilities of Power Automate.|

### Consumptive credits and storage entitlements

|Entitlement to<br>____________________________|Entitlement description<br>___________________________________________________________________________________________________________|
|----------|-------|
|AI Builder credits|With [AI builder](/power-automate/use-ai-builder), you add intelligence to your automations, predict outcomes, and help improve business performance. AI Builder capacity is expressed in the form of "service credits." Service credits serve as the single (common) currency across all the scenarios that AI Builder supports. Available service credits are deducted when AI Builder services are used. For instance, you could use these credits to extract data from a few documents with _form processing_ or perform hundreds of basic text extractions. Different scenarios (for example, forms processing, prediction, etc.) consume service credits at different rates. Learn more about [AI builder licensing](/power-platform/admin/powerapps-flow-licensing-faq).|
|Dataverse database and file storage|Data volume continues to grow exponentially as businesses advance their digital transformation journey and bring data together across their organizations. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today's organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs. Microsoft Dataverse capacity storage is optimized for relational data (database), attachments (file), and audit logs (log). Some Power Automate license provide a tenant-wide entitlement for each of these three storage types. You can buy more storage in 1-GB add-on increments. Learn more about [Dataverse capacity storage](../capacity-storage.md).|
|Process mining data storage|The process mining capability in Power Automate is suited for discovery of inefficiencies in organization-wide processes. It enables you to gain a deep understanding of your processes using event log files that you can get from your system of recording (apps you use in your processes). The process mining capability displays maps of your processes with data and metrics to recognize performance issues.|
