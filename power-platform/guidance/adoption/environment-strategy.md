---
title: Develop a tenant environment strategy to adopt Power Platform at scale
description: Learn how to best use the features of the platform to implement an environment strategy that can allow your adoption of Power Platform to reach enterprise scale.
#customer intent: As a Power Platform admin, I want to develop a tenant environment strategy for Power Platform so that I can manage and secure environments at enterprise scale.  
author: robstand
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/02/2025
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.custom: bap-template
ms.subservice: guidance
---
 
# Develop a tenant environment strategy to adopt Power Platform at scale

Every organization's journey to adopt Microsoft Power Platform is unique. A tenant environment strategy lays the foundation to help accelerate usage in a manageable and secure fashion.

This article shows you how to align your Power Platform tenant environment strategy with the product capabilities and vision. You learn how to best use the latest features of the platform to implement a strategy that can allow your adoption of Power Platform to reach enterprise scale.

## Introduction

Power Platform empowers organizations to build low-code solutions for rapid innovation. These solutions can focus on productivity for individuals and small teams, or apply across the organization. They can also extend to business processes, including external customers and partners. Supporting these solutions are Power Platform environments where the low-code resources are built, tested, and used. As an organization increases its adoption of Power Platform, implementing a good tenant environment strategy is essential to make it manageable and secure as the number of environments grows.

To help you be more successful, this article guides you on how best to use the features available to establish your first environment strategy or evolve your current plans. We also outline our vision for how these features are intended to work together and how they'll evolve for managing Power Platform at scale. In this guidance, we establish how to properly route new users to environments and group environments to consistently apply governance, security rules, and other important aspects of a tenant environment strategy. We also provide detailed steps to secure your default environment, which is a critical first step in implementing an environment strategy.

While many perspectives are available for managing Power Platform environments, the approach in this article aligns with Microsoft's latest product direction and uses current features and near-term planned enhancements. This updated guidance can help you ensure that you use only the environment features and options that are strategic to how Microsoft intends for you to manage environments at scale.

## Microsoft's tenant environment strategy vision

Many organizations start their Power Platform journey with personal productivity apps and automations built and running in a shared central environment called the _default environment_. These resources often use only the basic capabilities included with Microsoft 365 and don't use the full capabilities of Power Platform. As this initial adoption accelerates, Microsoft provides organizations with an on-ramp to an environment strategy for enterprise scale adoption of the full Power Platform capabilities. These premium governance capabilities become available when users have a premium Power Platform (Power Apps, Power Automate, Microsoft Copilot Studio, and Dynamics 365) license. The [Power Platform adoption maturity model](/power-platform/guidance/adoption/maturity-model-details) provides more insights to help organizations define their roadmap to achieve enterprise scale adoption beyond their environment strategy. This approach can help organizations mature from basic personal productivity to enterprise-scale adoption of Power Platform.

Power Platform administrative, governance, and security features allow organizations to adopt and manage Power Platform for enterprise productivity and enterprise app usage at scale. Using Managed Environments activates a set of premium capabilities that enable greater visibility and control and reduce the manual effort to administer and secure environments. Using these capabilities, you can ensure consistent application of your governance and security policies. Admins can transition into an enterprise-scale, environment strategy using these capabilities. Spending less time and effort on the administration helps reduce the overall total cost of ownership (TCO) of the platform as your organization scales usage.

A key element of the transition to enterprise scale is to enhance the shared, central environment strategy for makers by making it easier for them to use personal, development environments. In a shared, central environment strategy, makers build, use, and share apps in the default environment. This strategy can result in lack of isolation and makers encroaching on each other. Imagine if everyone in the company shared a single OneDrive folder for all their documents. Instead, use environment features to guide makers to their own, personal environment where they can safely build their apps protected from makers working on unrelated assets, with simplified governance for admins. Coworkers can be added as more makers to these environments to collaborate on building solutions.

:::image type="content" source="./media/environment-strategy/image2.png" alt-text="Illustration of a central, shared environment strategy with four makers using the default environment on the left and an environment routing strategy with four makers routing to separate developer environments on the right.":::

*Figure: Illustration of a shared, central environment (left) and an environment routing strategy (right).*

Newly created maker environments can be automatically added to a group that applies rules to ensure that the environments have consistent governance and security policies. Admins can handle exceptions by moving a maker's environment to a group with relaxed rules.

Low-code resources created by the makers represent the initial stage in a resource's application lifecycle management (ALM) journey. As part of this initial stage, it's important to capture each version of a resource and be able to recreate it, if necessary. When the resource is ready to be shared, the maker can use the continuous integration attached to the developer environment to promote it to a production environment. Users can then run the resource, isolated from any ongoing maker activity.

Prioritize the built-in features of the platform for managing environments when possible, instead of building your own tools. If the built-in features don't meet your organization's unique requirements, use platform admin tooling to create custom tools. You should evaluate any custom tooling against new features as they become available. Monitoring Microsoft's platform roadmap and aligning it with your own roadmap makes this process easier.

Establish your environment strategy using the recommended environment capabilities tailored for your organization's unique needs. Don't think of creating your environment strategy as a one-time activity. It should evolve over time to incorporate new environment features as they become available.

## Features that support an enterprise-scale, environment strategy

[Environments](/power-platform/admin/environments-overview) are a building block for Power Platform administration, governance, and security. A complete feature overview is out of the scope of this article; however, this section highlights the features that support implementation of an environment strategy at enterprise scale.

- [**Types of environments**](#types-of-environments) describes the different uses of environments as part of your strategy.
- [**Managed Environments**](#managed-environments) provides a set of premium capabilities that make environments easier to manage at scale.
- **[License auto-claim](#license-autoclaim)** simplifies license assignment by allowing users to claim Power Apps per user licenses when they're needed, instead of requiring an admin to identify users who need licenses in advance.
- [**Environment groups and rules**](#environment-groups-and-rules) explains how to manage environments as groups and apply rules to groups to automate consistent governance policies.
- [**Default environment routing**](#default-environment-routing) automatically moves makers away from creating resources in the default environment to their own personal environment.
- [**Microsoft Dataverse**](#microsoft-dataverse) provides enhanced security and ALM.
- [**Preferred solutions**](#preferred-solutions) helps makers ensure that all the assets they build are in a Dataverse solution, making it easier to promote them to other environments.
- [**Pipelines in Power Platform**](#pipelines-in-power-platform) provides a simplified process for promoting assets from development to test and production environments, making continuous integration and deployment (CI/CD) available to all makers.
- [**Catalog in Power Platform**](#catalog-in-power-platform) allows makers to share components, like apps and flows, and more advanced starting points such as templates.

### Types of environments

The following table describes the types of environments you can create, their characteristics, and their intended uses.

| **Type**                      | **Characteristics and uses**                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Default                       | The environment that comes with every tenant. Many Microsoft 365 experiences use this environment for customizations and automations. This environment isn't intended for long-term or permanent work beyond the Microsoft 365 personal, productivity scenarios.             |
| Production                    | This environment is intended to be used for permanent work in an organization. Production environments support extended, back-up retention, from seven days to up to 28 days.       |
| Sandbox                       | These nonproduction environments support environment actions like copy and reset. Sandboxes are best used for testing and ALM build environments.                          |
| Developer                     | These special environments are intended as makers' personal development workspaces, which isolate low-code assets from users and other makers. Makers can have up to three developer environments. They don't count against your tenant capacity. Developer environments that haven't been used for 90 days are automatically turned off and then removed from your tenant if the owner doesn't respond to notifications. Dynamics 365 apps aren't available in developer environments. |
| Trial                         | These environments are intended to support short-term testing and proofs of concept. They're limited to one per user. Trial environments are automatically removed from your tenant after a short period of time.   |
| Microsoft Dataverse for Teams | These environments are automatically created when you create an app in Teams or install an app from the app catalog. The security model for these environments aligns with the team they're associated with.        |
| Support                       | These are special environments created by Microsoft Support to allow engineers to troubleshoot problems. These environments don't count against your tenant capacity.      |

When creating an overall tenant environment strategy, consider the different types to support your recommendations.

### Managed Environments

Environments have a base set of features and characteristics depending on the environment type. Managed Environments expand on the base features to provide a suite of premium capabilities that allow admins to more easily manage Power Platform at scale with more control, less effort, and more insights. These capabilities are unlocked when you set an environment as managed.

The following table lists the features of Managed Environments that are available, as of this writing. New features are added often, so check the [documentation](/power-platform/admin/managed-environment-overview) for the latest list. Although all the features can help you build an environment strategy, the features in italics are more relevant for the strategy that's outlined in this article.

| **More visibility** | **More control** | **Less effort** |
|-------------------------|-------------------------|-------------------------|
| <em>Usage insights<br /></br>Admin digest<br /></br>License reports<br /></br>Data policy view</em></br>Export data to Azure Application Insights<br /></br><em>AI-generated descriptions for all apps</em> | <em>Sharing limits</em><br /></br>Data policies for desktop flows<br /></br><em>Solution checker<br /></br>Maker welcome content<br /></br>IP firewall<br /></br>IP cookie binding</em><br /></br>Customer-managed keys<br /></br>Customer Lockbox<br /></br>Extended back-ups | <em>Easy activation<br /></br>Power Platform pipelines<br /></br>Environment routing<br /></br>Environment groups and rules</em><br /></br>Power Platform Advisor |

### License auto-claim

[Auto-claim policies](/power-platform/admin/auto-claim-licensing) automate the assignment of Power Apps and Power Automate licenses to users when they need one to use certain apps or features. Automation can help reduce the number of licenses consumed and avoid the overhead of manually assigning licenses.

After a policy is configured, any user in the organization who needs an individual Power Apps license is automatically granted one under the following conditions:

- If a user without a standalone Power Apps license launches an app that demands a premium license, the system automatically assigns the user a Power Apps per user license.

- If a user without a standalone Power Apps license launches an app in a Managed Environment, the system automatically assigns the user a Power Apps per user license.

Similarly, after a policy is configured, any user in the organization who needs an individual Power Automate license is automatically granted one under the following conditions:

- The user triggers, saves, or turns on a premium cloud flow with attended RPA (Robotic Process Automation).

- The user requests a Power Automate premium license.

We recommend configuring license auto-claim if your environment strategy includes Managed Environments. Users of apps and flows encounter the least amount of licensing friction, and you only consume licenses for users who are actively running apps or using Power Automate.

### Environment groups and rules

As Power Platform adoption in your tenant increases, so can the number of environments that require administration and governance. As the number of environments increases, the more challenging it becomes to ensure that you've applied consistent settings and governance policies on the environments. The [environment groups feature](../../admin/environment-groups.md) makes this easier, by allowing you to create named groups and associate environments with them, like placing related documents in a file folder.

Keep the following considerations in mind as you think about using environment groups:

- An environment must be managed to be included in a group.
- An environment can be in only one group at a time.
- An environment can be moved from one group to another.
- Environments in a group can be from multiple geographic regions.
- Groups can't contain other groups.

To help you apply consistent settings and governance, environment groups can have one or more of the following rules configured and turned on:

- Sharing controls for canvas apps
- Usage insights
- Maker welcome content
- Solution-checker enforcement
- Back-up retention
- AI-generated descriptions

A rule becomes active when it's published. Active rules are applied to all environments that are associated with the group.

When a group rule is managing a setting, individual environment settings are locked. The only way to change them is to modify the rule. If the environment is removed from the group, it keeps the group settings, but an environment admin can change them. This approach is important for an environment strategy because it ensures that an environment admin can't override the policies set for the group.  

Using environment groups allows you to organize your environments in logical ways, similar to your organization structure, product service hierarchy, or other frameworks that we explore later. The following diagram is a conceptual example of how the Contoso organization might think about organizing its environment groups.

:::image type="content" source="media/environment-strategy/image3.png" alt-text="Diagram illustrating an environment strategy for a Contoso tenant".:::

*Figure: Conceptualization of an environment strategy for a Contoso tenant.*

When you're planning the rules to configure, think through what you could apply at each level of the conceptual hierarchy. Although you can't configure the group hierarchy yet, you can use a combination of naming conventions and rule configuration to implement your conceptual design. For example, given the Contoso tenant conceptualization shown earlier, the following illustration represents the environment groups the organization could use to implement its design.

:::image type="content" source="media/environment-strategy/image4.png" alt-text="Diagram showing an example implementation of conceptual environment groups in the tenant.":::

*Figure: Example of implementing the conceptual environment groups into the actual tenant*

Later in this article, we explore more ways to use environment groups as part of a tenant environment strategy.

### Default environment routing

A key part of the environment strategy that we outline in this article is to move makers away from creating resources in the default environment. The [environment routing feature](../../admin/default-environment-routing.md) redirects makers into their personal development environment and creates new developer environments, as needed.

:::image type="content" source="media/environment-strategy/image5.png" alt-text="Diagram of a maker automatically redirected to a personal developer environment instead of the default environment when building apps.":::

*Figure: A maker is automatically redirected to a personal, developer environment instead of the default environment when building apps.*

The developer environments that are created by routing are managed by default. Users with Developer Plan licenses are limited to creating and previewing resources in the environment. To run the resources as a user, they need an appropriate [license](../../admin/managed-environment-licensing.md).

You can use environment routing by itself, but the recommended way is to use it with environment groups. When used this way, any environment that's created is associated with the group that you designate to contain all new developer environments, ensuring that it's immediately covered by your governance policies.

Makers are automatically assigned a security role that makes them an environment admin of their developer environment. When the environment is a part of an environment group, the maker&mdash;as the environment admin&mdash;can't change the environment settings because they're managed by the environment group rules. Only admins, who can modify the group rules, can make any changes.

You can impose even more control in two ways. First, you can disallow manual creation of developer environments in your tenant settings. When this option is set, makers can't create environments themselves in the admin portal. They also won't get one automatically created by the routing policy. Second, you can specify a security group, in the routing policy, to limit who can automatically get an environment created.

Initially, environment routing supports routing new and existing makers away from the default environment when they use *make.powerapps.com*. Over time, other Power Platform services will support the environment routing feature.

### Microsoft Dataverse

Dataverse securely stores and manages data that's used by applications. In the context of an environment strategy, the [Dataverse solution feature](/power-apps/developer/data-platform/introduction-solutions) lets you transport apps and components from one environment to another. Makers build their assets in containers—solutions—that track what they build. Solutions can easily be transported to other environments. Using this approach, you can separate developer environments, where makers build resources, from the production environments where they're used. Both makers and users benefit. Makers can continue to evolve their resources, and users aren't surprised by sudden changes. When makers are ready to publish their changes, they can request to promote the updated resource to the production environment.

Dataverse solutions are the mechanism for implementing ALM in Power Platform products like Power Apps and Power Automate. Pipelines in Power Platform use solutions to automate CI/CD of assets that makers build. Solutions can be exported from Dataverse and stored in a source control tool like Azure DevOps or GitHub. The solution in source control becomes the source of truth if you need to recreate the development environment. For example, if a maker built a popular app and then deleted the developer environment, an exported solution stored in source control could be used to recreate a viable development environment.

Another important consideration when you create an environment with Dataverse is whether any Dynamics 365 applications will be deployed to the environment. If the potential exists, you must enable Dynamics 365 when you create the environment or you won't be able to install Dynamics 365 apps later.

We recommended that you provision Dataverse in any environment where makers create assets that will be shared with other users. This strategy makes it easier for the assets to be ALM ready.

### Preferred solutions

When a maker creates a Dataverse asset in a Dataverse environment—and doesn't start from a custom solution—the asset is associated with the default solution and may also be associated with the Common Data Service default solution. The default solution is shared by all makers who create assets in the environment. Identifying which maker created specific components or which assets belong to specific apps is challenging, making it harder to promote a popular app to another environment for sharing with a larger audience. To do so, you need to promote all the assets in the default solution, which isn't ideal.

To support your environment strategy and make it easier to work with, makers should create a custom solution in their development environment, and then set it as the [preferred solution](/power-apps/maker/data-platform/preferred-solution) in the environment. Makers set the preferred solution in an environment to indicate which solution an asset they created should be associated with. Preferred solutions can help ensure that when makers use pipelines to promote their resources to other environments, the promoted solution contains all the required assets. Think of this as preparing the assets to be ALM-ready.

### Pipelines in Power Platform

As we've seen, a key tenet of a good environment strategy is to isolate where an asset is built from where it's deployed and used. This separation ensures that users who are trying to use an asset don't encounter downtime because a maker is updating it. However, it requires assets to be promoted to a production environment&mdash;ideally, as part of a Dataverse solution&mdash;before they can be used.

Dataverse solutions can be manually transported between environments. However, you can automate the process&mdash;and put policies in place to ensure that proper change management occurs&mdash;using [pipelines](/power-platform/alm/pipelines). Depending on the environment rules that you set in the [solution checker](/power-platform/admin/managed-environment-solution-checker), pipelines automatically enforce all the rules before the solution is deployed, preventing further deployment errors. The following diagram illustrates how pipelines can automate the promotion of an asset from development to production.

:::image type="content" source="media/environment-strategy/image6.png" alt-text="Diagram illustrating a pipeline to automate promoting an asset that's stored in source control from development, through test, to production.":::

*Figure: A pipeline automates promoting an asset that's stored in source control from development, through test, to production.*

You can configure the number of environments and processes, like approvals, that need to be included in a pipeline.

Pipelines work together with environment groups. They can be preconfigured for development environments to allow makers to easily start the promotion process by responding to a prompt when they try to share their assets with other users. As part of a deployment request using pipelines, makers can propose whom to share their assets with and the required security roles. A pipeline admin can approve or reject the request before deployment by ensuring least privileges for the maker who originated it.

Pipelines in Power Platform store the definitions of each pipeline in a host environment that Microsoft manages by default. However, you can define multiple host environments in your tenant that you manage, allowing you to handle unique requirements.

### Catalog in Power Platform

Organizations where developers and makers build and share components like apps, flows, and templates—advanced starting points—tend to get more value from Power Platform. [The Power Platform catalog](/power-apps/maker/data-platform/catalog-overview) makes it easy for makers to share their components and templates across environments.

The catalog is installed in an environment and can be installed with the pipeline host in the same environment. It's also possible to handle unique resource segmentation requirements by having multiple environments with a catalog installed.

### Feature roadmap

As Microsoft continues to evolve the features of Power Platform that support governance and administration, you can follow along in the [release planner](https://releaseplans.microsoft.com/en-US/?app=Governance+and+administration). You learn what's planned, what's in the upcoming release wave, and what you can try now. You can even create your own release plan by saving the items you want to follow.

## Foundation of an enterprise-scale environment strategy

We discussed our vision for a tenant environment strategy at enterprise scale and key environment features that support it. Now, we look at how you can use those features together as part of an environment strategy. Your strategy should be based on your organization's unique requirements, so let's start with a basic example before we tailor a strategy to meet your needs.

In this example, Contoso leadership wants to empower employees to take advantage of Power Platform and have identified the following high-level requirements:

- Employees need to be able to build automated, document approval processes and other Power Platform customizations with Microsoft 365.
- Employees should be able to build Power Apps and Power Automate automations to improve their personal productivity.
- The makers who are working on the company's Compliance Tracker app must be able to develop and maintain it.

To support these requirements, the Contoso admin and governance team developed the following environment topology:

:::image type="content" source="media/environment-strategy/image7.png" alt-text="Diagram of an environment topology with four environment groups, Development, Shared Development, UAT, and Production, with logos for the Power Platform apps each should support.":::

*Figure: Proposed environment topology for Contoso's Power Platform at scale project.*

Let's explore this environment topology diagram in detail.

The default environment is used to build Microsoft 365 productivity customizations. Data loss prevention policies and restrictions on sharing limit other types of maker activity and place guardrails around what makers can build in this environment.

Only admins are able to create trial, sandbox, and production environments. Makers use a custom Microsoft Form or another process to request a new environment. The [Microsoft Power Platform Center of Excellence (CoE) Starter Kit](../coe/starter-kit.md) includes [an environment request](../coe/setup-environment-components.md) that could be used.

Four environment groups are created: Development, Shared Development, UAT (user acceptance testing), and Production.

- An environment routing policy set for the Development group routes makers away from the default environment into their own developer environments. As new development environments are created, they're automatically associated with the Development group and its rules are applied.

- The Shared Development group supports environments that contain projects with multiple makers.

- The UAT group contains environments that are used to test resources before they're promoted to production.

- The Production group contains environments that host apps, flows, and other artifacts for production use.

This proposed topology is missing pipelines to automate promotion between development, test, and production environments. Let's add them now.

:::image type="content" source="media/environment-strategy/image8.png" alt-text="Diagram of the same environment topology with the addition of a pipeline host environment and pipelines between the host and development, UAT, and production environments.":::

*Figure: The same environment topology with pipelines connecting a pipeline host environment to development, test, and production environments.*

In the revised environment topology diagram, we've added a pipeline host environment and two pipelines. One pipeline moves resources from development to test and then to production environments. The pipeline rule on the Development group will be modified to use this pipeline. The other pipeline moves resources from the shared dev environment to test and then to production. The pipeline rule on the Shared Development group will be modified to use this pipeline.

This basic environment strategy provides a foundation that you can build on for other use cases, which we explore next.

## Environment strategies for specific scenarios

Here are some common use cases that you might need to incorporate in the foundation tenant environment strategy.

### Control which makers can create developer environments

By default, anyone who has a Power Platform Premium license, a Developer Plan license, or a Power Platform tenant admin role can create a developer environment from the admin portal.

In the foundation environment strategy, environment routing ensures that makers are directed away from the default environment, to a new developer environment that's created in the designated group. However, makers can still manually create developer environments that aren't placed in an environment group and don't have its rules applied.

To refine which makers are eligible for environment routing, specify a security group in the routing configuration. When a security group is configured, only members of the security group are routed. All others fall back to the default environment.

### Provide more flexibility to advanced makers

In the foundation environment strategy, all new maker environments are routed to a designated developer environment group. Typically, this group of environments has a fairly restrictive set of governance rules applied.

As makers become more advanced, you can allow them to request access to more capabilities. Instead of removing them from the original environment group and manually managing the exception, you can use another environment group to track these advanced makers.

:::image type="content" source="media/environment-strategy/image9.png" alt-text="Diagram illustrating the addition of makers with more skills to an environment for advanced makers  which has relaxed governance.":::

*Figure: Add more capable makers to an environment that has relaxed governance rules.*

### Organize developer environments by region or business unit

In the current implementation of environment routing, all new developer environments are created in a single environment group. What if you want to organize your makers' developer environments by region, for example, or business unit?

Use routing to direct makers into a new developer environment that's created in the designated group. Then you can move it to another group that's based on region, organizational unit, or other criteria, where you can apply more granular governance rules.

:::image type="content" source="media/environment-strategy/image10.png" alt-text="Diagram illustrating environment routing creating developer environments in the designated group, which are then moved to more structurally specific groups.":::

*Figure: After environment routing creates developer environments in the designated group, move them to more structurally specific groups.*

Moving environments is a manual action today, but you'll be able to automate it when the Power Platform admin connector supports the group feature in a future update.

### Develop an app for enterprise use

A team in your organization might be developing an app for enterprise-wide use. The team might be IT-driven or include both IT and business users (what's known as a fusion team).

In the simplest environment strategy, the project team builds in a shared environment that's either a sandbox or a production type. A developer environment type isn't the best way to support multiple makers collaborating on a resource. Makers need to communicate with one another to avoid collisions and conflicts in the shared environment.

Dedicated testing and production environments aren't required. The app could be tested in and deployed to organization-wide testing and production environments that host multiple applications.

:::image type="content" source="media/environment-strategy/image11.png" alt-text="Diagram illustrating two enterprise apps under development in dedicated environments, then tested and deployed in environments that are shared with other apps.":::

*Figure: Two enterprise apps under development in dedicated environments, then tested and deployed in environments that are shared with other apps.*

In a more advanced variation, each maker has an individual developer environment. This strategy has the benefit of providing greater isolation to the maker, but can make combining individual work in an integration environment more complicated. Although working in isolation can be helpful for larger, sophisticated teams, it can add unnecessary overhead to smaller teams that can be more successful collaborating in a shared development environment.

:::image type="content" source="media/environment-strategy/image12.png" alt-text="Diagram illustrating an enterprise app under development in individual environments, combined in a shared integration environment, and then tested and deployed in environments that are shared with other apps.":::

*Figure: Two makers working on the same app in individual developer environments must combine their work in a shared integration environment before it moves to testing and production.*

This variation commonly incorporates a source control strategy, with each development environment represented as a branch in source control that gets merged when changes are ready to be promoted. It's important to account for how the application will be maintained after the initial release.

For example, version 1.0 of the app might be in production while the team moves on to building version 2.0. Your environment strategy must support fixing a problem in version 1.0, while development of version 2.0 is underway.

:::image type="content" source="media/environment-strategy/image13.png" alt-text="Diagram of two versions of an app in development, test, and production simultaneously.":::

*Figure: Version 1.0 must be patched, tested, and deployed while version 2.0 is being developed, tested, and deployed.*

Environment groups offer multiple approaches to handling this enterprise app scenario. For example, this could be a single app group or could involve having separate groups for each development stage. In the best practices section, we explore how to evaluate the options.

### Minimize use of developer environments

Individual developer environments are the recommended way to provide makers a workspace to build low-code solutions. They offer the highest level of isolation from other makers. If your organization wants to minimize the number of developer environments, multiple shared environments are better than encouraging makers to build assets in the default environment.

In this scenario, you would restrict the creation of developer environments and create shared production-type development environments. You could organize these shared environments by organization structure, region, or other criteria. An environment group could contain them to ensure that they have consistent governance rules applied. Grant makers permission to create low-code assets in the environment that's assigned to them.

## Security as part of your environment strategy

Environments are a key component of using Power Platform securely. They represent security boundaries within your tenant that help protect apps and data. As part of your environment strategy, you must consider how your security requirements influence the number and purpose of the environments in your tenant.

Environments enable you to create multiple security boundaries within your tenant to protect apps and data. The protection provided by the environment can be adjusted to meet the necessary security protection by applying a configurable set of security features on the environment. A detailed discussion of individual environment security features is beyond the scope of this article. However, in this section we offer recommendations for how to think of security as part of your tenant environment strategy.

### Security at the tenant level

Most security settings that affect environments are configured for each environment individually. However, you can make some changes at the tenant level to help support your environment strategy.

- Consider [turning off the Share with Everyone feature](../adoption/secure-default-environment.md#limit-sharing-with-everyone) in Power Platform. Only admins would be able to share an asset with everyone.
- Consider [securing integration with Exchange](../adoption/secure-default-environment.md#secure-integration-with-exchange).
- [Apply cross-tenant isolation](../../admin/cross-tenant-restrictions.md) to help minimize the risk of data exfiltration between tenants.
- Restrict the creation of net-new production environments to admins. [Limiting environment creation](../../admin/control-environment-creation.md) is beneficial to maintain control in general, both to prevent unaccounted capacity consumption and to reduce the number of environments to manage. If users have to request environments from central IT, it’s easier to see what people are working on if admins are the gatekeepers.

### Secure the default environment

The default environment has a role in supporting Microsoft 365 productivity customizations. As part of the recommended environment strategy, though, it's best to minimize its use as much as possible. Instead, makers should build in their own isolated environments. Although you can't block access to the default environment, you can minimize what can be done in it.

First, use environment routing to direct makers to their own workspace to build low-code assets.

- Review who has admin access to the default environment and limit it to roles that need it.

- Consider renaming the default environment to something more descriptive, like "Personal Productivity."

    - Establish a data loss prevention (DLP) policy for the default environment that blocks new connectors and restricts makers to using only basic, unblockable connectors. Move all the connectors that can't be blocked to the business data group. Move all the blockable connectors to the blocked data group.

    - [Create a rule](../../admin/dlp-custom-connector-parity.md) to block all URL patterns used by custom connectors.

Securing the default environment is a priority. Implement it with tenant-level security as part of the first step in your environment strategy. Without these measures, makers can add more assets to the default environment. With these measures and environment routing in place, makers are encouraged to use their own environment.

Learn more: [Secure the default environment](secure-default-environment.md)

### Secure other environments

If your organization is like most, you have several environments in addition to the default environment. The level of security each one requires can vary depending on the apps and data it contains. Developer environments typically have more relaxed rules than production environments. Some production environments require the most protection possible.

As part of establishing your environment strategy, identify common levels of security for your environments and the features that protect each level, as in the following example.

:::image type="content" source="media/environment-strategy/image14.png" alt-text="Diagram showing the three levels of environment security, normal, medium, and high, and the security features that protect each one, such as DLP policies and Customer Lockbox.":::

*Figure: An example of three tiers of environment security and the security features that apply to environments in each tier.*

Incorporate the security levels you identify into your group strategy, and where possible, use rules to enable the security features in your environments. In this example, a rule limits sharing in all the environments that are designated as normal or medium security.

### Align environments to your data loss prevention strategy

Data policies are another important part of an overall governance effort to control the services used by low-code resources in an environment. Environment groups don't have a rule to apply a DLP policy to an environment. However, you can align your DLP strategy with your environment groups. For example, you could create a DLP policy with the same or a similar name as an environment group and apply it to environments in that group.

[Learn more about how to implement a DLP strategy](dlp-strategy.md).

:::image type="content" source="media/environment-strategy/image15.png" alt-text="Diagram illustrating the relationship between environment groups and similarly named data loss prevention policies that apply to them.":::

*Figure: In this example, environments in the Personal Dev group follow a DLP policy that blocks all non-Microsoft connectors.*

## Tailor an environment strategy for your organization

In earlier sections, we described our vision for how organizations can manage environments at scale. We explored essential features, how they contribute to an environment strategy, and what a foundation environment topology that uses them might look like. We gave examples of how to build on that foundation to accommodate common scenarios. Because every organization is unique, the next step is for you to tailor an environment strategy that meets your organization's needs.

### Start where you are

Whether your organization is new to Power Platform or has been using it for years, the first step is to evaluate your situation. Assess, at a high level, what's in your default environment, what other environments you have, and what they're being used for. Often an environment strategy is done as part of an overall effort to establish governance of Power Platform in an organization. If that is the case, you might already have established some of the governance vision that is required to tailor a strategy for your organization.

Organization information you should know includes:

- What is the vision for how Power Platform will be used in the organization?
- Who in the organization will be building low-code assets?

You need to make some key decisions:

- How will makers get new environments?
- Will you group your environments, and if so, how?
- What security levels are required for different environments, and how do environments get classified?
- How will you decide whether an app, automation, or Copilot will use an existing environment or a new one?
- Are there any gaps between the baseline features of the platform and your requirements that require a custom governance process?
- How will you handle any existing assets in the default environment?
- Do you have a tenant and environment DLP policy strategy, and if so, how does it align with the environment strategy you're creating?

You might find inspiration in the [cloud operating models](/azure/cloud-adoption-framework/operating-model/compare) that are part of the Cloud Adoption Framework for Azure.

### Fill gaps using the platform

You'll almost always find requirements that the platform's built-in capabilities don't satisfy. As you evaluate these gaps, consider the following possible outcomes of your evaluation:

- The gap is acceptable.
- The gap can be filled using the Power Platform Center of Excellence Starter Kit.
- The gap can be filled using the platform's capabilities, such as APIs, connectors and custom apps, or automations.
- The gap can be filled using a third-party tool or app.

#### CoE Starter Kit

The [Power Platform Center of Excellence Starter Kit](../coe/overview.md) is a collection of components and tools that are designed to help your organization adopt and support the use of Power Platform. A key aspect of the starter kit is its ability to collect data about platform usage across your environments, which can be helpful as you develop and evolve your environment strategy.

For example, the Environments Power BI dashboard offers an overview that helps you understand which environments exist in your tenant, who created them, and what assets they contain.

:::image type="content" source="media/environment-strategy/image16.png" alt-text="Screenshot of the environments overview dashboard in Power BI showing numeric tiles, charts, and report filters." lightbox="media/environment-strategy/image16.png":::

*Figure: The Environments dashboard in Power BI.*

The kit includes starting points or inspiration, such as a process that makers can use to [request new environments](../coe/env-mgmt.md) and changes to DLP policies for their environments.

:::image type="content" source="media/environment-strategy/image17.png" alt-text="Flow diagram illustrating admin and maker roles and actions in a process for requesting a new environment or modifying a DLP policy applied to an environment." lightbox="media/environment-strategy/image17.png":::

*Figure: Flow diagram illustrating an environment management process in the CoE Starter Kit.*

#### Platform programmability and extensibility

One of the great things about a low-code platform is that you can use it to build apps, automations, portals, and copilots to help you manage it. You also have access to lower-level tools that can be used to fill gaps in support of your environment strategy.

You can use the following connectors to build apps and flows:

- [Power Platform for Admins](/connectors/powerplatformforadmins/) and [Power Platform for Admins V2](/connectors/powerplatformadminv2/)
- [Power Apps for Admins](/connectors/powerappsforadmins/) and [Power Apps for Makers](/connectors/powerappsforappmakers/)
- [Power Automate Management](/connectors/flowmanagement/)

You can use the [Power Platform command-line interface (CLI)](/powerapps/developer/data-platform/powerapps-cli) to develop automations to help you manage the environment lifecycle and other tasks related to DevOps practices.

With [PowerShell cmdlets for Power Platform creators and administrators](../../admin/powerapps-powershell.md), you can automate many monitoring and management tasks.

The [Power Platform DLP SDK](../../admin/data-loss-prevention-sdk.md) can help you manage your tenant and environment data loss prevention policies.

## Best practice recommendations

In this section of the article, we build on the recommendations in the foundation and scenario-specific sections.

### New environments

As part of developing your strategy, consider when to create environments to support a workload. Your evaluation must balance the benefits of isolation that an environment provides, such as locking down particular environments for better security, with the disadvantages, like the friction users face when sharing data across apps.

When you're evaluating whether an app or an automation belongs in its own environment, assess the different stages of the app's life cycle separately. During development, isolation from other apps is important. When multiple apps are developed in a single environment, you risk creating cross-app dependencies.

As a general recommendation, when possible, development environments should be single-purpose, disposable, and easily recreated.

Testing multiple apps in the same environment makes sense if they run together in production. In fact, if you don't test with the apps that will be running in production, you risk not discovering compatibility problems.

When you evaluate the production environment for an app, keep the following considerations in mind:

- **Is the app compatible with existing apps in the environment?** For example, two apps that both use the Dataverse Contact table for different purposes might not be compatible. Are the apps compatible from a DLP policy perspective?

- **Are there special compliance or regulatory requirements for separation of data?** For example, does the sensitivity of the data require it to be isolated? Is there a requirement that data can't be included with other data?

- **Is the data highly confidential or sensitive? Would exfiltration cause monetary or reputational damage to the organization?** Isolating in a separate environment can allow for more control over security.

- **Does the app need data from other apps and need to be collocated with them?** For example, two apps that both use your Customer table should be hosted together. Separating them would create redundant data copies and create problems with maintaining the data.

- **Does the data require regional data residency?** In some scenarios, the same app or automation can be deployed to regional environments to ensure appropriate data isolation and residency.

- **Are most users in the same region as the environment?** If the environment is in EMEA, but most of the app's users are US-based, sharing an environment might not provide the best performance.

- **Will new admins be needed, or will the existing admins be sufficient?** If the new app requires more admins, are they compatible with the existing admins (since all will have admin permissions on all apps in the environment)?

- **What's the life expectancy of the app?** If the app or automation is temporary or short-lived, it might not be a good idea to install it in an environment with more permanent apps.

- **Will users have difficulty having to use multiple environments for different apps?** This can affect everything from finding an app on their mobile device to self-service reporting that has to pull data from multiple environments.

### Capacity

Each environment, except trial and developer environments, uses 1 GB to provision initially. Capacity is shared across the tenant so it needs to be allocated to those who need it.

Conserve capacity by:

- Managing shared test and production environments. Unlike shared development environments, permissions in test and production environments should be limited to user access for testing.
- Automate cleanup of temporary development environments and encourage use of trial environments for testing or proof-of-concept work.

### Environment groups

Environment groups are flexible and allow you to accommodate various use cases unique to your organizations. Here are a few ways you could consider grouping environments as part of your environment strategy:

- By service or component; for example, a ServiceNow service tree
- Development, test, and production
- Departments, business groups, or cost centers
- By Projects
- By location, if most environments in a location have similar governance needs; this can also help meet similar regional regulatory and legal compliance

:::image type="content" source="media/environment-strategy/image18.png" alt-text="Diagram showing a Finance environment group and an HR environment group with different rules.":::

*Figure: Environment groups for two different departments with different rules.*

#### Naming environments and groups

As part of your strategy, consider how environments and groups are named.

- Environment names are visible to admins, makers, and users. Only admins typically use environment groups, but makers may encounter them if they have privileges to create environments.

- Developer environments that are automatically created follow the pattern *&lt;user name&gt;'s Environment*; for example, "Avery Howard's Environment." Environment groups aren't named automatically.

- Environment and environment group names aren't required to be unique. However, to avoid confusion, it's a best practice to avoid duplicate names.

- Names are limited to 100 characters. Shorter names are easier to use.

#### Naming conventions

Establish consistent naming conventions.

- Consistent names help admins know what the group's purpose is and what environments it manages. Consistent names also make automation and reporting easier.

    - A common practice is to include the lifecycle stage in the name of an environment; for example, Contoso Dev, Contoso Test, Contoso Prod. The goal is to clearly separate environments that have the same content, but different purposes.

    - Another common practice is to include the department or business unit in the name when the environment is dedicated to that group of users. 
    
    For example, you might decide that all environment or environment group names must follow the pattern *&lt;lifecycle stage&gt;-&lt;region&gt;-&lt;business unit&gt;-&lt;purpose&gt;* (Prod-US-Finance-Payroll).

- Keep names short, meaningful, and descriptive.

- Avoid including confidential information in names. They can be visible to anyone who has access to the admin center.

- Think about how your groups will evolve and grow over time, and make sure your naming convention can accommodate these evolving needs.

### Assets in the default environment

Your environment strategy should encourage (or enforce) the use of personal, development environments to reduce what gets created in the default environment. However, you should look at what makers have already created in the default environment and evaluate how to handle each use case. Is it appropriate to leave in the default environment, or should it be migrated to another environment?

A key part of this hygiene effort is identifying widely used applications in your organization that need a protected development environment separate from the production environment.

The following table lists example use cases and migration actions. Ultimately, your organization needs to identify its own use cases and risk factors associated with leaving assets in the default environment. Learn more about when to [move assets from the default environment](/power-platform/guidance/adoption/manage-default-environment#move-applications-from-the-default-environment).

| **Default environment**                                                   | **Migration action**                                                                      |
|---------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Microsoft 365 personal productivity                                       | Stay in the default environment.                                                             |
| Assets with a single maker that have been used recently but aren't shared | Move to the owner's individual, developer environment.                                        |
| Assets with a single maker that have been used recently and are shared    | Move to the owner's individual developer environment and run from a shared production environment. |
| Assets with multiple makers that have been used recently and are shared   | Move to a shared developer environment and run from a shared production environment.           |
| Assets that haven't been used recently                                    | Notify the owner and move to quarantine if no response.                                    |

### Assets in Dataverse for Teams environments

[Microsoft Dataverse for Teams](/power-platform/admin/about-teams-environment) empowers users to build custom apps, bots, and flows in Microsoft Teams by using Power Apps, Microsoft Copilot Studio, and Power Automate. When a team owner adds this capability to their team, a Microsoft Power Platform environment with a Dataverse for Teams database is created and linked to their team. Learn how to [establish governance policies to manage Microsoft Dataverse for Teams environments](/power-platform/guidance/adoption/teams-environment-strategy).

### Environment strategy internally at Microsoft

Microsoft considers itself "Customer Zero" because it internally adopts Power Platform to drive automation and efficiency for its employees. The following numbers show the scale of use across Microsoft's internal tenant.

- 50,000-60,000 active makers each month
- Over 250,000 applications and over 300,000 flows
- Over 20,000 environments

Microsoft is shifting from its prior environment strategy to one using the latest Power Platform governance features, including Managed Environments, environment groups, and rules.

As part of the enhanced strategy Microsoft plans to group together scenarios based on development type, organizational ownership, and risk level. Because so much is being built across the company, it's hard to focus on every possible scenario and to customize for each use case. Given the scale of innovation and change, automation is required, together with as many out-of-the-box controls as possible.

Microsoft is structuring its Power Platform environments into three broad categories that cover seven use cases, reflecting varying degrees of risk and control: personal productivity, team collaboration, and enterprise development.

- **Personal productivity**: For users who just want to build an app or flow for themselves, without collaborating with others. These users are routed to personal development environments. These locked-down environments use Managed Environment features, including restricting sharing and controlling other actions. Connectors and actions in these environments are heavily restricted. These environments are the least risky. Using locked-down personal environments allows users to avoid the more rigorous compliance process required to build personal productivity apps and flows.

- **Team collaboration**: For users who are building tooling, automation, and processes for their team. For this scenario, Microsoft recommends using Dataverse for Teams environments. Lifecycle, access management, and data labeling are controlled at the Microsoft 365 group-level, eliminating the need to spend time managing these users from a Power Platform governance perspective. This level of use is the next step up in the risk spectrum.

- **Enterprise development/production-level used by all employees**: For users building tooling or solutions used more broadly across the company. These environments may store the most sensitive data, use more powerful connectors, and require more governance. This level carries the highest risk and, therefore, significant effort is spent on governance. ALM is required, with preproduction work happening in sandbox environments and only managed solutions allowed in production environments. These environments must be linked to ServiceTree, which enforces reoccurring security and privacy reviews. The environment group rules are customized based on ServiceTree metadata and signals. Many environment groups and rules are used to manage and control these environments.

Microsoft's governance strategy isn't static. It's fluid and changes to adapt to new challenges and incorporate new Power Platform features.

## Evolve your tenant environment strategy

In this article, we described how to establish an enterprise-scale tenant environment strategy. The strategy grows with your business, regardless of where you're starting on the journey. Organizations of any size can benefit from the strategy we present; however, for organizations that are already at higher scale, the benefits are greater.

Developing a tenant environment strategy isn't a one-time activity. It's a journey. Evolve your strategy over time as your needs change. Your strategy must also adjust to adopt new capabilities of the platform and to address new challenges.

Like all journeys, different organizations join at different points along the way, but all have the same destination in mind. What follows are possible on-ramps that represent where your organization is today.

### Start

Your organization is at the beginning of its journey to adopt Power Platform. This stage is often referred to as *greenfield*. You're starting your journey at the best place because you don't have to worry about existing environments or the impact that new policies might have on how people in your organization are using Power Platform. This is the best time to implement an enterprise-scale environment strategy that's aligned with product features and best practices.

Explore the key environment features and strategies that are outlined in this article. Take the time to understand the key themes and the considerations and decisions that you need to make to design and implement a tenant environment strategy that best fits your requirements.

Establishing a solid foundation now is essential to avoid having to wrangle an out-of-control situation that can occur later if you start without a defined strategy. Plan for rapid acceleration of your use of Power Platform, but avoid the temptation to over-engineer your environment strategy by adding complexity that isn't required. Remember, this is a journey, and you can continue to evolve your strategy as your needs change.

### Align

Your organization has and is executing an environment strategy that needs to be modified to align with new Power Platform features and best practices. This stage is often referred to as *brownfield*. Unlike organizations just starting out, you need to consider the impact on your organization of changing your environment strategy.

Explore the key environment features and strategies that are outlined in this article and evaluate what's required to evolve your strategy to be more in line. Usually all that's needed are incremental adjustments. When possible, plan the roll-out of changes to minimize the impact on your users.

The following suggestions are common incremental changes you could implement:

- To start your alignment without affecting existing environments, create an environment group that contains new developer environments and establish rules for how you want to govern them. Turn on environment routing to ensure that all new developer environments are created in the designated group.

- Evaluate your grouping strategy and, if needed, create groups to support your existing environments. Establish rules on those groups that align with existing restrictions and exceptions. Move existing environments into those groups.

- Identify broadly popular applications that are built and used in the default environment. Use pipelines to publish them to a production environment where users in your organization can run them. Then work on migrating development of those apps to either an individual developer environment or a dedicated development environment.

- Create a plan to identify, quarantine, and remove assets in the default environment that aren't being used.

### Enhance

The environment strategy you're executing is already in line with the latest features and best practices, but your organization wants to add more controls or features.

## Communicate your environment strategy to your organization

You implement your tenant environment strategy more successfully if your Power Platform users understand and are aligned with what you're trying to achieve. If you simply activate your strategy without any communication, users see the changes as restrictions and look for ways to work around them.

As part of developing or evolving your strategy, decide how you inform users of key elements of the strategy that affect their use of Power Platform. They don't need all the technical details of your strategy—only the essentials that help them stay productive. For example, communicate:

- The purpose of the default environment
- Where they should build new low-code assets
- How they should use their personal developer environment
- How to request custom environments for specific business units or projects
- General connector usage policies, and how to request more connector privileges for their environments
- How to share what they build with others
- The responsibilities of a maker; for example:
    - Keep the tenant clean. Delete your environments, apps, and flows if they're no longer needed. Use test environments if experimenting.
    - Share wisely. Watch out for oversharing of your environments, apps, flows, and shared connections.
    - Protect organization data. Avoid moving data from highly confidential or confidential data sources to unprotected or external storage.
- When your strategy changes, share how the changes affect your users so that they know what to do differently

A good start is to [turn on the maker welcome content](../../admin/welcome-content.md) in the environment group where new makers are added.

:::image type="content" source="media/environment-strategy/image20.png" alt-text="Screenshot of the welcome content for makers in Power Platform." lightbox="media/environment-strategy/image20.png":::

*Figure: Use the welcome content to help new makers be successful.*

Another effective approach to communicating with your users is establishing an internal Power Platform hub. The hub can be a place for people to collaborate on projects, share ideas, and discover new ways to apply technology to achieve more. The hub is where you might also share detailed information about your environment strategy that's relevant to your users. Learn how to [create an internal Power Platform hub](../adoption/wiki-community.md).

## Conclusion

In this article, we explored features that are designed to help your organization manage Power Platform environments at enterprise scale and incorporate them into your tenant environment strategy.

As your organization adopts Power Platform and usage accelerates, the need for environments can change rapidly. You need an agile approach that helps your environment strategy keep up with changes and continue to meet your organization's evolving governance requirements.

A key factor for success with a tenant environment strategy is communicating with your makers and users and gaining their support. Make sure that the people who build low-code applications and automations know how to follow your organization's environment strategy and where they should be building their low-code assets.

Every organization's journey to adopting Power Platform is unique. We presented some ideas to help you get started. Your Microsoft account team or Power Platform partner can help you create a more customized tenant environment strategy for your organization.

## Related information

- [Environment groups](../../admin/environment-groups.md)
- [Environment routing](../../admin/default-environment-routing.md)
- [Enterprise security with Power Platform (white paper)](../white-papers/enterprise-security.md)
- [Low-code security and governance](https://powerplatform.microsoft.com/trusted-cloud/)
- [Solution concepts in ALM](../../alm/solution-concepts-alm.md)
