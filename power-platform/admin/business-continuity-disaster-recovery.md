---
title: Business continuity and disaster recovery
description: Microsoft provides business continuity and disaster recovery for production environments if there's a region-wide Azure outage. 
author: shpradha
ms.date: 07/02/2026
ms.reviewer: ellenwehrle
ms.topic: concept-article
ms.subservice: admin
ms.author: shpradha
ms.custom: NewPPAC
search.audienceType: 
 - admin
contributors:
 - shpradha
 - isaacwinoto
 - himakurada
 - jasunil
---

# Business continuity and disaster recovery

> [!NOTE]
> As of June 22, 2026, Self-Service Disaster Recovery (SSDR) is also available for Finance & Operations (F&O) applications. SSDR enables organizations to maintain an asynchronous secondary copy of their production environment in a paired Azure region and perform self-service failover, failback, and disaster recovery testing.

Businesses expect their applications and customer data to be protected and resilient during unavoidable outages and disruptions. It's important to document a business continuity plan that minimizes the effects of outages. To recover and resume operations, make sure the plan lists stakeholders, processes, and specific steps.

Microsoft provides business continuity and disaster recovery capabilities to all [production type environments](environments-overview.md) in Dynamics 365 and Power Platform software as a service (SaaS) applications. This article describes how Microsoft keeps your production data resilient during outages.

The diagram shows a typical architecture of a geography that serves one or more countries or regions. Power Platform admins only need to know the geography location, but within each geography, Microsoft deploys more infrastructure to provide scale and extra protection for your data.

:::image type="content" source="media/bcdr_architecture.png" alt-text="Screenshot of a typical architecture of a geography that serves a single or multiple countries/regions." lightbox="media/bcdr_architecture.png":::

A geography has at least one Azure region, which usually includes three [availability zones](/azure/reliability/availability-zones-overview?tabs=azure-cli) but never has fewer than two availability zones.

## Built-in disaster recovery in-region with Azure availability zones

Infrastructure components like network, power, or cooling can fail unexpectedly, for example, because of a lightning strike, and can affect one or more data centers. To ensure resilience, Microsoft deploys availability zones, so your environment is replicated across at least two distinct zones.

Microsoft automatically detects availability zone-level failures and switches to other availability zones in the region almost instantly to protect you from data loss while keeping downtime near zero in most cases. This in-region capability is for production environments that host business-critical application processes and data. To avoid disruption, don't deploy production processes and data in nonproduction types like sandbox, developer, or trial environments.

Availability zones provide built-in resilience for seamless disaster recovery without manual intervention. Zone-redundant data services replicate data across multiple zones, so a failure in one zone doesn't affect data availability. The recovery point objective is near zero, and the recovery time objective is less than five minutes. If one zone fails, traffic is automatically rerouted to the remaining zones with minimal service disruption.

## Backup of production environments

The transition to availability zones significantly improves backup and failover processes for Dynamics 365 and Power Platform workloads. These workloads typically require contacting customer support for manual intervention. Your data and services stay highly available within the primary region, with built-in real-time redundancy across multiple zones.

Key improvements include:

- **Always-on resilience**: Your environments automatically replicate across multiple availability zones, so you don't need separate geo-secondary backups.
- **Faster recovery**: Synchronous replication across zones enables failover within a region to happen almost instantly, minimizing disruptions and data loss.
- **Seamless experience**: Unlike traditional backups that require restoration, availability zones keep your environment continuously active.
- **Reduced support dependency**: Automated failover within the primary region means you don't need to contact Microsoft support for most disaster recovery scenarios.

A limited number of customers in certain regions are transitioning to the improved architecture. Whether the region transitioned or is transitioning, the service always keeps a backup of environment data in more than one data center.

Availability zones are far enough apart to reduce the chance of an outage affecting more than one zone, but close enough to maintain low-latency connections to other availability zones. Availability zones are typically separated by several kilometers and are usually within 100 kilometers.

Customers who need greater distance within a geography can use self-service disaster recovery to keep a copy in a secondary region. With this feature, customers control failover operations and run disaster recovery drills as described in the following section.

## Cross-region self-service disaster recovery

Most geographies have region pairs separated by at least 300 miles when possible, to help protect your data in large-scale disasters.
Self-service disaster recovery is a Power Platform infrastructure capability that lets you replicate your environment across long distances and start environment failover between regions yourself.
You usually have multiple environments of different types in your tenant. This capability is available only for production environments.

## Allow virtual network pairing for self-service disaster recovery in Dynamics 365

If you deploy your Dynamics 365 environment within a virtual network and plan to use self-service disaster recovery, you need to configure a **virtual network pair**. This pairing ensures that your primary and secondary environments can communicate securely during failover and failback operations. Without a virtual network pair, disaster recovery operations fail because network connectivity between regions can't be established.

For setup instructions, go to [Set up virtual network support for Power Platform](vnet-support-setup-configure.md).

## Turn on self-service disaster recovery

This action sets up resources and starts replicating data between the primary and secondary locations. The process can take up to 48 hours to finish. Admins get a notification when the process finishes.

Turning on disaster recovery in an environment doesn't affect the environment or its data.

To turn on disaster recovery, follow these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. The **Environments** page appears.
1. Select the production environment where you want to turn on self-service disaster recovery.
1. Select **Disaster Recovery** in the command bar at the top of the page. The **Disaster Recovery** pane appears.
1. Select the checkbox to turn on **Disaster Recovery**.
1. Select **Save**.
1. The environment briefly displays the **Edit details** page.
1. The **Environment details** page displays that the process of turning on the feature has started.

You might also want to turn on disaster recovery for other events, like:

- Disaster recovery drill
- Emergency response for a major regional outage

## Disaster recovery drills

Your company might document disaster recovery drills as a requirement in its internal business continuity plans. Some industries and companies are subject to government regulations that require audits on their business continuity and disaster recovery capabilities. In these cases, run a disaster recovery drill on an environment. A disaster recovery drill lets you do self-service disaster recovery without losing any data. The duration of the failover action can be slightly longer while all remaining data is replicated to the secondary region.

Run drills on a copy of a production environment, since this process involves downtime when failing over to remote region that can last for minutes. For example, you might want to copy a production environment to a sandbox environment and then change the type from sandbox to production.

## Emergency response failover

Choose this option during an emergency, when the primary region has an outage and you can't use environments or data. If you select this option, the environment fails and doesn't copy any more data except for data that's already replicated before the outage.

When you start an emergency response, you see the amount of data loss shown in time. Compare this data loss to your recovery point objective to check if it's acceptable before you continue. The environment stays in a Running state until disaster recovery finishes and normal operation resumes from the secondary region.

> [!NOTE]
> Database backups are **not replicated to secondary regions** for scenarios supported by self-service disaster recovery, unless you explicitly allow self-service disaster recovery. Without self-service disaster recovery, backups remain in the primary region only, which means cross-region failover can't be guaranteed. To ensure business continuity and compliance with your disaster recovery strategy, configure self-service disaster recovery for your environment. 

## Switch back to primary region

After you fix an outage or finish your drill, switch the environment back to its primary region. The environment can operate with limited resources in the paired region. You don't lose data during this action.

## Environment disaster recovery status

Admins check the current disaster recovery state and location of an environment in the **Environment details** page. Admins also select **Disaster Recovery** in the command bar to open the **Disaster Recovery** pane.

To check data replication latency at any time, select **Disaster Recovery**, and then select **Emergency response** as the disaster recovery reason. This action opens a confirmation dialog that shows the last replication time between regions for that environment. You can select **Cancel** if your only purpose is to check the potential loss of data if there's a failover operation. Remember, the last sync time always changes because data is replicated continuously.

## Recovery point and recovery time objectives with business continuity and disaster recovery

Power Platform and Dataverse are designed with high availability built into every region. Within a region, the platform targets approximately near zero RPO (recovery point objective) and a recovery time of under five minutes across availability zones and data centers within a region. For cross-region resiliency, Microsoft provides self-service disaster recovery, which gives customers full visibility and control over the failover process. In this model, typical replication lag is under 15 minutes (often under five minutes), and the platform is designed to complete failover within minutes once initiated. Dynamics 365 uses the same Azure SQL Database business continuity capabilities described in the [Business continuity in Azure SQL Database](/azure/azure-sql/database/business-continuity-high-availability-disaster-recover-hadr-overview) public documentation.

Because customers retain control of when and whether to trigger a cross-region failover, Microsoft doesn't publish a  cross-region RTO commitment. Customers can monitor real-time replication lag directly in the Power Platform admin center to inform their own recovery decisions. It's important to note that when Power Platform solutions connect to external systems&mdash;such as SQL Server, REST APIs, or other third-party services&mdash;the RPO of those integrations are governed by the availability and recovery capabilities of the respective target systems, and fall outside the scope of Power Platform's resiliency commitments. 

## Document your business continuity plan

Perform disaster recovery drills or an emergency response before a real disaster strikes, so you can document all steps required for any integration points that are external to Power Platform. Your company is then more prepared for recovery if there's a real disaster.

## Frequently asked questions (FAQs)

### Why use self-service disaster recovery?

Super storms, natural calamities, and unforeseen political uncertainties that can bring down an entire region are becoming more common. To minimize the impact of a disaster that brings down an entire region, maintain an asynchronous copy in a remote region. You might also want to maintain a copy in a remote region for compliance audits. 

Self-service disaster recovery gives you control to fail over to a secondary region with the push of a button and fail back with the push of a button when the primary region is restored to ensure business continuity. You can also simulate the primary region being down to run a real failover and fail back to the secondary region to test a real compliance drill. Run drills with a copy of the production environment to avoid any downtime.

### Why do I need self-service disaster recovery if I already have a secondary copy maintained in a remote, secondary region? 
For the public cloud, the system doesn't maintain secondary copies in a remote, secondary region unless you turn on self-service disaster recovery.

The system maintains at least two&mdash;and in some cases, three&mdash;synchronous copies of production environments within a region, at no extra cost to you. These copies are hosted in availability zones in physically separated data centers with independent power, cooling, and networking, in compliance with legislated data residency regulations.  

With the implementation of [availability zones](/azure/reliability/availability-zones-overview?tabs=azure-cli), these cross-region copies became redundant. Recovering from these copies was a complex and manual process that affected recovery times.   
 
### What are the costs associated with using self-service disaster recovery?

- You must select a [managed environment](managed-environment-licensing.md). This environment requires a premium license tier. 
- You pay for the prepaid storage consumed in the secondary region.
  
  For example, suppose you have 10 GB of capacity consumption in the primary location. When you turn on self-service disaster recovery, you create a copy of the data in the remote secondary region and this copy consumes another 10 GB. You can pay for this 10 GB in the secondary region through storage entitlements. If you exceed your available free storage or available entitlements, a pay-as-you-go plan actively starts billing.
  
### How does billing work for self-service disaster recovery?

A pay-as-you-go billing plan is no longer a mandatory requirement. The system checks for available free capacity in your tenant. All pooled Dataverse entitlements at the tenant-level count towards secondary storage enablement. Microsoft is evaluating various overage initiatives. Overage management is outside of self-service disaster recovery management scope.

### Can I switch regions during a regional outage?

If there's a regional outage, the system supports failover only to the designated secondary region as part of self-service disaster recovery. It doesn't support switching to any other arbitrary region.

### Is my region supported for self-service disaster recovery?

Self-service disaster recovery depends on Azure region pairs. Regions that don't have a regional Azure pair aren't supported. For more information, go to [Azure supported regions](/azure/reliability/regions-list). 

As of November 2025, Austria East, Belgium Central, Chile Central, Indonesia Central, Israel Central, Italy North, Malaysia West, Mexico Central, New Zealand North, and Poland Central are single regions and aren't supported for self-service disaster recovery. 

> [!Note]
> Brazil and South Africa don't have self-service disaster recovery because their regional pairs are in heavily constrained regions. Adding supported regions is influenced by impact, opportunity, and resource constraints. United Arab Emirates has self-service disaster recovery, but continues to be capacity-constrained, which impacts its general availability.

### What should I know about the capacity experience?

- When you allow self-service disaster recovery, you see more storage consumption displayed in the Dataverse capacity graph, clearly indicating the extra capacity used by the cross-region backup.
- When you don't allow self-service disaster recovery, the capacity graph shows standard usage without the extra storage for replication.
- When self-service disaster recovery is active, the capacity graph displays the extra consumption from cross-region replication, with a *Disaster recovery active* tag in the Dataverse capacity summary.

### How do I disable self-service disaster recovery?

To disable self-service disaster recovery, go to the *disaster recovery pane* in Power Platform admin center and uncheck the **Turn on disaster recovery** checkbox.

### What happens when I disable self-service disaster recovery?

Disabling self-service disaster recovery deletes all replicated environment data in the paired region. You're prompted to confirm the environment's name before proceeding.

### Can I disable self-service disaster recovery while in a paired region (in a failover state)?

No, you can't disable self-service disaster recovery while the environment is in a failover state. You must switch to the primary region first.

### Are Power Apps and Power Pages supported with self-service disaster recovery?

Yes, self-service disaster recovery supports Power Apps and Power Pages.

### Is Power Automate supported with self-service disaster recovery?

As of October 2025:
- Power Automate desktop flows and cloud flows support failover and failback with self-service disaster recovery but have known performance limitations.

  > [!NOTE]
  > Power Automate environments enabled for self-service disaster recovery run on isolated, runtime capacity. Most workloads shouldn't notice a difference, but high-volume, highly parallel, or latency-sensitive flows might take longer to start or have lower throughput. Validate business-critical workloads before enabling this feature.
  
- As Microsoft works on performance optimizations, you must [sign-up for this feature to opt-in](https://aka.ms/PowerAutomate-SSDR-Opt-in).

### How can I find out where my data is being replicated? Can I change my secondary destination region?

Microsoft reserves the right to disclose the exact details of where your data resides for security reasons. If your data needs to be moved or replicated, Microsoft considers various high availability and resiliency scenarios. You can be assured that your data at rest respects geographical boundaries and abides by legislated residency laws. Even if self-service disaster recovery isn't turned on, Microsoft reserves the right to replicate, move, and relocate the data within a region for high availability and operational needs. The location of customer data within a geography (for example, _APAC_) isn't disclosed and may change based on Azure capacity constraints.

### Is Field service supported for self-service disaster recovery?

Field service now supports self-service disaster recovery. You can now manage work orders, scheduling, inventory, and customer communications in one unified platform. In a disaster, fail over your automated service workflows, orders, inventory, and dispatching to a remote region for business continuity.

### Do I need to allow list IP addresses for the secondary region?
 
Yes. If you configure any firewall rules or allow lists based on the outbound IP addresses of your Finance and Operations environment, you must also include the IP ranges for the secondary (paired) Azure region.
 
During disaster recovery scenarios that require regional failover, outbound requests from the Application Object Server (AOS) can originate from the secondary region's IP ranges. Infrastructure hosting Microsoft-managed environments is registered under the `PowerPlatformPlex` Azure service tag. Ensure your allow lists include the `PowerPlatformPlex` ranges for both your primary and secondary regions.
 
For instructions on retrieving the current IP ranges, see [What are the outbound IP ranges for my Finance and Operations environment?](/dynamics365/fin-ops-core/dev-itpro/deployment/deploymentfaq#what-are-the-outbound-ip-ranges-for-my-finance-and-operations-environment).

### Can I enable SSDR on a sandbox environment in Dynamics 365 Finance & Operations?

No. Only live production environments support Self-Service Disaster Recovery (SSDR) for Dynamics 365 Finance & Operations at this time. All sandbox tiers&mdash;including Tier 2, Tier 3, Tier 4, and Tier 5&mdash;aren't eligible for SSDR enrolment. If your environment isn't eligible for SSDR, the disaster recovery option won't appear in the Power Platform Admin Center.

### Can I enable SSDR only for select applications on my environment (ex. Dynamics 365 Finance & Operations only)?
No. SSDR is turned on at the environment level and can't be configured for individual applications. SSDR creates and maintains a secondary copy for Dataverse, providing disaster recovery coverage for all supported Dynamics 365 Customer Engagement (CE) applications in the environment, such as Dynamics 365 Sales, Field Service, and Contact Center.

Dynamics 365 Finance & Operations (F&O) applications are linked with Microsoft Dataverse through the Power Platform integration. Hence, linked F&O applications are covered by SSDR. If your F&O application isn't linked to your environment, follow [this link](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration) to enable the integration.

### How can SSDR be enabled for Dynamics 365 Finance & Operations applications that aren't integrated with Power Platform?

Dynamics 365 Finance & Operations (F&O) applications must be integrated with Microsoft Dataverse through Power Platform integration to use SSDR. If your F&O application isn't linked to your environment, follow [this link](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration) to enable the integration.

### Are there any known limitations during a region-wide outage that self-service disaster recovery can't mitigate?

#### Business Events limitation

After a self-service disaster recovery failover to a secondary region or a Finance & Operations database refresh, existing Business Event endpoints stop delivering events to their configured endpoints (ex. webhooks, Azure Service Bus, or Event Grid). This stop occurs because the underlying Finance & Operations database change breaks the linkage between Finance & Operations and the corresponding Dataverse endpoint registrations. As a result, events continue to be generated but aren't dispatched until the endpoint configuration is revalidated.
To restore event delivery, you must recreate or reconfigure the affected Business Events endpoints:
- Delete existing endpoint definitions and recreate them with the same configuration
- Validate event delivery before resuming normal operations
For detailed steps, see [Manage Business Events endpoints](/dynamics365/fin-ops-core/dev-itpro/business-events/managing-business-event-endpoints).

#### Fabric link limitation

During a self-service disaster recovery (SSDR) failover, the Microsoft-managed data lake backing Fabric link doesn't currently fail over with the Dataverse environment. As a result, if the primary region becomes unavailable during a regional outage, Fabric link synchronization and access can be interrupted until the primary region becomes available again. Fabric link does not currently provide a service level objective (SLO) for recovery time objective (RTO) or recovery point objective (RPO) during SSDR failover scenarios. In some scenarios, certain configuration settings (such as feature enablement flags) might not be fully retained across failover, which can result in partial feature inconsistencies even though the underlying Fabric workspace remains available.
 
In long-running failover scenarios or extended operation in a secondary region, you might also encounter regional capacity constraints if you manually reconfigure the Fabric link. To restore Fabric link functionality or ensure a healthy operational state after failover, you need to:

- Remove affected tables from the Fabric link configuration.
- If the entire link is affected, unlink the Fabric connection from the environment.
- Recreate the Fabric link using the standard setup flow. Follow detailed steps, in [Create a link to Fabric](/power-apps/maker/data-platform/fabric-link-to-data-platform#create-a-link-to-fabric).
 
Microsoft is actively improving Fabric link failover support to ensure configuration settings are fully preserved across SSDR failover scenarios, eliminating the need for manual validation or reconfiguration.

#### Synapse link limitation
Self-service disaster recovery (SSDR) does not currently provide full support for Synapse Link configurations. In the event of a regional outage, Synapse Link is not automatically recovered as part of the SSDR process. To restore Synapse Link connectivity after a failover or recovery operation, we recommend manually unlinking and relinking your Synapse Link connection.

#### Environment servicing limitation
Servicing actions, such as code deployments for Dynamics 365 Finance and Operations environments can't be performed while the environment is operating from the secondary region. To apply code updates or run deployments, you must first switch back to the primary region.

#### Commerce Scale Units limitation
Commerce Scale Units (CSU) failover isn't currently supported as part of self-service disaster recovery (SSDR). During an SSDR failover event, CSU components aren't automatically failed over or replicated to the secondary region. If your environment relies on CSU and you experience an outage or a CSU resynchronisation is required following a failover, raise a support request and provide details of the impact so the support team can assist.

#### Long-Term Data Retention (LTDR) limitation
Long-term data retention (LTDR) data is preserved during self-service disaster recovery (SSDR) failover, as it's stored independently from the primary environment. However, archival processes might require validation or restart post-failover, and customers might observe a delay in newly archived data becoming available until workflows are re-established.

#### Other limitations

- Copilot Studio conversation runtime requests fail until Microsoft restores the service in the primary region. Custom agents successfully fail over and fail back since they're saved on Dataverse.
- In Dynamics 365, analytics and automation in sales observe latency impact. Relationship analytics KPIs aren't computed and new models for scoring aren't created during an outage.  
-  In Dynamics 365 Customer Insights - Data, real-time updates are impacted. It doesn't support self-service disaster recovery today.
-  In Dynamics 365 Customer service, basic scenarios that are 100% dependent on Dataverse, such as case creation, or Knowledge Base articles work. Case knowledge base access in customer service is unavailable.
- Dynamics 365 Project Operations features aren't yet supported.
- Data lake failover has known issues. Self-service disaster recovery isn't supported yet.
- Connectors might have recovery problems when dependent on external systems, like SharePoint, SQL server, or third-party applications.
- For Dynamics 365 Sales, analytics, reporting, and functions dependent on automation, such as sales forecasting, are unavailable.
- AI Builder might see latency impact.
