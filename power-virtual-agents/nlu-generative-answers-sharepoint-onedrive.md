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

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This capability works by pairing your copilot with a URL, such as _contoso.sharepoint.com/sites/policies_. When a copilot user asks a question and the copilot doesn't have a topic to use for an answer, the copilot searches the URL and all sub-paths. For example, a URL such as _contoso.sharepoint.com/sites_ also includes subpaths like _contoso.sharepoint.com/sites/policies_. Generative answers summarize this content into a targeted response.

> [!IMPORTANT]
> Content analysis and retrieval requires authentication. To authenticate your copilot, see [Authentication](nlu-boost-node.md#authentication). The **No authentication** and **Only for Teams** authentication options can't retrieve information from Sharepoint or OneDrive for Business.
>
> When configuring authentication, scopes control user access. Specify **Sites.Read.All**, **Files.Read.All** in the scopes field near the existing **profile** and **openid** values. These scopes don't give users increased permissions when using the copilot, but allow their permissible content from the Sharepoint site as configured for generative answers.

Due to memory limits, we recommend you limit the size of the files you want to use on SharePoint. If a file is unusually large, consider splitting it into multiple smaller files.

## Use SharePoint or OneDrive for Business

1. Open the **Data source** configuration pane from one of two places:

   1. On the **Create generative answers** node, select **Edit** under **Data sources**.

      :::image type="content" source="media/nlu-gpt/select-properties-from gen-ans.png" alt-text="Screenshot that shows where to select the Properties pane.":::

   1. Alternatively, select the `...` in the **Create generative answers** node, then select **Properties** to open a pane, and finally select **Data source**.

1. Under **SharePoint** in the **Data source** pane, add the SharePoint or OneDrive for Business URLs you want to use. Separate multiple URLs with manual line breaks (with **Shift** + **Enter**).

   :::image type="content" source="media/nlu-gpt/sharepoint-in-data-source-pane.png" alt-text="Screenshot that shows the SharePoint field in the Data source pane.":::

   > [!NOTE]
   >
   > A best practice is to omit _https://_ from the URL. Recognized SharePoint URLs will be from the _sharepoint.com_ domain.

1. Select **Save** at the top to save your topic changes.

1. Test your copilot with phrases that you expect to return content.

   If the user account you used to sign in to _powerva.microsoft.com_ doesn't have access to the SharePoint site, you won't get content or you might see a system error.

> [!IMPORTANT]
> Information sources defined in the **Generative answers** node take priority at the copilot level. Copilot level sources function as a fallback.
