---
title: Generative answers with Azure OpenAI on your data
description: "Boost conversations using Azure OpenAI on your data."
keywords: "PVA"
ms.date: 07/31/2023
ms.topic: how-to
author: mainguy70
ms.author: iawilt
ms.reviewer: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Use a connection to Azure OpenAI on your data for generative answers

By connecting Power Virtual Agents with Azure OpenAI on your data, your bots can leverage resources from Azure through the Generative answers node. [Azure OpenAI on your data](/azure/ai-services/openai/concepts/use-your-data) works with the powerful language models in OpenAI and Azure Cognitive Search to index your data and provide responses while complying with your organizational policies. 

## Prerequisites

- Connect your data source using [Azure OpenAI Studio](https://openai.studio-ppe.azure.com/).

  :::image type="content" source="media/nlu-gpt/generative-answers-azure-connect.png" alt-text="Screenshot showing the Azuree OpenAI Studio.":::

- Connect a Power Virtual Agents bot to your data by selecting **Deploy to** and then **A new Power Virtual Agents bot**. The bot is created and automatically connected to your Azure resource in your default environment.

  :::image type="content" source="media/nlu-gpt/aoai-default-instance.png" alt-text="Screenshot showing deployment of the bot into the default environment.":::


> [!IMPORTANT]
>  
> Your bot must be created in the US region. 
>  
> Other regions, and languages other than English, aren't supported.

> [!NOTE]
> A Conversational boosting system topic is automatically generated when the bot is created from Azure OpenAI Studio.
>  
> :::image type="content" source="media/nlu-gpt/generative-answers-azure-topic.png" alt-text="Screenshot showing the conversational boosting topic in the list of topics."::: boosted topic

To use Azure OpenAI:

1. In Power Virtual Agents, open the **Data source** configuration pane for your [topic's generative answers node](nlu-boost-node.md):

    - Open the **Properties** pane for the **Create generative answers** node and select **Data source**.
    - On the **Create generative answers** node, select **Edit** under **Data sources**.
    
    :::image type="content" source="media/nlu-gpt/create-gen-ans-node-image-highlight-22May23.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. Edit the connection to the Azure OpenAI Service.

    :::image type="content" source="media/nlu-gpt/generative-answers-azure-source.png" alt-text="Screenshot showing the Azure OpenAI source."::: 

1. When you're done entering sources, close the menu. Make sure to save any changes to your topic.

The topic will now generate answers from the information sources defined by your Azure OpenAI connection.

>[!CAUTION]
> Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback.
>



