---
title: Storage management in Dataverse and finance and operations
description: Learn about storage management in Dataverse and finance and operations
author: ritesp
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/27/2025
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Storage management in Dataverse and finance and operations

As organizations accelerate their digital transformation journeys, the ability to manage data effectively becomes a strategic business imperative. With the rise of AI-powered applications and Copilot-driven workflows, enterprises are generating and consuming data at unprecedented rates. This data fuels innovation, enables personalized experiences, and supports critical decision-making—but only if it is governed and stored intelligently.

To support these evolving business needs, organizations must adopt a proactive storage management strategy. This ensures that data no longer required for day-to-day operations is handled responsibly freeing up capacity for high-value workloads, reducing operational friction, and aligning with compliance and audit requirements.

From a technical standpoint, effective storage management in Dataverse and Dynamics 365 enhances system performance, improves cost efficiency, and ensures adherence to long-term retention (LTR) policies. Both platforms offer tools and automation capabilities that empower organizations to manage storage.

By implementing the strategies outlined in this paper, enterprises can reduce support overhead, streamline compliance, and unlock greater value from their business applications—turning storage from a constraint into a competitive advantage.

## Key benefits
Effective storage management in Dataverse and Dynamics 365 provides several key benefits that address common customer pain points and enhance overall operational efficiency.

- **Increased compliance with LTR**: [RG1.1]Effective storage management ensures that data is stored in compliance with LTR policies. This not only helps in meeting regulatory requirements but also ensures that critical data is preserved and accessible when needed.
- **Improved performance**: By optimizing storage management, organizations can significantly enhance the performance of their systems. Efficient storage allocation and management reduce latency and improve the speed of data retrieval, leading to smoother and faster operations.
- **Driving cost efficiency**: Effective storage management empowers organizations to focus on high-value data by streamlining and decluttering their storage landscape. By retaining only what’s necessary, businesses can optimize their storage footprint—leading to smarter resource utilization and cost-effective scalability.

## Background
As organizations grow and digitize more of their operations, the volume of business data stored in systems like Dataverse and Dynamics 365 increases steadily. This includes not only active transactional data but also historical records that must be retained for audit, regulatory, or business continuity purposes. Over time, this accumulation can lead to performance degradation, increased operational overhead, and rising storage costs—especially when data that is no longer actively used remains in high-performance storage tiers.

A well-defined storage management strategy helps organizations address these challenges by identifying data that can be archived, cleaned up, or moved to lower-cost, read-optimized storage. This is particularly important for compliance scenarios where data must remain immutable, low-access, and read-only—such as financial records, audit logs, or regulatory filings. Ensuring that such data is retained in a compliant manner, without impacting the performance of live systems, is a key requirement for many enterprises.

By leveraging the tools and strategies available in both platforms, organizations can gain better visibility into their storage footprint, reduce unnecessary consumption, and ensure that compliance-critical data is handled appropriately.

This document outlines practical approaches to storage management that help customers align their data retention practices with business and regulatory needs—improving system performance, reducing operational overhead, and ensuring that compliance obligations are met without compromise.

## Why we store data
To select and optimise the right data retention pattern for your data, it is valuable to reflect on the reasons and uses for which we stored data.

### Operational data
With a business application, operational data is what is used to execute the business tracking sales, or financial or supply chain actions. 

This data needs to be accessed in real time supporting customer and internal operational processes of the business recording granular actions such as interactions with customers, orders or inventory activities. 

Over time operational data may move from being actively used to infrequently used but would need to be accessible in near real time assisting a customer in an order or support case e.g. 
- from a customer placing an order to one who has not interacted with the business for some time
- Each order that has been placed and is being shipped being accessed constantly to < 1% of orders one that under a warranty period of 3 years may need to be referenced for support and possibly requiring a refund

This may lead to phases of operational data access needs such as:

- < 1 year of actively accessed data
- < 3 years of infrequently accessed data
- > 3 years where data is no longer operationally accessed

The real time nature of operational storage does make that relatively expensive compared to other storage, so recognising where data needs to be accessed operationally and where it does not is important for defining retention strategies.

### Operational Integration

As a specialised category of operational use, data may be required to be replicated between multiple operational systems, including patterns such as:

- Banking: CRM for front line customer interactions and replication to multiple banking systems (current accounts, credit cards, mortgage, credit check systems)
- Manufacturing: CRM for front line order taking and ERP for supply chain management
- Police emergency handling: CRM for citizen interactions and Dispatch systems for police offer deployment management

In these cases, while each system may have unique data it tracks, there is often common master data needing to be shared between them and kept in sync leading to integration needs

### Audit data
A business typically has regulatory responsibility to keep data for extended periods (e.g. for 7 years on average) for audit purposes, whether internal or external, such as supporting financial auditing, regulatory disclosure or fraud review.

This data would typically span both data needed for operational purposes and data that is no longer needed as it allows review across the data set from one place.

### Analytics data
Organizations also have a need to review and analyse the state of their business, measuring and comparing over time as well as spanning multiple or all parts of the business. 

The large periods and breadth of data over which this analysis can occur leads to the need to replicate operational data into specialist analytics tools. This avoids complex analytics from affecting the performance of operational systems but also allows analysis across data sets that go beyond the period for which data is needed operationally e.g. over 7 years rather than over 1-2 years. Differing analytics needs however may need the full data retention periods or only span the data retained in operational systems 

It also typically allows for aggregation of data across multiple parts of the business, so combines data fed from multiple systems.

### Flow of data

The data of these types typically flow over time as follows:

:::image type="content" source="media/flow-of-data.png" alt-text="The flow of data." lightbox="media/flow-of-data.png":::

## Different types of Storage

### Dataverse storage types
Dataverse organizes storage into three main categories, each with distinct usage patterns and billing implications:

| Storage type | Description | Common use cases|
|-------------|--------------|-----------------|
|Database storage | Stores structured data in tables (standard and custom). | Business records, metadata, relationships, and configurations. |
| File storage | Stores attachments and binary data. | Email attachments, images, documents uploaded via Power Apps. | 
| Log storage | Stores audit logs and plugin trace logs. | Change tracking, auditing, diagnostics, and compliance. |

Finance and operations platform storage types

Finance and operations storage is managed separately but is increasingly being integrated into the Power Platform ecosystem. It includes:

| Storage type | Description | Common use cases|
|-------------|--------------|-----------------|
| Operational database storage | Core transactional data for finance, supply chain, HR, etc.| Ledger entries, inventory, customer orders. |
| Document management storage | Binary large objects (BLOBs) stored in Azure Blob Storage. | Invoices, receipts, scanned documents. |
| Telemetry and diagnostic logs | System logs and telemetry data. | Performance monitoring, issue diagnostics. |

Shared & Integrated Storage Scenarios

1. Dual-write Storage
    - Enables real-time sync between Dataverse and F&O.
    - Requires careful role and capacity management to avoid duplication or overuse.

1. Long-Term Retention (LTR)
    - Moves historical data to a Managed Data Lake (MDL).
    - Reduces primary storage usage while maintaining compliance and analytics access.
    - Integrates with:
      - Quick Find (Dataverse-native search)
      - OneLake (Fabric-based analytics)
      - Synapse Link (custom lake analytics)

## How your data grows over time
As organizations scale their use of Microsoft Dataverse and the Dynamics 365 Finance & Operations (F&O) Platform, data growth becomes both a sign of success and a strategic challenge. What begins as a lean, transactional dataset can quickly evolve into a complex, multi-layered data estate. This section explores five key drivers of data growth and their implications for storage, performance, and governance.

### Enabling data warehousing on Operational data[RP6.1][RP6.2]
To unlock insights from operational systems, many organizations enable Azure Synapse Link, OneLake, or Data Export to replicate data from Dataverse and F&O into analytical system. While this supports advanced reporting and AI workloads, it also introduces:

- **Redundant storage** across operational and analytical layers.
Data is often duplicated between the operational and analytical environments. This redundancy increases overall storage consumption and may lead to higher costs—especially if historical data is retained indefinitely in both systems.
- **Schema duplication** and versioning overhead.
To maintain consistency between systems, organizations must replicate schema changes (e.g., new fields, renamed columns) across both operational and analytical layers. This adds complexity to data governance and increases the risk of schema drift, which can break downstream reports or models.
- **Increased retention** of historical data for trend analysis.
Analytical systems typically retain data for longer periods to support trend analysis, forecasting, and regulatory reporting. While valuable, this long-term retention can lead to bloated datasets if not managed with proper archival and tiering strategies.

“Data warehousing is essential for analytics, but without lifecycle policies, it can double or triple your storage footprint.”

Enabling Search on the data[RP7.1][RP7.2]
Features like Dataverse Search, Copilot Indexing, and Relevance Search require indexing large volumes of structured and unstructured data. These indexes:
•	Consume log and database storage.
Search indexes are stored in both log and database storage. As more tables and fields are marked as searchable, the index size grows proportionally. This can significantly impact overall storage usage—especially in environments with large volumes of records or frequent schema changes.
•	Persist even for unused or deprecated tables.
Even when certain tables are deprecated or no longer actively used, their associated search indexes may persist unless explicitly removed. This leads to unnecessary storage consumption and can complicate capacity planning.
•	Are often duplicated across environments (e.g., dev, test, prod).
Search indexes are typically replicated across development, test, and production environments. While this ensures consistent search behaviour, it also multiplies the storage footprint—particularly when environments are cloned or refreshed frequently.[JA8.1]
“Search improves usability and AI readiness, but index bloat is a silent contributor to storage overages.”

Enabling logging on the data[RP9.1][RP9.2]
Audit logs, plugin trace logs, and telemetry are critical for compliance, debugging, and monitoring. However:
•	Log storage grows linearly with usage and user count.
Log data grows proportionally with:
•	The number of users and their activity levels
•	The volume of transactions and integrations
•	The complexity of business logic (e.g., plugins, workflows)
In high-usage environments, this can lead to rapid expansion of log tables, consuming both database and log storage quotas.
•	Retention defaults are often too generous (e.g., 90 days+).
By default, many logging features retain data for extended periods (e.g., 90 days or more). While this supports long-term traceability, it can result in unnecessary storage consumption—especially when logs are not actively reviewed or exported.
•	System-generated logs are billed to the customer in Dataverse.
In Dataverse, system-generated logs—including audit logs and plugin trace logs—are counted against the customer’s storage entitlement. This means that without proper cleanup or export strategies, logging can directly contribute to storage overages and increased licensing costs.
“Logging is non-negotiable for regulated industries but must be paired with retention and export strategies (e.g., to Azure Monitor or Log Analytics).”
Having multiple copies of the Production environment[RP10.1][RP10.2]
To support development, testing, training, and troubleshooting, customers often create sandbox or cloned environments. Each copy:
•	Replicates the full data and index footprint.
•	May include non-obvious dependencies like search indexes, audit logs, and metadata.
•	Is rarely cleaned up after use.
“Environment sprawl is a major driver of storage cost and complexity. Governance policies and automation are key to containment.”

Optimization of queries on the data
As data volumes grow and application responsiveness becomes critical, customers and ISVs often implement various query optimization techniques to improve performance in Dataverse and Dynamics 365. These strategies are especially common in reporting, analytics, and integration-heavy scenarios.
To improve performance, customers and ISVs often create:
1.	Custom indexes and materialized views.
These are used to accelerate query execution by precomputing joins or aggregations. They are particularly helpful in scenarios involving complex filters or large datasets.
2.	Denormalized tables for reporting.
To simplify reporting and reduce query complexity, developers often create flattened versions of relational data. These tables reduce the need for runtime joins and improve dashboard performance.
3.	Caching layers or aggregates.
Frequently accessed data is sometimes pre-aggregated or cached in intermediate tables or external stores to reduce load on the primary database.
While these improve responsiveness, they also:
•	Increase storage usage.
Each optimization layer introduces additional data structures—whether it's a copy of existing data in a denormalized format, a precomputed view, or a cache table. These structures often duplicate data already stored elsewhere, leading to a larger overall storage footprint. In environments with strict storage quotas or cost-based licensing models (like Dataverse), this can quickly escalate into avoidable overages.
•	Can become orphaned as apps evolve.
As applications evolve, some optimization artifacts may no longer be referenced by active reports, dashboards, or integrations. These "orphaned" objects continue to consume storage and may even slow down system operations (e.g., during backups or indexing) if not identified and removed. Without regular audits, they can accumulate unnoticed, undermining the very performance gains they were created to support.
“Query optimization is essential for scale but must be balanced with storage hygiene and telemetry-driven tuning.”

Indexes [RP11.1][RP11.2]and Their Impact on Storage
Indexes are essential for improving query performance and enabling fast data retrieval in large datasets. In both Dataverse and Dynamics 365 Finance & Operations (F&O), indexes are automatically created for primary keys and frequently queried fields, and additional custom indexes can be defined to support specific business scenarios.
While indexes are critical for performance, they also have a direct impact on storage consumption—often underestimated during solution design.
📦 How Indexes Consume Storage
1.	Physical Duplication of Data
Each index stores a copy of the indexed column(s), along with pointers to the corresponding rows. The more columns and rows indexed, the larger the index size.
2.	Growth with Data Volume
As the underlying table grows, so does the index. In high-transaction environments, indexes can grow rapidly—especially on large, denormalized tables or those with frequent inserts and updates.
3.	Multiple Indexes per Table
It’s common for a single table to have multiple indexes (e.g., for search, filtering, sorting, and joins). Each additional index adds to the cumulative storage footprint.
4.	Search Indexes in Dataverse
Features like Dataverse Search and Copilot Indexing create specialized indexes that span multiple fields and tables. These are stored in the DataverseSearch table and can consume significant space—especially when enabled across multiple environments (e.g., dev, test, prod).
5.	System-Generated Indexes
Some indexes are created automatically by the platform (e.g., for lookup fields or relationships). These may persist even if the associated tables are deprecated, unless explicitly removed.
⚠️ Storage Implications
•	Increased Database and Log Storage: Indexes contribute to both database and log storage usage, which can affect licensing costs in Dataverse.
•	Environment Duplication: When environments are copied or refreshed, all indexes are duplicated—amplifying storage usage across dev/test/prod.
•	Maintenance Overhead: Indexes must be updated as data changes, which can increase write latency and resource consumption.

Indexes to support search[































