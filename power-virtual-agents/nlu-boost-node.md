---
title: Generative answers with Search and summarize
description: "Use the Search and summarize content to boost conversations."
keywords: "PVA"
ms.date: 5/23/2023
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

# Generative answers with Search and summarize content

When you created your bot, you were invited to [enter a URL from which your bot could generate responses](nlu-boost-conversations.md). This URL is used across the bot, however you can further boost your bot's conversations by using multiple internal and external information sources within individual topics.

Within a bot's topic, you can add a  **Create generative answers** node. This node allows you to specify additional sources that the node will search based on the inputs you give it. 

Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback. 

These sources include:

- External sources:
  - Bing Search
  - Bing Custom Search

- Internal resources:
  - Azure OpenAI on your data
  - Documents uploaded to Dataverse
  - SharePoint
  - OneDrive for Business
  - Custom data (internal or external): Supply your own content from any source, for example, from a Power Automate Flow, a Skill, or other source.

## Information Sources

Different information sources have different capabilities, such as the number of inputs, the type or format of the data, and how (or if) the source needs authentication to access it.


| Name | Source | Description | Number of Inputs | Authentication |
| --- | --- | --- | --- | --- |
| Bing Search | External | Searches the query input on Bing; returning results only from provided websites | 4 public URLs (for example, _microsoft.com_) | None |
| Bing Custom Search | External | Query input filtered based on a website configuration external to Power Virtual Agents | Each search ID can use more than 4 URLs (Bing Custom Search also provides other functionality) but you can only connect to one search ID | None |
| Azure OpenAI on your data | Internal |  | Defined by your Azure OpenAI Service connection | Bot user's Azure Active Directory (Azure AD) authentication |
| Documents | Internal | Searches documents uploaded to Dataverse, returning results from the document contents | Limited by Dataverse file storage allocation | None |
| SharePoint | Internal | Connects to a SharePoint URL, uses GraphSearch to return results | 4 URLs | Bot user's Azure Active Directory (Azure AD) authentication |
| OneDrive for Business | Internal | Connects to a OneDrive for Business URL, uses GraphSearch to return results | 4 URLs | Bot user's Azure Active Directory (Azure AD) authentication |
| Custom data | Internal | Uses a JSON code block to define the URLs and content to use | One variable, populated with the JSON results to be summarized | Dependent on source |


Bot user authentication for information sources means that when a specific user asks a question of the bot, the bot will only surface content that that specific user can access.




## Add a generative answers node

The **Create generative answers** node allows you to use generative answers with your a bot's topic. This allows you to search internal and external information sources from the node level to further boost your bot's conversations.

1. Open the authoring canvas for your topic, and identify the point where you want to use generative answers.

1. Select the plus icon to open the new node menu.

1. Under **Advanced**, select **Generative answers**.

1. A new node, called **Create generative answers** will be added to your topic, and will open the **Properties** pane automatically.
 
    :::image type="content" source="media/nlu-gpt/generative-ans-node-22May23.png" alt-text="Screenshot of adding a Search and summarize content node.":::

You'll now be able to specify and configure data sources, described in these articles:

- [Use a Bing Custom Search to search a number of websites](nlu-generative-answers-bing.md)
- [Use a connection to Azure OpenAI on your data](nlu-generative-answers-azure-openai.md)
- [Use documents as a generative answers data source (preview)](nlu-documents.md)
- [Use content on SharePoint or OneDrive for Business](nlu-generative-answers-sharepoint-onedrive.md)
- [Use a custom data source](nlu-generative-answers-custom-data.md)

## Authentication

Some of the sources require authentication, since the bot makes calls on behalf of the user interaction with the chat window. 

When you use the test chat, it will make calls using the account used to sign in to _powerva.microsoft.com_. 
When you publish your bot, the calls are made on behalf of the user chatting with the bot, using the authentication settings configured in the bot, which must use manual authentication with the **Service Provider** type of **Azure AD**. 
Instructions for how to do this can be found in [Configure user authentication in Power Virtual Agents](configuration-end-user-authentication.md).

You can find instructions for how to create the needed Azure AD application registration in [Configure user authentication with Azure Active Directory](configuration-authentication-azure-ad.md)

You'll need to include these delegated permissions for **Microsoft Graph**:

1. Files.Read.All
2. Sites.Read.All

## Supported content

Generative answers will obtain content stored in these formats:

- SharePoint pages (aspx pages)
- Word documents (docx)
- PowerPoint documents (pptx)
- PDF documents (pdf)

