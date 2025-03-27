---
title: ​​Use the Dataverse connector with canvas apps​ 
description: Learn how to use the Dataverse connector with canvas apps​ 
author: slaouist
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/22/2025
ms.author: mehdis
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# ​​Use the Dataverse connector with canvas apps​ 

Microsoft Dataverse is a good choice for line of business applications to use as a data source because it provides support for more complex data and security models. Creating a Power Apps application that uses Dataverse as a data source can enable building a more custom user experience. These applications can also use other Power Platform connectors to integrate multiple data sources into a single application.  Using Dataverse is a common upgrade/migration path for applications built with SharePoint Lists, Microsoft Access or data from other business applications.

> [!TIP]
> The article provides an example scenario and visual representation of how to use the Dataverse connector with canvas apps. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/dataverse-canvas/dataverse-canvas.png" alt-text="Architecture diagram illustrating the workflow for using the Dataverse connector with a canvas apps" lightbox="media/dataverse-canvas/dataverse-canvas.png":::

## Workflow

1. **Canvas app**: The Power Apps application uses the Dataverse connector to access data in the Dataverse environment. The authenticates to the application using Entra ID and access to the data is limited to data the user has access to. 
1. **Dataverse connector**: The application uses the Dataverse connector which allows access to a hierarchical data model where tables and their relationships are readily available without the need to build complex lookups and joins to retrieve related tables. The connector also bypasses the traditional connector infrastructure and calls directly into the Dataverse back end, leading to better performance.
1.	**Dataverse tables**: The Dataverse tables contain the data about the conference sessions being hosted at a venue. The tables are related together using one-to-many and many-to-many relationships. Dataverse security roles are created to align with the roles of the application users. Logic can be implemented at the Dataverse level to calculate and rollup values, enforce domain values as well as automate data operations.

## Components

- **[Power Platform environment](/power-platform/admin/environments-overview)**: Contains the Power Platform resources such as the Power Apps that implement the Conference user experience. These resources are moved from one environment to another (E.g. Dev to Test) using Dataverse solutions.
- **[Power Apps](/power-apps/)**: Power Apps is used to implement the user experience of the solution. Makers are able to build the application using the Dataverse data by adding the Dataverse table as an application data source.  

## Use cases

Power Apps allows organizations to create a custom user experience for data stored in Microsoft Dataverse. Model-driven Power Apps should be considered for application scenarios that are primarily forms over data. Canvas Power Apps are best for scenarios where more flexibility on visual layout customization is needed. This approach should also be considered when you need to provide users access to data from Dataverse as well as other data sources at the same time. In those scenarios, the Power Apps application acts as the integrator providing a single view to the user of data from multiple sources.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](/power-platform/well-architected/).

### Reliability

**Design your workload to avoid unnecessary complexity** – Using Dataverse from a Power Apps application avoids unnecessary complexity a traditional database solution might require due to the abstractions and built-in logic capabilities Dataverse offers. The Dataverse connector supports the relationships and security model of the underlying Dataverse environment and free the application maker from the complexity of building that support custom for each application. 

### Security

**Create intentional segmentation and perimeters** – Ensuring the application uses separate Power Platform environments for supporting your application lifecycle stages and ensuring only the right users have access to each stage can support your segmentation policies. 

### Operational Excellence

**Adopt safe deployment practices** - Standardize deployment of any changes to the Power Apps application by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. 

### Performance Efficiency

**Design to meet performance requirements** – Evaluate your solution performance and volume of data requirements to ensure your Dataverse table design is appropriate.  Evaluation should include how data is accessed and evaluation of how Power Apps using the Dataverse connector delegate operations the Dataverse infrastructure. Be aware of some limitations [when searching and filtering data](/power-apps/maker/canvas-apps/connections/connection-common-data-service#power-apps-delegable-functions-and-operations-for-dataverse), due to the delegation support offered by the Dataverse connector. These limitations are documented in the [Understand delegation in a canvas app](/powerapps/maker/canvas-apps/delegation-overview) topic, and should be taken into account when choosing the right data source or back end for your app.

**Optimize logic** – By default canvas applications using Dataverse implement logic using Power Fx and this may cause multiple interactions with Dataverse or logic to be repeated in multiple applications. Each of these operations are independent and they are not handled as an atomic transaction. For example, if the application created a Venue row, but couldn’t create a session, the Venue row would remain. Dataverse supports [implementing logic](/power-apps/developer/data-platform/write-plug-in?tabs=pluginbase) that can be invoked on a Dataverse table event like on create of a row and it also supports the concept of invoking logic on demand using the [Dataverse custom API](/power-apps/developer/data-platform/custom-api) or [Functions in Dataverse](/power-apps/maker/data-platform/functions-overview) capabilities. With both these approaches the work performed by the logic is in a transaction and all work done with Dataverse data either commits or rolls back. In our previous example, the Venue row would not have been left after the error occurred. Integrating these approaches can optimize some scenarios logic by ensuring its successful completion as a combined unit of work and also can act as a centralization of reusable logic.

### Experience Optimization

**Design for efficiency** – Applications that allow users to access  other data sources in addition to Dataverse tables from a single Power Apps application without requiring them to interact with multiple individual applications is making the user more efficient and is a good use of a more custom visual experience. Avoid just building an application to build an application, the application should provide some efficiency to the user or other architecture benefit over using a model-driven Power Apps experience.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Mehdi Slaoui Andaloussi](https://www.linkedin.com/in/mehdi-slaoui-andaloussi-7450772/)**, Principal Engineering Manager

## Related resources

- [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
- [Understanding delegation](/power-apps/maker/canvas-apps/delegation-overview)
