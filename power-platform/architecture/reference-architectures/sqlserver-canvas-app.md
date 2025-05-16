---  
title: Use the SQL Server with canvas apps  
description: Learn how to use SQL Server with canvas apps to create custom user experiences and integrate multiple data sources seamlessly.  
#customer intent: As a Power Apps maker, I want to use SQL Server with canvas apps so that I can create custom user experiences and integrate multiple data sources seamlessly.  
author: lanced  
ms.subservice: architecture-center  
ms.topic: example-scenario  
ms.date: 04/15/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087  
ms.contributors:  
  - mapichle
search.audienceType:  
  - admin  
  - developer
---  

# Use SQL Server with canvas apps

SQL Server is a popular choice to store enterprise data. This article highlights best practices you can follow to easily build and publish an enterprise-grade canvas app over SQL Server.

> [!TIP]  
> The article provides an example scenario and visual representation of how to use the SQL Server with a canvas app. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries. SQL Server and Power Apps both support many legacy authentication approaches. This article discusses only best practices.  

## Architecture diagram

:::image type="content" source="media/sql-server/sql-server.png" alt-text="Architecture diagram illustrating the workflow for using SQL Server with canvas apps." lightbox="media/sql-server/sql-server.png":::  

## Workflow

While many previous implementations of Power Apps with SQL Server used a gateway, this example architecture highlights the Virtual Private Network (VNET) architecture with SQL Server. A SQL Server instance might be [Azure SQL](/azure/azure-sql/) or an on-premises SQL database exposed to the cloud via [Azure Arc](/sql/sql-server/azure-arc/overview). In both cases, the communications are private and secure.  

1. **Contoso VNET** is a virtual private network you create in your tenant. 
1. **Azure resources / Contoso resources** are resources you make available in the virtual network from within your tenant. This includes services like a SQL Azure database or an on-premises SQL Server database made available via [Azure Arc.](/sql/sql-server/azure-arc/overview)  
1. **Delegated subnet** sits within your virtual network and provides a container for Power Platform to make services such as the SQL Connector or a Dataverse plug-in work with your resources.

## Additional components

1. **Canvas app and SQL tables**: SQL Server tables and views appear in Power Apps as tabular data sources. You can bind a tabular data source to the table or gallery 'Items' property using a Power Fx expression. For tabular data sources, Power Fx expressions are translated into OData expressions, which are then converted into SQL expressions. However, Power Fx and OData don't fully represent all the capabilities of a SQL expression.
   > [!TIP]
   > Use Power Fx for basic, straightforward queries, and use stored procedures for more complex SQL expressions.
1. **Canvas app and SQL stored procedures**: SQL Server stored procedures appear in Power Apps as action data sources. Typically, action data sources can't be bound to a table or gallery due to their potential side effects. However, you can mark a "select stored procedure" as "Safe for Tables and Galleries" and use it with a table or gallery. This approach brings in all the data the stored procedure returns, but be cautious as it can overrun the client's memory if too much data is retrieved. To control the amount of data retrieved, use the parameter paging arguments typically present in these types of stored procedures. Additionally, you must set the results to a Power Fx variable and then use this variable in the 'Items' property to populate the table or gallery. Remember to refresh the Power Fx variable on Create, Update, and Delete (CUD) operations. More complex stored procedures, such as those using temporary tables, might return a 'dynamic schema.' You can use the results of these stored procedures by setting the expected results to a Power Fx 'User defined type.'
1. **SQL Server connector**: The Power Apps application uses the SQL Server connector to access data in SQL Server. While there are many SQL authentication types available, Microsoft Entra ID or shareable SPN (Service principal name) are two of the better choices. If you want to use Microsoft Entra ID, then the SQL Server database must first be configured to provide security via Microsoft Entra ID. Shareable SPN is an admin-enabled access method and should be granted carefully, as all users have the same database access rights. It's secured with secure implicit connections, which restrict access to the tables and actions used in the application (that is, Get, Post, Put, & Delete).
1. **VNET (Virtual private network)**:  There are several ways to route calls to SQL Server. [Virtual network](/power-platform/admin/vnet-support-overview) is an Azure cloud solution that ensures that all endpoints are private. To implement this, provision a virtual network within your tenant, set up the enterprise policy, and configure your Power Platform environment to support it. This setup ensures that no SQL traffic is exposed publicly over the wire
1. **ALM**: The Power Platform supports the smooth transition of a Power Apps app over SQL between Dev, Test, and Production environments. Connection references support changing connection strings between environments. This is important for basic SQL Auth. Environment variables support the Microsoft Entra scenario changing the server and database between environments. 


## Use cases  

Power Apps lets organizations easily create custom user experiences that can serve an organization. If you're creating a brand new application and storage, you should strongly consider using Dataverse as it has many features that make building an enterprise-grade application easy. However, if you have existing data in SQL Server that can't be moved, or your organization has a standard that requires you use SQL Server, then Power Apps over SQL Server might be a great choice for you. Power Apps over SQL may be a good choice if the data can't be moved, there are existing applications that still depend on that data, but you need to move those applications to the cloud to modernize them.  

## Considerations  

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability  

**Design your workload to avoid unnecessary complexity**: Power Apps works well with straight-forward queries that can be delegated to the server. Ensure straight-forward queries that can be delegated to the server by pushing complex tasks into views and stored procedures. Then, directly use those stored procedures for synchronous action stored procedures. Use Power Automate for any asynchronous actions - including calls to long-running stored procedures. 

### Security  

**Use secure implicit connections**: All shared connections should use secure implicit connections. As necessary, convert any older applications to use secure implicit connections. With secure implicit connections, the connector stays inside the Power Apps cloud service. It doesn't reside on the client. The app only connects to the proxy connector (which is also in the Power Apps cloud service.) The app and proxy connector know about each other. The app, however, doesn't know about the connector. The proxy connector also has policy that restricts query types to the queries in the app. 

:::image type="content" source="media/sql-server/secure-implicit-connections.png" alt-text="Architecture diagram illustrating how implicitly shared connection components are related to each other." lightbox="media/sql-server/secure-implicit-connections.png":::  

**Create intentional segmentation and perimeters**: Use separate Power Platform environments for application lifecycle stages, and ensure only the right users have access to each stage to support segmentation policies.

### Operational Excellence  

**Adopt safe deployment practices**: Standardize deployment of any changes to the Power Apps application using automated deployment processes such as pipelines. Promote the application to production only after testing changes.  

### Performance Efficiency  

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements to ensure your SQL Server table, view, and stored procedure design is appropriate. Evaluation should include how data is accessed and how Power Apps delegates operations to the SQL Server. Be aware of limitations [when searching and filtering data](/power-apps/maker/canvas-apps/connections/sql-connection-overview#power-apps-functions-and-operations-delegable-to-sql-server), due to the delegation support offered by SQL Server. These limitations are documented in  [Understand delegation in a canvas app](/powerapps/maker/canvas-apps/delegation-overview) and should be taken into account when choosing the right data source or backend for your app.  

**Optimize logic**: Canvas applications ultimately use Power Fx to execute work. Each Power Fx operation is independent and isn't handled as an atomic transaction. For example, if an application creates Sales order detail row but doesn't correctly create a Sales order header record, the Sales order detail row remains. Don't leave these kinds of required procedural steps in Power Fx. Use SQL Server stored procedures with transaction support. 
 
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
- [Private Virtual network](/power-platform/admin/vnet-support-overview)
- [Setting up a private Virtual network](/power-platform/admin/vnet-support-setup-configure)

Application Life Cycle  Management (ALM): 

- [Environment variables](/power-apps/maker/data-platform/environmentvariables#sql-server)  
- [Connection references](/power-apps/maker/data-platform/create-connection-reference)  
