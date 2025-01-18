---
title: Business continuity and disaster recovery for Dynamics 365 SaaS apps
description: Microsoft provides business continuity and disaster recovery for production environments of Dynamics 365 SaaS applications if there's an Azure region-wide outage. 
author: sericks007
ms.date: 11/01/2024
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: jasunil
search.audienceType: 
 - admin
contributors:
- ImadYanni
---

# Business continuity and disaster recovery

Microsoft's Business Application Platform (BAP) provides Business Continuity and Disaster Recovery (BCDR) capabilities to all [production type](/power-platform/admin/environments-overview) environments in Dynamics 365 and Power Platform SAAS applications. This article describes details and practices Microsoft takes to ensure your production data is resilient during regional outage.

## Backup of production environments

Microsoft is dedicated to ensuring the highest [service availability](https://servicetrust.microsoft.com/) levels for your critical applications and data. Microsoft ensures that the baseline infrastructure and platform services are available through its business continuity and [disaster recovery](/azure/reliability/disaster-recovery-overview) architecture by allowing geo redundancy, where all data from production environments&mdash;excluding Default environments&mdash;is backed up to the paired, secondary region. These backups are referred to as _geo-secondary backups_ that are set up during the time that the primary environment is deployed.

:::image type="content" source="media/bcdr.png" alt-text="Diagram illustrating a geo-secondary replica of data storage and compute infrastructure.":::

The above illustration shows that when primary Region A gets impacted during an outage, production type environments from Region A failover to secondary Region B, which is healthy. No action is taken on other types of [environments](/power-platform/admin/environments-overview) such as default, Trial, sandbox, Teams, or developer.

To learn more about data protection in nonproduction environments, see [Back up and restore environments](/power-platform/admin/backup-restore-environments).

## How will you be notified of an Outage?

 The primary communications channel is via [Service Health Dashboard](/power-platform/admin/notifications-explained) (SHD) within Microsoft and Power platform admin centers. The Microsoft communications team initiates the process by posting initial communications to notify you of the outage and post necessary updates to the SHD as needed. For more information on how to view your messages on the admin center, see [Home page dashboard](/power-platform/admin/admin-documentation#home-page-dashboard). To be better prepared, visit the [readiness page](/services-hub/unified/health/ir-m365).    

## Failover and failback processes and criteria for business continuity

Failover and failback are the two main tasks accomplished during the business continuity and disaster recovery (BCDR) process, the purpose is to minimize the impact of a disaster on the availability and performance of critical business functions and applications.

**Failover** is the process of switching to a designated geo-secondary backup of all the systems and data from your primary production site. At the completion of the failover operation, your production environment is accessible from the geo-secondary site.

> [!IMPORTANT]
> While the Finance and Operations apps are operating in the secondary region after a failover maintenance, package deployments, Financial Reporting, and Power BI reporting are unavailable.

**Failback** operation is the process of returning production to its original location after a disaster or a scheduled maintenance period.

As part of Microsoft's business continuity and disaster recovery (BCDR) standard, customers can be ensured that each online service within Microsoft reviews, tests, and updates its BCDR plan annually. The Microsoft Cloud Business Continuity and Disaster Recovery Plan Validation Report is available to customers on [Service Trust Portal](https://aka.ms/stp).

If an unanticipated region-wide outage occurs, such as a natural disaster that affects the entire Azure region, the following steps and processes take place.

| Microsoft's responsibility  | Customers responsibilities  |
| --- | --- |
| If Microsoft detects an outage and sees customers being impacted, then Microsoft's communication team sends out the necessary communications and keep the Service Health Dashboard up to date with the necessary information. | None |
| If an outage occurs, Microsoft performs an automatic failover of the **production instances** to the secondary region if there is NO DATA LOSS to the customer. | None |
| If an outage occurs, Microsoft determines that there's DATA LOSS, then failing over the environment isn't initiated without customer consent/approval. | Once the customer is aware of the ongoing outage, and sees IMPACT, then it's the customer's responsibility: <br> - To reach out to Microsoft via support and find out the level of data loss that would occur if a failover is initiated. <br> - If the data loss is at an acceptable level to their organization standards, then customers should provide their **consent** via support, for Microsoft to initiate a failover. |
| When Microsoft determines that the primary region is back online and is fully operational, a **FAILBACK** is performed on the production instances. There's no data loss during the planned failback process but users could experience brief interruptions or disconnects during this window. | None |

[!INCLUDE[footer-include](../includes/footer-banner.md)]
