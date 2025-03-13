---
title: "Monitor resource health"
description: "Learn how to review out-of-the-box monitoring capabilities, check service and environment health, set alerts on security permissions or compliance regulations, and perform typical actions to ensure a secure, healthy, and safe citizen developer environment."
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/28/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Monitor resource health

Monitoring the health of your resources helps maintain the reliability and performance of your Power Platform workloads. This article will guide you through recommendations for monitoring resource health.

>[!TIP]
> Review [recommendations for designing a reliable monitoring and alerting strategy](/power-platform/well-architected/reliability/monitoring-alerting-strategy) from Power Platform Well-Architected. Implement this strategy to keep your operations teams informed of your environment's health status and ensure that you meet the established reliability targets for your workloads.

Key points to consider:

1. **Identify Critical and Non-Critical Flows**: Determine which flows are essential for your operations and prioritize monitoring for these critical components.
2. **Enable Comprehensive Logging**: Ensure that all cloud resources are configured to produce standardized, meaningful data. This includes enabling diagnostic logging throughout your environment.
3. **Centralize Data Collection**: Forward all diagnostic logs to a centralized data sink and analytics platform, such as a Log Analytics workspace, to facilitate comprehensive analysis.
4. **Automate Alerts and Responses**: Configure actionable alerts and automatic responses to intelligently defined thresholds to notify teams when issues arise.
5. **Visualize Health Metrics**: Use dashboards and reports to visualize the state of your workload, making it easier for stakeholders to understand and act on the data.

#### Power Platform Monitor Page

The Power Platform Monitor page is a powerful tool for tracking the health and performance of your applications. It provides real-time insights into the behavior of your apps, helping you identify and troubleshoot issues quickly. Key features include:

- **Live Monitoring**: View real-time data on app performance, including response times, error rates, and user interactions.
- **Detailed Logs**: Access detailed logs that capture events and errors, allowing you to diagnose and resolve issues efficiently.
- **Performance Metrics**: Analyze performance metrics to identify bottlenecks and optimize your apps for better user experiences.

#### Monitor Section on make.powerapps.com

The Monitor section on make.powerapps.com offers a centralized location for monitoring the health of your Power Apps and Power Automate flows. This section provides:

- **Flow Analytics**: Track the performance and reliability of your flows, including success rates, failure rates, and execution times.
- **Error Tracking**: Identify and troubleshoot errors in your flows with detailed error messages and logs.
- **Usage Insights**: Gain insights into how your apps and flows are being used, helping you make informed decisions about improvements and optimizations.

#### Copilot Studio Analytics Section for Makers

The Copilot Studio Analytics section is designed to help makers monitor and analyze the performance of their applications. This section includes:

- **User Analytics**: Track user interactions and engagement with your apps, providing valuable insights into user behavior.
- **Performance Dashboards**: Visualize key performance metrics, such as load times and error rates, to identify areas for improvement.
- **Custom Reports**: Create custom reports to analyze specific aspects of your app's performance and usage.

#### Integrating Azure Application Insights

Azure Application Insights is a powerful tool for extending your monitoring capabilities with custom logs, metrics, dimensions, and data retention. It is particularly useful for:

- **Custom Logs**: Capture custom log data to gain deeper insights into specific events and behaviors within your apps.
- **Custom Metrics**: Define and track custom metrics that are relevant to your specific use cases and performance goals.
- **Custom Dimensions**: Add custom dimensions to your telemetry data to provide additional context and granularity.
- **Data Retention**: Configure custom data retention policies to ensure that you retain the data you need for analysis and compliance purposes.

<!-- I think we may want to add a section on 'monitor resource health' and it's a double click into PPAC Monitor, Maker Portal monitor experiences (P. Auto's automation center is being renamed to 'Monitor', make.powerapps.com has a Monitor section and Copilot Studio's analytics section is being augmented by automation center and being renamed to Monitor. Also, we can callout Azure Application Insights (most useful for custom logs, custom metrics, custom dimensions, custom data retention). -->

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
