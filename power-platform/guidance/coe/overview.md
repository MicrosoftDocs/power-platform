---
title: "Center of Excellence (CoE) overview  | MicrosoftDocs"
description: Overview of the CoE Starter Kit
author: manuelap-msft
ms.topic: conceptual
ms.date: 02/08/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
---

# Center of Excellence (CoE) overview

Establishing a Microsoft Power Platform Center of Excellence (CoE) means investing in and nurturing organic growth while maintaining governance and control. A CoE is designed to drive innovation and improvement, and as a central function it can break down geographic and organizational silos. A CoE can be a powerful way for an organization to align around business goals rather than individual department metrics.

Some key principles to clarify are why you're setting up a CoE, what you aim to accomplish, and the core business outcomes you hope to achieve. Then you can get started, learn, and evolve along the way. For many, the CoE is the first step in fostering greater creativity and innovation across the organization. The CoE can empower business units to digitize and automate their business processes, while maintaining the necessary level of central oversight and governance.

The Power Platform CoE Starter Kit is a collection of components and tools that are designed to help you start developing a strategy for adopting and supporting Power Platform. The CoE Starter Kit is a reference implementation, and the templates within it might not match every organization's requirements, so we recommend that you extend the solution to fit your organization's requirements as defined by your CoE.

You can download the most recently updated assets from the [coe-starter-kit](https://aka.ms/CoEStarterKitRepo) GitHub repository.

The kit doesn't represent the entire CoE, because managing a CoE requires more than tools alone. The CoE also requires people, communication, and defined requirements and processes. The tools are a means to the end goal, but the CoE itself must be thoughtfully designed by each organization based on their needs and preferences.

The kit provides automation and tooling to help teams build the monitoring and automation necessary to support a CoE. The foundation of the kit is a Microsoft Dataverse data model and workflows to collect resource information across the environments in the tenant. The kit includes multiple apps and Power BI analytics to view and interact with the data you collect. The kit also provides several templates and suggested patterns and practices for implementing CoE efforts.

## Disclaimer

Although the underlying features and components used to build the kit (such as Dataverse, admin APIs, and connectors) are fully supported, the kit itself represents sample implementations of these features. Our customers and community can customize these features to implement admin and governance capabilities in their organizations.

If you face issues with:

- **Using the kit**: Report your issue at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues). Microsoft Support won't help you with issues related to this kit, but help with related, underlying platform and feature issues.
- **The core features in Microsoft Power Platform**: Use your standard channel to contact Support.

## Purpose of this article

The goal of this article is to help you understand the motivation and responsibilities of the Center of Excellence, in addition to walking you through the prerequisites, setup instructions, and individual components of the CoE Starter Kit.

This CoE Starter Kit and guidance are targeted toward the person or department responsible for setting up a Power Platform CoE in their organization.

## How to get started using the CoE Starter Kit

After you've [installed the CoE Starter Kit solution](setup.md), get familiar with the resources in your tenant.

> [!NOTE]
> The following steps are examples of what you can do with the CoE Starter Kit. Explore the rest of the guidance here to see what's available and how to make the most of the kit.

1. Open the Power BI dashboard, and familiarize yourself with resources and makers that are already in your environments.

   :::image type="content" source="media/coe1.PNG" alt-text="Screenshot of the CoE Power BI dashboard." lightbox="media/coe1.PNG":::

1. Identify orphaned apps and assign them to new owners by using the embedded app in the Power BI dashboard.

1. Start planning your governance strategy:
   - Identify the requirements to make a compliant app or maker.
   - What information do you need per app or maker?
   - What happens to noncompliant apps and makers?
   - How can you support your maker community in building compliant apps that follow best practices?
   - What actions do you take based on your collected information?

1. Embrace your maker community and develop a nurture and adoption strategy. Think about how to onboard new makers. Organize internal events such as training workshops and hackathons. Put together templates and best practices for your makers to use.

   :::image type="content" source="media/coe5.PNG" alt-text="Screenshot of an email that welcomes new makers, presenting lots of resources." lightbox="media/coe5.PNG":::

## Use the CoE Starter Kit alongside Automation Kit

The [Automation Kit](https://aka.ms/automationcoe) is set of tools that accelerates the use and support of Power Automate for desktop for automation projects. The kit provides tools that help you manage automation projects and monitor them to estimate money saved and return on investment (ROI).

The kit is especially useful to an Automation Center of Excellence (CoE) team, which is a team of experts who support automation within your organization. They have good knowledge about Power Automate for desktop, set up and maintain the Automation Kit, and maintain the configuration data such as departments, process categories, goals, and more.

The Automation Kit can be used standalone or alongside the CoE Starter Kit.

## Admin tools available to you

A Power Platform CoE takes ownership of Power Platform administration, nurturing, and operations support. To take ownsership, use the administrative functions in Power Platform.

Admin and governance tools fall into three broad categories:

| Admin center | Platform extensions | Templates and customizations |
|--------------|---------------------|------------------------------|
| The [admin center](https://admin.powerplatform.microsoft.com/) features help you complete tasks and are fully supported by the engineering team: <br>- Environment and environment security management<br>- Data loss prevention (DLP) policy management<br>- Data integration and gateway management<br>- Admin analytics: view capacity and activity on Microsoft Dataverse, Power Apps, and Power Automate<br>- Support ticket requests | Four connectors provide access to the same APIs that the products and admin centers use. <br><br>These libraries are exposed through the connectors library to help users create custom solutions to execute administrative or governance-related tasks.<br>- [Power Platform for Admins](/connectors/powerplatformforadmins/)<br>- [Power Apps for Admins](/connectors/powerappsforadmins/)<br>- [Power Automate Management](/connectors/flowmanagement/)<br>- [Power Apps for Makers](/connectors/powerappsforappmakers/) | The [CoE Starter Kit](setup.md) falls into this category. The CoE templates use the admin connectors in combination with other connectors and formulas to achieve specific goals. <br><br>The nature of a template is to provide a good solution for a specific task, but it might not have the exact functionality that you need. You might have to adjust it to achieve what you're looking for. |

## How to use the CoE Starter Kit alongside Power Platform admin center

### Managed Environments for Power Platform

[Managed Environments](/power-platform/admin/managed-environment-overview) is a suite of capabilities that allows admins to manage Power Platform at scale with more control, less effort, and more insights. The capabilities are available out of the box, from within the Power Platform admin center. Managed Environment capabilities can be used standalone, or alongside capabilities of the CoE Starter Kit to administer and govern your Power Platform adoption.

The CoE Starter Kit encourages experimentation and innovation with an open-source, low code model influenced by customer feedback. Managed Environments will replace certain features in the CoE Starter Kit eventually. As the evolution of Managed Environments continues, new experiments and innovations are added to the CoE Starter Kit to gauge admin interest.

Our recommendation is to start with the out of the box capabilities in Power Platform admin center and Managed Environments. Those capabilities are robust in the product and fully supported. And if you discover you need more capabilities to govern your tenant, see if features in the CoE Starter Kit can complement what you get out of the box.

#### Individual features

Let's now look at individual features of Managed Environments to see how they compare to what's in the CoE Starter Kit.

- **[Maker welcome content](/power-platform/admin/welcome-content)**

  In Managed Environments, admins can provide customized welcome content to help their makers get started with Power Apps. When the welcome content is enabled, upon signing in to Power Apps, makers are greeted with customized getting started information.
  
  A similar concept in the CoE Starter Kit is the [welcome email](core-components.md), which sends an email to new makers only after they created an app, flow, or bot for the first time. Makers may get necessary information only after they create their first resource, whereas the Managed Environments feature shows them information when they sign in to Power Apps.

- **[Weekly digest](/power-platform/admin/managed-environment-weekly-digests)**

  The CoE Starter Kit doesn't have a weekly digest for admins, instead admins self-serve information through the [Power BI dashboard](/power-platform/guidance/coe/power-bi). Inactive apps and flows are highlighted in the Weekly digest email. In the CoE Starter Kit, a similar goal is achieved with the [inactivity notification process](governance-components.md#inactivity-processes), which notifies makers of their inactive resources and asks for approval to delete them.
  
  One of the main goals of Managed Environments and the CoE Starter Kit is to provide more insights, allowing admins to take action. The CoE kit provides more capabilities, which can reduce the burden on the admin dealing with inactive resources, as the CoE can direct resource management to the maker thus making the owner responsible for their own resources.

- **[Sharing limits](/power-platform/admin/managed-environment-sharing-limits)**

  The CoE Starter Kit can't limit sharing on resources. Proactive governance can only be done through Managed Environments. The [Compliance process](example-processes.md) in the CoE Starter Kit offers a reactive way to identify highly shared resources.
  
  This process identifies highly shared resources and asks makers to provide additional information, so that admins can better support solutions. For example, admins can move resources to a dedicated environment. With the Power BI dashboard, admins can also identify highly shared resources.

- **[Data policies](/power-platform/admin/managed-environment-data-policies)**

  Managed Environments allows you to see what data policies apply to the environment. The [DLP Editor](core-components.md), part of the CoE Starter Kit, can also show you data policies that are applied to an environment. The DLP Editor shows you the impact of data policies on existing apps and flows in the environment.

> [!NOTE]
> The CoE Starter Kit offers capabilities that aren't yet met with Managed Environments such as bulk updating permissions, cleaning up abandoned resources, surveying makers and calculating the ROI of ideas.

### Tenant-level analytics

[Tenant-level analytics](/power-platform/admin/tenant-level-analytics) in Power Platform admin center offer a great way to get a holistic overview of usage and inventory of your apps, flows, makers and environments. The analytics allow you to identify metrics like top used apps and top makers.

The [Power BI dashboard](/power-platform/guidance/coe/power-bi) in the CoE Starter Kit combines your tenant-level inventory and usage data with your organizations data for more granular insights into what departments, cities, and countries/regions are using Power Platform.

A broader range of customizable filters is available so you can view your inventory by connector, classification (premium/standard), or number of users with the shared app.

Tenant-level insights in the Power Platform admin center provide you with a great starting point to get familiar with your tenants adoption of Power Platform. As your need for those insights matures, you can explore the rich and customizable reports of the CoE Starter Kit.

## Next steps

- Explore the [Power Apps admin documentation](../../admin/admin-documentation.md).

- Find training resources like guided learning and step-by-step guides at [aka.ms/PowerPlatformLabs](https://aka.ms/powerplatformlabs).

- Read up on customer success stories and find resources relevant to your experience, technical background, and skill level at [aka.ms/PowerPlatformResources](https://aka.ms/powerplatformresources).

- Get started with the Microsoft Power Platform [learning path](/learn/paths/create-powerapps/): a free online and interactive training platform.

- Get familiar, as an admin, with the administration and governance of Microsoft Power Platform: [aka.ms/PowerAppsAdminWhitepaper](https://aka.ms/powerappsadminwhitepaper).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
