---
title: Generative answers with Azure OpenAI on your data (preview)
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

# Connect your data to Azure OpenAI for generative answers

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

When you connect data through Azure OpenAI in Microsoft Copilot Studio, your copilots can use resources from Azure through the generative answers node. [Azure OpenAI on your data](/azure/ai-services/openai/concepts/use-your-data) works with the powerful language models. The models of OpenAI and Azure Cognitive Search index your data and provide responses while complying with your organizational policies.

## Prerequisites

- Connect your data source using [Azure OpenAI Studio](https://openai.studio-ppe.azure.com/).

  :::image type="content" source="media/nlu-gpt/generative-answers-azure-connect.png" alt-text="Screenshot showing the Azure OpenAI Studio.":::

- Connect a Copilot Studio copilot to your data by selecting **Deploy to** and then **A new Microsoft Copilot Studio bot**. The copilot is created and automatically connects to your Azure resource in your default environment.

  :::image type="content" source="media/nlu-gpt/aoai-default-instance.png" alt-text="Screenshot showing deployment of the copilot into the default environment.":::

> [!NOTE]
> A **Conversational boosting** system topic is automatically generated when the copilot is created from Azure OpenAI Studio.
>  
> :::image type="content" source="media/nlu-gpt/generative-answers-azure-topic.png" alt-text="Screenshot showing the conversational boosting topic in the list of topics."::: boosted topic

## Use Azure OpenAI in Copilot Studio

1. Open the **Data source** configuration pane from one of two places:

   1. On the **Create generative answers** node, select **Edit** under **Data sources**.

      :::image type="content" source="media/nlu-gpt/select-properties-from gen-ans.png" alt-text="Screenshot that shows where to select the Properties pane.":::

   1. Alternatively, select the `...` in the **Create generative answers** node, then select **Properties** to open a pane, and finally select **Data source**.

1. Edit the connection to the Azure OpenAI Service.

   :::image type="content" source="media/nlu-gpt/generative-answers-azure-source.png" alt-text="Screenshot showing the Azure OpenAI source." lightbox="media/nlu-gpt/generative-answers-azure-source.png":::

1. Select **Save** to save any changes to your topic.

The topic now generates answers from the information sources defined by your Azure OpenAI connection.

> [!IMPORTANT]
> Information sources defined in the **Generative answers** node take priority at the copilot level. Copilot level sources function as a fallback.
