---
title: Business continuity and disaster recovery for Dynamics 365 SaaS apps
description: Microsoft provides business continuity and disaster recovery for production environments of Dynamics 365 SaaS applications if there's a regionwide Azure outage. 
author: ImadYanni 
ms.date: 01/21/2025
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: iyanni
search.audienceType: 
 - admin
contributors:
- jasunil
---

# Business continuity and disaster recovery

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft provides business continuity and disaster recovery (BCDR) capabilities to all [production type](/power-platform/admin/environments-overview) environments in Dynamics 365 and Power Platform software as a service (SAAS) applications. This article describes details and practices Microsoft takes to ensure your production data is resilient during a regional outage.

## Backup of production environments

Microsoft is dedicated to ensuring the highest [service availability](https://servicetrust.microsoft.com/) levels for your critical applications and data. Microsoft ensures that the baseline infrastructure and platform services are available through its business continuity and [disaster recovery](/azure/reliability/disaster-recovery-overview) architecture by allowing geo redundancy, where all data from production environments&mdash;excluding Default environments&mdash;is backed up to the paired, secondary region. These backups are referred to as _geo-secondary backups_ that are set up during the time that the primary environment is deployed.

:::image type="content" source="media/bcdr.png" alt-text="Diagram illustrating a geo-secondary replica of data storage and compute infrastructure.":::

The above illustration shows that when primary Region A gets impacted during an outage, production type environments from Region A fail over to secondary Region B, which is healthy. No action is taken on other types of [environments](/power-platform/admin/environments-overview) such as default, Trial, sandbox, Teams, or developer.

To learn more about data protection in nonproduction environments, go to [Back up and restore environments](/power-platform/admin/backup-restore-environments).

## How will you be notified of an outage?

The primary communications channel is via [Service Health Dashboard](/power-platform/admin/notifications-explained) (SHD) within Microsoft and Power Platform admin centers. The Microsoft communications team initiates the process by posting initial communications to notify you of the outage and post necessary updates to the SHD as needed. For more information on how to view your messages on the admin center, go to [Home page dashboard](/power-platform/admin/admin-documentation#home-page-dashboard). To be better prepared, visit the [readiness page](/services-hub/unified/health/ir-m365).    

## Failover and failback processes and criteria for business continuity

Failover and failback are the two main tasks accomplished during the business continuity and disaster recovery process. The purpose is to minimize the impact of a disaster on the availability and performance of critical business functions and applications.

**Failover** is the process of switching to a designated geo-secondary backup of all the systems and data from your primary production site. At the completion of the failover operation, your production environment is accessible from the geo-secondary site.

> [!IMPORTANT]
> While the finance and operations apps are operating in the secondary region after a failover maintenance, package deployments, financial reporting, and Power BI reporting are unavailable.

A **failback** operation is the process of returning production to its original location after a disaster or a scheduled maintenance period.

As part of Microsoft's business continuity and disaster recovery standard, customers can be ensured that each online service within Microsoft reviews, tests, and updates its BCDR plan annually. The Microsoft Cloud Business Continuity and Disaster Recovery Plan Validation Report is available to customers on [Service Trust Portal](https://aka.ms/stp).

If an unanticipated regionwide outage occurs, such as a natural disaster that affects the entire Azure region, the following steps and processes take place.

| Microsoft responsibilities  | Customer responsibilities  |
| --- | --- |
| If Microsoft detects an outage and sees customers being impacted, then Microsoft's communication team sends out the necessary communications and keeps the Service Health Dashboard up to date with the necessary information. | None |
| If an outage occurs, Microsoft performs an automatic failover of the **production instances** to the secondary region if there's *no data loss* to the customer. | None |
| If an outage occurs and Microsoft determines that there's *data loss*, then failing over the environment isn't initiated without customer consent/approval. | Once the customer is aware of the ongoing outage and sees *impact*, then it's the customer's responsibility: <br> - To reach out to Microsoft via support and find out the level of data loss that would occur if a failover is initiated. <br> - If the data loss is at an acceptable level to their organization standards, then customers should provide their **consent** via support for Microsoft to initiate a failover. |
| When Microsoft determines that the primary region is back online and is fully operational, a **failback** is performed on the production instances. There's no data loss during the planned failback process but users could experience brief interruptions or disconnects during this window. | None |

## Self-service disaster recovery (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

Disaster recovery is a Power Platform premium infrastructure capability that allows customers to initiate environment failover between regions in a self-serve manner.

Customers typically have multiple environments of different types created in their tenant. This capability is available specifically for production-type environments, and can be turned on for each environment. At this time this capability isn't available for finance and operations production environments.

### Turn on self-service disaster recovery

You need to turn on self-service disaster recovery for an environment before you can use the capability. This is a one-time action that provisions resources and starts the process of replicating data between the primary location and secondary location. This may take up to 48 hours to complete. Admins receive a notification when the process is complete. 

Turning on disaster recovery in an environment has no impact on the environment or the data within it.

To turn on disaster recovery, complete the following steps:

1. Navigate to the list of environments within the Power Platform admin center.
1. Select the production type environment where you want to turn on self-service disaster recovery.
1. Select **Disaster Recovery** in the command bar at the top of the page. The **Disaster Recovery** pane appears.
1. Select the toggle to change it to **Enabled**.
1. Select **Save**.
1. The environment is placed in the **Edit details** page briefly.
1. The **Environment details** page appears, indicating that the process of turning on the feature has started.

These two events may require you to use this feature: 
- Disaster recovery drill.
- Emergency response in the event of a major regional outage.

#### Disaster recovery drills

Your company may have disaster recovery drills documented as a requirement in your internal business continuity plans. Some industries and companies may be required by government regulations to perform audits on their BCDR capabilities. In these cases, you may run a disaster recovery drill on an environment. A disaster recovery drill allows you to perform self-service disaster recovery without losing any data. The duration of the failover action may be slightly longer while all remaining data is being replicated to the secondary region.

We recommend performing drills on a copy of a production environment, since this involves downtime that can last for minutes. For example, you may want to copy a production environment to a sandbox-type environment and then change the type from sandbox to production.

#### Emergency response failover

You would choose this option during an emergency&mdash;that is, when the primary region has sustained an outage and access to environments or data isn't possible. If you choose this option, the environment fails without copying any more data other than the data that has been replicated before the outage occurred. 

When you perform an emergency response, you see the amount of data loss represented in time, which you can compare to your recovery point objective (RPO) if you determine that it's acceptable and you choose to continue. The environment operates in the run state until disaster recovery is complete and the environment is back to normal operation from the secondary region.

### Switching back to primary region

After you complete your drill or after an outage has been mitigated, we recommend that you switch back the environment to its primary region. An environment may be operating with limited resources in the paired region. There's no loss of data during this operation.

### Environment disaster recovery status

Admins can determine the current disaster recovery state and location of an environment in the **Environment details** page. Admins can also select **Disaster Recovery** in the command bar to open the **Disaster Recovery** pane. 

To check data replication latency at any time, you can select **Disaster Recovery** and then select **Emergency response** as the disaster recovery reason. This opens a confirmation dialog that includes the last replication time between regions for that environment. You may select **Cancel** if your only purpose was to check the potential loss of data if there was a failover operation. Keep in mind that the last sync time is always different at different times, since data is being replicated continuously. 

### Document your business continuity plan

We recommend that you perform disaster recovery drills or an emergency response before a real disaster strikes so you can document all steps required for any integration points that are external to Power Platform. Your company is then more prepared for recovery if there's a real disaster.

### Note about preview

During the preview, there is no charge for this feature and you can't turn it off. When the feature reaches general availability, preview customers have the opportunity to keep the functionality or allow it to be turned off by Microsoft. There will be no impact on your primary environment location or capabilities if you choose not to upgrade during general availability.

[!INCLUDE[footer-include](../includes/footer-banner.md)]

