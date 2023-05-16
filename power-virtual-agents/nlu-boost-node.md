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

As the table notes, some features require user authentication to be configured for your bot. In the cases of SharePoint and OneDrive, authentication is done using Azure Active Directory. User authentication for information sources also means that when a specific user asks a question of the bot, the bot will only surface content that specific user has access to read on SharePoint or OneDrive for Business.

## Add a Search and summarize content node

 Adding a Search and summarize content node allows you to use generative answers with your a bot's topic. This allows you to search internal and external information sources from the node level to further boost your bot's conversations.

1. Open the authoring canvas for your topic, and identify the point where you want to use Search and summarize content.

1. Click on the '+' where you would like to add the Search and Summarize node.

1. Add a Search and Summarize content node.
 
    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-node.png" alt-text="Screenshot of the adding a Search and summarize node.":::

1. On the Search and summarize node, select Properties from the node menu and select Data source

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-properties.png" alt-text="Screenshot of the Search and summarize node properties.":::

1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](#information-sources). (Note here about the other options (Variable or PowerFX) - what is the integration?)(image: data sources menu)

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the  Search and summarize node Data sources menu.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.

The topic will now Search and summarize content from the information sources provided _to the node_. [What happens when that doesn't provide a cogent answer? Fallback?]

## Adding generative answers from different sources

This sections provides instructions on boosting conversations with generative answers for several scenarios.

### Connect to a single URL to boost a conversation

#### [Bot]

When you create a bot using the unified canvas, you are invited to boost it's conversations with generative answers. [Create a boosted bot](nlu-gpt-quickstart.md#create-a-boosted-bot) takes you through this process.

You can also change the URL, disable **generative answers**, or change the level of content moderation in the settings for the bot:

1. With a bot open, expand **Settings** on the side navigation pane, and select **AI Capabilities**.

    1. Under **Boost conversational coverage (preview)**, use the checkbox for **GA** to enable or disable the capability.

    1. In the field under the checkbox, add or change the URL. The [same requirements apply for the URL](nlu-boost-conversations.md#url-considerations) as when enabling the capability when you create a bot.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-enable.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Generative Answers enabled and highlighted.":::

    1. Under **Bot content moderation**, select the level you want for your bot. A higher level of moderation means that the bot’s answers will be more relevant. A lower level of moderation means that the bot generates more answers, but the answers may be irrelevant or undesirable.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-content-moderation.png" alt-text="Screenshot of the bot content moderation menu.":::    

1. Select **Save** at the top of the **AI capabilities** page.

You can now test your bot to see how well it responds to questions related to the content on the URL you specified. For more details, refer to [Test you bot's generative answers reach](nlu-gpt-quickstart.md#test-your-bots-boosted-conversational-reach).

#### Search and summarize node

To boost coverage in a Search and summarize node, follow these instructions:

1. On the Search and summarize node, select Properties from the node menu, and select Data source.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-properties.png" alt-text="Screenshot of the Search and summarize properties.":::

1. Specify the data sources you would like the node to search and summarize, and add it to your list. This adds the source to the *node's* set of resources. For details on information sources Generative Answers can use, refer to [Information sources](#information-sources).

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the  Search and summarize node Data sources.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.



### Use a Bing Custom Search to search a number of websites

[Bing Custom Search](https://www.customsearch.ai/) allows you to build a tailored search for specific content. The generated **Custom configuration ID** can then be used in your bot by generative answers. If you haven't used Bing Custom Search, use the link at the beginning of this paragraph, and follow [Quickstart: Create your first Bing Custom Search instance](https://learn.microsoft.com/bing/search-apis/bing-custom-search/how-to/quick-start). This will walk you through creating and publishing one. Once you have a Custom configuration ID for your search, you can use it to boost conversations with generative answers.

#### Bing custom search

1. On the **Web API** tab under **Production**, copy the Custom configuration ID you want to use. This will function like a url would as described [Connect to a single URL to boost a conversation](#connect-to-a-single-url-to-boost-a-conversation). NOTE: If you have more than one custom configuration, make sure you are copying the ID you want.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-bing-custom-search-ID.png" alt-text="Screenshot of the  Search and summarize node medu" Data sources.":::

#### [Bot]

With a bot open, expand **Settings** on the side navigation pane, and select **AI Capabilities**.

1. Under **Boost conversational coverage (preview)**, use the checkbox for **GA** to enable or disable the capability.

1. In the field under the checkbox, change the current url to the Custom configuration ID, or add the ID. [The [same requirements apply for the URL](nlu-boost-conversations.md#url-considerations) as when enabling the capability when you create a bot. - **Question**: is this true here?]

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-enable.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Generative Answers enabled and highlighted.":::

1. Under **Bot content moderation**, select the level you want for your bot. A higher level of moderation means that the bot’s answers will be more relevant. A lower level of moderation means that the bot generates more answers, but the answers may be irrelevant or undesirable.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-content-moderation.png" alt-text="Screenshot of the bot content moderation menu.":::    

1. Select **Save** at the top of the **AI capabilities** page.

#### Search and summarize node

1. Select Properties from the node menu, and select Data source.

1. Paste your custom configuration into the [input box] under "Sites", and click on the '+' to add it to the node's Data sources. If you have not exceeded relevant limits, you may add other urls.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the Search and summarize node properties.":::

1. When you are done entering sources, close the menu. Make sure to save any changes to your topic.(image: save topic?)
 
The node will now Search and summarize content from the information sources in the Bing Custom Search configuration provided. This allows you to use a large number of sources to boost your Search and summarize node without having to enter each source individually.

### Connect to a Sharepoint or OneDrive for Business

Power Virtual Agents now supports boosting conversations using generative answers with content stored on SharePoint sites and OneDrive for Business. This capability works by pairing your bot with a specific site URL, such as contoso.sharepoint.com/sites/policies. When a bot user asks a question or makes a statement where the bot does not have a manually configured Topic to use, it will search for relevant content from that site URL and all sub-paths and will use generative answers technology to help summarize this content into a targeted response.

When analyzing internal content stored on SharePoint or OneDrive for Business, it is essential to note this happens on behalf of the signed in user, meaning this feature requires user authentication to be configured for your bot using Azure Active Directory. It also means that when a specific user asks a question of the bot, the bot will only surface content that specific user has access to read on SharePoint or OneDrive for Business.

#### Requirements

To use this feature, you will need:

1. A Power Virtual Agent bot created using the preview canvas  
2. A SharePoint or OneDrive for Business URL
3. An AAD application registration for employees to log (this is optional to try this in the Test Canvas, but is required if you Publish your bot and use it with channels)
 
#### Inputting a SharePoint or OneDrive for Business url

If you have not already, [create a boosted bot](nlu-boost-conversations.md#increasing-your-bots-reach).

 When you are promted to provide a website you'd like the bot to use for generative answers, enter the SharePoint url.

  :::image type="content" source="media/nlu-gpt/nlu-quickstart-boost-bot-create.png" alt-text="Screenshot of the bot creation screen with the preview option highlighted.":::

> [!NOTE]
>
> A best practice is to omit the http/https. Also, that recognized SharePoint urls will be from the sharepoint.com domain.

When you have entered your SharePoint url, click **Create**.
If you are using an existing bot, you can update or change urls as described in [Connect to a single URL to boost a conversation](#connect-to-a-single-url-to-boost-a-conversation).

Once your bot has been created, you can send it messages in the test canvas chat window. Try sending it some phrases that you would expect to return content. If the user account you used to sign into powerva.microsoft.com **does not** have access to the SharePoint site you will not get content, or may get a System Error.

#### Authentication

This feature requires authentication, since bot makes calls on behalf of the user interaction with the chat window. Currently when you use the test chat, it will make calls using the account used to sign into powerva.microsoft.com. If you publish your bot or want to use another account, you need to configure Manual Authentication using Azure Active Directory. Instructions for how to do this can be found in [Configure user authentication in Power Virtual Agents](https://learn.microsoft.com/power-virtual-agents/configuration-end-user-authentication).

You can find instructions for how to create the needed Azure Active Directory Application Registration in [Configure user authentication with Azure Active Directory](https://learn.microsoft.com/power-virtual-agents/configuration-authentication-azure-ad)

You will need to at least include these Delegated Permissions:

1. Files.Read.All
2. Sites.Read.All

#### Supported content

Curently, this feature supports content stored in these formats:

- SharePoint pages (aspx pages)
- Word documents (docx)
- PowerPoint documents (pptx)
- PDF documents (pdf)

### Search and summarize into variables

- The multiple options that come up in S&S instructions should refer to here
- Thoughts on variables?

## What else can multiple sources/S&S do?
