---  
title: Use Dataverse as a data source for canvas apps
description: Learn how to use the Dataverse connector with canvas apps to create custom user experiences and integrate multiple data sources seamlessly.
#customer intent: As a Power Apps maker, I want to use the Dataverse connector with canvas apps so that I can create custom user experiences and integrate multiple data sources seamlessly.  
author: slaouist  
ms.subservice: architecture-center  
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mehdis  
ms.reviewer: pankajsharma2087  
contributors:  
  - manuelap-msft  
search.audienceType:  
  - admin  
  - flowmaker  
---  

# Use Dataverse as a data source for canvas apps

Microsoft Dataverse is a good choice to use as a data source for your canvas apps because it supports complex data and security models and lets you build a more custom user experience. Canvas apps can use Dataverse as a data source with other Power Platform connectors to integrate multiple data sources, such as SharePoint lists, Microsoft Access databases, or data from other business applications. Power Apps doesn't use a connector to work with Dataverse. It connects directly to Dataverse outside of the connector framework.  

> [!TIP]  
> This article provides an example scenario and a generalized example architecture to illustrate how to use Dataverse as a data source in a canvas apps. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram  

:::image type="content" source="media/dataverse-canvas/dataverse-canvas.png" alt-text="Architecture diagram illustrating the workflow for using the Dataverse connector with canvas apps." lightbox="media/dataverse-canvas/dataverse-canvas.png":::  

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Canvas app**: A canvas app lets users manage conference details, such as the venue and session start and end times. The canvas app directly accesses data in Dataverse. The user authenticates to the Power Platform using Microsoft Entra ID, and that same ID is used to access to the data. Any restrictions placed on the user's Entra ID in Dataverse are enforced seamlessly.  

1. **Dataverse data source**: The canvas app uses Dataverse as a data source. It lets you access a relational data model where tables and their relationships are readily available. The built-in option set feature means you don't have to build complex lookups and joins. Performance is also generally good because Power Apps connects directly to Dataverse.  

1. **Dataverse tables**: In this example, the Dataverse tables store data about the conference sessions hosted at a venue. The tables are related using one-to-many and many-to-many relationships. Dataverse security roles align with the roles of app users. Logic can be implemented at the Dataverse level to calculate and roll up values, enforce domain values, and automate data operations.

## Components  

[**Power Platform environment**](/power-platform/admin/environments-overview): Contains Power Platform resources that implement the user experience.

[**Power Apps**](/power-apps/): Implements the user experience of the solution. Makers can build a canvas app with Dataverse by adding the Dataverse table as an application data source.

[**Dataverse connector**](/connectors/commondataserviceforapps/): Lets you access a hierarchical data model where tables and their relationships are readily available, without building complex lookups and joins to retrieve related tables. The connector also bypasses the traditional connector infrastructure and calls directly into the Dataverse back end, improving performance.

## Scenario details

Power Apps makes it easy to create custom user experiences for data that's stored in Microsoft Dataverse. Model-driven apps are ideal for scenarios that focus on forms over data. Canvas apps work best for scenarios that require more flexibility in customizing the layout.

The architecture in this example is useful when you need to provide access to data from Dataverse and other sources simultaneously. In those scenarios, the app acts as the integrator, giving users a single view of data from multiple sources.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: Dataverse's built-in abstractions and features help you avoid the unnecessary complexity a traditional database solution might require. For example, Dataverse supports built-in relationships, smart data types, option sets, and a security model.

### Security

**Create intentional segmentation and perimeters**: Use separate Power Platform environments for application life cycle stages, and ensure that only the right users have access to each stage to support segmentation policies.

### Operational Excellence

**Adopt safe deployment practices**: Standardize deployment of any changes to your canvas apps using automated deployment processes such as pipelines. Deploy the application to a production environment only after testing changes.  

### Performance Efficiency

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements to ensure your Dataverse table design is appropriate. Evaluation should include how data is accessed and evaluation of how your app delegates operations to Dataverse. Be aware of delegation limitations [when searching and filtering data.](/power-apps/maker/canvas-apps/connections/connection-common-data-service#power-apps-delegable-functions-and-operations-for-dataverse.) These limitations are documented in  [Understand delegation in a canvas app](/powerapps/maker/canvas-apps/delegation-overview) and should be taken into account when choosing the right data source for your app.  

**Optimize logic**: By default, canvas applications using Dataverse implement logic using Power Fx, which may cause multiple interactions with Dataverse or repeated logic in multiple applications. Each operation is independent and isn't handled as an atomic transaction. For example, if the application created a Venue row but couldn’t create a session, the Venue row would remain. Dataverse supports [implementing logic](/power-apps/developer/data-platform/write-plug-in?tabs=pluginbase) that can be invoked on a Dataverse table event. For example, creation of a row. It also supports the concept of invoking logic on demand using the [Dataverse custom API](/power-apps/developer/data-platform/custom-api) or [Functions in Dataverse](/power-apps/maker/data-platform/functions-overview) capabilities. With both of these approaches, the work performed by the logic is in a transaction. All work done in Dataverse data either commits or rolls back. In our previous example, the Venue row wouldn't have remained after the error occurred. Integrating these approaches optimizes logic in some scenarios by ensuring successful completion as a combined unit of work and centralizing reusable logic. 

### Experience Optimization

**Design for efficiency**: A canvas app that lets users access other data sources alongside Dataverse tables, without requiring interaction with multiple individual apps, improves efficiency and provides a better experience. Avoid building an app to build an app, however&mdash;the app should provide some efficiency to the user or another architecture benefit over using a model-driven app experience.

## Contributors  

_Microsoft maintains this article. The following contributors wrote this article._  

Principal authors:  

- **[Mehdi Slaoui Andaloussi](https://www.linkedin.com/in/mehdi-slaoui-andaloussi-7450772/)**, Principal Engineering Manager  

## Related resources  

- [Microsoft Dataverse and Power Apps](/connectors/commondataserviceforapps/)  
- [Understanding delegation](/power-apps/maker/canvas-apps/delegation-overview)
