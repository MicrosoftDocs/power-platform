---
title: "Upgrade a Dataverse for Teams environment"
description: "You can upgrade from a Dataverse for Teams environment in Power Virtual Agents, so you can avoid capacity limits."
keywords: "Administration, dataverse, environment, PVA, teams"
ms.date: 2/8/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "environments, admin, ceX, teams"
ms.collection: virtual-agent
---

# Upgrade a Dataverse for Teams environment for Power Virtual Agents



When a user creates a bot in Microsoft Teams using the [Power Virtual
Agents for Teams app](fundamentals-what-is-power-virtual-agents-teams.md), a Dataverse for Teams environment gets created for the team the customer
selected. [Learn more about Dataverse for Teams](/power-platform/admin/about-teams-environment).

## Upgrading a Dataverse for Teams environment

Tenant admins can upgrade a Dataverse for Teams environment to reach full functionality (see this
[comparison](/power-platform/admin/about-teams-environment#conceptual-model) between Dataverse for Teams and Dataverse environments). Upgrading an environment can be useful, for example, if you are running into Dataverse for Teams [capacity limits](/power-platform/admin/about-teams-environment#capacity-limits).

Admins can start the upgrade process from the [Power Platform admin
center](https://admin.powerplatform.microsoft.com/). 
For more information about upgrading Dataverse environments, see the [Dataverse for Teams environments - Upgrade process topic](/power-platform/admin/about-teams-environment\#upgrade-process).

## Impact of upgrading an environment on Power Virtual Agents

When an environment is being upgraded, users can't edit or create bots in the environment. The users will be told about the upgrade in the Power Virtual Agents for Teams app, and they'll be blocked
from making or editing bots in the environment.

:::image type="content" source="media/admin-upgrade-dataverse-teams/dataverse-upgrade-in-progress-teams.png" alt-text="Screenshot of the Power Virtual Agent app in Teams  with the message try again later - this team is upgrading.":::

During the upgrade, users will experience issues if they try to chat with your bot. You should plan for or notify your users of an expected downtime.

After an environment has been successfully upgraded, users can continue to edit bots in the Power Virtual Agents for Teams app.

Users can also choose to edit the bot in the Power Virtual Agents web app at [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com).

Upgraded environments are shown with a diamond icon next to their name in the list of environments in the **Chatbots** tab.

:::image type="content" source="media/admin-upgrade-dataverse-teams/upgraded-list-of-environments.png" alt-text="Screenshot of the Power Virtual Agents app in Teams with a list of bots in an upgrade environment, and showing a diamond icon next to the environment name.":::

>[!NOTE]
>To access the Power Virtual Agents web app, users need a [standalone PVA license](../requirements-licensing-subscriptions.md) or an individual [trial](../sign-up-individual.md).

After the upgrade, the bot will continue to work as it did before the upgrade without you having to take any action.

If bot authors want to share a bot with other authors after you've upgraded an environment, you'll have to add the authors as team owners in the team where the environment was created. You can't add authors as team owners if the **Teams Owner** security group has been removed from the environment in the Power Platform admin center. This bug will be resolved in an upcoming update, and you'll be able to [share bots with co-authors](admin-share-bots-teams.md) as you currently can in standard Dataverse environments.


>[!IMPORTANT]
>After upgrading, qualified sessions will be considered as billed even if they do not leverage premium functionality such as premium connectors, non-Microsoft Teams channels or Azure Framework extensibility. For more information, see the [Licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130).


[!INCLUDE[footer-include](../includes/footer-banner.md)]