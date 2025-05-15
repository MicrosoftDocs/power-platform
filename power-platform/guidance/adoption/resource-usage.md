---
title: Report on resource usage
description: Monitor Power Apps, Power Automate, and Copilot adoption and performance with tools and strategies to ensure governance and security.
#customer intent: As a Power Platform admin, I want to monitor resource usage so that I can ensure governance and security.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/14/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/31/2025
---

# Report on resource usage

A key principle of administering Microsoft Power Platform is understanding how your organization uses Power Apps and Power Automate. Insights into your adoption help you govern and secure the platform, identify patterns, and support makers to accelerate adoption.  

In this article, you learn how to:

- Review built-in monitoring capabilities.
- Monitor service and environment health.

## What tools are available to monitor resource usage?

Several tools help you monitor resource usage in Power Platform.

### Power Platform admin center

The [Power Platform admin center](/power-platform/admin/new-admin-center) is designed with an outcome-driven approach, where all functionality is intuitively organized in pages based on administrative tasks. This tool is typically the primary path for completing administrative activities. For resource monitoring, this channel is mostly used for ad-hoc interactive discovery.

- Use [tenant-level analytics](/power-platform/admin/tenant-level-analytics) to extract key service metrics based on user adoption across your environments.
- Use the [Copilot page](/power-platform/admin/copilot/copilot-hub) to track usage, and access governance controls for Power Platform Copilots.
- Use [Power Platform Advisor](/power-platform/admin/power-platform-advisor) to monitor recommendations to optimize your tenant.

### Monitor page

Use the [Monitor page](/power-platform/admin/monitoring/monitoring-overview) to assess and enhance the operational health metrics of resources developed or deployed in Power Platform. This tool is accessible to both makers (via experiences like Power Apps) and admins (via the Power Platform admin center). Makers use the data to refine their resources, while admins use it to gain insights into the overall operational health of the tenant or specific environments. 

### Custom tooling and extensibility

Power Platform admins often need to orchestrate and automate routine activities for their tenants. These activities depend on the organization's operational and governance requirements. The programmability and extensibility capabilities of the Power Platform empower administrators to create bespoke tools and solutions using various resources.

- Evaluate features of the [Center of Excellence Starter Kit](../coe/starter-kit.md). The CoE Starter Kit provides a template implementation that uses the management and admin connectors and includes a Power BI dashboard for gaining tenant-wide insights.
- Use [programmability and extensibility](/power-platform/admin/programmability-extensibility-overview) features (APIs, PowerShell cmdlets, Power Platform CLI, and connectors) to manage and automate tasks. The Power Platform API provides a unified interface for managing tenant-level resources, while the Dataverse API supports detailed data interactions within environments.

This flexibility lets admins tailor automation and orchestration to their organization's unique needs, enhancing efficiency and control over their Power Platform adoption.

## What should I monitor?

Monitor the default environment and its usage, along with the usage of Power Apps, Power Automate, and Copilots.

### Default environment

Every employee in an organization that uses Power Platform has access to the default environment. As a Power Platform admin, you should consider, and when necessary implement, ways to control the default environment.

When monitoring the default environment in Power Platform, ensure optimal governance and security by focusing on these key aspects:

- Track connector usage and identify which connectors are used to help inform your [data loss prevention strategy](dlp-strategy.md).  
- Identify widely adopted or business-critical apps and flows to determine which solutions need more support or should move to a dedicated environment.
- Identify unused and ownerless apps and flows that consume capacity and clutter the default environment.

Learn more about [managing and governing the default Power Platform environment](manage-default-environment.md).

### Power Automate usage

As an administrator, you should:

- Monitor usage to identify the types of flows in use.
- Watch for errors by error type to identify common problems.
- Identify unexpected data usage by analyzing connector usage, and adjust your data loss prevention policies for that environment to ensure the overall health of the platform.

Learn more: [View analytics for cloud flows](../../admin/analytics-flow.md)

### Power Apps usage

As an administrator, you should:

- Monitor app adoption by reviewing insights on usage frequency and timing.
- Review app launches to see if they're used in a browser, mobile player, or on specific platforms. Ensure users follow your device strategy by using the latest player version.  
- Regularly monitor service performance to ensure a smooth user experience with platform services.  

Learn more: [Admin Analytics for Power Apps](../../admin/analytics-powerapps.md)

### Copilot usage

As an administrator, you should:

- Monitor adoption by reviewing insights into which Copilot features are used.  
- Review governance settings and adjust which environments have Copilot features turned on based on your requirements.
- Develop training materials to guide your makers in using AI responsibly.  

Learn more: [Manage Copilot](/power-platform/admin/copilot/copilot-hub)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
