---
title: Generative answers with Azure OpenAI on your data
description: "Boost conversations using Azure OpenAI on your data"
keywords: "PVA"
ms.date: 07/31/2023
ms.topic: how-to
author: mainguy70
ms.author: mainguy70
ms.reviewer: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Generative answers with Azure OpenAI on your data

By connecting Power Virtual Agents with Azure OpenAI on your data, users will be able to leverage the resources from Azure in the Generative Answers node. [Azure OpenAI on your data](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/use-your-data). works with OpenAI's powerful language models and Azure Cognitive Search to index your data to provide responses while complying with their organizational policies. Businesses can use these models to chat, view data citations, and customize chat experiences based on their data

To get started, connect your data source using [Azure OpenAI Studio](https://openai.studio-ppe.azure.com/) and start asking questions and chatting on your data.
![image.png](/.attachments/image-17344070-b3a3-41e3-a95b-c8974fbfb81b.png)

To connect a Power Virtual Agent bot to your data, select 'Deploy'. The bot is created an automatically connected to your Azure resource
![image.png](/.attachments/image-fb615231-bd18-4b2b-9ce1-274f76937d68.png)



## Create with Generative Answers node

The Generative answers node allows you to use generative answers with your a bot's topic. This allows you to connect to your Azure data  from the node level to further boost your bot's conversations.

1. A Conversational boosting system topic is automatically generated when the bot is created from Azure OpenAI Studio.
![image.png](/.attachments/image-8000c230-28ce-46a1-9f4d-6baa01c47343.png)

1. Under the **Advanced** menu, add a **Generative answers** node.
 
    :::image type="content" source="media/nlu-gpt/generative-ans-node-22May23.png" alt-text="Screenshot of adding a Search and summarize content node.":::

1. On the Generative answers node, select **Edit** under **Data sources**.

    :::image type="content" source="media/nlu-gpt/create-gen-ans-node-image-highlight-22May23.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. You can edit the connection to Azure OpenAI Service.

    ![image.png](/.attachments/image-a03c477d-aabb-4a47-abac-b3ec2877142c.png)

1. When you're done editing, close the menu. Make sure to save any changes to your topic.

The topic will now generate answers from the information sources via Azure OpenAI on your data connection.

>[!CAUTION]
> Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback. 

These methods of boosting your bot using generative answers allow you to specify information sources for the entire bot (for instance, with a URL at bot creation) and also use alternate information sources within a topic (with the **Generative answers** node).
