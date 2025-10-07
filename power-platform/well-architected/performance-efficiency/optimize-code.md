---
title: Optimize code and logic recommendation for Power Platform workloads
description: Learn how to optimize your code and logic to support the performance requirements of a Power Platform workload.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for optimizing logic

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:06](checklist.md)| **Use logic that's performant, and ensure that it offloads responsibilities to the platform. Use logic only for its intended purpose and only when necessary.**|
|---|---|

This guide describes the recommendations for optimizing code and infrastructure performance. To optimize your code and infrastructure, you should use your components only for their core purpose and only when required. When you overuse code and infrastructure, it creates unnecessary resource consumption, bottlenecks, and slow responses. To compensate for those inefficiencies, you must add more resources to accomplish the same tasks.

**Definitions**

| Term | Definition |
|---|---|
| Concurrency | When multiple tasks or processes are performed at once but not necessarily at the exact same time. |
| Parallelism | When multiple tasks or processes are performed at the same time. |

## Key design strategies

Optimizing logic and infrastructure entails fine-tuning the logic and the supporting infrastructure to improve performance efficiency. It requires performant logic that executes tasks quickly and doesn't waste resources. It requires a well-designed infrastructure that is streamlined to avoid unnecessary complexity. A workload should use the inherent capabilities of the platform. This approach helps ensure both logic and infrastructure are used primarily for their core purposes and only when needed.

### Optimize logic performance

To optimize logic performance, modify code to reduce resource usage, minimize runtime, and enhance performance. You can modify logic to improve the efficiency and speed of an app or flow. Don't mask performance issues with brute force. Brute force means adding compute resources to compensate for code performance, like adding extra capacity instead of addressing the source. You need to fix performance issues with optimization. When you optimize logic performance, it helps maximize the utilization of system resources, improves response time, reduces latency, and enhances the user experience.

### Instrument your logic

Instrumenting logic refers to the practice of adding custom event logging to collect data and monitor logic performance during runtime. Logic instrumentation allows developers to gather information about key metrics such execution time. By instrumenting logic, developers can gain insights into logic hot paths, identify performance bottlenecks, and optimize the logic for better performance efficiency.

Ideally, you should perform logic analysis early in the software development lifecycle. The earlier you catch a logic issue, the cheaper it is to fix. You want to automate as much of this logic analysis as possible. Use dynamic and static code analysis tools to reduce the manual effort. For example, [Flow Checker](/power-automate/error-checker) can highlight logic that isn’t expected to be performant, such as a query that doesn’t specify filter criteria. However, keep in mind that this testing is still a simulation of production. Production provides the clearest understanding of logic optimization.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Logic monitoring tools are likely to increase costs.

### Identify hot paths

By instrumenting your logic, you can measure the resource consumption for different logic paths. These measurements help you identify hot paths. Hot paths have a significant effect on performance and resource usage. They're critical or frequently executed sections of a program that require high performance and low latency. 

To identify code hot paths, consider these steps:

- _Analyze runtime data_: Collect runtime data and analyze it to identify areas of the logic that consume the most elapsed time. Look for patterns or sections of logic that are frequently executed or take a long time to complete.

- _Measure performance_: Use profiling tools or performance testing frameworks to measure the execution time and resource consumption of different logic paths. This process helps identify bottlenecks and areas for improvement. For example, you can use [Monitor](/power-apps/maker/monitor-overview) in Power Apps to gain a better understanding of how the events and formulas of your app work so you can improve performance.

- _Consider business logic and user effect_: Evaluate the importance of different logic paths based on their relevance to the application's functionality or critical business operations. Determine which logic paths are crucial for delivering value to users or to meeting performance requirements.

### Optimize logic

Optimizing logic is about refining the structure and design of logic to perform tasks with fewer resources. Improved logic reduces unnecessary operations. It creates faster execution with less resource consumption. You should remove any unnecessary operations within the logic path that might affect performance. Prioritize optimizing hot paths to see the greatest performance efficiency gains. 

To optimize logic, consider the following strategies:

- _Remove unnecessary function calls_: Review your logic and identify any functions that aren't essential for the desired functionality and might affect performance negatively. For example, if a function call performs a validation completed earlier in the code, you can remove the unnecessary validation function call.

- _Minimize logging operations_: Logging can be helpful for debugging and analysis, but excessive logging can affect performance. Evaluate the necessity of each logging operation and remove any unnecessary logging calls that aren't critical for performance analysis. A good practice is to allow your system to turn logging on and off, to assist in debugging while not causing production performance problems.

- _Optimize loops and conditionals_: Analyze loops and conditionals in your logic and identify any unnecessary iterations or conditions that can be eliminated. Simplifying and optimizing these structures can improve the performance of your code. Minimize function calls within loops, and eliminate redundant calculations. Consider moving computations outside the loop.

- _Reduce unnecessary data processing_: Review your logic for any unnecessary data processing operations, such as redundant calculations or transformations. Eliminate these unnecessary operations to improve the efficiency of your logic. For example, use [Dataverse calculated columns, rollup fields](/power-apps/developer/data-platform/calculated-rollup-attributes) or [Power Fx columns](/power-apps/maker/data-platform/formula-columns) instead of calculating the value in code and storing it with a save operation.

- _Optimize data structures._ To efficiently store and retrieve data, select appropriate data structures and only the required data columns. Choose the best data structure for a specific problem. A suitable data structure improves application performance.

- _Minimize network requests_: If your logic involves making network requests (for example, using a connector action), minimize the number of requests and optimize their usage. Batch requests when possible and avoid unnecessary round trips to improve performance.

- _Reduce data structure size_: Review the data requirements and eliminate any unnecessary fields or properties. Optimize memory usage by selecting appropriate data types and packing data efficiently.

- _Do work asynchronously_: Evaluate if work could be done asynchronously instead of synchronously in your logic. For example, instead of performing the operation inline, consider implementing a Power Automate flow to process the work asynchronously.

- _Configure before customizing._ Use standard application components if you can. Customizations such as plug-ins and JavaScript can affect performance.

- _Minimize controls._ Display only the fields you need in the forms—too many fields can clutter the user interface and affect performance. Minimize the number of controls in the command bar, canvas app, or custom page. Avoid nesting galleries or adding too many components to a gallery.

- _Optimize data queries._ Only load the data that you need in an app or flow. Use server-side views to prefilter data to narrow down data relevant to your query.

Review the performance recommendations specific to the Power Platform product you're working with. Evaluate your logic against these recommendations to identify areas for improvement.

Learn more about [Power Automate cloud flow coding guidelines](/power-automate/guidance/coding-guidelines/), [Power Apps coding guidelines](/power-apps/guidance/coding-guidelines/overview), and [Power Automate desktop flow coding guidelines](/power-automate/guidance/desktop-flow-coding-guidelines/) to optimize logic.

[!INCLUDE [pp-tip-powercat-toolkit](~/../shared-content/shared/guidance-includes/pp-tip-powercat-toolkit.md)]

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Optimizing logic and hot paths requires expertise. Identifying logic inefficiencies is subjective and might require highly skilled individuals, whom you may need to pull from other tasks.

### Use concurrency and parallelism

Using concurrency and parallelism involves executing multiple tasks or processes either simultaneously or in an overlapping manner to make efficient use of computing resources. These techniques increase the overall throughput and the number of tasks that a workload can process. When you run tasks concurrently or in parallel, it can reduce the runtime of the application and increase response times. 

Concurrency and parallelism effectively distribute the workload among the computing resources. When increasing concurrency or parallelism, consider the impact on other systems, as you might exceed their limits. For example, a concurrent loop in a Power Automate flow processing each item at a time could surpass the request limits of a connector used in the loop's logic.

**Use parallelism.** Parallelism is the ability of a system to simultaneously trigger multiple tasks or processes on multiple computing resources. Parallelism divides a workload into smaller tasks that are run in parallel. When you run logic in parallel, performance improves because the workload is distributed across multiple branches.

**Use concurrency.** Concurrency is the ability of a system to run multiple tasks or processes. Concurrency enables different parts of a workload to make progress independently, which can improve overall performance.

- Concurrent execution: Concurrent execution allows the same logic to run simultaneously. Limiting concurrent execution to one can have the effect of serializing logic, resulting in processing one item at a time. Controlling the amount of concurrent execution of workload items can help manage resource usage during processing. For example, Power Automate flow loops can be configured to process multiple actions in parallel using the Concurrent Control property. 

    > [!NOTE]
    > Before you enable concurrency, keep in mind that this means multiple actions will be performed at the same time—if you're writing data as part of the loop, ensure the destination of the data can handle simultaneous requests.

- _Queues_: A queue is a storage buffer located between a requesting component (producer) and the processing component (consumer) of the workload. There can be multiple consumers for a single queue. As the tasks increase, you should scale the consumers to meet the demand. The producer places tasks in a queue. The queue stores the tasks until a consumer has capacity. A queue is often the best way to hand off work to a processing service that experiences peaks in demand. For more information, see [Queue-Based Load Leveling pattern](/azure/architecture/patterns/queue-based-load-leveling) and [Storage queues and Service Bus queues](/azure/service-bus-messaging/service-bus-azure-and-service-bus-queues-compared-contrasted).

### Optimize background jobs

Many applications require background tasks that run independently of the user interface. The application can start the job and continue to process interactive requests from users. Examples of background jobs include batch jobs, processor-intensive tasks, and long-running processes, such as workflows. Background tasks shouldn't block the application or cause inconsistencies due to delayed operation when the system is under load. For more information on optimizing background jobs, see [Recommendations for developing background jobs](/power-platform/well-architected/reliability/background-jobs).

## Power Platform facilitation

**Instrumenting code**: When building canvas apps, performant patterns should be used to enhance app efficiency, while anti-patterns should be avoided. For more information, see [Overview of creating performant Power Apps](/power-apps/maker/canvas-apps/create-performant-apps-overview). Use [Monitor](/power-apps/maker/monitor-overview) in Power Apps to diagnose and troubleshoot performance issues during development.

**Measure engagement and outcomes**: When building agents, tracking [conversation engagement](/microsoft-copilot-studio/guidance/measuring-engagement) and [outcomes](/microsoft-copilot-studio/guidance/measuring-outcomes) is essential for measuring agent performance metrics and discovering areas for improvement.

**Optimizing code logic**: With the [solution checker](/power-apps/maker/data-platform/use-powerapps-checker) feature, you can perform a rich static analysis check on your solutions against a set of best-practice rules and quickly identify problematic patterns. With [Flow Checker](/power-automate/error-checker), you can get insights into which areas of your flow's implementation pose a performance risk?

**Using concurrency and parallelism**: Power Automate cloud flows support concurrency in loops and triggers. Note that [concurrency, looping, and debatching limits](/power-automate/limits-and-config#concurrency-looping-and-debatching-limits) apply and are based on your performance profile. Power Apps support concurrency using the [Concurrent](/power-platform/power-fx/reference/function-concurrent) function.

**Optimizing Dataverse performance**: Microsoft Dataverse provides an extensible framework that allows developers to build highly customized and tailored experiences. When you're customizing, extending, or integrating with Dataverse, be aware of the established guidance and best practices. See [Best practices and guidance when using Microsoft Dataverse](/power-apps/developer/data-platform/best-practices/).

## Related information

- [Manage solution performance](/power-platform/architecture/key-concepts/performance/)
- [Concurrency, looping, and debatching limits in Power Automate](/power-automate/limits-and-config#concurrency-looping-and-debatching-limits)
- [Product-specific guidance for optimizing Dynamics 365 performance](/dynamics365/guidance/implementation-guide/performing-solution-product-specific-guidance)
- [Performance tuning and optimization for customer engagement apps](/power-platform/admin/performance-tuning-and-optimization)
- [Overview of creating performant Power Apps](/power-apps/maker/canvas-apps/create-performant-apps-overview)
- [Monitor overview](/power-apps/maker/monitor-overview)
- [Improve component performance, stability, and reliability with solution checker](/power-apps/maker/data-platform/use-powerapps-checker)

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
