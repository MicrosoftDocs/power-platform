---
title: Use REST APIs to extend the functionality of canvas apps
description: Learn how REST APIs can enhance your Power Apps canvas apps by shifting complex logic to the server and streamlining app development.
author: slaouist
ms.subservice: architecture-center
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mehdis
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/10/2025
---

# Use REST APIs to extend the functionality of canvas apps

Use REST APIs to centralize the business logic in your Power Apps canvas apps. This approach shifts the complexity of interacting with multiple systems to a RESTful component, simplifying the implementation of the canvas app while providing the same user experience. It also lets the app act as an integrator of multiple back-end services, providing a single view of data and logic from all sources. Power Platform custom connectors let canvas apps use the REST API like any other data source.

This article provides an example scenario and a generalized example architecture to illustrate how to use REST APIs to extend the functionality of canvas apps. The architecture example can be modified for many different scenarios and industries.

## Example architecture diagram

:::image type="content" source="media/canvas-rest-api/canvas-rest-api.png" alt-text="Architecture diagram illustrating the workflow for using REST APIs to extend the functionality of canvas apps." lightbox="media/canvas-rest-api/canvas-rest-api.png":::

## Components

[**Power Platform environment**](/power-platform/admin/environments-overview): Contains Power Platform resources that implement the user experience.

[**Power Apps**](/power-apps/): Implements the user experience of the solution.

[**Custom connector**](/connectors/custom-connectors/): Describes the operations and data structures of a RESTful API. Makers can use a custom connector created by the developer of the Azure function app as a data source in their canvas apps, just like any other data source.

[**Microsoft Entra ID**](/entra/identity/): Provides authentication and authorization for the function app and the custom connector.

[**Azure Functions**](/azure/azure-functions/): Implements the RESTful API that exposes the operations to the Power Apps canvas app. The function app can use any cloud data store, such as Azure Cosmos DB or Azure SQL, to manage the data.

[**Azure Cosmos DB**](/azure/cosmos-db/): A NoSQL database service that provides high availability and low latency for data storage and retrieval. In this example, it stores the data used by the Azure function app. You can also use other data stores, such as Azure SQL or Microsoft Dataverse.

## Example scenario

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Canvas app**: The Power Apps canvas app uses the custom connector to access operations exposed by the function app. The user authenticates to the app using Microsoft Entra ID, and access is limited to data that the user is authorized to access.

1. **Custom connector**: The custom connector lets the canvas app use the logic like any other data source.

1. **Microsoft Entra ID apps**: Separate Microsoft Entra ID apps secure access to the function app and custom connector operations.

1. **Azure function app**: The function app implements the RESTful API. It offers one or more operations that are exposed to the canvas app, either by exporting a custom connector from the Azure portal or by manual configuration.

1. **Azure Cosmos DB**: The function app can use Azure Cosmos DB, Azure SQL, or any other cloud data store it requires to manage the data. In fact, the function app could be working with data in Microsoft Dataverse using the function approach due to the complexity of the logic.

### Use cases

In the example, the In Store app is a canvas app that lets store associates quickly save a back-order notification request for a customer when an item is out of stock. The app uses a single operation, `RecordBackorder`, configured on a custom connector that describes a back-end Azure function app operation. In this example, the function app implements the REST API, but you can use any technology that supports creating a RESTful service.

This architecture offers flexibility, but requires more code-first developer work to develop and maintain the RESTful service and data layer. As the complexity of your canvas app formulas increases, consider this type of architecture. For example, when a view requires multiple data sources, using an API layer helps your app perform well because the data response is shaped server-side and delivered to the client more efficiently. This middle-tier layer also lets you add a server-side caching layer and implement richer telemetry for the app.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: Using the REST API approach with a custom connector reduces complexity and centralizes the logic so that other applications in the organization can use it. The custom connector allows Power Apps makers to use the operations from the RESTful API like any other data source operation.

**Test for resiliency and availability**: By shifting the logic from the canvas app to the REST API, you should be able to independently test the API separate from the app that uses it.

**Measure and publish the health indicators**: Capture telemetry from the REST API component to track its health. For example, use Azure Monitor Application Insights logging.

### Security

**Create intentional segmentation and perimeters**: Ensure that the app uses separate Power Platform environments to support your application lifecycle stages. Make sure that only the right users can access each stage to align with segmentation policies. It's also important to register separate Microsoft Entra ID apps for each environment to protect data and avoid mixing across environments.

### Operational Excellence

**Adopt safe deployment practices**: Standardize deployment of any changes to the canvas app by using automated deployment processes, such as pipelines. Promote the app to production only after testing the changes.

**Implement a deployment failure mitigation strategy**: With the dependency between the app and the REST API, you should ensure that you have a tested strategy to mitigate a rollout of either one that develops errors after the component is updated.

### Performance Efficiency

**Design to meet performance requirements**: Evaluate your solution's performance and data volume requirements, including how data is accessed. A canvas app that uses different data sources directly might be too chatty, slowing performance because of the latency of individual requests to each data store. If your app processes logic across many rows in the data source, consider whether you can shift all network traffic to a back-end Azure function app. This approach reduces interactions to a single REST API call, which manages interactions with multiple data sources more effectively.

**Optimize logic**: As logic becomes more complex in a canvas app, Azure Functions or similar back-end RESTful API implementations can offload that logic to a centralized reusable service. Using the custom connector capability to describe those RESTful APIs allows canvas apps to use their configured operations like any other data source.

**Test performance**: Along with testing for functionality and failures, it's important to test and develop a baseline for performance and evaluate it as part of your release cycle if the API is sensitive to changes in work completion times.

### Experience Optimization

- **Design for efficiency**: Solutions that let users access multiple data sources from a single canvas app, without interacting with multiple individual apps, improve user efficiency and provide a better visual experience.

## Related content

- [Azure REST API reference](/rest/api/azure/)
- [What is Azure Functions?](/azure/azure-functions/functions-overview?pivots=programming-language-csharp) 
