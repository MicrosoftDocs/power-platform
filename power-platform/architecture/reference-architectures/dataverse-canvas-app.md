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

# Use the Dataverse connector with canvas apps  

Microsoft Dataverse is a good choice for line-of-business applications to use as a data source because it supports complex data and security models. Creating a Power Apps application that uses Dataverse as a data source lets you build a more custom user experience. These applications can also use other Power Platform connectors to integrate multiple data sources into a single application. Using Dataverse is a common upgrade/migration path for applications built with SharePoint lists, Microsoft Access, or data from other business applications.  

> [!TIP]  
> The article provides an example scenario and visual representation of how to use the Dataverse connector with canvas apps. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.  

## Architecture diagram  

:::image type="content" source="media/dataverse-canvas/dataverse-canvas.png" alt-text="Architecture diagram illustrating the workflow for using the Dataverse connector with canvas apps." lightbox="media/dataverse-canvas/dataverse-canvas.png":::  

## Workflow  

1. **Canvas app**: The Power Apps application uses the Dataverse connector to access data in the Dataverse environment. The user authenticates to the application using Microsoft Entra ID, and access to the data is limited to the data the user is authorized to access.  
1. **Dataverse connector**: The application uses the Dataverse connector, which lets you access a hierarchical data model where tables and their relationships are readily available without building complex lookups and joins to retrieve related tables. The connector also bypasses the traditional connector infrastructure and calls directly into the Dataverse back end, improving performance.
1. **Dataverse tables**: The Dataverse tables store data about the conference sessions hosted at a venue. The tables are related using one-to-many and many-to-many relationships. Dataverse security roles align with the roles of the application users. Logic can be implemented at the Dataverse level to calculate and roll up values, enforce domain values, and automate data operations.

## Components  

- **[Power Platform environment](/power-platform/admin/environments-overview)**: Contains the Power Platform resources such as the Power Apps that implement the conference user experience. These resources are moved from one environment to another (for example, Dev to Test) using Dataverse solutions.  
- **[Power Apps](/power-apps/)**: Power Apps is used to implement the user experience of the solution. Makers can build the application using the Dataverse data by adding the Dataverse table as an application data source.

## Use cases  

Power Apps lets organizations create custom user experiences for data stored in Microsoft Dataverse. Model-driven Power Apps are ideal for application scenarios that focus on forms over data. Canvas Power Apps work best for scenarios requiring more flexibility in visual layout customization. This approach is also useful when you need to provide users access to data from Dataverse and other data sources simultaneously. In those scenarios, the Power Apps application acts as the integrator, providing users a single view  of data from multiple sources.

## Considerations  

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](/power-platform/well-architected/).  

### Reliability  

**Design your workload to avoid unnecessary complexity**: Using Dataverse in a Power Apps application avoids the unnecessary complexity a traditional database solution might bring due to the abstractions and built-in logic capabilities Dataverse offers. The Dataverse connector supports the relationships and security model of the underlying Dataverse environment and frees the application maker from the complexity of building that support custom for each application.

### Security  

**Create intentional segmentation and perimeters**: Use separate Power Platform environments for application lifecycle stages, and ensure only the right users have access to each stage to support segmentation policies.

### Operational excellence  

**Adopt safe deployment practices**: Standardize deployment of any changes to the Power Apps application using automated deployment processes such as pipelines. Promote the application to production only after testing changes.  

### Performance efficiency  

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements to ensure your Dataverse table design is appropriate. Evaluation should include how data is accessed and evaluation of how Power Apps using the Dataverse connector delegate operations to the Dataverse infrastructure. Be aware of limitations [when searching and filtering data](/power-apps/maker/canvas-apps/connections/connection-common-data-service#power-apps-delegable-functions-and-operations-for-dataverse), due to the delegation support offered by the Dataverse connector. These limitations are documented in  [Understand delegation in a canvas app](/powerapps/maker/canvas-apps/delegation-overview) and should be taken into account when choosing the right data source or backend for your app.  

**Optimize logic**: By default, canvas applications using Dataverse implement logic using Power Fx, which may cause multiple interactions with Dataverse or repeated logic in multiple applications. Each operation is independent and isn't handled as an atomic transaction. For example, if the application created a Venue row but couldn’t create a session, the Venue row would remain. Dataverse supports [implementing logic](/power-apps/developer/data-platform/write-plug-in?tabs=pluginbase) that can be invoked on a Dataverse table event like on create of a row, and it also supports the concept of invoking logic on demand using the [Dataverse custom API](/power-apps/developer/data-platform/custom-api) or [Functions in Dataverse](/power-apps/maker/data-platform/functions-overview) capabilities. With both of these approaches, the work performed by the logic is in a transaction, and all work done with Dataverse data either commits or rolls back. In our previous example, the Venue row wouldn't have remained after the error occurred. Integrating these approaches optimizes logic in some scenarios by ensuring successful completion as a combined unit of work and centralizing reusable logic.  
 
### Experience optimization  

**Design for efficiency**: Applications that let users access other data sources alongside Dataverse tables from a single Power Apps application without requiring interaction with multiple individual applications improve efficiency and provide a better custom visual experience. Avoid just building an application to build an application&mdash;the application should provide some efficiency to the user or other architecture benefit over using a model-driven Power Apps experience. 

## Contributors  

_Microsoft maintains this article. The following contributors wrote this article._  

Principal authors:  

- **[Mehdi Slaoui Andaloussi](https://www.linkedin.com/in/mehdi-slaoui-andaloussi-7450772/)**, Principal Engineering Manager  

## Related resources  

- [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)  
- [Understanding delegation](/power-apps/maker/canvas-apps/delegation-overview)  