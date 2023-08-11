---
title: Use a custom data source for generative answers
description: Provide your own data for the generative answers node.
keywords: "PVA"
ms.date: 8/7/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Use a custom data source for generative answers

In some cases, your data may not exist in one of the supported data sources. However, you can provide your own data - possibly by accessing one of your own preferred data stores through Power Automate Flows, and then formatting the results into a JSON object that can be passed as a variable or expression to generate answers.

The custom data field takes a JSON array of objects representing a set of ContentLocation/Content pairs, as in the following exmaple:

```JSON
[{
  ContentLocation: "https://contoso.com/p1.htm",
  Content: "This is a sample piece of text that was provided for testing purposes, to be replaced with content of your choice"
 },
 {
  ContentLocation: "https://fabrikam.com/p2.htm",
  Content: "This is a second bit of sample text that can be replaced with content of your choice"
}]
```
Answers will be generated from the value defined in `Content:` and will include the link to the related destination in `ContentLocation`.

To use custom data:

1. Open the **Data source** configuration pane for your topic's node:

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the Generative answers node data sources menu.":::

    - Open the **Properties** pane for the **Create generative answers** node and select **Data source**.
    - On the **Create generative answers** node, select **Edit** under **Data sources**.
    
    :::image type="content" source="media/nlu-gpt/create-gen-ans-node-image-highlight-22May23.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. In the **Custom data** field, enter the JSON array you want to use (or the variable that contains the array).

1. When you're done entering sources, close the menu. Make sure to save any changes to your topic.

>[!CAUTION]
> Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback. 
