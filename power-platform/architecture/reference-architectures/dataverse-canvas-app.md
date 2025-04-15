---  
title: Use the Dataverse connector with canvas apps
description: Learn how to use the Dataverse connector with canvas apps to create custom user experiences and integrate multiple data sources seamlessly.
#customer intent: As a Power Apps maker, I want to use the Dataverse connector with canvas apps so that I can create custom user experiences and integrate multiple data sources seamlessly.  
author: slaouist  
ms.subservice: architecture-center  
ms.topic: example-scenario
ms.date: 04/01/2025
ms.author: mehdis  
ms.reviewer: pankajsharma2087  
contributors:  
  - manuelap-msft  
search.audienceType:  
  - admin  
  - flowmaker  
---  

# Use Dataverse as a data source for canvas apps

Microsoft Dataverse is a good choice to use as a data source for your canvas apps because it supports complex data and security models and lets you build a more custom user experience. Canvas apps can use the Dataverse connector with other Power Platform connectors to integrate multiple data sources, such as SharePoint lists, Microsoft Access databases, or data from other business applications. 

> [!TIP]  
> This article provides an example scenario and a generalized example architecture to illustrate how to use the Dataverse connector with canvas apps. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram  

:::image type="content" source="media/dataverse-canvas/dataverse-canvas.png" alt-text="Architecture diagram illustrating the workflow for using the Dataverse connector with canvas apps." lightbox="media/dataverse-canvas/dataverse-canvas.png":::  

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Canvas app**: A canvas app lets users manage conference details, such as the venue and session start and end times. The user authenticates to the app using Microsoft Entra ID, and access is limited to the data that the user is authorized to access.

1. **Dataverse connector**: The app uses the Dataverse connector to access conference data that's stored in Dataverse tables.

1. **Dataverse tables**: The Dataverse tables store data about the conference sessions hosted at a venue. The tables are related using one-to-many and many-to-many relationships. Dataverse security roles align with the roles of app users. Logic can be implemented at the Dataverse level to calculate and roll up values, enforce domain values, and automate data operations.

## Components  

[**Power Platform environment**](/power-platform/admin/environments-overview): Contains Power Platform resources that implement the user experience.

[**Power Apps**](/power-apps/): Implements the user experience of the solution.

[**Dataverse connector**](/connectors/commondataserviceforapps/): Lets you access a hierarchical data model where tables and their relationships are readily available, without building complex lookups and joins to retrieve related tables. The connector also bypasses the traditional connector infrastructure and calls directly into the Dataverse back end, improving performance.

## Scenario details

Power Apps makes it easy to create custom user experiences for data that's stored in Microsoft Dataverse. Model-driven apps are ideal for scenarios that focus on forms over data. Canvas apps work best for scenarios that require more flexibility in customizing the layout.

The architecture in this example is useful when you need to provide access to data from Dataverse and other sources simultaneously. In those scenarios, the app acts as the integrator, giving users a single view of data from multiple sources.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: Using Dataverse in your canvas apps avoids the complexity of a traditional database solution. The Dataverse connector offers abstractions and built-in logic capabilities and supports the relationships and security model of the underlying Dataverse environment. It frees app makers from having to build that support into their apps themselves.

### Security

**Create intentional segmentation and perimeters**: Use separate Power Platform environments for application life cycle stages, and ensure that only the right users have access to each stage to support segmentation policies.

### Operational Excellence

**Adopt safe deployment practices**: Standardize deployment of any changes to your canvas apps using automated deployment processes such as pipelines. Promote the app to production only after testing those changes.  

### Performance Efficiency

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements to ensure that your Dataverse table design is appropriate. Your evaluation should include how data is accessed and how your apps that use the Dataverse connector delegate operations to the Dataverse infrastructure. Be aware of limitations that might apply when searching and filtering data because of the delegation support offered by the Dataverse connector. For example, some functions and operations can't be delegated, which means that the app retrieves all data from the server and then filters it on the client side. This behavior can lead to performance issues when working with large datasets. Learn more in [Query limitations: Delegation and query limits](/powerapps/maker/canvas-apps/delegation-overview).

**Optimize logic**: By default, canvas apps that get data from Dataverse implement logic using Power Fx, which might cause multiple interactions with Dataverse or repeated logic in multiple applications. Each operation is independent and isn't handled as an atomic transaction. For example, if the app created a venue row but couldn't create a session, the venue row would remain. In Dataverse, logic can be invoked on a Dataverse table event, like the creation of a row, or on demand using a custom API or Dataverse functions. With both of the latter approaches, the logic performs work in a transaction, and all work done with Dataverse data either commits or rolls back. In our example, the venue row wouldn't have remained if the session couldn't be created. Integrating these approaches optimizes logic in some scenarios by ensuring successful completion as a combined unit of work and centralizing reusable logic. Learn more in [Write a plug-in](/power-apps/developer/data-platform/write-plug-in?tabs=pluginbase), [Create and use custom APIs](/power-apps/developer/data-platform/custom-api), and [Functions in Microsoft Dataverse](/power-apps/maker/data-platform/functions-overview).

### Experience Optimization

**Design for efficiency**: A canvas app that lets users access other data sources alongside Dataverse tables, without requiring interaction with multiple individual apps, improves efficiency and provides a better experience. Avoid building an app to build an app, however&mdash;the app should provide some efficiency to the user or another architecture benefit over using a model-driven app experience.

## Contributors  

_Microsoft maintains this article. The following contributors wrote this article._  

Principal authors:  

- **[Mehdi Slaoui Andaloussi](https://www.linkedin.com/in/mehdi-slaoui-andaloussi-7450772/)**, Principal Engineering Manager  

## Related resources  

- [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)  
- [Understanding delegation](/power-apps/maker/canvas-apps/delegation-overview)
