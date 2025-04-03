---
title: Implement distributed tracing across multiple services​ in Power Platform
description: Learn how to implement distributed tracing to trace events across multiple Power Platform services using distributed tracing for comprehensive observability.
#customer intent: As a Power-Platform user, I want to trace events that occur across multiple services in my Power Platform solution.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/24/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
ms.contributors:
  - grarchib
search.audienceType:
  - admin
  - flowmaker
---

# Implement distributed tracing across multiple services​ in Power Platform

Distributed tracing is a method used to profile and monitor applications, especially those built using a microservices architecture. It allows you to trace an event in the system from one service to another and retrieve end-to-end diagnostics about performance and latency. The [W3C TraceContext](https://www.w3.org/TR/trace-context/) standard defines how context information is sent and modified between services, enabling distributed tracing scenarios.

In this article, learn more about distributed tracing, practical applications and use cases, and how to implement distributed tracing across multiple services in Power Platform.

## Trace ID and Span ID

In the W3C TraceContext standard, each trace is assigned a globally unique 16-byte trace-ID, and every activity within the trace is assigned a unique 8-byte span-ID. The trace-ID represents the overall transaction, while the span-ID represents individual operations within that transaction. Each activity records the trace-ID, its own span-ID, and the span-ID of its parent, establishing parent-child relationships between activities.

## Example Scenario

Let's consider an example where a browser starts a transaction, multiple microservices interact, and a call is made to the Dataverse web API

| Source | Trace ID and Span ID |
| --- | --- |
| Browser | trace parent: 00-11111111111111111111111111111111-2222222222222222-01 |
| Kubernetes | trace parent: 00-11111111111111111111111111111111-3333333333333333-01 |
| Dataverse | trace parent: 00-11111111111111111111111111111111-4444444444444444-01 |

1. **Browser initiates transaction**: The browser sends a request to a web server. This request is assigned a trace-ID and a span-ID (let's call it span-ID-1).
1. **Microservices interaction**: The web server processes the request and makes a call to a microservice. This call is assigned a new span-ID (span-ID-2) but retains the same trace-ID. The microservice, in turn, calls another microservice, creating another span-ID (span-ID-3), and so on.
1. **Call to Dataverse web API**: One of the microservices makes a call to the Dataverse Web API. This call is assigned a new span-ID (span-ID-4) but retains the same trace-ID.

## Trace ID and parent-child relationship

The trace-ID is used to join all transactions with a parent-child relationship. Each span-ID represents a unique operation within the trace, and the parent span-ID links it to its parent operation. This hierarchical structure allows you to trace the entire transaction from the initial request to the final response, even as it traverses multiple services and systems.

## Trace ID and operation ID lookup

The W3C TraceId field is mapped in Application Insights to the operation ID. This allows you to easily query a set of related actions that occur as part of the end to end trace.

:::image type="content" source="media/distributed-tracing/trace-id-field.png" alt-text="Screenshot of the Operation ID field mapped in Application Insights. " lightbox="media/distributed-tracing/trace-id-field.png":::

## Practical applications and benefits

Using the W3C TraceContext standard for distributed tracing offers several practical applications and benefits:

1. End-to-end visibility: It provides end-to-end visibility into the transaction, helping you understand how requests propagate through your system.
1. Performance monitoring: It allows you to monitor the performance of individual services and identify bottlenecks.
1. Error diagnosis: It helps in diagnosing errors by tracing the path of a request and identifying where failures occur.
1. Dependency tracking: It enables you to track dependencies between services and understand how they interact.

By implementing distributed tracing with the W3C TraceContext standard, you can gain valuable insights into your application's behavior, improve performance, and enhance the overall user experience.

## Potential use cases

| Example | Description | Notes |
| --- | --- |--- |
| Autonomous agent | An autonomous agent is triggered by a data event. The possible long-lived transaction persists the trace parent. This transaction could cross multiple processes and services including possible handoff to a customer service agent. | Power Automate can request distributed tracing from Dataverse Plugin. Each step of the process adds Application Insights telemetry. E2E transaction could be queried in Application Insights or via KQL queries. |
| End user web, mobile, or agent transaction | A user starts a transaction to update their customer data. Trace entries are added to Application Insights from the request and trace messages from Dataverse | Kubernetes service starts a distributed transaction. It calls the Dataverse web API to update customer details. |
| Customer support agent | End customer contacts the call center. A call center operator makes use of Copilot and Power App to update the customer details. Each component in the update writes to Application Insights | Transaction starts with call center operator. The Power App requests distributed transaction from Dataverse. |

## Dataverse web API integration

Let's explore how the [Dataverse web API](/power-apps/developer/data-platform/webapi/overview) can be integrated with W3C TraceContext to enable distributed tracing.

The calling service initiates a trace with a unique trace-ID and span-ID. This trace parent value can be passed to the Web API either in the body of an HTTP POST request or as part of an HTTP query string.

- **Option 1: POST body**: `postData(environmentUrl + "api/data/v9.0/" + customApiName, token, ...)`
- **Option 2: Tag query string**: `postData(environmentUrl + "api/data/v9.0/" + customApiName + "?tag=01-0af...")`

By using either method, a Dataverse plug-in can be configured to incorporate Application Insights tracing, generating new span-IDs and trace messages.

## Dataverse integration

Lets explore how this pattern can be implemented using the generally available features of Dataverse.

To apply distributed tracing to calls to the [Dataverse web API](/power-apps/developer/data-platform/webapi/overview) two approaches will be combined Dataverse messages to extend the message pipeline and a custom API using Dataverse plugins that use the Application Insights SDK to add the required parent child relationships.

### Invoke from other Power Platform services

When looking at other components in the Power Platform you could also consider making use of [Invoke a function from app, flow, code, or another function](/power-apps/maker/data-platform/functions-invoke) to invoke the Dataverse Custom APIs discussed in this section.

This approach allows services like Microsoft Copilot Studio, Power Apps, or Power Automate cloud flows to be included in the overall distributed tracing solution. 

### Dataverse messages for entities or custom APIs

Custom [Dataverse messages](/power-apps/developer/data-platform/custom-actions) can be defined that allow you to interact with entities or custom APIs within the Dataverse environment. These messages enable you to perform operations such as create, update, delete, and retrieve data. By using Dataverse messages, you can streamline your data management processes and ensure seamless integration with your observability needs.

### Adding steps to a plug-in

Now that a Dataverse message type is created or using any of the predefined entity types of an environment you can take advantage of [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) so that they can be configured to be executed at different stages of the data processing pipeline and execute distributed tracing.

These stages can include pre-validation, pre-operation, and post-operation steps. By adding steps to a plugin, you can control the flow of data and ensure that specific actions are taken at the right time.

- **Pre-validation**: This step occurs before the main operation is executed. It's used to validate the data and ensure that it meets the required criteria.
- **Pre-operation**: This step occurs after the pre-validation step but before the main operation is executed. It's used to perform any necessary preparations or modifications to the data.
- **Post-operation**: This step occurs after the main operation is executed. It's used to perform any necessary cleanup or additional actions based on the results of the main operation.

Plugins can be configured to execute these steps either synchronously or asynchronously, depending on the requirements of your application.

### Plugin configuration - unsecure and secure configuration values

Specifically looking at scenarios for distributed tracing you can use the unsecure configuration to manage if tracing should be enabled and the level of logging that is applied. You could use the secure configuration value to store connection string information required by the plugin.

The process is managed when [registering plug-ins](/power-apps/developer/data-platform/register-plug-in), you can have both unsecure and secure [configuration values](/power-apps/developer/data-platform/register-plug-in#set-configuration-data). These values are used to control various aspects of the plugin's behavior.

- **Unsecure configuration**: Unsecure settings are visible to all users and can include settings such as log level, enable/disable tracing, and other non-sensitive information.
- **Secure configuration**: Secure settings are only visible to users with the appropriate permissions and can include sensitive information such as connection strings, API keys, and other confidential data.

:::image type="content" source="media/distributed-tracing/secure-config-values.png" alt-text="Screenshot of registering a plug-in." lightbox="media/distributed-tracing/secure-config-values.png":::

By using secure configuration values, you can ensure that sensitive information is protected and only accessible to authorized users.

### Custom API with request and response parameters

Dataverse allows you to define [custom APIs](/power-apps/developer/data-platform/custom-api) with specific request and response parameters. This feature enables you to create tailored APIs that meet the unique needs of your application.

- [**Input parameters**](/power-apps/developer/data-platform/understand-the-data-context#inputparameters): These parameters define the input data required by the custom API. They can include various data types such as strings, integers, and complex objects.
- [**Output parameters**](/power-apps/developer/data-platform/understand-the-data-context#outputparameters): These parameters define the output data returned by the custom API. They can include various data types and structures, allowing you to provide detailed and meaningful responses to API consumers.

:::image type="content" source="media/distributed-tracing/custom-api.png" alt-text="Screenshot of registering a custom API" :::

> [!TIP]
> In the case of distributed tracing you could tag query string value for [Passing a Shared Variable from the API](/power-apps/developer/data-platform/understand-the-data-context#passing-a-shared-variable-from-the-api)

### Custom processing steps (sync and async)

When using custom processing steps, you can define whether the steps should be executed synchronously or asynchronously. This flexibility allows you to optimize the performance and responsiveness of your application.

- **Synchronous processing**: In synchronous processing, the steps are executed in a sequential manner, and the next step isn't initiated until the current step is completed. This approach ensures that each step is completed before moving on to the next one.
- **Asynchronous processing**: In asynchronous processing, the steps are executed independently, and the next step can be initiated before the current step is completed. This approach allows for parallel processing and can improve the overall performance of your application.

By defining custom processing steps, you can add monitoring and other functionalities to existing entities or custom API messages, ensuring that your application operates efficiently and effectively.

## Dataverse C# Plugin

Dataverse has the ability to [write plug-ins](/power-apps/developer/data-platform/write-plug-in). This feature can be used to build and deploy C# plugins that use the Application Insights SDK to create the correct parent child relationship between services.

## Comparison with out-of-the-box ILogger

Dataverse provides an [out-of-the-box ILogger](/power-apps/developer/data-platform/application-insights-ilogger) that can be configured at the environment level. This ILogger is designed to offer a standardized logging mechanism across different environments, ensuring consistency and ease of use. However, it may not provide the same level of granularity and customization as the custom plugin based ILogger.

### Custom plug-in ILogger

A custom plugin ILogger in Dataverse offers more detailed levels of information, such as Trace, Debug, and Information. This allows developers to capture more specific and relevant data during the execution of plugins. The Plugin ILogger can utilize values from the message request or the Share Variable tag parameter to specify the calling trace parent, enabling better tracking and correlation of logs.

### Key C# concepts for parsing activity and specifying parent ID

When working with the custom plugin ILogger, it's essential to understand key C# concepts for parsing activity and specifying the parent ID. Here's an example of how to create a new activity for a trace message:

```csharp
// Create a new activity for the trace message
var activity = new Activity("CustomActivity");
activity.SetParentId(traceParent);
activity.Start();
// Create a trace telemetry record
var traceTelemetry = new TraceTelemetry(message, ConvertLogLevel(level))
{
    Message = message,
    Context = { Operation = { ParentId = dependencyTelemetry.Id, Id = activity.Id } }
};
// Track the trace telemetry
telemetryClient.TrackTrace(traceTelemetry);
```

## Next steps

> [!TIP]
> The [Dataverse Open Telemetry sample](https://github.com/Grant-Archibald-MS/dataverse-opentelemetry) project contains an example of Dataverse plugin integration with Open Telemetry. OpenTelemetry is a collection of W3C standards, APIs, SDKs, and tools. Use it to instrument, generate, collect, and export telemetry data (metrics, logs, and traces) to help you analyze your software’s performance and behavior.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Grant Archibald](https://www.linkedin.com/in/grantarchibald/)**, Senior Program Manager

## Related resources

- [W3C ​​Trace Context standard defining trace parent and tracestate HTTP headers](https://www.w3.org/TR/trace-context/)
- [​Event Framework (Microsoft Dataverse)](/power-apps/developer/data-platform/event-framework)
- [​Understand the execution context (Microsoft Dataverse)](/power-apps/developer/data-platform/understand-the-data-context#passing-a-shared-variable-from-the-api)
