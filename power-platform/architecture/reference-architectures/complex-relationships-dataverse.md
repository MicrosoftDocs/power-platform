---
title: Use complex relationships with Microsoft Dataverse
description: Learn how to model complex data relationships in Microsoft Dataverse, compare many-to-many options, and design effective business applications in Power Platform.
#customer intent: As a solution architect, I want to understand how to model complex data relationships in Dataverse so that I can design effective business applications.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 09/16/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
---

# Use complex relationships with Microsoft Dataverse

Microsoft Dataverse is an enterprise data platform in Power Platform that enables organizations to create enterprise applications. These applications can involve tracking information about business processes that include complex relationships between data. Dataverse supports common data relationships by using the built-in one-to-many, many-to-one, and many-to-many relationship types. You can also implement more advanced many-to-many relationships when you need to track related data about the relationship. This flexibility is beneficial for applications like an event management app, where tracking attendance details requires more than simple associations.

> [!TIP]
> This article provides an example scenario and visual representation of how to use advanced data modeling patterns in Microsoft Dataverse. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/complex-relationships-dataverse/architecture.png" alt-text="Architecture diagram showing how Event, Contact, and Event Attendee tables connect to track who attends events and related data about each attendee.":::

## Workflow

A Power Apps canvas application uses Dataverse to manage data for an event management application. The application allows a user to track who attended the event (or events) hosted by the organization's sales team.

- **Contact**: The Contact table tracks people the sales team invites to events.
- **Event**: The Event table tracks event information like the name, date, and location of each event.
- **Event Attendee**: The Event Attendee table tracks who attends each event and their attendance data. This table has a many-to-many relationship between Contact and Event. It is created with a many-to-one relationship with the Contact table and a many-to-one relationship with the Event table. This setup allows for this many-to-many table to include data about the attendees at an event, like their RSVP status, attendance status, and whether they paid a fee.

## Use case

The main purpose of the event management application is to track event attendance and related information. The requirements are:

- The application needs to record who attended each event *and* details about their attendance.
- One person can attend multiple events.

### Built-in many-to-many relationship

As the team building the application evaluated options for data modeling, they considered the built-in Dataverse many-to-many support. This approach allows a contact to attend multiple events. Behind the scenes, Dataverse creates an internal intersect table that tracks the connections between the Contact and one or more Event rows. However, this internal table isn't modifiable&ndash;additional columns to track data about the relationship between the two tables can't be added. While this approach satisfies part of the requirements of the app, it doesn't accommodate the need to track information about each event the contact attends, such as RSVP status.

### Manual many-to-many relationship

To track additional information about each event a contact attends, consider implementing a "manual many-to-many" relationship pattern. This approach involves creating a custom table, Event Attendee, to represent the intersection between Contact and Event. The Event Attendee table includes many-to-one relationships to both Contact and Event tables, allowing it to store other fields like RSVP status, attendance status, and payment information. This approach gives you full control over security and lets you automate when and who can establish the relationship.

While this pattern provides more flexibility than the built-in many-to-many relationship, use it only when you need to store extra data about the relationship.

### When to use each approach

**Built-in many-to-many approach:** Best if you only need to know which contacts are linked to which events—no extra info required. Automates the management of the intersect between the two rows. Offers a smoother experience for linking multiple records at once, especially in model-driven apps, which are optimized for the built-in approach.

**Manual many-to-many:** Use when you need to store extra data about each relationship. Requires more steps to provide additional information for each row. For example, this manual pattern might involve the user being presented with a new row form and having to, at a minimum, make sure the two rows being associated are provided. In Power Apps canvas applications, some of this can be simplified by the maker by providing a user experience that streamlines the association. Note, too, that when you create a manual relationship, you must configure the cascade options on the many-to-one relationships to ensure that if either of the related rows is removed, the cascade options automate the removal of the custom table row that tracks the relationship. If you don't properly configure the cascade options to delete the custom intersect table row, you'll leave orphan rows.

When choosing between the two approaches for your data model, keep in mind that there's no built-in support for converting between the two approaches. Once you choose an approach, you can't switch between them without migrating your data. Carefully evaluate any many-to-many relationship needs to determine if the custom table approach is necessary. Also consider whether you'll need extra data not only now but in the future. The manual many-to-many pattern, despite its complexity, provides more flexibility.

## Components

[Power Apps](/power-apps/) is used to implement the user experience of the solution. Makers  build the application to manage the data in Dataverse. Makers must implement the user experience for any many-to-many relationships they create.

[Dataverse](/power-apps/maker/data-platform/): Dataverse handles the data needs of the application. Dataverse provides many-to-one, one-to-many, and many-to-many relationship types to model real-world business data connections.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design workloads to align with business objectives and avoid unnecessary complexity or overhead**: Using the manual many-to-many pattern for all relationships of this type adds unnecessary complexity to application creation, maintenance, and the user experience. Be sure to evaluate each relationship to ensure the approach you choose is the best fit given your requirements.

### Security

**Design to protect confidentiality and integrity**: Relationships between data can be sensitive and directly impact business operations. By default, the Dataverse security model provides support for granular security on how data is related and what operations a user can perform against the data rows. When you create a manual many-to-many relationship that has a custom intersect table, you gain additional controls that can be used to manage who can do what with that relationship data.

### Operational Excellence

**Automate all tasks that don't benefit from the insight and adaptability of human intervention**: Use cascade automation on the relationships to automatically clean up custom intersect table rows when one of the related rows is removed.

### Experience Optimization

**Design for simplicity and efficiency**: Choosing the type of many-to-many relationship impacts how the user establishes the relationships between data rows in the application. When you use the manual pattern, establish a consistent way for users to relate data and optimize common interaction scenarios in a consistent manner across the application. For Power Apps model-driven applications, consider providing a more customized user experience when using the manual pattern. For example, by using a custom Power Apps canvas page or a Power Apps component framework (PCF) control, you can provide a similar streamlined interaction experience as in a Power Apps canvas app.

## Related resources

- [Microsoft Dataverse table relationships](/power-apps/maker/data-platform/create-edit-entity-relationships)
- [Create many-to-many table relationships using Power Apps](/power-apps/maker/data-platform/create-edit-nn-relationships-portal)
