---
title: "Overview  | MicrosoftDocs"
description: Overview of the CoE Starter Kit
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
# Using Microsoft Dataverse with a Power Apps canvas app 

Dataverse is a great choice when dealing with complex object models with several related tables. As an app maker using the Dataverse connector (a.k.a Common Data Service Connector), you get access to a hierarchical object model where tables and their relationships are readily available without the need to build complex lookups and joins to retrieve related tables. This simplifies the development process and results in a more performant applications since data requests are optimized accordingly.

![Conference App Object Model](./media/ConferenceAppObjectModel.png)

When retrieving the Session table, the Dataverse connector will automatically expand the Venue field into a record, making all the information about the Venue available, such as Room and Address. Within a gallery control, the formula bound to a label would simply be this:

```powerappsfl
ThisItem.Venue.Room
```

Contrast this to other data sources:

```powerappsfl
LookUp(Venues, VenueID = ThisItem.VenueID).Room
```

This simplicity in dealing with relationships make Dataverse more approachable for citizens developers and can improve productivity as well. In addition, Table and relationship creation process within the maker portal makes Dataverse the data source of choice within the Power Platform. 

Furthermore, the CDS connector bypasses the traditional connector infrastructure (see this) and calls directly into the Dataverse backend, leading to better performance.

![Conference App Object Model](./media/PA_DataverseArch.png)

As a real-world example, consider Belron®, the worldwide leader in vehicle glass repair and replacement. Belron uses more than 40 apps, all developed in-house by just one employee with no programming skills. For more insight on how Belron used Dataverse, check out the customer success story here: https://customers.microsoft.com/en-us/story/belron-autoglass-consumer-goods-powerapps 

![Business Process Flow in Canvas](./media/autoglass.jpg)