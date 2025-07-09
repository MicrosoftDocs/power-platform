---  
title: Use the SQL Server with canvas apps  
description: Learn how to use SQL Server with canvas apps to create custom user experiences and integrate multiple data sources seamlessly.  
#customer intent: As a Power Apps maker, I want to use SQL Server with canvas apps so that I can create custom user experiences and integrate multiple data sources seamlessly.  
author: lanced  
ms.subservice: architecture-center  
ms.topic: example-scenario  
ms.date: 07/09/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087  
ms.contributors:  
  - mapichle
search.audienceType:  
  - admin  
  - developer
---  

# Use SQL Server with canvas apps

SQL Server is a widely used solution for storing enterprise data. This article offers best practices to help you build and publish an enterprise-grade canvas app with SQL Server.

> [!TIP]
> This article provides an example scenario and a visual representation of how to use SQL Server with a canvas app. This solution is a generalized example architecture, which can be used for many different scenarios and industries. SQL Server and Power Apps support many legacy authentication approaches. This article is limited to best practices.  

## Architecture diagram

:::image type="content" source="media/sql-server/sql-server.png" alt-text="Architecture diagram that shows the workflow for using SQL Server with canvas apps.":::  

## Workflow

While many previous implementations of Power Apps with SQL Server used a gateway, this example architecture highlights the virtual private network (VNET) architecture with SQL Server. A SQL Server instance can be [Azure SQL](/azure/azure-sql/) or an on-premises SQL database exposed to the cloud through [Azure Arc](/sql/sql-server/azure-arc/overview). In both cases, communication is private and secure.

- **Contoso VNET** is a virtual private network that you create in your tenant.
- **Azure resources/Contoso resources** are resources you make available in the virtual network from within your tenant. These resources include services like an Azure SQL database or an on-premises SQL Server database made available through [Azure Arc](/sql/sql-server/azure-arc/overview).
- **Delegated subnet** sits within your virtual network and provides a container for Power Platform to let services like the SQL connector or a Dataverse plug-in work with your resources.

## Components

This section describes the components that support the integration of SQL Server with canvas apps in this architecture.

### Canvas app and SQL tables

SQL Server tables and views appear in Power Apps as tabular data sources. You can bind a tabular data source to the table or gallery `Items` property using a Power Fx expression. For tabular data sources, Power Fx expressions are translated into OData expressions, which are then converted into SQL expressions. However, Power Fx and OData don't fully represent all the capabilities of an SQL expression.

> [!TIP]
> Use Power Fx for basic, straightforward queries, and use stored procedures for more complex SQL expressions.

### Canvas app and SQL stored procedures

SQL Server stored procedures appear in Power Apps as action data sources. Typically, action data sources can't be bound to a table or gallery due to their potential side effects. However, you can mark a `select stored procedure` as `Safe for Tables and Galleries` and use it with a table or gallery. This approach retrieves all the data the stored procedure returns, but be cautious because retrieving too much data can overrun the client's memory. To control the amount of data retrieved, use the parameter paging arguments typically present in these types of stored procedures. 

Additionally, set the results to a Power Fx variable and use this variable in the `Items` property to populate the table or gallery. Remember to refresh the Power Fx variable on Create, Update, and Delete (CUD) operations. More complex stored procedures, such as those using temporary tables, might return a `dynamic schema`. You can use the results of these stored procedures by setting the expected results to a Power Fx `User defined type`.

### SQL Server connector

Power Apps applications use the SQL Server connector to access data in SQL Server. While there are many SQL authentication types available, Microsoft Entra ID and shareable SPN (service principal name) are two of the better choices. 

If you want to use Microsoft Entra ID, first configure the SQL Server database to provide security via Microsoft Entra ID. Shareable SPN is an admin-enabled access method and should be granted carefully, as all users have the same database access rights. It's secured with secure implicit connections, which restrict access to the tables and actions used in the application (that is, Get, Post, Put, and Delete).

### VNET (virtual private network)

There are several ways to route calls to SQL Server. [Virtual network](/power-platform/admin/vnet-support-overview) is an Azure cloud solution that makes all endpoints private. To implement, provision a virtual network within your tenant, set up the enterprise policy, and configure your Power Platform environment to support it. This setup ensures that no SQL traffic is exposed publicly over the wire.

### ALM (application lifecycle management)

Power Platform supports the smooth transition of a Power Apps app over SQL between Dev, Test, and Production environments. Connection references support changing connection strings between environments, which is important for basic SQL Auth. Environment variables support the Microsoft Entra ID scenario by changing the server and database between environments. 

## Use cases  

Power Apps provides organizations with a flexible, intuitive way to build custom user experiences.

- If you're building a new app and storage, consider using Dataverse. Its features are designed to make building enterprise-grade apps easier.
- If you have data in SQL Server that can't be moved, or your organization requires SQL Server, consider using Power Apps over SQL Server. 
- If the data can't be moved, use Power Apps over SQL Server. Existing apps still depend on that data, so you need to move those apps to the cloud to modernize them.

## Considerations  

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: Power Apps works well with straightforward queries that you can delegate to the server. Delegate complex tasks to views and stored procedures. Then, use those stored procedures directly for synchronous actions. Use Power Automate for any asynchronous actions, including calls to long-running stored procedures. 

### Security

**Use secure implicit connections**: Use secure implicit connections for all shared connections. Convert any older applications to use secure implicit connections as needed. With secure implicit connections, the connector stays inside the Power Apps cloud service and doesn't reside on the client. The app connects only to the proxy connector, which is also in the Power Apps cloud service. The app and proxy connector know about each other; however, the app doesn't know about the connector. The proxy connector has a policy that restricts query types to queries in the app. 

:::image type="content" source="media/sql-server/secure-implicit-connections.png" alt-text="Architecture diagram illustrating how implicitly shared connection components are related to one other.":::  

**Create intentional segmentation and perimeters**: Use separate Power Platform environments for application lifecycle stages, and ensure only the right users have access to each stage to support segmentation policies.

### Operational Excellence  

**Adopt safe deployment practices**: Standardize deployment of any changes to the Power Apps application using automated deployment processes such as pipelines. Promote the application to production only after testing those changes.  

### Performance Efficiency  

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements to ensure your SQL Server table, view, and stored procedure design is appropriate. In your evaluation, include how data is accessed and how Power Apps delegates operations to the SQL Server. Be aware of limitations [when searching and filtering data](/power-apps/maker/canvas-apps/connections/sql-connection-overview#power-apps-functions-and-operations-delegable-to-sql-server) due to the delegation support offered by SQL Server. Review the limitations documented for canvas apps in [Understanding delegation](/powerapps/maker/canvas-apps/delegation-overview), particularly when choosing the right data source or backend for your app.  

**Optimize logic**: Canvas applications use Power Fx to execute work. Each Power Fx operation is independent and isn't handled as an atomic transaction. For example, if an application creates a sales order detail row but doesn't create a sales order header record, the sales order detail row remains. Don't leave these required procedural steps in Power Fx. Use SQL Server stored procedures with transaction support.
 
### Experience Optimization  

**Design for efficiency**: Applications that let users access other data sources alongside SQL Server tables from a single Power Apps application, without requiring interaction with multiple individual applications, improve efficiency and provide a better custom visual experience. Avoid building an application to build an application&mdash;the application should provide some efficiency to the user or other architecture benefit over using a model-driven Power Apps experience. 

## Related resources  

Power Apps:

- [Connect to SQL Server overview](/power-apps/maker/canvas-apps/connections/sql-connection-overview)  
- [Use Microsoft SQL Server securely](/power-apps/maker/canvas-apps/connections/sql-server-security)  
- [Understanding delegation](/power-apps/maker/canvas-apps/delegation-overview)  
- [Power Apps functions and operations delegable to SQL Server](/power-apps/maker/canvas-apps/connections/sql-connection-overview#power-apps-functions-and-operations-delegable-to-sql-server)  

Connectors:

- [Microsoft SQL Server connector documentation](/connectors/sql/)  
- [Virtual Network support overview](/power-platform/admin/vnet-support-overview)
- [Setting up Virtual Network support](/power-platform/admin/vnet-support-setup-configure)

Application lifecycle management (ALM): 

- [Environment variables](/power-apps/maker/data-platform/environmentvariables#sql-server)  
- [Use a connection reference in a solution with Microsoft Dataverse](/power-apps/maker/data-platform/create-connection-reference)
