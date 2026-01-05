---
title: Optimize the performance of canvas apps that require complex business logic
description: Learn how to optimize Power Apps canvas app performance by shifting complex business logic to Dataverse using Power Fx functions or Dataverse custom APIs.
#customer intent: As a Power Apps maker, I want to optimize canvas app performance so that users experience faster and more efficient data operations.  
author: manuelap-msft
ms.author: mapichle
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 01/05/2026
ms.reviewer: jhaskett-msft
ms.contributors:
  - mapichle
---

# Optimize the performance of canvas apps that require complex business logic

As organizations increasingly rely on Power Platform to build scalable, data-driven applications, choosing the right approach for implementing business logic becomes critical. This reference architecture presents two options—Power Fx functions and Dataverse custom APIs—for optimizing performance and maintainability in Power Apps canvas applications.

## Scenario

By default, when an application queries data or performs multiple modifications, it sends individual HTTP network requests to Dataverse. Dataverse returns data to the application, and the application logic processes it.

This implementation pattern causes waiting times, especially when the app sends multiple requests, such as in a [ForAll function](../../power-fx/reference/function-forall.md). Waiting time negatively impacts performance and user experience. For example, if the app retrieves and transforms data multiple times in a ForAll loop, the overall waiting time can become substantial, leading to a slow and inefficient user experience.

To optimize data interaction, shift logic and data retrieval operations from the canvas app to Dataverse by using either Dataverse custom APIs or Power Fx functions. Data modification operations complete within a transaction, ensuring data consistency if an error occurs.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how canvas apps that use Dataverse can shift complex business logic to Dataverse custom APIs and Power Fx function to improve performance. You can modify the architecture example for many different scenarios and industries.

## Architecture diagram

In this diagram, Power Fx functions are used to shift complex business logic from the canvas app to Dataverse. You can also use a Dataverse custom API to achieve the same result. Refer to [Recommendations](#recommendations) to help decide which option to use.

:::image type="content" source="media/optimize-canvas-apps/arch.png" alt-text="Architecture diagram that shows the difference between using canvas app built-in capabilities for data operations and using Power Fx functions.":::

## Workflow

1. The Power Apps canvas application uses Dataverse to manage allocation of resources. The app uses a Power Fx function (a Dataverse custom API would serve the same purpose) for heavy data operations instead of directly using built-in access capabilities. The app still uses built-in Dataverse capabilities for lower-volume data operations and tasks that don't require transactional support.

1. The Power Fx function (with Dataverse custom API) is configured to pass input parameters from the calling app and receive the outcome (response parameters) from the function (or API) via defined output parameters. For:

    - **Power Fx function (preview):** Implement logic in the Power Apps studio. By using Power Fx functions, makers can construct complex logic with little or no coding expertise. Learn more in [Power Fx functions](#power-fx-functions).

    - **Dataverse custom API:** Implement logic by creating a Dataverse .NET plug-in. Custom .NET plug-ins require more coding knowledge but provide greater control and extensibility. Learn more in [Dataverse custom APIs](#dataverse-custom-apis).

## Use case details

Power Apps enables organizations to create custom user experiences and centralize business logic. By using Power Apps, you can achieve a more efficient data architecture and reduce the client-side workload.

In the following example, the Power Apps canvas application helps makers efficiently allocate resources to teams and tasks. You can apply this architecture pattern to similar scenarios where the canvas application includes data operations and requires:

- Multiple loops in the canvas app, which you can't achieve by using the [Concurrent function](../../power-fx/reference/function-concurrent.md) capability.
- Intensive calculations for multiple data transformations.
- Consistent execution time, independent of the number of items in a loop or the user's internet connection.
- Data consistency across multiple data modification operations.

To allocate resources, a maker needs to specify the locations, tasks, sub-tasks, and other related metadata of allocation. In the canvas app, the "Resource Overview" screen shows multiple levels of correlated data, such as:

- Resources
  - Location
    - Tasks
      - Sub-tasks
        - Approval


To accomplish this goal, you might implement the application logic by using Power Fx as follows:

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

This logic generates multiple HTTP calls to Dataverse when the application runs. While the best practice is to consolidate data into Dataverse views or use concurrent functions or other Power Fx techniques, this approach isn't always possible or it fails to meet performance objectives.

To address this problem, eliminate multiple HTTP calls from the canvas app by shifting the data transformation&mdash;processing of data and required results&mdash;into a single response. This approach reduces the waiting time for data retrieval, enhances the overall performance of the canvas app, and provides a smoother and more responsive user experience. By centralizing the data transformation logic, you ensure consistent and efficient processing on the server side, which makes the solution scalable for large volumes of data and complex transformations.

### Options

Both Dataverse custom APIs and Power Fx functions extend the business logic of Dataverse.

#### Power Fx functions

A Power Fx function creates an abstraction of the Dataverse custom API capability that you can use [Power Fx](../../power-fx/overview.md) for the logic.

Power Fx functions extend the business logic of Dataverse and can be invoked on demand from Power Platform components like Power Apps canvas apps, Power Automate flows, and from custom agents created with Microsoft Copilot Studio. This functionality supports the implementation of more basic logic that isn't complex enough to require using the full Dataverse custom API capability.

#### Dataverse custom APIs

A Dataverse plug-in is a custom event handler that executes in response to specific events. In the case of a Dataverse custom API, when you define the API, it creates a custom event that the application raises when it uses the API. You implement these plug-ins as custom classes compiled into a .NET Framework assembly, which you then upload and register within Dataverse.

Plug-ins extend the business logic of Dataverse by enabling developers to write custom code for execution when certain events occur, such as creating, updating, or deleting records, or through direct calls using the custom API. This functionality supports the implementation of more complex and tailored business processes within Power Platform, facilitating full integration with canvas apps or Power Automate.

By using both Power Fx functions and Dataverse custom APIs, makers can invoke a function action directly within a formula, supporting both bound and unbound actions. They can also add a Power Fx environment language object to their app, enabling access to functions. By using Dataverse custom APIs, makers can handle untyped object fields for both inputs and outputs.

## Recommendations

Both Power Fx functions and Dataverse custom APIs complete data modification operations in a transaction.

Choose **Power Fx functions** if your use case meets these criteria:

- Your logic **isn't overly complex** and can be expressed using Power Fx.
- You want to **empower makers** (non-developers) to build and maintain the logic.
- You prefer a **low-code approach** that integrates seamlessly with the Power Apps portal.
- You need **transactional consistency** but don't require advanced .NET capabilities.
- You want to **centralize logic** for reuse across apps and flows without involving .NET developers.

Learn more in [Functions in Microsoft Dataverse (preview)](/power-apps/maker/data-platform/functions-overview).

Choose **Dataverse custom APIs** if your use case requires:

- **Complex business logic** that Power Fx can't express.
- **Advanced capabilities** like custom error handling, telemetry, and integration with external systems.
- **.NET development expertise** is available and acceptable in your workflow.
- **Full control** over the execution pipeline, including plug-in registration and monitoring.
- **Telemetry and diagnostics**, such as [Application Insights](../../admin/overview-integration-application-insights.md) for health tracking.

Learn more in [Create and use custom APIs](/power-apps/developer/data-platform/custom-api).

If your goal is to streamline canvas app performance while keeping the solution accessible and maintainable by makers, Power Fx functions are the better choice. If you're building a mission-critical, highly customized backend, consider Dataverse custom APIs.

## Alternatives

Another approach to this pattern is to shift the data operations and logic to a REST API and then implement a custom connector to allow the operations to be used from Power Apps. The difference with this approach lies in where the logic and data operations execute. In this case, they run in the compute resource that implements the REST API, such as an Azure function.

Because they don't run within the Dataverse runtime sandbox, data operations are faster than those from the client but slower than those performed within Dataverse. Similarly, the logic doesn't run within the context of the Dataverse transaction. Unless special steps are taken, each data operation is independent and doesn't complete as a transactional unit.

Learn more in [Use REST APIs to extend the functionality of canvas apps](custom-connector-canvas.md).

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: Shifting your data operations and logic from your canvas app avoids unnecessary complexity in the app. This approach also centralizes the logic so that other applications in the organization can use it. In addition, Power Apps makers benefit from performance enhancements without adding complexity to the app.

**Test for resiliency and availability**: Moving the logic from the canvas app to either Dataverse custom APIs or Power Fx functions enables you to test the API or function independently from the app.

**Measure and publish health indicators (Dataverse custom APIs)**: Dataverse custom APIs provide advanced monitoring and telemetry through the .NET plug-in. To ensure adequate tracking, consider using [Application Insights](../../admin/overview-integration-application-insights.md) logging. 

### Operational Excellence

**Adopt safe deployment practices**: Standardize deployment of changes to the Power Apps application by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. As solution components, Dataverse custom APIs and Power Fx functions deploy alongside the app when they're in the same Dataverse solution. This approach minimizes the risk of out-of-sync components in your environments.

**Implement a deployment failure mitigation strategy**: When you deploy the app and the Dataverse custom API or Power Fx function together, your mitigation strategy is simplified because it follows the same rollback or fix strategy as the app.

### Performance Efficiency

**Design to meet performance requirements**: Evaluate your solution's performance and data volume requirements. Review how your app accesses data and whether Power Apps using different data sources slows performance due to the latency of the individual request sent to each data store. For example, if your app's logic works across many rows in the data source, you might be able to shift all network traffic to the custom API or function. Reducing to a single interaction with the custom API or function, which then handles communication with Dataverse, makes operations more efficient.

**Optimize logic (Dataverse custom APIs):** As logic becomes more complex in a canvas app, Dataverse custom APIs enable you to offload that logic to a centralized, reusable service.

**Test performance**: Along with testing for functionality and failures, test and develop a baseline for performance. Evaluate this baseline during your release cycle if the Dataverse custom API or Power Fx function is sensitive to changes in work completion time.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rui Santos](https://www.linkedin.com/in/ruisantosnor/)**, Principal Program Manager
- **[Ravikiran Patil](https://www.linkedin.com/in/ravikiran-patil-b73b1535/)**, Senior Software Engineer

## Related resources

- [Create and use custom APIs](/power-apps/developer/data-platform/custom-api)
- [Functions in Microsoft Dataverse (preview)](/power-apps/maker/data-platform/functions-overview)
- [Use Dataverse as a data source for canvas apps](dataverse-canvas-app.md)
- [Use REST APIs to extend the functionality of canvas apps](custom-connector-canvas.md)