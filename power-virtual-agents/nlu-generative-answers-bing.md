---
title: Search public data or use a Bing Custom Search for generative answers
description: Use Bing as a source for searching for answers.
keywords: "PVA"
ms.date: 12/20/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope: "Power Virtual Agents"
---

# Search public data or use a Bing Custom Search for generative answers

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can search publicly available data by using the Bing search engine API.

You can use the default Bing Search configuration or build a tailored search for specific content using [Bing Custom Search](https://www.customsearch.ai/). Bing Search helps you boost your copilot by including many sources without configuring each source individually. To use Bing Custom Search as a source, you need a custom search instance connected to the **Create generative answers** node.

> [!NOTE]
> To create a Bing Custom Search, see [Quickstart: Create your first Bing Custom Search instance](/bing/search-apis/bing-custom-search/how-to/quick-start).

To use Bing search or Bing Custom Search:

1. Open the **Data source** configuration pane from one of two places:

   1. On the **Create generative answers** node, select **Edit** under **Data sources**.

      :::image type="content" source="media/nlu-gpt/select-properties-from gen-ans.png" alt-text="Screenshot that shows where to select the Properties pane.":::

   1. Alternatively, select the `...` in the **Create generative answers** node, then select **Properties** to open a pane, and finally select **Data source**.

1. Under **Search public data** you can choose how you want to search:

   :::image type="content" source="media/nlu-gpt/select-search-websites.png" alt-text="Screenshot showing the Search public data section and Configuration ID boxes highlighted in the generative answers property pane.":::

   - To use Bing Search, choose **Search public websites**.
   - To use a Bing Custom Search, choose **Search with Bing Custom Search** and enter your Custom Configuration ID in the **Configuration ID** input box.

     > [!TIP]
     > To get the **Configuration ID**:  
     > 1.From the [Bing Custom Search web portal](https://www.customsearch.ai/), open the search instance you want to use.
     > 1. Select **Production** from the top menu, and then under the **Endpoints** section select the **Web API** tab.
     > 1. Copy the **Custom Configuration ID**.

1. Save changes to your topic.

> [!IMPORTANT]
> Information sources defined in the **Generative answers** node take priority at the copilot level. Copilot level sources function as a fallback.
