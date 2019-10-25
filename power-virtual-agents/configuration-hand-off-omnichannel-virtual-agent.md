---
title: "Configure Virtual Agent with Omnichannel for Customer Service"
description: "Have human agents intercede in bot conversations by connecting Virtual Agent to Omnichannel."
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

# Configure seamless & contextual hand-off to Omnichannel
With Power Virtual Agents, you can seamlessly and contextually hand off escalated virtual agent conversations to live agents using [Omnichannel for Customer Service](https://docs.microsoft.com/dynamics365/omnichannel/omnichannel-customer-service-guide). 

When you hand off a conversation, you share the full history of the conversation (the context) as well as all user-defined variables. This allows Omnichannel to route incoming escalations to the right live agent queue and enables engaging live agents to review context from the prior conversation and resume the conversation.

For more information about hand off, and how to use hand-off within a bot conversation, see the [Using Transfer to agent node](how-to-handoff.md) topic.

## Pre-requisites
* Product license: You need [product licenses for both Virtual Agent](https://go.microsoft.com/fwlink/?LinkId=2092080&clcid=0x409) and [Omnichannel for Customer service](https://docs.microsoft.com/en-us/dynamics365/customer-engagement/omnichannel/try-chat-for-dynamics365).
* Role: You must be an [Omnichannel Administrator](https://docs.microsoft.com/en-us/dynamics365/customer-engagement/omnichannel/administrator/add-users-assign-roles) in Omnichannel.
* Azure Application ID: You will need an [application registered in Azure](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal#create-an-azure-active-directory-application) prior to connecting to Omnichannel.


## Configure hand-off in the Virtual Agent app

Sign in to the Virtual Agent instance you want to connect to Omnichannel.


1. Select **Settings** then **Transfer to agent**.
    
    ![IMAGE SHOWING SETTINGS PANEL OPENED](media/handoff-settings.png)


1. Select the **Dynamics 365 Omnichannel for Customer Service** tile.

    ![IMAGE SHOWING OC TILE IN SETTINGS](media/handoff-oc-tile.png)


1. Select **Next** to acknowledge the privacy policy. 
    >[!CAUTION]
    >Ensure that you are adhere to [data sovereignty](data-location.md) laws when configuring this integration as your bot will store and send user information to your Omnichannel instance.

1. Follow the steps to create or reuse an existing Azure application ID. Copy the *Application (client) ID* and paste it in the text box provided.

1. Virtual Agent uses a [Teams channel](getting-started-deploy.md) to communicate with Omnichannel. If a Teams channel is not enabled, a Teams channel will be enabled when you select **Next**. 

1. Select the environment where your Omnichannel instance is provisioned.

1. Select the **Go to Omnichannel** link to [continue configuring the bot connection in Omnichannel](https://docs.microsoft.com/en-us/dynamics365/omnichannel/administrator/configure-bot-virtual-agent).


>[!NOTE]
>If you see an error, review the possible [errors and mitigations listed below](#mitigations-for-known-issues).

>[!NOTE]
>Your bot must be in a published state for end-to-end capabilities to work as expected. Ensure that you have [published your bot](getting-started-deploy.md) prior to validating the integrated experience.

## Mitigations for known issues

## Remove Omnichannel connection
Once your bot has been connected to Omnichannel, you cannot remove the connection setting at this time. If you erroneously connected to the wrong Omnichannel instance or environment, you will need to create a new bot and try connecting to Omnichannel again.

### Specific content doesn't appear in Omnichannel
Some content may not show, such as emojis and certain types of notes or variables. If you encounter problems with the display of content, see the [Omnichannel documentation library for more details](https://docs.microsoft.com/en-us/dynamics365/omnichannel/omnichannel-readme).



### Known connection error codes and mitigations
Here are some known errors.

| Error | Description | Next steps / Mitigation |
| ------- | ------- | ------- |
| 

>[!WARNING]
><span style="background-color:yellow;">What errors are there?</span>

For errors not shown here, please reach out to your dedicated Microsoft support contact.
