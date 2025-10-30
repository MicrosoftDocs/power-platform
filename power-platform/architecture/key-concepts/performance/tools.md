---
title: Measure and maintain Power Platform solution performance
description: Discover tools and best practices to monitor, analyze, and optimize your solutions. Improve reliability and user experience today.
#customer intent: As a Power Platform user, I want to monitor and optimize solution performance so that I can ensure reliability and a positive user experience.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: best-practice
ms.date: 08/06/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:06/02/2025
---

# Measure and maintain Power Platform solution performance

This article provides an overview of tools for monitoring and optimizing Power Platform solution performance. Each tool offers unique features to help you diagnose issues, analyze usage patterns, and ensure that your apps, flows, and data services run efficiently. Depending on the business criticality and risk for the solution, you might need to use a different mix of tools to help prevent potential issues. Examples are provided in [Recommendations across solution complexity](#recommendations-across-solution-complexity).

## Monitoring and reporting tools and processes

Use these essential tools to monitor and report on the performance of your Power Platform solutions.

### Power Apps Checker

Power Apps Checker is a built-in tool in Power Apps Studio that identifies potential performance, accessibility, and formula issues in canvas apps. It provides immediate feedback on areas that can affect app responsiveness or user experience, so you can proactively address problems before deployment.

To use Power Apps Checker, open your app in Power Apps Studio and select the **Apps Checker** (stethoscope) icon from the toolbar. The tool displays a list of issues by severity, with explanations and recommendations for resolving each issue. Regularly review and address these findings to ensure your apps remain performant and user friendly.

### Power Apps Monitor

Power Apps Monitor is a diagnostic tool that shows how your canvas apps perform in real time. It captures detailed telemetry as you interact with your app, including control rendering, data calls, errors, and network activity. This information helps you identify where slowdowns or failures occur and whether they're caused by slow data sources, inefficient formulas, or network issues.

To use Power Apps Monitor, open your app in Power Apps Studio and select **Monitor** from the toolbar. A separate window opens where you can run your app and watch as events are logged live. Select an event within the timeline to obtain more details. 

Review this data to help identify which parts of your app need optimization and to take action to improve performance.

Learn more in [Use Monitor to get insights and recommendations for your canvas app (preview)](/power-apps/maker/common/monitor-app-performance).

### Power Automate Analytics

Power Automate Analytics provides a dashboard view of how your automated workflows (flows) perform over time. It tracks metrics like the number of successful and failed runs, average execution times, and error details. This information helps you determine not only whether your flows work, but also how efficiently they're running and where they might get stuck.

To access these analytics, go to your flow in Power Automate and select **Analytics**. Review the charts and tables that highlight trends and patterns, such as recurring failures or slow steps. Analyzing this data helps you identify bottlenecks, optimize flow logic, and ensure that your automations are reliable and responsive.

### Dataverse Analytics

Dataverse Analytics offers insights into the underlying data platform used by many Power Platform solutions. It shows metrics on data storage, API usage, and query performance, helping you understand how your solution interacts with its data sources. This information helps you identify slow queries, excessive data operations, and potential capacity issues.

Access Dataverse Analytics in the Power Platform admin center from the **Manage** tab under **Products** > **Dataverse**. Review the dashboards and reports that break down usage patterns and performance statistics. By monitoring these metrics, you can proactively address issues, such as optimizing queries or managing data growth, before they impact users.

Learn more in [View and download Microsoft Dataverse analytics](../../../admin/analytics-common-data-service.md).

### Azure Application Insights

Azure Application Insights is a monitoring service that integrates with Power Platform solutions, especially those that use custom connectors, plugins, or Azure services. It collects telemetry data like user interactions, response times, exceptions, and dependency calls, providing a complete view of your app's health and performance.

To set up Application Insights, create an instance in the Azure portal. Then, configure your Power Platform solution or related components to send telemetry data to it. This process might involve adding instrumentation code or setting up connectors. After setup, use the Application Insights dashboard to visualize trends, set up alerts, and drill into specific issues. These insights into your app's performance help you maintain high performance and quickly resolve issues.

Learn more in [Introduction to Application Insights](/azure/azure-monitor/app/app-insights-overview).

### Solution Checker

Solution Checker is a built-in tool in Power Apps that scans your solutions for common performance, reliability, and security issues. It analyzes your customizations—such as plugins, workflows, and configurations—and provides a report with actionable recommendations to improve efficiency and compliance with best practices.

To use Solution Checker, go to your solution in the Power Apps portal, select **Solution Checker**, and run the analysis. The tool generates a detailed report that highlights issues and suggests fixes, like optimizing queries or refactoring code. Regularly run Solution Checker to catch potential problems early and maintain high-quality solutions.

Learn more in [Improve solution performance, stability, and reliability](/power-apps/maker/data-platform/use-powerapps-checker).

### Performance testing and benchmarking

Performance testing simulates real-world usage of your Power Platform solution to see how it behaves under various conditions, such as multiple users or large data volumes. This information helps you identify how your solution scales and where it might struggle as demand increases. Benchmarking compares your solution's performance against predefined standards or previous versions to measure improvements or regressions.

Run performance testing manually by having users do typical tasks and measuring response times, or use automated tools to simulate load and capture metrics. Regular testing and benchmarking help ensure your solution remains responsive and reliable as it evolves, and provide concrete data to guide optimization.

### Distributed tracing

Sometimes, a performance issue can be spread across services or buried deep within service calls, making it hard to trace and occurring intermittently with no clear pattern. Use distributed tracing to ensure you have the telemetry needed to find and fix problems when they occur.

Learn more about implementing a [distributed tracing pattern](/power-platform/architecture/key-concepts/distributed-tracing).

## Recommendations across solution complexity

When you evaluate Power Platform solutions, classify them into three tiers of complexity. Each tier reflects the potential impact and technical sophistication of the solution:

- **Low risk**: Typically simple and personal
- **Medium risk**: Involve moderate impact or integration
- **High risk**: Encompass mission-critical or highly integrated systems

As the complexity increases from low to high risk, the requirements for monitoring, testing, and optimization become more stringent. Ensure that each solution receives the right level of attention and employ the appropriate best practices to match criticality and the potential risks.

> [!NOTE]
> These recommendations across risk categories are an example. Your context might require you to make changes to best fit your needs.

### All, low risk, or personal productivity solutions

When you implement standards across apps and solutions in your tenant, make the standards easy to follow without needing to constantly refer back to them. Use tools that don't require extra permissions or processes.

Decide which items flagged by the Power Apps Checker you can ignore and which ones need mitigation. Document your recommendations and share that knowledge within your internal Power Platform community.

Make sure you **clear** the **Inefficient delay loading** issue in the App Checker. Inefficient delay loading usually happens when an app has [cross-screen references](top-issues.md), such as a control property that references a control on another screen. When this issue occurs, Power Apps load the second screen to show the current screen. If the second screen has a similar issue, it might need to load a third screen, and so on. This issue typically arises when developers copy and paste a control from one screen to another.

A tangled web of references is hard to undo. To avoid such issues, store shared values between screens as variables, collections, or named functions. In addition, consider and minimize delegated queries and accessibility issues to ensure your app runs reliably as data use and your user base change over time.

Learn more about [Power Apps Checker](#power-apps-checker).

### Medium risk solutions

In addition to the items in the "all" category, medium risk solutions require careful monitoring of potential issues as solution data grows over time. Make sure you're gathering the right data to react quickly to issues and identify improvements that increase the business value of your solution.

Tools like Power Apps Monitor, Power Automate Analytics, and Dataverse Analytics provide valuable insights on how your Power Platform solutions are performing. Together, these tools help you identify what's working well and where improvements can be made, enabling you to proactively optimize your solutions for better performance, reliability, and user satisfaction.

Learn more about:
- [Power Apps Monitor](#power-apps-monitor)
- [Power Automate Analytics](#power-automate-analytics)
- [Dataverse Analytics](#dataverse-analytics)

### High risk solutions

In addition to the tools suggested for low and medium risk tiers, high-risk and high-business criticality solutions require tools that help teams support apps, enable developers to react quickly to fix issues, and provide data and reporting metrics to help the organization achieve its business goals. Performance is critical because users quickly abandon apps they perceive as slow, taking too long, or blocking business processes.

Learn more about:
- [Azure Application Insights](#azure-application-insights)
- [Performance testing and benchmarking](#performance-testing-and-benchmarking)

> [!CAUTION]
> Avoid traditional load-testing methods that rapidly send large numbers of requests directly to Power Platform services, as this can trigger platform throttling and negatively affect testing results. Instead, consider approaches such as:
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
- [Use Monitor to get insights and recommendations for your canvas app (preview)](/power-apps/maker/common/monitor-app-performance)
- [View and download Microsoft Dataverse analytics](../../../admin/analytics-common-data-service.md)
- [Introduction to Application Insights](/azure/azure-monitor/app/app-insights-overview) 
- [Improve solution performance, stability, and reliability](/power-apps/maker/data-platform/use-powerapps-checker) 
- [​​Distributed tracing across multiple services​ in Power Platform](../distributed-tracing.md)
- [Debugging canvas apps with Live monitor](/power-apps/maker/monitor-canvasapps)
