---
title: Power Apps and Power Automate licensing FAQs| Microsoft Docs
description: "FAQs for licensing Power Apps, Power Automate, Dataverse, Dataverse for Teams, and AI Builder"
author: dileepsinghmicrosoft
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/16/2020
ms.author: dileeps
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Power Apps and Power Automate licensing FAQ

We have found some common questions on licensing and plan options. We’ve included several here with their answers. For more details about Microsoft Power Apps and Microsoft Power Automate licensing, see [Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## General licensing questions

### How is Microsoft Power Apps and Power Automate licensed? 

Power Apps plans:

- **Power Apps per app plan** which allows individual users to run applications (2 apps and a single portal) for a specific business scenario based on the full capabilities of Power Apps for $10/user/app/month. This plan provides an easy way for customers to get started with the platform before broader scale adoption.

- **Power Apps per user plan** which equips a user to run unlimited applications (within service limits) based on the full capabilities of Power Apps for $40/user/month.

Power Automate Plans:

- **Power Automate per user plan** which equips a user to run unlimited flows (within service limits) with the full capabilities of Power Automate based on their unique needs for $15/user/month.

- **Power Automate per flow plan** which enables organizations to implement flows with reserved capacity that serve teams, department, or the entire organization without having to license each end user. This plan starts at $500/month for 5 flows.

More details can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### How do I use Power Apps per app plans? 
See [Power Apps per app plan](signup-for-powerapps-admin.md#power-apps-per-app-plan).

### The Power Apps per app plan allows users to run specific apps. Can you explain what this means in terms of the number and types of apps I can use?

The Power Apps per app plan is designed to help organizations solve for one business scenario at a time, which may involve a combination of individual apps. Each “per app” license provides an individual user with rights to two apps (canvas and/or model-driven) as well as one Power Apps Portal, all within a single environment. A single user might be covered by multiple “per app” licenses to allow the user to use multiple solutions targeted at various business scenarios, without requiring a per-user license. In other words, the “per app” license is stackable.

### Do embedded canvas apps in model-driven apps count toward the two-apps limits?

No. Embedded canvas components within the model-driven app will not count towards the two apps limit in the per app licensing model.

### What are the self-service purchase options for the Power Platform products?

See the FAQ: [Self-service purchase FAQ](https://docs.microsoft.com/microsoft-365/commerce/subscriptions/self-service-purchase-faq#admin-capabilities).

### What license must be assigned to a guest so they can run a canvas app shared with them?

The guest user must have a Power Apps license assigned through one of the following tenants:

- The tenant hosting the app being shared
- The home tenant of the guest user

Also, the guest must have the same license that’s required for non-guests to run an app. A collection of examples is available [here](https://docs.microsoft.com/powerapps/maker/canvas-apps/share-app#what-license-must-be-assigned-to-my-guest-so-they-can-run-an-app-shared-with-them). 

### Is non-profit, government, and academic pricing available?

Yes, non-profit, government and academic pricing is available in respective program channels.

### What will happen to the Power Apps and Power Automate Plan 1 and Plan 2 plans on December 31, 2020?

Power Apps P1 and P2 and Power Automate P1 and P2 plans will no longer be available for purchase, including via auto-renewal, after December 31, 2020. Customers with these plan licenses that have renewals falling on or after January 1, 2021 will need to transition to the Power Apps per user or per app plans, or the Power Automate per user or per flow plans to continue using the Power Platform services. Please contact your Microsoft account rep for more information.

### Are full Power Automate capabilities included in Power Apps licenses?

Power Apps licenses will continue to include Power Automate capabilities. However, flows will need to run within the context of the Power Apps application, which refers to using the same data sources for triggers or actions as the Power Apps application. Consuming standalone Power Automate flows unrelated to the Power Apps application(s) will require purchase of a standalone Power Automate license.

### Is there a plan for developers?

Yes, we have a free Community Plan to learn and build skills on Power Apps, Power Automate, and Microsoft Dataverse. [Learn more](https://powerapps.microsoft.com/communityplan/).

### What happens when I use all the data storage, file storage, and flow runs included in my per user licenses?

You can buy additional data storage, file storage and flow runs. See the Power Apps Licensing overview page for more information.

### Who can buy Microsoft Power Apps and Power Automate plans?

Any customer can sign up for a free trial. Microsoft 365 admins can buy Power Apps plans for their teams or organization. Contact your Microsoft 365 admin when you’re ready to buy.

### Do all my users need to be licensed with the same Power Apps plan, or can I mix plans?

You can mix and match Power Apps licenses, and licenses that include Power Apps capabilities, across the users in your organization.

### Are there limits on the number of API requests Power Apps and Power Automate users can make?

Yes. To help ensure service levels, availability and quality, there are limits to the number of API requests users can make across Power Apps and Power Automate. Service limits are set against normal usage patterns in both 5-minute and per 24-hour intervals, and most customers will not reach them.

API capacity is tracked based on consumption at an individual user level, and the daily limits cannot be pooled at any other level.

API limits are also applicable to application users, non-interactive users and administrative users in Dataverse.

More information is available [here](https://aka.ms/platformlimits).

## Trial Licenses

### How long is the free trial period?

Free trials for Microsoft Power Apps last 30 days. For Power Automate, they are available for 90 days.

### Is there a way to develop my Microsoft Power Apps and Power Automate skills for more than 90 days?

Yes, with the Power Apps Community Plan you get a free environment for individual use with functionality including the Dataverse. In this environment you can explore and learn everything about Power Automate and Power Apps for free, but the Power Apps Community Plan is not intended for production use.

[Learn more](https://powerapps.microsoft.com/pricing/).

### How do I convert my trial environment to a production environment?

More information is available [here](/power-platform/admin/trial-environments).

### Where can I find more information about trial environments?

For more information about trial environments in Power Apps read this [topic](/power-platform/admin/trial-environments).

## Microsoft 365

### What are Microsoft Power Apps and Power Automate use rights for Microsoft 365 applications?

Please refer to [Licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130) for Microsoft Power Apps and Power Automate use rights for Microsoft 365 applications.

Effective October 1, 2019, the SQL, Azure, and Dynamics 365 connectors listed below will be reclassified from Standard to Premium. Non-Microsoft connectors that had previously been classified as standard connectors will still be available to Microsoft 365 users. A standalone Power Apps or Power Automate plan license is required to access all Premium, on-premises and custom connectors.

Azure Application Insights  
Azure Automation  
Azure Blob Storage  
Azure Container  
Azure Cosmos  
Azure Data Factory  
Azure Data Lake  
Azure DevOps  
Azure Event Grid  
Azure Event Grid Publish  
Azure File Storage  
Azure IoT Central  
Azure Kusto  
Azure Log Analytics  
Azure Log Analytics Data Collector  
Azure Queues  
Azure Resource Manager  
Azure SQL  
Azure SQL Data Warehouse  
Azure Table Storage  
Dynamics 365  
Dynamics 365 Customer Insights  
Dynamics 365 Finance & Operations  
Dynamics 365 Sales Insights  
Dynamics 365 Business Central  
Dynamics 365 Business Central (on-premises)  
Dynamics NAV  
Event Hubs  
Service Bus  
SQL Server

Power Automate plan-based limits on trigger frequency and the number of runs allocated to a tenant per month are being removed.

Power Apps and Power Automate usage will be subject to service limits described [here](https://aka.ms/platformlimits). Per user service limits provide capacity assurance for users and alleviate the risk of one user exhausting the tenant wide quota.

### How does the change to Power Apps and Power Automate use rights for Microsoft 365 applications affect me if I purchased the subscriptions prior to Oct 1st 2019? Will my existing Power Apps applications and Power Automate workflows continue to work?

Yes, existing apps and flows will continue to work. Customers who have been using Power Apps or Power Automate with Microsoft 365 using one or more of the connectors listed above will receive a transition period before the connector reclassification goes into effect. This transition period would be until October 1, 2020 or the expiration of their current Microsoft 365 subscription term, whichever is longer. During the transition period customers can continue to create additional apps and flows using these connectors.

In addition, apps and flows created prior to October 1, 2019 which are using these connectors will receive an extended transition period until October 1, 2024. During this time, these qualifying apps and flows will be exempt from the Premium connector licensing requirements for the reclassified connectors.

The extended transition period allows for using the connectors listed above but it does not allow these connectors to use gateways. Gateways were a premium capability before the transition and they continue to be a premium capability.

Although apps may be granted to use the Dynamics 365 connector for an extended transition period, the ability to use the connector does not provide Dataverse capacity. Dataverse capacity is a prerequisite for Power Apps and Power Automate workflows to use Dataverse. 

### How many Power Apps applications I can run with Microsoft 365 plans?

There is no limit on the number of applications. Customers can continue to run standalone Power Apps applications to extend and customize Microsoft 365 using standard connectors. 

## Dynamics 365

### What are Microsoft Power Apps and Power Automate use rights for Dynamics 365 applications?

Refer to [Licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130) for Microsoft Power Apps and Power Automate use rights for Microsoft 365 applications.

Effective October 1st 2019, there are certain changes made to use rights which are listed below:

Power Apps use rights with Dynamics 365 licenses: Dynamics 365 *Enterprise* licenses will no longer include general purpose Power Apps capabilities. Dynamics 365 Enterprise users will continue to be able to run apps and portals that extend and customize the licensed Dynamics 365 application, as long as those apps and portals are located in the same environment as their licensed Dynamics 365 application. Custom apps or portals outside of the Dynamics 365 environment will require a standalone Power Apps license.

Power Automate use rights with Dynamics 365 licenses: Dynamics 365 licenses will no longer include general purpose Power Automate capabilities. Power Automate flows will need to map to licensed Dynamics 365 application context - Power Automate flows should trigger from OR connect to data sources within use rights of licensed Dynamics 365 application(s). Use of standalone flows will require a Power Automate license.

### Can I connect to Microsoft Dynamics for Finance and Operations?

Yes, you can use the Dynamics 365 Finance and Operations connector to build canvas apps using this data.

## Power Automate

### When would I use the Power Automate per user plan versus the Power Automate per flow plan?

The per user plan is intended to support the broad adoption of an automation culture in an organization. Every user with this plan is entitled to use an unlimited number of flows, within service limits. The per flow plan provides an organization with the flexibility to license by the number of flows, instead of licensing each user accessing the flows individually with the per user plan.


### Which flows count in the Power Automate per flow plan?

All types of enabled flows count: scheduled flows, automated flows, and instant flows. Flows that are triggered by other flows (child flows) do not count against the plan.

### Do flows always have to be purchased in units of five as part of the Power Automate per flow plan?

No. After the minimum purchase of 5 flows, additional flows can be licensed individually at $100/month per flow.


### Do users who run flows need to be licensed, or do only users who create flows need to be licensed?

Any end user running a flow will need to be licensed either by the per user or per Power Automate plans.

There are features in Power Automate that are not running a flow directly, such as responding to an approval request or advancing a stage in a business process. These features are built on the Dataverse. Normally, any use of these features requires either a standalone Power Automate per user plan, or, that the flow that creates these business process environments or approval requests to be licensed under the per flow plan.

## Dataverse

### What Dataverse capacity is included with the Power Apps and Power Automate plans?

Every tenant with a Power Apps license gets default capacity. In addition, for each license there is additional capacity (pooled) added to the tenant.


| **Power Apps capacity Limits**         | **Per license entitlement (Power Apps per app plan)** | **Per license entitlement (Power Apps per user plan)** |
|---------------------------------------|------------------------------------------------------|-------------------------------------------------------|
| Dataverse Database Capacity | \+ 50 MB                                             | \+ 250 MB                                             |
| Dataverse Log Capacity      | \+ 0                                                 | \+ 0                                                  |
| Dataverse File Capacity     | \+ 400 MB                                            | \+ 2 GB                                               |

Since flows, as well as certain Power Automate features like approvals, run inside of the Dataverse, every tenant with a Power Automate license gets default capacity. In addition, for each per-user or per-flow license there is additional capacity added to the tenant.


| **Power Automate capacity Limits**    | **+ Per user** | **+ Per flow** |
|---------------------------------------|----------------|----------------|
| Dataverse Database Capacity | \+ 50 MB       | \+ 50 MB       |
| Dataverse Log Capacity      | \+ 0           | \+ 0           |
| Dataverse File Capacity     | \+ 200 MB      | \+ 200 MB      |

## Dataverse for Teams

Here is a list of Microsoft Dataverse for Teams licensing FAQs; for more information about Dataverse for Teams, see [About the Dataverse for Teams environment](about-teams-environment.md).

### Are the existing Microsoft Power Platform use rights included with Microsoft 365 licenses changing?

To deliver a comprehensive low-code extensibility platform for Microsoft Teams, Microsoft Power Platform capabilities available as part of select Microsoft 365 subscriptions are expanding with the introduction of Dataverse for Teams.

Dataverse for Teams is a built-in flexible datastore that provides data storage and a one-click solution for (app/chatbot) deployment in Teams. With the addition of Dataverse for Teams:
- Power Apps capabilities seeded in Microsoft 365 licenses are expanding to enable building and deploying custom apps natively within Teams.
-	Additionally, Power Virtual Agents capabilities are being introduced to Teams. Customers will now be able to build and deploy custom chatbots directly within Teams.

The existing Power Platform functionality available for use in Microsoft 365 more broadly outside of Teams remains otherwise unchanged.

### Is there any new capability coming with Dataverse for Teams to Power Automate rights included with Microsoft 365?

Yes. With Dataverse for Teams, users now can build flows using Power Automate maker portal and that operate in a Dataverse for Teams environment. Please note that a Dataverse for Teams environment needs to be created first by either authoring an app or chatbot.

### Which Microsoft 365 subscriptions include Dataverse for Teams and Power Virtual Agents capabilities with Teams?

Dataverse for Teams and Power Virtual Agents for Teams capabilities will be available as part of select Microsoft 365 subscriptions with Power Platform and Teams capabilities, excluding plans for US government environments (GCC, GCC High and DoD) and EDU A1 and SUB SKUs. For more information, see the [Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### How is Dataverse for Teams environment created? 

Creation of Dataverse for Teams environments is not available from the Power Platform admin center. Creation of new Dataverse for Teams environments will only be possible from within Teams. 

### Can Dataverse for Teams be used outside of Teams?

Dataverse for Teams is designed to work in the Teams client across web, desktop and mobile. If you’d want to use Dataverse for Teams outside of Teams, you must upgrade your environment to Dataverse. 

### Is there a limit to Dataverse for Teams capacity? How many Dataverse for Teams environments can be created in a tenant?  

Each Dataverse for Teams environment uniquely maps (1:1) to a Teams team and can store up to 1,000,000 records based on typical usage (enforced as 2GB relational database storage per Dataverse for Teams environment). For details on service limits, including the tenant-level capacity limits associated with Dataverse for Teams, see [About the Dataverse for Teams environment](about-teams-environment.md). 

### Can we control who can create environments with Dataverse for Teams?

Teams governs who can create and join a Team. The environment is created for a team when an owner or member tries to create an application in it.

### Can a Dataverse for Teams environment be deleted?
A Dataverse for Teams environment is deleted when the associated Team is deleted.

### How does the capacity enforcement work for Dataverse for Teams environments?

When the environment capacity limits are reached (2GB per environment) new solutions (apps, chatbots, flows) can't be created or installed in that specific Dataverse for Teams environment.

When the tenant capacity service limits are reached (grows with the # of eligible Office USLs in the tenant up to a max of 1TB or up to a max of 500 environments as explained [here](https://go.microsoft.com/fwlink/p/?linkid=2143567):

-	New apps, chatbots, flows, or tables cannot be created or installed in any Dataverse for Teams environment. 
-	New Dataverse for Teams environments cannot be created in the tenant 

In both cases:
-	Users who want to create/install new apps, chatbots, flows, or tables in that environment will be notified that the capacity limit is reached, and they need to reduce storage usage or contact their admins.
-	Existing solutions in the environment will continue to work (CRUD allowed). The environments will be able to continue to grow beyond the 2GB limit.  
-	Existing solutions within the environment can be updated.  
-	Certain options within each solution (Power Apps/Power Automate/Power Virtual Agents) will be hidden/grayed out.  

### Can customers with Power Apps, Power Automate, and Power Virtual Agents subscriptions use premium connectors with Dataverse for Teams?  
Yes. Accessing premium connectors in a specific Dataverse for Teams environment requires users in that environment to be licensed accordingly. 

Example: In a Dataverse for Teams environment, accessing premium connectors in the context of an app requires all users accessing the app to be licensed by either the Power Apps per app or per user plan depending on the customer scenario.
 
### Can I use AI Builder with Dataverse for Teams?
No. Tables for AI Builder are not included in Dataverse for Teams.

### Can I use UI Flows with Dataverse for Teams?

No. UI Flows are not supported in Dataverse for Teams.

### Can I use custom connectors in Dataverse for Teams?
Custom connectors are not supported in Dataverse for Teams but [support for Azure API Management (API-M)](https://powerapps.microsoft.com/blog/azure-api-management-connector-on-the-power-platform/) will be available later in Dataverse for Teams.

### Can customers purchase more capacity for a Dataverse for Teams environment?

No. Dataverse for Teams provides support for approximately 1 million rows per team. Although existing apps and chatbots will continue to work when a Dataverse for Teams environment reaches the per environment limit (2GB), users who want to create a new app, flow, chatbot, or table in the environment will need to :
1.	Purchase Power Apps, Power Automate, and Power Virtual Agents subscriptions based on their needs and start building their new app, flow, or chatbot in a Dataverse environment.
2.	[Upgrade](about-teams-environment.md#upgrade-process) the existing Dataverse for Teams environment to Dataverse in the Power Platform admin center and, if needed, purchase Power Apps, Power Automate, or Power Virtual Agents subscriptions based on their needs.

> [!NOTE]
> The capability to upgrade Dataverse for Teams environments to Dataverse environments isn’t available yet. Check back later for availability.
 
### Can customers package and export their solution (app/flow/chatbots) built in Dataverse for Teams, and then import that into a Dataverse environment (assuming they have the corresponding license including access rights to Microsoft Dataverse)?

This capability is not available yet, but is included in our roadmap.

### Other than adding capacity, what are the other reasons to upgrade a Dataverse for Teams environment?

[Upgrading](about-teams-environment.md#upgrade-process) an environment from Dataverse for Teams to Dataverse will enable customers to take advantage of additional capacity, capabilities, such as: 
-	Enterprise ALM, data types
-	Support for log and managed data lake
-	Rich access control, auditing
-	Governance and security

> [!NOTE]
> Accessing an environment with Dataverse requires all users to have a corresponding standalone Power Platform license for each service being utilized. For example, a user accessing an app running on Dataverse needs to be licensed by either the Power Apps per app or per user plan depending on the customer scenario.

### Why do I see Dataverse plan in select Microsoft 365 subscriptions? Is this related to Dataverse for Teams?

No. A limited set of Dataverse capabilities were recently added to Microsoft 365 licenses to support service capabilities available (for example, Microsoft Project). A standalone Power Apps, Power Automate, or Power Virtual Agents plan is still needed to run apps/flows/bots with Dataverse. Review the [Common Data Service capabilities with Microsoft 365 licenses](/power-platform/admin/pricing-billing-skus#common-data-service-capabilities-with-microsoft-365-licenses) for more details on the feature.

> [!NOTE]
> There is a service plan called *Dataverse for Teams* that is related to the Dataverse for Teams capabilities. This service plan is used by our platform for granting customer tenants Dataverse for Teams storage capacity and should not be deactivated.

### Is geo migration supported for Dataverse for Teams environments?
Geo migration is not supported for Dataverse for Teams environments.

## Add-ons

### What add-ons are available to the Power Apps and Power Automate plans?

A list of add-ons applicable to all standalone Power Apps and Power Automate plans are listed below:

- New **Power Apps Portals login capacity add-on** and **Portals page view capacity add-on** for external users of Power Apps Portals. External users are those outside of your organization who sign in with a variety of identities such as LinkedIn, Microsoft Account, other commercial login providers, or anonymously.

  - Power Apps Portals log in capacity add-ons (various volume tiers start from $200 per 100 logins per month)

  - Power Apps Portals page view capacity add-on (100,000 anonymous page views for $100 per month)

- New **Power Apps and Power Automate capacity add-on** increases daily API request limits for Power Apps, Power Automate, and Dynamics 365 workloads for users that exceed their usage entitlement (10,000 daily API requests for $50 per month).

- Dataverse Database Capacity (1GB) $40 per month

- Dataverse File Capacity (1GB) $2 per month

- Dataverse Log Capacity (1GB) $10 per month

## Portals

### Can you share more details regarding the new Power Apps Portals licensing?

Power Apps Portals can be provisioned without requiring a specific license. User access licensing is based on persona type and details are as below.

| **User type**                 | **Model**     | **SKU names**                                                       | **Unit capacity**  | **Price/month** | **Channel** | **Comments**                                                                              |
|-------------------------------|---------------|---------------------------------------------------------------------|--------------------|-----------------|-------------|-------------------------------------------------------------------------------------------|
| External user (authenticated) | Per login     | Power Apps portals login capacity add-on                             | 100 logins         | $200           | All         | A login provides the authenticated user with access to a single portal for up to 24 hours |
|                               |               | Power Apps portals login capacity add-on Tier 2                      | 1000 logins        | $1000          | All         |                                                                                           |
|                               |               | Power Apps portals login capacity add-on Tier 3                      | 5000 logins        | $3500          | CSP only    |                                                                                           |
| External user (anonymous) | Per page view | Power Apps portals page view capacity add-on                         | 100,000 page views | $100           | All         |                                                                                           |
| Internal user                 | Via license   | Dynamics 365 (various)                                              | n/a                | n/a             | n/a         | Custom portal use rights are aligned with custom app use rights                           |
|                               |               | Power Apps per app plan                                              |                    |                 |             |                                                                                           |
|                               |               | Power Apps per user plan                                             |                    |                 |             |                                                                                           |

- Multiple logins during the 24-hour period count as one billable login

### What exactly is considered a “login” as part of the Power Apps Portals add-on?

Think of a login as a “day pass” to a portal. Once logged in to a portal, subsequent logins (potentially from different devices) during the 24-hour period will not be billable.

### Does a single login provide access to multiple Power Apps Portals during the 24-hour period?

Logins are specific to a single portal. So if you access multiple portals belonging to the same tenant, it will be counted as one login per portal.


### What is the difference between Power Apps Portals and Dynamics 365 Portals in terms of licensing?

| **Parameter**                              | **Dynamics 365 Portals**                                            | **New Power Apps Portals**                                                                                                                              |
|--------------------------------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Provisioning a portal environment**      | **Purchase** Dynamics 365 Additional Portal SKU at $500 per month  | **Provision** a portal—no need to purchase portal addons to provision a portal                                                                         |
| **Qualifying base offers**                 | Dynamics 365 licenses only                                          | Customers can add on portal external login or page view capacity to Dynamics 365, **Power Apps and Power Automate licenses**                            |
| **Internal use rights**                    | Dynamics 365 enterprise licenses, Dynamics 365 team member license. | Internal users can now access portals with a **Power Apps per-app/per-user license. For a Dynamics license it is same as custom Power Apps use rights.** |
| **Monetization**                           | Per portal environment Per page view                                | **Per log in** Per page view                                                                                                                           |
| **Entitlement for Dynamics 365 customers** | 1 portal environment for the first 10 full Dynamics 365 USLs        | Not applicable―Power Apps Portals environments can be provisioned                                                                                       |

### Can I purchase Power Apps Portals add-on licenses with my existing Power Apps P1 or P2 plans or do I have to upgrade to the new plans to benefit from the new portal capability?

Yes. You can purchase Power Apps Portals add-on capacity if you are an existing Power Apps Plan 1 or Plan 2 customer. You can also purchase this capacity if you are a Dynamics 365 customer.

### Can you clarify the use rights to Portals for internal users?

Custom Power Apps Portals use rights: For internal users, use rights to a “custom” portal are aligned with their “custom” Power Apps use rights. For example:

- A Dynamics 365 enterprise application license gets use rights to custom Power Apps applications within the same environment as the Dynamics 365 application. As such, A Dynamics 365 enterprise application license gets use rights to custom Power Apps Portals within the same environment as the licensed Dynamics 365 enterprise application.

- The Team Member license does not get access to custom portal as Team Member licenses do not allow access to a custom app.

### What is the minimum number of logins and page view that I need to assign to a specific portal?

Minimum login quantity to be assigned to a portal is 100 logins/month. Once you have assigned 100 logins, you can assign them in units of 1.

For example, if you have 3 portals and bought 4 login packs (400 logins), you can assign them in the following ways:
- Portal 1: 120 (min 100)
- Portal 2: 151 (min 100)
- Portal 3: 129 (min 100)

Page views: Minimum 50,000 per portal. After that you can assign 1 at a minimum.

### Do unused Power Apps Portals logins carry forward to the next month?

Portals are licensed at a monthly rate that is based on a customer’s anticipated login volume. Logins are not accumulated as individual assets that would carry forward month to month.

## AI Builder

### How is AI Builder licensed?

AI Builder is a capacity add-on to paid, standalone Power Apps, Power Automate, and Dynamics 365 licenses. Each $500 subscription includes 1 million AI Builder service credits applied at the tenant level. To use your AI Builder capacity, an administrator has to allocate AI Builder capacity to the environment where you want to use AI Builder.  

- More details about licensing can be found in the Microsoft Power Apps and Power Automate Licensing Guide. 
- Information about how to allocate capacity in the Power Platform admin center can be found [here](/power-platform/admin/capacity-add-on).

### How is AI Builder capacity enforced?

The AI Builder capacity add-on is an annual subscription, and capacity is enforced on a monthly basis. Capacity should be purchased for the peak utilization monthly period.

Information about how to allocate AI Builder capacity to your environment is available [here](/power-platform/admin/capacity-add-on).

### Can AI Builder capacity be added to the P1 and P2 plans for Power Apps and Power Automate that are being retired?

Yes. AI Builder capacity can be added to the P1 and P2 plans for Power Apps and Power Automate for customers who haven’t yet transitioned to the new Power Apps and Power Automate plans.

### What is a "service credit" and how does it work? 

AI Builder includes several model types, including custom and prebuilt – a full list is available [here](/ai-builder/model-types#list-of-ai-model-types).

 AI models consume service credits when they are trained, used in an app or flow, or scheduled to periodically run. The amount of capacity consumed varies based the AI model, as well as the size and complexity of the data set.

### Which AI models are available for free in public preview and which are in paid GA status?

The release status for AI Builder features is available [here](https://go.microsoft.com/fwlink/?linkid=2102828).

AI models available in public preview do not require paid AI Builder capacity. A full list of all models can be found [here](/ai-builder/model-types#list-of-ai-model-types).

### Is a trial available for AI Builder?
Users without an existing Power Apps or Power Automate license can access AI Builder trial capacity for 30 days by signing up for either a Power Apps or Power Automate trial. Existing Power Apps and Power Automate users can access AI Builder trial capacity for 30-days by signing into the respective service and accessing AI Builder in the left navigation pane.  
