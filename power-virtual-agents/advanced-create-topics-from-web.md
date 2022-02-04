---
title: "Get topic suggestions from online content (contains video)"
description: "Use existing help and support content to quickly generate new topics for your Power Virtual Agents bot."
keywords: "PVA"
ms.date: 01/25/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring, ceX
ms.collection: virtual-agent
---


# Create topics from existing online support content

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](advanced-create-topics-from-web.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/advanced-create-topics-from-web-teams.md)

You can use content from existing webpages when creating a Power Virtual Agents bot. This is useful if you already have help or support content, such as FAQ pages or support sites.

Rather than copying and pasting or manually re-creating this content, you can use AI-assisted authoring to automatically extract and insert relevant content from existing online resources into your bot.

The underlying capability identifies the structure and content on a webpage or online file, isolates content blocks that pertain to a support issue or question, and then classifies them into topics with corresponding [**Trigger phrase** and **Message** nodes](authoring-create-edit-topics.md) for each topic.

There are three main steps to using the feature:

1. Select **Suggest topics** on the Topics page to extract content from FAQ/support pages or online files.
1. Add the suggested topics to your bot.
1. Enable the topics.

You can [test the topics in the test chat](authoring-test-bot.md), but you'll need to [publish your bot for customers](publication-fundamentals-publish-channels.md) to see the latest changes.

>
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4mNOt]

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Extract content from webpages or online files

First, you'll need to point to the webpages or online files from which you want to extract content.

After the extraction is complete, you'll be shown the suggested topics for further review. Suggested topics aren't automatically added to your bot, but you can [easily add them](#add-suggested-topics-to-an-existing-bot).

> [!IMPORTANT]
> The **Suggest topics** command is built to run on online FAQ or support content. Other types of content with a different structure might not work as expected.

1. Select **Topics** on the side pane.

    :::image type="content" source="media/menu-topics.png" alt-text="The Topics menu item on the side pane." border="false":::

1. Go to the **Suggested** tab.

1. If it's the first time you're getting suggestions, the list of suggested topics will be blank. A link to **Get started** or **Learn more** appears instead.

    :::image type="content" source="media/suggested-web-get.png" alt-text="An empty Topics page, with a link to Get started or Learn more." border="false":::

1. Select **Get started** or **Suggest topics**.

1. Enter links to each webpage or online file from which you want to extract content, and then select **Add**. If you add a link by mistake, you can remove it by selecting **Delete** :::image type="content" source="media/delete-suggested-topic.png" alt-text="Delete." border="false":::.

    :::image type="content" source="media/suggested-web-wizard.png" alt-text="The Suggest topics page, where you enter URLs to extract suggested topics from." border="false":::

    > [!IMPORTANT]
    >
    > - The URLs must be secure (they must start with *https://*).
    > - The URLs must be publicly available, that is, they can't need a user to log in.
    > - For online files, we do not support file upload. You must provide the full URL to the location of the file, including the file extension, as in the example *https://www.microsoft.com/thisisafile.pdf*.
    > - For online files, we currently support PDF, DOCX, PPTX, TXT files and 2-column formats in TSV, XLSX (first sheet only), and CSV. The file extension must be included in the URL.

1. When you're done adding links to webpages and/or online files, select **Start**. The process can take several minutes, depending on the complexity and number of webpages or files you added. The message "Getting your suggestions. This may take several minutes" appears at the top of the screen while the extraction is in progress.

    :::image type="content" source="media/suggested-web-wait.png" alt-text="An alert that says Getting your suggestions. This may take several minutes appears at the top of the page.":::

> [!TIP]
> You can add multiple webpages and links to online files, but we recommend that you include only a few at a time to keep the list of suggestions manageable.

> [!IMPORTANT]
> You won't be able to add more URLs while the **Suggest topics** command is running.

The tool provides explicit feedback about errors so that you can understand and address any issues. For example, you might be unable to extract content because the site you're referencing is down or it may be gated behind a user login, such as a SharePoint page.

:::image type="content" source="media/suggested-web-error-bar.png" alt-text="A red banner alert that says We ran into problems getting suggestions appears at the top of the page with a link to more details." border="false":::

:::image type="content" source="media/suggested-web-error-detail.png" alt-text="A pop-up window that describes the errors encountered when trying to get suggestions from a web page." border="false":::

After you've successfully extracted content, a number of suggestions will appear. These may be either [single-turn or multi-turn topics](#single-turn-and-multi-turn-topic-suggestions). You can now review these suggestions to see which ones you want to add to your bot.

:::image type="content" source="media/suggested-web-topics.png" alt-text="The Suggested tab on the Topics page lists each topic by name, trigger phrase, source, and date it was received." border="false":::

## Single-turn and multi-turn topic suggestions

When Power Virtual Agents extracts content, it generates single-turn or multi-turn topic suggestions, based on the structure of the document.

A **single-turn topic** has a trigger phrase that contains a single answer. Topics such as these are typically generated if your online content has simple "question-and-answer" pairs, such as an FAQ page.

A **multi-turn topic** contains multiple bot responses, and is often associated with multiple dialog branches.  
It provides a guided experience for your bot's users to navigate through a problem and reach a solution. These topics are typically generated when your online content is similar to a troubleshooting page or a reference manual or guidebook.

The original content's structure or hierarchy (such as headings and subheadings) will [contribute to whether a multi-turn or single-turn topic is generated](#how-the-ai-creates-topic-suggestions).

:::image type="content" source="media/advanced-create-topics-from-web/sample-multi-turn-topic.png" alt-text="A screenshot of the preview for a multi-turn topic suggestion showing multiple branches from the original question.":::

### How the AI creates topic suggestions

The Power Virtual Agents AI engine applies a number of steps to the content when it extracts topics and generates suggestions. These steps utilize AI to identify and parse visual and semantic cues from the content.

1. *Document parsing:* the Power Virtual Agents engine identifies and extracts the basic components of the document, such as text and image blocks.

1. *Layout understanding:* the document is segmented into different zones that consist of the blocks of content.

1. *Structure understanding:* the logical structure of the content is analyzed by determining the "role" of each zone (for example, what is actual content and what are headings). Power Virtual Agents creates a hierarchical map or "heading tree" of the content, based on the headings and their associated content.

1. *Augmentation:* the Power Virtual Agents AI engine adds context to the tree by analyzing how the headings relate to each other and their content. At this point, it generates single-turn topics from identified simple "question-and-answer" pairs of headings and content.

1. *Dialog generation:* multi-turn topics are generated from the augmented knowledge tree, depending on whether the topic's intent is a simple answer from a group of many, or if the topic has multiple solutions that are equally different, and are chosen based on a user's input or choices.

## Add suggested topics to an existing bot

After the extraction process has been completed, the topic suggestions appear on the **Suggested** tab. Review them individually to decide which ones you want to include in your bot. You can also add suggestions without reviewing them.


1. Select the name of the suggested topic.  

1. Review the trigger phrase and suggested **Message** node. (Each topic will end with a survey, so your customers can let you know whether they found it helpful.) You have the following three options for dealing with the topic:  

    1. To make edits to the topic, select **Add to topics and edit**. The topic will open, where you can [edit the trigger phrases or enter the authoring canvas](authoring-create-edit-topics.md) to make changes to the conversation flow. The topic will also be removed from the list of suggestions.  

    1. To add the suggested topic without making any changes, select **Add to topics**. The topic is added and saved, but you'll stay on the list of suggested topics. The topic will also be removed from the list of suggested topics.  

    1. To completely remove the suggestion, select **Delete suggestion**. The topic will be deleted from the list of suggested topics. You can run the **Suggest topics** command again if you want to restore it.  

    :::image type="content" source="media/suggested-web-add-edit.png" alt-text="An editing window showing a snapshot of the topic's layout." border="false":::

1. In the suggested topics list, hover over the name of the suggested topic you want to add or delete.

    1. To add the topic to your bot, select **Add to topics** :::image type="content" source="media/add-to-topics.png" alt-text="Add to topics." border="false":::. You won't see a preview of the topic and the topic will be moved from the list of **Suggested** topics into **Existing** topics.

    :::image type="content" source="media/suggested-web-quick.png" alt-text="An up arrow icon next to the title of a topic." border="false":::

1. You can also add or delete multiple topic suggestions at a time. If you select multiple rows, you'll see options to **Add to topic** or **Delete**.

    :::image type="content" source="media/suggested-web-multi.png" alt-text="The list has three items selected." border="false":::

## Enable topics in your bot

Suggested topics are added to the **Existing** tab with their status set to **Off**. This way, topics won't be prematurely added to your bot.


1. Select **Topics** on the side pane.

1. Go to the **Existing** tab.

1. For each topic you want to enable, turn on the toggle under **Status**.

    :::image type="content" source="media/suggested-enable.png" alt-text="A table that lists existing topics, where each topic has a toggle that switches between Off and On in the Status column." border="false":::

### See also

- [Create your first bot](authoring-first-bot.md)  
- [Create and edit topics](authoring-create-edit-topics.md)  
- [Fundamentals - Publish your bot](publication-fundamentals-publish-channels.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
