---
title: Establish governance policies to manage Microsoft Dataverse for Teams environments
description: Discover best practices for managing Dataverse for Teams environments to ensure secure, compliant, and efficient usage within your organization.
#customer intent: As a Power Platform admin, I want to establish governance policies for Dataverse for Teams environments to ensure secure, compliant, and efficient usage within my organization.
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
  - ai-seo-date:04/07/2025
---

# Establish governance policies to manage Microsoft Dataverse for Teams environments

Microsoft Dataverse for Teams empowers users to build custom apps, bots, and flows in Microsoft Teams by using Power Apps, Microsoft Copilot Studio, and Power Automate. When a Teams owner adds this capability to their team, a Microsoft Power Platform environment with a Dataverse for Teams database is created and linked to the team. Learn more in [About Microsoft Dataverse for Teams environments](../../admin/about-teams-environment.md).

Dataverse for Teams honors the existing data governance paradigms of Power Platform and enables access control in the Microsoft Teams admin center. In addition, the Power Platform admin center provides monitoring of dedicated capacity usage and [data loss prevention (DLP) policies](../../admin/wp-data-loss-prevention.md).

Dataverse for Teams simplifies environment lifecycle management and user security role management by aligning to Microsoft Teams constructs. Learn more in [User access to Dataverse for Teams environments](../../admin/about-teams-environment.md#user-access-to-dataverse-for-teams-environments).

Dataverse for Teams is a fully embedded experience. Governance controls specific to Power Platform are also provided directly in the context of the Microsoft Teams admin center. Learn more in [Manage Microsoft Power Platform apps in the Microsoft Teams admin center](/microsoftteams/manage-power-platform-apps).

Use Power Platform to manage Power Platform. Using Power Automate, send welcome emails to owners of new Dataverse for Teams environments and request a business justification for their environments. Central IT engages with new makers and ensures that Dataverse for Teams capacity is used effectively in the tenant and distributed to the most important business use cases. Use similar workflows to apply specific DLP policies to Dataverse for Teams environments as needed and to invoke cleanup of unused assets, which can be repurposed for more compelling scenarios in the tenant.

## Govern environment creation

We recommend setting up reactive governance workflows and monitoring abilities. This gives team owners the ability to provide a business justification, and admins the ability to review the business justification:

1. The team owner provides a business justification for their new environment within *n* days of creating the environment.

    :::image type="content" source="media/teams-1.png" alt-text="Screenshot from Microsoft Teams prompting a Teams owner to provide a business justification.":::

1. An admin approves or rejects the submitted business justification, and optionally marks it for later review.

    :::image type="content" source="media/teams-2.png" alt-text="Screenshot from Power Apps Environment requesting admin approval or rejection of the submitted business justification.":::

1. An automated cleanup runs periodically to delete rejected or unclaimed environments (environments for which justification wasn't provided). If needed, deleted environments can be restored within seven days by using the [recover environment feature in the Power Platform admin center](../../admin/recover-environment.md#power-platform-admin-center).

1. Admins also review usage data and resource details periodically, and can choose to delete unused environments to free up assets for important use cases.

The [CoE Starter Kit](../coe/starter-kit.md) provides a set of templates that implement our best practices. These templates are designed to help organizations get started with developing a strategy for adopting, maintaining, and supporting Microsoft Power Platform. The kit includes a template implementation of the reactive governance workflows to govern Dataverse for Teams environment creation. Because it's a template implementation, admins can customize the deletion conditions by creating a copy of the flows.

Dedicated Dataverse for Teams environments are used for appropriate business use cases. Additionally, admins can set up public Microsoft Teams teams already backed by Dataverse for Teams environments and direct test or trial users to them. Having a public team helps ensure that tenant capacity limits apply to appropriate business use cases while still allowing individual users to test new capabilities.

## Monitor Dataverse for Teams capacity and usage

Admins can use Power Apps and Power Automate analytics reports in the Power Platform admin center to view usage, performance, and errors related to Dataverse for Teams environments.

Admins can monitor capacity usage for Microsoft Teams environments by using dedicated [capacity views in the Power Platform admin center](../../admin/about-teams-environment.md#capacity-limits). Notifications are sent to the makers in Microsoft Teams when the environment is nearing 80 percent of its capacity. Notifications are also sent to tenant admins when the tenant is reaching 80 percent capacity. These capacity limits can't be extended. Admins can monitor inactive Microsoft Teams environments in the tenant and invoke cleanup when necessary, in addition to performing automated cleanup of unused environments to help free up capacity.

:::image type="content" source="media/teams-4.png" alt-text="Screenshot of dedicated view for monitoring Microsoft Teams environments capacity in Power Platform admin center.":::

A dashboard in the CoE Starter Kit further identifies the usage of Dataverse for Teams environments, in addition to inactive environments without apps or flows.

:::image type="content" source="media/teams-3.png" alt-text="Screenshot of CoE Starter Kit dashboard displaying usage of Dataverse for Teams environments.":::

## Set up data loss prevention policies

Manage the data governance policies for newly created Dataverse for Teams environments by selecting one of these approaches:

- Create a policy spanning all environments except selected ones. Limit the available connectors in this policy to those you want to expose to makers in Dataverse for Teams environments. By setting the scope of the DLP policy to *exclude certain environments,* this policy applies to any new environments that are created in your tenant, including Dataverse for Teams or trial environments. You can explicitly remove any other type of new environment, like a production or sandbox environment, from this tenant-wide DLP policy and add it to appropriate, dedicated DLP policies suited for its use case.

- Create a policy specifically for Dataverse for Teams environments. Keep the available connectors in this policy limited to those you want team members to have access to. Create a script using [PowerShell cmdlets](../../admin/powerapps-powershell.md#data-loss-prevention-dlp-policy-commands), or a flow that uses admin connectors, to periodically add newly created Dataverse for Teams environments to this policy and remove them from the default tenant-level policy.

Learn more: [Implement a DLP strategy](./dlp-strategy.md)

## Use Microsoft Teams admin center controls

Global or Microsoft Teams admins can use Microsoft Teams app controls through the Microsoft Teams admin center to enable or disable Microsoft Power Platform features within Microsoft Teams. App controls are supported at an individual user level through Microsoft Teams app permission policies and at the tenant level through app management settings in Microsoft Teams.

| Microsoft Teams app control | Capabilities |
| ------------------ | --------- |
| **Power Apps** | Ability to create new Power Apps apps by using the Microsoft Teams embedded maker experience, tied to the implicit ability to create new Dataverse for Teams environments.<br>Ability to use Dataverse or Dataverse for Teams apps within Microsoft Teams by using Power Apps apps.  |
| **Microsoft Copilot Studio** | Ability to create new Microsoft Copilot Studio agents by using the Microsoft Teams embedded maker experience, tied to the implicit ability to create new Dataverse for Teams environments.<br>Ability to use Dataverse or Dataverse for Teams Microsoft Copilot Studio components within Microsoft Teams by using the Microsoft Copilot Studio app.|
| **Shared Power Apps** | Ability to use Dataverse or Dataverse for Teams Power Apps apps within Microsoft Teams by using the *Built by your colleagues* catalog.|
| **Shared Microsoft Copilot Studio** | Ability to use Dataverse or Dataverse for Teams Microsoft Copilot Studio agents within Microsoft Teams by using the *Built by your colleagues* catalog.|
| **Various sample apps** | Ability to create new apps, flows, and bots by using sample apps within Microsoft Teams, tied to the implicit ability to create new Dataverse for Teams environments. |

Given that these controls block environment creator, maker, and user access, we recommend that admins instead use reactive constructs&mdash;either by building their own or by using the templates in the CoE Starter Kit&mdash;to govern Dataverse for Teams environment creation workflows.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
