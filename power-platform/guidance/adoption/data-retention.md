---
title: Ensure data retention and mobility
description: Protect your data with Power Platform's flexible backup and retention capabilities to ensure resilience and recoverability for business-critical data.
#customer intent: As a Power Platform admin, I want to understand how to enhance data resilience so that I can protect and recover business-critical data effectively.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/14/2025
---

# Ensure data retention and mobility

In today's data-driven world, ensuring that your data remains available, secure, and recoverable in the face of disruptions is essential for businesses operating at a global scale. Microsoft Power Platform enables you to protect and recover your data seamlessly with a range of flexible backup and retention capabilities.

This article provides recommendations to help you build robust and resilient Power Platform solutions.

> [!NOTE]
> Find guidance for building reliability, resiliency, and failure recovery strategies in your architecture design in [Recommendation checklist for Reliability in Power Platform Well-Architected](../../well-architected/reliability/checklist.md). Your makers, solution architects, and enterprise architects should review these recommendations to ensure the best solution design for their workloads. 

## Regular backups

Environments that have a database are [automatically backed up and can be restored](../../admin/backup-restore-environments.md) to any selected system backup in the last seven days. These backups include all the data, configurations, and customizations within the environment. 

In addition to automatic backups, administrators can also create manual backups at any time. Manual backups are useful before making significant changes or updates to the environment. You can extend backup retention from seven to 28 days by making an environment a [Managed Environment](../../admin/managed-environment-overview.md).

## Implement data loss prevention (DLP) policies

Define and enforce data loss prevention policies to prevent unauthorized data access and ensure compliance with organizational standards. Learn more in [Implement a DLP strategy](dlp-strategy.md).

## Use role-based access control

Implement role-based access control (RBAC) to restrict access to sensitive data, ensuring that only authorized users can access and modify data. Learn more in [Security in Microsoft Dataverse](../../admin/wp-security.md).

## Enable data encryption

Power Platform encrypts data both at rest and in transit with a strong Microsoft-managed key by default.

Learn more:

- [About data encryption](../../admin/about-encryption.md)
- [Data protection](../../admin/wp-compliance-data-privacy.md#data-protection)

For organizations that need more control over data security and compliance, customer-managed keys (CMK) protect data in transit and at rest and give organizations control over their own encryption keys to enhance security.

Learn more:

- [Manage your customer-managed encryption key](../../admin/customer-managed-key.md)
- [Lock environments by revoking key vault and/or key permission access](../../admin/cmk-lock-unlock.md)

## Long-term retention

Either implement custom data archiving solutions to store historical data securely and efficiently, ensuring easy retrieval when needed, or use long-term retention policies on tables to keep parent and associated child data—including activities, emails, and attachments—retained as a set for compliance and auditing purposes. Learn more in [Enable a table for long term retention](/power-apps/maker/data-platform/data-retention-set#enable-a-table-for-long-term-retention).

## Recycle bin for table records

The recycle bin feature allows users to restore deleted records from tables—across various deletion scenarios—within a configurable time frame. This feature ensures data recovery when needed. Learn more in [Restore deleted Dataverse table records](../../admin/restore-deleted-table-records.md).

## Monitor and alert

Set up monitoring and alerting systems using tools like Azure Application Insights to detect and respond promptly to data-related issues.

Learn more in [Recommendations for designing a reliable monitoring and alerting strategy](../../well-architected/reliability/monitoring-alerting-strategy.md).

## Managed operations

[Managed operations](../../admin/operations/overview.md) is a suite of capabilities that empower organizations of all sizes to build, deploy, and operate their most critical workloads. These capabilities are built with both existing and emerging AI-driven solutions in mind. They ensure stability, minimize disruption, and maximize the productivity of operations teams.

Learn more about [what you can do with managed operations](../../admin/operations/overview.md).

## Conduct regular audits

Perform regular audits of your data resilience strategies to identify potential vulnerabilities and areas for improvement.

## Train your team

Provide training and resources to your team to ensure they understand the importance of data resilience and are equipped to implement best practices effectively.

Keep in mind that often makers developing the applications aren't fully aware of data resilience risks. If your organization does any training on how to build workloads with Power Platform, incorporate your recommendations on how to build reliable and resilient solutions into those training efforts.

Your training should include education on tenant-wide guardrails and configurations that might affect the workloads being built. Also include training on configurations the makers need to make for their workloads, such as security roles and how to connect to data. Determine the process for collaborating with them on any requests they might have.

Having a central source, such as a [SharePoint site or wiki](wiki-community.md), where makers can easily access this training content is important. This centralized repository ensures that all team members have consistent and up-to-date information, making it easier to discover and reference security guidelines and resources. Empowering makers and developers with the knowledge and tools they need helps safeguard your organization's data and applications.

## Create a disaster recovery plan

Microsoft Business Applications provide business continuity and disaster recovery (BCDR) capabilities to all production environments in Dynamics 365 and Power Platform software as a service (SAAS) applications. Learn how [Microsoft ensures your production data is resilient during regional outages](../../admin/business-continuity-disaster-recovery.md).

Develop a comprehensive disaster recovery plan that outlines the steps to take if data is lost or a system fails. Regularly test and update this plan. Learn more about [building a disaster recovery strategy](plan-disaster-recovery.md).

## Related information

- [Managed operations](../../admin/operations/overview.md)
- [Power Platform Well-Architected checklist for Reliability](../../well-architected/reliability/checklist.md)
