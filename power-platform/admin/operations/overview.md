---
title: Managed operations
description: Learn how to utilize managed operations capabilities in Power Platform to effectively build, deploy, and operate your workloads.
ms.date: 03/04/2025
ms.service: power-platform
ms.topic: overview
ms.custom: NewPPAC
ms.collection: get-started
author: alaug 
ms.subservice: admin
ms.author: alaug 
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Managed operations

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

With tens of millions monthly users, Microsoft Power Platform transforms how organizations deliver modern AI-powered customer experiences, improved employee satisfaction, and business results. Customers increasingly rely on the Power Platform to run global-scale, mission critical workloads, where the risk and business impact of failure are high. These workloads demand operational excellence: highly controlled change management to avoid unexpected disruptions to stability and quality, deep insights into ongoing operations to detect and resolve issues, and resiliency to recover from failures.

## What can you do with managed operations?

Managed operations is a suite of capabilities to empower organizations of all sizes to build, deploy, and operate their most critical workloads. Built with both existing and emerging AI-driven solutions in mind, these capabilities ensure stability and minimize disruption while maximizing the productivity of operations teams.

Managed operations encompass, but isn't limited to, the following capabilities:

## 1. Application lifecycle management

Ensure high-quality releases with a comprehensive, integrated set of DevOps tools.

- **Deployment experiences**: Maker and admin experiences to facilitate deploying software updates, simplify admin reviews and approvals, and the ability to detect and diagnose deployment failures. Learn more in [Pipelines in Power Platform](../../alm/pipelines.md).

- **Source control**: Integrated source control enables large teams to scale collaboration on a single solution, and it allows for tracking changes and maintaining version control directly within the platform. Learn more in [Source control integration](../../alm/git-integration/overview.md).

- **Solution checker**: A powerful tool that performs a comprehensive, static analysis of your solution objects against a set of best practice rules. It provides actionable insights for predeployment quality checks, reducing errors and improving the success rate of changes. Learn more in [Solution checker enforcement](../managed-environment-solution-checker.md).

- **Pipelines**: Customers can easily configure automated deployment pipelines in minutes rather than days or weeks. This feature allows admins to set up the appropriate safeguards to govern and facilitate solution development, testing, and delivery across the organization. Learn more in [Pipelines in Power Platform](../../alm/pipelines.md).

- **Approval-based deployments**: Take advantage of gated deployments that require approvals, which add a layer of security and compliance to production changes. Learn more in [Aprrovals with delegated deployments](../../alm/delegated-deployments-setup.md).

- **Test engine:** This feature is used for testing standalone, canvas apps in Power Apps. Learn more in [Test Engine](/power-apps/developer/test-engine/overview).

## 2. Observability and insights

Empower teams to quickly detect, triage, and respond to issues while minimizing impact on end user experiences or your business processes.

- **Monitor experiences**: This capability includes admin and maker experiences that provide out-of-the-box metrics and recommendations. The metrics and recommendations help admin and makers understand production health, detect degradations, and improve production health.

- **Azure Application Insights integration**: This capability delivers detailed, granular logs and custom metrics for deep analysis, which facilitates a comprehensive understanding of application performance. Learn more in [Integration with Application Insights](../overview-integration-application-insights.md).

- **Dataverse in Fabric Shortcuts**: With Dataverse integration with Fabric Shortcuts, now available in [preview](https://aka.ms/dataexportv2preview), customers can instantly bring Dynamics 365 and Power Platform inventory into Fabric, ensuring that teams have the most up-to-date information at their fingertips. This streamlined access accelerates insights, enhances decision-making, and simplifies data management, empowering you to make impactful, data-driven choices faster than ever before.

## 3. Data resiliency

Protect and recover data seamlessly with a range of flexible backup and retention capabilities.

- **Extended backup retention**: Customers can now extend their backup retention from seven to 28 days. Learn more: [Back up and restore environments](../backup-restore-environments.md).

- **Recycle bin for table records**: The recycle bin feature allows users to restore deleted records from tables&mdash;across various deletion scenarios&mdash;within a configurable time frame. This feature ensures data recovery when needed. Learn more in [Restore deleted Dataverse table records](/power-platform/admin/restore-deleted-table-records).

- **Long-term retention**: Use long-term retention policies on tables to keep parent and associated child data&mdash;including activities, emails, and attachments&mdash;retained as a set for compliance and auditing purposes. Learn more in [Long-term retention for tables in Dataverse](/power-apps/maker/data-platform/data-retention-set#enable-a-table-for-long-term-retention).

- **Self-serve Disaster Recovery**: Self-serve disaster recovery is now available in the early preview. Admin can perform a Disaster recovery drill or real time "Emergency response" failover and failback with this feature. Please fill up [this form](https://forms.office.com/r/35NJ8vriFf) to learn more and participate in the early preview. 

### Related content

- [Managed Environments overview](../managed-environment-overview.md)
- [Security page overview](../security/security-overview.md)
