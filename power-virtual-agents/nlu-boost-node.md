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

When you created your bot, you were invited to enter a url from which your bot could to generate responses. This is discussed in detail in [Boost conversations](nlu-boost-conversations.md). You can further boost your bot's conversations by using multiple information sources, both internal and external [to your network (?)], including:

External sources:

 - Bing Search
 - [Bing Custom Search](https://www.customsearch.ai/)
  
Internal resources:

 - SharePoint
 - OneDrive
 - Other internal information sources
 - (Project Wednesday)
 - DataVerse.

In addition, you can add information sources to a topic using the Search and summarize content node. This node allows you to specify sources that the *node* will search, based on the inputs you give it. The results of the search will be summarized and checked for data viability. [**Question**: Does this override or augment the "normal" boosted sources?]

Together, these methods of boosting your bot's conversation provide for more "global" information support (i.e., boosted conversations), and tailored "local" information support at specific points within a topic via node-specific information sources (would saying "boosted node" be inappropriate here?).

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

## Search and Summarize content

 You can add Generative Answers to your bot by adding a Search and summarize content node. This allows you to search internal and external information sources from the node level to further boost your bot's conversations.

1. Open the authoring canvas for your topic, and identify the point where you want to Search and summarize content.

1. Click on the '+' where you would like to add the Search and Summarize node.

1. Add a Search and Summarize content node.(image: *plus with options menu; display S&S option*)

1. On the Search and summarize node, select Properties from the node menu and select Data source
 
1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](#information-sources). (Note here about the other options (Variable or PowerFX) - what is the integration?)(image: data sources menu)

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.(image: save topic?)

Your bot will use the collected information in line with the topic flow to provide a response.

## Really cool examples (though admittedly, it's all pretty cool!)

### Connect to a single URL to boost a conversation
    
    A standard example - looks a lot like creating a bot.
    - bot creation (all over the place in the content - just refer to)
    - update/change default/fallback url from bot creation

### Connect a Bing Custom Search to search a number of websites
    - link to [Bing Custom Search](https://www.customsearch.ai/)
    - Do I have these instructions somewhere? Where else can we direct users?

### Connect to a Sharepoint
    - Maybe this is the first real "authentication" example? Make sure to call out in boosted convo docs

### Search and summarize into variables
    - The multiple options that come up in S&S instructions should refer to here
    - Thoughts on variables?

## What else can multiple sources/S&S do?