---
title: Managed operations
description: Learn how to utilize managed operations capabilities in Power Platform to effectively build, deploy, and operate your workloads.
ms.date: 02/14/2022
ms.service: power-platform
ms.topic: overview
ms.custom: ignite-2024
ms.collection: get-started
author: alaug 
ms.subservice: admin
ms.author: alaug 
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Managed operations in Power Platform

With tens of millions monthly users, Microsoft Power Platform transforms how organizations deliver modern AI-powered customer experiences, improved employee satisfaction, and business results. Customers increasingly rely on the Power Platform to run global-scale, mission critical workloads, where the risk and business impact of failure are high. These workloads demand operational excellence: highly controlled change management to avoid unexpected disruptions to stability and quality, deep insights into ongoing operations to detect and resolve issues, and resiliency to recover from failures.

## What can you do with managed operations?

Managed operations is a suite of capabilities to empower organizations of all sizes to build, deploy, and operate their most critical workloads. Built with both existing and emerging AI-driven solutions in mind, these capabilities ensure stability and minimize disruption while maximizing the productivity of operations teams.

Managed operations encompass, but isn't limited to, the following capabilities:

## 1. Application lifecycle Management

Ensure high-quality releases with a comprehensive, integrated set of DevOps tools.

- **Deployment experiences**: Maker and admin experiences to facilitate deploying software updates, simplify admin reviews and approvals, detect and diagnose deployment failures. [Pipelines in Power Platform](../../alm/pipelines.md)

- **Source Control**: Integrated source control enables large teams scale collaboration on a single solution, and it allows for tracking changes and maintaining version control directly within the platform. Learn more: [Source control integration](../../alm/git-integration/overview.md)

- **Solution Checker**: A powerful tool that performs a comprehensive static analysis of your solution objects against a set of best practice rules. It provides actionable insights for predeployment quality checks, reducing errors and improving the success rate of changes. Learn more: [Solution checker enforcement](../managed-environment-solution-checker.md)

- **Pipelines**: Customers can easily configure automated deployment pipelines in minutes rather than days or weeks. This feature allows admins to set up the appropriate safeguards to govern and facilitate solution development, testing, and delivery across the organization. Learn more: [Pipelines in Power Platform](../../alm/pipelines.md)

- **Approval-Based Deployments**: Gated deployments that require approvals, adding a layer of security and compliance to production changes. [Aprrovals with delegated deployments](../../alm/delegated-deployments-setup.md)

- **Test Engine:** Feature used for testing standalone canvas apps in Power Apps. Lear more: [Test Engine](/power-apps/developer/test-engine/overview)

## 2. Observability and Insights

Enable teams to quickly detect, triage, and respond to issues to minimize impact on end-user experiences or your business processes.

- **Monitoring experiences**: Admin and Maker experiences that provide out-of-the-box metrics and recommendations to understand production health, a means to detect degradations and guidance to improve production health.

- **Azure Application Insights integration**: Delivers detailed, granular logs and custom metrics for deep analysis, enabling a comprehensive understanding of application performance. Learn more: [Integration with Application Insights](../overview-integration-application-insights.md)

- **Dataverse in Fabric Shortcuts**: With Dataverse integration with Fabric Shortcuts, now available in [preview](https://aka.ms/dataexportv2preview), allows customers to instantly bring D365/Power Platform inventory into Fabric, ensuring that teams have the most up-to-date information at their fingertips. This streamlined access accelerates insights, enhances decision-making, and simplifies data management, empowering you to make impactful, data-driven choices faster than ever before.

## 3. Data Resiliency

Protect and recover data seamlessly with a range of flexible backup and retention capabilities.

- **Extended Backup Retention**: Customers can use retention policies to securely store inactive data long-term in Azure Data Lake tiers, providing a cost-effective solution for archiving while ensuring compliance and easy access. Learn more: [Long-term data retention](/power-apps/developer/data-platform/long-term-retention?tabs=sdk)

- **Recycle Bin for Table Records**: The recycle bin feature allows users to restore deleted records from tables across various deletion scenarios within a configurable time frame, ensuring data recovery when needed. Learn more: [Restore deleted Dataverse table records](/power-platform/admin/restore-deleted-table-records)

- **Long-Term Retention**: Enable long-term retention policies on tables to keep parent and associated child data, including activities, emails, and attachments, retained as a set for compliance and auditing purposes. Learn more: [Long-term retention for tables in Dataverse](/power-apps/maker/data-platform/data-retention-set#enable-a-table-for-long-term-retention)

### See also

- [Managed Environments overview](../managed-environment-overview.md)
- [Security in Microsoft Power Platform](../security/overview.md)
