---
title: Business continuity and disaster recovery
description: Microsoft provides business continuity and disaster recovery for production instances of Dynamics 365 SaaS applications, in the event of an Azure region wide outage. 
author: MicroSri
ms.date: 07/15/2021
ms.reviewer: sericks
ms.service: "power-platform"
ms.topic: conceptual
ms.subservice: admin
ms.author: sriknair
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Business continuity and disaster recovery

Microsoft provides business continuity and disaster recovery for production instances of Dynamics 365 software-as-a-service (SaaS) applications, in the event of an Azure region wide outage. Customer engagement apps like  Dynamics 365 Sales, Customer Service, Field Service, Marketing and  Project Service Automation run on the Dataverse platform. Tenant admins can deploy a production instance of a Dynamics 365 customer engagement app and/or Dataverse with the purchase of appropriate licenses. For more information, see [Create and manage environments in the Power Platform admin center](create-environment.md).

For production environments, a replica of the different storage services (Azure SQL and file storage) is established in the secondary region for each environment at the time of deployment. For more information, see [Environments](environments-overview.md). These replicas are referred to as geo-secondary replicas. The geo-secondary replicas are kept synchronized with the primary instance through continuous data replication. There is a small replication latency or lag, typically less than a few minutes, between the primary data sources and their corresponding geo-secondary replicas. For more information, see [Ensure business continuity amd disaster recovery (BCDR): Azure Paired Regions](/azure/best-practices-availability-paired-regions).

:::image type="content" source="media/dataverse-customer-engagement-apps.png" alt-text="For production environments, a replica of the different storage services (Azure SQL and File storage) is established in the secondary region for each environment.":::

As seen in the preceding diagram, similar to data storage services, compute infrastructure is also provisioned in both regions in such a way that it can handle the traffic volume in case of an environment or region-level failover. See the following sections on the different types of failovers that are possible and how Microsoft manages service continuity in either of these situations.

To learn more about data protection in non-production environments, see [Back up and restore environments](backup-restore-environments.md).

## Unplanned failover
Dataverse is built for high availability and reliability, which ensures that in the event of underlying Azure platform issues, the platform automatically leverages resources in other zones within the same regions to ensure availability isn’t impacted. For more information about Azure availability zones, see [Regions and Availability Zones in Azure](/azure/availability-zones/az-overview).

In the event of an unanticipated region wide outage, such as a natural disaster which affects the entire Azure region, and Microsoft determines that the region will not become available within a reasonable amount of time, Microsoft will notify customers and switch over the traffic to route to the secondary instances. In this case, it possible that customers may experience a data loss of up to 15 minutes, depending on the nature and timing of the outage. 

## Planned failover
In the event that Microsoft determines there is a risk to the availability of the primary Azure region, for example if there is an impending hurricane, Microsoft will notify customers and switch over the traffic to route to the secondary replica instances. Users connected to customer engagement and Dataverse apps at the time of the failover will experience a brief disruption. There will be no data loss as both Azure regions are online and data is replicated fast enough on the secondary replica.

> [!IMPORTANT]
> During the time the environment is operating out of the secondary region, there may be service degradation of non-production instances. It is possible that deployments of new non-production environments will also be affected.

## Failback
Microsoft will notify customers and switch back the environments to operate out of the primary region, when it determines the primary region is back online and is fully operational. Users connected to the systems will experience a brief interruption of up to one minute. The service is fully restored including all non-production instances. There is no data loss.

Dataverse for Teams environments do not support secondary replicas and hence this feature of providing business continuity is not available until such Dataverse for Teams environments are converted to Dataverse production instances using the upgrade process described in [Upgrade process](about-teams-environment.md#upgrade-process).

For more information about Dataverse for Teams environments, see [About the Microsoft Dataverse for Teams environment](about-teams-environment.md).

### See also
[Finance and Operations application documentation](https://docs.microsoft.com/dynamics365/fin-ops-core/fin-ops/)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
