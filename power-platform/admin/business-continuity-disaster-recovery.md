---
title: Business continuity and disaster recovery for Dynamics 365 SaaS apps
description: Microsoft provides business continuity and disaster recovery for production environments of Dynamics 365 SaaS applications if there's an Azure region-wide outage. 
author: MicroSri
ms.date: 09/23/2022
ms.reviewer: jimholtz
contributors: 
 - sericks 
ms.topic: conceptual
ms.subservice: admin
ms.author: sriknair
search.audienceType: 
 - admin
---

# Business continuity and disaster recovery

Microsoft provides disaster recovery for production environments of Dynamics 365 software as a service (SaaS) applications for business continuity if there's an Azure region-wide outage. Tenant admins can [deploy a production environment](create-environment.md) of a customer engagement app or Dataverse with appropriate licenses.

## Geo-secondary replicas back up production environments

Microsoft creates a replica of Azure SQL storage and file storage in the secondary region for each [production environment](environments-overview.md) at deployment. These replicas are referred to as [geo-secondary replicas](/azure/best-practices-availability-paired-regions).

Geo-secondary replicas are kept synchronized with the primary environment through continuous data replication. There's a small lag between the primary data sources and their geo-secondary replicas. Typically, the latency is less than a few minutes. More information: [Ensure business continuity and disaster recovery (BCDR): Azure Paired Regions](/azure/best-practices-availability-paired-regions).

:::image type="content" source="media/dataverse-customer-engagement-apps.png" alt-text="Diagram illustrating a geo-secondary replica of data storage and compute infrastructure.":::

To learn more about data protection in non-production environments, see [Back up and restore environments](backup-restore-environments.md).

## Failover types and service continuity

Customer engagement apps adhere to the Microsoft business continuity and disaster recovery (BCDR) standard. The standard requires each online service to have a BCDR plan reviewed, updated, and tested at least annually. The Microsoft Cloud Business Continuity and Disaster Recovery Plan Validation Report is available to customers on [Service Trust Portal](https://aka.ms/stp).

As seen in the preceding diagram, Microsoft provisions compute infrastructure so that it can handle the traffic volume if there's an environment or region-level failover, similar to data storage. 

If an outage is caused by faulty hardware or a network interruption, we don’t perform region failover to the secondary region environments to avoid potential data loss.

In the event of an unanticipated region-wide outage, such as a natural disaster that affects the entire Azure region, and Microsoft has determined that the region won't become available within a reasonable amount of time, Microsoft will notify customers and switch over the traffic to route to the secondary environments. In this case, it's possible that customers might experience a data loss of up to 15 minutes, depending on the nature and timing of the outage. Recovery Point Objective (RPO) is small and could take up to a few seconds or couple of minutes.  

Recovery Time Objective (RTO) varies depending on the nature of the outage, and could take up to 4 to 10 hours.

When Microsoft determines that the primary region is back online and is fully operational, we switch the environments back. Users who are connected to affected systems could experience a brief interruption of up to one minute. The service, including all non-production environments, is fully restored. There's no data loss during the planned failback process.

## Exception for Dataverse for Teams

[Dataverse for Teams environments](about-teams-environment.md) doesn't support secondary replicas. Dataverse for Teams environments [must be converted to Dataverse production environments](about-teams-environment.md#upgrade-process) to take advantage of geo-secondary replicas for business continuity.

## Responsibilities for disaster recovery

| Microsoft's responsibilities | Customer's responsibilities |
| --- | --- |
| Microsoft [provisions a secondary environment in the Azure-paired datacenters](/azure/availability-zones/cross-region-replication-azure) at the time the primary production environment is deployed. | None |
| Microsoft enables geo redundancy of SQL and Azure storage at the time the primary production environment is deployed. | None  |
| In an outage, Microsoft determines whether [to execute a failover](https://azure.microsoft.com/blog/azure-sql-database-geo-restore/) and if there will be a data loss. Data loss can be up to 5 seconds.<br>If there's a data loss, Microsoft sends a request to the customer asking for permission. | The customer must provide written permission to trigger the failover there's a data loss. |
| Microsoft fails back to the production environment in the primary Azure region when the datacenter becomes operational. Normal operations resume and we notify customers. Customers could experience brief interruptions or disconnects during this window, but won't need to take a full downtime. | None |

### See also

[Business continuity and disaster recovery](/dynamics365/fin-ops-core/dev-itpro/sysadmin/business-continuity-disaster-recovery)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
