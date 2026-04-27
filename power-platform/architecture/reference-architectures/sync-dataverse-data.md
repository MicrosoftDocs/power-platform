---
title: Synchronize data across Dataverse environments using Power Platform
description: Learn how to manage master data across two Dataverse environments using Power Automate cloud flows and Power Platform dataflows.
#customer intent: As a Power Platform user, I want to learn how to build a solution for synchronizing master data from a primary to a secondary Dataverse environment so that I can ensure reliable master data management without high complexity.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center  
ms.topic: example-scenario  
ms.date: 04/24/2026
---

# Synchronize data across Dataverse environments using Power Platform

This reference architecture shows how to synchronize master data between two Dataverse environments by using Power Automate and dataflows in Power Platform. It demonstrates a one-to-one synchronization pattern where one environment acts as the authoritative source and another receives data.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to maintain master data in one Dataverse environment and synchronize to another. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/sync-dataverse-data/sync-dataverse-data.png" alt-text="Diagram of master data sync from a primary to a secondary Dataverse environment using Power Automate cloud flows and Power Platform dataflows." lightbox="media/sync-dataverse-data/sync-dataverse-data.png":::

## Workflow

1. **Event-driven synchronization via Power Automate**

    - CRUD actions in the primary Dataverse environment trigger Power Automate flows.

    - Event-driven synchronization in a two-step flow chain:

        1. A cloud flow that sends an HTTP POST to a published endpoint.
        1. A cloud flow that acts as a subscriber triggers by that webhook, processes the payload, and applies the update in the secondary Dataverse environment in near real-time.

    - Endpoints are parameterized for application lifecycle management (ALM) and security groups manage access.

1. **Bulk synchronization via dataflows**

    - The secondary Dataverse environment contains the dataflows.

    - Each dataflow connects to the primary Dataverse environment as its data source.

    - Dataflows run on a fixed schedule (for example, nightly or after another dataflow runs successfully) or on demand (for example, for initial setup).

    - Upserts are performed by using an alternate key to avoid duplicates. This updates existing data and inserts new records when no match exists.

    - Status fields are managed through a dedicated "sync status" column. A Power Automate flow updates the actual status field accordingly. This flow runs after the dataflow. It's needed because a dataflow can't change row statuses or delete records that are removed (absent) in the primary Dataverse environment.

1. **Error handling and reconciliation**

    - Nightly dataflows in the secondary environment correct any missed or failed event-driven updates.

    - Manual intervention might be required for data quality problems (for example, missing keys).

## Components

- [**Microsoft Dataverse**](/power-apps/maker/data-platform/): Two environments.

- [**Dataflows for Power Platform**](/power-query/dataflows/create-use): Bulk extract, transform, and load (ETL) for scheduled synchronization, configured in the secondary environment.

- [**Power Automate cloud flows**](/power-automate/overview-cloud): Fast, record-specific updates and complements certain limitations of dataflows. For example, it can trigger a dataflow when another dataflow successfully completes (such as when one table contains a lookup field to another, and that referenced record must already exist in the secondary Dataverse environment); send an error message when a dataflow fails; update record statuses; and delete records.

- [**Security Groups**](/power-platform/admin/control-user-access) and **Service Accounts**: Access management and ownership.

### Why use these components?

- Dataflows are ideal for bulk sync and initial setup.

- Power Automate provides fast, record-specific updates.

## Scenario details

This architecture is designed for a one-to-one relationship: a single master data management (MDM) environment linked to another single environment. Scenarios where one master environment must synchronize with multiple other environments require a more scalable or distributed solution.

### Business problem

This solution addresses the challenge of synchronizing multiple tables between two distinct Dataverse environments. The primary environment acts as the authoritative source, while the secondary environment contains existing tables that you must populate and update with master data.

The alternative to use virtual tables isn't feasible when the secondary system's tables already exist and require row-level security.

### Example use case

A leisure and hospitality organization manages its core master data, such as hotels and room inventories, in a dedicated Dataverse environment. The primary environment includes a model-driven app that the master data management team uses exclusively to maintain accurate and up-to-date operational information.

A separate department within the same organization is responsible for several financial and reconciliation processes. To streamline these processes, the department wants to build its own model-driven app in an isolated Dataverse environment. However, their application still requires access to foundational master data such as hotels and rooms details.

The team evaluated virtual tables but rejected them because the financial team needed to enrich these records with their own department-specific attributes, governed by strict row-level security.

Embedding the financial app inside the primary MDM environment isn't an option either. Allowing financial makers or administrators into the MDM environment would unintentionally expose connectors, solutions, API permissions, and sensitive data, which must remain restricted to the MDM development team.

These requirements led the organization to adopt the synchronization architecture described in this article.

### Value created

This architecture delivers a robust and maintainable solution for synchronizing master data between two Dataverse environments, even when virtual tables aren't an option. Direct population and updates of existing tables in the secondary environment, ensures data consistency and operational reliability.

The approach uses only Power Platform components, such as dataflows and Power Automate, resulting in a solution that's simple to deploy, easy to manage, and avoids unnecessary complexity.

Because the architecture is tailored for a one-to-one environment relationship, it minimizes overhead and maximizes transparency. It's ideal for organizations that require a straightforward, dependable master data synchronization without the need for large-scale, multi-environment management.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, which is a set of guiding tenets that can be used to improve the quality of a workload. For more information, see [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Reliability

- Nightly dataflows guarantee consistency.

- Event-driven flows provide fast updates.

- Manual monitoring for data quality issues.

### Security

- Use of service accounts and security groups for access control. When using dataflows, it isn't possible to assign service principals as owners.

- Parameterized HTTP endpoints for ALM compatibility.

- Dataflows run in isolated solutions. There's a specific reason for isolating dataflows in a dedicated solution: after each deployment, you must manually re-establish the dataflow connection. By placing dataflows in a separate solution that only needs to be deployed when changes to the dataflows are required, you avoid unnecessary manual work when deploying other components of the main solution.

### Operational Excellence

- Automated scheduling and orchestration of dataflows.

- Monitoring and alerting for failed syncs.

### Performance Efficiency

- Dataflows optimized for bulk operations.

- Event‑driven Power Automate flows minimize latency for critical, record‑level updates. When designing event‑driven flows, ensure that action volume and concurrency remain within Power Automate service limits. High‑frequency CRUD activity can trigger throttling, especially in scenarios where flows execute tens of thousands of actions per day. For business‑critical or high‑throughput integrations, apply appropriate Power Automate licensing to increase throughput limits and [avoid unexpected throttling](/power-automate/guidance/coding-guidelines/understand-limits). This approach reduces escalation risks and ensures predictable performance.

### Experience Optimization

- Requires minimal manual intervention.

- Clearly separates bulk and event-driven syncs.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Lothar van Diessen](https://www.linkedin.com/in/lotharvandiessen/)**, Solution Architect  

## Related resources

- [What are dataflows?](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365)
- [Power Automate templates for the dataflows connector](/power-query/dataflows/dataflow-power-automate-connector-templates)
- [Dataverse as a master data system](/dynamics365/guidance/reference-architectures/dataverse-master-data-system)
- [Understand platform limits and avoid throttling](/power-automate/guidance/coding-guidelines/understand-limits)
- [CRM data migration to Dataverse: Key insights and best practices](/power-platform/architecture/key-concepts/data-migration/)
- [Migrate data between Microsoft Dataverse environments by using the dataflows OData connector](/power-apps/developer/data-platform/dataverse-odata-dataflows-migration)
