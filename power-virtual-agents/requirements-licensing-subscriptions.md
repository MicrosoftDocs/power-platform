---
title: "Get access to Power Virtual Agents"
description: "Compare the capabilities you can access in Power Virtual Agents depending on whether you have a Microsoft 365 subscription or standalone Power Virtual Agents subscription."
keywords: "Administration, licensing, PVA, standalone, compare, comparison"
ms.date: 5/19/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "licensing, admin, ceX"
ms.collection: virtual-agent
---

# Licensing for Power Virtual Agents

This topic includes details about Power Virtual Agents Licensing. You can also review the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130) to learn more.

If you already have licenses, see the [Assign licenses and manage access to Power Virtual Agents](requirements-licensing.md) topic.

Power Virtual Agents is [available in the US Government Community Cloud (GCC) plan](requirements-licensing-gcc.md). Availability in the GCC High plan is estimated to be available by the end of 2021. For more information and to request assistance, visit the [Power Virtual Agents Community](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Community/ct-p/PVACommunity). 

## Power Virtual Agents for Microsoft Teams plan

Power Virtual Agents for Microsoft Teams enables customers to build conversational interfaces within Microsoft Teams. The chatbots can use data stored in Microsoft Dataverse for Teams or many other sources using the supplied standard connectors.

Capabilities available in the Power Virtual Agents app in Microsoft Teams are available as part of select Microsoft 365 subscriptions with Microsoft Power Platform and Microsoft Teams capabilities, excluding plans for US government environments (GCC, GCC High, and DoD) and EDU A1 and SUB SKUs.



This table compares key capabilities in the Power Virtual Agents for Microsoft Teams plan, which is available in select Microsoft 365 subscriptions, against the standalone Power Virtual Agents subscription. For a full list of difference, see the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

Also see the [Quotas, limits, and configuration values](requirements-quotas.md) topic for other capacity considerations.


Capability | Select Microsoft 365 subscriptions | Power Virtual Agents subscription
--|--|--
Deploy bot to channels | [Microsoft Teams](teams/publication-add-bot-to-microsoft-teams-teams.md) | [Any channel supported by Power Virtual Agents](publication-fundamentals-publish-channels.md)
Power Automate connectors | [Standard connectors available for flows triggered from Power Virtual Agents](teams/advanced-flow-teams.md) | [Premium connectors available for flows triggered from Power Virtual Agents](advanced-flow.md)
Web security | [Secure access enabled by default, no ability to generate secrets to enable secure access](teams/configure-web-security-teams.md) | [Ability to generate secrets and turn on or off secure access as wanted by the bot author](configure-web-security.md)
Use Microsoft Bot Framework skills | Not available | [Ability to extend Power Virtual Agents bots with Microsoft Bot Framework skills](advanced-use-skills.md)
Integrate Microsoft Bot Framework dialogs | Not available | [Develop custom dialogs with Bot Framework Composer](advanced-bot-framework-composer.md)
Hand off bot conversation to a live agent | Not available | [Trigger hand-off to a live agent](advanced-hand-off.md)

>[!NOTE]
>A paid, standalone Power Virtual Agents subscription is required to run flows with premium connectors in the context of Power Virtual Agents chatbots.  
Similarly, use rights and functionality available as part of paid, standalone Power Automate subscriptions serve automation scenarios and cannot be applied to Power Virtual Agents scenarios.

### Upgrading your license
To access the full range of Power Virtual Agents capabilities, you need to upgrade your plan to a standalone Power Virtual Agents subscription. 

After you upgrade your license, you can continue using the same bot in the same environment. Capabilities that were previously only available in a standalone license will now be available. These capabilities may include those that result in [billed sessions that require Power Virtual Agents capacity](analytics-billed-sessions.md)).

You can upgrade from within the Power Virtual Agents app for Microsoft Teams when prompted, as in the following example when publishing to other channels:
   
:::image type="content" source="media/upgrade-channels.png" alt-text="You need an upgraded license to publish to channels other than Teams.":::

You can also [start a 60 day free trial of Power Virtual Agents](https://aka.ms/trypva) to try out all the capabilities. You'll be prompted to sign up for a trial if you try to create a bot without a license.

:::image type="content" source="media/upgrade-create.png" alt-text="You are prompted to start a free trial or upgrade to a premium when creating a bot without a license.":::

>[!NOTE]
>The option to create a free trial may be disabled. For more information, see the [Self-service sign-up disabled section](sign-up-individual.md#self-service-sign-up-disabled).

## Standalone Power Virtual Agents subscription
The standalone Power Virtual Agents subscription allows you to build chatbots on any supported channel and connect to any data using premium connectors. 

You can obtain a standalone Power Virtual Agents subscription from the Microsoft 365 admin center. Learn more at the [Assign licenses and manage access to Power Virtual Agents](requirements-licensing.md) topic.


## Other subscriptions that include Power Virtual Agents
Entitlements for Power Virtual Agents are included in Digital Messaging and Chat add-ons for Dynamics 365 Customer Service. For more information, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544&usg=AOvVaw31TJQMIji481LIHcfzy3Qw).

[!INCLUDE[footer-include](includes/footer-banner.md)]
