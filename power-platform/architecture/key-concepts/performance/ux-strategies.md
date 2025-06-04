---
title:  User experience strategies for mitigating performance concerns
description: Discover practical ways to improve Power Apps performance and keep your apps responsive. Learn how to set targets and optimize data.
#customer intent: As a Power Platform user, I want to learn strategies to improve app performance so that my apps stay responsive and users have a better experience.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: overview
ms.date: 06/04/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---
# User experience strategies for mitigating performance concerns

Canvas-based Power Apps provide a flexible way to build custom applications. However, performance issues can arise if apps aren't optimized properly. This guide outlines practical strategies to enhance user experience by mitigating common performance concerns.

When determining what standards you should use for the responsiveness of your apps, keep
the following table in mind, which outlines user perception of response times in applications:

| Response time | User perception                             |
|---------------|---------------------------------------------|
| 0–100 ms      | Instantaneous; user perceives no delay      |
| 100–300 ms    | Slight perceptible delay; feels responsive  |
| 300 ms–1 sec  | Noticeable delay; user perceives slight lag |
| 1–5 sec       | Acceptable delay; user remains engaged      |
| 5–10 sec      | Noticeable wait; user attention may wander  |
| 10 sec or more| Significant delay; user may become frustrated or abandon task |

*[Source: Nielsen Norman Group - Response Times: The 3 Important Limits](https://www.nngroup.com/articles/response-times-3-important-limits/)*

## Set performance targets

If you ask 5 people their opinion on what consitutes good app performance, you'll get 5 different answers. In order to ensure that your solutions start and stay performant, your best bet is to set your performance goals as early in the development cycle as possible:

- **Benchmark the current process**: If your solution is going to replace an old app or process, first aim to improve upon the status quo in one way or another. If replacing an app, ensure that your new app loads as quickly as before, and allows the user to get their tasks done more quickly as before. At a minimum, app performance should be maintained.
- **Don't cause new problems**: If replacing a business process, your benchmark should focus on the timing of the full cycle and ensure that your solution is clearing bottlenecks to allow your users to get work done more quickly, while not creating new bottlenecks with the new process. Ensure that it is easy for users to understand how your new solution fits into their existing processes.

Learn more about [defining performance targets](/power-platform/well-architected/performance-efficiency/performance-targets).

## Perform regular performance audits

During the solution development process ensure that there are performance tests and/or checks throughout, so that any potential issues are caught before too much rework will be required:

- **Match the production data size**: As closely as possible, ensure that your development data sources properly reflect the size and scope of production data. If a close match is not possible, test your solution with a small amount of data to test functionality and measure the performance of your solution with varying levels of data, 100 rows, 1000 rows, and 10,000 rows for example, and compare the performance of your solution at each data size. If the performance of your solution is trending upwards with data size, extrapolate how that performance would be at true production size, and ensure that stays within your agreed upon paramters.
- **Track your solution performance over time**: Track your performance test results, and compare results across testing runs. If you are running these tests often, you will be better able to trace what changes were made since the last test, and therefore where fixes should be made. Big performance changes caused by solution changes in either direction (good or bad) should be tracked, and included as a part of "lessons learned"/"best practices" guidnace for future solutions.
- **Test on target devices**: Regularly test your app on actual user devices to ensure consistent performance across different platforms and network conditions.

Learn more about [continuous performance optimization](/power-platform/well-architected/performance-efficiency/continuous-performance-optimize).

## Reduce data load

Loading large amounts of data can significantly slow down your app:

- **Limit data retrieval**: Loading more data than your user needs at one time can slow down your app and overwhelm the user with unnecessary information. Instead, show a clear, manageable amount of data by default, and let users easily search or filter to find exactly what they're looking for. This approach keeps your app fast, user-friendly, and focused on what's actually useful.
- **Avoid delegation warnings**: Ensure that the row limit for delegation warnings in any canvas app is set very low, to 5 or 10. This will ensure that any data call that cannot be delegated is flagged in the formula bar, allowing the app developer to be purposeful on allowing potentially non-delegated queries, and not be unaware of the issue because the amount of data returned from the development data source is not enough to trigger the default warning limit value.

  Non-delegated queries can be acceptable if there is a constant, small amount of data to be returned, as in configuration data or other small data sets.

Learn more about [optimizing your solution's logic](/power-platform/well-architected/performance-efficiency/optimize-code).

## Next step

> [!div class="nextstepaction"]
> [Identifying and Mitigating Canvas App Performance Issues](top-issues.md)
