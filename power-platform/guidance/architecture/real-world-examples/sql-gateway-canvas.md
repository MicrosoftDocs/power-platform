---
title: "Overview  | MicrosoftDocs"
description: 
author: slaouist
manager: spant
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mehdis
ms.reviewer: 
search.audienceType: 
search.app: 
  
---
# Using On-Premises SQL with a Canvas app through an on-premise data gateway 

The on-premises data gateway acts as a bridge to provide secure data transfer between on-premises data and Power Apps.

![Gateway architecture](./media/gateway.png)

A powerful use of data gateways happens when your data resides in an on-premises SQL Server. The SQL connector supports two important feature that makes retrieving data more efficient specially as we are going through an on-premises gateway. These features are views and explicit column selection.
A view is a virtual table based on the result-set of a SQL statement. The data in a view is fetched from one or more tables in the database. Views are executed server side which means that there is no need to reference reference separate tables in Power Apps and perform lookup and joins between these tables client-side. Another scenario that views solves is aggregating (group and sum) data prior to bringing it into Power Apps. Rather than bringing all the records into Power Apps and using the Sum feature, they were able to do that advanced processing in SQL Server.
Explicit Column Selection in Power Apps studio intelligently optimizes formulas to fetch only the fields referenced in the application, boosting the performance of the app.  

![Gateway architecture](./media/ECS.png)

There are performance implication in using on-premises gateways so it is important to allocate an adequate configuration for the on-premise hardware where the gateway is installed. This ensures that the gateway machine is not overloaded by requests from other apps that would slow down the Merchandise app.

![Gateway architecture](./media/gatewayperf.png)

As an example of app built with on-premises SQL Server, G&J Pepsi created a merchandise app that enables better mobility and flexibility for field personnel. Check out their story here https://customers.microsoft.com/en-us/story/gj-pepsi-consumer-goods-powerapps.


![Gateway architecture](./media/GJPepsi.png)