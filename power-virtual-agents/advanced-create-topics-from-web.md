---
title: "Get Power Virtual Agents topic suggestions from support pages"
description: "Use existing help and support pages to quickly generate new topics for your Power Virtual Agents bot."
keywords: ""
ms.date: 02/24/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring
ms.collection: virtual-agent
---


# Create topics from existing support content on the web

You can use content from existing webpages when creating a Power Virtual Agents bot. This feature is useful if you have help or support content, such as FAQ pages or supports sites. 

Rather than manually copy-pasting or recreating content, you can use AI-assisted authoring to automatically extract and insert relevant content from existing web content into your bot.

The feature uses AI to determine the structure and content on a webpage. It isolates content blocks that pertain to single issues and classifies them into topics. The feature then identifies what the [**Trigger phrase** (or "question") and what the **Message** node (or "answer")](authoring-create-edit-topics.md) should be for each topic.

There are three main steps to using the feature: 
1. Extract content from FAQ or support pages.
2. Add the provided suggestions into your bot.
3. Enable the topics.

You can [test the topics in the test chat](authoring-test-bot.md), but you'll need to [publish your bot for customers](publication-fundamentals-publish-channels.md) to see the latest changes.

>    
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4mNOt]
>

## Extract content from webpages

To get suggestions from webpages, you first need to run the topic extraction wizard on the pages you want to use.

After running the extraction wizard, you'll be shown the suggested topics. Suggested topics won't be automatically added to your bot, but you can [easily add them](#add-suggested-topics-to-an-existing-bot).

>[!IMPORTANT]
>The feature expects the webpages to be in the form of FAQ pages or support sites. Other types of pages that don't have that structure may not work as expected.

**Extract content from existing webpages:**
1. Select **Topics** on the side navigation pane.

    ![The Topics menu item on the navigation pane](media/menu-topics.png)

2. Go to the **Suggested** tab. 

3. If it's the first time you're getting suggestions, the list of suggested topics will be blank. A link to **Get started** or to **Learn more** will show instead.

4. Click **Get started** or **Suggest topics** to open the suggestions extraction wizard. 

    ![An empty Topics page, with a link to Get started or Learn more](media/suggested-web-get.png)

5. Enter each webpage you want to extract content from and select **Add**. The URLs must be secure (they must start with *https://*).

6. You can delete any page by hovering near the end of the URL and selecting the delete icon.

    ![The Get topics wizard, requesting to add a URL, with Start and Cancel buttons](media/suggested-web-wizard.png)

7. When you're done adding pages, select **Start** to begin the extraction process. The process can take several minutes, depending on the complexity and number of webpages you added. An alert at the top of the screen will let you know the extraction is in process. 

>[!IMPORTANT]
>You won't be able to add more URLs while the extraction is happening.

    ![A message that says Getting your suggestions. This may take several minutes appears at the top of the page](media/suggested-web-wait.png)

>[!TIP]
>You can add multiple webpages but we recommend that you don't include more than a few at a time to keep it manageable.

The tool provides explicit feedback about errors so that you can understand and address the issue. For example, the site you're referencing might be down and you can't extract content.

After you've successfully extracted content, a number of suggestions will appear. You can now review these suggestions to see what to add to your bot.

![A tabulated list of suggested topics, as seen on the Suggested tab on the Topics page; each suggested topic has a name, trigger phrases, source, and date it was received listed in the table](media/suggested-web-topics.png)

## Add suggested topics to an existing bot

Once the extraction process has completed, you'll see the successfully extracted topic suggestions appear under the **Suggested** tab. Review them individually to help you decide which ones you want to include in your bot. You can also just add suggestions without reviewing them. 

**Review suggestions and add to bot:**

1. Select the name of the suggested topic.

2. Review the trigger phrases and suggested **Message** node. Each topic will end with a survey so your customers can identify if it was helpful or not. You can deal with the suggested topic in three ways:
    a. To make edits to the topic, select **Add to topics and edit**. [The topic will open, where you can edit the trigger phrases or enter the authoring canvas](authoring-create-edit-topics.md) to make changes to the conversation flow. The topic will also be removed from the list of suggested topics.
    b. To directly add the suggested topic without making any changes, select **Add to topics**. The topic is added and saved, but you'll stay on the list of suggested topics. The topic will also be removed from the list of suggested topics.
    c. To completely remove the suggestion, select **Delete suggestion**. The topic will be deleted from the list of suggested topics. Run the extraction wizard again to restore it.

    ![An editing window showing a snapshot of the topic's layout, with buttons to either Add to topics, Delete suggestion, or Add to topics and edit](media/suggested-web-add-edit.png)

**Add or delete suggested topics directly from the suggestions list:**

1. In the suggested topics list, hover over the name of the suggested topic you want to add or delete.
    a. To add the topic to your bot, select the **Add to Existing topics** button. You won't see a preview of the topic, and the topic will be automatically removed from the list of suggested topics.
    b. To delete the suggested topic, select the **Delete** button. The topic will be deleted from the list of suggested topics. Run the extraction wizard again to restore it.

    ![A highlight of an up arrow icon next to the title of a topic in the tabulated list of suggested topics](media/suggested-web-quick.png)
    
2. You can also add or delete multiple topic suggestions at a time. If you select multiple rows, you'll see options to **Add to topic** or **Delete**.

    ![The tabulated list has three different items selected, indicated by checkmarks next to each selected item](media/suggested-web-multi.png)

## Enable topics in your bot

Topic suggestions are added with their status set to **Off**. Setting it to this status helps prevent errors or incorrect topics being added to your bot.

**Enable topics for use:**

1. Select **Topics** on the side navigation pane.
    
    ![The Topics menu item on the navigation pane](media/menu-topics.png)

2. Go to the **Existing** tab. 

3. For each topic you want to enable, slide the switch under **Status** to **On**.

    ![A tabulated list of existing topics, each item in the list has a switch toggle that can be set between off and on, under a column labeled status](media/suggested-enable.png)

## Related links
- [Create your first bot](authoring-first-bot.md)
- [Create and edit topics](authoring-create-edit-topics.md)
- [Fundamentals - Publish your bot](publication-fundamentals-publish-channels.md)

