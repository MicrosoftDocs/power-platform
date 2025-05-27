---
title: Storage management in Dataverse and finance and operations apps
description: Learn about storage management in Dataverse and finance and operations apps.
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

# Storage management in Dataverse and finance and operations apps

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

### Finance and operations platform storage types

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

### Enabling data warehousing on Operational data
To unlock insights from operational systems, many organizations enable Azure Synapse Link, OneLake, or Data Export to replicate data from Dataverse and F&O into analytical system. While this supports advanced reporting and AI workloads, it also introduces:

- **Redundant storage** across operational and analytical layers.

    Data is often duplicated between the operational and analytical environments. This redundancy increases overall storage consumption and may lead to higher costs—especially if historical data is retained indefinitely in both systems.

- **Schema duplication** and versioning overhead.

    To maintain consistency between systems, organizations must replicate schema changes (e.g., new fields, renamed columns) across both operational and analytical layers. This adds complexity to data governance and increases the risk of schema drift, which can break downstream reports or models.

- **Increased retention** of historical data for trend analysis.

    Analytical systems typically retain data for longer periods to support trend analysis, forecasting, and regulatory reporting. While valuable, this long-term retention can lead to bloated datasets if not managed with proper archival and tiering strategies.

_Data warehousing is essential for analytics, but without lifecycle policies, it can double or triple your storage footprint._

### Enabling Search on the data
Features like Dataverse Search, Copilot Indexing, and Relevance Search require indexing large volumes of structured and unstructured data. These indexes:

- Consume log and database storage.

    Search indexes are stored in both log and database storage. As more tables and fields are marked as searchable, the index size grows proportionally. This can significantly impact overall storage usage—especially in environments with large volumes of records or frequent schema changes.

- Persist even for unused or deprecated tables.

    Even when certain tables are deprecated or no longer actively used, their associated search indexes may persist unless explicitly removed. This leads to unnecessary storage consumption and can complicate capacity planning.

- Are often duplicated across environments (e.g., dev, test, prod).

    Search indexes are typically replicated across development, test, and production environments. While this ensures consistent search behaviour, it also multiplies the storage footprint—particularly when environments are cloned or refreshed frequently.[JA8.1]

_Search improves usability and AI readiness, but index bloat is a silent contributor to storage overages._

### Enabling logging on the data
Audit logs, plugin trace logs, and telemetry are critical for compliance, debugging, and monitoring. However:

- **Log storage** grows linearly with usage and user count.
    Log data grows proportionally with:
  
  - The number of users and their activity levels
  - The volume of transactions and integrations
  - The complexity of business logic (e.g., plugins, workflows)
  
    In high-usage environments, this can lead to rapid expansion of log tables, consuming both database and log storage quotas.
  
- **Retention defaults** are often too generous (e.g., 90 days+).

    By default, many logging features retain data for extended periods (e.g., 90 days or more). While this supports long-term traceability, it can result in unnecessary storage consumption—especially when logs are not actively reviewed or exported.
  
- **System-generated logs** are billed to the customer in Dataverse.

    In Dataverse, system-generated logs—including audit logs and plugin trace logs—are counted against the customer’s storage entitlement. This means that without proper cleanup or export strategies, logging can directly contribute to storage overages and increased licensing costs.

_Logging is non-negotiable for regulated industries but must be paired with retention and export strategies (e.g., to Azure Monitor or Log Analytics)._

### Having multiple copies of the Production environment
To support development, testing, training, and troubleshooting, customers often create sandbox or cloned environments. Each copy:

- Replicates the full data and index footprint.
- May include non-obvious dependencies like search indexes, audit logs, and metadata.
- Is rarely cleaned up after use.

_Environment sprawl is a major driver of storage cost and complexity. Governance policies and automation are key to containment._

### Optimization of queries on the data
As data volumes grow and application responsiveness becomes critical, customers and ISVs often implement various query optimization techniques to improve performance in Dataverse and Dynamics 365. These strategies are especially common in reporting, analytics, and integration-heavy scenarios.

To improve performance, customers and ISVs often create:

1. Custom indexes and materialized views.

    These are used to accelerate query execution by precomputing joins or aggregations. They are particularly helpful in scenarios involving complex filters or large datasets.

1. Denormalized tables for reporting.

    To simplify reporting and reduce query complexity, developers often create flattened versions of relational data. These tables reduce the need for runtime joins and improve dashboard performance.

1. Caching layers or aggregates.

    Frequently accessed data is sometimes pre-aggregated or cached in intermediate tables or external stores to reduce load on the primary database.

While these improve responsiveness, they also:

- Icrease storage usage.

    Each optimization layer introduces additional data structures—whether it's a copy of existing data in a denormalized format, a precomputed view, or a cache table. These structures often duplicate data already stored elsewhere, leading to a larger overall storage footprint. In environments with strict storage quotas or cost-based licensing models (like Dataverse), this can quickly escalate into avoidable overages.

- Can become orphaned as apps evolve.

    As applications evolve, some optimization artifacts may no longer be referenced by active reports, dashboards, or integrations. These "orphaned" objects continue to consume storage and may even slow down system operations (e.g., during backups or indexing) if not identified and removed. Without regular audits, they can accumulate unnoticed, undermining the very performance gains they were created to support.

_Query optimization is essential for scale but must be balanced with storage hygiene and telemetry-driven tuning._

### Indexes and Their Impact on Storage
Indexes are essential for improving query performance and enabling fast data retrieval in large datasets. In both Dataverse and Dynamics 365 Finance & Operations (F&O), indexes are automatically created for primary keys and frequently queried fields, and additional custom indexes can be defined to support specific business scenarios.

While indexes are critical for performance, they also have a direct impact on storage consumption—often underestimated during solution design.

#### How Indexes Consume Storage

1. **Physical Duplication of Data**
Each index stores a copy of the indexed column(s), along with pointers to the corresponding rows. The more columns and rows indexed, the larger the index size.
1. **Growth with Data Volume**
As the underlying table grows, so does the index. In high-transaction environments, indexes can grow rapidly—especially on large, denormalized tables or those with frequent inserts and updates.
1. **Multiple Indexes per Table**
It’s common for a single table to have multiple indexes (e.g., for search, filtering, sorting, and joins). Each additional index adds to the cumulative storage footprint.
1. **Search Indexes in Dataverse**
Features like Dataverse Search and Copilot Indexing create specialized indexes that span multiple fields and tables. These are stored in the DataverseSearch table and can consume significant space—especially when enabled across multiple environments (e.g., dev, test, prod).
1. **System-Generated Indexes**
Some indexes are created automatically by the platform (e.g., for lookup fields or relationships). These may persist even if the associated tables are deprecated, unless explicitly removed.

#### Storage Implications

- Increased Database and Log Storage: Indexes contribute to both database and log storage usage, which can affect licensing costs in Dataverse.
- Environment Duplication: When environments are copied or refreshed, all indexes are duplicated—amplifying storage usage across dev/test/prod.
- Maintenance Overhead: Indexes must be updated as data changes, which can increase write latency and resource consumption.

## How I can manage the ever-growing storage
Whether you're already facing storage overages or aiming to stay ahead of them, managing data growth in Microsoft Dataverse and the Dynamics 365 Finance & Operations (F&O) Platform requires a deliberate, policy-driven approach. This section outlines two strategic entry points: reactive remediation and proactive governance.

There are two possible scenarios:

1. You want to proactively apply best practices to manage storage and avoid high costs in the future.
1. You’re already in a situation where reducing storage size and cost is necessary.

### Apply best practices to manage storage size and costs

#### Scenario 1: You Want to Proactively Apply Best Practices to Manage Storage
If you're not yet in crisis mode, now is the time apply tools and techniques to manage the storage proactively:

#### Configure analytics for your data
As organizations grow, so does the need to extract insights from operational data—without impacting the performance of core business applications. Microsoft offers multiple ways to enable analytics on Dataverse and Dynamics 365 Finance & Operations (F&O) data by integrating with your own data lake or warehouse.

Here are two powerful options to consider:

**1. Use Azure Synapse Link – Bring Your Own Lake**
Azure Synapse Link allows you to connect Dataverse directly to your own Azure Data Lake or Synapse workspace. This enables near real-time replication of operational data into an analytical environment—without writing complex ETL pipelines.

Benefits:
- Run advanced analytics and AI models on live or near-live data
- Avoid performance impact on your production systems
- Use familiar tools like T-SQL, Spark, or Power BI for reporting

**Use Case Example:** A retail company uses Synapse Link to analyse customer purchase behaviour across regions, combining Dataverse CRM data with external market data in their own lake.

**2. Use OneLake – Unified Analytics with Microsoft Fabric**
OneLake, part of Microsoft Fabric, provides a unified data lake experience where you can store and analyse data from multiple sources—including Dataverse and F&O—without duplication.

Benefits:
- Centralized storage for all analytical workloads
- Native integration with Power BI, Synapse, and AI services
- Simplified governance and security across data domains

**Use Case Example:** A financial services firm uses OneLake to consolidate operational data from F&O and Dataverse with external economic indicators, enabling real-time risk modelling and executive dashboards.

By doing this, you can decouple operational data from your core systems and enable scalable, cost-effective analytics by exporting that data to their own analytical environments—without duplicating workloads or impacting performance.

#### Tools and techniques to reduce the storage
Dataverse offers several built-in tools and strategies to help administrators manage storage efficiently and maintain system performance.

##### Dataverse 
**Environment and Data Cleanup**
- [Delete Unused Environments](delete-environment.md): You can delete an environment to recover storage space and to remove Personally Identifiable Information (PII).
- [Bulk Deletion Jobs](delete-bulk-records.md): You can delete following data in bulk:
  - Stale data or Data that is irrelevant to the business.
  - Unneeded test or sample data.
  - Data that is incorrectly imported from other systems.
  
**File and Table Optimization**
- [Reduce File Storage using Advance Find](free-storage-space.md#reduce-file-storage): This article gives you 15 methods to better manage your storage. Use one or more of these methods to control your total data storage usage. You can delete categories of data as the need arises or set up bulk deletion jobs to reoccur at set intervals. For example, you can delete notes, attachments, import history, and other data.
- [Clean up records from System Job (AsyncOperationBase) and Process Log (WorkflowLogBase) tables](cleanup-asyncoperationbase-table.md): If your organization makes heavy use of workflows or business process flows, these tables (AsyncOperationBase, WorkflowLogBase) will grow over time and eventually become large enough to introduce performance issues and consume excessive storage in your organization database. For WorkflowLogBase, you can configure to [Automatically delete completed background workflow jobs](/power-automate/best-practices-workflow-processes#automatically-delete-completed-background-workflow-jobs).

**Long-Term Retention (LTR) and Archival**
- [Data Archival: LTR](/power-apps/maker/data-platform/data-retention-overview): Microsoft Dataverse supports custom retention policies to securely retain unlimited data long term in a cost-efficient way. While Dataverse can support your business growth with no limit on active data, you might want to consider moving inactive data to the Dataverse long term retention store.
- Clean up Dataverse Tables: If you want to retain the data, but remove it from the relational storage, go to [Dataverse long term data retention](/power-apps/maker/data-platform/data-retention-overview). Otherwise, to clean up the following tables.
  - [ActivityPointerBase](manage-storage-activitypointer-base-table.nd): You can follow the steps here to clean up the table.
  - [AsyncOperationBase](manage-storage-asyncoperation-base-table.md): You can follow the steps here to clean up the table 
  - [msdyn_copilotinteraction](manage-storage-msdyn-copilotinteraction-table,md): You can follow the steps here to clean up the table.
  - [PrincipalObjectsAcces](manage-principalobjectaccess-storage.md): You can follow the steps here to clean up the table.
  - [Subscription Tracking](subscription-tracking-deleted-object-retention.md): You can follow the steps here to clean up the table.

**Search Index Optimization**
- [Reduce Dataverse Search](capacity-storage.md#what-actions-can-admins-take): You can reduce the storage size by performing all the steps in [Dataverse capacity-based storage details](capacity-storage.md#what-actions-can-admins-take).
- [Reduce the size of DataverseSearch table](capacity-storage.md#what-is-the-dataversesearch-table-and-how-can-i-reduce-it): The DataverseSearch table is the cumulative storage used by the Dataverse search index. It includes the data from all searchable, retrievable, and filterable fields of the tables you indexed for your environment. You can reduce the table size by removing Find Columns, View Columns, and Filter conditions for one or more tables. You can turn off Dataverse search to remove all indexed data.

##### Finance and operations
Finance and opertions provides flexible options for managing storage across production and sandbox environments.

**Environment Management**
- Limit the number of full Production copies: You can reduce the overall storage consumption of F&O by removing full production copies in Sandbox environments. For example, if you have five copies of Production in Sandbox, your storage consumption will be the sum of Production plus five copies of Production in Sandbox.
- Trim data in Sandbox environments: By trimming the data in the sandbox environment, you can reduce the overall storage footprint. You can follow the methods below to clean the data in the sandbox.
  - Restore process provides an opening and trimming execution
  - Write T-SQL
  - Write X++
- [Perform a transaction-less copy between environments](/unified-experience/tutorial-perform-transactionless-copy.md): Environment copy for Finance and Operations apps has traditionally involved full database duplication—including configuration, master data, and transactions—which, while useful for debugging, significantly increases storage consumption across both F&O and Dataverse. 

**Custom Cleanup and Log Management**
- Write custom cleanups as necessary: You can write custom cleanups routine as needed by your business to clean the unwanted data.
- Avoid storing logs: You can move SysDatabaseLog to less transactional database to reduce the overall storage footprint.

**Archival and Long-Term Retention**
- [Data Archival: LTR](/dynamics365/fin-ops-core/dev-itpro/sysadmin/archive-data): Finance and operations apps enable organizations to achieve the following benefits through archiving:
  - Secure historical, inactive application data for the long term to meet audit, legal, and regulatory requirements.
  - Reduce the size of the application database and the capacity that is consumed, to potentially improve application performance that's associated with very large tables.
- [Setup and manage archive data](/dynamics365/fin-ops-core/dev-itpro/sysadmin/archive-setup-manage?source=recommendations)
- [Archive customization](/dynamics365/fin-ops-core/dev-itpro/sysadmin/archive-custom)
- [Inventory transaction consolidation](/dynamics365/supply-chain/inventory/archive-inventory-transactions#view-archived-inventory-transactions)

**Built-in Cleanup Routines**
- Cleanup routines: In Microsoft Dynamics 365 Finance and Dynamics 365 Supply Chain Management, cleanup routines are available in various modules. [Cleanup routines](/dynamics365/fin-ops-core/dev-itpro/sysadmin/cleanuproutines) provides an overview of the routines that are currently available. After copying the sandbox database, run these cleanup routines proactively to remove unnecessary tables—such as batch history, logs, and retail transaction history—and to delete outdated or irrelevant data.
- [Archive credit card transaction data](/dynamics365/commerce/dev-itpro/archive-cc-data): Describes an archival job in Microsoft Dynamics 365 Commerce that can help free up space in the database by archiving credit card payment tokens.

### Reduce storage size and costs

#### Scenario 2: You Are Already in a Situation Where Reducing Storage Size and Cost Is Necessary
1. Assess What’s Consuming Storage
  - Use the Power Platform Admin Center (PPAC) and F&O Storage Reports to identify top-consuming tables, file types, and logs.
  - Leverage telemetry (if available) to attribute usage to specific apps, users, or business units.
1. Prioritize Cleanup Candidates
  - Focus on:
    - Staging and integration tables (e.g., dual-write buffers)
    - Audit logs: retain it in your own storage.
    - Unused environments or sandboxes
    - Orphaned metadata and search indexes
    - Delete what you don’t need -> bulk delete, and we have a bunch of retention policies (logs, jobs.)
1. Use Synapse Link and OneLake for Analytical reporting
  - Export the analytical data to Synapse Link
  - Use OneLake to access the retained data and business data for reporting and analytical purposes.
1. Apply Long-Term Retention (LTR)
  - Move historical data to a Managed Data Lake (MDL) using LTR policies.
  - Maintain search and analytics access via Quick Find, Synapse Link, or OneLake.

## Use cases
Use cases for storage management in Dataverse and Finance & Operations (F&O) environments are critical for optimizing database space, enhancing system performance, and meeting regulatory requirements. Below are some typical scenarios that demonstrate how these strategies can be applied:

1. Managing Growth of Historical Data
  **Scenario**: A business has been live on Dynamics 365 for several years and has accumulated large volumes of historical transactions, and attachments.
  **Action**: Implement long-term retention (LTR) strategies to retain inactive data, reduce primary database size, and maintain compliance with audit requirements.
1. Compliance-Driven Data Retention:
  **Scenario**: A regulated industry customer must retain financial or customer data for 7–10 years in a tamper-proof format.
  **Action**: Use LTR to retain the immutable, read-only data in compliance with legal and regulatory requirements, while keeping business data lean without compromising on the analytics and reporting.
1. Search and Copilot Index Optimization
  **Scenario**: Dataverse Search and Copilot indexing are enabled across all environments, including unused tables.
  **Action**: Audit searchable fields and disable indexing for low-value or deprecated tables. Monitor the size of the DataverseSearch table and optimize configurations to reduce log and database storage.
1. Audit and Telemetry Management
  **Scenario**: Plugin trace logs and audit logs are growing rapidly, consuming storage and impacting performance.
  **Action**: Export logs to external systems (e.g., Azure Monitor), and automate cleanup of old entries to maintain visibility without bloating storage.
1. Data Warehousing and Analytics Integration
  **Scenario**: The organization replicates operational data to Synapse or OneLake for analytics, leading to duplicated storage.
  **Action**: Use incremental exports, apply filters, and avoid full dataset replication to minimize redundancy while enabling rich insights.
1. Reducing Storage Overages
  **Scenario**: A customer receives a notification about exceeding their Dataverse storage quota, leading to unexpected costs.
  **Action**: Use capacity reports to identify top-consuming tables, clean up obsolete environments, and remove unused attachments or logs. Consider moving cold data to lower-cost storage tiers.
1. Optimizing Performance in Large Tables
  **Scenario**: Business-critical processes are slowing down due to large tables.
  **Action**: Archive old records, clean up system jobs (e.g., AsyncOperationBase, WorkflowLogBase).
1. Environment Lifecycle Management
  **Scenario**: Development and test environments are cloned from production, duplicating all data and indexes.
  **Action**: Trim sandbox environments post-refresh, disable unnecessary search indexing, and remove test data to reduce redundant storage consumption. Delete unused sandbox environments to save storage.

## Case studies
### Case Study 1: Reducing Storage Overages Through Index Cleanup

**Customer Profile**: A global manufacturing company using Dynamics 365 for supply chain and finance operations.

**Challenge**: The customer was experiencing unexpected storage overages and performance degradation in their production environment. Investigation revealed that multiple custom indexes and materialized views—created during early implementation—were no longer in use but still consuming significant storage.

**Solution**: The team conducted a quarterly audit of all custom indexes and removed those not referenced by active queries or reports. They also implemented a governance policy to review new index requests before deployment.

**Outcome:**
- Reduced database storage by 28%
- Improved query performance by 15%
- Avoided a projected $12K/year in additional storage costs

### Case Study 2: Archiving Historical Data to Meet Compliance and Performance Goals

**Customer Profile**: A financial services firm using Dataverse and Dynamics 365 for customer onboarding and case management.

**Challenge**: The firm needed to retain customer records for 7+ years to meet regulatory requirements, but the growing volume of inactive data was slowing down active workflows and increasing storage costs.

**Solution**: The customer implemented a long-term retention (LTR) strategy using Dataverse’s archival capabilities. Inactive records were moved to a read-only, cost-optimized storage tier, while active data remained in high-performance storage.

**Outcome**:

- Archived over 1.2 million records
- Reduced primary database size by 40%
- Maintained full auditability and compliance with retention policies

### Case Study 3: Streamlining Search Indexes Across Environments

**Customer Profile**: A retail organization with multiple Dataverse environments (dev, test, prod) supporting a Copilot-enabled CRM solution.

**Challenge**: Search indexes were enabled across all environments, including unused tables and test data. This led to bloated DataverseSearch tables and unnecessary storage consumption.

**Solution**: The team reviewed searchable fields and disabled indexing on non-critical tables in dev/test environments. They also automated index cleanup during environment refreshes.

**Outcome**:

- Reduced search index storage by 35%
- Improved environment refresh times by 20%
- Lowered overall log and database storage usage

### Case Study 4: Leveraging Data Export for Analytics Without Duplicating Storage

**Customer Profile**: A healthcare provider using Dynamics 365 and Dataverse for patient engagement and billing.

**Challenge**: The analytics team needed access to operational data for trend analysis and AI modelling, but duplicating data into a separate warehouse was increasing storage costs and complexity.

**Solution**: The customer enabled Azure Synapse Link with incremental export and tiered storage in OneLake. They retained only essential analytical data and applied retention policies to manage historical depth.

**Outcome**:
- Enabled real-time analytics without impacting operational systems
- Reduced redundant storage by 45%
- Improved governance over analytical data lifecycle

## Conclusion
Effective storage management is crucial for maintaining system performance and optimizing resource utilization in Microsoft Dynamics 365 environments. The cleanup routines and archival jobs outlined here provide robust solutions to free up valuable database space and streamline operations. By leveraging these tools like LTR and techniques, customers can address common storage challenges and create sustainable data management practices. Furthermore, real-world case studies demonstrate the efficacy of these approaches, offering insights into their practical applications. Adopting these strategies will empower organizations to proactively manage their storage needs and enhance overall efficiency.

## References
Storage Clean up Dataverse: 

- [Free up storage space](free-storage-space.md)
- [Clean up records from System Job (AsyncOperationBase) and Process Log (WorkflowLogBase) tables](cleanup-asyncoperationbase-table.md)

Storage Clean up in finance and operations:
- [Finance and operations storage capacity](finance-operations-storage-capacity.md)
- [Cleanup routines in Dynamics 365 Finance and Dynamics 365 Supply Chain Management](/dynamics365/fin-ops-core/dev-itpro/sysadmin/cleanuproutines)
- [Archive credit card transaction data - Commerce](/dynamics365/commerce/dev-itpro/archive-cc-data)

Storage capacity:
- [Dataverse capacity-based storage details](capacity-storage.md)
- [Finance and operations storage capacity](finance-operations-storage-capacity.md)


   



















