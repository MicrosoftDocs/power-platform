---
title: Gain insights into Power Platform adoption
description: Gain actionable insights into Power Platform adoption to optimize usage, enhance security, and drive user engagement with targeted strategies.
#customer intent: As a Power Platform user, I want to monitor adoption trends so that I can optimize platform usage and drive user engagement.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/14/2025
---

# Gain insights into Power Platform adoption

One of the key principles of administering Microsoft Power Platform is having full visibility into how your organization is using the platform. Insights into your adoption help you govern and secure the platform, identify patterns, and nurture your makers to accelerate adoption. Only with the right insights can you make informed decisions to optimize the platform's usage. 

As your organization adopts Power Platform, having full visibility and gaining actionable insights becomes even more critical. These insights enable you to focus your resources on what matters most, ensuring that your Power Platform environment remains efficient, secure, and aligned with your business goals.

## Why insights matter

Insights into Power Platform usage and adoption are essential for several reasons:

- **Proactive issue resolution:** With comprehensive visibility, administrators can detect and address issues before they escalate, minimizing downtime and disruptions.
- **Resource optimization:** Understanding how resources are being used helps optimize their allocation and ensure that critical areas receive the attention  needed.
- **User adoption and engagement:** Monitoring user activity and adoption rates provides valuable insights into how the platform is being used, enabling targeted training and support initiatives.
- **Security and compliance:** Understanding data access and usage patterns is essential for maintaining security and compliance with industry regulations.

As your Power Platform adoption grows, actionable insights become even more important. These insights help you prioritize actions and allocate resources effectively. Some key insights that an admin might focus on include:

- **Usage trends:** Identifying which apps and features are most frequently used can guide development and support efforts.
- **Performance metrics:** Monitoring app performance and identifying bottlenecks ensures a smooth user experience.
- **Security alerts:** Tracking security incidents and vulnerabilities helps maintain a secure environment.
- **Governance:** Ensuring compliance with governance policies maintains control and accountability. 
- **Capacity management:** Understanding storage and license usage helps plan for future growth and avoid performance issues.

This article explores key aspects of monitoring usage and adoption, governance and security, platform health, and capacity. It aims to provide actionable recommendations for each area.

## Usage and adoption

Understanding how users interact with the Power Platform is important for driving adoption and optimizing usage.

- **Track the number of active users**: Track the number of users actively using the platform on a daily, weekly, and monthly basis. Identify trends in user activity to understand peak usage times and periods of inactivity.
- **Monitor usage patterns and frequency**: Analyze how users and makers are interacting with the platform, including which features and tools are most frequently used. Identify any underutilized features that might require more training or promotion.
- **Identify and address any barriers to adoption**: Collect feedback from users through surveys, focus groups, and direct communication. Use this feedback to identify pain points, areas for improvement, and opportunities for new features.

Learn more about [tracking resource usage](resource-usage.md).

## Governance, security, and compliance

Effective governance ensures that the Power Platform is used responsibly and aligns with organizational policies.

- Ensure adherence to organizational policies and governance frameworks. Establish clear policies for using Power Platform, including data handling, user access, and acceptable use. Regularly review and update policies to reflect changes in technology and business needs.
- Monitor access controls and permissions. Define roles and permissions to ensure users have appropriate access based on their responsibilities. Implement least privilege access to minimize security risks. Regularly review high-impact accounts and remove privileges if they're no longer needed.
- Track security incidents. Implement security monitoring tools to detect and respond to threats.
- Ensure the platform complies with relevant regulations such as GDPR, HIPAA, and CCPA. Conduct regular audits to verify compliance and address any gaps.

Learn more about [managing Power Platform at scale](govern-at-scale.md).

## Platform and solution health

Monitor and maintain the health of solutions to guarantee uninterrupted service and user satisfaction.

- Check the [Service health dashboard](/power-platform/admin/check-online-service-health) to view the status of the Power Platform service, details about existing service incidents, and up to 30 days’ worth of history.
- Monitor experiences using the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center. This feature gives admins and makers built-in metrics and recommendations to help them understand and improve production health. The Monitor page also highlights resources with degraded operational health and identifies opportunities for improvement.  
- View event logs and error logs. All metrics that are part of the monitoring experience are aggregated from runtime event logs and error logs associated with a metric. Access them on the [Logs page](/power-platform/admin/monitoring/logs) in the Power Platform admin center. Logs are available to aid operational health analysis and can be downloaded for offline review.
- Implement Azure Application Insights integration. This feature provides detailed logs and custom metrics for deep analysis, helping you gain a comprehensive understanding of application performance. Learn more in [Overview of integration with Application Insights](/power-platform/admin/overview-integration-application-insights).
- Establish a robust incident management process to handle outages and disruptions efficiently. Learn more in [Recommendations for designing a reliable monitoring and alerting strategy](/power-platform/well-architected/reliability/monitoring-alerting-strategy).

## Performance

Ensuring optimal performance of apps and workflows is critical for user experience and productivity.

- Follow [recommendations for Performance Efficiency](/power-platform/well-architected/performance-efficiency/checklist) in Power Platform Well-Architected to design workloads so they grow and meet your workload usage demands.
- Monitor experiences using the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center. 
- Implement [Application Insights integration](/power-platform/admin/overview-integration-application-insights).

## Capacity and licenses

Monitor capacity and license usage to ensure optimal resource allocation, prevent unexpected costs, and maintain compliance with licensing agreements. This approach supports efficient and sustainable Power Platform adoption.

- [License consumption](/power-platform/admin/view-license-consumption-issues). Track the number of licenses issued versus the number of active users. Monitor the types of licenses in use and ensure they align with user roles and needs. Review [Intelligent recommendations about licensing](/power-platform/admin/get-recommendations-licensing), which provides recommendations about the roles in your organization that would benefit from having a Power Apps premium license.
- [Capacity usage](/power-platform/admin/capacity-storage#capacity-page-details). Monitor storage capacity for databases, files, and logs. Track API request limits and usage to avoid exceeding thresholds.
- [Environment capacity](/power-platform/admin/whats-new-storage#what-happens-when-my-organization-exceeds-storage-entitlements). Monitor the number of environments created and their usage. Ensure environments are being used efficiently and decommission any that are no longer needed.
- Cost optimization. Regularly review and optimize costs by identifying and eliminating unnecessary expenses. Consider using cost management tools to track and manage expenses.

## Tenant-level monitoring

At the tenant level, monitoring focuses on the overall health and usage of the platform. Key areas to monitor include:

- **Resource usage and maker activity**: Monitor user logins, app usage, and API calls to understand how users are interacting with the platform. This analysis helps identify trends, detect unusual activity, and ensure efficient use of resources. Learn more about [tracking resource usage](resource-usage.md).
- **Resource health and performance**: Monitor resource health and performance to maintain the reliability and efficiency of your solutions. Understand the production health and detect any degradations early. Proactively monitoring health metrics minimizes downtime and enables you to identify areas for improvement. Learn about [tracking resource health and performance](#platform-and-solution-health).
- **Security and compliance**: Monitor security-related events, such as failed sign-in attempts, changes to security roles, and data access patterns. This practice helps maintain compliance with organizational policies and regulatory requirements. Learn more about [detecting threats to your organization](threat-detection.md).
- **Licensing and capacity**: Monitor license usage and capacity limits to ensure that the organization doesn't exceed its allocated resources and can plan for future needs. Learn more about [monitoring licenses and capacity](cds-usage.md).

## Solution-level monitoring

At the solution level, monitoring focuses on the performance and reliability of individual applications and components. Key areas to monitor include:

- **Solution performance**: Track key performance indicators (KPIs) such as response times, load times, and error rates. This analysis helps identify performance bottlenecks and optimizes the user experience. Use the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center to understand production health and to detect degradations. Follow [recommendations for Performance Efficiency](/power-platform/well-architected/performance-efficiency/checklist) in Power Platform Well-Architected to design workloads so they grow and meet your workload usage demands.
- **Error logs and diagnostics**: Monitor error logs and diagnostic data to quickly identify and resolve issues in applications. Include tracking exceptions, failed operations, and other error conditions. Use the [Logs page](/power-platform/admin/monitoring/logs) in the Power Platform admin center to aid operational health analysis.
- **Usage patterns**: Analyze how users are interacting with specific applications, including feature usage and session durations, and collect user feedback. This data helps prioritize enhancements and identify areas for improvement. Use the [integration with Application Insights](/power-platform/admin/overview-integration-application-insights) to obtain granular logs and custom metrics for deep analysis. For agents, use [analytics in Copilot Studio](/microsoft-copilot-studio/analytics-overview) to understand agent performance and identify areas for improvement.
- **Integration points**: Monitor the performance and reliability of integrations with other systems and services. Include tracking API calls, data transfers, and the status of connected services. Use the [integration with Application Insights](/power-platform/admin/overview-integration-application-insights) to obtain granular logs and custom metrics for deep analysis.
- **Security and access controls**: Monitor access controls and permissions in applications to ensure users have the appropriate level of access to functionality and data.

Learn more about [recommendations for designing and creating a monitoring system](/power-platform/well-architected/operational-excellence/observability).

## Tools

To achieve effective observability and insights, use the following tools:

- **Power Platform admin center**: 
    - Use the Power Platform admin center to monitor tenant and environment-level [analytics](/power-platform/admin/tenant-level-analytics). 
    - Use the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center to understand solution health and detect degradations.
    - Use the [Security page](/power-platform/admin/security/security-overview) to assess and monitor your security score and understand how to improve your security policies.
    - Use the [Actions page](/power-platform/admin/power-platform-advisor) to monitor recommendations to optimize your tenant.
    - Use [Dataverse analytics](/power-platform/admin/analytics-common-data-service) to monitor activities performed on the Dataverse database. Ensure the platform's health by regularly checking system jobs, plug-ins used by app makers, and API calls against Dataverse.

- **Activity logging**: [Power Apps](/power-platform/admin/logging-powerapps), [Power Automate](/power-platform/admin/logging-power-automate), [Power Pages](/power-platform/admin/logging-power-pages), [Power Platform connector](/power-platform/admin/connector-events-power-platform), [Data Loss Prevention](/power-platform/admin/dlp-activity-logging), and [Power Platform administrative](/power-platform/admin/admin-activity-logging) actions are available in the [Microsoft Purview portal](/purview/purview). Activity logging lets you track when apps or flows are created, edited, or deleted along with other key activities. These logs can be used manually for discovery and review and can also be accessed via APIs to automate more complex scenarios. If your organization uses a Security Information and Event Management (SIEM) server, learn how to [enable integration with activity logging](/microsoft-365/security/office-365-security/siem-server-integration). You might also find [Microsoft Purview Compliance Manager](https://aka.ms/compliancemanager) helpful to manage your compliance efforts across Microsoft cloud services. As an administrator, you should:  
    - Consider audit data in Microsoft Purview along with other monitoring mechanisms. Create new alert policies to help ensure the overall health of your citizen app development platform.
    - Further explore Power Automate capabilities to help you automate extra steps to ensure Microsoft Power Platform service health.

- **Dataverse audit logging**: Audit logging available for actions in Dataverse includes create, update, and delete operations on records in addition to changes to Dataverse metadata. Learn more in [Dataverse auditing overview](/powerapps/developer/common-data-service/auditing-overview). As an administrator, you should:
    - Use audit logging to track down complex business logic problems that are a result of too many updates or conflicting updates.
    - Frequently review the logging data to help troubleshoot logic problems. Enabling some level of audit logging in advance helps expedite problem solving.
    - Regularly review your audit log size and delete audit records.

- **Application Insights**: Integrate Azure Application Insights to get detailed logs and custom metrics to help you analyze and understand application performance. Learn more about [integration with Application Insights](/power-platform/admin/overview-integration-application-insights).

- **Custom dashboards**: Create custom dashboards to visualize key metrics and trends and obtain a centralized view of the adoption and usage patterns of your Power Platform environments. Use the [Power Platform Center of Excellence (CoE) Starter Kit](/power-platform/guidance/coe/starter-kit) as a starting point.

- **Automated alerts**: Set up automated alerts to notify administrators of critical events, such as performance degradation, security breaches, or capacity issues. Make effective use of [integration with Application insights](/power-platform/admin/overview-integration-application-insights), [threat detection rules](/azure/sentinel/threat-detection), and [CoE Starter Kit features](/power-platform/guidance/coe/starter-kit).

Regularly review monitoring data to identify trends, assess governance policies, and make data-driven decisions for continuous improvement.
