---
title: "Example App auditing process | MicrosoftDocs"
description: "The App auditing sample process showcases how your CoE department or IT administrators can automate an auditing process on an app-level basis to gather additional information about an app, like business justification and impact of an outage, from the maker."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Microsoft Teams environment management

The [Microsoft Teams integration](https://docs.microsoft.com/power-platform/admin/about-teams-environment) empowers users to build custom apps, bots, and flows in Teams by using Power Apps, Power Virtual Agents, and Power Automate.

The Teams environment is automatically created for the selected team when an app or bot in Teams is created for the first time. The environment is used to store, manage, and share team-specific data, apps, and flows.

With a limit of 500 environments per tenant, admins need to lean in and ensure this capacity is distributed to the most effective business use cases. The example process in this article shows an implementation of best practices for managing and governing Microsoft Teams environments, by empowering the admin to govern the environment lifecycle, monitoring inactive environments and invoking cleanup as appropriate.

## Process description

**Problem statement:** Admins need to ensure that Microsoft Teams environments and capacity is leveraged effectively in their tenant. Admins need to understand the business justification for a Microsoft Teams environment to be able to distribute them to the most effective business use cases, as well as be able to invoke cleanup of unused assets that can be repurposed for more compelling scenarios in the tenant.

**Solution:** Reactive governance and monitoring abilities are configured to provide Team creators the ability to provide a business justification, and to provide admins with the ability to approve or reject the business justification as well as run regular automated cleanup flows.

## Business Justification process

Here is that process from the point of view of the people involved and the components they interact with.

**Team owner:** The Team owner gets a notification in Teams to provide a business justification for the environment they have just created. Team owners have 7 days to submit a business justification.

![Teams owner receives prompt to provide business justification](media/teams-1.png "Teams owner receives prompt to provide business justification")

They also receive a Welcome note via email to provide them with further information about their environment, as well as conditions of using it.

![Teams owner receives welcome email](media/teams-3.png "Teams owner receives welcome email")

**Admin:** Microsoft teams environments can be reviewed using the **Microsoft Teams environment review** filter view on the **Power Platform Admin View** model driven app.

![Admin point of view in the audit process](media/teams-4.png "Admin point of view in the audit process")

An admin opens **Power Platform Admin View** > **Environments** > **Admin Review** and assesses all the environments due for review by looking at the **Audit** tab within the app, investigating the justification done by the Team owner, and then approving or rejecting the justification in the **Admin Review** section.

![Validate maker requirements](media/teams-5.png "Validate maker requirements")

The admin can further decide to approve a business justification, but highlight it for later review by providing a date.

![Validate maker requirements](media/teams-6.png "Validate maker requirements")

## Monitoring and weekly Cleanup process

Admins need to monitor inactive Microsoft Teams environments in their tenant and invoke cleanup as appropriate, as well as have automated cleanup of unused environments in place to free up capacity for more compelling scenarios.

A weekly cleanup deletes environments that

- have been created more than **7 days** ago and have no business justification or where the business justification has been rejected by the admin
- have been created more than **90 days** ago and have no apps or flows in the environment

> [!NOTE]
> Currently, bots created via Power Virtual Agents in Microsoft Teams environments are not discoverable in the CoE Starter Kit.

An admin can customize the conditions for deletion by creating their own copy of the flow and modifying it:

1. Navigate to [flow.microsoft.com](https://flow.microsoft.com) > Solutions > Center of Excellence - Governance Components.
1. Open the *Admin | Weekly Clean Up of Microsoft Teams environments* flow and save a copy.
1. Change what environments are marked for deletion by looking at the condition.

Team owners will receive a notification that there environment has been deleted.

![Team owner receives notification](media/teams-2.png "Team owner receives notification")

In addition to the automatic cleanup, admins also need to monitor how Microsoft Teams are used - a [Microsoft Teams environments](power-bi-monitor.md) report has been created in the CoE Starter Kit dashboard.

The **Microsoft Teams environments** page shows you how many environments, environment makers, and apps and flows in Microsoft Teams environments you have.

The page visualize:

- The Teams environment creation trend
- The number of resources per environment
- The list of environments including the last launched date of an app in the environment
- The list of apps in Teams environments, including their last launched date

The filters allow you to drill down and analyze trends by filtering on the created time or creator.

A link to both the Environment page in the Admin Center, as well as the Teams itself is available and allows the admin to get further information about this environment.

![Team owner receives notification](media/pb-6.png "Team owner receives notification")
