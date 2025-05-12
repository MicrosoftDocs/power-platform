---
title: "Power Platform adoption maturity model: Goals and Opportunities - Microsoft Power Platform | MicrosoftDocs"
description: "This article describes goals and opportunities per maturity stage in the Power Platform adoption maturity model."
author: manuelap-msft

ms.subservice: guidance
ms.topic: concept-article
ms.date: 06/13/2024
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Power Platform adoption maturity model: Goals and opportunities

The goal of the Microsoft Power Platform adoption maturity model is to help organizations and their partners improve their capabilities and decide which ones matter most. These decisions are based not only on the technology capabilities but the digital transformation strategy of the organization.

This article examines five stages of the model and the opportunities within each stage.

## Level 100 – Initial

*The initial phase describes the starting point for use of a new or undocumented process.*

An *Initial* organization has pockets of success or experimentation with Power Platform, but without any visibility into organization-wide adoption and use. There's no overall strategy or governance approach, apps are largely in the default environment, and no data loss prevention (DLP) policies are in place.

Apps are mostly used by a single team and supported by the makers. Apps primarily use Excel and SharePoint as their data sources. The organization sees the potential of a strategic investment in Power Platform, but has no clear path forward for organization-wide execution.

### Opportunities – Initial

:::row:::
   :::column span="":::
       :::image type="content" source="media/adoption-1.png" alt-text="Screenshot that shows the organization of training events." lightbox="media/adoption-1.png":::
       Organize [training events](https://aka.ms/powerappsdemos), [hackathons](hackathons.md), and [lunch and learn sessions](in-a-day.md#lunch-and-learn).
   :::column-end:::
   :::column span="":::
       :::image type="content" source="media/adoption-2.png" alt-text="Screenshot showing champions." lightbox="media/adoption-2.png":::
       Find and nurture [champions](champions.md) or recognize early success.
   :::column-end:::
   :::column span="":::
       :::image type="content" source="media/adoption-3.png" alt-text="Screenshot showing sponsors." lightbox="media/adoption-3.png":::
       Get key sponsors and teams as you review the [roles and responsibilities](roles.md) needed for your Power Platform adoption.
   :::column-end:::
:::row-end:::

## Level 200 – Repeatable

*This phase describes a process well-documented, so you can repeat the same steps if needed.*

A *Repeatable* organization takes what it learned in the Initial stage to put structure around the deployment of Power Platform. A central IT team or other team focused on Power Platform implement these controls.  

The [Center of Excellence (CoE) Starter Kit](../coe/starter-kit.md) is deployed to provide tenant-wide visibility into the use of Power Platform. You can begin to identify and control applications that are starting to be broadly used in the organization.

Environments are used as needed. For example, various production environments and different DLP policies might be created without a consistent strategy. These organizations sometimes believe Power Platform is running "out of control" until they shape administrative and governance controls for Power Platform, transitioning to the [Defined](#level-300--defined) stage.

### Opportunities – Repeatable

:::row:::
   :::column span="":::
       :::image type="content" source="media/adoption-4.png" alt-text="Screenshot that shows a gain in tenant-wide oversight of resources being created in your tenant." lightbox="media/adoption-4.png":::
       Gain tenant-wide oversight of resources being created in your tenant.
   :::column-end:::
   :::column span="":::
       :::image type="content" source="media/adoption-5.png" alt-text="Screenshot that shows where you can establish DLP policies." lightbox="media/adoption-5.png":::
       [Establish DLP policies](dlp-strategy.md) in the default environment. Mitigate the risk of apps and flows breaking by performing a [DLP Impact Analysis](../coe/core-components.md#dlp-impact-analysis) first.
  :::column-end:::
  :::column span="":::
      :::image type="content" source="media/adoption-6.png" alt-text="Screenshot that shows where to send a welcome email to new makers." lightbox="media/adoption-6.png":::
      Embrace new makers with a [welcome email](onboard-makers.md), informing them of internal training resources and policies.
  :::column-end:::
:::row-end:::

## Level 300 – Defined

*This phase describes a process that is defined/confirmed as a standard business process.*

A *Defined* organization standardizes the repeatable practices that evolved in the Repeatable phase. You can define practices like environment and DLP requests automation, solutions that move apps and flows between environments, and commonly shared components among makers.

The organization is achieving measurable success with Power Platform to digitally transform and has a defined Power Platform Center of Excellence team.

Much of this transformation might reflect the organic growth of the organization. However, the Center of Excellence team is working to automate those processes and define standard approaches to move the organization to the Capable stage.

### Opportunities – Defined

:::row:::
   :::column span="":::
      :::image type="content" source="media/adoption-7.png" alt-text="Diagram that shows an environment strategy." lightbox="media/adoption-7.png":::
      Develop an [environment strategy](environment-strategy.md) and configure layers of security to support productive development in your organization, while securing and organizing resources.
   :::column-end:::
   :::column span="":::
      :::image type="content" source="media/adoption-8.png" alt-text="Diagram that describes the tiers of application support." lightbox="media/adoption-8.png":::
      Define [tiers of application support](environment-strategy.md#factors-that-influence-provisioning) based on the level of complexity, the criticality of the app, and users impacted by the application.
   :::column-end:::
   :::column span="":::
       :::image type="content" source="media/adoption-9.png" alt-text="Screenshot that shows a success story in an article." lightbox="media/adoption-9.png":::
       Celebrate your makers and champions by [sharing their success stories](show-and-tell.md). Focus on the business value and impact they have on the organization.
   :::column-end:::
:::row-end:::

## Level 400 – Capable

*This phase describes a process that is quantitatively managed in accordance with agreed-upon metrics.*

A *Capable* organization has standard processes for managing and monitoring Power Platform. Makers now automate and deeply understand the processes of the Defined stage.

Power Platform capabilities transform the business broadly and for enterprise-critical apps and integrations. Platform champions establish channels for sharing best practices, training new makers, and conducting regular hackathons.

Standard, branded app templates and components are available to all makers. Business value assessments are carried out to measure and understand the impact of Power Platform.

### Opportunities – Capable

:::row:::
    :::column span="":::
        :::image type="content" source="media/adoption-10.png" alt-text="Screenshot that shows where you can create an app catalog in Power Platform." lightbox="media/adoption-10.png":::
        Create an [app catalog](../coe/core-components.md#app-catalog) to make apps more discoverable and avoid duplication. Create [shared component libraries](reusable.md) with common design patterns, such as headers and navigation to ensure consistency across apps.
    :::column-end:::
    :::column span="":::
        :::image type="content" source="media/adoption-11.png" alt-text="Screenshot that shows where to use approvals and Teams to automate communication." lightbox="media/adoption-11.png":::
        Automate the communication between CoE, IT, and admins through approvals and Teams messages.
   :::column-end:::
   :::column span="":::
       :::image type="content" source="media/adoption-12.png" alt-text="Screenshot that shows where you can define key responsibilities for your CoE." lightbox="media/adoption-12.png":::
       Define [key responsibilities for your CoE](coe.md), admins, and makers to ensure they're understood and agreeable to everyone.
   :::column-end:::
:::row-end:::

## Level 500 – Efficient

*This phase describes a process that is quantitatively managed in accordance with agreed-upon metrics.*

An *Efficient* organization proves the capabilities of Power Platform to rapidly transform mission-critical capabilities. Standardized automated processes and an established community of experts allow new digitization opportunities to be implemented rapidly. These opportunities allow the organization to recognize value quickly and begin to integrate more advanced capabilities, such as AI.

Fusion teams enable legacy capabilities and modern cloud architecture to be used easily within Power Platform, unlocking broad use of existing data and automation.

In organizations at the Efficient stage, Power Platform is a key part of the digital transformation strategy and enterprise architecture in the organization. Organizations at this stage have executive sponsorship for Power Platform and influence best practices in the community to drive new uses of Power Platform.

### Opportunities

:::row:::
    :::column span="":::
        :::image type="content" source="media/adoption-13.png" alt-text="Screenshot that shows the submitted ideas page." lightbox="media/adoption-13.png":::
        Enable everyone to [submit ideas](../coe/use-innovationbacklog.md), describe pain points, and pick the most valuable ideas for development. Build a portfolio for your career development opportunities. Provide big-picture dashboards emphasizing the impact of the platform.
    :::column-end:::
    :::column span="":::
        :::image type="content" source="media/adoption-14.png" alt-text="Screenshot of application lifecycle management (ALM)." lightbox="media/adoption-14.png":::
        [Simplify application lifecycle management](../coe/almaccelerator-components.md). Help makers more easily manage their solutions and deployment.
    :::column-end:::
    :::column span="":::
        :::image type="content" source="media/adoption-15.png" alt-text="Screenshot of the Microsoft Power Platform Stories website." lightbox="media/adoption-15.png":::
        [Tell your story](https://aka.ms/powerplatformstories). Influence our best practices and inspire other leaders to go on the same journey.
    :::column-end:::
:::row-end:::

## See also

[Detailed capabilities](maturity-model-details.md)
