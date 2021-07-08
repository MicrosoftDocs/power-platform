---
title: "Dataverse for Teams environment management| MicrosoftDocs"
description: "This article describes a sample process for managing Microsoft Teams environments by using Microsoft Power Platform."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/18/2020
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
# Microsoft Dataverse for Teams environment management

You can take advantage of our philosophy of using Microsoft Power Platform to manage Microsoft Power Platform by building automation to send welcome emails to owners of new [Dataverse for Teams environments](../../admin/about-teams-environment.md) and requesting business justifications for newly created environments. This ensures that central IT teams can effectively engage with the new makers onboarding the platform, and ensure that Dataverse for Teams capacity is used effectively in your tenant and distributed to the most important business use cases. Similar workflows can be used to apply specific data loss prevention (DLP) policies to Dataverse for Teams environments as needed, and to invoke cleanup of unused assets to free up capacity for more compelling scenarios in the tenant.

## Process description

**Problem statement:** Central IT wants to ensure that Dataverse for Teams environments are used effectively in their tenant. Central IT wants to understand the business justification for a Dataverse for Teams environment to be able to distribute capacity to the most effective business use cases.

**Solution:** Reactive governance and monitoring abilities are configured to provide team owners the ability to provide a business justification, and to provide central IT with the ability to approve or reject the business justification and run regular, automated cleanup flows.

## Business justification process

The following process is described from the point of view of the people involved and the components they interact with.

**Team owner:** The team owner gets a notification in Microsoft Teams to provide a business justification for the environment they've just created. Team owners have seven days to submit a business justification.

![Team owner receives a prompt to provide a business justification](media/teams-1.png "Team owner receives a prompt to provide a business justification")

Team owners also receive a Welcome note via email to provide them with further information about their environment and the conditions for using it.

![Team owner receives welcome email](media/teams-3.png "Team owner receives welcome email")

**Admin:** Microsoft Teams environments can be reviewed by using the **Microsoft Teams environment review** filter view in the **Power Platform Admin View** model-driven app.

![Admin point of view in the audit process](media/teams-4.png "Admin point of view in the audit process")

An admin opens **Power Platform Admin View** > **Environments** > **Microsoft Teams environment review** and assesses all the environments due for review by looking at the **Audit** tab within the environment, investigating the justification submitted by the team owner, and then approving or rejecting the justification in the **Admin Review** section.

![An admin reviews the business justification and approves or rejects it](media/teams-5.png "An admin reviews the business justification and approves or rejects it")

The admin can further decide to approve a business justification, but highlight it for later review by providing a review date.

![The admin can highlight the business justification for later review](media/teams-6.png "The admin can highlight the business justification for later review")

## Monitoring and weekly cleanup process

Admins can also monitor inactive Microsoft Teams environments in their tenant and invoke cleanup as appropriate, in addition to having automated cleanup of unused environments in place to free up capacity for more compelling scenarios.

A weekly cleanup deletes environments that:

- Have been created more than seven days ago and have no business justification, or the business justification has been rejected by the admin.
- Have been created more than 90 days ago and have no apps or flows in the environment.

> [!NOTE]
> Currently, bots created by using Power Virtual Agents in Microsoft Teams environments aren't discoverable in the CoE Starter Kit.

An admin can customize the conditions for deletion by creating a copy of the flow and modifying it:

1. Go to [flow.microsoft.com](https://flow.microsoft.com) > **Solutions** > **Center of Excellence - Governance Components**.
1. Open the *Admin | Weekly Clean Up of Microsoft Teams environments* flow, and save a copy.
1. Modify the conditions used for marking environments for deletion, based on your business needs.

Team owners will receive a notification that their environment has been deleted.

![Team owner receives notification](media/teams-2.png "Team owner receives notification")

In addition to the automatic cleanup, admins can also monitor how Microsoft Teams environments are used through a [Microsoft Teams environments](power-bi-monitor.md) report in the CoE Starter Kit dashboard.

The **Microsoft Teams environments** page shows you how many environments, environment makers, and apps and flows in Microsoft Teams environments you have. You can filter on the created date or creator name to drill down on trends and analyze them.

The page visualizes:

- The Microsoft Teams environment creation trend.
- The number of resources per environment.
- The list of environments, including the last launched date for an app in the environment.
- The list of apps in Microsoft Teams environments, including their last launched date.

![Microsoft Teams environment dashboard](media/pb-6.png "Microsoft Teams environment dashboard")

### See also

[What is Dataverse for Teams?](/powerapps/teams/overview-data-platform)


[!INCLUDE[footer-include](../../includes/footer-banner.md)]