---
title: Integrate Dataverse with enterprise data in Microsoft Fabric using a medallion architecture
description: Learn how to combine Dataverse data with enterprise sources using Link to Fabric, a medallion architecture, and governed semantic models.
#customer intent: As a Power Platform user, I want to explore an example implementation that integrates Dataverse and enterprise data in Microsoft Fabric so that I can design a scalable, governed, and well-architected analytics platform for reporting and agentic scenarios.
author: carcla
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 06/23/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---

# Integrate Dataverse with enterprise data in Microsoft Fabric using a medallion architecture

This reference architecture shows how to integrate Dataverse with enterprise data in Microsoft Fabric to build a governed analytics platform by using a medallion approach. A medallion architecture organizes data into bronze, silver, and gold layers so teams can preserve raw source data, create conformed and reusable datasets, and publish curated models optimized for analytics and AI experiences. Learn more about the principles of a medallion architecture in [What is the medallion lakehouse architecture?](/azure/databricks/lakehouse/medallion)

> [!TIP]  
> This article provides an example scenario and a generalized example architecture to illustrate how to integrate Dataverse with enterprise data in Microsoft Fabric. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

At a high level, the architecture separates ingestion, transformation, governance, and consumption responsibilities so each layer can scale independently. You mirror Dataverse data into OneLake through Link to Fabric, ingest non-Dataverse sources through Fabric pipelines, and publish curated data products through governed gold-layer models for enterprise consumption.

The diagram shows identity and access controls across the architecture. Data enters through Dataverse mirroring or external ingestion and moves through the bronze, silver, and gold layers. Power BI, Copilot, data agents, and operational reporting experiences consume the data.

Treat governance as a cross-cutting concern rather than a single architecture component. Identity, role-based access control (RBAC), lineage, deployment pipelines, and certified semantic models work together to control access, manage change, and preserve trust across the data lifecycle.

:::image type="content" source="media/enterprise-data-fabric-dataverse/architecture.png" alt-text="Diagram of Microsoft Fabric architecture showing ingestion, bronze, silver, and gold layers, and consumption with Power BI and Copilot." lightbox="media/enterprise-data-fabric-dataverse/architecture.png":::

## Workflow

The workflow follows the data lifecycle from secure access and ingestion through transformation, governed modeling, consumption, and deployment operations.

### Identity and security

Set up identity and access controls first so every downstream Fabric artifact inherits a governed security model.

- Use single sign-on with JumpCloud as the identity provider integrated with Microsoft Entra ID for access to Power Platform, Fabric, and consumption tools.

- Apply role-based access control (RBAC) at the workspace, item (Lakehouse, Warehouse, Eventhouse, Semantic Model), object (table, view, file), and row and column levels (RLS, CLS).

- Align security groups to personas: engineering, business intelligence (BI) developers, data scientists, business analysts, and app makers.

### Ingestion: Bronze level

Bronze uses two ingestion lanes: managed Dataverse mirroring through Link to Fabric and pipeline-driven ingestion for non-Dataverse sources.

- **Linked Dataverse Lakehouse (Bronze):** Provisioned and fully managed through Link to Fabric. Mirrors Dataverse tables in OneLake with incremental updates and Parquet/Delta formats, serving as the authoritative, raw system-of-record input for Dataverse domains.

- **Enterprise Data Warehouse (EDW) Lakehouse (Bronze – Non-Dataverse sources):** Ingests data from external systems such as files, APIs, and future source applications. Fabric data pipelines support batch and ELT (extract, load, transform) orchestration, while Dataflow Gen2 supports no-code and low-code ingestion where appropriate.

### Transformation and conformance: Silver level

Apply transformation logic by using the right Fabric workload for each task:

- Pipelines for orchestration, dependencies, and scheduling.
- Dataflow Gen2 for low-code entity shaping, option set decoding, and lightweight conformance.
- Notebooks (Spark/Python) for scalable joins, historization (SCD), and advanced data engineering.

**Silver (Conformed):** Normalize Dataverse entities (for example, Account, Contact, Opportunity, Activities). Flatten entities. Materialize lookups. Map option sets to readable labels. Align cross-system identifiers. Standardize non-Dataverse sources to common dimensions and conforming keys.

### Curated modeling: Gold level

**Gold (Star Schema):** Curated fact and dimension models aligned to business domains (for example, Sales, Pipeline, Customer 360, Service). Performance-oriented design includes surrogate keys, date dimensions, degenerate dimensions where needed, and incremental or partition strategies. The diagram shows the gold layer as a lakehouse because cost efficiency is a primary design goal. You can also use a warehouse when the workload requires stronger relational modeling, SQL-first development, or warehouse-specific performance and governance features.

After you curate gold data products, semantic models provide the governed business layer used by reporting, Copilot, and data agents.

### Semantic models and consumption

- Build semantic models on gold, certify them, and govern them to serve Power BI, Copilot experiences, and data agents.

- Use the Linked Dataverse Lakehouse for operational reporting with minimal shaping. Use silver or gold for enterprise content to support consistency and scale.

### DevOps and lifecycle

Lifecycle management wraps the workflow so artifacts move consistently from development to production with source control, validation, and environment-specific configuration.

- Integrate Git Source Control (Azure DevOps) with the development workspace for versioning and peer review.

- Use Fabric deployment pipelines to automate promotion from development to test to production with environment-specific variables, data source rules, and validation gates.

- Assign clear artifact ownership: engineering owns pipelines and notebooks, the business intelligence (BI) team owns semantic models, and product owners manage key performance indicators (KPIs) and definitions.

The result is a governed analytics pipeline where raw source data is preserved, conformed data is reusable, curated models are trusted, and consumption experiences are supported by certified semantic layers.

## Scenario details

**Primary goal:** Deliver a scalable, supportable analytics foundation for Dataverse and non-Dataverse sources that accelerates Power Platform scenarios and prepares the data surface for Copilot and Enterprise BI.

Key objectives include:

- Consistent data products (star-schema gold) that power certified semantic models.
- Direct integration with Power Apps (Dataverse) through Link to Fabric (managed mirroring).
- Governed development with Git integration and Fabric deployment pipelines (Dev → Test → Production).
- Secure, role-aware access at workspace, item, object, and row/column levels.
- Centralized data from multiple systems.
- Improved data cleanliness, organization, and security.
- Support for Copilot and analytics scenarios.
- Cost-conscious tool and configuration choices.

The architecture translates these goals into a governed Fabric pattern: Dataverse data enters through Link to Fabric and external sources are ingested through Fabric pipelines. Both streams are shaped through bronze, silver, and gold layers before being exposed through certified semantic models for Power BI, Copilot, data agents, and operational reporting.

## Components

The following components make up the reference architecture and support identity, ingestion, transformation, governance, lifecycle management, and consumption.

| **Component area** | **Component** | **Role in the architecture** |
| -------- | -------- | -------- |
| Identity and access | [JumpCloud](https://jumpcloud.com/), Microsoft Entra ID, and [RBAC](/entra/identity/role-based-access-control/) | JumpCloud provides identity provider integration with Microsoft Entra ID, while RBAC is applied across Fabric workspaces, items, objects, and data layers. |
| Core platform | [Microsoft Fabric](/fabric/) | Provides the unified analytics platform for lakehouses, pipelines, notebooks, semantic models, deployment pipelines, and consumption experiences. |
| Ingestion and integration | [Link to Microsoft Fabric](/power-apps/maker/data-platform/fabric-link-to-data-platform) and external ingestion pipelines | Mirrors Dataverse data into OneLake through managed Link to Fabric integration and ingests non-Dataverse data from files, APIs, and future source systems using Fabric Data Pipelines and Dataflow Gen2. |
| Business application sources | [Dataverse](/power-apps/maker/data-platform/data-platform-intro) and [Microsoft Dynamics 365 Business Central](/dynamics365/business-central/) | Dataverse serves as the primary Power Platform source, while Business Central can be integrated as a business application data source where required and standardized into the Fabric medallion layers. |
| Data architecture | [Medallion architecture](/azure/databricks/lakehouse/medallion) | Organizes data into bronze, silver, and gold layers so raw data is preserved, conformed data is reusable, and curated models are optimized for analytics. |
| DevOps and lifecycle | [Azure DevOps](https://azure.microsoft.com/products/devops), [Fabric deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines), and [Fabric variable library](/fabric/cicd/variable-library/get-started-variable-libraries) | Supports source control, peer review, promotion across Dev, Test, and Production, validation gates, and environment-specific configuration. |
| Consumption | [Power BI](/power-bi/), data agents, Copilot, and approved reporting experiences | Certified semantic models and governed gold-layer outputs support Power BI, Copilot, data agents, operational reporting, and other approved consumption experiences. |

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

This architecture is designed to provide consistent, resilient data delivery across ingestion, transformation, and consumption layers.

- Managed Link to Fabric mirroring reduces custom extraction logic and lowers ingestion failure risk.

- Medallion architecture isolates failures across bronze, silver, and gold so issues in one layer don't disrupt the full analytics pipeline.

- Incremental processing, partitioned ELT, and dependency-aware orchestration reduce refresh duration and capacity contention.

- Monitoring, alerting, and retry handling help pipeline failures surface early and recover without manual rework.

### Security

Implement security as a first-class concern and apply it consistently across identity, data, and analytics layers.

- Use single sign-on with JumpCloud as the identity provider integrated with Microsoft Entra ID for access to Power Platform, Fabric, and approved consumption tools.

- Enforce RBAC at workspace, item, object, and semantic model levels to support least-privilege access aligned to enterprise personas.

- Use row-level and column-level security to protect sensitive business data in semantic models and support secure reuse across multiple reports.

- Use sensitivity labels, endorsement, lineage, and periodic access reviews to help maintain trusted and compliant data access.

### Operational Excellence

Achieve operational excellence through standardization, automation, and clear ownership across the analytics lifecycle.

- Use Git integration with Azure DevOps to enable version control, peer review, and traceability for Fabric artifacts.

- Use Fabric deployment pipelines to standardize promotion across Dev, Test, and Production, enforce validation gates, and reduce manual deployment errors.

- Assign clear ownership across engineering, business intelligence, and business roles to improve operational accountability.

- Define owners, remediation paths, lineage, and runbooks for data quality exceptions so you resolve issues before they affect certified models.

### Performance Efficiency

The architecture optimizes performance across storage, compute, and semantic layers to support both enterprise BI and Copilot scenarios.

- Delta and Parquet storage support efficient predicate pushdown and scalable joins for large analytical workloads.

- Gold-layer star schemas use surrogate keys, conformed dimensions, and incremental strategies to improve query performance.

- Certified semantic models with caching and aggregations reduce query latency and offload repeated computation from underlying data layers.

- The [Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) monitors storage and compute usage, analyzes scaling needs, and identifies performance bottlenecks.

### Experience Optimization

This architecture prioritizes usability, trust, and productivity for data consumers, makers, and analysts.

- Certified semantic models provide a consistent KPI and business logic surface for approved reporting and AI-assisted experiences.

- Transformation lanes aligned to skill set, such as Dataflow Gen2 for low-code makers and notebooks for engineers, help teams work efficiently within a single platform.

- Business glossary and KPI definitions tied to semantic models improve interpretability and reduce ambiguity for business users.

- Direct reporting from the Linked Dataverse Lakehouse limited to operational scenarios where minimal shaping is acceptable and enterprise semantic consistency isn't required.

Together, these considerations help keep the architecture reliable, secure, maintainable, cost-aware, performant, and easy to adopt as usage expands.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Terra Gilbert](https://www.linkedin.com/in/terra-gilbert/)**, Senior Technical Consultant

## Related resources

- [Understand medallion lakehouse architecture for Fabric with OneLake](/fabric/onelake/onelake-medallion-lakehouse-architecture)
- [Automate git integration with a service principal in Azure DevOps](/fabric/cicd/git-integration/automate-git-integration-with-service-principal)
- [Introduction to deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines)
