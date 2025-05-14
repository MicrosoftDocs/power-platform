---
title: Implement reactive governance controls
description: Learn how to optimize Power Platform security and performance with reactive governance by addressing issues in real time and by improving tenant hygiene.
#customer intent: As a Power Platform admin, I want to address business continuity risks so that I can ensure uninterrupted operations.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/14/2025
---

# Implement reactive governance controls

Reactive governance refers to the approach of managing and addressing actions and issues as they arise, based on real-time data and insights. Instead of relying solely on predefined policies and procedures, reactive governance involves continuously monitoring the environment, identifying potential problems, and taking corrective actions promptly.

Reactive governance focuses on responding to recommendations and optimizing performance based on real-time data and insights. ​Intelligent recommendations and real-time notifications help admins stay informed about key issues that require attention to mitigate risk related to proliferation.

## Processes and tasks for reactive governance

- **Business continuity risks:**
    - **Ownerless resources**: Resources owned by individuals who leave the organization create business continuity risks.
    - **High-value resources in the default environment**: Resources in the default environment might not follow application lifecycle management (ALM) best practices, posing a business continuity risk. 
    - **Use [Power Platform Advisor](../../admin/power-platform-advisor.md)** to identify and take action on resources that pose business continuity risks.

- **Tenant hygiene:**
    - **Overshared resources**: Overshared resources can lead to security vulnerabilities and inefficiencies. 
    - **Inactive resources**: Resources not used with a specified time frame require review and potential deletion to free resources and maintain a clean environment. 
    - **Use [Power Platform Advisor](../../admin/power-platform-advisor.md)** to identify and take action on resources that pose business continuity risks.

- **Licenses:**
    - **Pending license requests**: Manage pending license requests promptly to ensure users have the necessary access to perform their tasks efficiently. Use [Power Platform Advisor](../../admin/power-platform-advisor.md) to identify and take action on resources that pose business continuity risks. 
    - **Intelligent licensing recommendations**: Review [recommendations](../../admin/get-recommendations-licensing.md) about who in your organization would benefit from having a Power Apps premium license.

- **Change requests and approvals:**
    - **Requests for new environments**: Implement an approval workflow for new environment requests to ensure they align with organizational needs and governance policies. 
    - **Changes to DLP policies**: Data loss prevention (DLP) policies protect sensitive data. Any changes to these policies should go through a formal approval process to maintain security and compliance.
    - **Review [environment and DLP request components](../coe/env-mgmt.md) in the CoE Starter Kit** to automate these processes. 

- **Changes to user management**: Managing user roles and permissions is vital for security. Implement workflows to approve changes in user management, ensuring they comply with governance standards.

- **Changes to governance settings**: Review and approve any changes to governance settings to ensure they align with the overall governance framework and organizational objectives.

## Tools for reactive governance 

**[Power Platform Advisor](../../admin/power-platform-advisor.md)** provides insights and recommendations to optimize Power Platform usage and performance. By regularly reviewing Power Advisor's suggestions, organizations can identify best practices, performance improvements, and security enhancements. These recommendations help in addressing issues proactively and refining governance practices to ensure the platform operates efficiently and securely.

The **[CoE Starter Kit](../coe/starter-kit.md)** is a comprehensive set of tools and templates designed to help organizations establish and maintain a Center of Excellence for Power Platform. It includes components for monitoring, reporting, and managing environments, apps, and flows. The CoE Starter Kit implements sample reactive governance processes that you can learn from and amend to your own requirements.

Organizations can use **[APIs and connectors](../../admin/programmability-extensibility-overview.md)** to create custom reactive governance processes tailored to their specific needs. By integrating these tools, organizations can automate responses to governance issues, streamline workflows, and enhance efficiency.

## Use monitoring for effective governance

Effective monitoring is essential for reactive governance. Monitor platform usage and compliance to identify issues that need resolution or actions to take. 

Learn more: [Gain insights into Power Platform adoption](observability.md)
