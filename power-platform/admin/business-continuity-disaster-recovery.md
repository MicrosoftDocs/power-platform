---
title: Business continuity and disaster recovery for Dynamics 365 SaaS apps
description: Microsoft provides business continuity and disaster recovery for Dynamics 365 SaaS applications' production environments if there's a region-wide Azure outage. 
author: rashmansur
ms.date: 10/15/2025
ms.reviewer: sericks
ms.topic: concept-article
ms.subservice: admin
ms.author: rashmim 
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
> As of September 3, 2025, the self-service disaster recovery feature has been expanded to include failover support for [Dynamics 365 Contact Center](/dynamics365/contact-center/). With this enhancement, organizations can now seamlessly initiate failover for their contact center environments, ensuring smooth execution of disaster recovery drills or continued operations from an alternate region, when needed.

Businesses expect their applications and customer data to be protected and resilient during unavoidable outages and disruptions. It's important to document a business continuity plan that minimizes the effects of outages. To recover and resume operations, make sure the plan lists stakeholders, processes, and specific steps.

Microsoft provides business continuity and disaster recovery capabilities to all [production type environments](environments-overview.md) in Dynamics 365 and Power Platform software as a service (SaaS) applications. This article describes how Microsoft keeps your production data resilient during outages.

The diagram shows a typical architecture of a geography that serves one or more countries or regions. Power Platform admins only need to know the geography location, but within each geography, Microsoft deploys more infrastructure to provide scale and extra protection for your data.

:::image type="content" source="media/bcdr_architecture.png" alt-text="The diagram shows a typical architecture of a geography that serves a single or multiple countries/regions." lightbox="media/bcdr_architecture.png":::

A geography has at least one Azure region, which usually includes three [availability zones](/azure/reliability/availability-zones-overview?tabs=azure-cli) but never fewer than two availability zones.

## Built-in disaster recovery in-region with Azure availability zones

Infrastructure components like network, power, or cooling can fail unexpectedly, for example, because of a lightning strike, and can affect one or more data centers. To ensure resilience, Microsoft deploys availability zones, so your environment is replicated across at least two distinct zones.

Microsoft automatically detects availability zone-level failures and switches to other availability zones in the region almost instantly to protect you from data loss while keeping downtime near zero in most cases. This in-region capability is for production environments that host business-critical application processes and data. To avoid disruption, don't deploy production processes and data in non-production types like sandbox, developer, or trial environments.

Availability zones provide built-in resilience for seamless disaster recovery without manual intervention. Zone-redundant data services replicate data across multiple zones, so a failure in one zone doesn't affect data availability. The recovery point objective is near zero, and the recovery time objective is less than five minutes. If one zone fails, traffic is automatically rerouted to the remaining zones with minimal service disruption.

## Backup of production environments

The transition to availability zones significantly improves the earlier backup and failover process for Dynamics 365 and Power Platform workloads. These workloads typically require contacting customer support for manual intervention. Your data and services stay highly available within the primary region, with built-in, real-time redundancy across multiple zones.

Key improvements include:

- **Always-on resilience**: Your environments automatically replicate across multiple availability zones, so you don't need separate geo-secondary backups.
- **Faster recovery**: Synchronous replication across zones lets failover within a region happen almost instantly, minimizing disruptions and data loss.
- **Seamless experience**: Unlike traditional backups that require restoration, availability zones keep your environment continuously active.
- **Reduced support dependency**: Automated failover within the primary region means you don't need to contact Microsoft support for most disaster recovery scenarios.

A limited number of customers in certain regions transition to the improved architecture. Whether the region transitioned or transitions, the service always keeps a backup of environment data in more than one data center.

Availability zones are far enough apart to reduce the chance of an outage affecting more than one zone but close enough to keep low-latency connections to other availability zones. Availability zones are typically separated by several kilometers, and are usually within 100 kilometers.

Customers who need greater distance within a geography can use self-service disaster recovery to keep a copy in a secondary region. With this feature, customers control failover operations and run disaster recovery drills as described in the following section.

## Cross-region self-service disaster recovery

Most geographies usually have region pairs separated by at least 300 miles when possible, to help protect your data in large-scale disasters.

Self-service disaster recovery is a Power Platform infrastructure capability that lets you replicate your environment across long distances and start environment failover between regions on your own.

You usually have multiple environments of different types in your tenant. This capability is available only for production environments.

To turn on self-service disaster recovery, make sure your environment is managed and linked to a [pay-as-you-go billing plan](pay-as-you-go-overview.md). For more information about managed environments, go to [Managed Environments](managed-environment-overview.md).

## Allow Virtual Network pairing for self-service disaster recovery in Dynamics 365 

If your Dynamics 365 environment is deployed within a Virtual Network and you plan to use self-service disaster recovery, you must configure a **Virtual Network pair**. This pairing ensures that your primary and secondary environments can communicate securely during failover and failback operations. Without a Virtual Network pair, disaster recovery operations fail because network connectivity between regions can't be established.

For setup instructions, go to [Set up virtual network support for Power Platform](vnet-support-setup-configure.md).

## Turn on self-service disaster recovery

This action sets up resources and starts replicating data between the primary and secondary locations. The process can take up to 48 hours to finish. Admins get a notification when the process is done.

Turning on disaster recovery in an environment doesn't affect the environment or its data.

To turn on disaster recovery, follow these steps.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Manage**.
1. In the Manage pane, select **Environments**. The Environments page shows.
1. Select the production environment where you want to turn on self-service disaster recovery.
1. Select **Disaster Recovery** in the command bar at the top of the page. The **Disaster Recovery** pane appears.
1. Select the checkbox to turn on **Disaster Recovery**.
1. Select **Save**.
1. The environment briefly shows the **Edit details** page.
1. The **Environment details** page shows that the process of turning on the feature has started.


# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Environments**.
1. Select the production environment where you want to turn on self-service disaster recovery.
1. Select **Disaster Recovery** in the command bar at the top of the page. The **Disaster Recovery** pane appears.
1. Select the checkbox to turn on **Disaster Recovery**.
1. Select **Save**.
1. The environment briefly shows the **Edit details** page.
1. The **Environment details** page shows that the process of turning on the feature has started.


---

You might also want to turn on disaster recovery for other events, like:

- Disaster recovery drill
- Emergency response for a major regional outage

## Disaster recovery drills

Your company might have disaster recovery drills documented as a requirement in your internal business continuity plans. Some industries and companies might be required by government regulations to perform audits on their business continuity disaster recovery capabilities. In these cases, you can run a disaster recovery drill on an environment. A disaster recovery drill lets you do self-service disaster recovery without losing any data. The duration of the failover action can be slightly longer while all remaining data is replicated to the secondary region.

We recommend doing drills on a copy of a production environment, since this involves downtime when failing over to remote region that can last for minutes. For example, you might want to copy a production environment to a sandbox environment and then change the type from sandbox to production.

## Emergency response failover

Choose this option during an emergency, when the primary region has an outage and you can't use environments or data. If you select this option, the environment fails and doesn't copy any more data except what's already replicated before the outage.

When you start an emergency response, you see the amount of data loss shown in time. Compare this to your recovery point objective to check if it's acceptable before you continue. The environment stays in a Running state until disaster recovery finishes and normal operation resumes from the secondary region.

> [!NOTE]
> Database backups are **not replicated to secondary regions** for scenarios supported by self-service disaster recovery, unless the customer has explicitly allowed self-service disaster recovery. Without self-service disaster recovery, backups remain in the primary region only, which means cross-region failover can't be guaranteed. To ensure business continuity and compliance with your disaster recovery strategy, configure self-service disaster recovery for your environment. 

## Switch back to primary region

After you fix an outage or finish your drill, switch the environment back to its primary region. The environment can operate with limited resources in the paired region. You don't lose data during this action.

## Environment disaster recovery status

Admins check the current disaster recovery state and location of an environment in the **Environment details** page. Admins also select **Disaster Recovery** in the command bar to open the **Disaster Recovery** pane.

To check data replication latency at any time, select **Disaster Recovery**, and then select **Emergency response** as the disaster recovery reason. This action opens a confirmation dialog that shows the last replication time between regions for that environment. You can select **Cancel** if your only purpose is to check the potential loss of data if there's a failover operation. Remember, the last sync time always changes because data is replicated continuously.

## Document your business continuity plan

We recommend that you perform disaster recovery drills or an emergency response before a real disaster strikes, so you can document all steps required for any integration points that are external to Power Platform. Your company is then more prepared for recovery if there's a real disaster.

## Frequently asked questions (FAQs)

### Why do I need self-service disaster recovery if I already have a secondary copy maintained in a remote, secondary region? 
There are no secondary copies being maintained in a remote, secondary region if self-service disaster recovery hasn't been turned on.

Super storms, natural calamities, and unforseen political uncertainities that have the potential to bring an entire region down are becoming more common. To minimize the impact of a disaster that brings an entire region down, it's advisable to maintain an asyncronous copy in a remote region. Self-service disaster recovery gives you control to failover to a secondary region with the push of a button and failback with the push of a button when the primary region is restored to ensure business continuity. You can also simulate the primary region being down to run a real failover and failback to the secondary region to test a real compliance drill. We advise running drills with a copy of the production environment to avoid any downtime.

### What are the costs associated with using self-service disaster recovery?

- [Pay-as-you-go](pay-as-you-go-overview.md)  must be turned on for the environment as a pre-requisite to turning on self-service disaster recovery on that environment.
- The select environment must be a [Managed Environment](managed-environment-licensing.md). This is a premium license tier. 
- Capacity charges are based on the storage consumption of the environment's paired secondary region for database, file, and log storage types.
- Capacity consumption is reflected in the familiar licensing experience within the Power Platform admin center. Learn more in [View usage and billing information](/power-platform/admin/pay-as-you-go-usage-costs).

  For example, suppose a user has 10 GB capacity consumption in the primary location. When self-service disaster recovery is turned on, a copy of data is created in the remote secondary region and this consumes another 10 GB. This 10 GB in the secondary region can be paid through storage entitlements. Only if you exceed your available free storage or available entitlements, would PayGo plan actively start billing.
  
- Pay-as-you-go is designed to generate various alerts and warning at various thresholds to warn administrators of depleting storage. Use the alert mechanism to your advantage.
- Pay-as-you-go links the selected environment to the Azure subscription using a billing policy. Once an environment is linked to an Azure subscription, the usage of apps and any Dataverse or Power Platform usage that goes above the included storage amounts are billed against the Azure subscription using Azure meters. Learn more at [Pay-as-you-go meters](pay-as-you-go-meters.md). If more storage entitlements are acquired, PayGo will stop running the meters and consuming from available free storage and entitlements will take precedence. 

### How does billing work for self-service disaster recovery?

- If your environment is configured to draw capacity from your tenant's Dataverse capacity entitlement, then entitled capacity is consumed first and a pay-as-you-go billing plan is still required so you can avoid capacity overages.
- PayGo generates multiple warnings at various thresholds to ensure that the customer is well-informed and takes appropriate action to avoid PayGo charges.  
- Admins can allocate capacity to the environment, after which the pay-as-you-go plan will be billed.
- Customers can't turn off the pay-as-you-go plan in the billing experience if self-service disaster recovery is turned on.

### Can I switch regions during a regional outage?

If there's a regional outage, the system supports failover to the designated secondary region as part of self-service disaster recovery. However, it doesn't allow switching to any other arbitrary regions.

### What should I know about the capacity experience?

- When you allow self-service disaster recovery, you notice that more storage consumption is displayed in the Dataverse capacity graph, clearly indicating the extra capacity used by the cross-region backup.
- When you don't allow self-service disaster recovery, the capacity graph shows standard usage without the extra storage for replication.
- When the self-service disaster recovery is active, the capacity graph displays the extra consumption from cross-region replication, with a *Disaster recovery active* tag in the Dataverse capacity summary.

### How do I disable self-service disaster recovery?

To disable self-service disaster recovery, go to the *disaster recovery pane* in Power platform admin center and uncheck the **Turn on disaster recovery** checkbox.

### What happens when I disable self-service disaster recovery?

Disabling self-service disaster recovery deletes all replicated environment data in the paired region. You're prompted to confirm the environment's name before proceeding.

### Can I disable self-service disaster recovery while in a paired region (in a failed over state)?

No, self-service disaster recovery can't be disabled while the environment is in a failed over state. You must switch to the primary region first.

### Are Power Apps and Power Pages supported with self-service disaster recovery?

Yes, self-service disaster recovery is supported for Power Apps and Power Pages.

### Is Power Automate supported with self-service disaster recovery?
As of October 2025:
- Power Automate desktop flows are fully supported for failover and failback with self-service disaster recovery.
- Power Automate cloud flows are now available in preview. Don't use features in preview with production workloads.

### How can I find out where my data is being replicated to? Can I change my secondary destination region?

Microsoft reserves the rights to disclose the exact details of where the customer's data is residing for security and if it may need to be moved or replicated for various, high availability and resiliency scenarios. Customers can be assured that their data at rest respects geographical boundaries and abides by legislated residency laws. Even if self-service disaster recovery isn't turned on, Microsoft reserves the right to replicate, move, and relocate the data within a region for high availability and operational needs. The location of customer data within a geography (for example, _APAC_) isn't disclosed and may change based on Azure capacity constraints.

### Are there any known limitations during a region-wide outage that self-service disaster recovery can't mitigate?

- Copilot Studio conversation runtime requests fail until Microsoft restores the service in the primary region. Custom agents successfully failover and failback since they're saved on Dataverse.
- In Dynamics 365, analytics and automation in sales observe latency impact. Relationship analytics KPIs aren't computed and new models for scoring aren't created during an outage.  
-  In Dynamics 365 Customer Insights - Data, real-time updates are impacted. It doesn't support self-service disaster recovery today.
-  In Dynamics 365 Customer service, basic scenarios that are 100% dependent on Dataverse, such as case creation, or Knowledge Base articles work. Case knowledge base access in customer service is unavailable.
- Field Service is self-service disaster recovery ready.
- Data lake failover has known issues. Self-service disaster recovery isn't supported yet.
- Connectors may have recovery issues when dependent on external systems, like SharePoint, SQL Server or third-party applications.
- For Dynamics 365 Sales, analytics, reporting, and functions dependent on automation, such as sales forecasting, are unavailable.
- Finance and operations products aren't currently supported for self-serve disaster recovery during regional outages.
- AI Builder may see latency impact.
