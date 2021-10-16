---
title: "Configure hand-off to Omnichannel for Customer Service"
description: "Have human agents intercede in bot conversations by connecting Power Virtual Agents to Omnichannel."
keywords: "PVA"
ms.date: 10/20/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw  
ms.author: iawilt
ms.reviewer: clmori
manager: shellyha
ms.collection: virtual-agent
ms.custom: handoff, ceX
---

# Configure seamless and contextual hand-off to Omnichannel for Customer Service

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

With Power Virtual Agents, you can seamlessly and contextually hand off escalated Power Virtual Agents conversations to live (human) agents using [Omnichannel for Dynamics 365 Customer Service](/dynamics365/omnichannel/omnichannel-customer-service-guide). 

When you hand off a conversation, you share the full history of the conversation (the context) as well as all user-defined variables. This allows Omnichannel for Customer Service to route incoming escalations to the right live agent queue and enables engaging live agents to review context from the prior conversation and resume the conversation.

For more information about hand off, and how to use hand-off within a bot conversation, see the [Using Transfer to agent node](./advanced-hand-off.md) topic.

## Prerequisites
* You'll need to install the [Omnichannel extension solution](https://go.microsoft.com/fwlink/?linkid=2174861) in the environment where you have your bots.
* Product license: You need a [product license for Power Virtual Agents](https://go.microsoft.com/fwlink/?LinkId=2092080&clcid=0x409) and a [product license for Omnichannel for Customer service](/dynamics365/customer-engagement/omnichannel/try-chat-for-dynamics365).
* Role: You must be assigned the Omnichannel administrator role to add bots in Omnichannel for Customer Service. More information: [Understand roles and their privileges](/dynamics365/omnichannel/administrator/add-users-assign-roles#understand-roles-and-their-privileges).
* Azure Application ID: You will need an [application registered in Azure](/azure/active-directory/develop/howto-create-service-principal-portal#create-an-azure-active-directory-application) prior to connecting to Omnichannel for Customer Service.
* [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]



## Configure hand-off in the Power Virtual Agents app

Sign in to the Power Virtual Agents bot you want to connect to Omnichannel for Customer Service.


1. Select **Settings**, and then **Transfer to agent**.
    
    ![IMAGE SHOWING SETTINGS PANEL OPENED.](media/handoff-settings.png)


1. Select the **Dynamics 365 Omnichannel for Customer Service** tile.

    ![IMAGE SHOWING OC TILE IN SETTINGS.](media/handoff-oc-tile.png)


1. To acknowledge the privacy policy, select **Next**. 
    >[!CAUTION]
    >Ensure that you adhere to [data sovereignty](data-location.md) laws when you configure this integration as your bot will store and send user information to your Omnichannel for Customer Service instance.

1. Follow the steps to create or reuse an existing Azure application ID. Copy the *Application (client) ID* and paste it in the text box provided.

    >[!IMPORTANT]
    >Omnichannel models bots as "application users" in the system. Therefore, the *Application (client) ID* that you use must be unique to your organization (your Microsoft Dataverse organization or environment).

1. Power Virtual Agents uses a [Teams channel](./publication-fundamentals-publish-channels.md) to communicate with Omnichannel for Customer Service. If a Teams channel is not enabled, a Teams channel will be enabled when you select **Next**. 

1. Select the environment where your Omnichannel for Customer Service instance is provisioned.

1. Select the **Go to Omnichannel** link to [continue configuring the bot connection in Omnichannel for Customer Service](/dynamics365/omnichannel/administrator/configure-bot-virtual-agent).




>[!IMPORTANT]
>Your bot must be in a published state for end-to-end capabilities to work as expected. Ensure that you have [published your bot](./publication-fundamentals-publish-channels.md) prior to validating the integrated experience.  
>  
>If you want to test the bot on your custom website, you must use the embed code that is specified in the chat widget you set up in Omnichannel (see **Prerequisites** in the [Integrate a Power Virtual Agents bot](/dynamics365/omnichannel/administrator/configure-bot-virtual-agent#prerequisites) article). If you use the embed code from the Power Virtual Agents site, hand-off will not occur correctly.

## Remove Omnichannel for Customer Service connection
You can remove a bot from Omnichannel for Customer Service by disconnecting the connection in Power Virtual Agents.

1. Sign in to the Power Virtual Agents bot you want to connect to Omnichannel for Customer Service.

1. Select **Settings**, and then **Transfer to agent**.

1. Under **Dynamics 365 Omnichannel Customer Engagement**, select **Disconnect**.

    :::image type="content" source="media/configuration-hand-off-omnichannel/disconnect-omnichannel.png" alt-text="Screenshot of the Transfer to agent page in Power Virtual Agents where you can select the Disconnect button to remove the connection.":::


## Known limitations
See [Known limitations when using Power Virtual Agents with Omnichannel for Customer Service](/dynamics365/omnichannel/administrator/configure-bot-virtual-agent#known-limitations) for more information.



[!INCLUDE[footer-include](includes/footer-banner.md)]
