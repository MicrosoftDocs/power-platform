---
title: "Manage Dataverse for Teams environments  | MicrosoftDocs"
description: "Microsoft Dataverse for Teams enables users to build custom apps, bots, and flows in Microsoft Teams. This article walks you through important details about Dataverse for Teams environments, and discusses recommended ways to proactively manage them."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/11/2020
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
# Establish governance policies to manage Microsoft Dataverse for Teams environments

Microsoft Dataverse for Teams empowers users to build custom apps, bots, and flows in Microsoft Teams by using Power Apps, Power Virtual Agents, and Power Automate. When a team owner adds this capability to their team, a Microsoft Power Platform environment with a Dataverse for Teams database is created and linked to their team. More information: [About Microsoft Dataverse for Teams environments](../../admin/about-teams-environment.md)

Dataverse for Teams honors the existing data governance paradigms of Microsoft Power Platform and enables access control in the Microsoft Teams admin center. The Power Platform admin center provides more detail, including monitoring dedicated capacity usage and [data loss prevention (DLP) policies](../../admin/wp-data-loss-prevention.md).  

Dataverse for Teams greatly simplifies environment lifecycle management and user security role management by aligning to Microsoft Teams constructs. More information: [User access to Dataverse for Teams environments](../../admin/about-teams-environment.md#user-access-to-dataverse-for-teams-environments) 

Dataverse for Teams is a fully embedded experience. Governance controls specific to Microsoft Power Platform are also provided directly in the context of the Microsoft Teams admin center. More information: [Manage Microsoft Power Platform apps in the Microsoft Teams admin center](/microsoftteams/manage-power-platform-apps)

Our philosophy is to enable you to use Microsoft Power Platform to manage Microsoft Power Platform&mdash;in keeping with that philosophy, you can use Power Automate to send welcome emails to owners of new Dataverse for Teams environments and request a business justification for their environments. Central IT can effectively engage with new makers and ensure that Dataverse for Teams capacity is used effectively in the tenant and distributed to the most important business use cases. Similar workflows can be used to apply specific DLP policies to Dataverse for Teams environments, as needed, and to invoke a cleanup of unused assets that can then be repurposed for more compelling scenarios in the tenant.

## Govern environment creation

We recommend setting up reactive governance workflows and monitoring abilities. This gives team owners the ability to provide a business justification, and admins the ability to review the business justification:

1. The team owner can provide a business justification for their new environment within *n* days of creating the environment.

    ![A team owner is prompted to provide a business justification](media/teams-1.png "A team owner is prompted to provide a business justification")

1. An admin can approve or reject the submitted business justification, and&mdash;optionally&mdash;mark it for later review.

    ![Admins approve or reject the submitted business justification](media/teams-2.png "Admins approve or reject the submitted business justifications")

1. An automated cleanup runs periodically, and deletes rejected or unclaimed (that is, no justification was provided) environments. If needed, deleted environments can be restored within seven days by using the [recover environment feature in the Power Platform admin center](../../admin/recover-environment.md#power-platform-admin-center).

1. Admins can also review usage data and resource details periodically, and can choose to delete unused environments to free up assets for important use cases.

The [CoE Starter Kit](../coe/starter-kit.md) provides a set of templates that implement our best practices. These templates are designed to help organizations get started with developing a strategy for adopting, maintaining, and supporting Microsoft Power Platform. The kit includes a template implementation of the reactive governance workflows to govern Dataverse for Teams environment creation. Because it's a template implementation, admins can customize the conditions for deletion by creating a copy of the flows.

Dedicated Dataverse for Teams environments will be used for appropriate business use cases. Additionally, admins can choose to set up public Microsoft Teams teams that are already backed by Dataverse for Teams environments, to which they can direct test or trial users. Having a public team will help ensure that tenant capacity limits are applied to appropriate business use cases, while still allowing individual users to test new capabilities.  

## Monitor Dataverse for Teams capacity and usage

Admins can use Power Apps and Power Automate analytics reports in the Power Platform admin center to view usage, performance, and errors related to Dataverse for Teams environments.

Admins can monitor capacity usage for Microsoft Teams environments by using dedicated [capacity views in the Power Platform admin center](../../admin/about-teams-environment.md#capacity-limits). Notifications are sent to the makers in Microsoft Teams when the environment is nearing 80&nbsp;percent of its capacity. Notifications are also sent to tenant admins when the tenant is reaching 80&nbsp;percent of its capacity. These capacity limits can't be extended. Admins can monitor inactive Microsoft Teams environments in the tenant and invoke cleanup when necessary, in addition to having an automated cleanup of unused environments in place to help free up capacity.

![Admins can monitor capacity usage for Microsoft Teams environments by using dedicated capacity views in the Power Platform admin center](media/teams-4.png "Admins can monitor capacity usage for Microsoft Teams environments by using dedicated capacity views in the Power Platform admin center")

A dashboard in the CoE Starter Kit further identifies the usage of Dataverse for Teams environments, in addition to inactive environments that have no apps or flows.

![A dashboard in the CoE Starter Kit further identifies the usage of Dataverse for Teams environments.](media/teams-3.png "A dashboard in the CoE Starter Kit further identifies the usage of Dataverse for Teams environments.")

## Set up DLP policies

Manage the data governance policies for newly created Dataverse for Teams environments by selecting one of these approaches:

- Create a policy spanning all environments except selected ones. Keep the available connectors in this policy limited to those that you want to expose to makers in Dataverse for Teams environments. By setting the scope of the DLP policy to *Exclude certain environments*, this policy will apply to any new environments that are created in your tenant&mdash;including Dataverse for Teams or trial environments. Any other type of new environment, like a production or sandbox environment, can be explicitly removed from this tenant-wide DLP policy and added to appropriate, dedicated DLP policies suited for their use case.

- Create a policy specifically for Dataverse for Teams environments. Keep the available connectors in this policy limited to those you want team members to have access to. Set up a script by using [PowerShell cmdlets](../../admin/powerapps-powershell.md#data-loss-prevention-dlp-policy-commands), or a flow that uses admin connectors, to periodically add newly created Dataverse for Teams environments to this policy and remove them from the default tenant-level policy.

More information: [Best practices for establishing a DLP strategy](./dlp-strategy.md)

## Use Microsoft Teams admin center controls

Global or Microsoft Teams admins can use Microsoft Teams app controls through the Microsoft Teams admin center to enable or disable Microsoft Power Platform features within Microsoft Teams. App controls are supported at an individual user level through Microsoft Teams app permission policies and at the tenant level through app management settings in Microsoft Teams.

|Microsoft Teams app control|Capabilities|
|------------------|---------|
|**Power Apps**|The ability to create new Power Apps apps by using the Microsoft Teams embedded maker experience. This is tied to the implicit ability to create new Dataverse for Teams environments.<Br>The ability to use Dataverse or Dataverse for Teams apps within Microsoft Teams by using Power Apps apps.  |
|**Power Virtual Agents**|The ability to create new Power Virtual Agents chatbots by using the Microsoft Teams embedded maker experience. This is tied to the implicit ability to create new Dataverse for Teams environments.<Br>The ability to use Dataverse or Dataverse for Teams Power Virtual Agents components within Microsoft Teams by using the Power Virtual Agents app.|
|**Shared Power Apps**|The ability to use Dataverse or Dataverse for Teams Power Apps apps within Microsoft Teams by using the *Built by your colleagues* catalog.|
|**Shared Power Virtual Agents**|The ability to use Dataverse or Dataverse for Teams Power Virtual Agents chatbots within Microsoft Teams by using the *Built by your colleagues* catalog.|
|**Various Sample Apps**| The ability to create new apps, flows and bots by using sample apps within Microsoft Teams. This is tied to the implicit ability to create new Dataverse for Teams environments.|

Given that these controls block environment creator, maker, and user access, we recommend that admins instead use reactive constructs&mdash;either by building their own or by using the templates in the CoE Starter Kit&mdash;to govern Dataverse for Teams environment creation workflows.


[!INCLUDE[footer-include](../../includes/footer-banner.md)]