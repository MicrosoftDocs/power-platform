---
title: Boost conversations (preview)
description: 
keywords: "PVA"
ms.date: 5/03/2023
ms.topic: how-to
author: KendalBond007
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Boost conversations with Search and summarize

When you created your bot, you were invited to enter a url from which your bot could to generate responses. This is discussed in detail in [Generative answers](nlu-boost-conversations.md). You can further boost your bot's conversations by using multiple information sources, both internal and external [to your network (?)], including:

External sources:

 - Bing Search
 - [Bing Custom Search](https://www.customsearch.ai/)
  
Internal resources:

 - SharePoint
 - OneDrive
 - Other internal information sources
 - (Project Wednesday)
 - DataVerse.

In addition, you can add information sources to a topic using the **Search and summarize content node**. This node allows you to specify sources that the *node* will search, based on the inputs you give it. The results of the search will be summarized and checked for data viability. [**Question**: Does this override or _augment_ the "normal" boosted sources?]

These methods of boosting your bot using **generative answers** allows you to specify information sources for the entire bot (for instance, with a url at bot creation) and use additional information sources within a topic via the Search and summarize node.

## Information Sources

This table summarizes knowledge resources Generative Answers can use to boost conversations.

| Name | Source | Description | Number of Inputs | Authentication |
| --- | --- | --- | --- | --- |
| Bing Search | External | Searches the query in put on Bing; returning results only from provided websites | 4 public urls (for example, microsoft.com) | None |
| [Bing Custom Search](https://www.customsearch.ai/) | External | Query input filtered based on a website configuration external to PVA | More than 4 urls (Bing Custom Search also provides other functionality) | None |
| Sharepoint | Internal | Connects to a SharePoint url, uses GraphSearch to return results | 4 urls | C2 Azure Active Directory authentication |
| OneDrive | Internal | Connects to a OneDrive url, uses GraphSearch to return results | 4 urls | C2 Azure Active Directory authentication |
| Other internal data | Internal | ... | ... | ... |
| Project Wednesday | Internal | Azure Open AI knowledge repository | ... | ... |

## Search and Summarize content node

 Adding a Search and summarize content node allows you to use generative answers with your a bot's topic. This allows you to search internal and external information sources from the node level to further boost your bot's conversations.

1. Open the authoring canvas for your topic, and identify the point where you want to use Search and summarize content.

1. Click on the '+' where you would like to add the Search and Summarize node.

1. Add a Search and Summarize content node.
 
    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-node.png" alt-text="Screenshot of the adding a Search and summarize node.":::

1. On the Search and summarize node, select Properties from the node menu and select Data source

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-properties.png" alt-text="Screenshot of the Search and summarize node properties.":::

1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](#information-sources). (Note here about the other options (Variable or PowerFX) - what is the integration?)(image: data sources menu)

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the  Search and summarize node Data sources menu.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.(image: save topic?)

The topic will now Search and summarize content from the information sources provided _to the node_. [What happens when that doesn't provide a cogent answer? Fallback?]

## Adding generative answers from different sources

This sections provides instructions on boosting conversations with generative answers for several scenarios.

### Connect to a single URL to boost a conversation

#### [Bot]

When you create a bot using the unified canvas, you are invited to boost it's conversations with generative answers. [Create a boosted bot](nlu-gpt-quickstart.md#create-a-boosted-bot) takes you through this process.

You can also change the URL, disable **generative answers**, or change the level of content moderation in the settings for the bot:

1. With a bot open, expand **Settings** on the side navigation pane, and select **AI Capabilities**.

    1. Under **Boost conversational coverage (preview)**, use the checkbox for **GA** to enable or disable the capability.

    1. In the field under the checkbox, add or change the URL. The [same requirements apply for the URL](nlu-boost-conversations#url-considerations) as when enabling the capability when you create a bot.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-enable.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Generative Answers enabled and highlighted.":::

    1. Under **Bot content moderation**, select the level you want for your bot. A higher level of moderation means that the bot’s answers will be more relevant. A lower level of moderation means that the bot generates more answers, but the answers may be irrelevant or undesirable.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-content-moderation.png" alt-text="Screenshot of the bot content moderation menu.":::    

1. Select **Save** at the top of the **AI capabilities** page.

You can now test your bot to see how well it responds to questions related to the content on the URL you specified. For more details, refer to [Test you bot's generative answers reach](nlu-gpt-quickstart.md#test-your-bots-generative-anwers-reach)

#### [Search and summarize node]

To boost coverage in a Search and summarize node, follow these instructions:

1. On the Search and summarize node, select Properties from the node menu, and select Data source.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-properties.png" alt-text="Screenshot of the Search and summarize node properties.":::

1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](nlu-boost-conversations.md#information-sources).

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the  Search and summarize node Data sources menu.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.(image: save topic?)

[What (if anything) do we need to say about authentication here?]

### Use a Bing Custom Search to search a number of websites

[Bing Custom Search](https://www.customsearch.ai/) allows you to build a tailored search for specific content. The generated **Custom configuration ID** can then be used in your bot by generative answers. If you haven't used Bing Custom Search, use the link at the beginning of this paragraph, and follow [Quickstart: Create your first Bing Custom Search instance](https://learn.microsoft.com/bing/search-apis/bing-custom-search/how-to/quick-start). This will walk you through creating and publishing one. Once you have a Custom configuration ID for your search, you can use it to boost conversations with generative answers.

1. _In Bing Custom Search_, on the **Web API** tab under **Production**, copy the Custom configuration ID you want to use. This will function like a url would as described [Connect to a single URL to boost a conversation](#connect-to-a-single-url-to-boost-a-conversation). NOTE: If you have more than one custom configuration, make sure you are copying the ID you want.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-bing-custom-search-ID.png" alt-text="Screenshot of the  Search and summarize node Data sources menu.":::

1. _On the Search and summarize node in your topic_, select Properties from the node menu, and select Data source.

1. Paste your custom configuration into the [input box] under "Sites", and click on the '+' to add it to the node's Data sources.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the Search and summarize node properties.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.(image: save topic?)
 
The node will now Search and summarize content from the information sources in the Bing Custom Search configuration provided. This allows you to use a large number of sources to boost your Search and summarize node without having to enter each source individually.

[What (if anything) do we need to say about authentication here?]

### Connect to a Sharepoint

- Maybe this is the first real "authentication" example? Make sure to call out in boosted convo docs

### Search and summarize into variables

- The multiple options that come up in S&S instructions should refer to here
- Thoughts on variables?

## What else can multiple sources/S&S do?
