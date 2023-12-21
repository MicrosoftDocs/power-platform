---
title: Generative answers with Search and summarize
description: "Use the Search and summarize content to boost conversations."
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

# Generative answers with Search and summarize content

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

When you create your copilot, you [enter a URL your copilot uses to generate responses](nlu-boost-conversations.md). This URL is used in all features of the copilot. However, you can boost your copilot's conversations by using multiple internal and external information sources within individual topics.

Within a copilot's topic, you can add a **Create generative answers** node. This node allows you to specify more sources that the node searches based on your inputs. Information sources defined in the **Generative answers** node override sources you specified at the copilot level, which functions as a fallback.

These sources include:

- External sources:
  - Bing Search
  - Bing Custom Search

- Internal resources:
  - Azure OpenAI on your data
  - Documents uploaded to Dataverse
  - SharePoint
  - OneDrive for Business
  - Custom data (internal or external): Supply your own content from any source. For example, a Power Automate Flow, a Skill, or other source.

## Information sources

Different information sources have different capabilities, such as the number of inputs, the type or format of the data, and how (or if) the source needs authentication to access it.

[!INCLUDE[node-sources](includes/blocks/node-sources-table.md)]

## Add a generative answers node

1. Select the **Topic** page and open a topic. Find where you want to use generative answers.

1. Select the plus icon to open the new node menu.

1. Under **Advanced**, select **Generative answers**.

   :::image type="content" source="media/nlu-gpt/nlu-boost-add-gen-ai-node.png" alt-text="Screening showing the location of the generative answers node option when adding a new node." lightbox="media/nlu-gpt/nlu-boost-add-gen-ai-node.png":::

1. A new node called **Create generative answers** is added to your topic and opens the **Properties** pane automatically. Or, access the **Properties** pane by selecting the node's `...` then **Properties**.

   You can specify and configure your new data sources:

   - [Use a Bing Custom Search to search many websites](nlu-generative-answers-bing.md)
   - [Use a connection to Azure OpenAI on your data](nlu-generative-answers-azure-openai.md)
   - [Upload documents to use as a data source (preview)](nlu-documents.md)
   - [Use content on SharePoint or OneDrive for Business](nlu-generative-answers-sharepoint-onedrive.md)
   - [Use a custom data source](nlu-generative-answers-custom-data.md)

## Authentication

Some sources require authentication, since the copilot makes calls on behalf of the user in the chat window. Calls use the account credentials from _powerva.microsoft.com_.

The authentication settings configured in the copilot need manual authentication with the **Service Provider** type of **Microsoft Entra ID**.

To configure authentication and create a Microsoft Entra ID, see:

- [Configure user authentication in Microsoft Copilot Studio](configuration-end-user-authentication.md).

- [Configure user authentication with a Microsoft Entra ID](configuration-authentication-azure-ad.md).

Include delegated permissions for **Microsoft Graph**:

1. `Files.Read.All`
1. `Sites.Read.All`

## Supported content

Generative answers obtain content stored in these formats:

- SharePoint pages (aspx pages)
- Word documents (docx)
- PowerPoint documents (pptx)
- PDF documents (pdf)
