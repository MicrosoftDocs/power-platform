---
title: "Power Platform adoption maturity model: Goals and Opportunities - Microsoft Power Platform | MicrosoftDocs"
description: "This article describes goals and opportunities per maturity stage in the Power Platform adoption maturity model."
author: manuelap-msft

ms.subservice: guidance
ms.topic: conceptual
ms.date: 10/31/2021
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---
# Power Platform adoption maturity model: Goals and opportunities

The goal of the Power Platform adoption maturity model is to help organizations and their partners to think through how they can improve their capabilities and decide which ones matter most. These decisions should be based not just on the technology capabilities but also on the digital transformation strategy of the organization.

Let’s now look in detail at the five stages of the model and the opportunities within each stage:

## Level 100 – Initial

*This phase describes the starting point for use of a new or undocumented process.* In the Initial phase the organization has pockets of success or experimentation with Microsoft Power Platform, but without any visibility into organization-wide adoption and use.  There's no overall strategy or governance approach, apps are largely in the default environment, and no data loss prevention (DLP) policies have been put in place.  Apps are mostly used by a single team and supported by the makers. Apps primarily use Excel and SharePoint as their data sources. The organization sees the potential of a strategic investment in Power Platform, but has no clear path forward for organization-wide execution.

### Opportunities

:::row:::
   :::column span="":::
      ![Organize training events](media/adoption-1.png "Organize training events")
      Organize [training events](https://aka.ms/powerappsdemos), [hackathons](hackathons.md), and [lunch and learn sessions](in-a-day.md#lunch-and-learn).
   :::column-end:::
   :::column span="":::
   ![Find and nurture champions](media/adoption-2.png "Find and nurture champions")
      Find and [nurture champions](champions.md), recognize early success.
   :::column-end:::
:::column span="":::
![Get key sponsors on board](media/adoption-3.png "Get key sponsors on board")
      Get key sponsors and teams on board as you review the [roles and responsibilities](roles.md) needed to execute your Power Platform adoption.
   :::column-end:::
:::row-end:::

## Level 200 – Repeatable

*This phase describes a process that is at least documented sufficiently such that repeating the same steps may be attempted.* In the context of Microsoft Power Platform, organizations in the Repeatable stage are taking what they’ve learned in the Initial stage to put structure around the deployment of Power Platform, often through controls implemented by a central IT team or other team focused on Power Platform.  

The [Center of Excellence (CoE) Starter Kit](../coe/starter-kit.md) is deployed to provide tenant-wide visibility into the use of Power Platform and begin to identify, if not control, applications that are beginning to become broadly used in the organization. Environments are used as needed, but in an ad hoc manner—for example, various production environments and different DLP policies might be created without a consistent strategy. These organizations sometimes believe that the use of Power Platform is running “out of control” until they shape their use of the administrative and governance controls available for Power Platform, transitioning to the Defined stage.

### Opportunities

:::row:::
   :::column span="":::
   ![Gain tenant-wide oversight of your usage](media/adoption-4.png "Gain tenant-wide oversight of your usage")
      Gain tenant-wide oversight of resources being created in your tenant.
   :::column-end:::
   :::column span="":::
      ![Establish DLP policies](media/adoption-5.png "Establish DLP policies")
      [Establish DLP policies](dlp-strategy.md) in the default environment and mitigate the risk of apps and flows breaking by performing a [DLP Impact Analysis](../coe/core-components.md#dlp-editor-v2) first.
   :::column-end:::
:::column span="":::
   ![Send a welcome email to new makers](media/adoption-6.png "Send a welcome email to new makers")
      Embrace new makers with a [welcome email](onboard-makers.md), informing them of internal training resources and policies.
   :::column-end:::
:::row-end:::

## Level 300 – Defined

*This phase describes a process that is defined/confirmed as a standard business process.* The Defined organization is standardizing the repeatable practices that evolved in the Repeatable phase. For example, environment and DLP requests are automated, solutions are used to move apps and flows between environments, and makers are starting to share common components. The organization is achieving measurable success with Microsoft Power Platform to digitally transform and has a defined Power Platform Center of Excellence team.  Much of this transformation may still reflect the organic growth that got the organization to this point, but the Center of Excellence team is working to automate those processes and define standard approaches that will move the organization to the Capable stage.

### Opportunities

:::row:::
   :::column span="":::
      ![Develop an environment strategy](media/adoption-7.png "Develop an environment strategy")
      Develop an [environment strategy](environment-strategy.md) and configure layers of security in a way that supports productive development in your organization, while securing and organizing resources.
   :::column-end:::
   :::column span="":::
      ![Establish tiers of application support](media/adoption-8.png "Establish tiers of application support")
     Define [tiers of application support](environment-strategy.md#factors-that-influence-provisioning) – taking into account the level of complexity, how critical the app is, and users impacted by the application.
   :::column-end:::
:::column span="":::
   ![Share your success stories](media/adoption-9.png "Share your success stories")
      Celebrate your makers and champions by [sharing their success stories](show-and-tell.md), and focus on the business value and impact they have on the organization.
   :::column-end:::
:::row-end:::

## Level 400 – Capable

*This phase describes a process that is quantitatively managed in accordance with agreed-upon metrics.* The Capable organization has standard processes for managing and monitoring Microsoft Power Platform.  These processes, described during the Defined stage, are now largely automated and are well understood by makers.  Power Platform capabilities are being used to transform the business broadly and for enterprise-critical apps and integrations. Platform Champions have established channels for sharing best practices, training new makers, and conducting regular hackathons.  Standard, branded app templates and components are available to all makers. Business value assessments are carried out to measure and understand the impact of Power Platform.

### Opportunities

:::row:::
   :::column span="":::
      ![Create an app catalog](media/adoption-10.png "Create an app catalog")
      Create an [app catalog](../coe/core-components.md#app-catalog) to make apps more discoverable and avoid duplication.
Create [shared component libraries](reusable.md) with common design patterns, such as headers and navigation to ensure consistency across apps.
   :::column-end:::
   :::column span="":::
      ![Use approvals and Teams to automate communication](media/adoption-11.png "Use approvals and Teams to automate communication")
     Automate the communication between CoE, IT, and admins through approvals and Microsoft Teams messages.
   :::column-end:::
:::column span="":::
   ![Define key responsibilities for your CoE](media/adoption-12.png "Define key responsibilities for your CoE")
      Define [key responsibilities for your CoE](coe.md), admins, and makers and ensure they are understood and agreed to by everyone.
   :::column-end:::
:::row-end:::

## Level 500 – Efficient

*This phase describes a process that is quantitatively managed in accordance with agreed-upon metrics.*  In the context of Microsoft Power Platform, in the Efficient stage the organization has proven the capabilities of Power Platform to rapidly transform mission-critical capabilities.  Standardized, automated processes and an established community of experts allow new digitization opportunities to be implemented rapidly, allowing the organization to recognize value quickly and begin to integrate more advanced capabilities, such as AI. Fusion teams enable legacy capabilities and modern cloud architecture to be used easily within Power Platform, unlocking broad use of existing data and automation. In organizations at the Efficient stage, Power Platform is a key part of the digital transformation strategy and enterprise architecture in the organization. Organizations at this stage have exec sponsorship for Power Platform. Organizations at the Efficient stage influence best practices in the community and drive new uses of Power Platform.

### Opportunities

:::row:::
   :::column span="":::
      ![Use the Innovation Backlog app to submit ideas](media/adoption-13.png "Use the Innovation Backlog app to submit ideas")
      Enable everyone to [submit ideas](../coe/use-innovationbacklog.md), describe pain points, and pick the most valuable ideas for development. Build a portfolio for your career development opportunities. Provide “big picture” dashboards emphasizing the impact of the platform.
   :::column-end:::
   :::column span="":::
      ![Simplify application lifecycle management](media/adoption-14.png "Simplify application lifecycle management")
     [Simplify application lifecycle management](../coe/almaccelerator-components.md). Make it easier for makers to manage their solutions and deployment.
   :::column-end:::
:::column span="":::
   ![Influence our best practices by sharing your story](media/adoption-15.png "Influence our best practices by sharing your story")
      [Tell your story](https://aka.ms/powerplatformstories). Influence our best practices and inspire other leaders to go on the same journey.
   :::column-end:::
:::row-end:::

> [!div class="nextstepaction"]
> [Next step: Detailed capabilities](maturity-model-details.md)
