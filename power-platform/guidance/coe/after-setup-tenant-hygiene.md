---
title: "Establishing tenant hygiene with the CoE Starter Kit | Microsoft Docs"
description: "The CoE Starter Kit contains many useful components to help you establish tenant hygiene."
author: stjeffer
ms.topic: conceptual
ms.date: 06/13/2024
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Establishing tenant hygiene with the CoE Starter Kit

The natural expansion of Microsoft Power Platform can sometimes conflict with an organization's established strategies, such as their environment strategy. This challenge can make it difficult for Center of Excellence (CoE) teams to fully understand the purpose and usage of the various apps, environments, cloud flows, and bots.

To address this challenge, this article offers best practices for administration and governance. There are examples of tooling available in the CoE Starter Kit and out-of-the-box capabilities to help CoE teams effectively manage and optimize their Power Platform solutions.

## Managing existing environments

As you gain visibility into your tenant's Power Platform environments, you might discover environments that were previously unknown to you. Having a well-defined environment strategy is crucial for sustained and governed adoption of Power Platform. Communicating this strategy clearly to your organization is even more important in ensuring that makers are developing solutions in the appropriate environment.

The CoE Starter Kit's Power BI dashboard includes an **Environment Overview** page, which helps you understand which environments exist in your tenant, who created them, and how many apps and flows are created in each environment. This information helps you clean up empty environments or ones no longer required. You can work with environment creators on establishing a suitable environment strategy for their team.

:::image type="content" source="media/pb-5.png" alt-text="Environments overview." lightbox="media/pb-5.png":::

The CoE Starter Kit's governance component includes **Developer Compliance Center**. This component establishes control over environments by requiring environment owners to provide a business justification for maintaining their environment. This control helps ensure all environments in your tenant are aligned with your organization's overall strategy and goals. The control increases visibility on the use of an environment.

:::image type="content" source="media/dev-environments.png" alt-text="Screenshot showing the Developer Compliance Center - Environment details." lightbox="media/dev-environments.png":::

For more information, see:

- [Defining an environment strategy](/power-platform/guidance/white-papers/environment-strategy)
- [Communicating Power Platform governance](/power-platform/guidance/white-papers/environment-strategy#communicate-your-environment-strategy-to-your-organization)
- [CoE Starter Kit - Developer Compliance Center](/power-platform/guidance/coe/governance-components#developer-compliance-center)
- [CoE Starter Kit - Power BI dashboard](/power-platform/guidance/coe/power-bi-monitor#environments)
- [CoE Starter Kit - Compliance and adoption dashboard](/power-platform/guidance/coe/power-bi-compliance)

## Managing new environment creation and environment requests

One of the key best practices for managing Power Platform environments is to implement controls and processes that restrict who can create new environments. The CoE Starter Kit includes a reference example for an environment and DLP request management process to effectively manage future environment and DLP requests. By understanding and utilizing this solution, your CoE team is well-positioned to manage and govern the environments in your tenant.

> [!NOTE]
> Regularly check for new Power Platform connectors added to your tenant to ensure they align with your organization's DLP and governance policies.

For more information, see:

- [Environment strategy best practices](/microsoft-365/community/defining-a-power-platform-environment-strategy#recommendations--best-practices)
- [Environment creation security guide](/power-platform/admin/create-environment#who-can-create-environments)
- [Power Automate cloud flow template - check for new connectors](https://powerautomate.microsoft.com/en-US/templates/details/0b2ffb0174724ad6b4681728c0f53062/get-a-list-of-new-apps-flows-and-connectors/)
- [CoE Starter Kit - Environment and DLP Request process(Video)](https://youtu.be/16mspbGz1zA)
- [CoE Starter Kit - Setup environment request components](setup-environment-components.md)
- [CoE Starter Kit - How to use the Environment and DLP Request process](env-mgmt.md)

## Managing the default environment

Every tenant in Power Platform has a [default environment](/power-platform/admin/environments-overview#the-default-environment), containing organic growth of apps and cloud flows. The default environment can't be deleted, but it can be renamed to better reflect its intended purpose.

One of the first steps in managing the default environment is identifying the business value, the risk of existing apps and flows, and unused apps and flows. The app and flow insights help you decide if solutions should be moved to production environments or have higher levels of support.

> [!TIP]
> onsider quarantining apps that aren't compliant and creating a process to clean up orphaned resources, such as apps and flows without an owner.

The **Default environment** page in the CoE Starter Kit's **Compliance and adoption dashboard** gives you valuable insights on the adoption in your default environment. For example, you can identify top connectors, the top most launched apps, and top makers.

:::image type="content" source="media/pbi-compliance3.png" alt-text="Screenshot that shows the default environment tech debt insights." lightbox="media/pbi-compliance3.png":::

The **Compliance** page in the CoE Starter Kit's **Compliance and adoption dashboard** can help you identify apps and flows with no owners, noncompliant apps, and suspended flows. This dashboard enables you to create an action plan to bring apps and flows back into compliance.

:::image type="content" source="media/pbi-compliance1.png" alt-text="Screenshot that shows the Power Platform Compliance and Governance overview dashboard." lightbox="media/pbi-compliance1.png":::

For more information, see:

- [Rename the default environment](/power-platform/admin/edit-properties-environment)
- [Secure the default environment](/power-platform/guidance/adoption/secure-default-environment)
- [CoE Starter Kit - Identify unused apps and cloud flows](governance-components.md#app-and-flow-inactivity-notifications-clean-up-view)
- [CoE Starter Kit - Quarantined noncompliant apps](governance-components.md#app-quarantine-process)
- [CoE Starter Kit - Clean up orphaned resources](governance-components.md#cleanup-for-orphaned-resources)
- [CoE Starter Kit - Compliance and Adoption dashboard](power-bi-compliance.md)

## Managing Dataverse for Teams environments

Dataverse for Teams is a powerful low-code data platform that enables the creation of custom apps and bots directly within Microsoft Teams.

Dataverse for Teams automatically provisions new environments for each team within an organization, once an app or bot is created or installed from the app catalog. This provisioning allows teams to easily access and manage their own data, while providing a level of isolation and security to protect data from other teams.

Power Platform includes a built-in mechanism for automatically cleaning up Dataverse for Teams environments that are inactive for 90 days. Beyond the automatic clean-up, you can keep track of existing environments and their purpose, data types, connectors, and other information associated with each environment.

The **Microsoft Teams environments** page in the CoE Starter Kits dashboard provides you with an overview of your existing Teams environments, apps and flows in those environments, and the last launched date of apps.

:::image type="content" source="media/pb-6.png" alt-text="Screenshot of a Microsoft Teams Environments overview." lightbox="media/pb-6.png":::

The **Governance components** of the CoE Starter Kit help you capture business justifications for Dataverse for Teams environments. By checking for new Dataverse for Teams environments daily, organizations can ensure they're aware of all environments in use. The environments can then be reviewed to check if they align with the organization's compliance and governance policies.

:::image type="content" source="media/dev-environments.png" alt-text="Screenshot of the Developer Compliance Center - Environment details." lightbox="media/dev-environments.png":::

For more information, see:

- [Automatically remove inactive Dataverse for Teams environments](/power-platform/admin/inactive-teams-environment)
- [CoE Starter Kit - Manage Dataverse for Teams environments](teams-governance.md)

## Securing your environments

With over 900 connectors available to your organization, it's critical to establish a Data Loss Prevention (DLP) strategy to control connector availability. However, you might be unaware of the impact that changing a DLP policy has on your existing apps and flows.

The **DLP editor (impact analysis) tool** is available for use *before* making changes to existing policies or creating new DLP policies. This tool reveals the impact of changes on existing apps and cloud flows and helps you make informed decisions.

:::image type="content" source="media/dlp_new1.png" alt-text="Screenshot of the DLP Editor." lightbox="media/dlp_new1.png":::

Once your DLP strategy is in place, use the **DLP request management process** in the CoE Starter Kit for makers to request and evaluate available DLP policies.

:::image type="content" source="media/env-mgmt-process.png" alt-text="Screenshot of the environment and DLP request management process." lightbox="media/env-mgmt-process.png":::

For more information, see:

- [Establishing a DLP strategy](/power-platform/guidance/adoption/dlp-strategy)
- [CoE Starter Kit - DLP editor impact analysis](core-components.md)
- [Configure user security to resources in an environment](/power-platform/admin/database-security)
- [Security in Microsoft Power Platform](/power-platform/admin/security/overview)
- [Security and governance considerations](/power-platform/admin/governance-considerations)

## Managing apps and cloud flows

There are common scenarios to consider for managing apps and cloud flows in your organization.

### Managing existing apps and cloud flows

#### Usage

Identifying the apps and cloud flows that are heavily used within your organization is crucial in order to ensure that they are in compliance with your organizational policies.

The Power BI dashboard in the CoE Starter Kit offers a comprehensive view of the most used apps and flows in your organization, providing valuable information that can help you make informed decisions.

The dashboard can provide a quick overview of the most popular apps, the number of users, usage patterns, and any other relevant information.

##### CoE Starter Kit - Power BI dashboard

The Power BI dashboard in the CoE Starter Kit provides visual representations of usage patterns, the number of users, and other data to help you identify compliance issues and ensure your apps and cloud flows are used effectively.

These visualizations help you understand how your organization is using the Power Platform as you identify areas that need attention. By providing clear and actionable insights, the dashboard can help you ensure that your Power Platform solutions are secure, compliant, and aligned with your organizational policies.

##### CoE Starter Kit - inactivity notifications

The inactivity notification process in the CoE Starter Kit automatically detects inactive apps, including their inactive duration. The kit sends notifications to the app owner, asking them to confirm if the app is still needed or can be safely deleted. This process helps organizations manage their Power Platform apps more efficiently by identifying and removing unused or redundant apps. The CoE team can configure the inactivity threshold.

For more information, see:

- [Inactivity notifications (video)](https://youtu.be/PZ5u_2E9uUI)
- [Set up inactivity notifications](setup-archive-components.md)

#### Compliance

Evaluating the risk exposure of apps and cloud flows is an important step in managing the Power Platform effectively. By identifying high-risk apps, your CoE team can define processes for mitigating the risks. For example, you can migrate high-risk apps or provide more support for high-value apps.

Since most organizations have hundreds, if not thousands, of apps and cloud flows, manually reaching out to owners to establish risk isn't a scalable option. The CoE Starter Kit can assist your CoE team to automate the capturing of compliance information to identify high-risk apps, saving your team time and resources.

The **Admin compliance detail request** is a powerful cloud flow that can help your CoE team establish compliance with organizational policies by iterating over the inventory of apps and bots.

 This flow allows your team to set compliance thresholds and automatically checks apps and bots against these thresholds. If an app or bot is found to be noncompliant, the flow prompts the owner to submit a business justification and additional information about the application.

Your CoE team can quickly and efficiently identify and address compliance issues while providing a clear and transparent process for app and bot owners.

:::image type="content" source="media/coe55.png" alt-text="Screenshot of compliance email sent to an app owner." lightbox="media/coe55.png":::

For more information, see:

- [App and flow compliance detail request](governance-components.md#admin-compliance-detail-request-v3)
- [How the CoE Starter Kit's compliance process works (video)](https://youtu.be/WXXFjHLt5ss)
- [Power Platform Support Strategy](../adoption/support-strategy.md)

### Managing future apps and cloud flows

Implementing the CoE Starter Kit's inactivity notification and compliance processes is an essential step in effectively managing compliance for your Power Platform solutions.

To get maximum value from these tools and ensure compliance, consider these actions:

1. Exclude development and production environments from compliance and inactivity notifications.
1. Quarantine apps that aren't compliant.

For more information, see:

- [Exclude environments from the compliance processes](/power-platform/guidance/adoption/onboard-makers)
- [Exclude environments from inactivity notifications](setup-archive-components.md#exempt-environments-from-the-inactivity-notifications-process)
- [Quarantine noncompliant apps](governance-components.md#admin--quarantine-non-compliant-apps)

### Managing apps and cloud flows when the owner leaves the organization

When an employee owns an app or flow within Power Platform and leaves the organization, they might leave built components behind, known as orphaned resources. These resources can pose a security risk if they're not properly managed or maintained. To address this issue, the CoE Starter Kit includes a process to identify and clean up orphaned resources.

This clean-up process is designed to run daily checks for any resources owned by former employees. The checks ensure the resources are either reassigned to a new owner or removed from the tenant if they're no longer needed. This component can help keep your Power Platform solutions secure and compliant, even when employee turnover occurs.

:::image type="content" source="media/orphanedobjects2.png" alt-text="Screenshot of the orphaned resources adaptive card sent to a line manager." lightbox="media/orphanedobjects2.png":::

For more information, see:

- [Managing apps and cloud flows when the owner leaves the organization (video)](https://youtu.be/0zptiBppTNo)
- [CoE Starter Kit - Cleanup for orphaned resources process](governance-components.md#cleanup-for-orphaned-resources)

## Highly used apps

Highly used apps in your organization often have a compelling story behind their success. Stories might share how the apps were created, challenges they overcame, and value they provide to the business. Discovering and sharing these stories can be a great way to drive further adoption and provide confidence to other makers in your organization.

The CoE Starter Kit's **Power BI dashboard** can help you identify highly used apps and your most active makers. These makers can help you create powerful success stories or start an internal community program. These makers can be great decision makers as you refine your Power Platform strategy.

:::image type="content" source="media/pb-10.png" alt-text="Screnshot showing the Power Automate Cloud Flows dashboard with app and maker statistics." lightbox="media/pb-10.png":::

### Collaborate and share knowledge

The [Power Platform Community Site Template](../adoption/wiki-community.md#get-started-with-the-power-platform-communication-site-template) provides useful templates for promoting success stories, events, hackathons, and other relevant information. This powerful tool can encourage collaboration and knowledge sharing within your organization. The tool can also help enable the adoption of best practices and standards for Power Platform development.

## Active makers

Identifying the most active makers in your organization can provide valuable insights and resources for your organization's Power Platform community. These makers are likely to be highly engaged and knowledgeable about the platform and can be valuable allies in helping to drive adoption and improve the quality of your organization's solutions.

You can engage the active makers in your organization:

- **Hackathons and training delivery**: Active makers can participate in hackathons, training sessions, and other community events to share their knowledge and experiences.
- **CoE Advisors**: Active makers can join your CoE as advisors, providing input and guidance on future policies, events, and other initiatives.
- **Promoting Success stories**: Active makers can share their success stories and experiences to help drive adoption and inspire others in the organization.
- **Opt-in for skills match**: The skills match feature is designed to help makers build a community of makers. Active makers can connect with the organization and community to support their onboarding and upskilling.

By identifying and applying the expertise and enthusiasm of your organization's most active makers, you can build a more engaged and effective Power Platform community.

For more information, see:

- [Skills match overview](/power-platform-release-plan/2022wave2/power-apps/skills-match-power-apps-makers)
- [Power Platform Adoption workbook](https://aka.ms/powerplatformadoptionworkbook)
- [Power Platform Hackathon workbook](https://aka.ms/powerplatformhackathonworkbook)
- [Power Platform Adoption guidance](https://adoption.microsoft.com/powerplatform/)

## Communicating governance to your makers

Communicating governance to your makers is an important aspect of managing Power Platform effectively. Governance policies and guidelines help ensure that solutions are secure, compliant, and aligned with organizational goals. However, if makers don't understand or are unaware of these policies, they can't create solutions that meet organizational goals.

Strategies for effectively communicating governance to your makers:

- **Clearly communicate the purpose and benefits of governance policies:**
  
  Explain how governance policies protect organizational data and ensure compliance with regulations.
- **Make governance policies and guidelines easily accessible:**

  Place the policies and guidelines in a central location, such as the Power Platform community site template that's easily accessible to all makers.
- **Provide training and support:**

  Offer training sessions and resources to help makers understand and comply with governance policies.
- **Encourage open communication:**

  Create a culture of open communication where makers can ask questions and raise concerns about governance policies.
- **Incorporate governance into the development process:**

  For example, you can require a compliance review before deploying a solution.

For more information, see:

- [Power Platform community site template](/power-platform/guidance/adoption/wiki-community)
- [Set up the Power Platform community site template](/power-platform/guidance/adoption/wiki-community#get-started-with-the-power-platform-communication-site-template)
- [Welcome new makers to the platform](/power-platform/guidance/adoption/onboard-makers)

## Administration of the platform

The Power Platform Administration planning tool is a comprehensive resource that provides guidance and best practices for Power Platform administration.  

This tool helps organizations of all sizes and levels of experience optimize their administrative efforts and improve an organization's existing support.

The planning tool can optimize environments, security, data loss prevention, monitoring and reporting. You can be more effective in creating a solid foundation of administration and governance for Power Platform within your organization.

:::image type="content" source="media/PPAP-TaskBreakdownProactiveAndReactiveBalance.png" alt-text="Screenshot showing the Task breakdown - proactive & reactive balance section of the dashboard." lightbox="media/PPAP-TaskBreakdownProactiveAndReactiveBalance.png":::

For more information, see:

- [Learn about the administration planning tool](https://www.youtube.com/watch?v=q6738IKJW1Q)
- [Set up the administration planning tool](setup-admin-tasks-component.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
