---
title: Managed operations
description: Learn how to use managed operations capabilities in Microsoft Power Platform to effectively build, deploy, and operate your workloads.
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

With tens of millions of monthly users, Microsoft Power Platform transforms how organizations deliver modern, AI-powered customer experiences, improved employee satisfaction, and business results. Customers increasingly rely on Microsoft Power Platform to run global-scale, mission-critical workloads, where the risk and business impact of failure are high. These workloads demand operational excellence:

- Highly controlled change management, to prevent unexpected disruptions to stability and quality
- Deep insights into ongoing operations, so that issues can be detected and fixed
- Resiliency, for recovery from failures

## What can you do with managed operations?

Managed operations is a suite of capabilities that empower organizations of all sizes to build, deploy, and operate their most critical workloads. These capabilities are built with both existing and emerging AI-driven solutions in mind. They ensure stability and minimize disruption at the same time that they maximize the productivity of operations teams.

Managed operations encompasses the following capabilities, among others.

### Application lifecycle management

Ensure high-quality releases through a comprehensive, integrated set of Azure DevOps tools.

- **Deployment experiences**: Maker and admin experiences facilitate the deployment of software updates, simplify admin reviews and approvals, and help with the detection and diagnosis of deployment failures. Learn more in [Overview of pipelines in Power Platform](../../alm/pipelines.md).
- **Source control**: Integrated source control allows large teams to scale collaboration on a single solution. It allows for tracking changes and maintaining version control directly within the platform. Learn more in [Source control integration](../../alm/git-integration/overview.md).
- **Solution checker**: Solution checker is a powerful tool that performs a comprehensive, static analysis of your solution objects against a set of best practice rules. It provides actionable insights for predeployment quality checks, reducing errors and improving the success rate of changes. Learn more in [Solution checker enforcement](../managed-environment-solution-checker.md).
- **Pipelines**: Customers can easily configure automated deployment pipelines in minutes rather than days or weeks. This feature allows admins to set up the appropriate safeguards to govern and facilitate solution development, testing, and delivery across the organization. Learn more in [Pipelines in Power Platform](../../alm/pipelines.md).
- **Approval-based deployments**: Take advantage of gated deployments that require approvals, which add a layer of security and compliance to production changes. Learn more in [Approvals with delegated deployments](../../alm/delegated-deployments-setup.md).
- **Test engine:** This feature is used for testing standalone, canvas apps in Power Apps. This can be used for running test automation as a stage in a deployment. Learn more in [Test Engine](/power-apps/developer/test-engine/overview).

### Observability and insights

Empower teams to quickly detect, triage, and respond to issues but also minimize the impact on user experiences and your business processes.

- **Monitor experiences**: This capability includes admin and maker experiences that provide out-of-box metrics and recommendations. The metrics and recommendations help admins and makers understand production health, detect degradations, and improve production health.
- **Azure Application Insights integration**: This capability delivers detailed, granular logs and custom metrics for deep analysis, to facilitate a comprehensive understanding of application performance. Learn more in [Overview of integration with Application Insights](../overview-integration-application-insights.md).
- **Dataverse in Fabric Shortcuts**: Through Dataverse integration with Fabric Shortcuts (now available in [preview](https://aka.ms/dataexportv2preview)), customers can instantly bring Dynamics 365 and Power Platform inventory into Fabric. Therefore, they can ensure that teams have the most up-to-date information at their fingertips. This streamlined access accelerates insights, enhances decision-making, and simplifies data management. Therefore, it empowers you to make impactful, data-driven choices faster than ever before.

### Data resiliency

Seamlessly protect and recover data through a range of flexible backup and retention capabilities.

- **Extended backup retention**: Customers can now extend their backup retention from seven to 28 days. Learn more in [Back up and restore environments](../backup-restore-environments.md).
- **Recycle bin for table records**: Users can restore records that were deleted from tables in various deletion scenarios during a configurable time frame. The recycle bin feature ensures that data recovery is available when it's needed. Learn more in [Restore deleted Microsoft Dataverse table records](/power-platform/admin/restore-deleted-table-records).
- **Long-term retention**: Use long-term retention policies on tables to retain parent data and associated child data as a set for compliance and auditing purposes. This data includes activities, emails, and attachments. Learn more in [Enable a table for long term retention](/power-apps/maker/data-platform/data-retention-set#enable-a-table-for-long-term-retention).
- **Self-serve disaster recovery**: Self-serve disaster recovery is now available in the early preview. Admin can use this feature to conduct a disaster recovery drill or perform real-time "emergency response" failover and failback. To learn more and participate in the early preview, fill in the [signup form](https://forms.office.com/r/35NJ8vriFf).

## Related information

- [Managed Environments overview](../managed-environment-overview.md)
- [Security page overview](../security/security-overview.md)
