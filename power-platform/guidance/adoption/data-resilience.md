---
title: Ensure data resilience
description: Guidance for protecting and recovering data seamlessly with a range of flexible backup and retention capabilities
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
ms.date: 02/28/2025
---

# Ensure data resilience

In today’s data-driven world, ensuring that your data remains available, secure, and recoverable in the face of disruptions is essential for businesses operating at a global scale. Microsoft Power Platform enables you to protect and recover their data seamlessly with a range of flexible backup and retention capabilities.

This article provides recommendations to help you build robust and resilient solutions.

> [!NOTE]
> Our primary guidance for building reliability, resiliency, and failure recovery strategies in your architecture design can be found in [Reliability recommendations in Power Platform Well-Architected](/power-platform/well-architected/reliability/checklist). Your makers, solution architects, and enterprise architects should review the recommendations provided there to ensure the best solution design for their workloads. This article provides a summary of key recommendations that can form part of your tenant adoption strategy, helping you achieve robust and resilient Power Platform solutions.

Here are some recommendations for enhancing data resilience in Power Platform:

## Regular backups

Ensure that your environments are backed up regularly. Review and manage these backups to confirm they're up-to-date and accessible when needed. Power Platform automatically creates backups of your environments, typically on a daily basis. These backups include all the data, configurations, and customizations within the environment. In addition to automatic backups, administrators can also create manual backups at any time. Manual backups are useful before making significant changes or updates to the environment.

You can now extend their backup retention from seven to 28 days. Learn more: [Back up and restore environments](/power-platform/admin/backup-restore-environments)

## Implement Data Loss Prevention (DLP) policies

Define and enforce DLP policies to prevent unauthorized data access and ensure compliance with organizational standards. Learn more: [Establish a DLP strategy](dlp-strategy.md)

## Use role-based access control (RBAC)

Implement RBAC to restrict access to sensitive data, ensuring that only authorized users can access and modify data. Learn more: [Security in Microsoft Dataverse](/power-platform/admin/wp-security)

## Enable data encryption

Power Platform encrypts data both at rest and in transit with a strong Microsoft-managed key by default.

Learn more:

- [About data encryption](/power-platform/admin/about-encryption)
- [Data protection](/power-platform/admin/wp-compliance-data-privacy#data-protection)

For organizations requiring greater control over their data security and compliance, customer managed keys (CMK) ensure that data isn't only protected both in transit and at rest, but also give organizations control over their encryption keys for enhancing data security.

Learn more:

- [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)
- [Lock environments by revoking key vault and/or key permission access](/power-platform/admin/cmk-lock-unlock)

## Long-term retention

Either implement custom data archiving solutions to store historical data securely and efficiently, ensuring easy retrieval when needed or use long-term retention policies on tables to keep parent and associated child data—including activities, emails, and attachments—retained as a set for compliance and auditing purposes. Learn more: [Long-term retention for tables in Dataverse](/power-apps/maker/data-platform/data-retention-set#enable-a-table-for-long-term-retention).

## Recycle bin for table records

The recycle bin feature allows users to restore deleted records from tables—across various deletion scenarios—within a configurable time frame. This feature ensures data recovery when needed. Learn more: [Restore deleted Dataverse table records](/power-platform/admin/restore-deleted-table-records).

## Monitor and alert

Set up monitoring and alerting systems using tools like Azure Application Insights to detect and respond to data-related issues promptly.

Learn more about [recommendations for designing a reliable monitoring and alerting strategy](/power-platform/well-architected/reliability/monitoring-alerting-strategy).

## Conduct regular audits

Perform regular audits of your data resilience strategies to identify potential vulnerabilities and areas for improvement.

## Train your team

Provide training and resources to your team to ensure they understand the importance of data resilience and are equipped to implement best practices effectively.

Bear in mind that often makers developing the applications aren't fully aware of data resilience risks. If your organization does any training on how to build workloads with Power Platform, incorporate your recommendations for how to build reliable and resilient solutions into those training efforts.

Your training should include education on tenant-wide guardrails and configurations that might affect the workloads that are being built. They also require training on configurations the makers need to make for their workloads, such as security roles and how to connect to data. Determine the process for collaborating with them on any requests they might have.

Having a central source, such as a [SharePoint site or wiki](wiki-community.md), where makers can easily access this training content is important. This centralized repository ensures that all team members have consistent and up-to-date information, making it easier to discover and reference security guidelines and resources. Empowering makers and developers with the knowledge and tools they need helps safeguard your organizations data and applications.

## Create a disaster recovery plan

Microsoft Business Applications provide business continuity and disaster recovery (BCDR) capabilities to all production environments in Dynamics 365 and Power Platform software as a service (SAAS) applications. Learn how [Microsoft ensures your production data is resilient during regional outages](/power-platform/admin/business-continuity-disaster-recovery).

Develop a comprehensive disaster recovery plan that outlines the steps to take if there's data loss or system failure. Regularly test and update this plan. Learn more about [designing a disaster recovery strategy](/power-platform/well-architected/reliability/disaster-recovery).
