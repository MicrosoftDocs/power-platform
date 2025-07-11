---
title: CoE Starter Kit overview
description: Learn how to set up a Power Platform CoE using the CoE Starter Kit, tailored to your organization's needs.
#customer intent: As a business decision maker, I want to evaluate the CoE Starter Kit so that I can determine its alignment with our organizational goals.  
author: manuelap-msft
ms.topic: overview
ms.date: 07/11/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:07/11/2025
---

# CoE Starter Kit overview

The Power Platform CoE Starter Kit is a collection of components and tools designed to help you develop a strategy for adopting and supporting Power Platform. The kit doesn't represent the entire Center of Excellence or CoE. Managing a CoE requires more than tools. A CoE needs people, communication, and defined requirements and processes. Tools are a means to an end, and each organization must thoughtfully design its CoE based on its unique needs and goals.

Learn more about creating a Center of Excellence for Power Platform adoption in [Establish a Microsoft Power Platform Center of Excellence](../adoption/coe.md).

## What is the CoE Starter Kit?

The CoE Starter Kit is a set of templates designed to help you develop a strategy for adopting, maintaining, and supporting Power Platform. The kit includes: 

- Multiple Power Apps and Power BI analytics reports to view and interact with the data collected. 
- Assets such as templates and suggested patterns and practices for implementing CoE efforts.
- Automation and tooling to build the monitoring and automation necessary to support a CoE.
- Multiple apps and Power BI analytics to view and interact with the data you collect. 

The foundation of the kit is a Microsoft Dataverse data model and workflows to collect resource information across the tenant environments.

Download the most recently updated assets from the [coe-starter-kit](https://aka.ms/CoEStarterKitRepo) GitHub repository.

> [!NOTE]
> Although the kit's underlying features and components (such as Dataverse, admin APIs, and connectors) are fully supported, the kit itself represents sample implementations. You'll need to create your own vision for Power Platform adoption and customize the kit's features to reflect the administrative and governance goals of your organization.

> [!TIP]
> If you face issues with:
> 
> - **Using the kit**: Report your issue at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues). Microsoft Support might not be able to help you with issues related to the kit, but can assist with related platform and feature issues.
> - **Core features of Microsoft Power Platform**: Use your standard channel to contact Support.

## Get started using the CoE Starter Kit

First, [install the CoE Starter Kit solution](setup.md). Then start to become familiar with the resources in your tenant.

> [!NOTE]
> The following steps are examples of what you can do with the CoE Starter Kit. Explore the rest of the guidance to discover what's available and to use the kit effectively.

<!-- Add links to adoption articles that cover steps 3 and 4 in-depth or just remove? Trim the image or replace.  -->

1. Launch the Power BI dashboard and familiarize yourself with resources and makers that are already in your environments.

   :::image type="content" source="media/coe1.PNG" alt-text="Screenshot of the CoE Power BI dashboard.":::

1. Identify orphaned apps and assign them to new owners by using the embedded app in the Power BI dashboard.

1. Start planning your [governance strategy](../adoption/common-vision/establish-coe.md). 

    Start by asking:

      - What are the requirements of a compliant app or maker?
      - What information do you need per app or maker?
      - What happens to noncompliant apps and makers?
      - How do you plan to support your maker community in building compliant apps that follow best practices?
      - What actions do you plan to take based on your collected information?

1. Embrace your maker community and develop a nurture and adoption strategy. Think about how to onboard new makers. Organize internal events such as training workshops and hackathons. Put together templates and best practices for your makers to use. Learn more in [Nurture your Power Platform community](../adoption/nurture-best-practices.md).

   :::image type="content" source="media/coe5.PNG" alt-text="Screenshot of an email that welcomes new makers, presenting information on Power Apps and Power Automate including resources to get started.":::

## Use the CoE Starter Kit alongside Automation Kit

The [Automation Kit](https://aka.ms/automationcoe) is set of tools that accelerates the use and support of Power Automate for desktop for automation projects. The kit provides tools that help you manage automation projects and monitor them to estimate savings and return on investment (ROI).

The kit is especially useful to an Automation Center of Excellence (CoE) team, which is a team of experts who support automation within your organization. This team typically has solid knowledge of Power Automate for desktop, sets up and maintains the Automation Kit, and maintains configuration data such as departments, process categories, goals, and more.

The Automation Kit can be used standalone or alongside the CoE Starter Kit.

## Administrative tools available

A Power Platform CoE manages Power Platform administration, nurturing, and operations support. Admin and governance tools fall into three broad categories:

| Admin center | Platform extensions | Templates and customizations |
|--------------|---------------------|------------------------------|
| [Power Platform admin center](../../admin/index.yml) features help you complete tasks: <br>- Environment and environment security management<br>- Data loss prevention (DLP) policy management<br>- Data integration and gateway management<br>- Admin analytics: View capacity and activity on Microsoft Dataverse, Power Apps, and Power Automate<br>- Support ticket requests | Connectors provide access to the same APIs that the products and admin centers use. <br><br>These libraries are exposed through the connectors library to help users create custom solutions to execute administrative or governance-related tasks.<br>Learn more in: <br>- [Power Platform for Admins](/connectors/powerplatformforadmins/)<br>- [Power Apps for Admins](/connectors/powerappsforadmins/)<br>- [Power Automate Management](/connectors/flowmanagement/)<br>- [Power Apps for Makers](/connectors/powerappsforappmakers/) | The CoE Starter Kit falls into this category. The CoE templates use the admin connectors in combination with other connectors and formulas to achieve specific goals. <br><br>**Note:** The nature of a template is to provide a good solution for a specific task, but it might not have the exact functionality that you need. You might have to adjust it to achieve what you're looking for. |

## How to use the CoE Starter Kit alongside Power Platform admin center

Managed Environments and tenant-level analytics assist with administrative tasks, such as managing Power Platform at scale and providing insights into usage and inventory.

<!-- Still true below? See 2nd paragraph, for instance. -->

### Managed Environments for Power Platform

[Managed Environments](/power-platform/admin/managed-environment-overview) is a suite of capabilities that allows admins to manage Power Platform at scale with more control, less effort, and more insights. The capabilities are available out of the box from within the Power Platform admin center. Managed Environment capabilities can be used standalone, or alongside capabilities of the CoE Starter Kit to administer and govern your Power Platform adoption.

The CoE Starter Kit encourages experimentation and innovation with an open-source, low-code model influenced by customer feedback. Managed Environments will replace certain features in the CoE Starter Kit eventually. As the evolution of Managed Environments continues, new experiments and innovations will be added to the CoE Starter Kit to gauge interest.

Start with the out-of-the-box capabilities in Power Platform admin center and Managed Environments. These capabilities are robust and fully supported. If you need more capabilities to govern your tenant, check if features in the CoE Starter Kit complement what you get out of the box.

<!-- Stopping here -->

#### Individual features

Let's consider the individual features of Managed Environments to see how they compare to what's in the CoE Starter Kit.

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
> The CoE Starter Kit offers capabilities that aren't yet met with Managed Environments, including as bulk updating permissions, cleaning up abandoned resources, surveying makers and calculating the ROI of ideas.

### Tenant-level analytics

[Tenant-level analytics](/power-platform/admin/tenant-level-analytics) in Power Platform admin center offer a great way to get a holistic overview of usage and inventory of your apps, flows, makers, and environments. The analytics allow you to identify metrics like top used apps and top makers.

The [Power BI dashboard](/power-platform/guidance/coe/power-bi) in the CoE Starter Kit combines your tenant-level inventory and usage data with your organization's data for more granular insights into what departments, cities, and countries/regions are using Power Platform.

A broader range of customizable filters is available so you can view your inventory by connector, classification (premium/standard), or number of users with the shared app.

Tenant-level insights in the Power Platform admin center provide you with a great starting point to get familiar with your tenants adoption of Power Platform. As your need for those insights matures, you can explore the rich and customizable reports of the CoE Starter Kit.

## Next steps

- Explore the [Power Platform admin documentation](../../admin/admin-documentation.md).
- Find training resources like guided learning and step-by-step guides at [aka.ms/PowerPlatformLabs](https://aka.ms/powerplatformlabs).
- Read up on customer success stories and find resources relevant to your experience, technical background, and skill level at [aka.ms/PowerPlatformResources](https://aka.ms/powerplatformresources).
- Get started with Microsoft Power Platform [training](/training/powerplatform/).
- Learn more about Power Platform adoption [Microsoft Power Platform guidance documentation](../index.yml).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
