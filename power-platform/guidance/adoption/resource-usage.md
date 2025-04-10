---
title: Report on resource usage
description: Monitor Power Apps, Power Automate, and Copilot Studio adoption and performance with tools and strategies to ensure governance and security.
#customer intent: As a Power Platform user, I want to monitor resource usage so that I can ensure governance and security.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 03/31/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/31/2025
---

# Report on resource usage

One of the key principles of administering Microsoft Power Platform is having full visibility into how your organization is using Power Apps and Power Automate. Insights into your adoption help you govern and secure the platform, identify patterns, and nurture your makers to accelerate adoption.

In this section, you learn how to:

- Review out-of-the-box monitoring capabilities.
- Check service and environment health.

## What tools are available to monitor resource usage?

Several tools are available to monitor resource usage in Power Platform.

### Power Platform admin center

The [Power Platform admin center](/power-platform/admin/new-admin-center) is designed with an outcome-driven approach, where all functionality is intuitively organized in pages based on administrative tasks. This is typically considered the primary path for completing administrative activities. From a resource monitoring point of view, this channel is used mostly for ad-hoc interactive discovery.

- Use [tenant-level analytics](/power-platform/admin/tenant-level-analytics) to extract key service metrics based on user adoption across your environments.
- Use the [Copilot page](/power-platform/admin/copilot/copilot-hub) to track usage, and access governance controls for Power Platform Copilots.
- Use [Power Platform Advisor](/power-platform/admin/power-platform-advisor) to monitor recommendations to optimize your tenant.

### Monitor page

You can use the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) to assess and enhance the operational health metrics of resources developed or deployed within Power Platform. This tool is accessible to both makers (via experiences like Power Apps) and admins (via the Power Platform admin center). Makers utilize the data to refine their resources, while admins use it to gain insights into the overall operational health of the tenant or specific environments. 

### Custom tooling and extensibility

Power Platform administrators often have a need to orchestrate and automate routine activities for their tenants. These activities depend on the operational and governance requirements of the organization. The programmability and extensibility capabilities of the Power Platform empower administrators to create bespoke tools and solutions using various resources.

- Evaluate features of the [Center of Excellence Starter Kit](../coe/starter-kit.md), which offers a template implementation using the management and admin connectors and comes with a Power BI dashboard that can be used to gain tenant-wide insights.
- Use [programmability and extensibility](/power-platform/admin/programmability-extensibility-overview) features - such as APIs, PowerShell cmdlets, the Power Platform CLI, and connectors - to manage and automate tasks. The Power Platform API provides a unified interface for managing tenant-level resources, while the Dataverse API allows for detailed data interactions within environments.

This flexibility ensures that administrators can tailor their automation and orchestration efforts to the unique needs of their organization, enhancing efficiency and control over their Power Platform adoption.

## What should I monitor?

Monitor the default environment and its usage, as well as the usage of Power Apps, Power Automate, and Copilot Studio.

## Default environment

Every employee in an organization that uses the Power Platform has access to the default environment. As a Power Platform admin, you should consider, and when necessary, implement ways to control the default environment.

When monitoring the Default environment in Power Platform, it's crucial to keep an eye on several key aspects to ensure optimal governance and security:

- Track connector usage and identify which connectors are used. This can help inform your [Data Loss Prevention policy strategy](dlp-strategy.md).
- Discover apps and flows that have become widely adopted or business-critical. This process can help inform which solutions might require more support or need to be moved to a dedicated environment.
- Discover unused and owner-less apps and flows. These may consume capacity and create clutter in the Default environment.

Learn more about [managing the Default environment](manage-default-environment.md).

## Power Automate usage

As an administrator, you should:

- Monitor usage and look for insights related to types of flows that are in use.
- Watch for errors by error type to look for common problems that might exist.
- Spot data usage that isn't expected by drilling in to connector usage and adjust your data loss prevention policies for that environment to ensure the overall health of the platform.

Learn more: [Admin Analytics for Power Automate](../../admin/analytics-flow.md)

## Power Apps usage

As an administrator, you should:

- Watch overall adoption by monitoring insights into how much the apps are being used and when.
- Check out app launches in terms of being used in a browser or via a mobile player version and on which platforms. Following your device strategy, you could ensure users are using the latest player edition.
- Regularly monitor overall service performance to ensure user run-time experience when interacting with the platform services.

Learn more: [Admin Analytics for Power Apps](../../admin/analytics-powerapps.md)

## Copilot Studio usage

As an administrator, you should:

- Watch overall adoption by monitoring insights into which Copilot features are used.
- Review governance settings and adjust which environments have Copilot features turned on based on your requirements.
- Create training material to help your makers use AI responsibly.

Learn more: [Copilot page in Power Platform admin center](/power-platform/admin/copilot/copilot-hub)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
