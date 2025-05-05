---
title: Power Platform performance monitoring tools
description: Performance monitoring tools for Power Platform solutions
author: ghurlman
ms.author: grhurl
ms.date: '4/14/2025'
ms.topic: best-practice
ms.subservice: architecture-center
---
# Measuring and Maintaining Power Platform Solution Performance

This page provides an overview of key tools available for monitoring and optimizing the performance of Power Platform solutions. Each tool offers unique capabilities to help you diagnose issues, analyze usage patterns, and ensure your apps, flows, and data services run efficiently. Depending on the level of business criticality and/or risk for a particular solution, a different mix of tools may be needed to properly mitigate potential issues; examples of this are shown in the Recommendations Across Solution Complexity section below.

## Monitoring and Reporting Tools

- **Power Apps App Checker**

  The Power Apps App Checker is a built-in tool within Power Apps Studio that helps you identify potential performance, accessibility, and formula issues in your canvas apps. It provides immediate feedback on areas that could impact app responsiveness or user experience, allowing you to proactively address problems before deployment.

  To use App Checker, open your app in Power Apps Studio and select the "App Checker" icon (stethoscope icon) from the toolbar. The tool will display a list of issues categorized by severity, along with detailed explanations and recommendations for resolving each issue. Regularly reviewing and addressing these findings helps ensure your apps remain performant and user-friendly.

- **Power Apps Monitor**

  The Power Apps Monitor is a diagnostic tool designed to help you understand how your canvas apps are performing in real time. It captures detailed telemetry as you interact with your app, including information about control rendering, data calls, errors, and network activity. This makes it easier to pinpoint exactly where slowdowns or failures are occurring, whether they’re caused by slow data sources, inefficient formulas, or network issues.

  To use Power Apps Monitor, open your app in Power Apps Studio and select "Monitor" from the toolbar. This opens a separate window where you can run your app and watch as events are logged live. You’ll see a timeline of actions, with the ability to click into each event for more details. By reviewing this data, you can identify which parts of your app need optimization and take targeted action to improve performance.

- **Power Automate Analytics**

  Power Automate Analytics provides a dashboard view of how your automated workflows (flows) are performing over time. It tracks metrics such as the number of successful and failed runs, average execution times, and error details. This helps you understand not just if your flows are working, but how efficiently they’re running and where they might be getting stuck.

  To access these analytics, navigate to your flow in Power Automate and select "Analytics." Here, you can review charts and tables that highlight trends and patterns, such as recurring failures or slow steps. By analyzing this data, you can identify bottlenecks, optimize flow logic, and ensure your automations are reliable and responsive.

- **Dataverse Analytics**

  Dataverse Analytics offers insights into the underlying data platform used by many Power Platform solutions. It provides metrics on data storage, API usage, and query performance, helping you understand how your solution interacts with its data sources. This is especially useful for identifying slow queries, excessive data operations, or potential capacity issues.

  You can access Dataverse Analytics through the Power Platform Admin Center by selecting your environment and navigating to the "Analytics" section under Dataverse. Here, you’ll find dashboards and reports that break down usage patterns and performance statistics. Monitoring these metrics allows you to proactively address issues before they impact users, such as optimizing queries or managing data growth.

- **Azure Application Insights**

  Azure Application Insights is a comprehensive monitoring service that can be integrated with Power Platform solutions, especially those that use custom connectors, plugins, or Azure services. It collects telemetry data such as user interactions, response times, exceptions, and dependency calls, providing a holistic view of your application’s health and performance.

  To implement Application Insights, you first set up an instance in the Azure portal. Then, configure your Power Platform solution or related components to send telemetry data to it—this may involve adding instrumentation code or configuring connectors. Once set up, you can use the Application Insights dashboard to visualize trends, set up alerts, and drill into specific issues, making it easier to maintain high performance and quickly resolve problems.

- **Performance Testing and Benchmarking**

  Performance testing involves simulating real-world usage of your Power Platform solution to see how it behaves under different conditions, such as multiple users or large data volumes. This helps you identify how your solution scales and where it might struggle as demand increases. Benchmarking, on the other hand, involves comparing your solution’s performance against predefined standards or previous versions to measure improvements or regressions.

  You can conduct performance testing manually by having users perform typical tasks and measuring response times, or use automated tools to simulate load and capture metrics. Regular testing and benchmarking help ensure your solution remains responsive and reliable as it evolves, and provide concrete data to guide optimization efforts.

- **Solution Checker**

  Solution Checker is a built-in tool within Power Platform that automatically scans your solutions for common performance, reliability, and security issues. It analyzes your customizations—such as plugins, workflows, and configurations—and provides a report with actionable recommendations to improve efficiency and best practices compliance.

  To use Solution Checker, go to your solution in the Power Apps portal, select "Solution Checker," and run the analysis. The tool will generate a detailed report highlighting issues and suggesting fixes, such as optimizing queries or refactoring code. Regularly running Solution Checker helps you catch potential problems early and maintain high-quality solutions.

## Recommendations across solution complexity

When evaluating Power Platform solutions, it's helpful to classify them into three tiers of complexity: Low risk, Medium risk, and High risk. Each tier reflects the potential impact and technical sophistication of the solution, with Low risk solutions being simple and personal, Medium risk involving moderate business impact or integration, and High risk encompassing mission-critical or highly integrated systems. As the complexity increases from Low to High risk, the requirements for monitoring, testing, and optimization become more stringent, ensuring that each solution receives the right level of attention and best practices to match its importance and potential risks.

>[!NOTE]
> These recommendations across risk categories are one example; your context may require you to make changes to best fit your needs.

### All, Low-risk, or Personal Productivity solutions

When trying to implement any standards across every app and solution in your tenant it's best to stick to tools that don't require any additional permissions or additional bookmarks if possible.

Determine what items that are flagged by the Power Apps App Checker that are OK to ignore and which should be cleared, document those recommendations, and promote that knowledge within your internal Power Platform community.

We recommend ensuring that **Inefficient delay loading** within the App Checker is **cleared entirely**. Inefficient delay loading means that your app has cross-screen references, most likely with a control property, referring to a control on another screen. This most often occurs when copying and pasting a control from one screen to another. When this happens, this causes Power Apps to load that second screen in order to show the current screen. If that second screen has a similar issue, then it may need to load a third screen, and so on.

This can quickly become a tangled web of references that are very hard to undo if they aren't handled as you go. To remedy these issues, insure that any shared values between screens are stored as variables, collections, or named functions.

In addition, any instances of delegated queries or accessibility issues should be considered and minimized where possible to ensure that your app will continue to run, even as data use and your userbase changes over time.

### Medium-risk solutions

In addition to the items in the "all" category, medium risk solutions need to keep a closer eye on potential issues that can arise as the size of the solution data grows over months and years, and ensure that you are gathering enough of the right data to ensure that you can react quickly to issues, and know where to make improvements to increase the business value achieved with your solution.

Tools like **Power Apps Monitor**, **Power Automate Analytics**, and **Dataverse Analytics** will best help provide valuable insights that help you clearly see how your Power Platform solutions are performing.

- **Power Apps Monitor** allows you to observe your canvas apps in real-time, capturing detailed information about how users interact with the app. It logs events such as control rendering times, data retrieval operations, formula execution, and network requests. By examining these logs, you can quickly identify exactly where slowdowns or errors occur, whether they're due to inefficient formulas, slow data source connections, or network latency. This detailed visibility helps you pinpoint specific areas for optimization, ensuring a smoother user experience.

- **Power Automate Analytics** provides comprehensive dashboards and reports that illustrate how your cloud flows perform over time. It tracks key metrics such as the number of successful and failed runs, average execution durations, and detailed error information. By analyzing these metrics, you can identify recurring issues, slow-running steps, or bottlenecks within your flows. This insight enables you to refine your automation logic, improve reliability, and ensure your workflows consistently meet business requirements.

- **Dataverse Analytics** offers deep insights into the performance and usage of the underlying data platform powering many Power Platform solutions. It provides metrics on data storage consumption, API call volumes, query performance, and data operation efficiency. By reviewing these analytics, you can detect slow or inefficient queries, excessive data operations, or potential capacity constraints. This allows you to proactively optimize data interactions, manage data growth effectively, and maintain high performance as your solution scales.

Together, these tools help you pinpoint what's working well and where improvements can be made, enabling you to proactively optimize your solutions for better performance, reliability, and user satisfaction.

### High-risk solutions

In addition to the tools in the low and medium-risk sections, high risk and/or high business criticality solutions need to enable the teams that support these apps, the developers that react quickly to fix issues that pop up, and enable your organization to reach their business goals with data and reporting metrics to support them. Performance plays a key role in this process, as any app that is perceived as slow, as taking too long, or otherwise as a roadblock to a business process will quickly find itself disused and abandoned by its user base.

- **Azure Application Insights** provides a powerful way to monitor the overall health and performance of your Power Platform solutions, especially when they involve custom integrations or complex interactions with other services. It collects detailed information about how users interact with your apps, how quickly the apps respond, and where errors or slowdowns occur. By visualizing this data through easy-to-understand dashboards, developers can quickly spot issues, understand their root causes, and take targeted actions to improve the user experience. For business-critical solutions, this proactive monitoring helps ensure reliability, responsiveness, and user satisfaction, ultimately supporting the organization's goals and productivity.

- **Performance testing and benchmarking** involves regularly checking how your Power Platform solutions perform under realistic conditions, such as heavy user traffic or large amounts of data. By simulating these scenarios, developers can identify potential bottlenecks or areas where the solution might slow down or fail. Benchmarking allows you to compare current performance against previous versions or established standards, clearly showing improvements or regressions. For solutions that are critical to business operations, this practice ensures that performance remains consistent and reliable, helping developers maintain user trust and confidence in the solution's ability to support essential business processes.

  > [!CAUTION]
  > Avoid traditional load-testing methods that rapidly send large numbers of requests directly to Power Platform services, as this can trigger platform throttling and negatively impact your testing results. Instead, consider approaches such as:
  > - Gradually ramping up user interactions to simulate realistic usage patterns.
  > - Using multiple test accounts or identities to distribute load evenly.
  > - Leveraging automated UI testing tools that mimic actual user behavior at realistic intervals.
  >
  > These methods help ensure accurate performance insights without violating platform usage policies or encountering throttling limits.

## Next step

> [!div class="nextstepaction"]
> [Power Platform performance monitoring tools](tools.md)
