---
title: Recommendations for optimizing data performance
description: Learn how to optimize data access, retrieval, storage, and processing operations to enhance the overall performance of your workload.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: robstand
ms.date: 05/10/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Recommendations for optimizing data performance

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:08](checklist.md)|**Optimize data performance. Optimize data stores for their intended and actual use in the workload.**|
|---|---|

This guide describes the recommendations for optimizing data performance. Optimizing data performance is about refining the efficiency with which the workload processes and stores data. Every workload operation, transaction, or computation typically relies on the quick and accurate retrieval, processing, and storage of data. When data performance is optimized, the workload runs smoothly. Compromised data performance creates a domino effect of poor performance efficiency. Failure to optimize data performance results in response delays, heightened latency, and curtailed scalability. It jeopardizes the efficiency of the entire workload.

**Definitions**

| Term | Definition |
|---|---|
| Data store | A resource that stores data such as a database, object store, or file share. |
| Index | A database structure that provides quick access to items. |
| Online analytical processing (OLAP) | A technology that organizes large business databases, supports complex analysis, and performs complex analytical queries without negatively affecting transactional systems. |
| Online transaction processing (OLTP) | A technology that records business interactions as they occur in day-to-day operations of an organization. |
| Partitioning | The process of physically dividing data into separate data stores. |
| Query tuning | A process that optimizes the speed of a database query. |

## Key design strategies

To optimize data usage, ensure that data stores are optimized for their intended use and for their actual use in a workload. Optimized data usage can improve query performance, reduce resource consumption, and enhance overall system efficiency. Consider the following strategies:

- _Profile data._ Understand your data and ensure that your data model is well-suited for your workload. Consider factors such as data normalization and partitioning techniques. For efficient data retrieval, ensure that you select appropriate data types and define relationships between tables.
- _Optimize query performance._ Analyze and optimize queries that run in the workload. Use techniques such as query optimization, and caching. Use server-side views to prefilter data. To identify bottlenecks, use performance monitoring tools, and then make necessary improvements.
- _Regularly monitor and tune the system._ Continuously monitor the performance of your workload and iterate on the data storage configuration and query optimizations. Based on performance tuning best practices, analyze system metrics, identify areas of improvement, and implement changes. As data grows, you might have to update your queries to remain performant. 

### Profile data

Data profiling involves examining the data from a source and gathering information about it. The objective is to understand the quality, structure, and characteristics of workload data. This process allows for the identification of issues such as missing values, duplicates, inconsistent formats, and other anomalies. For effective data profiling, consider the following strategies:

- _Understand the data structure._ Examine the structure of your data, including tables, columns, and relationships. Determine the data types, lengths, and constraints that are applied to each column. Data structure evaluation helps you understand how the data is organized and how it relates to other data elements.
- _Analyze the data volume._ Assess the volume of your data to understand the overall size and growth patterns. Determine the number of records or documents and the size of individual tables or collections. This information helps you estimate storage requirements and identify scalability issues.
- _Identify data relationships._ Explore the relationships between data elements. Understand how data is connected, so you can determine how changes in one table or document might affect related data.
- _Assess data quality._ Evaluate the quality of your data by examining factors such as completeness, accuracy, consistency, and uniqueness. Identify data anomalies, missing values, or duplicate records that might affect data integrity and query performance. This step helps you identify areas for data cleansing and improvement.
- _Capture data distribution._ Analyze the distribution of values within each column to determine data patterns. Identify frequent and rare values, outliers, and data skews. To optimize query performance, analyze if alternate keys would be appropriate to provide improved performance..

### Monitor data performance

Data performance monitoring is the practice of consistently tracking the efficiency of data stores. It involves collecting and analyzing performance metrics specific to data operations, using tools tailored for system-level, database-specific, or third-party monitoring solutions. Effective data performance monitoring allows you to proactively identify and mitigate potential bottlenecks, ensuring that data-related processes and tasks are efficient. To monitor data performance, consider the following strategies:

- _Collect data-specific metrics._ Gather key metrics that directly relate to data performance. These metrics include query response times and data throughput.
- _Set up_ _data alerts._ Set up alerts specifically for data metrics. Use predefined thresholds or anomalies in these metrics to trigger alerts. Alerts enable you to receive notifications when performance metrics exceed acceptable ranges or show abnormal behavior. For instance, if a database query takes longer than expected or if data throughput drops significantly, it would trigger an alert. You can set up these alerts using specialized monitoring tools or custom scripts.
- _Diagnose data performance issues._ Regularly review the collected data metrics to pinpoint potential performance bottlenecks or degradation in data operations. Visualization tools or dashboards can be invaluable in this process, helping to highlight trends, bottlenecks, and outliers in data performance. Once identified, delve into the root causes of these issues and strategize appropriate remediation steps.

### Partition data

Partitioning involves dividing large datasets or high-volume workloads into smaller, manageable subsets. Partitioning enhances data performance efficiency by distributing the workload and improving parallel processing. It also ensures more effective data access based on specific needs and query patterns. You can partition data vertically or horizontally (also called sharding). For example, if using Dataverse Elastic tables consider what should be the partitioning key.

| Strategy | Definition | Example | Use cases |
|---|---|---|---|
| **Vertical partitioning** | Divide a table into smaller tables by selecting specific columns or fields for each partition. Each partition represents a subset of the complete data. | If you have a table with columns A, B, C, and D, you could create one table with columns A and B and another with columns C and D. | - A table contains many columns, but queries don't access all columns together.<br>- Some columns are larger than others and separating them can boost I/O performance.<br>- Different data parts have diverse access patterns. |
| **Horizontal partitioning** | Split data based on rows or ranges of values (also known as sharding). Each partition contains a subset of rows with similar characteristics. | If you have a table with rows 1 to 1000, you might create one partition with rows 1 to 500 and another with rows 501 to 1000. | - A dataset is too large for a single location or server.<br>- Data is accessed based on specific ranges or filters.<br>- Need to distribute the workload across physical nodes or servers for enhanced performance. |

To partition your data, consider the following steps:

- _Analyze data and queries._ Analyze data and query patterns to identify suitable partitioning or sharding strategies. Understand the nature of the data, access patterns, and distribution requirements.
- _Determine a key._ Choose a partitioning or sharding key to distribute data across partitions or shards. Carefully select the key based on data characteristics and query requirements.
- _Determine logic._ Determine a partitioning or sharding logic based on the chosen key. Consider dividing the data into ranges, applying hashing algorithms, or using other partitioning techniques.

### Optimize queries

Optimizing queries refines queries to reduce the data that qualifies and the data returned. These adjustments increase efficiency and speed of data retrieval. As a result, the database has a lighter workload, resources work more effectively, and users enjoy smoother interactions. To optimize database queries, consider the following strategies:

- _Rewrite queries._ Review and analyze complex queries to identify opportunities to rewrite them. Consider restructuring query logic, eliminating redundant operations, or simplifying query syntax.
- _Avoid the N+1 query problem._ Minimize the number of roundtrips to the database by using joins and batch fetching to retrieve related data efficiently.
- _Reorder joins._ Evaluate and consider rearranging the join order to minimize the number of rows in each join operation. The order in which you join tables can affect query performance.
- _Cache queries._ Store the results of frequently run queries for easy reuse.. Query caching eliminates the need for repeatedly running the same query, and it reduces query processing overhead.
- _Monitor and tune._ Monitor query performance metrics, such as runtime, resource utilization, and query throughput. Use database profiling tools and monitoring functionalities to identify poorly performing queries. Use that information to optimize query performance.

### Archive and purge data

Archiving and purging are strategies that streamline data storage. Archiving relocates older, less-frequently accessed data to more cost-effective storage. Purging data permanently removes redundant data. They contribute to performance efficiency by reducing data volume, increasing data access speed, and reducing backup and recovery times:

- _Reducing data volume_: Less data means faster processing times, ensuring quick responses to user requests.
- _Increasing data access speed_: A trimmed dataset allows for swifter queries and data retrieval, optimizing system responsiveness.
- _Reducing backup and recovery times_: Smaller datasets expedite backup and restoration processes, minimizing downtime and ensuring consistent performance.

Archiving and purging are instrumental in maintaining peak performance efficiency in data-driven systems.

### Optimize storage load

Optimizing storage load means streamlining requests to the storage system. It helps eliminate unnecessary requests. It also enhances data retrieval and prevents overwhelming the storage system. Optimizing the storage load ensures the storage system remains responsive to legitimate requests and maintains peak performance. Implement strategies to reduce the processing burden on the data store. To optimize data store load, consider the following strategies:

#### Use caching

Caching stores commonly accessed data in a fast-access storage area, making data retrieval quicker than pulling it from the main source. This technique boosts data performance by cutting down on access times and avoiding repetitive data fetches. Caching improves read speeds and user response times, especially for frequently accessed data. This method is most effective on static data or data that rarely changes.

To ensure optimal caching efficiency, consider factors like expiration policies, eviction strategies, and managing cache size. Adjust settings, such as the time to live (TTL), for optimal performance. To use a cache to optimize storage load, consider the following strategies:

- _In-memory caching_: Perform in-memory caching to store frequently accessed data in memory for fast retrieval. You can use this technique for application data that's expensive to compute or retrieve from a database. In-memory caching is useful for data that you read frequently but don't change frequently. For example, you can use variables in cloud flows or collections in canvas apps to cache data.
- _Database query caching_: Use this technique to cache the results of database queries to avoid running the same query multiple times. Database query caching is useful for complex and time-consuming database queries. When you cache the results of a query, subsequent requests for the same query are returned quickly. Also consider using server-side views where possible to prefilter data to narrow down data relevant to your query.
- _Content delivery network caching_: Use this technique to cache web content on distributed network servers to reduce latency and improve content delivery. Content delivery network caching is effective for static content, like images, CSS files, and JavaScript files. Content delivery networks store copies of content in multiple locations worldwide, so users can access the content from a server that's near them geographically.

<!-- 
#### Optimize data updates

TODO -->

### Optimize data movement and processing

Optimizing data movement and processing involves improving the efficiency and performance of operations related to data extraction, transformation, loading, and processing. Consider the following key aspects of optimizing data movement and processing:

- _Extract, transform, and load (ETL) optimization_: Optimize ETL processes to minimize processing time. You can streamline the extraction process, implement efficient transformation algorithms, and optimize the loading process. When you make each step efficient, you can optimize the overall workflow.
- _Parallel processing_: Use parallel processing techniques to improve performance. When you distribute data processing tasks across multiple threads or nodes, you can divide and process the workload concurrently, which results in fast processing.
- _Batch processing_: Group similar tasks together to reduce overhead caused by repeated operations. Process multiple tasks in a batch to reduce overall processing time.

#### Design for data proximity

Data proximity refers to the strategic placement of data closer to the users or services that access it most frequently. By reducing the physical or logical distance between data and its users, data proximity ensures faster data access and improved responsiveness. To optimize design for close proximity, consider these strategies:

- _Evaluate data access patterns_: Assess your workload's access patterns and frequently accessed data. This analysis can help determine where to place data for maximum benefit.
- _Choose solutions that support data relocation_: Consider solutions that offer dynamic data relocation based on changing access patterns, ensuring optimal data positioning.
- _Choose solutions that support data synchronization_: If catering to a distributed user base, opt for solutions that facilitate data synchronization across various regions, ensuring that data replicas are available in proximity to users.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: If underlying data changes frequently, implement a cache invalidation mechanism to ensure that the cached data remains up to date.

#### Use polyglot persistence

Polyglot persistence is the practice of using multiple data storage technologies to store and manage different types of data within an application or system. Different types of databases or storage solutions serve different data requirements. For example, Dataverse Elastic tables can provide the ability to have unstructured data alongside traditional relational tables in the same Dataverse environment.

Polyglot persistence takes advantage of the benefits of each data storage technology to ensure optimal performance and scalability for each type of data. For example, you might use a relational database to store structured, transactional data. And you might use a NoSQL database to store unstructured or semi-structured data.

Design a schema for each data storage technology based on the requirements of the data. For relational databases, you might create normalized tables with appropriate relationships. For NoSQL databases, you might define document structures or key-value pairs. Develop the necessary components to interact with each data storage technology, such as APIs, data access layers, or data integration pipelines. Ensure that the application can read and write data to the appropriate data stores.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: A data structure that has low normalization can improve performance but introduce complexities.

#### Separate OLTP and OLAP systems

﷟To separate [Online transaction processing (OLTP)](/azure/architecture/data-guide/relational-data/online-transaction-processing) and [Online analytical processing (OLAP)](/azure/architecture/data-guide/relational-data/online-analytical-processing) systems, design and deploy distinct systems for transactional processing and analytical processing tasks.This separation allows you to optimize each system for its specific workload and characteristics. Optimize each system for its specific workload and characteristics.

OLTP systems are used for real-time transactional processing. They efficiently and reliably handle individual transactions. OLTP systems are typically used to perform day-to-day operational tasks, such as online order processing, inventory management, and customer data management. OLTP systems prioritize responsiveness, consistency, and concurrency.

OLAP systems are used for complex analytical processing and reporting. They handle large volumes of data and perform intensive calculations and aggregations. OLAP systems are used for tasks such as business intelligence, data mining, and decision support. OLAP systems prioritize query performance, data aggregation, and multidimensional analysis.

When you separate OLTP and OLAP systems, you can allocate appropriate resources and optimize each system for its specific workload. Separation allows you to apply different data modeling techniques to each system. OLTP systems typically use normalized schemas for efficient transactional processing. OLAP systems might use denormalized schemas or data warehousing techniques to optimize query performance.

## Power Platform facilitation

**Monitor data performance**: To monitor data performance, you can use Azure Monitor to collect and analyze infrastructure metrics, logs, and application data. You can integrate Monitor with other services like Application Insights. Application Insights provides application performance monitoring and supports many platforms.

Application Insights collects usage and performance data. You can use Log Analytics to correlate that data with configuration and performance data across Azure resources. The [Application Insights for Dataverse](/power-platform/admin/telemetry-events-dataverse) data stream currently provides performance data related to Dataverse API incoming calls, Dataverse plug-in execution calls, and Dataverse SDK calls.

**Optimize query data patterns in canvas apps:**  Follow the documented guidance and suggestions. See [Optimized query data patterns in Power Apps](/power-apps/maker/canvas-apps/optimized-query-data-patterns)

**Optimize how you are customizing, extending, or integrating with Dataverse:** Follow the documented best practices and guidance. See [Best practices and guidance when coding for Microsoft Dataverse](/power-apps/developer/data-platform/best-practices/)

**Optimize database queries and index performance**: Use the query performance insight feature of Azure SQL Database to optimize queries, tables, and databases. You can use this feature to identify and troubleshoot query performance issues.

For relational databases, you should follow the [index design guidelines](/azure/architecture/best-practices/data-partitioning), [SQL Server index guidance](/sql/relational-databases/indexes/indexes), and [Azure Cosmos DB index guidance](/azure/azure-sql/database/sql-insights-overview). Use SQL Database to perform [automatic tuning](/azure/azure-sql/database/automatic-tuning-overview) for queries to improve their performance.

In SQL databases, you should regularly [reorganize or rebuild indexes](/purview/governance-solutions-overview). Identify slow queries and tune them to improve performance. Many database engines have query-tuning features. For more information, see [Best practices for query performance](/azure/architecture/guide/technology-choices/data-store-decision-tree).

Azure Cosmos DB has a [default indexing policy](/azure/cosmos-db/index-policy) that indexes every property of every item and enforces range indexes for any string or number. This policy provides you with efficient query performance, and you don't have to manage indexes upfront.

**Optimize storage load**: Many Azure database services support read replicas. The availability and configuration of read replicas vary depending on the Azure database service. Refer to the official documentation for each service to understand the details and options.

## Related links

- [Overview on how to create performant Power Apps](/power-apps/maker/canvas-apps/create-performant-apps-overview)
- [Best practices for query performance](/azure/architecture/guide/technology-choices/data-store-decision-tree)
- [OLAP overview](/azure/architecture/data-guide/relational-data/online-analytical-processing)
- [OLTP overview](/azure/architecture/best-practices/data-partitioning)

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)