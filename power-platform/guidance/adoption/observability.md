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

One of the key principles of administering Microsoft Power Platform is having full visibility into how your organization is using the platform. Insights into your adoption will help you govern and secure the platform, identify patterns, and nurture your makers to accelerate adoption. Only with the right insights can you make informed decisions on how to optimize the platforms usage. As your organization's adoption of Power Platform grows, it becomes even more critical to not only have full visibility but also to gain actionable insights. These insights enable you to focus your resources on what matters most, ensuring that your Power Platform environment remains efficient, secure, and aligned with your business goals.

Why insights matter:

- **Proactive issue resolution:** With comprehensive visibility, administrators can detect and address issues before they escalate, minimizing downtime and disruptions.
- **Resource optimization:** Understanding how resources are being utilized helps in optimizing their allocation, ensuring that critical areas receive the attention they need.
- **User adoption and engagement:** Monitoring user activity and adoption rates provides valuable insights into how the platform is being used, allowing for targeted training and support initiatives.
- **Security and compliance:** Visibility into data access and usage patterns is essential for maintaining security and compliance with industry regulations.

As your Power Platform adoption grows, actionable insights become more and more important. These insights help you prioritize actions and allocate resources effectively. Some key insights that an admin might focus on include:

- **Usage trends:** Identifying which apps and features are most frequently used can guide development and support efforts.
- **Performance metrics:** Monitoring app performance and identifying bottlenecks ensures a smooth user experience.
- **Security alerts:** Keeping track of security incidents and potential vulnerabilities helps in maintaining a secure environment.
- **Governance:** Ensuring that all activities comply with established governance policies is crucial for maintaining control and accountability.
- **Capacity management:** Understanding storage and license usage helps in planning for future growth and avoiding performance issues.

This article delves into the key aspects of monitoring usage and adoption, governance and security, platform health, and capacity, providing actionable recommendations for each area.

## Monitoring usage and adoption

Understanding how users interact with the Power Platform is important for driving adoption and optimizing usage.

- Track the number of active users: Track the number of users who are actively using the platform on a daily, weekly, and monthly basis. Identify trends in user activity to understand peak usage times and periods of inactivity.
- Monitor usage patterns and frequency: Analyze how users and makers are interacting with the platform, including which features and tools are most frequently used. Identify any underutilized features that may require additional training or promotion.
- Identify and address any barriers to adoption: Collect feedback from users through surveys, focus groups, and direct communication. Use this feedback to identify pain points, areas for improvement, and opportunities for new features.

Learn more about [tracking resource usage](resource-usage.md)

## Governance, security and compliance

Effective governance ensures that the Power Platform is used responsibly and aligns with organizational policies.

- Ensure adherence to organizational policies and governance frameworks. stablish clear policies for the use of the Power Platform, including data handling, user access, and acceptable use. Regularly review and update policies to reflect changes in technology and business needs.
- Monitor access controls and permissions. Define roles and permissions to ensure users have appropriate access based on their responsibilities. Implement least privilege access to minimize security risks. Regularly review high-impact accounts and remove priviliges if they are no longer needed.
- Track security incidents. Implement security monitoring tools to detect and respond to threats
- Ensure the platform complies with relevant regulations such as GDPR, HIPAA, and CCPA. Conduct regular audits to verify compliance and address any gaps.

## Platform and solution health

Monitoring and maintaining the health of solutionsis vital for uninterrupted service and user satisfaction.

- Check the [Service health dashboard](/power-platform/admin/check-online-service-health) to view the status of the Power Platform service, details about existing service incidents, and up to 30 days’ worth of history.
- Monitor experiences using the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center. This capability includes admin and maker experiences that provide out-of-the-box metrics and recommendations. The metrics and recommendations help admin and makers understand production health, detect degradations, and improve production health. The Monitor page exists to bring attention to resources with degraded operational health and highlight which resources have opportunities for improvement.
- View event logs and error logs. All metrics that are part of the monitoring experience are aggregated from runtime event logs and error logs associated to a metric and can be accessed in the [Logs page](/power-platform/admin/monitoring/logs) in the Power Platform admin center. Logs are available to aid operational health analysis and they may be downloaded for offline review.
- Implement Azure Application Insights integration. This capability delivers detailed, granular logs and custom metrics for deep analysis, which facilitates a comprehensive understanding of application performance. Learn more: [Integration with Application Insights](https://learn.microsoft.com/en-us/power-platform/admin/overview-integration-application-insights).
- Establish a robust incident management process to handle outages and disruptions efficiently. Learn more: [Recommendations for designing a reliable monitoring and alerting strategy](/power-platform/well-architected/reliability/monitoring-alerting-strategy)

## Performance

Ensuring optimal performance of apps and workflows is critical for user experience and productivity.

- Follow [recommendations for Performance Efficiency](/power-platform/well-architected/performance-efficiency/checklist) from Power Platform Well-Architected to design workloads so they can grow and meet your workload usage demands.
- Monitor experiences using the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center. This capability includes admin and maker experiences that provide out-of-the-box metrics and recommendations. The metrics and recommendations help admin and makers understand production health, detect degradations, and improve production health. The Monitor page exists to bring attention to resources with degraded operational health and highlight which resources have opportunities for improvement.
- Implement Azure Application Insights integration. This capability delivers detailed, granular logs and custom metrics for deep analysis, which facilitates a comprehensive understanding of application performance. Learn more: [Integration with Application Insights](https://learn.microsoft.com/en-us/power-platform/admin/overview-integration-application-insights).

## Capacity and licenses

Monitoring capacity and license usage ensures optimal resource allocation, prevent unexpected costs, and maintain compliance with licensing agreements, ultimately supporting efficient and sustainable Power Platform adoption.

- [License utilization](/power-platform/admin/view-license-consumption-issues). Track the number of licenses issued versus the number of active users. Monitor the types of licenses in use and ensure they align with user roles and needs. Reiew [intelligent recommendations about licensing](/power-platform/admin/get-recommendations-licensing) which provides you with recommendations about who in your organization would benefit from having a Power Apps premium license.
- [Capacity usage](/power-platform/admin/capacity-storage#capacity-page-details). Monitor storage capacity for databases, files, and logs.
Track API request limits and usage to avoid hitting thresholds.
- [Environment capacity](/power-platform/admin/whats-new-storage#what-happens-when-my-organization-exceeds-storage-entitlements). Keep an eye on the number of environments created and their usage. Ensure environments are being used efficiently and decommission any that are no longer needed.
- Cost optimization. Regularly review and optimize costs by identifying and eliminating unnecessary expenses. Consider using cost management tools to track and manage expenses more effectively.

## Tenant-level monitoring

At the tenant level, monitoring focuses on the overall health and usage of the platform. Key areas to monitor include:

1. **Resource usage and maker activity**: Monitor user logins, app usage, and API calls to understand how users are interacting with the platform. This helps identify trends, detect unusual activity, and ensure that resources are being used effectively. Learn more about [tracking resource usage](resource-usage.md).
1. **Resource health and performance**: Monitor resource health and performance to maintain the reliability and efficiency of your solutions. Understand the production health and detect any degradations early. Proactively monitoring health metrics minimizes downtime and enables you to identify areas for improvement. Learn about [tracking resource health and performance](#platform-and-solution-health).
1. **Security and compliance**: Keep an eye on security-related events, such as failed login attempts, changes to security roles, and data access patterns. This helps maintain compliance with organizational policies and regulatory requirements. Learn more about [detecting threats to your organization](threat-detection.md).
1. **Licensing and capacity**: Monitor license usage and capacity limits to ensure that the organization is not exceeding its allocated resources and to plan for future needs. Learn more about [monitoring license and capacity usage](cds-usage.md).

## Solution-lvel monitoring

At the solution level, monitoring focuses on the performance and reliability of individual applications and components. Key areas to monitor include:

1. **Solution performance**: Track key performance indicators (KPIs) such as response times, load times, and error rates. This helps identify performance bottlenecks and optimize the user experience. Use the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center to understand production health and detect degradations. Follow [recommendations for Performance Efficiency](/power-platform/well-architected/performance-efficiency/checklist) from Power Platform Well-Architected to design workloads so they can grow and meet your workload usage demands.
1. **Error logs and diagnostics**: Monitor error logs and diagnostic data to quickly identify and resolve issues within applications. This includes tracking exceptions, failed operations, and other error conditions. Use the [Logs page](/power-platform/admin/monitoring/logs) in the Power Platform admin center to aid operational health analysis.
1. **Usage patterns**: Analyze how users are interacting with specific applications, including feature usage, session durations, and user feedback. This helps prioritize enhancements and identify areas for improvement. Use the [integratation with Application Insights](https://learn.microsoft.com/en-us/power-platform/admin/overview-integration-application-insights) to get granular logs and custom metrics for deep analysis. For agents, use [analytics in Copilot Studio](/microsoft-copilot-studio/analytics-overview) to understand how well your agent is performing and to identify areas for improvement.
1. **Integration points**: Monitor the performance and reliability of integrations with other systems and services. This includes tracking API calls, data transfers, and the status of connected services. Use the [integratation with Application Insights](https://learn.microsoft.com/en-us/power-platform/admin/overview-integration-application-insights) to get granular logs and custom metrics for deep analysis
1. **Security and access controls**: Monitor access controls and permissions within applications to ensure users have the appropriate level of access to the functionality and data.

Learn more about [recommendations for designing and creating a monitoring system](/power-platform/well-architected/operational-excellence/observability)

## Tools

To achieve effective observability and insights, you should leverage the following tools:

1. **Power Platform admin center**: Use the Power Platform Admin Center to monitor tenant- and environment-level [analytics](power-platform/admin/tenant-level-analytics). Use the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center to understand solution health and detect degradations. Use the [Security page](/power-platform/admin/security/security-overview) to assess and monitor your security score and understand how to improve your security policies. Use [Power Platform Advisor](/power-platform/admin/power-platform-advisor) to monitor recommendations to optimize your tenant.

1. **Application Insights**: Integrate Application Insights with Power Platform solutions to track detailed, granular logs and custom metrics for deep analysis, which facilitates a comprehensive understanding of application performance. [Learn more about Integration with Application Insights](/power-platform/admin/overview-integration-application-insights).

1. **Custom dashboards**: Create custom dashboards to visualize key metrics and trends, providing a centralized view of the adoption and usage patterns of your Power Platform environments. Use the [CoE Starter Kit](/power-platform/guidance/coe/starter-kit) as a starting point.

1. **Automated alerts**: Set up automated alerts to notify administrators of critical events, such as performance degradation, security breaches, or capacity issues. Use the [integration with Application insights](/power-platform/admin/overview-integration-application-insights), [configure threat detection rules](/azure/sentinel/threat-detection), and [evaluate CoE Starter Kit features](/power-platform/guidance/coe/starter-kit).

1. **Regular reviews**: Conduct regular reviews of monitoring data to identify trends, assess the effectiveness of governance policies, and make data-driven decisions for continuous improvement.
