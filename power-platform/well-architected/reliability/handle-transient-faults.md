---
title: Handle transient faults recommendation for Power Platform workloads
description: Learn how to strengthen the resiliency of your Power Platform workload by implementing transient fault handling. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/16/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for handling transient faults

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

|[RE:05](checklist.md)| **Strengthen the resiliency of your workload by implementing error handling and transient fault handling. Build capabilities into the solution to handle component failures and transient errors.** |
|---|---|

This guide describes the recommendations for handling transient faults in your cloud applications. All applications that communicate with remote services and resources must be sensitive to transient faults. This is especially true for applications that run in the cloud, where, because of the nature of the environment and connectivity over the internet, this type of fault is likely to be encountered more often. Transient faults include the momentary loss of network connectivity to components and services, the temporary unavailability of a service, and timeouts that occur when a service is busy. These faults are often self-correcting, so, if the action is repeated after a suitable delay, it's likely to succeed.

## Key design strategies

Transient faults can occur in any environment, on any platform or operating system, and in any kind of application.

### Challenges

Transient faults can have a significant effect on the perceived availability of an application, even if it's been thoroughly tested under all foreseeable circumstances. To ensure that your Power Platform workload can operate reliably, you need to ensure that it can respond to the following challenges:

- The application must be able to detect faults when they occur and determine if the faults are likely to be transient, are long-lasting, or are terminal failures. Different resources are likely to return different responses when a fault occurs, and these responses can also vary depending on the context of the operation. For example, the response for an error when the application is retrieving data from a custom connector might be different from the response when the application is running a cloud flow and waiting for the response.

- The application must be able to retry the operation if it determines that the fault is likely to be transient.

- The application must use an appropriate strategy for retries. The strategy specifies the number of times the application should retry, the delay between each attempt, and the actions to take after a failed attempt. The appropriate number of attempts and the delay between each one are often difficult to determine. The strategy varies depending on the type of resource and on the current operating conditions of the resource and the application.

### General guidelines

The following guidelines can help you design suitable transient fault handling mechanisms for your applications.

#### Determine if there's a built-in retry mechanism

Some services you're connecting to might already provide a transient fault handling mechanism. The retry policy it uses is typically tailored to the nature and requirements of the target service. Alternatively, REST interfaces for services might return information that can help you determine whether a retry is appropriate and how long to wait before the next retry attempt.

You should use the built-in retry mechanism when one is available, unless you have specific and well-understood requirements that make a different retry behavior more appropriate.

#### Determine if the operation is suitable for retrying

Perform retry operations only when the faults are transient (typically indicated by the nature of the error) and when there's at least some likelihood that the operation will succeed when retried. There's no point in retrying operations that attempt an invalid operation, like updating a row in Microsoft Dataverse that doesn't exist or that the user doesn't have permission to, or calling an API endpoint that doesn't exist.

Implement retries only when you can determine the full effect of doing so and when the conditions are well understood and can be validated. Remember that the errors returned from resources and services outside your control might evolve over time, and you might need to revisit your transient fault detection logic.

When you develop individual components or services that are called from your applications, make sure to return error codes and messages that help clients determine whether they should retry failed operations. Consider indicating whether the client should retry the operation; for example, by returning an **isTransient** value. If you build a web service, consider returning custom errors that are defined within your service contracts.

#### Determine an appropriate retry count and interval

Optimize the retry count and the interval to the type of use case. If you don't retry enough times, the application can't complete the operation and will probably fail. If you retry too many times, or with too short an interval between tries, the application might hold resources for long periods, which adversely affects the health of the application.

Adapt values for the time interval and the number of retry attempts to the type of operation. For example, if the operation is part of a user interaction, the interval should be short and only a few retries should be attempted. By using this approach, you can avoid making users wait for a response. If the operation is part of a long-running or critical workflow, where canceling and restarting the process is expensive or time-consuming, it's appropriate to wait longer between attempts and retry more times.

Keep in mind that determining the appropriate intervals between retries is the most difficult part of designing a successful strategy. Typical strategies use the following types of retry interval:

- **Exponential interval**. The application waits a short time before the first retry and then exponentially increases the time between each subsequent retry. For example, it might retry the operation after 3 seconds, 12 seconds, 30 seconds, and so on.

- **Fixed intervals**. The application waits for the same period of time between each attempt.

- **Immediate retry**. Sometimes a transient fault is brief, and retrying the operation immediately is appropriate because it might succeed if the fault is cleared in the time that it takes the application to send the next request. However, there should never be more than one immediate retry attempt. You should switch to alternative strategies, like exponential interval or fallback actions, if the immediate retry fails.

As a general guideline, use an exponential interval strategy for background operations, and use immediate or fixed interval retry strategies for interactive operations. In both cases, you should choose the delay and the retry count so that the maximum latency for all retry attempts is within the required end-to-end latency requirement.

Consider the combination of all factors that contribute to the overall maximum timeout for a retried operation. These factors include the time it takes for a failed connection to produce a response, the delay between retry attempts, and the maximum number of retries. The total of all these times can result in long overall operation times, especially when you use an exponential delay strategy where the interval between retries grows rapidly after each failure. If a process must meet a specific service-level agreement (SLA), the overall operation time, including all timeouts and delays, must be within the limits defined in the SLA.

Don't implement overly aggressive retry strategies. These are strategies that have intervals that are too short or retries that are too frequent. They can have an adverse effect on the target resource or service. These strategies might prevent the resource or service from recovering from its overloaded state, and it will continue to block or refuse requests. This scenario results in a vicious circle, where more and more requests are sent to the resource or service. Consequently, its ability to recover is further reduced.

Consider the timeout of the operations when you choose retry intervals to avoid launching a subsequent attempt immediately (for example, if the timeout period is similar to the retry interval).

Use the type of error or the error codes and messages returned from the service to optimize the number of retries and the interval between them. For example, some exceptions or error codes (like the HTTP code 503, Service Unavailable, with a Retry-After header in the response) might indicate how long the error might last, or that the service failed and won't respond to any subsequent attempt.

#### Avoid anti-patterns

In most cases, avoid implementations that include duplicated layers of retry code. Avoid designs that include cascading retry mechanisms or that implement retry at every stage of an operation that involves a hierarchy of requests, unless you have specific requirements to do so. In these exceptional circumstances, use policies that prevent excessive numbers of retries and delay periods, and make sure you understand the consequences. For example, say one component makes a request to another, which then accesses the target service. If you implement retry with a count of three on both calls, there are nine retry attempts in total against the service. Many services and resources implement a built-in retry mechanism. You should investigate how you can disable or modify these mechanisms if you need to implement retries at a higher level.

Never implement an endless retry mechanism. Doing so is likely to prevent the resource or service from recovering from overload situations and to cause throttling and refused connections to continue for a longer time.

Never perform an immediate retry more than once.

Avoid using a fixed retry interval when you access services and resources on Azure, especially when you have a high number of retry attempts. The best approach in this scenario is an exponential interval strategy.

#### Test your retry strategy and implementation

Fully test your retry strategy under as wide a set of circumstances as possible, especially when both the application and the target resources or services that it uses are under extreme load. To check behavior during testing, you can:

- Inject transient and nontransient faults into the service. For example, send invalid requests or add code that detects test requests and responds with different types of errors.

- Create a mockup of the resource or service that returns a range of errors that the real service might return. Cover all the types of errors that your retry strategy is designed to detect.

- For custom services that you create and deploy, force transient errors to occur by temporarily disabling or overloading the service. (Don't attempt to overload any shared resources or shared services in Azure.)

- When testing a client web application's resiliency to transient faults, use the browser's developer tools or your testing framework's ability to [mock](https://playwright.dev/docs/network) or [block](/microsoft-edge/devtools-guide-chromium/network/) network requests.

- Perform high load factor and concurrent tests to ensure that the retry mechanism and strategy work correctly under these conditions. These tests also help ensure that the retry doesn't have an adverse effect on the operation of the client or cause cross-contamination between requests.

#### Manage retry policy configurations

A *retry policy* is a combination of all the elements of your retry strategy. It defines the detection mechanism that determines whether a fault is likely to be transient, the type of interval to use (like fixed or exponential), the actual interval values, and the number of times to retry.

Take advantage of built-in or default retry strategies but only when they're appropriate for your scenario. These strategies are typically generic. In some scenarios, they might be all you need, but in other scenarios they don't offer the full range of options to suit your specific requirements. To determine the most appropriate values, you need to perform testing to understand how the settings affect your application.

#### Log and track transient and nontransient faults

As part of your retry strategy, include exception handling and other instrumentation that logs retry attempts. An occasional transient failure and retry are expected and don't indicate a problem. Regular and increasing numbers of retries, however, are often an indicator of a problem that might cause a failure or that degrades application performance and availability.

Log transient faults as warning entries rather than as error entries so that monitoring systems don't detect them as application errors that might trigger false alerts.

Consider storing a value in your log entries that indicates whether retries are caused by throttling in the service or by other types of faults, like connection failures, so that you can differentiate them during analysis of the data. An increase in the number of throttling errors is often an indicator of a design flaw in the application or the need to add premium capacity to the environment.

Consider implementing a telemetry and monitoring system that can raise alerts when the number and rate of failures, the average number of retries, or the overall times elapsed before operations succeed is increasing.

#### Manage operations that continually fail

Consider how to handle operations that continue to fail at every attempt. Situations like this are inevitable.

Although a retry strategy defines the maximum number of times that an operation should be retried, it doesn't prevent the application from repeating the operation with the same number of retries. For example, submitting a form in your application might trigger a flow. The retry strategy might detect a connection timeout and consider it to be a transient fault. The flow will retry the operation a specified number of times and then give up. However, when the same or a new user tries to submit the form again, the operation is attempted again, even though it might continue to fail.

The application can periodically test the service, on an intermittent basis and with long intervals between requests, to detect when it becomes available. An appropriate interval depends on factors like the criticality of the operation and the nature of the service. It might be anything between a few minutes and several hours. When the test succeeds, the application can resume normal operations and pass requests to the newly recovered service.

In the meantime, you might be able to perform some alternative operations based on the hope that the service will be available soon. For example, it might be appropriate to store requests for the service in a queue or data store and retry them later. Or you might have to return a message to the user to indicate that the application isn't available.

#### Other considerations

When you're deciding on the values for the number of retries and the retry intervals for a policy, consider whether the operation on the service or resource is part of a long-running or multistep operation. It might be difficult or expensive to compensate for all the other operational steps that have already succeeded when one fails. In this case, a long interval and a large number of retries might be acceptable, as long as that strategy doesn't block other operations by holding or locking scarce resources.

Consider whether retrying the same operation could cause inconsistencies in data. If some parts of a multistep process are repeated and the operations aren't idempotent, inconsistencies might occur. For example, if an operation that inserts a record into Microsoft Dataverse is repeated, it might cause incorrect values in the table. Or, if you repeat an operation that sends a notification to the user, they might receive duplicate messages.

Consider the scope of operations that are retried. For example, it might be easier to implement retry code at a level that encompasses several operations and retry them all if one fails. However, doing so might result in idempotency issues or unnecessary rollback operations.

If you choose a retry scope that encompasses several operations, consider the total latency of all of them when you determine retry intervals, when you monitor the elapsed times of the operation, and before you raise alerts for failures.

## Power Platform facilitation

The following sections describe the mechanisms you can use to manage transient faults.

### Power Automate

Power Automate includes a feature to retry an action if it fails. Configure this on a per-action level. [Learn about reducing risk and planning for error handling in a Power Automate project](/power-automate/guidance/planning/reducing-risk). Power Automate also offers actions to return custom errors and data to the calling app or flow.

Some transient flows can be caused by throughput and request limits. Learn about the [limits of automated, scheduled, and instant flows](/power-automate/limits-and-config) and [request limits and allocations](/power-platform/admin/api-request-limits-allocations).

[Configure error and exception handling in cloud flows](/training/modules/error-handling/) by using scopes and run-after settings.

### Power Apps

Power Apps canvas apps provide the capability to [check the connection status](/power-platform/power-fx/reference/signals), allowing them to behave differently if the app is offline. [Learn how to develop offline-capable canvas apps](/power-apps/maker/canvas-apps/offline-apps).

You can also [use Error, IfError, IsError, and IsBlankOrError functions](/power-platform/power-fx/reference/function-iferror) in canvas apps to decide what to do next if an error occurs.

Learn more about transient fault handling in Power Apps:

- [Mobile offline overview](/power-apps/mobile/mobile-offline-overview)
- [Mobile offline for canvas apps](/power-apps/mobile/canvas-mobile-offline-overview)

### Azure and custom connectors

If your workload connects to Azure services, [learn how to handle transient faults using the Azure Well-Architected Framework](/azure/well-architected/reliability/handle-transient-faults).

To manage custom connector responses to errors, follow [coding standards](/connectors/custom-connectors/coding-standards).

### Application Insights

Use the Application Insights integrations to log errors in Power Automate and Power Apps:

- [Set up Application Insights with Power Automate (preview)](/power-platform/admin/app-insights-cloud-flow)
- [Analyze system-generated logs using Application Insights in Power Apps](/power-apps/maker/canvas-apps/application-insights)

## Related information

[Business continuity and disaster recovery for Dynamics 365 SaaS apps](/power-platform/admin/business-continuity-disaster-recovery)

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
