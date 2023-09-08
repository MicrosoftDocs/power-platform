---
title: Use content on SharePoint or OneDrive for Business for generative answers
description: Use authenticated content on SharePoint or OneDrive as a source for generative answers.
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

# Use content on SharePoint or OneDrive for Business for generative answers

You can use generative answers with content stored on SharePoint sites and OneDrive for Business. This capability works by pairing your bot with a specific site URL, such as _contoso.sharepoint.com/sites/policies_. When a bot user asks a question or makes a statement where the bot doesn't have a manually configured topic to use, it will search for relevant content from that site URL and all sub-paths and will use generative answers technology to help summarize this content into a targeted response.

> [!CAUTION]
> Content analysis and retrieval happens on behalf of the signed-in user, meaning this feature [requires user authentication to be configured for your bot using Azure AD](nlu-boost-node.md#authentication). 
>  
> It also means that when a specific user asks a question of the bot, the bot will only surface content that that specific user has access to read on SharePoint or OneDrive for Business.

Due to memory limits, we recommend you limit the size of the files you want to use on SharePoint. If a file is unusually large, consider splitting it into multiple smaller files.

To use SharePoint or OneDrive for Business:

1. Open the **Data source** configuration pane for your topic's node:

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-SnS-sources.png" alt-text="Screenshot of the Generative answers node data sources menu.":::

    - Open the **Properties** pane for the **Create generative answers** node and select **Data source**.
    - On the **Create generative answers** node, select **Edit** under **Data sources**.
    
    :::image type="content" source="media/nlu-gpt/create-gen-ans-node-image-highlight-22May23.png" alt-text="Screenshot of the Search and summarize content node properties.":::

1. Under **SharePoint**, add the SharePoint or OneDrive for Business URLs you want to use. Separate multiple URLs with manual line breaks (with **Shift** + **Enter**).

    > [!NOTE]
    >
    > A best practice is to omit *https://* from the URL. Recognized SharePoint URLs will be from the _sharepoint.com_ domain.

1. When you're done entering sources, close the menu. Make sure to save any changes to your topic.

Once your bot has been saved, you can send it messages in the test bot pane. Test it with some phrases that you would expect to return content. If the user account you used to sign in to _powerva.microsoft.com_ doesn't have access to the SharePoint site you won't get content or you might see a system error.

>[!CAUTION]
> Information sources defined in the **Generative answers** node will override those you have specified at the bot level, which will then function as a fallback. 

