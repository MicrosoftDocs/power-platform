---
title: Business continuity and disaster recovery for Dynamics 365 SaaS apps
description: Microsoft provides business continuity and disaster recovery for production environments of Dynamics 365 SaaS applications if there's a regionwide Azure outage. 
author: ImadYanni 
ms.date: 03/13/2025
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: iyanni
ms.custom: NewPPAC
search.audienceType: 
 - admin
contributors:
- jasunil
---

# Business continuity and disaster recovery

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Businesses expect their applications and customer data to be protected and resilient during unavoidable outages and disruptions. It's important to have a documented business continuity plan that aims to minimize the effects of outages. Be sure the plan includes stakeholders, processes, and specific steps to be taken to recover and resume operations.

Microsoft provides business continuity and disaster recovery (BCDR) capabilities to all [production type environments](environments-overview.md) in Dynamics 365 and Power Platform software as a service (SAAS) applications. This article describes details and practices Microsoft takes to ensure your production data is resilient during outages.

The following diagram shows a typical architecture of a geography that serves a single or multiple countries/regions. Although the geography location is all your Power Platform administrators need to be concerned with, within the geography, Microsoft deploys more infrastructure to provide scale and added protection for your data.

:::image type="content" source="media/bcdr_architecture.png" alt-text="The diagram shows a typical architecture of a geography that serves a single or multiple countries/regions." lightbox="media/bcdr_architecture.png":::

A geography includes at least one Azure region that is typically made up of three [availability zones](/azure/reliability/availability-zones-overview?tabs=azure-cli), but no less than two availability zones. 

## Built-in disaster recovery in-region with Azure availability zones

Microsoft recognizes that infrastructure components such as network, power, or cooling can fail unexpectedly, for example, due to a lightning strike. This could affect one or more datacenters. To ensure resilience, we architected and deployed availability zones, where your environments are replicated across at least two distinct zones.

Microsoft automatically detects availability zone-level failures and switches to other availability zones in the region almost instantly. This protects you from data loss, and usually, the downtime is near zero. This in-region capability is available for production-type environments which are expected to host business-critical application processes and data. Ensure that you protect yourself against disruption by making sure your production processes and data aren't deployed in non-production types such as sandbox, developer, or trial environment types.

To ensure seamless disaster recovery, availability zones provide built-in resilience without requiring manual intervention. Zone-redundant data services replicate the data across multiple zones so that a failure in one zone doesn't affect the availability of the data. The recovery point objective is near zero and the rapid recovery, or recovery time objective, is less than five minutes. If one zone experiences a failure, traffic is automatically rerouted to the remaining zones with minimal service disruption.

## Backup of production environments

The transition to availability zones represents a significant improvement over the earlier backup and failover process for Dynamics 365 and Power Platform workloads. Those workloads typically required contacting customer support for manual intervention. Your data and services remain highly available within the primary region, with built-in, real-time redundancy across multiple zones.

Key improvements include:

- **Always-on resilience**: Your environments are now automatically replicated across multiple availability zones, eliminating the need for separate geo-secondary backups.
- **Faster recovery**: With synchronous replication across zones, failover within a region is almost instantaneous, minimizing disruptions and minimal data loss.
- **Seamless experience**: Unlike traditional backups, which require restoration, availability zones keep your environment continuously active.
- **Reduced support dependency**: Automated failover within the primary region eliminates the need to contact Microsoft support for most disaster recovery scenarios.

A limited number of customers in certain regions are in the process of transitioning to the improved architecture. Whether the region has transitioned or is in the process, the service always keeps a backup of environment data in more than one data center.

Availability zones are far enough apart to reduce the likelihood of an outage affecting more than one zone, but close enough to have low-latency connections to other availability zones. Availability zones are typically separated by several kilometers, and usually are within 100 kilometers. 

Customers that require greater distance within a geography can choose to use self-service disaster recovery to maintain a copy in a secondary region. With this feature, customers can control failover operations and perform disaster recovery drills as described in the following section.

## Cross-region self-service disaster recovery

Most geographies are typically made up of region pairs with a minimum distance of 300 miles whenever possible, to protect your data in large-scope disasters. 

Self-service disaster recovery is a Power Platform infrastructure capability that allows customers to replicate their environment across far distances and initiate environment failover between regions in a self-serve manner.

Customers typically have multiple environments of different types created in their tenant. This capability is available specifically for production-type, [Managed Environments](managed-environment-overview.md) and can be turned on for each environment. Currently, this capability isn't available for finance and operations production environments.

## Self-service disaster recovery cost and billing

Environments that activate disaster recovery replicate all environment data between two regions and can fail over between the regions. Replicated data of different storage types, such as Database, Log, and File are added to Dataverse capacity consumed and billed at the same rate as the primary storage.

To use self-serve disaster recovery for an environment, the environment must first be linked to a [pay-as-you-go billing plan](pay-as-you-go-overview.md).

If your environment already uses a pay-as-you-go billing plan, then no further action is needed and replicated capacity is billed to your Azure subscription.

If your environment is configured to draw capacity from your tenant's Dataverse capacity entitlement, then entitled capacity is consumed first, A pay-as-you-go billing plan is still required so you can avoid capacity overages. Learn how to allocate capacity and manage capacity overages through pay-as-you-go billing plans. Learn more in [View usage and billing information](/power-platform/admin/pay-as-you-go-usage-costs).

## Turn on self-service disaster recovery

After you set up billing as outlined above, you can turn on self-service disaster recovery for an environment. This is a one-time action that provisions resources and starts the process of replicating data between the primary location and secondary location. This may take up to 48 hours to complete. Admins receive a notification when the process is complete.

Turning on disaster recovery in an environment has no impact on the environment or the data within it.

To turn on disaster recovery, complete the following steps.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Manage**.
1. In the Manage pane, select **Environments**. The Environments page is displayed.
1. Select the production-type environment where you want to turn on self-service disaster recovery.
1. Select **Disaster Recovery** in the command bar at the top of the page. The **Disaster Recovery** pane appears.
1.    Select the checkbox to turn on **Disaster Recovery**.
1.    Select **Save**.
1.    The environment is placed in the **Edit details** page briefly.
1.    The **Environment details** page appears, indicating that the process of turning on the feature has started.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Environments**.
1. Select the production-type environment where you want to turn on self-service disaster recovery.
1. Select **Disaster Recovery** in the command bar at the top of the page. The **Disaster Recovery** pane appears.
1.    Select the checkbox to turn on **Disaster Recovery**.
1.    Select **Save**.
1.    The environment is placed in the **Edit details** page briefly.
1.    The **Environment details** page appears, indicating that the process of turning on the feature has started.

---

These two events may require you to use this feature:

- Disaster recovery drill.
- Emergency response in the event of a major regional outage.

## Disaster recovery drills

Your company may have disaster recovery drills documented as a requirement in your internal business continuity plans. Some industries and companies may be required by government regulations to perform audits on their BCDR capabilities. In these cases, you may run a disaster recovery drill on an environment. A disaster recovery drill allows you to perform self-service disaster recovery without losing any data. The duration of the failover action may be slightly longer while all remaining data is being replicated to the secondary region.

We recommend performing drills on a copy of a production environment, since this involves downtime that can last for minutes. For example, you may want to copy a production environment to a sandbox-type environment and then change the type from sandbox to production.

## Emergency response failover

You would choose this option during an emergency, that is, when the primary region has sustained an outage and access to environments or data isn't possible. If you choose this option, the environment fails without copying any more data other than the data that has been replicated before the outage occurred.

When you perform an emergency response, you see the amount of data loss represented in time, which you can compare to your recovery point objective (RPO) if you determine that it's acceptable and you choose to continue. The environment operates in a Running state until the disaster recovery is complete, and the environment is back to normal operation from the secondary region.

## Switching back to primary region

After you complete your drill or after an outage has been mitigated, we recommend that you switch back the environment to its primary region. An environment may be operating with limited resources in the paired region. There's no loss of data during this operation.

## Environment disaster recovery status

Admins can determine the current disaster recovery state and location of an environment in the **Environment details** page. Admins can also select **Disaster Recovery** in the command bar to open the **Disaster Recovery** pane.

To check data replication latency at any time, you can select **Disaster Recovery** and then select **Emergency response** as the disaster recovery reason. This opens a confirmation dialog that includes the last replication time between regions for that environment. You may select **Cancel** if your only purpose was to check the potential loss of data if there was a failover operation. Keep in mind that the last sync time is always different at different times, since data is being replicated continuously.

## Document your business continuity plan

We recommend that you perform disaster recovery drills or an emergency response before a real disaster strikes, so you can document all steps required for any integration points that are external to Power Platform. Your company is then more prepared for recovery if there's a real disaster.

## Frequently Asked Questions

### What are the costs associated with enabling Self-Service Disaster Recovery
 - Capacity charges will be based on the consumption of the environment's paired region for Database, File, and Log storage types. These costs will be billed at the same rate as the customer's primary storage cost.
 - Capacity consumption will be reflected in the familiar licensing experience within the Power Platform Admin Center (PPAC).
 
###    How does billing work for Self-Service Disaster Recovery?
  - To prevent overages or unexpected impacts (such as the creation of new environments), self-service DR requires that the environment be linked to a pay-as-you-go (PAYG) billing plan.
  - If your environment is configured to draw capacity from your tenant's Dataverse capacity entitlement, then entitled capacity is consumed first, A pay-as-you-go billing plan is still required so you can avoid capacity overages.
  - Admins can allocate capacity to the environment, after which the PAYG plan will be billed.
  - Customers cannot turn off the PAYG plan in the billing experience if self-service DR is turned on. To disable self-service DR, the environment's replication will be deleted first.

### Can I switch regions during a regional outage?
   In the case of a regional outage, the system supports failover to the designated secondary region as part of self-service disaster recovery, but it does not allow switching to any other arbitrary regions.
      
### What should I know about the capacity experience?
   - When self-service DR is enabled, you'll notice that additional storage consumption will be displayed in the Dataverse capacity graph, clearly indicating the extra capacity used by the cross-region backup.
   - When  self-service DR is not enabled, the capacity graph shows standard usage without the additional storage for replication.
   - When the self-service DR is active, the capacity graph will display the extra consumption from cross-region replication, with a "Disaster recovery active" tag in the Dataverse capacity summary.

### How do I disable self-service DR?
   To disable self-service DR, go to the Disaster Recovery pane and select the option to disable it.

### What happens when I disable self-service DR?
   Disabling self-service DR will delete all replicated environment data in the paired region. You'll be prompted to confirm the environment's name before proceeding.

### Can I disable self-service DR while in a secondary region?
   No, self-service DR cannot be disabled while the environment is in a secondary region. You must switch to the primary region first.
      
### Are there any known limitations during a region-wide outage that self-service disaster recovery cannot mitigate?
   In the rare event of a region-wide outage, the following scenarios may experience temporary degradation, depending on the severity of the outage.
   - Power Automate flows impacted by the regional outage will not recover through self-service DR and will remain unavailable until the primary region is restored.
   - Copilot Studio conversation requests can fail until Microsoft restores the service in the primary region.
   - In Dynamics 365, analytics and automation in Sales, real-time updates in Customer Insights, and case or knowledge base access in Customer Service may be unavailable.
   - Under field service, Resource Scheduling Optimization (RSO), will be impacted during a regional outage. For AI workloads, training and predictive analytics can fail in the secondary region.
   - Connectors can have recovery issues, when dependent on external systems like SharePoint or SQL.D365 Sales: Analytics, reporting, and functions dependent on automation (such as sales forecasting) will be unavailable.
   - Finance and Operations (FNO) products are not currently supported for self-serve disaster recovery during regional outages.
































































