---
title: "Establishing tenant hygiene with the CoE Starter Kit | Microsoft Docs"
description: "The CoE Starter Kit contains many useful components to help you establish tenant hygiene."
author: stjeffer
ms.topic: conceptual
ms.date: 02/08/2023
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: kvivek
search.audienceType: 
  - admin
---

# Establishing tenant hygiene with the CoE Starter Kit

The natural expansion of Microsoft Power Platform can sometimes conflict with an organization's established strategies such as their environment strategy. This can make it difficult for Center of Excellence (CoE) teams to fully understand the purpose and usage of the various apps, environments, cloud flows, and bots that are in use. To address this challenge, this article offers best practices for administration and governance, as well as examples of the tooling available in the CoE Starter Kit and out-of-the-box capabilities to help CoE teams effectively manage and optimize their Power Platform solutions.

## Managing existing environments

As you gain visibility into your tenant's Power Platform environments, you may discover environments that were previously unknown to you. Having a well-defined environment strategy is crucial for sustained and governed adoption of Power Platform. Communicating this strategy clearly to your organization is even more important in ensuring that makers are developing solutions in the appropriate environment.

The CoE Starter Kit's Power BI dashboard includes an **Environment Overview** page, which can help you understand which environments exist in your tenant, who created them, and how many apps and flows have been created in each environment. This information can help you clean up environments that are empty or no longer required, and work with environment creators on coming up with a suitable environment strategy for their team.

:::image type="content" source="media/pb-5.png" alt-text="Environments overview.":::

The CoE Starter Kit's governance component includes **Developer Compliance Center**, which can be used to establish control over environments by requiring environment owners to provide a business justification for maintaining their environment. This helps ensure that all environments in your tenant are aligned with your organization's overall strategy and goals and increases visibility into which environments are being used for.

:::image type="content" source="media/dev-environments.png" alt-text="Developer Compliance Center - Environment details":::

Learn more:

- [Defining an environment strategy](/power-platform/guidance/adoption/environment-strategy)
- [Communicating Power Platform governance](/power-platform/guidance/adoption/environment-strategy#clearly-communicate-your-organizations-environment-strategy-to-makers)
- [CoE Starter Kit - Developer Compliance Center](/power-platform/guidance/coe/governance-components#developer-compliance-center)
- [CoE Starter Kit - Power BI dashboard](/power-platform/guidance/coe/power-bi-monitor#environments)
- [CoE Starter Kit - Compliance and adoption dashboard](/power-platform/guidance/coe/power-bi-compliance)

## Managing new environment creation and environment requests

One of the key best practices for managing Power Platform environments is to implement controls and processes that restrict who can create new environments. The CoE Starter Kit includes a reference example for an environment and DLP request management process that can be used to effectively manage future environment and DLP requests. By understanding and utilizing this solution, your CoE team will be well-positioned to manage and govern the environments in your tenant.

Additionally, it's important to regularly check for new Power Platform connectors that may have been added to your tenant to ensure that they align with your organization's DLP and governance policies.

Learn more:

- [Environment strategy best practices](/microsoft-365/community/defining-a-power-platform-environment-strategy#recommendations--best-practices)
- [Environment creation security guide](/power-platform/admin/create-environment#who-can-create-environments)
- [Power Automate cloud flow template - check for new connectors](https://powerautomate.microsoft.com/en-US/templates/details/0b2ffb0174724ad6b4681728c0f53062/get-a-list-of-new-apps-flows-and-connectors/)
- [CoE Starter Kit - Environment and DLP Request process(Video)](https://youtu.be/16mspbGz1zA)
- [CoE Starter Kit - Setup environment request components](setup-environment-components.md)
- [CoE Starter Kit - How to use the Environment and DLP Request process](env-mgmt.md)

## Managing the default environment

Every tenant in Power Platform has a [default environment](/power-platform/admin/environments-overview#the-default-environment) where organic growth of apps and cloud flows typically occur. While the default environment can't be deleted, it can be renamed to better communicate its intended purpose. One of the first steps in managing the default environment is identifying the business value and risk of existing apps and flows, and identifying any unused apps and flows. This can help you determine which solutions should be moved to Production environments, or should have higher levels of support.

Additionally, consider quarantining apps that aren't compliant and creating a process for cleaning up orphaned resources, such as apps and flows without an owner.

The **Default environment** page in the CoE Starter Kit's **Compliance and adoption dashboard** can help you gain valuable insights of the adoption in your default environment, such as identifying top connectors, top most launched apps and top makers.

:::image type="content" source="media/pbi-compliance3.png" alt-text="Default environment tech debt insights":::

The **Compliance** page in the CoE Starter Kit's **Compliance and adoption dashboard** can help you identify apps and flows with no owners, non-compliant apps, and suspended flows and enable you to come up with an action plan to bring apps and flows back into compliance.

:::image type="content" source="media/pbi-compliance1.png" alt-text="Compliance overview page":::

Learn more:

- [Rename the default environment](/power-platform/admin/edit-properties-environment)
- [Secure the default environment](/power-platform/guidance/adoption/secure-default-environment)
- [CoE Starter Kit - Identify unused apps and cloud flows](governance-components.md#app-and-flow-inactivity-notifications-clean-up-view)
- [CoE Starter Kit - Quarantined non-compliant apps](governance-components.md#app-quarantine-process)
- [CoE Starter Kit - Clean up orphaned resources](governance-components.md#cleanup-for-orphaned-resources)
- [CoE Starter Kit - Compliance and Adoption dashboard](power-bi-compliance.md)

## Managing Dataverse for Teams environments

Dataverse for Teams is a powerful low-code data platform that enables the creation of custom apps and bots directly within Microsoft Teams. One of the key features of Dataverse for Teams is that it automatically provisions new environments for each team within an organization, as soon as an app or bot is created or installed from the app catalog. This allows teams to easily access and manage their own data while also providing a level of isolation and security to protect data from other teams.

Power Platform includes a built-in mechanism for automatically cleaning up Dataverse for Teams environments that have been inactive for 90 days. Beyond the automatic clean up, you may also want to keep track of existing environments and their  purpose, data types, connectors, and other information associated with each environment.

The **Microsoft Teams environments** page in the CoE Starter Kits dashboard provides you with an overview of your existing Teams environments, apps and flows in those environments and the last launched date of apps.

:::image type="content" source="media/pb-6.png" alt-text="Microsoft Teams Environments overview":::

The **Governance components** of the CoE Starter Kit provide a process to capture business justifications for Dataverse for Teams environments. Additionally, by implementing a daily process of checking for new Dataverse for Teams environments, organizations can ensure that they're aware of all environments in use and that they align with the organization's compliance and governance policies.

:::image type="content" source="media/dev-environments.png" alt-text="Developer Compliance Center - Environment details":::

Learn more:

- [Automatically remove inactive Dataverse for Teams environments](/power-platform/admin/inactive-teams-environment)
- [CoE Starter Kit - Manage Dataverse for Teams environments](teams-governance.md)

## Securing your environments

With over 900 connectors available to your organization, it's critical to establish a Data Loss Prevention (DLP) strategy to control connector availability. However, when getting started, you may be unaware of the impact that changing a DLP policy will have on your existing apps and flows.

The **DLP editor (impact analysis) tool** is available to you to use before making changes to existing, or creating new DLP policies. This will give you a clearer picture of the impact of changes on existing apps and cloud flows, and help you make informed decisions.

:::image type="content" source="media/dlp_new1.png" alt-text="DLP Editor":::

Once your DLP strategy is in place, use the **DLP request management process** in the CoE Starter Kit for makers to request and evaluate available DLP policies.

:::image type="content" source="media/env-mgmt-process.png" alt-text="Environment and DLP request management process":::

Learn more:

- [Establishing a DLP strategy](/power-platform/guidance/adoption/dlp-strategy)
- [CoE Starter Kit - DLP editor impact analysis](core-components.md#dlp-editor-v2)
- [Configure user security to resources in an environment](/power-platform/admin/database-security)
- [Security in Microsoft Power Platform](/power-platform/admin/security/overview)
- [Security and governance considerations](/power-platform/admin/governance-considerations)

## Managing apps and cloud flows

There are common scenarios to consider for managing apps and cloud flows in your organization.

### Managing existing apps and cloud flows

#### Usage

Identifying the apps and cloud flows that are heavily used within your organization is crucial in order to ensure that they are in compliance with your organizational policies.

The Power BI dashboard in the CoE Starter Kit offers a comprehensive view of the most used apps and flows in your organization, providing valuable information that can help you make informed decisions. The dashboard can provide a quick overview of the most popular apps, the number of users, usage patterns, and any other relevant information that can help you identify potential compliance issues and ensure that your apps and flows are being used effectively.

##### CoE Starter Kit - Power BI dashboard

The Power BI dashboard in the CoE Starter Kit provides a wealth of useful information, including visual representations of usage patterns, the number of users, and any other relevant data that can help you identify compliance issues and ensure that your apps and cloud flows are being used effectively. These visualizations can be valuable in understanding how your organization is using the Power Platform and identifying areas that may need attention. By providing clear and actionable insights, the dashboard can help you ensure that your Power Platform solutions are secure, compliant, and aligned with your organizational policies.

##### CoE Starter Kit - inactivity notifications

The inactivity notification process in the CoE Starter Kit automatically detects apps that have been inactive for a certain period of time and sends notifications to the app owner, asking them to confirm if the app is still needed or can be safely deleted.  This process helps organizations manage their Power Platform apps more efficiently by identifying and removing unused or redundant apps.  The inactivity threshold can be configured by the CoE team.

:::image type="content" source="media/coe58.png" alt-text="Screenshot of the inactivity notification mail sent to an app owner":::

Learn more:

- [Inactivity notifications (Video)](https://youtu.be/PZ5u_2E9uUI)
- [Set up inactivity notifications](setup-archive-components.md)

#### Compliance

Evaluating the risk exposure of apps and cloud flows is an important step in managing the Power Platform effectively. By identifying high-risk apps, your CoE team can define processes for mitigating those risks, such as migrating high-risk apps or providing more support for high-value apps. Since most organizations have hundreds, if not thousands of apps and cloud flows, manually reaching out to owners to establish risk isn't a scalable option. The CoE Starter Kit includes components that can assist your CoE team in capturing compliance information and identifying high-risk apps. These tools can automate the process of assessing risk, saving your team time and resources while also helping to ensure that your organization's Power Platform solutions are secure and compliant.

The **Admin compliance detail request** is a powerful cloud flow that can help your CoE team establish compliance with organizational policies by iterating over the inventory of apps and bots.

 This flow allows your team to set compliance thresholds and automatically checks apps and bots against these thresholds. If an app or bot is found to be non-compliant, the flow will prompt the owner to submit a business justification and additional information about the application. This enables your CoE team to quickly and efficiently identify and address compliance issues while also providing a clear and transparent process for app and bot owners.

:::image type="content" source="media/coe55.png" alt-text="Screenshot of compliance email sent to an owner":::

Learn more:

- [App and flow compliance detail request](governance-components.md#admin--compliance-detail-request-v3)
- [How the CoE Starter Kit's compliance process works (Video)](https://youtu.be/WXXFjHLt5ss)
- [Power Platform Support Strategy](../adoption/support-strategy.md)

### Managing future apps and cloud flows

Implementing the CoE Starter Kit's inactivity notification and compliance processes is an essential step in effectively managing compliance for your Power Platform solutions.

To get the most value out of these tools and to ensure compliance, here are a few considerations:

1. Exclude development and production environments from compliance and inactivity notifications.
1. Quarantine apps that aren't compliant.

Learn more:

- [Exclude environments from the compliance processes](/power-platform/guidance/adoption/onboard-makers)
- [Exclude environments from inactivity notifications](setup-archive-components.md#exempt-environments-from-the-inactivity-notifications-process)
- [Quarantine non-compliant apps](governance-components.md#admin--quarantine-non-compliant-apps)

### Managing apps and cloud flows when the owner leaves the organization

When an employee who is responsible for an app or flow within Power Platform leaves the organization, they may leave behind components they've built, known as orphaned resources. These resources can pose a security risk if they aren't properly managed or maintained. To address this issue, the CoE Starter Kit includes a process to identify and clean up orphaned resources.

This process is designed to run daily checks for any resources that are owned by former employees, ensuring that these resources are either reassigned to a new owner or removed from the tenant if they're no longer needed. This component can help keep your Power Platform solutions are secure and compliant, even when employee turnover occurs.

![Screenshot of orphaned resources adaptive card sent to line manager](media/orphanedobjects2.png)

Learn more:

- [Managing apps and cloud flows when the owner leaves the organization (Video)](https://youtu.be/0zptiBppTNo)
- [CoE Starter Kit - Cleanup for orphaned resources process](governance-components.md#cleanup-for-orphaned-resources)

## Highly used apps

Highly used apps in your organization often have a compelling story behind their success, such as how they were created, the challenges they overcame and the value they provide to the business. Discovering and sharing these stories can be a great way to drive further adoption and provide confidence to other makers in your organization.

The CoE Starter Kit's **Power BI dashboard** can help you identify highly used apps and your most active makers. These makers can help you create powerful success stories, start an internal community program. You may also want to include them as decision makers as you refine your Power Platform strategy.

![Makers.](media/pb-10.png "Makers")

The [Power Platform Community Site Template](../adoption/wiki-community.md#get-started-with-the-power-platform-communication-site-template) provides useful templates for promoting success stories, events, hackathons, and other relevant information. It can be a powerful tool for encouraging collaboration and knowledge sharing within your organization, as well as for encouraging the adoption of best practices and standards for Power Platform development.

## Active makers

Identifying the most active makers in your organization can provide valuable insights and resources for your organization's Power Platform community. These makers are likely to be highly engaged and knowledgeable about the platform and can be valuable allies in helping to drive adoption and improve the quality of your organization's solutions. Some of the ways you can utilize the active makers in your organization include:

- **Hackathons and training delivery**: Active makers can be invited to participate in hackathons, training sessions, and other community events to share their knowledge and experiences
- **CoE Advisors**: Active makers can be invited to join your COE as advisors, providing input and guidance on future policies, events, and other initiatives
- **Promoting Success stories**: Active makers can be encouraged to share their success stories and experiences to help drive adoption and inspire others in the organization.
- **Opt-in for skills match**: The Skills match feature is designed to help makers build a community of makers. By helping a maker connect with others in an organization and community, they can help them get the necessary support during onboarding and upskilling.
- By identifying and applying the expertise and enthusiasm of your organization's most active makers, you can help to build a more engaged and effective Power Platform community.

Learn more:

- [Skills match overview](/power-platform-release-plan/2022wave2/power-apps/skills-match-power-apps-makers)
- [Power Platform Adoption workbook](https://aka.ms/powerplatformadoptionworkbook)
- [Power Platform Hackathon workbook](https://aka.ms/powerplatformhackathonworkbook)
- [Power Platform Adoption guidance](https://adoption.microsoft.com/powerplatform/)

## Communicating governance to your makers

Communicating governance to your makers is an important aspect of managing Power Platform effectively. Governance policies and guidelines help ensure that solutions are secure, compliant and aligned with organizational goals.
However, if makers don't understand or are aware of these policies, they may not be able to create solutions that meet these requirements.

Here are a few strategies for effectively communicating governance to your makers:

- Clearly communicate the purpose and benefits of governance policies: Explain how governance policies help to protect organizational data and ensure compliance with regulations.
- Make governance policies and guidelines easily accessible: Place them in a central location, such as the Power Platform community site template that is easily accessible to all makers.
- Provide training and support: Offer training sessions and resources to help makers understand and comply with governance policies.
- Encourage open communication: Create a culture of open communication where makers can ask questions and raise concerns about governance policies.
- Incorporate governance into the development process: Make compliance a part of the development process, for example, by requiring a compliance review before deploying a solution.

Learn more:

- [Power Platform community site template](/power-platform/guidance/adoption/wiki-community)
- [Set up the Power Platform community site template](/power-platform/guidance/adoption/wiki-community#get-started-with-the-power-platform-communication-site-template)
- [Welcome new makers to the platform](/power-platform/guidance/adoption/onboard-makers)

## Administration of the platform

The Power Platform Administration planning tool is a comprehensive resource that provides guidance and best practices for Power Platform administration.  

Designed to help organizations of all sizes and levels of experience optimize their administrative efforts, whether they're just getting started or are looking for ways to improve their existing support.

The tool covers all aspects of Power Platform administration, including environments, security, data loss prevention, monitoring and reporting. It provides a useful starting point for creating a solid foundation of administration and governance for Power Platform within your organization.

:::image type="content" source="media/PPAP-TaskBreakdownProactiveAndReactiveBalance.png" alt-text="Screenshot showing the Task breakdown - proactive & reactive balance section of the dashboard.":::

Learn more:

- [Learn about the administration planning tool](https://www.youtube.com/watch?v=q6738IKJW1Q)
- [Set up the administration planning tool](setup-admin-tasks-component.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
