---
title: Search public data or use a Bing Custom Search for generative answers
description: Use Bing as a source for searching for answers.
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

# Search public data or use a Bing Custom Search for generative answers

You can search publicly available data by using the Bing search engine API. 

You can use the default Bing search configuration, or you can connect to a [Bing Custom Search](https://www.customsearch.ai/), which allows you to build a tailored search for specific content. 

This means you can use a large number of sources to boost your bot without having to enter each source individually. To use Bing Custom search as a source, you'll need a custom search instance that you connect to the **Create generative answers** node. 

If you haven't created a Bing Custom Search, follow the [Quickstart: Create your first Bing Custom Search instance](/bing/search-apis/bing-custom-search/how-to/quick-start). 

To use Bing search or a Bing Custom Search:

1. Open the **Data source** configuration pane for your topic's node:

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the Generative answers node data sources menu.":::

    - Open the **Properties** pane for the **Create generative answers** node and select **Data source**.
    - On the **Create generative answers** node, select **Edit** under **Data sources**.
    
    :::image type="content" source="media/nlu-gpt/create-gen-ans-node-image-highlight-22May23.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. Under **Search public data** you can choose how you want to search:
   - To use Bing to search publicly available web content, choose **Search public websites**.
   - To use a Bing Custom Search, choose **Search with Bing Custom Search**, and enter your Custom Configuration ID in the **Configuration ID** input box. To get the ID:  
        1. On the Bing Custom Search web portal, open the search instance you want to use.
        2. Select **Production** from the top menu, and then under the **Endpoints** section select the **Web API** tab.
        3. Copy the **Custom Configuration ID**.

    :::image type="content" source="media/nlu-gpt/generative-answers-bing-custom.png" alt-text="Screenshot showing the Search public data section and Configuration ID boxes highlighted in the generative answers property pane.":::

1. When you're done entering sources, close the menu. Make sure to save any changes to your topic.

The node will now retrieve content from the information sources in the Bing Custom Search instance you've linked the node to.

>[!CAUTION]
> Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback. 

