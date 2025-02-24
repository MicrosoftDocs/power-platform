---
title: Gain insights into Power Platform adoption
description: Guidance for gaining insights into Power Platform adoption
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
ms.date: 02/28/2025
---

# Gain insights into Power Platform adoption

Being able to effectively monitor your Power Platform adoption and gain insights into the health, performance, and security of your Power Platform solutions is key to successful adoption. Having full visibility into how your organization is using the platform will help you govern and secure the platform, identify patterns, and nurture your makers to accelerate adoption.

1. **Governance and security**: By understanding how your organization is utilizing the platform, you can implement governance policies to ensure data security and compliance. This helps in identifying potential risks and mitigating them proactively.

2. **Performance insights**: Monitoring usage patterns and performance metrics enables you to identify bottlenecks and optimize the performance of your solutions. This ensures a smooth and efficient user experience.

3. **Adoption patterns**: Gaining insights into adoption trends helps you recognize which solutions are being widely used and which ones need more attention. This information is vital for making informed decisions about resource allocation and support.

4. **Nurturing makers**: By analyzing usage data, you can identify and support your makers—those who are actively creating and using Power Platform solutions. Providing them with the necessary resources and training can accelerate adoption and innovation within your organization.

By monitoring key metrics and events at both the tenant and solution levels, you can proactively identify and address issues, optimize performance, and ensure compliance with governance policies. This article provides guidance on what to monitor at each level to achieve comprehensive observability.

## Tenant-Level monitoring

At the tenant level, monitoring focuses on the overall health and usage of the platform. Key areas to monitor include:

1. **Resource usage and maker activity**: Monitor user logins, app usage, and API calls to understand how users are interacting with the platform. This helps identify trends, detect unusual activity, and ensure that resources are being used effectively.
    1. monitor page for health
    1. secure page for security things
    1. purview / sentinel?
    1. advisor for recommendations

1. **Resource health and performance**: Monitor resource health and performance to maintain the reliability and efficiency of your solutions. Understand the production health and detect any degradations early. Proactively monitoring health metrics minimizes downtime and enables you to identify areas for improvement.

1. **Security and compliance**: Keep an eye on security-related events, such as failed login attempts, changes to security roles, and data access patterns. This helps maintain compliance with organizational policies and regulatory requirements.

1. **Licensing and capacity**: Monitor license usage and capacity limits to ensure that the organization is not exceeding its allocated resources and to plan for future needs.

## Solution-Level Monitoring

At the solution level, monitoring focuses on the performance and reliability of individual applications and components. Key areas to monitor include:

1. **Application performance**: Track key performance indicators (KPIs) such as response times, load times, and error rates. This helps identify performance bottlenecks and optimize the user experience.

1. **Error logs and diagnostics**: Monitor error logs and diagnostic data to quickly identify and resolve issues within applications. This includes tracking exceptions, failed operations, and other error conditions.

1. **Usage patterns**: Analyze how users are interacting with specific applications, including feature usage, session durations, and user feedback. This helps prioritize enhancements and identify areas for improvement.

1. **Integration points**: Monitor the performance and reliability of integrations with other systems and services. This includes tracking API calls, data transfers, and the status of connected services.

1. **Security and access controls**: Monitor access controls and permissions within applications to ensure users have the appropriate level of access to the functionality and data.

Learn more about [recommendations for designing and creating a monitoring system](/power-platform/well-architected/operational-excellence/observability)

## Tools and Best Practices

To achieve effective observability and insights, you should leverage the following tools:

1. **Power Platform Admin Center**: Use the Power Platform Admin Center to monitor tenant and environment level metrics, also mention security page, monitor page, and power advisor.

1. **Application Insights**: Integrate Application Insights with Power Platform solutions to track detailed, granular logs and custom metrics for deep analysis, which facilitates a comprehensive understanding of application performance. [Learn more in Integration with Application Insights](/power-platform/admin/overview-integration-application-insights).

1. **Custom Dashboards**: Create custom dashboards to visualize key metrics and trends, providing a centralized view of the adoption and usage patterns of your Power Platform environments. start with the coe starter kit.

1. **Automated alerts**: Set up automated alerts to notify administrators of critical events, such as performance degradation, security breaches, or capacity issues.

1. **Regular reviews**: Conduct regular reviews of monitoring data to identify trends, assess the effectiveness of governance policies, and make data-driven decisions for continuous improvement.

Empower teams to quickly detect, triage, and respond to issues while minimizing impact on end user experiences or your business processes.

Monitor experiences: This capability includes admin and maker experiences that provide out-of-the-box metrics and recommendations. The metrics and recommendations help admin and makers understand production health, detect degradations, and improve production health.

## Resources

- [Monitor page in the Power Platform Admin Center](/power-platform/admin/monitoring/monitoring-overview)
