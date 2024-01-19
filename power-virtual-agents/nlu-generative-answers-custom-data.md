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

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

In some cases, your data might not exist in a supported data source. However, you can provide your own data through Power Automate Flows. You then format the results into a JSON object  as a variable or expression to generate answers.

The custom data field takes a JSON array of objects, representing a set of `ContentLocation`/`Content` pairs, as in the following exmaple:

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

Copilot answers are generated from `Content` and include the link to the data source in `ContentLocation`.

## Use custom data

1. Open the **Data source** configuration pane from one of two places:

   1. On the **Create generative answers** node, select **Edit** under **Data sources**.

      :::image type="content" source="media/nlu-gpt/select-properties-from gen-ans.png" alt-text="Screenshot that shows where to select the Properties pane.":::

   1. Alternatively, select the `...` in the **Create generative answers** node, then select **Properties** to open a pane, and finally select **Data source**.

1. In the **Custom data** field, enter the JSON array you want to use or the variable for the array.

1. Select **Save** to save any changes to your topic.

> [!IMPORTANT]
> Information sources defined in the **Generative answers** node take priority at the copilot level. Copilot level sources function as a fallback.
