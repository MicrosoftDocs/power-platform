---
title: "Center of Excellence (CoE) overview  | MicrosoftDocs"
description: Overview of the CoE Starter Kit
author: manuelap-msft
ms.topic: conceptual
ms.date: 02/08/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: kvivek
---
# Center of Excellence (CoE) overview

Establishing a Microsoft Power Platform Center of Excellence (CoE) means investing in and nurturing organic growth while maintaining governance and control. A CoE is designed to drive innovation and improvement, and as a central function it can break down geographic and organizational silos. A CoE can be a powerful way for an organization to align around business goals rather than individual department metrics.

A key principle is to clarify why you're setting up a CoE, what you aim to accomplish, and the key business outcomes you hope to achieve. Then get started, and learn and evolve along the way. For many, the CoE is the first step in fostering greater creativity and innovation across the organization by empowering business units to digitize and automate their business processes, while maintaining the necessary level of central oversight and governance.

The Microsoft Power Platform CoE Starter Kit is a collection of components and tools that are designed to help you get started with developing a strategy for adopting and supporting Microsoft Power Platform. The CoE Starter Kit is a reference implementation, and the templates within it might not match every organization's requirements, so we recommend that you extend the solution to fit your organization's requirements as defined by your CoE.

You can download the most recently updated assets from the [GitHub repository](https://aka.ms/CoEStarterKitRepo).

The kit doesn't represent the entire CoE, because managing a CoE requires more than tools alone; the CoE also requires people, communication, and defined requirements and processes. The tools provided here are just a means to get to the end goal, but the CoE itself must be thoughtfully designed by each organization based on their needs and preferences.

The kit provides some automation and tooling to help teams build monitoring and automation necessary to support a CoE. The foundation of the kit is a Microsoft Dataverse data model and workflows to collect resource information across the environments in the tenant. The kit includes multiple apps and Power BI analytics to view and interact with the data you collect. The kit also provides several templates and suggested patterns and practices for implementing CoE efforts.

## Disclaimer

Although the underlying features and components used to build the kit (such as Dataverse, admin APIs, and connectors) are fully supported, the kit itself represents sample implementations of these features. Our customers and community can use and customize these features to implement admin and governance capabilities in their organizations.

If you face issues with:

- **Using the kit**: Report your issue at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues). (Microsoft Support won't help you with issues related to this kit, but they'll help with related, underlying platform and feature issues.)
- **The core features in Microsoft Power Platform**: Use your standard channel to contact Support.

## Purpose of this document

This CoE Starter Kit and this guidance are targeted toward the person or department responsible for setting up a Microsoft Power Platform CoE in their organization. The goal of this guidance is to help you understand what the motivation for&mdash;and the responsibilities of&mdash;a Center of Excellence are, in addition to walking you through the prerequisites, setup instructions, and individual components of the CoE Starter Kit.

## How to get started using the CoE Starter Kit

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

## How to use the CoE Starter Kit alongside Automation Kit

The [Automation Kit](https://aka.ms/automationcoe) is set of tools that accelerates the use and support of Power Automate for desktop for automation projects. The kit provides tools that help you manage automation projects and monitor them to estimate money saved and return on investment (ROI).

The kit is especially useful to an Automation Center of Excellence (CoE) team, which is a team of experts who support automation within your organization. They have good knowledge about Power Automate for desktop, set up and maintain the Automation Kit, and maintain the configuration data such as departments, process categories, goals, and more.

The Automation Kit can be used standalone or alongside the CoE Starter Kit.

## Admin tools available to you

A Microsoft Power Platform CoE takes ownership of Microsoft Power Platform administration, nurturing, and operations support. To do that, you'll need to use the administrative functions in Microsoft Power Platform.

Admin and governance tools fall into three broad categories:

:::row:::
   :::column span="":::
      **Admin center** <br>The core, most important capabilities for admins and makers are the functions in the core product [admin center](https://admin.powerplatform.microsoft.com/). These features are designed to be the easiest and most robust way to complete tasks, and are fully supported by the engineering team:
      - Environment and environment security management
      - Data loss prevention (DLP) policy management
      - Data integration and gateway management
      - Admin analytics (to view capacity and activity on Microsoft Dataverse, Power Apps, and Power Automate)
      - Support ticket requests

   :::column-end:::
   :::column span="":::
       **Platform extensions** <br>Four connectors provide access to the same APIs that the products and admin centers use. These have been exposed through the connectors library to give users the ability to create custom solutions to execute administrative or governance-related tasks.
       - [Power Platform for Admins](/connectors/powerplatformforadmins/)
       - [Power Apps for Admins](/connectors/powerappsforadmins/)
       - [Power Automate Management](/connectors/flowmanagement/)
       - [Power Apps for Makers](/connectors/powerappsforappmakers/)
   :::column-end:::
    :::column span="":::
      **Templates and customizations** <br>The [CoE Starter Kit](setup.md) falls into this category. The CoE templates use the admin connectors in combination with other connectors and formulas to achieve specific goals. The nature of a template is to provide a good solution for a specific task, but it might not have the exact functionality that you need. You might have to adjust it to achieve what you're looking for.
   :::column-end:::
:::row-end:::

## How to use the CoE Starter Kit alongside Power Platform Admin Center

### Managed Environments for Power Platform

[Managed Environments](/power-platform/admin/managed-environment-overview) is a suite of capabilities that allows admins to manage Power Platform at scale with more control, less effort, and more insights - those capabilities are available out of the box, from within the Power Platform Admin Center. Managed Environment capabilities can be used standalone, or alongside capabilities of the CoE Starter Kit to administer and govern your Power Platform adoption.

The CoE Starter Kit reflects our customer obsession though experimentation and innovation with an open-source low code model influenced by customer feedback. Managed Environments continues our customer obsession - and over time will replace certain features in the CoE Starter Kit. Whilst the evolution of Managed Environments continues, new experiments and innovations will be added to the CoE Starter Kit to gauge admin interest.

Our recommendation is to start with the out of the box capabilities in Power Platform admin center and Managed Environments. Those capabilities are robust in the product and fully supported. And if you discover you need more capabilities to govern your tenant, see if features in the CoE Starter Kit can complement what you get out of the box.

Let's now look at individual features of Managed Environments to see how they compare to what's in the CoE Starter Kit:

**[Maker welcome content](/power-platform/admin/welcome-content)**: In Managed Environments, admins can provide customized welcome content to help their makers get started with Power Apps. When the welcome content is enabled, upon signing in to Power Apps, makers will be greeted with customized getting started information. A similar concept in the CoE Starter Kit is the [welcome email](core-components.md#flows-2), which sends an email to new makers only after they've created an app, flow, or bot for the first time. This means that makers may get necessary information only after they've created their first resource, whereas the Managed Environments feature shows them information when they sign in to Power Apps.

**[Weekly digest](/power-platform/admin/managed-environment-weekly-digests)**: The CoE Starter Kit doesn't have a weekly digest for admins; instead admins self-serve information through the [Power BI dashboard](/power-platform/guidance/coe/power-bi). Inactive apps and flows are highlighted in the Weekly digest email. In the CoE Starter Kit, a similar goal is achieved with the [inactivity notification process](governance-components.md#inactivity-processes), which notifies makers of their inactive resources and asks for approval to delete them. One of the main goals of Managed Environments and the CoE Starter Kit is to provide more insights thus allowing admins to take action. The CoE kit provides more capabilities, which can reduce the burden on the admin dealing with inactive resources, as the CoE can direct resource management to the maker thus making the owner responsible for their own resources.

**[Sharing limits](/power-platform/admin/managed-environment-sharing-limits)**: The CoE Starter Kit can't limit sharing on resources, proactive governance like this can only be done via Managed Environments. The [Compliance process](example-processes.md) in the CoE Starter Kit offers a reactive way to identify highly shared resources. This process identifies highly shared resources and asks makers to provide additional information, so that admins can better support those solutions (for example, move them to a dedicated environment). With the Power BI dashboard admins can also identify highly shared resources.

**[Data policies](/power-platform/admin/managed-environment-data-policies)**: Managed Environments allows you to see what data policies apply to the environment. The [DLP Editor](core-components.md#dlp-editor-v2), part of the CoE Starter Kit, can also show you data policies that are applied to an environment. Additionally, the main purpose of the DLP Editor is to show you the impact of data policies on existing apps/flows in the environment.

In addition to those three features that have an overlap with Managed Environments, the CoE Starter Kit offers capabilities that aren't yet met with Managed Environments - such as bulk updating permissions, cleaning up abandoned resources, surveying makers and calculating the ROI of ideas.

### Tenant-level analytics

[Tenant-level analytics](/power-platform/admin/tenant-level-analytics) in Power Platform Admin Center offer a great way to get a holistic overview of usage and inventory of your apps, flows, makers and environments and allow you to identify metrics like top used apps and top makers. The [Power BI dashboard](/power-platform/guidance/coe/power-bi) in the CoE Starter Kit combines your tenant level inventory and usage data with your organizations data to provide you with more granular insights into what departments, cities, and countries/regions are using Power Platform. Additionally, a broader range of customizable filters is available so you can view your inventory by connector, classification (premium/standard), or drill into how many users an app is shared with. Tenant-level insights in the Power Platform Admin Center provide you with a great starting point to get familiar with your tenants adoption of Power Platform, and as your need for those insights matures, you can explore the rich and customizable reports of the CoE Starter Kit.

## Further resources

- Explore the [Power Apps admin documentation](../../admin/admin-documentation.md).

- Find training resources, including guided learning and step-by-step guides, at [aka.ms/PowerPlatformLabs](https://aka.ms/powerplatformlabs).

- Read up on customer success stories and find resources relevant to your experience, technical background, and skill level at [aka.ms/PowerPlatformResources](https://aka.ms/powerplatformresources).

- Get started with the Microsoft Power Platform learning path, a free online and interactive training platform [aka.ms/PowerUp](/learn/paths/create-powerapps/).

- As an admin looking after the CoE, you should be familiar with the administration and governance of Microsoft Power Platform. We recommend the following white paper as a resource: [aka.ms/PowerAppsAdminWhitepaper](https://aka.ms/powerappsadminwhitepaper).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
