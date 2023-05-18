---
title: Boost conversations (preview)
description: "Use the Search and summarize content to boost conversations."
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

# Generative answers with Search and summarize content

When you created your bot, you were invited to enter a url from which your bot could to generate responses. This is discussed in detail in [Generative answers](nlu-boost-conversations.md). You can further boost your bot's conversations by using multiple internal and external information sources, including:

External sources:

 - Bing Search
 - [Bing Custom Search](https://www.customsearch.ai/)
  
Internal resources:

 - SharePoint
 - OneDrive for Business
 - DataVerse
 - Custom data (internal or external): Supply your own content from any source; for instance, from a Power Automate Flow, Skill, or other source.

In addition, you can add information sources to a topic using the **Search and summarize content*** node. This node allows you to specify sources that the *node* will search, based on the inputs you give it. The results of the search will be summarized and checked for data viability. Note that this node's information sources override those you may have specified at the bot level, which function as a fallback. 

These methods of boosting your bot using **generative answers** allows you to specify information sources for the entire bot (for instance, with a url at bot creation) and use alternate information sources within a topic via the Search and summarize content node.

## Information Sources

This table summarizes knowledge resources Generative Answers can use to boost conversations.

| Name | Source | Description | Number of Inputs | Authentication |
| --- | --- | --- | --- | --- |
| Bing Search | External | Searches the query in put on Bing; returning results only from provided websites | 4 public urls (for example, microsoft.com) | None |
| [Bing Custom Search](https://www.customsearch.ai/) | External | Query input filtered based on a website configuration external to PVA | More than 4 urls (Bing Custom Search also provides other functionality) | None |
| Sharepoint | Internal | Connects to a SharePoint url, uses GraphSearch to return results | 4 urls | C2 Azure Active Directory authentication |
| OneDrive for business | Internal | Connects to a OneDrive for Business url, uses GraphSearch to return results | 4 urls | C2 Azure Active Directory authentication |
| Other internal data | Internal | ... | one variable, populated with JSON results to be summarized | ... |

As the table notes, some features require user authentication to be configured for your bot. In the cases of SharePoint and OneDrive for Business, authentication is done using Azure Active Directory. User authentication for information sources also means that when a specific user asks a question of the bot, the bot will only surface content that specific user has access to read on SharePoint or OneDrive for Business.

## Create generative answers

Adding a Search and summarize content node allows you to use generative answers with your a bot's topic. This allows you to search internal and external information sources from the node level to further boost your bot's conversations.

1. Open the authoring canvas for your topic, and identify the point where you want to use Search and summarize content.

1. Click on the '+' where you would like to add the Search and Summarize content node.

1. Add a Search and Summarize content node.
 
    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-node.png" alt-text="Screenshot of the adding a Search and summarize content node.":::

1. On the Search and summarize content node, select Properties from the node menu and select Data source

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-properties.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](#information-sources). (Note here about the other options (Variable or PowerFX) - what is the integration?)(image: data sources menu)

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the  Search and summarize content node Data sources menu.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.

The topic will now Search and summarize content from the information sources provided _to the node_.

## Adding generative answers from different sources

This sections provides instructions on boosting conversations with generative answers for several scenarios.

### Connect to a single URL to boost a conversation

#### Bot settings

When you create a bot using the unified canvas, you are invited to boost it's conversations with generative answers. [Create a boosted bot](nlu-gpt-quickstart.md#create-a-boosted-bot) takes you through this process.

You can also change the URL, disable generative answers, or change the level of content moderation in the settings for the bot. Follow the instructions relating to the **AI Capabilities** in [Increasing your bot's reach](nlu-boost-conversations#increasing-your-bots-reach)

Once you have completed this process, you can test your bot to see how well it responds to questions related to the content on the URL you specified. For more details, refer to [Test your bot's generative answers reach](nlu-gpt-quickstart.md#test-your-bots-boosted-conversational-reach).

#### Search and summarize content node properties

To boost coverage in a Search and summarize content node, follow these instructions:

1. Navigate to the **Data sources** menu for the Search and summarize content node for which you want to boost coverage.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-properties.png" alt-text="Screenshot of properties of the Search and summarize content node.":::

1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](#information-sources).

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the  Search and summarize content node Data sources.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.


### Use a Bing Custom Search to search a number of websites

[Bing Custom Search](https://www.customsearch.ai/) allows you to build a tailored search for specific content. The generated **Custom configuration ID** can then be used in your bot by generative answers. If you haven't used Bing Custom Search, use the link at the beginning of this paragraph, and follow [Quickstart: Create your first Bing Custom Search instance](/bing/search-apis/bing-custom-search/how-to/quick-start). This will walk you through creating and publishing one. Once you have a Custom configuration ID for your search, you can use it to boost conversations with generative answers.

#### Bing custom search

1. On the **Web API** tab under **Production**, copy the Custom configuration ID you want to use. This will function like a url would as described [Connect to a single URL to boost a conversation](#connect-to-a-single-url-to-boost-a-conversation). NOTE: If you have more than one custom configuration, make sure you are copying the ID you want.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-bing-custom-search-ID.png" alt-text="Screenshot of the  Search and summarize content node with bing custom search.":::

#### Bot settings

1. With your bot open, expand **Settings** on the side navigation pane, and select **AI Capabilities**.

1. Enter your Bing custom search Custom Configuration ID as one of your urls. 

1. Select **Save** at the top of the **AI capabilities** page.

#### Search and summarize content node properties

1. Select Properties from the node menu, and select Data source.

1. Paste your custom configuration in the input box under "Sites", and click on the '+' to add it to the node's Data sources. If you have not exceeded relevant limits, you may add other urls.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of properties for the Search and summarize content node.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.
 
The node will now Search and summarize content from the information sources in the Bing Custom Search configuration provided. This allows you to use a large number of sources to boost your Search and summarize content node without having to enter each source individually.

### Connect to a Sharepoint or OneDrive for Business

Power Virtual Agents now supports boosting conversations using generative answers with content stored on SharePoint sites and OneDrive for Business. This capability works by pairing your bot with a specific site URL, such as contoso.sharepoint.com/sites/policies. When a bot user asks a question or makes a statement where the bot does not have a manually configured Topic to use, it will search for relevant content from that site URL and all sub-paths and will use generative answers technology to help summarize this content into a targeted response.

When analyzing internal content stored on SharePoint or OneDrive for Business, it is essential to note this happens on behalf of the signed in user, meaning this feature requires user authentication to be configured for your bot using Azure Active Directory. It also means that when a specific user asks a question of the bot, the bot will only surface content that specific user has access to read on SharePoint or OneDrive for Business.
Due to memory limits, we recommend that files saved on Sharepoint be limited in size. If a file is larger, consider saving as multiple smaller files.

#### Requirements

To use this feature, you will need:

1. A Power Virtual Agent bot created using the preview canvas  
2. A SharePoint or OneDrive for Business URL
3. An AAD application registration for employees to log (this is optional to try this in the Test Canvas, but is required if you Publish your bot and use it with channels)
 
#### Inputting a SharePoint or OneDrive for Business url

Follow the instructions for updating or changing urls as described in [Connect to a single URL to boost a conversation](#connect-to-a-single-url-to-boost-a-conversation), adding the SharePoint/OneDrive for Business url.

> [!NOTE]
>
> A best practice is to omit the http/https. Also, recognized SharePoint urls will be from the sharepoint.com domain.

Once your bot has been saved, you can send it messages in the test canvas chat window. Try sending it some phrases that you would expect to return content. If the user account you used to sign into powerva.microsoft.com **does not** have access to the SharePoint site you will not get content, or may get a System Error.

#### Authentication

This feature requires authentication, since bot makes calls on behalf of the user interaction with the chat window. Currently when you use the test chat, it will make calls using the account used to sign into powerva.microsoft.com. If you publish your bot or want to use another account, you need to configure Manual Authentication using Azure Active Directory. Instructions for how to do this can be found in [Configure user authentication in Power Virtual Agents](configuration-end-user-authentication.md).

You can find instructions for how to create the needed Azure Active Directory Application Registration in [Configure user authentication with Azure Active Directory](configuration-authentication-azure-ad.md)

You will need to at least include these Delegated Permissions:

1. Files.Read.All
2. Sites.Read.All

#### Supported content

Curently, this feature supports content stored in these formats:

- SharePoint pages (aspx pages)
- Word documents (docx)
- PowerPoint documents (pptx)
- PDF documents (pdf)

