---
title: "Establishing tenant hygiene - Microsoft Power Platform & CoE Starter Kit | Microsoft Docs"
description: "The CoE Starter Kit contains many useful components to help you establish tenant hygiene."
author: stjeffer
manager: phtopnes
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/07/2022
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Introduction

The natural expansion of the Microsoft Power Platform can sometimes conflict with an organization's established strategies, such as their environment strategy. This can make it difficult for Center of Excellence (CoE) teams to fully understand the purpose and usage of the various apps, environments, cloud flows, and bots that are in use. To address this challenge, this guidance document offers best practices for administration and governance, as well as examples of the tooling available in the CoE Starter Kit and out-of-the-box capabilities to help CoE teams effectively manage and optimize their Power Platform solutions.

## Managing existing environments

As you gain visibility into your tenant's Power Platform environments, you may discover environments that were previously unknown to you. Having a well-defined environment strategy is crucial for sustained and governed adoption of the Power Platform. Communicating this strategy clearly to your organization is even more important in ensuring that makers are developing solutions in the appropriate environment.

The CoE Starter Kit's governance component includes the **Developer Compliance Center**, which can be used to establish control over environments by requiring environment owners to provide a business justification for maintaining their environment. This helps ensure that all environments in your tenant are aligned with your organization's overall strategy and goals.

Some benefits of using the developer compliance center:

1. Identifying trial, developer, sandbox and production environments that can be deleted.
1. Managing capacity in your tenant.
1. Reducing the potential impact of DLP policy changes to existing apps and flows.
1. Increased visibility into what environments are being used for.

**Learn more:**

- [Defining an environment strategy](/power-platform/guidance/adoption/environment-strategy)
- [Communicating Power Platform governance](/power-platform/guidance/adoption/environment-strategy#clearly-communicate-your-organizations-environment-strategy-to-makers)
- [CoE Starter Kit - developer compliance center](/power-platform/guidance/coe/governance-components#developer-compliance-center)
- [CoE Starter Kit - Power BI dashboard](/power-platform/guidance/coe/power-bi-monitor#environments)
- [CoE Starter Kit - Compliance and adoption dashboard](/power-platform/guidance/coe/power-bi-compliance)

## Managing new environment creation and environment requests

One of the key best practices for managing Power Platform environments is to implement controls and processes that restrict who can create new environments. The CoE Starter Kit includes a reference example for an **environment and DLP request management process** that can be used to effectively manage future environment and DLP requests. Understanding and utilizing this solution, your CoE team will be well-positioned to manage and govern the environments in your tenant.

Additionally, it's important to periodically check for new Power Platform connectors that may have been added to your tenant, in order to ensure that they align with your organization's DLP and governance policies.

**Learn more:**

- [Environment strategy best practices](/microsoft-365/community/defining-a-power-platform-environment-strategy#recommendations--best-practices)
- [Environment creation security guide](/power-platform/admin/create-environment#who-can-create-environments)
- [Power Automate cloud flow template - check for new connectors](https://powerautomate.microsoft.com/en-US/templates/details/0b2ffb0174724ad6b4681728c0f53062/get-a-list-of-new-apps-flows-and-connectors/)
- [What is the environment and dlp request management component (YouTube)](https://youtu.be/16mspbGz1zA)
- [Setup environment request components](power-platform/guidance/coe/setup-environment-components)

## Managing the Default environment

Every tenant in the Power Platform has a unique environment called the default environment, which is where organic growth of apps and cloud flows typically occurs. While the default environment can't be deleted, it can be renamed to better communicate its intended purpose. One of the first steps in establishing control over the default environment is identifying the business value and risk of its components, as well as identifying any unused apps and flows. This can help you determine which apps should be moved to more appropriate environments or levels of support

Additionally, consider quarantining apps that aren't compliant and creating a process for cleaning up orphaned resources, such as apps and flows without an owner (see clean up orphaned resources). The **Power BI dashboard** in the CoE Starter Kit can also be used to identify the most popular apps within your organization.

**Learn more:**

- [Rename the default environment](/power-platform/admin/edit-properties-environment)
- [Secure the default environment](/power-platform/guidance/adoption/secure-default-environment)
- [Identify unused apps and cloud flows](/power-platform/guidance/coe/governance-components#app-and-flow-inactivity-notifications-clean-up-view)
- [Quarantined non-compliant apps](/power-platform/guidance/coe/governance-components#app-quarantine-process)
- [Clean up orphaned resources](/power-platform/guidance/coe/governance-components#cleanup-for-orphaned-resources)

## Managing Dataverse for Teams environments

Dataverse for Teams is a powerful low-code data platform that enables the creation of custom apps and bots directly within Microsoft Teams. One of the key features of Dataverse for Teams is that it automatically provisions new environments for each team within an organization, as soon as an app or bot is created or installed from the app catalogue. This allows teams to easily access and manage their own data, while also providing a level of isolation and security to protect data from other teams.

The Microsoft Power Platform includes a built-in mechanism for automatically cleaning up Dataverse for Teams environments that have been inactive for 90 days, helping to ensure the efficiency and security of your tenant. It also presents some compliance challenges for organizations. To mitigate these challenges, it's important to keep track of the purpose, data types, connectors, and other information associated with each environment.

The Governance component of the CoE Starter Kit provides a useful tool for Dataverse for Teams environment management. The business justification process that requires environment owners to provide business justification for the environment. Additionally, by implementing a daily process of checking for new Dataverse for Teams environments, organizations can ensure that they're aware of all environments in use and that they align with the organization's compliance and governance policies.

:::image type="content" source="media/dev-environments.png" alt-text="Developer Compliance Center - Environment details":::

**Learn more:**

- [Automatically remove Dataverse for Teams environments](/power-platform/admin/inactive-teams-environment)
- [Business justification process](/power-platform/guidance/coe/teams-governance#business-justification-process)
- [Check for new Dataverse for Teams environments](/power-platform/guidance/coe/governance-components#microsoft-teams-admin--ask-for-business-justification-when-microsoft-teams-environment-is-created)

## Securing your environments

With over 900 connectors available to your organization, it's critical to establish a Data Loss Prevention (DLP) strategy to control connector availability. However, when getting started, you may be unaware of the impact that changing a DLP policy will have on your makers' apps and flows. To help mitigate this risk, the CoE Starter Kit includes a reference example of an **environment and DLP request management process** that can be used to effectively manage future environment and DLP requests.

:::image type="content" source="media/env-mgmt-process.png" alt-text="Environment and DLP request management process":::

The **DLP editor (impact analysis) tool** is available to you to use before making changes to existing, or creating new DLP policies. This will give you a clearer picture of the impact of changes on existing apps and cloud flows, and help you make informed decisions.

:::image type="content" source="media/dlp_new1.png" alt-text="DLP Editor":::

**Learn more:**

- [Establishing a DLP strategy](/power-platform/guidance/adoption/dlp-strategy)
- [DLP editor impact analysis](https://powerapps.microsoft.com/blog/new-in-the-coe-starter-kit-review-the-impact-of-dlp-policy-changes/)
- [Configure user security to resources in an environment](power-platform/admin/database-security)
- [Security in Microsoft Power Platform](power-platform/admin/security/overview)
- [Security and governance considerations](power-platform/admin/governance-considerations)

## Managing apps and cloud flows

There are common scenarios to consider for managing apps and cloud flows in your organization.

### Scenario - Managing existing apps and cloud flows

Within this scenario, there are two conditions:

1. Usage
1. Compliance

#### Usage

Identifying the apps and cloud flows that are heavily used within your organization is crucial in order to ensure that they are in compliance with your organizational policies.

The Power BI dashboard in the CoE Starter Kit offers a comprehensive view of the most used apps and flows in your organization, providing valuable information that can help you make informed decisions. The dashboard can provide a quick overview of the most popular apps, the number of users, usage patterns, and any other relevant information that can help you identify potential compliance issues and ensure that your apps and flows are being used effectively.

##### CoE Starter Kit - Power BI dashboard

The Power BI dashboard in the CoE Starter Kit provides a wealth of useful information, including visual representations of usage patterns, the number of users, and any other relevant data that can help you identify compliance issues and ensure that your apps and cloud flows are being used effectively. These visualizations can be extremely valuable in understanding how your organization is using the Power Platform and identifying areas that may need attention. By providing clear and actionable insights, the dashboard can help you ensure that your Power Platform solutions are secure, compliant, and aligned with your organizational policies.

##### CoE Starter Kit - inactivity notifications

The inactivity notification process in the CoE Starter Kit is a features that automatically detects apps that have been inactive for a certain period of time and sends notifications to the app owner, asking them to confirm if the app is still needed or can be safely deleted.  This process helps organizations manage their Power Platform apps more efficiently by identifying and removing unused or redundant apps.  The inactivity threshold can be configured by the CoE team.

:::image type="content" source="media/coe58.png" alt-text="Screenshot of the inactivity notification mail sent to an app owner":::

**Learn more:**

- [Inactivity notifications (Video)](https://youtu.be/PZ5u_2E9uUI)
- [Set up inactivity notifications](power-platform/guidance/coe/setup-archive-components)

#### Compliance

Evaluating the risk exposure of apps and cloud flows is an important step in managing the Power Platform effectively. By identifying high-risk apps, your CoE team can define processes for mitigating those risks, such as migrating high-risk apps or providing additional support for high-value apps. Since most organizations have hundreds, if not thousands of apps and cloud flows, manually reaching out to owners to establish risk isn't a scalable option. The CoE Starter Kit includes components that can assist your CoE team in capturing compliance information and identifying high-risk apps. These tools can automate the process of assessing risk, saving your team time and resources while also helping to ensure that your organization's Power Platform solutions are secure and compliant.

The **Admin compliance detail request** is a powerful cloud flow that can help your CoE team establish compliance with organizational policies by iterating over the inventory of apps and bots.

 This flow allows your team to set compliance thresholds and automatically checks apps and bots against these thresholds. If an app or bot is found to be non-compliant, the flow will prompt the owner to submit a business justification and additional information about the application. This enables your CoE team to quickly and efficiently identify and address compliance issues, while also providing a clear and transparent process for app and bot owners.

:::image type="content" source="media/coe55.png" alt-text="Screenshot of compliance email sent to an owner":::

**Learn more:**

- [App and flow compliance detail request](/power-platform/guidance/coe/governance-components#admin--compliance-detail-request-v3)
- [How the compliance process works in the CoE Starter Kit](https://youtu.be/WXXFjHLt5ss)

### Scenario - managing future apps and cloud flows

Implementing the inactivity notification process, the admin compliance detail request, and the developer compliance app is an essential step in effectively managing compliance for your Power Platform solutions.

To get the most value out of these tools and to ensure compliance, here are a few considerations to keep in mind:

1. **Exclude development and production environments** from compliance and inactivity notifications.
1. **Quarantining apps** that aren't compliant.

**Learn more:**

- [Exclude environments from the compliance processes](/power-platform/guidance/adoption/onboard-makers)
- [Exclude environments from inactivity notifications](/power-platform/guidance/coe/setup-archive-components#exempt-environments-from-the-inactivity-notifications-process)
- [Quarantine non-compliant apps](/power-platform/guidance/coe/governance-components#admin--quarantine-non-compliant-apps)

### Scenario - managing apps and cloud flows when the owner leaves the organization

When an employee who is responsible for an app or flow within the Microsoft Power Platform leaves the organization, they may leave behind components they've built, known as "orphaned resources." These resources can pose a security risk if they aren't properly managed or maintained. To address this issue, the Microsoft Power Platform Center of Excellence (CoE) Starter Kit includes a governance component called "Cleanup for Orphaned Resources."

This component is designed to run daily checks for any resources that are owned by former employees, ensuring that these resources are either reassigned to a new owner or removed from the tenant if they aren't needed. This component can help to ensure that your tenant's Power Platform solutions are secure and compliant, even when employee turnover occurs.

![Screenshot of orphaned resources adaptive card sent to line manager](media/orphanedobjects2.png)

**Learn more:**

- [Managing apps and cloud flows when the owner leaves the organization (Video)](https://youtu.be/0zptiBppTNo)
- [Cleanup for orphaned resources](power-platform/guidance/coe/governance-components#cleanup-for-orphaned-resources)

## Highly used apps

Highly used apps in your organization often have a compelling story behind their success, such as how they were created, the challenges they overcame and the value they provide to the business. Discovering and sharing these stories can be a great way to drive further adoption and provide confidence to other makers in your organization. 

The CoE Starter Kit includes a standalone component called the Power Platform Community Site Template, which provides useful templates for promoting success stories, events, hackathons, and other relevant information. It can be a powerful tool for encouraging collaboration and knowledge sharing within your organization, as well as for encouraging the adoption of best practices and standards for Power Platform development.

## Active makers

Identifying the most active makers in your organization can provide valuable insights and resources for your organization's Power Platform community. These makers are likely to be highly engaged and knowledgeable about the platform and can be valuable allies in helping to drive adoption and improve the quality of your organization's solutions. Some of the ways you can utilize the active makers in your organization include:

**Hackathons and training delivery**: Active makers can be invited to participate in hackathons, training sessions, and other community events to share their knowledge and experiences

**COE Advisors**: Active makers can be invited to join your COE as advisors, providing input and guidance on future policies, events, and other initiatives

**Promoting Success stories**: Active makers can be encouraged to share their success stories and experiences to help drive adoption and inspire others in the organization.

**Opt-in for skills match**: The Skills match feature is designed to help makers build a community of makers. By helping a maker connect with others in an organization and community, they can help them get the necessary support during onboarding and upskilling.

By identifying and applying the expertise and enthusiasm of your organization's most active makers, you can help to build a more engaged and effective Power Platform community.

**Learn more:**

- [Skills match overview](/power-platform-release-plan/2022wave2/power-apps/skills-match-power-apps-makers)

## Communicating governance to your makers

Communicating governance to your makers is an important aspect of managing the Power Platform effectively. Governance policies and guidelines help ensure that solutions are secure, compliant and aligned with organizational goals. 
However, if makers don't understand or are aware of these policies, they may not be able to create solutions that meet these requirements.

Here are a few strategies for effectively communicating governance to your makers:

1. Clearly communicate the purpose and benefits of governance policies: Explain how governance policies help to protect organizational data and ensure compliance with regulations.
1. Make governance policies and guidelines easily accessible: Place them in a central location, such as the Power Platform community site template that is easily accessible to all makers.
1. Provide training and support: Offer training sessions and resources to help makers understand and comply with governance policies.
1. Encourage open communication: Create a culture of open communication where makers can ask questions and raise concerns about governance policies.
1. Incorporate governance into the development process: Make compliance a part of the development process, for example, by requiring a compliance review before deploying a solution.

**Learn more:**

- [Power Platform community site template](/power-platform/guidance/adoption/wiki-community)
- [Set up the Power Platform community site template](/power-platform/guidance/adoption/wiki-community#get-started-with-the-power-platform-communication-site-template)
- [Welcome new makers to the platform](/power-platform/guidance/adoption/onboard-makers)

## Administration of the platform

The Power Platform Administration planning tool is a comprehensive resource that provides guidance and best practices for Power Platform administration.  

Designed to help organizations of all sizes and levels of experience optimize their administrative efforts, whether they're just getting started or are looking for ways to improve their existing support.

The tool covers all aspects of Power Platform administration, including environments, security, data loss prevention, monitoring and reporting. It provides a useful starting point for creating a solid foundation of administration and governance for Power Platform within your organization.

**Learn more:**

- [Learn about the administration planning tool](https://www.youtube.com/watch?v=q6738IKJW1Q)
- [Set up the administration planning tool](https://powerapps.microsoft.com/blog/power-platform-administration-planning/)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]