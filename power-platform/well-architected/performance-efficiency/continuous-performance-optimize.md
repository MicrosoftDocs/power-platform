---
title: Continuously optimize performance recommendation for Power Platform workloads
description: Learn how to continuously optimize performance and establish a performance culture to support your Power Platform workload. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for continuous performance optimization

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:10](checklist.md)|**Continuously optimize performance. Focus on components that show deteriorating performance over time, such as databases and networking features.**|
|---|---|

This guide describes the recommendations for continuous performance optimization. Continuous performance optimization is the process of constantly monitoring, analyzing, and improving performance efficiency. Performance optimization needs to be an ongoing activity throughout the life of the workload. Workload performance can degrade or become excessive over time. Factors to consider include changes in usage patterns, increase in data being stored, demand, features, and technical debt.

**Definitions**

| Term | Definition |
|---|---|
| Technical debt | The accumulated inefficiencies, suboptimal design choices, or shortcuts intentionally taken during the development process to deliver code faster. |
| Time-to-live | A mechanism that sets an expiration time for data. |

## Key design strategies

Performance efficiency is achieved when workload capacity aligns to actual usage. A workload that overperforms is as problematic as one that underperforms. The tradeoffs differ. Overperformance affects cost optimization. Poor performance affects users. The key to performance efficiency is monitoring, adjusting, and testing over time. You need to regularly review performance metrics and make adjustments as necessary to ensure that the workload is efficient. Testing all changes pre- and post-implementation is required to reach performance targets.

### Develop a performance culture

A performance culture is an environment in which continuous improvement is expected and the team learns from production. Performance optimization requires specialized skills. Workload teams need the right skills and mindset to optimize their performance to meet increases and decreases in demand. You also need to allocate their time to support the required monitoring and remediation of performance issues as they arise. These teams need clear expectations. For example, performance targets, baselines, and deviation thresholds (how far from baseline is acceptable) need to be highly visible and socialized.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Continuous performance optimizations require a team that has the right skills and time to find and fix performance issues. Dedicating personnel to performance adds operational cost. If you have limited personnel resources, continuous performance optimization could take time away from other operational tasks.

### Evaluate new platform features

Evaluating new platform features involves examining the new functionalities and features that can improve performance efficiency, such as optimized ways of querying data, modern controls, or caching mechanisms. New platform features can open avenues for enhancing performance efficiency. Stay up to date with platform features to ensure you're using the latest innovations and best practices. Consistently monitor feedback and performance metrics from these new additions to refine your approach.

### Prioritize optimization efforts

Proactively optimizing performance means taking measures to improve and enhance the performance of the workload before any performance issues arise. Using proactive measures involves identifying potential bottlenecks, monitoring performance metrics, and implementing optimizations to ensure that the workload operates efficiently and meets the desired performance goals. Based on the analysis of deteriorating components, critical flows, and technical debt, you can implement performance optimizations specific to each area. Improvements might involve code changes, infrastructure adjustments, or configuration updates.

### Prioritize deteriorating components

As the workload evolves and usage patterns change, these changes often affect the performance of individual components in the workload. Increased data in databases can lead to longer query run times and slower data retrieval. Changes in usage patterns might result in suboptimal query design. Queries that were once efficient can become inefficient as the workload evolves. Inefficient queries can consume excessive resources and degrade database performance.

It's important to make continuous efforts to optimize the performance of components that show decreased performance over time. Proactively identify and address performance issues in your workload. By prioritizing known deteriorating components, you can proactively address potential performance issues and ensure the smooth operation of your workload. Consider implementing performance tuning techniques or optimizing resource allocation.

### Prioritize critical user and system flows

Critical user and system flows are the most important and high-priority processes or workflows in the workload. By prioritizing these critical flows, you ensure that the most essential parts of the workload are optimized for performance. Knowing which flows are critical helps to prioritize optimization efforts. Optimizing the performance efficiency of the most important areas of your application provides the highest return on investment. You should monitor critical flows and the most popular parts of the application. Look for ways to make them more efficient.

### Automate performance optimization

Automation can eliminate repetitive and time-consuming manual processes, allowing them to be performed efficiently. Automation reduces the chances of human error and ensures consistency in running optimization tasks. By automating these tasks, you can also free up people to focus on more complex activities and activities that add value. You can apply automation to various tasks, such as performance testing, deployment, and monitoring.

- _Automated performance testing_: Use automated performance testing tools like Selenium to simulate different workloads and scenarios. [Power Apps Test Engine](/power-apps/developer/test-engine/overview) is a component within the Power Platform CLI that you can use to test standalone canvas apps in Power Apps.

- _Automated deployment_: Implement automated deployment processes to ensure consistent and error-free deployments. Use CI/CD (continuous integration/continuous delivery) tools to automate the deployment process. These tools can help you identify performance bottlenecks as you use them to test against endpoints, check HTTP statuses, and even validate data quality and variations.

- _Monitoring and alerting_: Set up automated monitoring and alerting systems to continuously monitor performance metrics and detect any deviations or anomalies. When performance issues are detected, automated alerts can be triggered to notify the appropriate teams or individuals.

- _Incident management_: Implement an automated incident management system that can receive alerts, create tickets, and assign tickets to the appropriate teams for resolution. These steps help ensure that performance issues are promptly addressed and assigned to the right resources.

- _Automated diagnostics_: Develop automated diagnostic tools or scripts that can analyze performance data and identify the root causes of performance issues. These tools can help pinpoint specific areas or components of the system that are causing performance problems.

- _Automated remediation actions_: Define and implement automated remediation actions that can be triggered when specific performance issues are detected. These actions can include restarting services, adjusting resource allocation, clearing caches, or implementing other performance optimization techniques.

- _Self-healing systems_: Build self-healing capabilities into your system by automating the recovery process for known performance issues. This capability can involve automatically fixing or adjusting the system configuration to restore optimal performance.

### Address technical debt

Technical debt refers to the accumulated inefficiencies, suboptimal design choices, or shortcuts taken during the development process that can affect performance. Technical debt, unclear code, and overly complex implementations can make performance efficiency more difficult to attain. Addressing technical debt involves identifying and resolving these issues to improve the overall performance and maintainability of the workload. This work might include refactoring code, optimizing database queries, improving architectural design, or implementing best practices. Perhaps, for example, you introduced technical debt to meet a deadline&mdash;you'll need to address that technical debt as you optimize performance efficiency over time.

### Optimize databases

Continuously optimizing databases involves identifying and implementing optimizations to ensure that databases can handle loads, deliver fast response times, and minimize resource utilization. By regularly optimizing databases, you can improve application performance, reduce downtime, and enhance the overall user experience.

- **Optimize database queries**: Poorly written database queries can degrade database performance. Inefficient filters can cause unneeded data processing. Complex subqueries, nested queries, and excessive functions can reduce running speed. Rewrite queries that retrieve too much data. Identify your most common or critical database queries and optimize them. The optimization helps ensure faster queries.
- **Review model design**: Review the data model to ensure you optimize it for the specific requirements of the application.

## Power Platform facilitation

**Automating performance optimization**: Solution checker provides [performance recommendations](/power-apps/maker/data-platform/use-powerapps-checker) based on a static analysis check on your solutions against a set of best-practice rules to quickly identify problematic patterns. Be sure to review and address these recommendations regularly.

**Monitoring performance optimization**: Integrate your Power Platform workloads with [Application Insights](/power-platform/admin/overview-integration-application-insights?source=recommendations) to gain insights and recommendations for optimizing performance. Use the [Monitor](/power-platform/admin/monitoring/monitoring-overview) area of the Power Platform admin center to measure and improve operational health metrics of apps and flows, and review recommendations.

**Analyze agent performance and usage in Copilot Studio**: Copilot [Analytics](/microsoft-copilot-studio/analytics-summary) provides a comprehensive overview of your agent's performance. It uses artificial intelligence (AI) technology to identify which topics are having the greatest impact on escalation rate, abandon rate, and resolution rate. Tracking [conversation engagement](/microsoft-copilot-studio/guidance/measuring-engagement) rates and [outcomes](/microsoft-copilot-studio/guidance/measuring-outcomes) is essential for measuring agent performance metrics and discovering areas for improvement.

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
