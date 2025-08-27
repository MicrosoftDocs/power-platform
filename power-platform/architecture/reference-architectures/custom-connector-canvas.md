---
title: Use REST APIs to extend the functionality of canvas apps
description: Learn how to use REST APIs to extend the functionality of canvas apps
author: slaouist
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mehdis
ms.reviewer: jhaskett-msft
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Use REST APIs to extend the functionality of canvas apps

Microsoft Power Platform enables you to extend the functionality of your Power Apps canvas application by using REST APIs. When dealing with complex algorithms or with many data sources shifting the logic from the canvas app to a RESTful API can be a good choice to help keep your formulas within your  Power Apps canvas application simple while moving more complex functionality server-side. Power Platform custom connectors allow canvas apps to use the REST API just like another data source.

> [!TIP]
> The article provides an example scenario and visual representation of how to use REST APIs to extend the functionality of canvas apps. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/canvas-rest-api/canvas-rest-api.png" alt-text="Architecture diagram illustrating the workflow for using REST APIs to extend the functionality of canvas apps" lightbox="media/canvas-rest-api/canvas-rest-api.png":::

## Workflow

1. **Canvas app**: The Power Apps canvas app uses the custom connector to access operations exposed by the Azure Function. The user authenticates to the application using Entra ID and access to the data is limited to data the user has access to.
1. **Custom connector**: The custom connector describes which operations the application can use from the REST API which in the example is implemented by an Azure Function. By using a custom connector the Power Apps canvas application  is able to use the logic like any other data source.
1. **Microsoft Entra ID apps**: The Azure Function is secured using a Microsoft Entra ID app. A second Microsoft Entra ID app is registered and configured on the custom connector to allow the Power Apps canvas app to access the Azure Function operations.
1. **Azure Function**: The Azure Function implements the RESTful API offering one or more operations that are exposed to the Power Apps canvas application by either exporting a custom connector from the Azure Portal or by manual configuration. The Azure Function is secured by an Entra ID app registration to ensure only authorized callers.
1. **Azure Cosmos DB**: The Azure Function can use Azure Cosmos DB or Azure SQL or any other cloud data store it requires to manage the data. In fact, the function could be working with data in Microsoft Dataverse using the function approach  due to the complexity of the logic.

## Components

- **[Power Platform environment](/power-platform/admin/environments-overview)**: Contains the Power Platform resources such as the Power Apps that implement the In Store app user experience. These resources are moved from one environment to another (E.g. Dev to Test) using Dataverse solutions.
- **[Power Apps](/power-apps/)**: Power Apps is used to implement the user experience of the solution. Makers are able to build the application using the custom connector created by the developer of the Azure Function as an application data source.  
- **[Custom connector](/connectors/custom-connectors/)**: Power Platform custom connectors describe the operations and data structures of a RESTful API. They allow the API to be easily used from resources like a Power Apps canvas application. When used from Power Apps they allow the API to be referenced like any other data source.

## Scenario details

Power Apps allows organizations to create a custom user experience and by using REST APIs the business logic is centralized and accessed by the application using a custom connector. This approach can also allow the Power Apps application to act as an integrator of multiple backend services providing a single view to the user of data and logic from all the sources. Using the REST API approach, you can also shift the complexity of interacting with multiple other systems to component implementing the REST API and simplify the implementation of the canvas application, while at the same time still providing the same user experience.

In the example above, the In Store app is created using a Power Apps canvas application. The application allows a store associate to quickly save a backorder notification request for a customer when an item is out of stock. The application uses a single operation RecordBackorder that is configured on a custom connector that describes a backend Azure Function operation. In this example, the Azure Function is the implementation of the REST API. You can use any technology that allows creation of a RESTful service to implement this pattern.

This architecture offers flexibility, but also means that more code-first developer work is needed to develop and maintain the RESTful service and data layer. In general, as the complexity of the canvas app formulas increase, you should consider this type of architecture. For example, when multiple data sources are needed to build a single view, using an API layer can help to deliver a performant experience, because the data response can be shaped server-side and delivered to the client more efficiently. The use of this middle-tier layer means that you can add a server-side caching layer and implement richer telemetry for the app.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity** – Using the REST API approach from a Power Apps application via a custom connector avoids unnecessary complexity and also centralizing the logic where it could be used by other applications in the organization. The custom connector enables the Power Apps maker to be able to use the operations from the RESTFul API like any other data source operation.

**Test for resiliency and availability** – By shifting the logic from the canvas app to the REST API you should be able to independently test the API separate from the app that uses it.

**Measure and publish the health indicators** – telemetry should be captured from the REST API component to track its health. For example, using Azure Monitor – Application Insights logging would ensure adequate tracking of the component.

### Security

**Create intentional segmentation and perimeters** – Ensuring the application uses separate Power Platform environments for supporting your application lifecycle stages and ensuring only the right users have access to each stage can support your segmentation policies. It is also important that the Entra ID apps registered are separate between the environments to keep the protection of each stage of data and not mix across environments.

### Operational Excellence

**Adopt safe deployment practices** - Standardize deployment of any changes to the Power Apps application by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. 

**Implement a deployment failure mitigation strategy** – With the dependency between the application and the REST API you should ensure you have a tested strategy to mitigate a roll out of either that develops errors after one of the components is updated.

### Performance Efficiency

**Design to meet performance requirements** – Evaluate your solution performance and volume of data requirements.  Evaluation should include how data is accessed and evaluation of how Power Apps using different data sources directly might be too chatty with the data sources. This can create a performance slowdown due to the latency of the individual request being sent to each data store.  For example, if your application had logic that worked across a large number of rows in the data source, you might be able to shift all that network traffic to the backend Azure Function. Reducing to a single interaction with the REST API who in turn would manage interacting with the multiple other data sources where it could be done more effectively.

**Optimize logic** – As logic become more complex in a canvas app, Azure Functions or similar back end RESTful API implementations can offload that logic to a centralized reusable service. Using the custom connector capability to describe those RESTful APIs allow canvas apps to use their configured operations like any other data source.

**Test performance** – Along with testing for functionality, and failures it is important to test and develop a baseline for performance and evaluate it as part of your release cycle if the API is sensitive to changes in work completion times.

### Experience Optimization

**Design for efficiency** – Applications that allow users to access  multiple data sources from a single Power Apps application without requiring them to interact with multiple individual applications is making the user more efficient and is a good use of a more custom visual experience.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Mehdi Slaoui Andaloussi](https://www.linkedin.com/in/mehdi-slaoui-andaloussi-7450772/)**, Principal Engineering Manager

## Related resources

- [Azure REST API reference](/rest/api/azure/)
- [Azure Function overview](/azure/azure-functions/functions-overview?pivots=programming-language-csharp)
