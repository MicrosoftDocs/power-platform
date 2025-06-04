---  
title: Use the SQL Server with canvas apps  
description: Learn how to use SQL Server with canvas apps to create custom user experiences and integrate multiple data sources seamlessly.  
#customer intent: As a Power Apps maker, I want to use SQL Server with canvas apps so that I can create custom user experiences and integrate multiple data sources seamlessly.  
author: lanced  
ms.subservice: architecture-center  
ms.topic: example-scenario  
ms.date: 06/04/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087  
ms.contributors:  
  - mapichle
search.audienceType:  
  - admin  
  - developer
---  

# Use SQL Server with canvas apps

SQL Server is a popular way to store enterprise data. This article shows best practices to help you build and publish an enterprise-grade canvas app with SQL Server.

> [!TIP]
> This article gives an example scenario and a visual overview of how to use SQL Server with a canvas app. This solution is a general example architecture you can use in different scenarios and industries. SQL Server and Power Apps both support many legacy authentication approaches, but this article covers only best practices.  

## Architecture diagram

:::image type="content" source="media/sql-server/sql-server.png" alt-text="Diagram that shows the workflow for using SQL Server with canvas apps." lightbox="media/sql-server/sql-server.png":::  

## Workflow

Many previous implementations of Power Apps with SQL Server use a gateway, but this example architecture highlights the virtual private network (VNET) architecture with SQL Server. A SQL Server instance can be [Azure SQL](/azure/azure-sql/) or an on-premises SQL database exposed to the cloud through [Azure Arc](/sql/sql-server/azure-arc/overview). In both cases, communication is private and secure.

1. **Contoso VNET** is a virtual private network that you create in your tenant.
1. **Azure resources / Contoso resources** are resources you make available in the virtual network from within your tenant. This includes services like an Azure SQL database or an on-premises SQL Server database made available through [Azure Arc](/sql/sql-server/azure-arc/overview).
1. **Delegated subnet** is within your virtual network and provides a container for Power Platform to let services like the SQL connector or a Dataverse plug-in work with your resources.

## Additional components

1. **Canvas app and SQL tables**: SQL Server tables and views appear in Power Apps as tabular data sources. You can bind a tabular data source to the table or gallery `Items` property using a Power Fx expression. For tabular data sources, Power Fx expressions are translated into OData expressions, which are then converted into SQL expressions. However, Power Fx and OData don't fully represent all the capabilities of a SQL expression.
   > [!TIP]
   > Use Power Fx for basic, straightforward queries, and use stored procedures for more complex SQL expressions.
1. **Canvas app and SQL stored procedures**: SQL Server stored procedures appear in Power Apps as action data sources. Typically, action data sources can't be bound to a table or gallery due to their potential side effects. However, you can mark a `select stored procedure` as `Safe for Tables and Galleries` and use it with a table or gallery. This approach brings in all the data the stored procedure returns, but be cautious as it can overrun the client's memory if too much data is retrieved. To control the amount of data retrieved, use the parameter paging arguments typically present in these types of stored procedures. Additionally, you must set the results to a Power Fx variable and then use this variable in the `Items` property to populate the table or gallery. Remember to refresh the Power Fx variable on Create, Update, and Delete (CUD) operations. More complex stored procedures, such as those using temporary tables, might return a `dynamic schema`. You can use the results of these stored procedures by setting the expected results to a Power Fx `User defined type`.
1. **SQL Server connector**: The Power Apps application uses the SQL Server connector to access data in SQL Server. While there are many SQL authentication types available, Microsoft Entra ID or shareable SPN (Service principal name) are two of the better choices. If you want to use Microsoft Entra ID, then the SQL Server database must first be configured to provide security via Microsoft Entra ID. Shareable SPN is an admin-enabled access method and should be granted carefully, as all users have the same database access rights. It's secured with secure implicit connections, which restrict access to the tables and actions used in the application (that is, Get, Post, Put, & Delete).
1. **VNET (Virtual private network)**:  There are several ways to route calls to SQL Server. [Virtual network](/power-platform/admin/vnet-support-overview) is an Azure cloud solution that makes all endpoints private. To set this up, provision a virtual network within your tenant, set up the enterprise policy, and configure your Power Platform environment to support it. This setup ensures that no SQL traffic is exposed publicly over the wire.
1. **ALM**: The Power Platform supports the smooth transition of a Power Apps app over SQL between Dev, Test, and Production environments. Connection references support changing connection strings between environments. This is important for basic SQL Auth. Environment variables support the Microsoft Entra scenario changing the server and database between environments. 


## Use cases  

Power Apps lets organizations create custom user experiences. If you're building a new app and storage, consider using Dataverse because it has features that make building an enterprise-grade app easy. If you have data in SQL Server that can't be moved, or your organization requires SQL Server, Power Apps over SQL Server can be a good choice. Use Power Apps over SQL Server if the data can't be moved, existing apps still depend on that data, and you need to move those apps to the cloud to modernize them.  

## Considerations  

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: Power Apps works well with straightforward queries that you can delegate to the server. Delegate complex tasks to views and stored procedures. Then, use those stored procedures directly for synchronous actions. Use Power Automate for any asynchronous actions, including calls to long running stored procedures. 

### Security

**Use secure implicit connections**: Use secure implicit connections for all shared connections. Convert any older applications to use secure implicit connections as needed. With secure implicit connections, the connector stays inside the Power Apps cloud service and doesn't reside on the client. The app connects only to the proxy connector, which is also in the Power Apps cloud service. The app and proxy connector know about each other, but the app doesn't know about the connector. The proxy connector has a policy that restricts query types to those in the app. 

:::image type="content" source="media/sql-server/secure-implicit-connections.png" alt-text="Architecture diagram illustrating how implicitly shared connection components are related to each other." lightbox="media/sql-server/secure-implicit-connections.png":::  

**Create intentional segmentation and perimeters**: Use separate Power Platform environments for application lifecycle stages, and ensure only the right users have access to each stage to support segmentation policies.

### Operational Excellence  

**Adopt safe deployment practices**: Standardize deployment of any changes to the Power Apps application using automated deployment processes such as pipelines. Promote the application to production only after testing changes.  

### Performance Efficiency  

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements to ensure your SQL Server table, view, and stored procedure design is appropriate. Evaluation should include how data is accessed and how Power Apps delegates operations to the SQL Server. Be aware of limitations [when searching and filtering data](/power-apps/maker/canvas-apps/connections/sql-connection-overview#power-apps-functions-and-operations-delegable-to-sql-server), due to the delegation support offered by SQL Server. These limitations are documented in  [Understand delegation in a canvas app](/powerapps/maker/canvas-apps/delegation-overview) and should be taken into account when choosing the right data source or backend for your app.  

**Optimize logic**: Canvas applications use Power Fx to execute work. Each Power Fx operation is independent and isn't handled as an atomic transaction. For example, if an application creates a sales order detail row but doesn't create a sales order header record, the sales order detail row remains. Don't leave these required procedural steps in Power Fx. Use SQL Server stored procedures with transaction support.
 
### Experience Optimization  

**Design for efficiency**: Applications that let users access other data sources alongside SQL Server tables from a single Power Apps application without requiring interaction with multiple individual applications improve efficiency and provide a better custom visual experience. Avoid just building an application to build an application&mdash;the application should provide some efficiency to the user or other architecture benefit over using a model-driven Power Apps experience. 

## Related resources  

Power Apps:

- [SQL Server connection overview](/power-apps/maker/canvas-apps/connections/sql-connection-overview)  
- [SQL Server security](/power-apps/maker/canvas-apps//connections/sql-server-security)  
- [Understanding delegation](/power-apps/maker/canvas-apps/delegation-overview)  
- [SQL data types and delegation](/power-apps/maker/canvas-apps/connections/sql-connection-overview#power-apps-functions-and-operations-delegable-to-sql-server)  

Connectors

- [Microsoft SQL Server connector documentation](/connectors/sql/)  
- [Private virtual network](/power-platform/admin/vnet-support-overview)
- [Setting up a private virtual network](/power-platform/admin/vnet-support-setup-configure)

Application life cycle management (ALM): 

- [Environment variables](/power-apps/maker/data-platform/environmentvariables#sql-server)  
- [Connection references](/power-apps/maker/data-platform/create-connection-reference)
