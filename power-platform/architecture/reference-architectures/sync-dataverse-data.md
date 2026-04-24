---
title: Dual Dataverse Synchronization for Master Data Management, Without Azure Complexity
description: Learn how to manage master data across two Dataverse environments using Power Automate could flows and Power Platform dataflows.
#customer intent: As a Power Platform user, I want to learn how to build a solution for synchronizing master data from a primary to a secondary Dataverse environment so that I can ensure reliable master data management without high complexity.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center  
ms.topic: example-scenario  
ms.date: 04/24/2026
ms.topic: reference-architecture
---

## Dual Dataverse Synchronization for Master Data Management, Without Azure Complexity

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to ​maintain master data in one Dataverse environment and synchoronize data to another. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/sync-dataverse-data/sync-dataverse-data.png" alt-text="Diagram of master data sync from a primary to a secondary Dataverse environment using Power AUtomate cloud flows and Power Platform dataflows." lightbox="media/sync-dataverse-data/sync-dataverse-data.png":::

## Example Use Case

A leisure and hospitality organization manages its core master data (such as hotels and room inventories) in a dedicated Dataverse environment. This primary environment is supported by a model‑driven app used exclusively by the Master Data Management team to maintain accurate and up‑to‑date operational information.

A separate department within the same organization is responsible for several financial and reconciliation processes. To streamline these processes, the department wanted to build its own model‑driven app in an isolated Dataverse environment. However, their application still required access to foundational master data such as hotels and rooms details.

Virtual tables were evaluated but rejected because the financial team needed to enrich these records with their own department‑specific attributes, governed by strict row‑level security.

Embedding the financial app inside the primary MDM environment was also not an option. Allowing financial makers or administrators into the MDM environment would unintentionally expose connectors, solutions, API permissions, and sensitive data which must remain restricted to the MDM development team.

These requirements led the organization to adopt the synchronization architecture described in this article.

## Workflow

1. **Event-Driven Synchronization via Power Automate**

- CRUD actions in the Primary Dataverse environment trigger Power Automate flows.

- Event‑driven synchronization is implemented as a two‑step flow chain: the first flow sends an HTTP POST to a published endpoint, and a second, subscriber flow (triggered by that webhook) processes the payload and applies the update in the Secondary Dataverse environment in near real‑time.

- Endpoints are parameterized for ALM; security groups manage access.

1. **Bulk Synchronization via Dataflows**

- The Secondary Dataverse environment contains the dataflows.

- Each dataflow connects to the Primary Dataverse environment as its data source.

- Dataflows run on a fixed schedule (e.g., nightly or after another dataflow has run successfully) or on-demand (e.g., for initial setup).

- Upserts (update if exists, insert if not) are performed using an alternate key to avoid duplicates.

- Status fields are managed via a dedicated “sync status” column; a Power Automate flow then updates the actual status field accordingly. This additional Power Automate flow after the dataflow run is necessary because a dataflow cannot change row statuses or delete records that have been removed (are absent) in the primary Dataverse environment.

1. **Error Handling and Reconciliation**

- Nightly dataflows in the Secondary environment correct any missed or failed event-driven updates.

- Manual intervention may be required for data quality issues (e.g., missing keys).

## Use case details

### Business Problem

This solution addresses the challenge of synchronizing multiple tables between two distinct Dataverse environments. The primary environment acts as the authoritative source (server-side), while the secondary environment (client-side) contains existing tables that must be populated and updated with master data.

Using virtual tables is not feasible in this scenario, as the secondary system’s tables already exist and require row-level security.

Importantly, this architecture is designed for a one-to-one relationship: a single master data management environment linked to a single client environment. It is not intended for scenarios where one master environment must synchronize with multiple client environments, as such cases would require a more scalable or distributed solution.

### Value Created

This architecture delivers a robust and maintainable solution for synchronizing master data between two Dataverse environments, even when virtual tables are not an option. By enabling direct population and updates of existing tables in the secondary environment, it ensures data consistency and operational reliability.

The approach leverages only Power Platform components (Dataflows and Power Automate) resulting in a solution that is simple to deploy, easy to manage, and avoids unnecessary complexity.

Because it is tailored for a one-to-one environment relationship, this architecture minimizes overhead and maximizes transparency, making it ideal for organizations that require a straightforward, dependable master data synchronization without the need for large-scale, multi-environment management.

## Components

- **Microsoft Dataverse**: 2 environments

- **Dataflows for Power Platform**: Bulk ETL for scheduled synchronization, configured in the Secondary environment.

- **Power Automate**: It provides fast, record-specific updates and complements certain limitations of dataflows. For example, it can trigger a dataflow when another dataflow has successfully completed (such as when one table contains a lookup field to another, and that referenced record must already exist in the secondary Dataverse environment); send an error message when a dataflow fails; update record statuses; and delete records.

- Security Groups & Service Accounts: Access management and ownership.

Why These Components?

- Dataflows are ideal for bulk sync and initial setup.

- Power Automate provides fast, record-specific updates.

- No Azure components: a conscious choice for simplicity and lower maintenance.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, which is a set of guiding tenets that can be used to improve the quality of a workload. For more information, see [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

Here is an Azure example of considerations for inspiration: [Model loan credit risk and default probability](/azure/architecture/example-scenario/ai/loan-credit-risk-analyzer-default-modeling#considerations).

### Reliability

- Nightly dataflows guarantee consistency.

- Event-driven flows provide fast updates.

- Manual monitoring for data quality issues.

### Security

- Use of service accounts and security groups for access control. When using dataflows, it is not possible to assign service principals as owners.

- Parameterized HTTP endpoints for ALM compatibility.

- Dataflows run in isolated solutions. There is a specific reason for isolating dataflows in a dedicated solution: after each deployment, the dataflow connection must be re-established manually. By placing dataflows in a separate solution that only needs to be deployed when changes to the dataflows are required, you avoid unnecessary manual work when deploying other components of the main solution.

### Operational Excellence

- Automated scheduling and orchestration of dataflows.

- Monitoring and alerting for failed syncs.

### Performance Efficiency

- Dataflows optimized for bulk operations.

- Event‑driven Power Automate flows minimize latency for critical, record‑level updates. When designing event‑driven flows, ensure that action volume and concurrency remain within Power Automate service limits. High‑frequency CRUD activity can trigger throttling, especially in scenarios where flows execute tens of thousands of actions per day. For business‑critical or high‑throughput integrations, apply appropriate Power Automate licensing to increase throughput limits and [avoid unexpected throttling](https://learn.microsoft.com/en-us/power-automate/guidance/coding-guidelines/understand-limits). This reduces escalation risks and ensures predictable performance.

### Experience Optimization

- Minimal manual intervention required.

- Clear separation of bulk and event-driven syncs.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Lothar van Diessen](https://www.linkedin.com/in/lotharvandiessen/)**, Solution Architect  

## Related resources

- [An overview of dataflows across Microsoft Power Platform and Dynamics 365 products - Power Query \| Microsoft Learn](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365)
- [Power Automate templates for the dataflows connector - Power Query \| Microsoft Learn](/power-query/dataflows/dataflow-power-automate-connector-templates)
- [Dataverse as a master data system - Dynamics 365 \| Microsoft Learn](/dynamics365/guidance/reference-architectures/dataverse-master-data-system)
- [Understand platform limits and avoid throttling - Power Automate \| Microsoft Learn](/power-automate/guidance/coding-guidelines/understand-limits)
