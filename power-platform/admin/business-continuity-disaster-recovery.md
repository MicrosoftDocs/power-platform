---
title: Business continuity, disaster recovery for Dynamics 365 SaaS apps
description: Microsoft provides business continuity and disaster recovery for production instances of Dynamics 365 SaaS applications, in the event of an Azure region-wide outage. 
author: MicroSri
ms.date: 07/19/2021
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
<!--note from editor: The title needs to be different from the H1. Not sure my edit is the best take.-->
# Business continuity and disaster recovery

Microsoft provides business continuity and disaster recovery for production instances of Dynamics 365 software as a service (SaaS) applications, to provide continuity<!--note from editor: We need a phrase like this here to avoid the misplaced modifier situation. --> in the event of an Azure region&ndash;wide outage. Customer engagement apps like  Dynamics 365 Sales, Customer Service, Field Service, Marketing, and  Project Service Automation run on the Microsoft Dataverse platform. Tenant admins can deploy a production instance of a customer engagement app or Dataverse with the purchase of appropriate licenses. For more information, go to [Create and manage environments in the Power Platform admin center](create-environment.md).

For production environments, a replica of the different storage services (Azure SQL and file storage) is established in the secondary region for each environment at the time of deployment. For more information, go to [Environments](environments-overview.md). These replicas are referred to as geo-secondary replicas. The geo-secondary replicas are kept synchronized with the primary instance through continuous data replication. There is a small replication latency, or lag&mdash;typically less than a few minutes&mdash;between the primary data sources and their corresponding geo-secondary replicas. More information: [Ensure business continuity and disaster recovery (BCDR): Azure Paired Regions](/azure/best-practices-availability-paired-regions)

:::image type="content" source="media/dataverse-customer-engagement-apps.png" alt-text="For production environments, a replica of the different storage services (Azure SQL and file storage) is established in the secondary region for each environment.":::

As seen in the preceding diagram, similar to data storage services, compute infrastructure is also provisioned in both regions in such a way that it can handle the traffic volume in case of an environment or region-level failover. The following sections describe the different types of failovers that are possible and how Microsoft manages service continuity in either of these situations.

To learn more about data protection in non-production environments, go to [Back up and restore environments](backup-restore-environments.md).

## Unplanned failover

In the event of an unanticipated region-wide outage, such as a natural disaster that affects the entire Azure region, and Microsoft has determined that the region won't become available within a reasonable amount of time, Microsoft will notify customers and switch over the traffic to route to the secondary instances. In this case, it's possible that customers might experience a data loss of up to 15 minutes, depending on the nature and timing of the outage. 

## Planned failover

In the event that Microsoft determines there's a risk to the availability of the primary Azure region, for example if there's an impending hurricane, Microsoft will notify customers and switch over the traffic to route to the secondary region. Users connected to customer engagement and Dataverse apps at the time of the failover will experience a brief disruption. There will be no data loss, because both Azure regions will be online and data will be replicated fast enough to the secondary region.

> [!IMPORTANT]
> During the time the environment is operating out of the secondary region, there might be service degradation of non-production instances. It's possible that deployments of new, non-production environments will also be affected.

## Failback

Microsoft will notify customers and switch back the environments to operate out of the primary region when it determines that the primary region is back online and is fully operational. Users connected to the systems will experience a brief interruption of up to one minute. The service, including all non-production instances, will be fully restored.<!--note from editor: Suggested.--> There will be no data loss.

Dataverse for Teams environments don't support secondary replicas, hence this feature of providing business continuity won't be available until such Dataverse for Teams environments are converted to Dataverse production instances by using the upgrade process described in [Upgrade process](about-teams-environment.md#upgrade-process).

For more information about Dataverse for Teams environments, go to [About the Microsoft Dataverse for Teams environment](about-teams-environment.md).

### See also

[Finance and Operations business continuity and disaster recovery](/dynamics365/fin-ops-core/dev-itpro/sysadmin/business-continuity-disaster-recovery)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
