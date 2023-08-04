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

<mark>IDW's to-dos:

- [ ] Check against UI for formatting/labelling
- [ ] Decide on node name format
- [ ] Check connection/node properties
- [ ] Check other GenAns node topics and update to match this one; redo the intro topic
- [ ] Get images and write alt text (svg?)

</mark>

By connecting Power Virtual Agents with Azure OpenAI on your data, your bots can leverage resources from Azure through the Generative answers node. [Azure OpenAI on your data](/azure/ai-services/openai/concepts/use-your-data) works with the powerful language models in OpenAI and Azure Cognitive Search to index your data and provide responses while complying with your organizational policies. 

To get started, connect your data source using [Azure OpenAI Studio](https://openai.studio-ppe.azure.com/), and start asking questions and chatting on your data.

:::image type="content" source="/.attachments/image-17344070-b3a3-41e3-a95b-c8974fbfb81b.png" alt-text="image.png":::

To connect a Power Virtual Agent bot to your data, select **Deploy**. The bot is created and automatically connected to your Azure resource.

:::image type="content" source="/.attachments/image-fb615231-bd18-4b2b-9ce1-274f76937d68.png" alt-text="image.png":::



## Create with the Generative answers node

The Generative answers node allows you to use generative answers within a bot's topic. This means you can connect to your Azure data at the node level to further boost your bot's conversations.

A Conversational boosting system topic is automatically generated when the bot is created from Azure OpenAI Studio.

:::image type="content" source="/.attachments/image-8000c230-28ce-46a1-9f4d-6baa01c47343.png" alt-text="image.png":::

1. With a topic open for editing in Power Virtual Agents, from the **Advanced** menu add a **Generative answers** node.
 
    :::image type="content" source="media/nlu-gpt/generative-ans-node-22May23.png" alt-text="Screenshot of adding a Search and summarize content node.":::

1. On the Generative answers node, under **Data sources**, select **Edit**.

    :::image type="content" source="media/nlu-gpt/create-gen-ans-node-image-highlight-22May23.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. Edit the connection to the Azure OpenAI Service.
<mark>[IDW] This might need some more info - will check against the UI</mark>

    :::image type="content" source="/.attachments/image-a03c477d-aabb-4a47-abac-b3ec2877142c.png" alt-text="image.png":::

1. When you're done editing, close the menu. Make sure to save any changes to your topic.

The topic will now generate answers from the information sources via the *Azure OpenAI on your data* connection.

<mark>[IDW] Need to check UI labeling</mark>

>[!CAUTION]
> Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback. 

These methods of boosting your bot using generative answers allow you to specify information sources for the entire bot (for instance, with a URL at bot creation) and also use alternate information sources within a topic (with the **Generative answers** node).
