---
title: Measure and maintain Power Platform solution performance
description: Discover tools and best practices to monitor, analyze, and optimize your solutions. Improve reliability and user experience today.
#customer intent: As a Power Platform user, I want to monitor and optimize solution performance so that I can ensure reliability and a positive user experience.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: best-practice
ms.date: 07/08/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:06/02/2025
---

# Measure and maintain Power Platform solution performance

This article provides an overview of tools for monitoring and optimizing Power Platform solution performance. Each tool offers unique features to help you diagnose issues, analyze usage patterns, and ensure that your apps, flows, and data services run efficiently. Depending on the business criticality and/or risk for a particular solution, you may need to use a different mix of tools to help prevent potential issues. Examples are provided in [Recommendations across solution complexity](#recommendations-across-solution-complexity).

## Monitoring and reporting tools and processes

Use these essential tools to monitor and report on the performance of your Power Platform solutions.

### Power Apps Checker

Power Apps Checker is a built-in tool in Power Apps Studio that identifies potential performance, accessibility, and formula issues in canvas apps. It provides immediate feedback on areas that can affect app responsiveness or user experience, allowing you to proactively address problems prior to deployment.

To use Power Apps Checker, open your app in Power Apps Studio and select the **Apps Checker**  (stethoscope) icon from the toolbar. The tool displays a list of issues by severity, with explanations and recommendations for resolving each issue. Regularly review and address these findings to ensure your apps remain performant and user friendly.

### Power Apps Monitor

Power Apps Monitor is a diagnostic tool that shows how your canvas apps perform in real time. It captures detailed telemetry as you interact with your app, including control rendering, data calls, errors, and network activity. This information helps you identify where slowdowns or failures occur and whether they're caused by slow data sources, inefficient formulas, or network issues.

To use Power Apps Monitor, open your app in Power Apps Studio and select **Monitor** from the toolbar. A separate window opens where you can run your app and watch as events are logged live. Select an event within the timeline to obtain more details. 

Review this data to help identify which parts of your app need optimization and to take action to improve performance.

### Power Automate Analytics

Power Automate Analytics provides a dashboard view of how your automated workflows (flows) perform over time. It tracks metrics like the number of successful and failed runs, average execution times, and error details. This information helps you determine not only whether your flows work, but also how efficiently they're running and where they might get stuck.

To access these analytics, go to your flow in Power Automate and select **Analytics**. Review the charts and tables that highlight trends and patterns, such as recurring failures or slow steps. Analyzing this data helps you identify bottlenecks, optimize flow logic, and ensure that your automations are reliable and responsive.

### Dataverse Analytics

Dataverse Analytics offers insights into the underlying data platform used by many Power Platform solutions. It shows metrics on data storage, API usage, and query performance, helping you to understand how your solution interacts with its data sources. This information helps you identify slow queries, excessive data operations, and potential capacity issues.

Access Dataverse Analytics in the Power Platform admin center by selecting your environment and navigating to the **Analytics** section under Dataverse. Review the dashboards and reports that break down usage patterns and performance statistics. Monitoring these metrics allows you to proactively address issues (optimizing queries or managing data growth, for example) before they impact users.

### Azure Application Insights

Azure Application Insights is a monitoring service that integrates with Power Platform solutions, especially those that use custom connectors, plugins, or Azure services. It collects telemetry data like user interactions, response times, exceptions, and dependency calls, providing a complete view of your app's health and performance.

To set up Application Insights, create an instance in the Azure portal. Then, configure your Power Platform solution or related components to send telemetry data to it—this can involve adding instrumentation code or setting up connectors. After setup, use the Application Insights dashboard to visualize trends, set up alerts, and drill into specific issues. These insights into your app's performance help you maintain high performance and quickly resolve issues.

### Solution Checker

Solution Checker is a built-in tool in Power Apps that scans your solutions for common performance, reliability, and security issues. It analyzes your customizations—such as plugins, workflows, and configurations—and provides a report with actionable recommendations to improve efficiency and compliance with best practices.

To use Solution Checker, go to your solution in the Power Apps portal, select **Solution Checker**, and run the analysis. The tool generates a detailed report highlighting issues and suggesting fixes, like optimizing queries or refactoring code. Regularly run Solution Checker to catch potential problems early and to maintain high-quality solutions.

### Performance testing and benchmarking

Performance testing simulates real-world usage of your Power Platform solution to see how it behaves under various conditions, such as multiple users or large data volumes. This information helps you identify how your solution scales and where it might struggle as demand increases. Benchmarking compares your solution's performance against predefined standards or previous versions to measure improvements or regressions.

Run performance testing manually by having users do typical tasks and measuring response times, or use automated tools to simulate load and capture metrics. Regular testing and benchmarking help ensure your solution remains responsive and reliable as it evolves, and provide concrete data to guide optimization.

### Distributed tracing

Sometimes, a performance issue can be spread across services or buried deep within service calls, making it hard to trace and occurring intermittently with no clear pattern. Use distributed tracing to ensure you have the telemetry needed to find and fix problems when they occur.

Learn more about implementing a [distributed tracing pattern](/power-platform/architecture/key-concepts/distributed-tracing).

## Recommendations across solution complexity

When evaluating Power Platform solutions, it's helpful to classify them into three tiers of complexity, with each tier reflecting the potential impact and technical sophistication of the solution:

- **Low risk**: Typically simple and personal
- **Medium risk**: Involve moderate impact or integration
- **High risk**: Encompass mission-critical or highly integrated systems

As the complexity increases from low to high risk, the requirements for monitoring, testing, and optimization become more stringent. Ensure that each solution receives the right level of attention and employ the appropriate best practices to match criticality and the potential risks.

> [!NOTE]
> These recommendations across risk categories are an example. Your context may require you to make changes to best fit your needs.

### All, low-risk, or personal productivity solutions

When you implement standards across apps and solutions in your tenant, stick to tools that don't require additional permissions or bookmarks.

Determine which items flagged by the Power Apps Checker are possible to ignore and which require mitigation. Document your recommendations and promote that knowledge within your internal Power Platform community.

Ensure that **Inefficient delay loading** within the App Checker is **cleared entirely**. Inefficient delay loading typically occurs when an app has [cross-screen references](top-issues.md), such as a control property that references a control on another screen. When this happens, Power Apps load the second screen to show the current screen. If the second screen has a similar issue, it might need to load a third screen, and so on. This issue typically arises when developers copy and paste a control from one screen to another.

A tangled web of references is hard to undo. To avoid such issues, store shared values between screens as variables, collections, or named functions. In addition, consider and minimize delegated queries and accessibility issues to ensure your app runs reliably as data use and your user base change over time.

Learn more about [Power Apps Checker](#power-apps-checker).

### Medium-risk solutions

In addition to the items in the "all" category, medium risk solutions require careful monitoring of potential issues as solution data grows over time. Ensure that you're gathering the right data to react quickly to issues and to identify improvements that increase the business value of your solution.

Tools like Power Apps Monitor, Power Automate Analytics, and Dataverse Analytics provide valuable insights on how your Power Platform solutions are performing. Together, these tools help you identify what's working well and where improvements can be made, enabling you to proactively optimize your solutions for better performance, reliability, and user satisfaction.

Learn more about:
- [Power Apps Monitor](#power-apps-monitor)
- [Power Automate Analytics](#power-automate-analytics)
- [Dataverse Analytics](#dataverse-analytics)

### High-risk solutions

In addition to the tools suggested for low- and medium-risk tiers, high-risk and high-business criticality solutions require tools that help teams support apps, enable developers to react quickly to fix issues, and provide data and reporting metrics to help the organization achieve its business goals. Performance is critical because apps perceived as slow, taking too long, or blocking business processes are quickly abandoned by users.

Learn more about:
- [Azure Application Insights](#azure-application-insights)
- [Performance testing and benchmarking](#performance-testing-and-benchmarking)

> [!CAUTION]
> Avoid traditional load-testing methods that rapidly send large numbers of requests directly to Power Platform services, as this can trigger platform throttling and negatively effect testing results. Instead, consider approaches such as:
> - Gradually ramping up user interactions to simulate realistic usage patterns.
> - Using multiple test accounts or identities to distribute load evenly.
> - Leveraging automated UI testing tools that mimic actual user behavior at realistic intervals.
>
> These methods help ensure accurate performance insights without violating platform usage policies or encountering throttling limits.

## Next step

> [!div class="nextstepaction"]
> [Identify and mitigate canvas app performance issues](top-issues.md)

## Related resources

- [Understand Power Apps Studio](/power-apps/maker/canvas-apps/power-apps-studio) 
- [View and download Microsoft Dataverse analytics](../../../admin/analytics-common-data-service.md)
- [Introduction to Application Insights](/azure/azure-monitor/app/app-insights-overview) 
- [Improve solution performance, stability, and reliability](/power-apps/maker/data-platform/use-powerapps-checker) 
- [​​Distributed tracing across multiple services​ in Power Platform](../distributed-tracing.md)

