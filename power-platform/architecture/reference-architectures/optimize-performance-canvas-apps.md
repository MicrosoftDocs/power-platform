---
title: Optimize the performance of canvas apps requiring complex business logic
description: Learn how to optimize Power Apps canvas app performance by shifting complex business logic to Dataverse using Power Fx functions or Dataverse custom APIs.
#customer intent: As a Power Apps maker, I want to optimize canvas app performance so that users experience faster and more efficient data operations.  
author: manuelap-msft
ms.author: mapichle
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 07/18/2025
ms.reviewer: jhaskett-msft
ms.contributors:
  - mapichle
---

# Optimize the performance of canvas apps requiring complex business logic

As organizations increasingly rely on Power Platform to build scalable, data-driven applications, choosing the right approach for implementing business logic becomes critical. This reference architecture presents two options—Power Fx functions and Dataverse custom APIs—for optimizing performance and maintainability in Power Apps canvas applications.

## Scenario

By default, when an application queries data or perform multiple modifications, it sends individual HTTP network requests to Dataverse. Data is returned to the application and the application logic processes it. 

This implementation pattern causes waiting times, especially when the app sends multiple requests, such as in a [ForAll function](../../power-fx/reference/function-forall.md). Waiting time negatively impacts performance and user experience. For example, if the app retrieves and transforms data multiple times in a ForAll loop, the overall waiting time can become substantial, leading to a slow and inefficient user experience.

To optimize data interaction, shift logic and data retrieval operations from the canvas app to Dataverse using either a Dataverse custom API or Power Fx function. Data modification operations complete within a transaction, ensuring data consistency if an error occurs.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how canvas apps that use Dataverse can shift complex business logic to Dataverse custom APIs and Power Fx function to improve performance. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

In this diagram, Power Fx functions are used to shift complex business logic from the canvas app to Dataverse. You can also use a Dataverse custom API to achieve the same result. For help deciding which option to use, see [Recommendations](#recommendations).

:::image type="content" source="media/optimize-canvas-apps/arch.png" alt-text="Architecture diagram that shows the difference between using canvas app built-in capabilities for data operations and using Power Fx functions.":::

## Workflow

1. The Power Apps canvas application uses Dataverse to manage allocation of resources. The app uses a Power Fx function (a Dataverse custom API would serve the same purpose) for heavy data operations instead of directly using built-in   access capabilities. The appstill uses built-in Dataverse capabilities for lower-volume data operations and tasks that don't require transactional support.

1. The Power Fx function (or Dataverse custom API) is configured to pass input parameters from the calling app and receive the outcome (response parameters) from the function (or API) via defined output parameters. For:

    - **Power Fx function (preview):** Logic is implemented in the Power Apps portal. With Power Fx functions, makers are able to construct complex logic with little or no coding expertise. Learn more in [Power Fx functions](#power-fx-functions).

    - **Dataverse custom API:** Logic is implemented by creating a Dataverse .NET plug-in. Custom .NET plug-ins require more coding knowledge but provides greater control and extensibility. Learn more in [Dataverse custom APIs](#dataverse-custom-apis).

## Use case details

Power Apps allows organizations to create custom user experiences and to centralize business logic, achieving a more efficient data architecture and reducing client-side workload.

In the example, the Power Apps canvas application allows makers to efficiently allocate resources to teams and tasks. This architecture pattern can be applied to similar scenarios where the canvas application includes data operations and/or requires:

- Multiple loops in the canvas app, which can't be achieved using the [concurrent function](../../power-fx/reference/function-concurrent.md) capability.
- Intensive calculations for multiple data transformations.
- Consistent execution time, independent of the number of items in a loop or the user's internet connection.
- Data consistency across multiple data modification operations.

To allocate resources a maker needs to specify the locations, tasks, sub-tasks, and other related metadata of allocation. In the canvas app, the "Resource Overview" screen shows multiple levels of correlated data, such as:

- Resources
  - Location
    - Tasks
      - Sub-tasks
        - Approval


To accomplish this, the application logic might be implemented using Power Fx as follows:

```powerapps-dot
ForAll(Resources,
    //Transformations
    ForAll(Location,
        //Transformations...
        ForAll(Tasks,
            //Transformations ...
        )
    )
)
```

This logic generates multiple HTTP calls to Dataverse when the application runs. While the best practice is to consolidate data into Dataverse views, or use concurrent functions or other Power Fx techniques, this approach isn't always possible or fails to meet performance objectives.

To address this issue, eliminate multiple HTTP from the canvas app by shifting the data transformation—processing of data and returning the required results in a single response. This approach reduces the waiting time for data retrieval, enhances the overall performance of the canvas app, and provides a smoother and more responsive user experience. Centralizing the data transformation logic ensures consistent and efficient processing on the server side, which makes the solution scalable for large volumes of data and complex transformations.

### Options

Both Dataverse custom APIs and Power Fx functions extend the business logic of Dataverse.

#### Power Fx functions

A Power Fx function is an abstraction of the Dataverse Custom API capability that allows Power Fx to be used for the logic. Internally, a Power Fx function executes like a Dataverse custom API and is an event handler that executes in response to specific events.

Power Fx functions extend the business logic of Dataverse and can be invoked on demand from Power Platform components like Power Apps canvas apps, Power Automate flows, and from custom agents created with Microsoft Copilot Studio. This functionality supports the implementation of more basic logic that isn't complex enough to require using the full Dataverse Custom API capability.

#### Dataverse custom APIs

A Dataverse plug-in is a custom event handler that executes in response to specific events. In the case of a Dataverse custom API, when the API is defined, it creates a custom event that is raised when the application uses the API. These plug-ins are implemented as custom classes compiled into a .NET Framework assembly, which are then uploaded and registered within Dataverse.

Plug-ins extend the business logic of Dataverse by enabling developers to write custom code for execution when certain events occur, such as creating, updating, or deleting records, or through direct calls using the custom API. This functionality supports the implementation of more complex and tailored business processes within Power Platform, facilitating full integration with canvas apps or Power Automate.

With both Power Fx functions and Dataverse custom APIs, makers can invoke a function action directly within a formula, supporting both bound and unbound actions. They can also add a Power Fx environment language object to their app, enabling access to functions. With Dataverse custom APIs, makers can handle untyped object fields for both inputs and outputs.

## Recommendations

Power Fx functions and Dataverse custom APIs complete data modification operations in a transaction.

Choose **Power Fx functions** if your use case meets these criteria:

- Your logic **isn't overly complex** and can be expressed using Power Fx.
- You want to **empower makers** (non-developers) to build and maintain the logic.
- You prefer a **low-code approach** that integrates seamlessly with the Power Apps portal.
- You need **transactional consistency** but don't require advanced .NET capabilities.
- You want to **centralize logic** for reuse across apps and flows without involving .NET developers.

Learn more in [Functions in Microsoft Dataverse (preview)](/power-apps/maker/data-platform/functions-overview).

Choose **Dataverse Custom APIs** if your use case requires:

- **Complex business logic** that Power Fx can't express.
- **Advanced capabilities** like custom error handling, telemetry, and integration with external systems.
- **.NET development expertise** is available and acceptable in your workflow.
- **Full control** over the execution pipeline, including plug-in registration and monitoring.
- **Telemetry and diagnostics**, such as [Application Insights](../../admin/overview-integration-application-insights.md) for health tracking.

Learn more in [Create and use custom APIs](/power-apps/developer/data-platform/custom-api).

If your goal is to streamline canvas app performance while keeping the solution accessible and maintainable by makers, Power Fx functions are the better choice. If you're building a mission-critical, highly customized backend, consider Dataverse Custom APIs.

## Alternatives

Another approach to this pattern is to shift the data operations and logic to a REST API and then implement a custom connector to allow the operations to be used from Power Apps. The difference with this approach lies in where the logic and data operations execute—in this case, in the compute resource that implements the REST API, such as an Azure function. 

Because they don't run within the Dataverse runtime sandbox, data operations are faster than those from the client but slower than those performed within Dataverse. Similarly, the logic doesn't run within the context of the Dataverse transaction. Unless special steps are taken, each data operation is independent and doesn't complete as a transactional unit. 

Learn more in [Use REST APIs to extend the functionality of canvas apps](custom-connector-canvas.md).

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: Shifting your data operations and logic from your canvas app avoids unnecessary complexity in the app. This approach also centralizes the logic so that other applications in the organization can use it. In addition, Power Apps makers benefit from performance enhancements without complexity to the app.

**Test for resiliency and availability**: Moving the logic from the canvas app to either Dataverse custom APIs or Power Fx functions enables you to test the API/function independently from the app.

**Measure and publish health indicators (Dataverse custom APIs)**: Dataverse custom APIs provide advanced monitoring and telemetry through the .NET plug-in. To ensure adequate tracking, consider using [Application Insights](../../admin/overview-integration-application-insights.md) logging. 

### Operational Excellence

**Adopt safe deployment practices**: Standardize deployment of changes to the Power Apps application by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. As solution components, Dataverse custom APIs and Power Fx functions deploy alongside the app when they're in the same Dataverse solution. This approach minimizes the risk of out-of-sync components in your environments.

**Implement a deployment failure mitigation strategy**: When you deploy the app and the Dataverse custom API/Power Fx function together, your mitigation strategy is simplified because it follows the same rollback or fix strategy as the app.

### Performance Efficiency

**Design to meet performance requirements**: Evaluate your solution's performance and data volume requirements. Review how data is accessed and whether Power Apps using different data sources slows performance due to the latency of the individual request sent to each data store. For example, if your app's logic works across many rows in the data source, you might be able to shift all network traffic to the custom API/function. Reducing to a single interaction with the custom API/function—which then handles communication with Dataverse—makes operations more efficient.

**Optimize logic (Dataverse custom APIs):** As logic becomes more complex in a canvas app, Dataverse custom APIs enable you to offload that logic to a centralized, reusable service.

**Test performance**: Along with testing for functionality and failures, test and develop a baseline for performance. Evaluate this baseline during your release cycle if the custom API/Power Fx function is sensitive to changes in work completion time.

## Related resources

- [Create and use custom APIs](/power-apps/developer/data-platform/custom-api)
- [Functions in Microsoft Dataverse (preview)](/power-apps/maker/data-platform/functions-overview)
- [Use Dataverse as a data source for canvas apps](dataverse-canvas-app.md)
- [Use REST APIs to extend the functionality of canvas apps](custom-connector-canvas.md)