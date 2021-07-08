---
title: "Automatic tuning of data query performance with index management"
description: "Learn how index management is automatically tuned with Azure SQL Database for better data query performance in Dynamics 365 apps"
author: Mattp123
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Data query performance
To improve query performance, Azure SQL Database automatically executes index management automatic tuning. So there’s no need for you to manually configure recommendations to create or drop indexes in customer engagement apps. For example, Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation, and Azure SQL Database. More information: [Automatic tuning in Azure SQL Database](/azure/sql-database/sql-database-automatic-tuning) 

You can analyze and optimize query performance using the Data Performance view. This view provides an aggregated list of entities with long-running queries. This query is defined as a query that takes 3 seconds or longer for you to complete. Typical examples of a component that can have a long running query is a plug-in with custom FetchXML or a subgrid or view. When you optimize an entity that has long-running queries, it can significantly reduce the amount of time the query takes for you to load. Behind the scenes, optimizations add one or more [!INCLUDE[pn_MS_SQL_Server](../includes/pn-ms-sql-server.md)] indexes.  

> [!NOTE]
>  The Data Performance feature is only available with [!INCLUDE[pn_crm_8_1_0_online](../includes/pn-crm-8-1-0-online.md)].  
  
## Adding or removing optimizations  
 Optimization can significantly improve the performance of slow running queries. But, optimization require storage space. Before adding an optimization, carefully consider the entity to be optimized and keep the following in mind.  
  
-   Applying an optimization doesn't guarantee query performance improvement. Some optimizations can improve read performance, but can cause a degradation in update performance.  
  
-   Only optimize for entities that are frequently used. For example, a commonly used custom view for a sales department.  
  
-   Review the impact of adding an optimization and remove optimizations that aren't useful. As part of your decision for keeping an optimization, you should determine if the performance tradeoff is acceptable.  
  
-   Depending on the number of tables related for you to the entity, some entities can't have more than 20 optimizations.  

  
## All Data Performance Logs view for you to apply or remove an optimization  
  
1. Go to **Settings** > **Administration** > **Data Performance**.  
  
2. In the **All Data Performance Logs** view, if one or more long running entity queries are detected, log items are displayed in the view. 
3. If several items appear in the view, sort by the **Count** or **Optimization Impact** columns to easily identify the most used queries that do not already have an optimization. Out-of-box and custom-entity queries that complete within three seconds aren't displayed in the view.  
  
   ![All Data Performance Logs view](../admin/media/data-performance-logs-view.png "All Data Performance Logs view")  
  
    The columns displayed in the view provide information that can help you determine whether for you to add an optimization or not.  
  
   - **Count**. Indicates the number of times a query has been executed, which indicates the popularity of the query.  
  
   - **Optimization Status**. Indicates whether an optimization has been created for the entity. **Optimization Available** indicates that the entity doesn't have an optimization applied, or a new optimization is available for an entity that already has at least one optimization.  
  
   - **Optimization Impact**. All potential optimizations begin with an optimization impact value of 0. Potential optimizations have no impact measurement yet because the optimization hasn't been applied. Over time, after an optimization is applied by clicking **OPTIMIZE**, an  integer value is displayed that represents query performance impact. For example, after one  week since the optimization was applied, the value that appears can help indicate whether an optimization has improved or degraded query performance for the given entity. A negative value suggests an improvement in query performance, whereas a positive number suggests a degradation in query performance. So,  an optimization applied one week ago that has a value of -10% suggests a 10 percent improvement in query performance.  
  
3. Select the entity that you want for you to create an optimization for, and then click **OPTIMIZE**.  To remove an applied optimization, click **REMOVE OPTIMIZATION**.  
  
   Optimizations take effect immediately after they are applied. However, for entities that have large tables, it can take two or more hours before the optimization fully takes effect. Optimizations are processed as an asynchronous process and can be viewed in the **Settings** > **System Jobs** area of Dynamics 365 apps. Notice that an optimization may not be completely applied even after the system job is completed because the actual index must be built in the back-end storage engine.  -->
  
### See also  
 [Performance tuning and optimization](../admin/performance-tuning-and-optimization.md)   


[!INCLUDE[footer-include](../includes/footer-banner.md)]
