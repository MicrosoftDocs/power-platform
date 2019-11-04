---
title: "Configure hand-off to Omnichannel for Customer Service"
description: "Have human agents intercede in bot conversations by connecting Power Virtual Agents to Omnichannel."
ms.date: 10/30/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: iaanw  
ms.author: iawilt
ms.reviewer: pawant
manager: shellyha
ms.collection: virtual-agent
ms.custom: handoff
---

# Configure seamless and contextual hand-off to Omnichannel for Customer Service
With Power Virtual Agents, you can seamlessly and contextually hand off escalated Power Virtual Agents conversations to live (human) agents using [Omnichannel for Dynamics 365 Customer Service](https://docs.microsoft.com/dynamics365/omnichannel/omnichannel-customer-service-guide). 

When you hand off a conversation, you share the full history of the conversation (the context) as well as all user-defined variables. This allows Omnichannel for Customer Service to route incoming escalations to the right live agent queue and enables engaging live agents to review context from the prior conversation and resume the conversation.

For more information about hand off, and how to use hand-off within a bot conversation, see the [Using Transfer to agent node](how-to-handoff.md) topic.

## Pre-requisites
* Product license: You need a [product license for Power Virtual Agents](https://go.microsoft.com/fwlink/?LinkId=2092080&clcid=0x409) and [a product license for Omnichannel for Customer service](https://docs.microsoft.com/dynamics365/customer-engagement/omnichannel/try-chat-for-dynamics365).
* Role: You must be an [Omnichannel for Customer Service Administrator](https://docs.microsoft.com/dynamics365/customer-engagement/omnichannel/administrator/add-users-assign-roles) in Omnichannel for Customer Service.
* Azure Application ID: You will need an [application registered in Azure](https://docs.microsoft.com/azure/active-directory/develop/howto-create-service-principal-portal#create-an-azure-active-directory-application) prior to connecting to Omnichannel for Customer Service.


## Configure hand-off in the Power Virtual Agents app

Sign in to the Power Virtual Agents instance you want to connect to Omnichannel for Customer Service.


1. Select **Settings**, and then **Transfer to agent**.
    
    ![IMAGE SHOWING SETTINGS PANEL OPENED](media/handoff-settings.png)


1. Select the **Dynamics 365 Omnichannel for Customer Service** tile.

    ![IMAGE SHOWING OC TILE IN SETTINGS](media/handoff-oc-tile.png)


1. To acknowledge the privacy policy, select **Next**. 
    >[!CAUTION]
    >Ensure that you adhere to [data sovereignty](data-location.md) laws when you configure this integration as your bot will store and send user information to your Omnichannel for Customer Service instance.

1. Follow the steps to create or reuse an existing Azure application ID. Copy the *Application (client) ID* and paste it in the text box provided.

1. Power Virtual Agents uses a [Teams channel](getting-started-deploy.md) to communicate with Omnichannel for Customer Service. If a Teams channel is not enabled, a Teams channel will be enabled when you select **Next**. 

1. Select the environment where your Omnichannel for Customer Service instance is provisioned.

1. Select the **Go to Omnichannel** link to [continue configuring the bot connection in Omnichannel for Customer Service](https://docs.microsoft.com/dynamics365/omnichannel/administrator/configure-bot-virtual-agent).

<!--
>[!NOTE]
>If you see an error, review the possible [errors and mitigations listed below](#mitigations-for-known-issues).
-->


>[!NOTE]
>Your bot must be in a published state for end-to-end capabilities to work as expected. Ensure that you have [published your bot](getting-started-deploy.md) prior to validating the integrated experience.

## Mitigations for known issues
If you experience issues, see below for possible mitigations.
<!--note from editor: We don't have headings without content underneath them, so I added a sentence. Feel free to make it better. 
It's also worth asking if the info should go in a KB instead of product documentation. What you have below looks like it should go in a readme, but I'm not aware of one being done where you could add this. -->

### Remove Omnichannel for Customer Service connection
Once your bot has been connected to Omnichannel for Customer Service, you cannot remove the connection setting. If you erroneously connected to the wrong instance or environment, you will need to create a new bot and try connecting to Omnichannel for Customer Service again.

### Specific content doesn't appear in Omnichannel for Customer Service
Some content may not show, such as emojis and certain types of notes or variables. If you encounter problems with the display of content, see the [Omnichannel for Customer Service documentation library](https://docs.microsoft.com/dynamics365/omnichannel/omnichannel-readme).


<!--
### Known connection error codes and mitigations
Here are some known errors.

| Error | Description | Next steps / Mitigation |
| ------- | ------- | ------- |
| 


For errors not shown here, please reach out to your dedicated Microsoft support contact.
-->

[!INCLUDE [handoff-known-limitations](includes/handoff-known-limitations.md)]
