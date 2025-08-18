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
ms.date: 08/18/2025
---

# Implement reactive governance controls

Reactive governance refers to the approach of managing and addressing actions and issues as they arise, based on real-time data and insights. Instead of relying solely on predefined policies and procedures, reactive governance involves continuously monitoring the environment, identifying potential problems, and taking corrective actions promptly.

Reactive governance focuses on responding to recommendations and optimizing performance based on real-time data and insights. ​Intelligent recommendations and real-time notifications help admins stay informed about key issues that require attention to mitigate risk related to proliferation.

## Processes and tasks for reactive governance

- **Business continuity risks:**
    - **Ownerless resources**: Resources owned by individuals who leave the organization create business continuity risks.
    - **High-value resources in the default environment**: Resources in the default environment might not follow application lifecycle management (ALM) best practices, posing a business continuity risk. 
    - **Use the [Actions page](../../admin/power-platform-advisor.md)** to identify and take action on resources that pose business continuity risks.

- **Tenant hygiene:**
    - **Overshared resources**: Overshared resources can lead to security vulnerabilities and inefficiencies. 
    - **Inactive resources**: Resources not used with a specified time frame require review and potential deletion to free resources and maintain a clean environment. 
    - **Use the [Actions page](../../admin/power-platform-advisor.md)** to identify and take action on resources that pose business continuity risks.

- **Licenses:**
    - **Pending license requests**: Manage pending license requests promptly to ensure users have the necessary access to perform their tasks efficiently. Use the [Actions page](../../admin/power-platform-advisor.md) to identify and take action on resources that pose business continuity risks. 
    - **Intelligent licensing recommendations**: Review [recommendations](../../admin/get-recommendations-licensing.md) about who in your organization would benefit from having a Power Apps premium license.

- **Change requests and approvals:**
    - **Requests for new environments**: Implement an approval workflow for new environment requests to ensure they align with organizational needs and governance policies. 
    - **Changes to DLP policies**: Data loss prevention (DLP) policies protect sensitive data. Any changes to these policies should go through a formal approval process to maintain security and compliance.
    - **Review [environment and DLP request components](../coe/env-mgmt.md) in the CoE Starter Kit** to automate these processes. 

- **Changes to user management**: Managing user roles and permissions is vital for security. Implement workflows to approve changes in user management, ensuring they comply with governance standards.

- **Changes to governance settings**: Review and approve any changes to governance settings to ensure they align with the overall governance framework and organizational objectives.

## Tools for reactive governance 

The **[Actions page](../../admin/power-platform-advisor.md)** provides insights and recommendations to optimize Power Platform usage and performance. By regularly reviewing Power Advisor's suggestions, organizations can identify best practices, performance improvements, and security enhancements. These recommendations help in addressing issues proactively and refining governance practices to ensure the platform operates efficiently and securely.

The **[CoE Starter Kit](../coe/starter-kit.md)** is a comprehensive set of tools and templates designed to help organizations establish and maintain a Center of Excellence for Power Platform. It includes components for monitoring, reporting, and managing environments, apps, and flows. The CoE Starter Kit implements sample reactive governance processes that you can learn from and amend to your own requirements.

Organizations can use **[APIs and connectors](../../admin/programmability-extensibility-overview.md)** to create custom reactive governance processes tailored to their specific needs. By integrating these tools, organizations can automate responses to governance issues, streamline workflows, and enhance efficiency.

## Use monitoring for effective governance

Effective monitoring is essential for reactive governance. Monitor platform usage and compliance to identify issues that need resolution or actions to take. 

Learn more: [Gain insights into Power Platform adoption](observability.md)

## Considerations for using Managed Environments

You should keep a few things in mind when you're considering using Managed Environments.

### Managed Environments, CoE Starter Kit, or both?

Managed Environments is a set of features that's designed to make governance of Power Platform easier by giving more control to and requiring less effort from admins. The governance processes of many organizations were influenced by the [CoE Starter Kit](/power-platform/guidance/coe/overview). Others are based on the kit's out-of-the-box features, extended to meet an organization's specific needs. Still others use the CoE Starter Kit to expand the governance features of Managed Environments.

The engineering team for Managed Environments worked closely with [Power CAT](https://aka.ms/whoispowercat), the team responsible for the CoE Starter Kit, to identify the most-used features in the kit and add them to Managed Environments. As a result, some features are available in both products. When you use Managed Environments, in-product features are managed and supported by Microsoft. You don't need to update or maintain them&mdash;they're updated automatically with Power Platform release waves. If your organization uses the CoE Starter Kit, it's important to establish and maintain an internal process to update it monthly. Follow the suggestions presented in the [CoE Starter Kit Office Hours](https://aka.ms/coeofficehours).

We recommend starting with Managed Environments. If you discover any gaps in your governance requirements, explore whether the CoE Starter Kit offers features that can address them. Learn more in [How to decide whether to use Managed Environments with the CoE Starter Kit](#how-to-decide-whether-to-use-managed-environments-with-the-coe-starter-kit).

Since the kit is community-driven, it isn't subject to the same service level agreements as our licensed products. Go to the [GitHub site](https://github.com/microsoft/coe-starter-kit/issues) to report bugs, ask questions, and request new features.

### If you plan to deactivate Managed Environments

It's important to understand what happens if your organization stops using Managed Environments. The following table describes the effects on makers and admins.

| Feature | Maker impact | Admin impact |
|:---:|:---:|:---:|
| Maker welcome | Indirect: They stop seeing the welcome message when they enter the environment. | Indirect: They can't define customized welcome messages in environments. |
| Limit sharing | Direct: They can share their apps with any security groups and users. | Indirect: They can't control how apps in the environment are being shared. |
| Usage insights| None | Direct: They, and any other recipients, stop receiving the weekly email digest. |
| Data policies | None | Indirect: DLPs are enforced, but admins can't apply multiple DLPs to the environment. |
| Pipelines in Power Platform | Direct: They can't use the pipelines to deploy their solutions. | None |
| Solution checker enforcement | Indirect: They can import any solution without a check for errors, security, and noncompliant assets. | None |
| Customer-managed key | None | Indirect: The feature is limited. |
| IP firewall | None | Indirect: The feature is limited. |
| Customer Lockbox | None | Indirect: The feature is limited. |
| Extended backup (7 to 28 days)| None | Indirect: The feature is limited. |
| Export to App Insights | None | Indirect: The feature is limited. |
| Catalog in Power Platform | None | Indirect: The feature is limited. |
| Environment routing | Direct: They will not be routed to their personal developer environments. | Indirect: They can't control where makers are routed to. |
| Environment groups | None | Direct: They can't apply policies and manage settings across multiple environments. |
| Actions page | None | Direct: They can't monitor and respond to governance issues from a single location. |
| Governance recommendations | None | Direct: They don't receive suggestions on how to improve governance practices. |
| Inventory explorer | None | Direct: They can't easily view and manage all resources within the environment. |

## Common settings for Managed Environments

If you're considering activating Managed Environments, you might find the following example settings for each type of environment useful:

- Default environment

  - **Limit sharing**: Exclude sharing with groups, limit sharing to 20 individuals
  - **Solution checker enforcement**: Block and send emails
  - **Usage insights**: On
  - **Maker welcome content**: Customized, including the link to learn more

- Developer environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Warn and don't send emails
  - **Usage insights**: Off
  - **Maker welcome content**: Customized, including the link to learn more

- Sandbox environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Warn and don't send emails
  - **Usage insights**: On
  - **Maker welcome content**: Customized, including the link to learn more

- Production environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Block and send emails
  - **Usage insights**: On
  - **Maker welcome content**: Customized, including the link to learn more

- Teams environment

  - **Limit sharing**: Don't set limits
  - **Solution checker enforcement**: Block and send emails
  - **Usage insights**: On
  - **Maker welcome content**: No content or "learn more" link

## How to decide whether to use Managed Environments with the CoE Starter Kit

The CoE Starter Kit offers a comprehensive set of features to administer, govern, and nurture Power Platform adoption. It's a product of our experimentation and innovation with an open-source, low-code model that's heavily influenced by customer feedback. Some of its features overlap features of Managed Environments, and Managed Environments features are replacing some features of the kit. The CoE Starter Kit isn't intended to duplicate features that exist in Managed Environments. It focuses on innovation and addressing unmet customer requests as we gauge feedback on what's needed next.

You can use Managed Environments alone or with the CoE Starter Kit to administer and govern your adoption of Power Platform. How do you know which option to choose?

Our recommendation is to start with the default capabilities of the Power Platform admin center and Managed Environments. They're robust and fully supported. If you discover that you need more capabilities to govern your tenant, check whether the CoE Starter Kit can complement what you get out-of-the-box in Managed Environments. Every organization needs to find the best hybrid model that suits its requirements.

### CoE Starter Kit vs Managed Environments

Some important differences between the CoE Starter Kit and Managed Environments should be part of your consideration.

The CoE Starter Kit uses publicly available APIs and actions to apply guardrails on governance. Governance processes are asynchronous and happen reactively. Let's say your organization needs to restrict sharing of apps to 20 users. The CoE can only react after the limit is exceeded, possibly resulting in noncompliant assets. On the other hand, Managed Environments uses private APIs, built into the product, that enforce sharing limits before they're passed.

Managed Environments continually evolves based on customer feedback and learnings from customers who are using the CoE Starter Kit. Some features fully or partially overlap. Conversely, the Starter Kit has features that organizations can use to do things that aren't yet possible with Managed Environments, and vice versa. We recommend that you review the [Center of Excellence (CoE) overview](../coe/overview.md).

The following comparison of some features of Managed Environments and the CoE Starter Kit should help guide your decisions.

**Managed Environments feature:** Maker welcome
**Available in CoE Starter Kit:** Partially

- In Managed Environments, admins can provide custom welcome content to greet makers on their first visit to Power Apps with information about how to get started. The CoE Starter Kit offers a welcome email that's sent to new makers only *after* they create their first app, flow, or bot.
- Managed Environments communicates with new makers directly in the maker studio. The CoE Starter Kit communicates only through email.
- Managed Environments allows admins to tailor the welcome message in each environment. The CoE Starter Kit has one welcome message across all environments.

**Managed Environments feature:** Limit sharing
**Available in CoE Starter Kit:** Not in real time (reactive)

Admins can set sharing limits in the Starter Kit, but they can't be proactively enforced. Sharing limits in the kit are used only to send compliance notifications and reminders to makers.

**Managed Environments feature:** Usage insights
**Available in CoE Starter Kit:** Yes

- Both solutions have good visualization of the inventory and usage insights.
- The CoE Starter Kit's reporting combines your diagnostics and inventory data with data about your tenant from Microsoft Entra ID, allowing you to find your most active makers by department, city, or country/region.
- The Starter Kit's reporting uses Power BI, which means that you can "slice and dice" the data based on your requirements and use Power BI row-level security to share dashboards with other admin groups. [Learn how to gain deep insights into your Power Platform adoption with the CoE Power BI dashboard](../coe/power-bi.md).

**Managed Environments feature:** Data policies
**Available in CoE Starter Kit:** Yes

The CoE Starter Kit includes a DLP impact tool that's useful in understanding the effect on an environment of activating or deactivating specific DLPs.

**Managed Environments feature:** Weekly digest
**Available in CoE Starter Kit:** Partially

- The CoE Starter Kit doesn't have a weekly digest for admins. Instead, admins get information from a Power BI dashboard.
- In Managed Environments, inactive apps and flows are highlighted in a weekly digest email. The CoE Starter Kit has an inactivity notification process, which notifies makers about their inactive resources and asks for approval to delete them.
- One of the main goals of both Managed Environments and the CoE Starter Kit is providing more insights that allow admins to take action. The CoE Starter Kit has the advantage here. It has capabilities that direct resource management to makers, making them responsible for their own resources and reducing the burden on admins.

**Managed Environments feature:** Pipelines in Power Platform
**Available in CoE Starter Kit:** Partially

Part of the CoE Starter Kit is another kit called **ALM Accelerator for Power Platform**, which has features similar to pipelines, including some extensibility for integration between both solutions.

**Managed Environments feature:** Solution checker enforcement
**Available in CoE Starter Kit:** No

Since these solutions are tightly integrated with the product, the CoE Starter Kit has no way to check them.

**Managed Environments feature:** IP firewall
**Available in CoE Starter Kit:** No

**Managed Environments feature:** Block cookie replay attacks
**Available in CoE Starter Kit:** No

**Managed Environments feature:** Customer-managed keys
**Available in CoE Starter Kit:** No

**Managed Environments feature:** Customer Lockbox
**Available in CoE Starter Kit:** No