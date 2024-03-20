---
title: Recommendations for handling transient faults
description: Learn about recommendations for handling transient faults in your cloud applications.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: robstand
ms.date: 03/01/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for handling transient faults

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

|[RE:05](checklist.md)| Strengthen the resiliency of your workload by implementing error handling and transient fault handling. Build capabilities into the solution to handle component failures and transient errors.  |
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

Some services you are connecting to may already provide transient fault handling mechanisms. The retry policy it uses is typically tailored to the nature and requirements of the target service. Alternatively, REST interfaces for services might return information that can help you determine whether a retry is appropriate and how long to wait before the next retry attempt.

You should use the built-in retry mechanism when one is available, unless you have specific and well-understood requirements that make a different retry behavior more appropriate.

#### Determine if the operation is suitable for retrying

- Perform retry operations only when the fault is likely to be transient. Typically, you can identify if a fault is likely to be transient based on the error message returned by the service. Don’t retry operations that attempt an invalid operation, like updating a row in Microsoft Dataverse that doesn’t exist or that the user does not have permission to, or calling an API endpoint that doesn’t exist. Validate the input parameters to the operation before performing the operation or retrying it to ensure only well understood and allowed parameters are passed to the operation. 
- Implement retries only when you can determine the full effect of doing so and when the conditions are well understood and can be validated. Remember that the errors returned from resources and services outside your control might evolve over time, and you might need to revisit your transient fault detection logic.
- When you develop individual components or services that are called from your applications, make sure to return error codes and messages that help clients determine whether they should retry failed operations. Consider indicating whether the client should retry the operation, for example by returning an **isTransient** value. If you build a web service, consider returning custom errors that are defined within your service contracts. 

#### Determine an appropriate retry count and interval

- Optimize the retry count and the interval to the type of use case. If you don't retry enough times, the application can't complete the operation and will probably fail. If you retry too many times, or with too short an interval between tries, the health of the application might be adversely affected by holding data in memory or by resulting in throttling the resource with which you are trying to interact.
- Adapt values for the time interval and the number of retry attempts to the type of operation. For example, if the operation is part of a user interaction, the interval should be short and only a few retries should be attempted. By using this approach, you can avoid making users wait for a response. If the operation is part of a long running or critical workflow, where canceling and restarting the process is expensive or time-consuming, it's appropriate to wait longer between attempts and retry more times.
- Keep in mind that determining the appropriate intervals between retries is the most difficult part of designing a successful strategy. Typical strategies use the following types of retry interval:

  - **Exponential** **interval**. The application waits a short time before the first retry and then exponentially increases the time between each subsequent retry. For example, it might retry the operation after 3 seconds, 12 seconds, 30 seconds, and so on. You will specific an interval and a retry count. 
  - **Fixed intervals**. The application waits for the same period of time between each attempt. For example, it might retry the operation every 3 seconds.
  - **Immediate retry**. Sometimes a transient fault is brief, and retrying the operation immediately is appropriate because it might succeed if the fault is cleared in the time that it takes the application to send the next request. However, there should never be more than one immediate retry attempt. You should switch to alternative strategies, like exponential interval or fallback actions, if the immediate retry fails.

- As a general guideline, use an exponential interval strategy for background operations, and use immediate or fixed interval retry strategies for interactive operations. In both cases, you should choose the delay and the retry count so that the maximum latency for all retry attempts is within the required end-to-end latency requirement.

Consider the combination of all factors that contribute to the overall maximum timeout for a retried operation. These factors include the time it takes for a failed connection to produce a response, the delay between retry attempts, and the maximum number of retries. The total of all these times can result in long overall operation times, especially when you use an exponential delay strategy where the interval between retries grows rapidly after each failure. If a process must meet a specific service-level agreement (SLA), the overall operation time, including all timeouts and delays, must be within the limits defined in the SLA.

Don't implement overly aggressive retry strategies. These are strategies that have intervals that are too short or retries that are too frequent. They can have an adverse effect on the target resource or service. These strategies might prevent the resource or service from recovering from its overloaded state, and it will continue to block or refuse requests. This scenario results in a vicious circle, where more and more requests are sent to the resource or service. Consequently, its ability to recover is further reduced.

Consider the timeout of the operations when you choose retry intervals to avoid launching a subsequent attempt immediately (for example, if the timeout period is similar to the retry interval). 

Use the type of error or the error codes and messages returned from the service, to optimize the number of retries and the interval between them. For example, some exceptions or error codes (like the HTTP code 503, Service Unavailable, with a Retry-After header in the response) might indicate how long the error might last, or that the service failed and won't respond to any subsequent attempt.

#### Avoid anti-patterns

In most cases, avoid implementations that include duplicated layers of retry code. Avoid designs that include cascading retry mechanisms or that implement retry at every stage of an operation that involves a hierarchy of requests, unless you have specific requirements that require doing so. In these exceptional circumstances, use policies that prevent excessive numbers of retries and delay periods, and make sure you understand the consequences. For example, say one component makes a request to another, which then accesses the target service. If you implement retry with a count of three on both calls, there are nine retry attempts in total against the service. Many services and resources implement a built-in retry mechanism. You should investigate how you can disable or modify these mechanisms if you need to implement retries at a higher level.

Never implement an endless retry mechanism. Doing so is likely to prevent the resource or service from recovering from overload situations and to cause throttling and refused connections to continue for a longer time. 

Never perform an immediate retry more than once.

Avoid using a fixed retry interval when you access services and resources on Azure, especially when you have a high number of retry attempts. The best approach in this scenario is an exponential interval strategy.

#### Test your retry strategy and implementation

Fully test your retry strategy under as wide a set of circumstances as possible, especially when both the application and the target resources or services that it uses are under extreme load. To check behavior during testing, you can:

Inject transient and nontransient faults into the service. For example, send invalid requests or add code that detects test requests and responds with different types of errors.

Create a mockup of the resource or service that returns a range of errors that the real service might return. Cover all the types of errors that your retry strategy is designed to detect.

For custom services that you create and deploy, force transient errors to occur by temporarily disabling or overloading the service. (Don't attempt to overload any shared resources or shared services in Azure.)

When testing a client web application's resiliency to transient faults, use the browser's developer tools or your testing framework's ability to [mock](https://playwright.dev/docs/network) or [block](/microsoft-edge/devtools-guide-chromium/network/) network requests.

Perform high load factor and concurrent tests to ensure that the retry mechanism and strategy works correctly under these conditions. These tests also help ensure that the retry doesn't have an adverse effect on the operation of the client or cause cross-contamination between requests.

#### Manage retry policy configurations

A _retry policy_ is a combination of all the elements of your retry strategy. It defines the detection mechanism that determines whether a fault is likely to be transient, the type of interval to use (like fixed or exponential), the actual interval values, and the number of times to retry.

Take advantage of built-in or default retry strategies that are if they're appropriate for your scenario. These strategies are typically generic. In some scenarios, they might be all you need, but in other scenarios they don't offer the full range of options to suit your specific requirements. To determine the most appropriate values, you need to perform testing to understand how the settings affect your application.

#### Log and track transient and nontransient faults

As part of your retry strategy, include exception handling and other instrumentation that logs retry attempts. An occasional transient failure and retry are expected and don't indicate a problem. Regular and increasing numbers of retries, however, are often an indicator of a problem that might cause a failure or that degrades application performance and availability.

Log transient faults as warning entries rather than as error entries so that monitoring systems don't detect them as application errors that might trigger false alerts.

Consider storing a value in your log entries that indicates whether retries are caused by throttling in the service or by other types of faults, like connection failures, so that you can differentiate them during analysis of the data. An increase in the number of throttling errors is often an indicator of a design flaw in the application or the need to add additional premium capacity to the environment. 

Consider implementing a telemetry and monitoring system that can raise alerts when the number and rate of failures, the average number of retries, or the overall times elapsed before operations succeed is increasing.

#### Manage operations that continually fail

Consider how to handle operations that continue to fail at every attempt. Situations like this are inevitable.

Although a retry strategy defines the maximum number of times that an operation should be retried, it doesn't prevent the application from repeating the operation again with the same number of retries. For example, submitting a form in your application may trigger a flow - the retry strategy might detect a connection timeout and consider it to be a transient fault. The flow will retry the operation a specified number of times and then gives up. However, when the same or a new user try to submit the form again, the operation is attempted again, even though it may continue to fail. 

The application can periodically test the service, on an intermittent basis and with long intervals between requests, to detect when it becomes available. An appropriate interval depends on factors like the criticality of the operation and the nature of the service. It might be anything between a few minutes and several hours. When the test succeeds, the application can resume normal operations and pass requests to the newly recovered service.

In the meantime, you might be able to perform some alternative operations based on the hope that the service will be available soon. For example, it might be appropriate to store requests for the service in a queue or data store and retry them later. Or you might have to return a message to the user to indicate that the application isn't currently available.

#### Other considerations

When you're deciding on the values for the number of retries and the retry intervals for a policy, consider whether the operation on the service or resource is part of a long-running or multistep operation. It might be difficult or expensive to compensate all the other operational steps that have already succeeded when one fails. In this case, a very long interval and a large number of retries might be acceptable as long as that strategy doesn't block other operations by holding or locking scarce resources.

Consider whether retrying the same operation could cause inconsistencies in data. If some parts of a multistep process are repeated and the operations aren't idempotent, inconsistencies might occur. For example, if an operation that inserts a record into Microsoft Dataverse is repeated, it may cause incorrect values in the table. Or if you repeat an operation that sends a notification to the end user, they may receive duplicate messages. 

Consider the scope of operations that are retried. For example, it might be easier to implement retry code at a level that encompasses several operations and retry them all if one fails. However, doing so might result in idempotency issues or unnecessary rollback operations.

If you choose a retry scope that encompasses several operations, consider the total latency of all of them when you determine retry intervals, when you monitor the elapsed times of the operation, and before you raise alerts for failures.

## Power Platform facilitation

- Power Automate provides you with a feature to retry an action if it fails – configure this on a per action level: [Reducing risk and planning for error handling in a Power Automate project - Power Automate | Microsoft Learn](/power-automate/guidance/planning/reducing-risk)
- Power Automate offers you actions to return custom errors and data to the calling Power App or calling Power Automate flow – you can use “respond to power apps” or “response” actions.
- [Mobile offline for canvas apps (preview) - Power Apps | Microsoft Learn](/power-apps/mobile/canvas-mobile-offline-overview)
- [Mobile offline overview - Power Apps | Microsoft Learn](/power-apps/mobile/mobile-offline-overview)
- Power Apps canvas apps provides you with the capability to check the connection status, allowing your app to behave differently if the app is offline. [Acceleration, App, Compass, Connection, and Location signals in Power Apps - Power Platform | Microsoft Learn](/power-platform/power-fx/reference/signals)
- If your workload connects to Azure services, learn more: [Recommendations for handling transient faults - Microsoft Azure Well-Architected Framework | Microsoft Learn](/azure/well-architected/reliability/handle-transient-faults)
- Custom Connector responses: [Coding standards | Microsoft Learn](/connectors/custom-connectors/coding-standards)
- Detecting errors in canvas apps to decide what to do next [Error, IfError, IsError, and IsBlankOrError functions - Power Platform | Microsoft Learn](/power-platform/power-fx/reference/function-iferror)
- Configure error and exception handling in cloud flows by using scopes and run-after settings [Best practices for error handling in Power Automate flows - Training | Microsoft Learn](/training/modules/error-handling/)
- Use the App Insights integrations to log errors: [Set up Application Insights with Power Automate (preview) - Power Platform | Microsoft Learn](/power-platform/admin/app-insights-cloud-flow) and [Analyze system-generated logs using Application Insights - Power Apps | Microsoft Learn](/power-apps/maker/canvas-apps/application-insights)
- Some transient flows can be caused by throughput and request limits, get familiar with those: [Limits of automated, scheduled, and instant flows - Power Automate | Microsoft Learn](/power-automate/limits-and-config) and [Requests limits and allocations - Power Platform | Microsoft Learn](/power-platform/admin/api-request-limits-allocations)

## Related Links

[Develop offline-capable canvas apps (contains video) - Power Apps | Microsoft Learn](/power-apps/maker/canvas-apps/offline-apps)

[Mobile offline for canvas apps (preview) - Power Apps | Microsoft Learn](/power-apps/mobile/canvas-mobile-offline-overview)

[Recommendations for handling transient faults - Microsoft Azure Well-Architected Framework | Microsoft Learn](/azure/well-architected/reliability/handle-transient-faults)

[Coding standards | Microsoft Learn](/connectors/custom-connectors/coding-standards)

[Error, IfError, IsError, and IsBlankOrError functions - Power Platform | Microsoft Learn](/power-platform/power-fx/reference/function-iferror)

[Best practices for error handling in Power Automate flows - Training | Microsoft Learn](/training/modules/error-handling/)

[Business continuity and disaster recovery for Dynamics 365 SaaS apps - Power Platform | Microsoft Learn](/power-platform/admin/business-continuity-disaster-recovery)

