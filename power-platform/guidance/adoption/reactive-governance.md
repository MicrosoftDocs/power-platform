---
title: Reactive governance
description: Configure identity and access management for Microsoft Power Platform to ensure secure access to resources.
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 02/28/2025
---

# Reactive governance

Reactive governance refers to the approach of managing and addressing actions and issues as they arise, based on real-time data and insights. Instead of relying solely on predefined policies and procedures, reactive governance involves continuously monitoring the environment, identifying potential problems, and taking corrective actions promptly.

Reactive governance focuses on responding to recommendations and optimizing performance based on real-time data and insights. ​

Intelligent recommendations and real time notifications helps admins stay informed of key things that require attention to mitigate risk related to proliferation.

## Processes and tasks for reactive governance

- **Business continuity risks**
    - **Ownerless resources**: Resources where the owner has left the organization pose a business continuity risk. 
    - **High-value resources in the Default environment**: Resources in the Default environment might not follow application lifecycle management (ALM) best practices, posing a business continuity risk. 
    - Use [Power Platform Advisor](/power-platform/admin/power-platform-advisor) to identify and take action on resources that pose business cotninuity risks. 
- **Tenant hygiene**:
    - **Overshared resources**: Overshared resources can lead to security vulnerabilities and inefficiencies. 
    - **Inactive resources**: Resources not used in a specified amount of time should be reviewed and potentially deleted to free up resources and maintain a clean environment. 
    - Use [Power Platform Advisor](/power-platform/admin/power-platform-advisor) to identify and take action on resources that pose business cotninuity risks. 
- **Licenses**
    - **Pending license requests**: Managing pending license requests promptly ensures users have the necessary access to perform their tasks efficiently. Use [Power Platform Advisor](/power-platform/admin/power-platform-advisor) to identify and take action on resources that pose business cotninuity risks. 
    - **Intelligent licensing recommendations**: Review [recommendations](/power-platform/admin/get-recommendations-licensing) about who in your organization would benefit from having a Power Apps premium license.
- **Change Requests and Approvals**
    - **Requests for new environments**: Implement an approval workflow for new environment requests to ensure they align with organizational needs and governance policies. 
    - **Changes to Data Loss Prevention (DLP) policies**: Data Loss Prevention (DLP) policies protect sensitive data. Any changes to these policies should go through a formal approval process to maintain security and compliance.
    - Review [environment and DLP request components](../coe/env-mgmt.md) in the CoE Starter Kit to automate these processes. 
- **Changes to user management**: Managing user roles and permissions is vital for security. Implement workflows to approve changes in user management, ensuring they comply with governance standards.
- **Changes to Governance Settings**: Any changes to governance settings should be reviewed and approved to ensure they align with the overall governance framework and organizational objectives.

## Tools for reactive governance 

**[Power Platform Advisor](/power-platform/admin/power-platform-advisor)** provides insights and recommendations to optimize Power Platform usage and performance. By regularly reviewing Power Advisor's suggestions, organizations can identify best practices, performance improvements, and security enhancements. These recommendations help in addressing issues proactively and refining governance practices to ensure the platform operates efficiently and securely.

The **[CoE Starter Kit](/power-platform/guidance/coe/starter-kit)** is a comprehensive set of tools and templates designed to help organizations establish and maintain a Center of Excellence for Power Platform. It includes components for monitoring, reporting, and managing environments, apps, and flows. The CoE Starter Kit implements sample reactive governance processes that you can learn from and amend to your own requirements.

Organizations can use **[APIs and connectors](/power-platform/admin/programmability-extensibility-overview)** to create custom reactive governance processes tailored to their specific needs. By integrating these tools, organizations can automate responses to governance issues, streamline workflows, and enhance efficiency.

## Use Monitoring for effective governance

Effective monitoring is essential for reactive governance. By implementing robust monitoring tools and processes, organizations can track usage, performance, and compliance and identify issues that need to be resolved or actions that need to be taken. 

Learn more: [Gain insights into Power Platform adoption](observability.md)
