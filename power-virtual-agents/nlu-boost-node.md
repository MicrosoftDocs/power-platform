---
title: Generative answers with Search and summarize
description: "Use the Search and summarize content to boost conversations."
keywords: "PVA"
ms.date: 5/23/2023
ms.topic: how-to
author: KendalBond007
ms.author: iawilt
ms.reviewer: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Generative answers with Search and summarize content

When you created your bot, you were invited to [enter a URL from which your bot could generate responses](nlu-boost-conversations.md). 

You can further boost your bot's conversations by using multiple internal and external information sources, including:

- External sources:
  - Bing Search
  - [Bing Custom Search](https://www.customsearch.ai/)
- Internal resources:
  - SharePoint
  - OneDrive for Business
  - Dataverse
  - Custom data (internal or external): Supply your own content from any source, for example, from a Power Automate Flow, a Skill, or other source.

You can also add information sources to a topic using the **Generative answers** node. This node allows you to specify sources that the node will search, based on the inputs you give it. The results of the search will be summarized and checked for data viability.

>[!CAUTION]
> Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback. 

These methods of boosting your bot using generative answers allow you to specify information sources for the entire bot (for instance, with a URL at bot creation) and also use alternate information sources within a topic (with the **Generative answers** node).

## Information Sources

This table summarizes the information sources you can use to boost conversations.

| Name | Source | Description | Number of Inputs | Authentication |
| --- | --- | --- | --- | --- |
| Bing Search | External | Searches the query input on Bing; returning results only from provided websites | 4 public URLs (for example, _microsoft.com_) | None |
| [Bing Custom Search](https://www.customsearch.ai/) | External | Query input filtered based on a website configuration external to Power Virtual Agents | More than 4 URLs (Bing Custom Search also provides other functionality) | None |
| SharePoint | Internal | Connects to a SharePoint URL, uses GraphSearch to return results | 4 URLs | Bot user Azure Active Directory (Azure AD) authentication |
| OneDrive for Business | Internal | Connects to a OneDrive for Business URL, uses GraphSearch to return results | 4 URLs | Bot user Azure Active Directory (Azure AD) authentication |
| [Custom data](#custom-data-source) | Internal | Uses a JSON code block to define the URLs and content to use | One variable, populated with the JSON results to be summarized | Dependent on source |

As the table notes, some features require user authentication to be configured for your bot. In the cases of SharePoint and OneDrive for Business, authentication is done using Azure AD. User authentication for information sources also means that when a specific user asks a question of the bot, the bot will only surface content that that specific user can access.

### Custom data source

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


## Create generative answers

The Generative answers node allows you to use generative answers with your a bot's topic. This allows you to search internal and external information sources from the node level to further boost your bot's conversations.

1. Open the authoring canvas for your topic, and identify the point where you want to use generative answers.

1. Under the **Advanced** menu, add a **Generative answers** node.
 
    :::image type="content" source="media/nlu-gpt/generative-ans-node-22May23.png" alt-text="Screenshot of adding a Search and summarize content node.":::

1. On the Generative answers node, select **Edit** under **Data sources**.

    :::image type="content" source="media/nlu-gpt/create-gen-ans-node-image-highlight-22May23.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. Specify the data sources you'd like the node to use, and add it to your list. This adds the source to the node's set of resources. For details on the information sources you can use, refer to [Information sources](#information-sources).

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the Generative answers node data sources menu.":::

1. When you're done entering sources, close the menu. Make sure to save any changes to your topic.

The topic will now generate answers from the information sources provided to the node.

## Adding generative answers from different sources

This section provides instructions on boosting conversations with generative answers for several scenarios.

### Connect to a single URL to boost a conversation

#### Bot settings

When you create a bot using the unified canvas, you're invited to boost its conversations with generative answers. [Create a boosted bot](nlu-gpt-quickstart.md#create-a-boosted-bot) takes you through this process.

You can also change the URL, disable generative answers, or change the level of content moderation in the settings for the bot. Follow the instructions relating to the **AI Capabilities** settings section in [Increasing your bot's reach](nlu-boost-conversations.md#increasing-your-bots-reach)

Once you've completed this process, you can test your bot to see how well it responds to questions related to the content on the URL you specified. For more information, see [Test your bot's generative answers reach](nlu-gpt-quickstart.md#test-your-bots-boosted-conversational-reach).

#### Generative answers node properties

To boost coverage in a **Generative answers** node, follow these instructions:

1. Navigate to the **Data sources** menu for the node and add the data sources you would like the node to use. This adds the source to the node's set of resources. For details on the information sources you can use, refer to [Information sources](#information-sources).

1. When you're done entering sources, close the menu. Make sure to save any changes to your topic.


### Use a Bing Custom Search to search a number of websites

[Bing Custom Search](https://www.customsearch.ai/) allows you to build a tailored search for specific content. The generated Custom configuration ID can then be used in your bot by generative answers. If you haven't used Bing Custom Search, follow the [Quickstart: Create your first Bing Custom Search instance](/bing/search-apis/bing-custom-search/how-to/quick-start). Once you have a Custom configuration ID for your search, you can use it to boost conversations with generative answers.

#### Bing custom search

1. On the **Web API** tab under **Production**, copy the custom configuration ID you want to use. This functions like a URL would as described in [Connect to a single URL to boost a conversation](#connect-to-a-single-url-to-boost-a-conversation). If you have more than one custom configuration, make sure you're copying the ID you want.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-bing-custom-search-ID.png" alt-text="Screenshot of the  Search and summarize content node with Bing custom search.":::


#### Generative answers node properties

1. Select **Properties** from the node menu and then **Data source**.

1. Select **Search with Bing Custom Search** from **Search public data**.

1. Paste your custom configuration ID in the **Configuration ID** input box to add it to the node's data sources. If you haven't exceeded relevant limits (as defined in the [Information sources table](#information-sources), you can add other URLs.

1. When you're done entering sources, close the menu. Make sure to save any changes to your topic.

    :::image type="content" source="media/nlu-gpt/generative-answers-bing-custom.png" alt-text="Screenshot showing the Search public data section and Configuration ID boxes highlighted in the generative answers property pane.":::
 
The node will now retrieve content from the information sources in the Bing Custom Search configuration provided. This allows you to use a large number of sources to boost your bot without having to enter each source individually.

### Connect to a SharePoint site or OneDrive for Business


Power Virtual Agents now supports boosting conversations using generative answers with content stored on SharePoint sites and OneDrive for Business. This capability works by pairing your bot with a specific site URL, such as _contoso.sharepoint.com/sites/policies_. When a bot user asks a question or makes a statement where the bot doesn't have a manually configured topic to use, it will search for relevant content from that site URL and all sub-paths and will use generative answers technology to help summarize this content into a targeted response.

When analyzing internal content stored on SharePoint or OneDrive for Business, it's essential to note this happens on behalf of the signed-in user, meaning this feature requires user authentication to be configured for your bot using Azure AD. 

It also means that when a specific user asks a question of the bot, the bot will only surface content that that specific user has access to read on SharePoint or OneDrive for Business.

Due to memory limits, we recommend you limit the size of the files you want to use on SharePoint. If a file is unusually large, consider splitting it into multiple smaller files.

#### Requirements

To use this feature, you'll need:

1. A Power Virtual Agents bot (created with the unified authoring canvas).
2. A SharePoint or OneDrive for Business URL.
3. An Azure AD application registration (this is optional to try this in the test bot pane, but is required if you publish your bot and use it with channels).
 
#### Inputting a SharePoint or OneDrive for Business URL

Follow the instructions for updating or changing URL as described in [Connect to a single URL to boost a conversation](#connect-to-a-single-url-to-boost-a-conversation), adding the SharePoint or OneDrive for Business URL.

> [!NOTE]
>
> A best practice is to omit the http/https. Recognized SharePoint URLs will be from the _sharepoint.com_ domain.

Once your bot has been saved, you can send it messages in the test bot pane. Test it with some phrases that you would expect to return content. If the user account you used to sign in to _powerva.microsoft.com_ doesn't have access to the SharePoint site you will not get content, or you might see a system error.

#### Authentication

These sources require authentication, since the bot makes calls on behalf of the user interaction with the chat window. Currently when you use the test chat, it will make calls using the account used to sign in to _powerva.microsoft.com_. If you publish your bot or want to use another account, you need to configure manual authentication using Azure AD. Instructions for how to do this can be found in [Configure user authentication in Power Virtual Agents](configuration-end-user-authentication.md).

You can find instructions for how to create the needed Azure AD application registration in [Configure user authentication with Azure Active Directory](configuration-authentication-azure-ad.md)

You'll need to include these delegated permissions for **Microsoft Graph**:

1. Files.Read.All
2. Sites.Read.All

#### Supported content

Generative answers will obtain content stored in these formats:

- SharePoint pages (aspx pages)
- Word documents (docx)
- PowerPoint documents (pptx)
- PDF documents (pdf)

