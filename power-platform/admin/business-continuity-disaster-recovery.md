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


## Self-service disaster recovery (preview)

Disaster Recovery is a power platform premium infrastructure capability that enables customers to initiate environment failover between regions in a self-serve manner. Access to this capability is in power platform admin center, at this time, this is only available for all Production type environments with the exception for Finance and Operations environments.

### Enabling Production envionments for Self-service disaster recovery

You need to enable DR for an environment before you can use the capability; enabling is a one-time action that provisions resources and starts the process of replicating data between the primary location and secondary location. This may take up to 48 hours to complete. Admins will receive a notification when feature enablement is complete. 

There are two reasons that may require you to use this feature after an environment has been enabled: Disaster recovery drill or Emergency response in the event of a major regional outage.

### Disaster recovery drills

Your company may have DR drills documented as a requirement in your internal business continuity plans. There are also industries and companies that may be required by government regulations to perform audits on their BCDR capabilities. In these cases you may run a DR drill on an environment. DR drill allows you to perform self-service DR without losing any data. The duration of the failover action may be slightly higher while all remaining data is being replicated to secondary region.
It is recommended that drills are performed on a copy of a production environment, since this incures downtime that can last for minutes, for example you may want to copy a production environment to a sandbox type environment then change the type from sandbox to production.

### Emergency response failover

This option is expected to be chosen during an emergency, i.e. when the primary region has sustained an outage and access to environments or data is not possible. If you choose this option the environment will be failed over without copying any additional data other than the data that has been replicated before the outage occurred. 
When you perform an emergency response you will see the amount of data loss represented in time, which you can compare to your RPO (Recovery Point Objective), if you determine that it is acceptable and you choose to continue the environment will be in operation run state until DR is complete and the environment is back to normal operation from the secondary region.

### Switching back to primary region

After you have completed your drill or after an outage has been mitigated it is recommended that you switch back the environment to its primary region. An environrment maybe operating with limited resources in the paired region. There is no loss of data during this operation 

### Environment Disaster recovery status

Admins can determine current DR state and location of an environment in the environment details page or can click Disaster recovery operation to open DR panel.

### Documenting your business continuity plan

It is recommended that you perform DR drills, or emergency response if you choose to, before a real disaster has struck so you can document all  additional steps required for any additional integration points that are external to power platform. In this case your company will be more prepared for recovery in case of a real disaster.

### Note about preview

During the preview there will not be a charge for this feature, and it cannot be disabled by the customer. When the feature reaches general availability preview customers will have the opportunity to keep the functionality or allow it to be disabled by Microsoft. There will be no impact on your primary environment location or capabilities if you choose not to upgrade during GA.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
