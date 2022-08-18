---
title: "Overview  | MicrosoftDocs"
description: Overview of the CoE Starter Kit
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Center of Excellence (CoE) overview

A Center of Excellence (CoE) drives innovation and improvement, and brings together like-minded people with similar business goals to share knowledge and success, while providing standards, consistency, and governance.

The Microsoft Power Platform CoE Starter Kit is a collection of components and tools that are designed to help you get started with developing a strategy for adopting and supporting Microsoft Power Platform.

You can download the most recently updated assets from the [GitHub repository](https://aka.ms/CoEStarterKitRepo).

The kit doesn't represent the entire CoE, because managing a CoE requires more than tools alone; the CoE also requires people, communication, and defined requirements and processes. The tools provided here are just a means to get to the end goal, but the CoE itself must be thoughtfully designed by each organization based on their needs and preferences. More information: [What is a Center of Excellence?](motivation.md)

The kit provides some automation and tooling to help teams build monitoring and automation necessary to support a CoE. The foundation of the kit is a Microsoft Dataverse data model and workflows to collect resource information across the environments in the tenant. The kit includes multiple apps and Power BI analytics to view and interact with the data you collect. The kit also provides several templates and suggested patterns and practices for implementing CoE efforts.

## Disclaimer

Although the underlying features and components used to build the kit (such as Dataverse, admin APIs, and connectors) are fully supported, the kit itself represents sample implementations of these features. Our customers and community can use and customize these features to implement admin and governance capabilities in their organizations.

If you face issues with:

- **Using the kit**: Report your issue at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues). (Microsoft Support won't help you with issues related to this kit, but they'll help with related, underlying platform and feature issues.)
- **The core features in Microsoft Power Platform**: Use your standard channel to contact Support.

## Purpose of this document

This CoE Starter Kit and this guidance are targeted toward the person or department responsible for setting up a Microsoft Power Platform CoE in their organization. The goal of this guidance is to help you understand what the motivation for&mdash;and the responsibilities of&mdash;a Center of Excellence are, in addition to walking you through the prerequisites, setup instructions, and individual components of the CoE Starter Kit.

## How to get started

After you've [installed the CoE Starter Kit solution](setup.md), get familiar with the resources in your tenant.

> [!NOTE]
> The following steps are just examples of what you can do with the components in the CoE Starter Kit. Explore the rest of the guidance here to see what's available and how to make the most of the kit.

1. Open the Power BI dashboard, and familiarize yourself with resources and makers that are already in your environments.

    ![CoE Power BI dashboard.](media/coe1.PNG "CoE Power BI dashboard")

1. Identify orphaned apps, and assign them to new owners by using the embedded app in the Power BI dashboard.

    ![Set App Permissions canvas app.](media/SetAppPerms.PNG "Set App Permission canvas app")

1. Start planning your governance strategy by identifying your requirements for what makes a compliant app or maker, what information you'll need per app or per maker, what happens to noncompliant apps and makers, how you'll support your maker community in building compliant apps that follow best practices, and what actions you'll drive based on this information.

    ![Developer Compliance Center canvas app.](media/coe4.PNG "Developer Compliance Center canvas app")

1. Embrace your maker community and develop a nurture and adoption strategy. Think about how to onboard new makers. Organize internal events such as training workshops and hackathons. Put together templates and best practices for your makers to use.

    ![Email to welcome new makers.](media/coe5.PNG "Email to welcome new makers")

## How to use the CoE Starter Kit alongside Power Platform Admin Center

### Managed Environments for Power Platform

[Managed Environments](/power-platform/admin/managed-environment-overview) is a suite of capabilities that allows admins to manage Power Platform at scale with more control, less effort, and more insights - those capabilities are available out of the box, from within the Power Platform Admin Center. Managed Environment capabilities can be used standalone, or alongside capabilities of the CoE Starter Kit to administer and govern your Power Platform adoption.

The CoE Starter Kit reflects our customer obsession though experimentation and innovation with an open-source low code model influenced by customer feedback. Managed Environments continues our customer obsession - and over time will replace certain features in the CoE Starter Kit. Whilst the evolution of Managed Environments continues, new experiments and innovations will be added to the CoE Starter Kit to gauge admin interest.

Our recommendation is to start with the out of the box capabilities in Power Platform admin center and Managed Environments. Those capabilities are robust in the product and fully supported. And if you discover you need more capabilities to govern your tenant, see if features in the CoE Starter Kit can complement what you get out of the box.

Let's now look at individual features of Managed Environments to see how they compare to what's in the CoE Starter Kit:

**[Weekly digest](/power-platform/admin/managed-environment-weekly-digests)**: The CoE Starter Kit doesn't have a weekly digest for admins; instead admins self-serve information through the [Power BI dashboard](/power-platform/guidance/coe/power-bi). Inactive apps and flows are highlighted in the Weekly digest email. In the CoE Starter Kit, a similar goal is achieved with the [inactivity notification process](governance-components.md#inactivity-notifications-processes), which notifies makers of their inactive resources and asks for approval to delete them. One of the main goals of Managed Environments and the CoE Starter Kit is to provide more insights thus allowing admins to take action. The CoE kit provides more capabilities, which can reduce the burden on the admin dealing with inactive resources, as the CoE can direct resource management to the maker thus making the owner responsible for their own resources.

**[Sharing limits](/power-platform/admin/managed-environment-sharing-limits)**: The CoE Starter Kit can't limit sharing on resources, proactive governance like this can only be done via Managed Environments. The [Compliance process](example-processes.md) in the CoE Starter Kit offers a reactive way to identify highly shared resources. This process identifies highly shared resources and asks makers to provide additional information, so that admins can better support those solutions (for example, move them to a dedicated environment). With the Power BI dashboard admins can also identify highly shared resources.

**[Data policies](/power-platform/admin/managed-environment-data-policies)**: Managed Environments allows you to see what data policies apply to the environment. The [DLP Editor](core-components.md#dlp-editor-v2), part of the CoE Starter Kit, can also show you data policies that are applied to an environment. Additionally, the main purpose of the DLP Editor is to show you the impact of data policies on existing apps/flows in the environment.

In addition to those three features that have an overlap with Managed Environments, the CoE Starter Kit offers capabilities that aren't yet met with Managed Environments - such as bulk updating permissions, cleaning up abandoned resources, surveying makers and calculating the ROI of ideas.

### Tenant-level analytics

[Tenant-level analytics](/power-platform/admin/tenant-level-analytics) in Power Platform Admin Center offer a great way to get a holistic overview of usage and inventory of your apps, flows, makers and environments and allow you to identify metrics like top used apps and top makers. The [Power BI dashboard](/power-platform/guidance/coe/power-bi) in the CoE Starter Kit combines your tenant level inventory and usage data with your organizations data to provide you with more granular insights into what departments, cities, and countries are using Power Platform. Additionally, a broader range of customizable filters is available so you can view your inventory by connector, classification (premium/standard), or drill into how many users an app is shared with. Tenant-level insights in the Power Platform Admin Center provide you with a great starting point to get familiar with your tenants adoption of Power Platform, and as your need for those insights matures, you can explore the rich and customizable reports of the CoE Starter Kit.

## Further resources

- Explore the [Power Apps admin documentation](../../admin/admin-documentation.md).

- Find training resources, including guided learning and step-by-step guides, at [aka.ms/PowerPlatformLabs](https://aka.ms/powerplatformlabs).

- Read up on customer success stories and find resources relevant to your experience, technical background, and skill level at [aka.ms/PowerPlatformResources](https://aka.ms/powerplatformresources).

- Get started with the Microsoft Power Platform path on Microsoft Learn, a free online and interactive training platform [aka.ms/PowerUp](/learn/paths/create-powerapps/?WT.mc_id=twitter-social-donasa).

- As an admin looking after the CoE, you should be familiar with the administration and governance of Microsoft Power Platform. We recommend the following white paper as a resource: [aka.ms/PowerAppsAdminWhitepaper](https://aka.ms/powerappsadminwhitepaper).


[!INCLUDE[footer-include](../../includes/footer-banner.md)]