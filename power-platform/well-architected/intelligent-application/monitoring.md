---
title: Performance monitoring considerations for intelligent application workloads
description: Performance monitoring considerations for intelligent application workloads TODO
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Performance monitoring considerations for intelligent application workloads

Performance efficiency is the ability of your workload to efficiently scale to meet the demands placed on it by users. Monitoring the performance of your intelligent application workload is crucial to ensuring it operates effectively and efficiently.

The workload team need to establish key performance metrics, regularly review system performance, and diagnose any issues promptly. Effective monitoring and diagnostic procedures help maintain system reliability and user satisfaction. 

The AI helpdesk comes with OOTB capabilities such as topic analysis to provide insights into common issues and integration with Azure Application Insights for advanced monitoring.


Increase performance efficiency by:

- Understanding target volumes helps validate the target architecture and scale. Target volumes also help validate the licensing aspects of the copilot and the potential impact on Dataverse storage for the conversation transcripts.
- Understand [platform limits](/microsoft-copilot-studio/requirements-quotas). When integrating with external systems, for example through Power Automate or HTTP requests, it’s important to validate that every part can handle the load.
- Continuously monitoring performance and detecting anomalies by using tools such as Azure Monitor, Log Analytics, Application Insights, and alerts
- Understand the expected copilot response times for
  - First chat load and first message response
  - Maximum latency for the copilot to answer user queries
  - Approach for handling long-running actions (e.g. waiting for an external system to return data)

Considering each of these aspects helps you build an intelligent application workload a consistent, cohesive user experience.

In the context of intelligent application workloads and conversational AI, the deflection rate should also be used as a metric to measure performance. Deflection is an indicator representing the percentage of requests that are completed in a self-service fashion that would otherwise be handled by live agents. In other words, it refers to the number of items a team avoids having to deal with as a result of automation. Optimizing the copilot deflection rate is one of the top focus areas for organizations to achieve their business goals around return on investment (ROI) and customer satisfaction (CSAT), and to improve the copilot's overall performance. There are major indicators in Copilot Studio that help improve copilot performance, such as resolution rate, escalation rate, and CSAT.

Monitoring the performance of the AI-powered HR helpdesk is crucial to ensuring it operates effectively and efficiently. 

Administrators need to establish key performance metrics, regularly review system performance, and diagnose any issues promptly. Effective monitoring and diagnostic procedures help maintain system reliability and user satisfaction. 

The AI helpdesk comes with OOTB capabilities such as topic analysis to provide insights into common issues and integration with Azure Application Insights for advanced monitoring.

Importance of monitoring system performance.
Key performance metrics for the AI-powered helpdesk.
Leveraging OOTB capabilities for monitoring.
Advanced monitoring with Azure Application Insights.
Regular performance reviews and reporting.

Tracking conversation engagement and outcomes is crucial to measure the copilot performance metrics and spot areas for improvements in the analytics dashboard.
https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/measuring-engagement
https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/measuring-outcomes

Analytics strategy

Copilot Studio provides comprehensive out-of-the-box analytics that allow customers to understand a copilot's usage and key performance indicators.
Customers can view reports related to:
Performance and usage.
Customer satisfaction.
Session information.
Topic usage.
Billed sessions.
However, there are often scenarios where you'll need to create or use custom analytics. For example, you may need to:
Share analytics with non-makers or users.
Report on conversation transcripts data for a period longer than the default last 30 days.
Design a report not covered by out-of-the-box analytics.
https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/custom-analytics-strategy

Optimization strategy

What is your plan to keep improving your copilot’s performance and ROI?
Return on investment (ROI) and improved customer satisfaction (CSAT) are top priorities for the organizations that implement Copilot Studio copilots.
Optimizing the copilot deflection rate is one of the top focus areas for organizations to achieve their business goals around ROI and CSAT, and to improve the copilot's overall performance. There are major indicators in Copilot Studio that help improve copilot performance, such as resolution rate, escalation rate, and CSAT.
While the metrics continue to evolve, there are several things you can do as a copilot builder to improve the deflection rate of your copilot. In these articles, we cover the importance of deflection in conversational AI and general techniques/considerations that are universal for optimizing deflection for copilots.
https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/deflection-overview