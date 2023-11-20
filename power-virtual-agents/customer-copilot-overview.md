---
title: Create copilots for customer engagement and hand off
description: Overview of Customer Copilot  
ms.reviewer: clmori
ms.date: 10/24/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: power-virtual-agents
ms.service: power-virtual-agents
---


# Create copilots for customer engagement and hand off

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can create copilots to interact with your customers and integrate with customer service and customer engagement hubs. 

Customer copilots provide your customers with generative-AI-based self-help. The copilot can answer questions and provide information from what's on your company website, within files you upload, or from your knowledge base sources. 

When necessary, the customer can be escalated to a live agent with integrated hand off to the customer engagement hub that you already use, including Dynamics 365 Customer Service, ServiceNow, Salesforce, Live Person, and Genesys.

First, you'll need to create a copilot with generative AI, and tell it where it should look for information it can use when interacting with your customer. The copilot will use that information to determine the best answer or response to the user's question and return the information in a conversational tone.

Once you've created and tested your copilot, you can configure integration between the copilot and your engagement hub, including hand off to a live agent.

## Create a copilot and connect it to your knowledge source

If you haven't create copilots in Copilot Studio before, follow the steps in the [Quickstart guide for building copilots with generative AI](nlu-gpt-quickstart.md).

If you already have a copilot that you've built with Power Virtual Agents or Copilot Studio, you can go straight to the instructions for [adding a generative answers node](nlu-boost-node.md) to connect your copilot to your data.

>[!IMPORTANT]
>  
> Generative AI features won't work in "classic" chatbots. A classic chatbot will be marked as such in the list of copilots in Copilot Studio. These are chatbots made with older versions of Microsoft Copilot Studio and its predecessor, Power Virtual Agents. If it's labelled as a copilot then generative AI features will work.

### Connect to knowledge sources

[!INCLUDE[node-sources](includes/blocks/node-sources-table.md)]


## Configure hand off to customer engagement hubs

- [Dynamics 365 Customer Service](configuration-hand-off-omnichannel.md)
- [ServiceNow](customer-copilot-servicenow.md)
- [Salesforce](customer-copilot-salesforce-handoff.md)
- [Live Person](customer-copilot-liveperson-handoff.md)
- [Generic customer engagement hub](configure-generic-handoff.md  )

## Configuring Copilot behavior

The following fields are available under **Copilot details** on the side navigation pane and let you customize your copilot for tone and behavior. 


Field | Description
--- | ---
Greeting message | What the copilot says when greeted.
Start over message | What the copilot says when the user asks to start the conversation over.
Conversation start message | What the copilot says when opened.
Escalate link | A link for the user to talk to an agent.
No match message | What the copilot says when it doesn't have topics for the user's input.
Multiple topics matched | What the copilot says to ask the user to clarify their meeaning.
Reset conversation message | What the copilot says after starting the conversation over.

