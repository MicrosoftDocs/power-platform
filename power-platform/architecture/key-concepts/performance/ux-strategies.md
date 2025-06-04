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
  - ai-seo-date:06/04/2025
---
# User experience strategies for mitigating performance concerns

Canvas-based Power Apps let you build custom applications flexibly. But performance issues can happen if you don't optimize your app. This article gives practical strategies to improve user experience and address common performance concerns.

When you set standards for app responsiveness, use the following table. It shows how users perceive response times in applications:

| Response time | User perception                             |
|---------------|---------------------------------------------|
| 0–100 ms      | Instantaneous; the user doesn't notice any delay      |
| 100–300 ms    | Slight perceptible delay; feels responsive  |
| 300 ms–1 sec  | Noticeable delay; user perceives slight lag |
| 1–5 sec       | Acceptable delay; user remains engaged      |
| 5–10 sec      | Noticeable wait; user attention may wander  |
| 10 sec or more| Significant delay; user may become frustrated or abandon task |

*[Source: Nielsen Norman Group - Response Times: The three Important Limits](https://www.nngroup.com/articles/response-times-3-important-limits/)*

## Set performance targets

Good app performance means different things to different people. Set your performance goals early in the development cycle to make sure your solution starts and stays fast:

- **Benchmark the current process**: If your solution replaces an old app or process, aim to improve on the current experience. If you're replacing an app, make sure your new app loads as quickly as the old one and lets users finish tasks faster. At a minimum, keep app performance the same.
- **Don't cause new problems**: If you're replacing a business process, focus your benchmark on the timing of the full cycle. Make sure your solution removes bottlenecks so users finish work faster, and doesn't create new ones. Make it easy for users to see how your new solution fits into their existing process.

Learn more about [defining performance targets](/power-platform/well-architected/performance-efficiency/performance-targets).

## Perform regular performance audits

During solution development, run performance tests and checks throughout, so you catch potential issues before you need to do too much rework:

- **Match the production data size**: Make your development data sources reflect the size and scope of production data as closely as possible. If you can't match production data, test your solution with small data sets to check functionality. Measure performance with different data sizes, like 100, 1,000, and 10,000 rows, and compare results. If performance increases with data size, estimate how it performs at production scale and make sure it stays within your agreed parameters.
- **Track your solution performance over time**: Track your performance test results and compare them across test runs. If you run these tests often, trace what changed since the last test and where to make fixes. Track big performance changes, whether good or bad, and include them in your lessons learned or best practices for future solutions.
- **Test on target devices**: Regularly test your app on actual user devices to make sure it performs consistently across different platforms and network conditions.

Learn more about [continuous performance optimization](/power-platform/well-architected/performance-efficiency/continuous-performance-optimize).

## Reduce data load

Loading large amounts of data can significantly slow down your app:

- **Limit data retrieval**: Loading more data than your user needs at one time can slow down your app and overwhelm the user with unnecessary information. Instead, show a clear, manageable amount of data by default, and let users easily search or filter to find exactly what they're looking for. This approach keeps your app fast, user-friendly, and focused on what's useful.
- **Avoid delegation warnings**: Ensure that the row limit for delegation warnings in any canvas app is set low, to five or ten. This ensures that any data call that can't be delegated is flagged in the formula bar, allowing the app developer to be purposeful on allowing potentially non-delegated queries, and not be unaware of the issue because the amount of data returned from the development data source isn't enough to trigger the default warning limit value.

  Non-delegated queries can be acceptable if there's a constant, small amount of data to be returned, as in configuration data or other small data sets.

Learn more about [optimizing your solution's logic](/power-platform/well-architected/performance-efficiency/optimize-code).

## Next step

> [!div class="nextstepaction"]
> [Identifying and mitigating canvas app performance issues](top-issues.md)
