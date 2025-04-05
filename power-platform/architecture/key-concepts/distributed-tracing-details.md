---
title: Implement distributed tracing across multiple services​ in Power Platform
description: Learn how to implement distributed tracing in Power Platform to monitor and diagnose performance issues across multiple services.
#customer intent: As a Power Platform user, I want to trace events across multiple services in my solution so that I can monitor and diagnose performance issues.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: best-practice
ms.date: 04/04/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
ms.contributors:
  - grarchib
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/04/2025
---

# Implement distributed tracing across multiple services​ in Power Platform

Distributed tracing is a method used to profile and monitor applications, especially those built using a microservices architecture. It allows you to trace an event in the system from one service to another and retrieve end-to-end diagnostics about performance and latency. The [W3C Trace Context](https://www.w3.org/TR/trace-context/) recommendation defines how context information is sent and modified between services, enabling distributed tracing scenarios.

This article describes distributed tracing, provides practical applications and use cases, and explains how to implement it across multiple services in Power Platform.

> [!TIP]
> [Distributed tracing across multiple services​ in Power Platform](distributed-tracing.md) provides a general overview of distributed tracing, including an example scenario and architecture.

## Trace ID and span ID

In the W3C Trace Context standard, each trace is assigned a globally unique 16-byte trace-ID, and every activity within the trace is assigned a unique 8-byte span-ID. The trace-ID represents the overall transaction, while the span-ID represents individual operations within that transaction. Each activity records the trace-ID, its own span-ID, and the span-ID of its parent, establishing parent-child relationships between activities.

## Example scenario

Let's consider an example where a browser starts a transaction, multiple microservices interact, and a call is made to the Dataverse Web API:

| Source | Trace ID and span ID |
| --- | --- |
| Browser | trace parent: 00-11111111111111111111111111111111-2222222222222222-01 |
| Kubernetes | trace parent: 00-11111111111111111111111111111111-3333333333333333-01 |
| Dataverse | trace parent: 00-11111111111111111111111111111111-4444444444444444-01 |

1. **Browser initiates transaction**: The browser sends a request to a web server. This request is assigned a trace-ID and a span-ID (let's call it span-ID-1).
1. **Microservices interaction**: The web server processes the request and makes a call to a microservice. This call is assigned a new span-ID (span-ID-2) but retains the same trace-ID. The microservice, in turn, calls another microservice, creating another span-ID (span-ID-3), and so on.
1. **Call to Dataverse Web API**: One of the microservices makes a call to the Dataverse Web API. This call is assigned a new span-ID (span-ID-4) but retains the same trace-ID.

## Trace ID and parent-child relationship

The trace-ID is used to join all transactions with a parent-child relationship. Each span-ID represents a unique operation within the trace, and the parent span-ID links it to its parent operation. This hierarchical structure lets you trace the entire transaction from the initial request to the final response, even as it traverses multiple services and systems.

## Trace ID and operation ID lookup

The W3C trace-ID field is mapped in Application Insights to the operation ID. This mapping allows you to easily query a set of related actions that occur as part of the end-to-end trace.

:::image type="content" source="media/distributed-tracing/trace-id-field.png" alt-text="Screenshot of the Operation ID field mapped in Application Insights." lightbox="media/distributed-tracing/trace-id-field.png":::

## Practical applications and benefits

The W3C Trace Context standard for distributed tracing offers several practical applications and benefits:

- **End-to-end visibility**: Provides end-to-end visibility into the transaction, helping you understand how requests propagate through your system.
- **Performance monitoring**: Lets you monitor the performance of individual services and identify bottlenecks.
- **Error diagnosis**: Helps you diagnose errors by tracing the path of a request and identifying where failures occur.
- **Dependency tracking**: Enables you to track dependencies between services and understand how they interact.

By implementing distributed tracing with the W3C Trace Context standard, you can gain valuable insights into your application's behavior, improve performance, and enhance the overall user experience.

## Potential use cases

| Example | Description | Notes |
| --- | --- |--- |
| Autonomous agent | An autonomous agent is triggered by a data event. The possible long-lived transaction persists the trace parent. This transaction could cross multiple processes and services including possible handoff to a customer service agent. | Power Automate can request distributed tracing from the Dataverse plug-in. Each step of the process adds Application Insights telemetry. You can query the E2E transaction in Application Insights or by using KQL (Kusto Query Language) queries. |
| End user web, mobile, or agent transaction | A user starts a transaction to update customer data. Trace entries are added to Application Insights from the request and trace messages from Dataverse. | The Kubernetes service starts a distributed transaction. It calls the Dataverse Web API to update customer details. |
| Customer support agent | Customer contacts the call center. A call center operator makes use of Copilot and Power App to update the customer details. Each component in the update writes to Application Insights. | The transaction starts with the call center operator. The Power App requests distributed transaction from Dataverse. |

## Dataverse Web API integration

Let's explore how the [Dataverse Web API](/power-apps/developer/data-platform/webapi/overview) can be integrated with W3C Trace Context to enable distributed tracing.

The calling service initiates a trace with a unique trace-ID and span-ID. This trace parent value can be passed to the Web API either in the body of an HTTP POST request or as part of an HTTP query string. For example:

- **Option 1: POST body**: `postData(environmentUrl + "api/data/v9.0/" + customApiName, token, ...)`
- **Option 2: Tag query string**: `postData(environmentUrl + "api/data/v9.0/" + customApiName + "?tag=01-0af...")`

Using either method, you can configure a Dataverse plug-in to incorporate Application Insights tracing, generating new span-IDs and trace messages.

## Dataverse integration

Now, let's explore how to implement this pattern using the generally available features of Dataverse.  

To apply distributed tracing to calls to the [Dataverse Web API](/power-apps/developer/data-platform/webapi/overview):

- Use Dataverse messages to extend the message pipeline.
- Create a custom API with Dataverse plug-ins that use the Application Insights SDK to add the required parent-child relationships.

### Invoke from other Power Platform services

Imagine that you want to allow other Power Platform services like Microsoft Copilot Studio, Power Apps, or Power Automate cloud flows to be included in the overall distributed tracing solution. Consider [invoking a function from an app, flow, code, or another function](/power-apps/maker/data-platform/functions-invoke) to call the Dataverse custom APIs, discussed in this section.

### Dataverse messages for entities or custom APIs

Custom [Dataverse messages](/power-apps/developer/data-platform/custom-actions) can be defined that allow you to interact with entities or custom APIs within the Dataverse environment. These messages enable you to perform operations such as create, update, delete, and retrieve data. Dataverse messages enable you to can streamline your data management processes and ensure seamless integration with your observability needs.

Define custom messages to interact with entities or custom APIs in the Dataverse environment. These messages let you create, update, delete, and retrieve data. Dataverse messages streamline data management processes and ensure seamless integration with observability needs.  

### Adding steps to a plug-in

After creating a Dataverse message type, or using a predefined entity type in an environment, use [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) to configure execution at different stages of the data processing pipeline and enable distributed tracing.  

These stages can include pre-validation, pre-operation, and post-operation steps. By adding steps to a plug-in, you control the flow of data and ensure that specific actions are taken at the right time.

- **Pre-validation**: Occurs before the main operation is executed. Used to validate the data and ensure that it meets the required criteria.
- **Pre-operation**: Occurs after the pre-validation step but before the main operation is executed. Used to perform any necessary preparations or modifications to the data.
- **Post-operation**: Occurs after the main operation is executed. Used to perform any necessary cleanup or additional actions based on the results of the main operation.

You can configure the plug-ins to execute these steps either synchronously or asynchronously, depending on the requirements of your application.

### Plug-in configuration: Unsecure and secure configuration values

For distributed tracing scenarios, use the unsecure configuration to manage whether tracing is enabled and to set the logging level. Use the secure configuration value to store connection string information required by the plug-in.

The process is managed when [registering plug-ins](/power-apps/developer/data-platform/register-plug-in). You can use both unsecure and secure [configuration values](/power-apps/developer/data-platform/register-plug-in#set-configuration-data) to control various aspects of the plug-in's behavior:

- **Unsecure configuration**: Unsecure settings are visible to all users and can include settings such as log level, enable/disable tracing, and other non-sensitive information.
- **Secure configuration**: Secure settings are only visible to users with the appropriate permissions and can include sensitive information such as connection strings, API keys, and other confidential data.

:::image type="content" source="media/distributed-tracing/secure-config-values.png" alt-text="Screenshot of registering a plug-in." lightbox="media/distributed-tracing/secure-config-values.png":::

By using secure configuration values, you ensure that sensitive information is protected and only accessible to authorized users.

### Custom API with request and response parameters

Dataverse allows you to define [custom APIs](/power-apps/developer/data-platform/custom-api) with specific request and response parameters. This feature enables you to create tailored APIs to meet your application's needs.

- [**InputParameters**](/power-apps/developer/data-platform/understand-the-data-context#inputparameters): Define the input data required by the custom API. They can include various data types such as strings, integers, and complex objects.
- [**OutputParameters**](/power-apps/developer/data-platform/understand-the-data-context#outputparameters): Define the output data returned by the custom API. They can include various data types and structures, allowing you to provide detailed and meaningful responses to API consumers.

:::image type="content" source="media/distributed-tracing/custom-api.png" alt-text="Screenshot of registering a custom API." :::

> [!TIP]
> For distributed tracing, you can tag the query string value for [passing a Shared Variable from the API](/power-apps/developer/data-platform/understand-the-data-context#passing-a-shared-variable-from-the-api).

### Custom processing steps (sync and async)

When using custom processing steps, you can define whether the steps should be executed synchronously or asynchronously. This flexibility allows you to optimize the performance and responsiveness of your application.

- **Synchronous processing**: The steps are executed in a sequential manner, and the next step isn't initiated until the current step is completed. This approach ensures that each step is completed before moving on to the next one.
- **Asynchronous processing**: The steps are executed independently, and the next step can be initiated before the current step is completed. This approach allows for parallel processing and can improve the overall performance of your application.

By defining custom processing steps, you can add monitoring and other functionalities to existing entities or custom API messages, ensuring that your application operates efficiently and effectively.

## Dataverse C# Plugin

Dataverse lets you [write plug-ins](/power-apps/developer/data-platform/write-plug-in). Use this feature to build and deploy C# plug-ins that use the Application Insights SDK to create the correct parent-child relationship between services.

## Comparison with out-of-the-box ILogger

Dataverse provides an [out-of-the-box ILogger](/power-apps/developer/data-platform/application-insights-ilogger) that can be configured at the environment level. This ILogger is designed to offer a standardized logging mechanism across different environments, ensuring consistency and ease of use. However, it may not provide the same level of granularity and customization as the custom plug-in based ILogger.

### Custom plug-in ILogger

The custom plug-in ILogger in Dataverse offers more detailed levels of information, such as Trace, Debug, and Information. It allows developers to capture more specific and relevant data during the execution of plug-ins. ILogger uses values from the message request or the Share Variable tag parameter to specify the calling trace parent, enabling better tracking and correlation of logs.

### Key C# concepts for parsing activity and specifying parent ID

When using the custom plug-in ILogger, it's essential to understand key C# concepts for parsing activity and specifying the parent ID. Here's an example of how to create a new activity for a trace message:

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

> [!TIP]
> The [Dataverse Open Telemetry sample](https://github.com/Grant-Archibald-MS/dataverse-opentelemetry) project contains an example of Dataverse plug-in integration with Open Telemetry. OpenTelemetry is a collection of W3C standards, APIs, SDKs, and tools. Use it to instrument, generate, collect, and export telemetry data (metrics, logs, and traces) to help you analyze your software’s performance and behavior.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Grant Archibald](https://www.linkedin.com/in/grantarchibald/)**, Senior Program Manager

## Related resources

- [W3C ​​Trace Context standard defining traceparent and tracestate HTTP headers](https://www.w3.org/TR/trace-context/)
- [​Event Framework (Microsoft Dataverse)](/power-apps/developer/data-platform/event-framework)
- [​Understand the execution context (Microsoft Dataverse)](/power-apps/developer/data-platform/understand-the-data-context)
