---
title: "Get topic suggestions from online content (contains video)"
description: "Use existing help and support content to quickly generate new topics for your Microsoft Copilot Studio bot."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: authoring, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Create topics from existing online support content

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can use content from existing webpages when creating a Microsoft Copilot Studio bot. This is useful if you already have help or support content, such as FAQ pages or support sites.

Rather than copying and pasting or manually re-creating this content, you can use AI-assisted authoring to automatically extract and insert relevant content from existing online resources into your bot.

The underlying capability identifies the structure and content on a webpage or online file, isolates content blocks that pertain to a support issue or question, and then classifies them into topics with corresponding [Trigger phrase and Message nodes](authoring-create-edit-topics.md) for each topic.

There are three main steps to using the feature:

1. [Select Suggest topics on the Topics page to extract content](#extract-content-from-webpages-or-online-files).
1. [Add the suggested topics to your bot](#add-suggested-topics-to-an-existing-bot).
1. [Enable the suggested topics](#enable-topics-in-your-bot).

You can [test the topics in the test chat](authoring-test-bot.md), but you'll need to [publish your bot for customers](publication-fundamentals-publish-channels.md) to see the latest changes.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mNOt]

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Supported content

Uploading files is not supported, instead you must provide a URL that meets the following requirements:

- Points to a webpage or supported file type
- Is accessible by anyone on the internet
- Doesn't require a user to login
- Uses HTTPS (starts with `https://`)

The **Suggest topics** capability is built to extract topics from content with a FAQ or support structure. Webpages with a different structure might not work as expected. If you can't extract content from your webpage, try providing the content as a CSV file.

### Supported file types

Tabular file types require a _two-column format_ where each row represents a question and answer pair: the first column contains the question and the second column contains the answer.

> [!IMPORTANT]
> You must provide the full URL to the location of the file, including the file extension. For example `https://www.example.com/thisisafile.pdf`.

| Supported file type             | Requires two-column format |
| ------------------------------- | :------------------------: |
| Comma separated values (.csv)   |            Yes             |
| [Microsoft Excel (.xlsx)][1]    |            Yes             |
| Microsoft Power Point (.pptx)   |                            |
| Microsoft Word (.docx)          |                            |
| Plain text (.txt)               |                            |
| Portable Document Format (.pdf) |                            |
| Tab separated values (.tsv)     |            Yes             |

[1]: #microsoft-excel

#### Microsoft Excel

When using Microsoft Excel files, only the first sheet is imported.

You can enter more than one question (separated by new lines) in a first-column cell and they'll all be added as trigger phrases to the topic suggestion.

:::image type="content" source="media/advanced-create-topics-from-web/multiple-triggers-excel.png" alt-text="Screenshot of an Excel spreadsheet with multiple questions in one cell.":::

:::image type="content" source="media/advanced-create-topics-from-web/multiple-triggers-pva.png" alt-text="Screenshot of all the questions as trigger phrases in the topic suggestion.":::

## Single-turn and multi-turn topic suggestions

When Microsoft Copilot Studio extracts content, it generates single-turn or multi-turn topic suggestions, based on the structure of the document.

A **single-turn topic** has a trigger phrase that contains a single answer. Topics such as these are typically generated if your online content has simple "question-and-answer" pairs, such as an FAQ page.

A **multi-turn topic** contains multiple bot responses, and is often associated with multiple dialog branches. It provides a guided experience for your bot's users to navigate through a problem and reach a solution. These topics are typically generated when your online content is similar to a troubleshooting page or a reference manual or guidebook.

The original content's structure or hierarchy (such as headings and subheadings) will [contribute to whether a multi-turn or single-turn topic is generated](#how-the-ai-creates-topic-suggestions).

:::image type="content" source="media/advanced-create-topics-from-web/sample-multi-turn-topic.png" alt-text="A screenshot of the preview for a multi-turn topic suggestion showing multiple branches from the original question.":::

## Extract content from webpages or online files

First, you'll need to point to the webpages or online files from which you want to extract content.

After the extraction is complete, you'll be shown the suggested topics for further review. Suggested topics aren't automatically added to your bot, but you can [easily add them](#add-suggested-topics-to-an-existing-bot).

1. In the navigation menu, select **Topics**.

1. Select **Suggest topics**.

    :::image type="content" source="media/advanced-create-topics-from-web/suggest-topics-button.png" alt-text="Screenshot of the Suggest topics button." border="false":::

1. Enter a URL for a [supported webpage or online file](#supported-content) from which you want to extract content, and then select **Add**. This queues up content for extraction in a later step.

    > [!IMPORTANT]
    > When using an online file, you must provide the full URL to the location of the file, including the file extension. For example `https://www.contoso.com/support.pdf`.

    :::image type="content" source="media/advanced-create-topics-from-web/suggested-web-wizard.png" alt-text="The Suggest topics page, where you enter URLs to extract suggested topics from.":::

1. As needed, repeat the previous step to add more URLs. We recommend that you add only a few at a time to keep the resulting list of suggestions manageable.

1. If you add a URL by mistake, you can remove it by selecting **Delete**.

    :::image type="content" source="media/advanced-create-topics-from-web/delete-content.png" alt-text="Screenshot of the delete button.":::

1. When you're done adding URLs to webpages and/or online files, select **Start**. The extraction process can take several minutes, depending on the complexity and number of webpages or files you added. The message "Getting your suggestions. This may take several minutes" appears at the top of the screen while the extraction is in progress.

    :::image type="content" source="media/advanced-create-topics-from-web/suggested-web-wait.png" alt-text="An alert that says Getting your suggestions. This may take several minutes appears at the top of the page.":::

    > [!IMPORTANT]
    > You can't add more URLs while the **Suggest topics** command is running.

1. Once extraction is complete, go to the **Suggested** tab. A number of suggestions will appear. These may be either [single-turn or multi-turn topics](#single-turn-and-multi-turn-topic-suggestions).

    :::image type="content" source="media/advanced-create-topics-from-web/suggestion-tab.png" alt-text="Screenshot of the Suggested tab.":::

1. For instructions on how to review, edit, accept, and reject suggested topics, see [Add suggested topics to an existing bot](#add-suggested-topics-to-an-existing-bot).

## Troubleshoot errors

The tool provides explicit feedback about errors so that you can understand and address any issues. For example, you might be unable to extract content because the site you're referencing is down or it may be gated behind a user login, such as a SharePoint page.

:::image type="content" source="media/advanced-create-topics-from-web/suggested-web-error-bar.png" alt-text="A red banner alert that says We ran into problems getting suggestions appears at the top of the page with a link to more details." border="false":::

:::image type="content" source="media/advanced-create-topics-from-web/suggested-web-error-detail.png" alt-text="A pop-up window that describes the errors encountered when trying to get suggestions from a web page." border="false":::

### How the AI creates topic suggestions

The Microsoft Copilot Studio AI engine applies a number of steps to the content when it extracts topics and generates suggestions. These steps utilize AI to identify and parse visual and semantic cues from the content.

1. _Document parsing:_ the Microsoft Copilot Studio engine identifies and extracts the basic components of the document, such as text and image blocks.

1. _Layout understanding:_ the document is segmented into different zones that consist of the blocks of content.

1. _Structure understanding:_ the logical structure of the content is analyzed by determining the "role" of each zone (for example, what is actual content and what are headings). Microsoft Copilot Studio creates a hierarchical map or "heading tree" of the content, based on the headings and their associated content.

1. _Augmentation:_ the Microsoft Copilot Studio AI engine adds context to the tree by analyzing how the headings relate to each other and their content. At this point, it generates single-turn topics from identified simple "question-and-answer" pairs of headings and content.

1. _Dialog generation:_ multi-turn topics are generated from the augmented knowledge tree, depending on whether the topic's intent is a simple answer from a group of many, or if the topic has multiple solutions that are equally different, and are chosen based on a user's input or choices.

## Add suggested topics to an existing bot

After the extraction process has been completed, the topic suggestions appear on the **Suggested** tab. Review them individually to decide which ones you want to include in your bot. You can also add suggestions without reviewing them.

1. Select the name of the suggested topic.  

1. Review the trigger phrase and suggested **Message** node. (Each topic will end with a survey, so your customers can let you know whether they found it helpful.) You have the following three options for dealing with the topic:  

    1. To make edits to the topic, select **Add to topics and edit**. The topic will open, where you can [edit the trigger phrases or enter the authoring canvas](authoring-create-edit-topics.md) to make changes to the conversation flow. The topic will also be removed from the list of suggestions.  

    1. To add the suggested topic without making any changes, select **Add to topics**. The topic is added and saved, but you'll stay on the list of suggested topics. The topic will also be removed from the list of suggested topics.  

    1. To completely remove the suggestion, select **Delete suggestion**. The topic will be deleted from the list of suggested topics. You can run the **Suggest topics** command again if you want to restore it.  

    :::image type="content" source="media/advanced-create-topics-from-web/suggested-web-add-edit.png" alt-text="An editing window showing a snapshot of the topic's layout." border="false":::

1. In the suggested topics list, hover over the name of the suggested topic you want to add or delete.

    1. To add the topic to your bot, select **Add to topics** :::image type="content" source="media/advanced-create-topics-from-web/add-to-topics.png" alt-text="Add to topics." border="false":::. You won't see a preview of the topic and the topic will be moved from the list of **Suggested** topics into **Existing** topics.

    :::image type="content" source="media/advanced-create-topics-from-web/suggested-web-quick.png" alt-text="An up arrow icon next to the title of a topic." border="false":::

1. You can also add or delete multiple topic suggestions at a time. If you select multiple rows, you'll see options to **Add to topic** or **Delete**.

    :::image type="content" source="media/advanced-create-topics-from-web/suggested-web-multi.png" alt-text="The list has three items selected." border="false":::

## Enable topics in your bot

Suggested topics are added to the **Existing** tab with their status set to **Off**. This way, topics won't be prematurely added to your bot.

1. In the navigation menu, select **Topics**.

1. Go to the **Existing** tab.

1. For each topic you want to enable, turn on the toggle under **Status**.

    :::image type="content" source="media/advanced-create-topics-from-web/suggested-enable.png" alt-text="A table that lists existing topics, where each topic has a toggle that switches between Off and On in the Status column." border="false":::

### Related topics

- [Create your first bot](authoring-first-bot.md)  
- [Create and edit topics](authoring-create-edit-topics.md)  
- [Fundamentals - Publish your bot](publication-fundamentals-publish-channels.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
