---
title: "Get Power Virtual Agents topic suggestions from support pages"
description: "Use existing help and support pages to quickly generate new topics for your Power Virtual Agents bot."
keywords: ""
ms.date: 01/22/2020
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

You can efficiently leverage existing content that already exists on webpages when creating a Power Virtual Agents bot.  This capability is useful if you already have help or support content, such as FAQ pages or supports sites. 

Rather than having to design a whole new topic architecture, plan and write the content, copy it manually into individual topics, and then configure the conversation flow, you can utilize AI-assisted authoring to automatically extract and insert relevant content from existing web content into your bots.

The feature uses AI to determine the structure and content on a web page. It isolates content blocks that pertain to single issues and classifies them into topics. It then identifies what the [trigger phrase (or "question") and what the **Message** node (or "answer")](authoring-create-edit-topics.md) should be for each topic.

There are three main steps to using the feature: 
1. Extract content from FAQ or support pages.
2. Add the provided suggestions into your bot.
3. Enable the topics.

You can [test the topics in the test chat](authoring-test-bot.md), but you'll need to [publish your bot for customers](publication-fundamentals-publish-channels.md) to see the latest changes.

### Watch
> [!VIDEO <https://go.microsoft.com/fwlink/?linkid=2116305>]


## Extract content from web pages

To get suggestions from web pages, you first need to run the topic extraction wizard on the pages you want to use.

After running the extraction wizard, you'll be presented with a series of suggested topics. Suggested topics won't be automatically added to your bot, but you can easily [add them individually or in bulk](#add-suggested-topics-to-an-existing-bot).

>[!IMPORTANT]
>The feature expects the websites to be in the form of FAQ pages or support sites. Other types of pages that don't have that structure may not work as expected.

**Extract content from existing web pages:**
1. Select **Topics** on the side navigation pane.

    ![](media/menu-topics.png)

2. Go to the **Suggested** tab. 

3. If this is the first time you're getting suggestions, the list of suggested topics will be blank, with a link to **Get started** or to **Learn more** (which will take you back to this page).

4. Click **Get started** or **Suggest topics** to open the suggestions extraction wizard. 

    ![](media/suggested-web-get.png)

5. Enter each web page you want to extract content from and select **Add**. The URLs must be secure (they must start with *https://*).

6. You can delete any page by hovering near the end of the URL and selecting the delete icon.

    ![](media/suggested-web-wizard.png)

7. When you're done adding pages, select **Start** to being the extraction process. This could take several minutes, depending on the complexity and number of web pages you added. A alert at the top of the screen will let you know the extraction is in process. You will not be able to add more URLs while extraction is happening.

    ![](media/suggested-web-wait.png)

>[!TIP]
>You can add multiple websites but we recommend that you don't include more than a few at a time to keep it manageable.

Sometimes it may be impossible to extract content from a linked website (for example, the site you're referencing might be down). The tool provides explicit feedback about errors so that you can understand and address the issue.

After you've successfully extracted content, a number of suggestions should appear. You can now review these to determine which you want to add to your bot.

![](media/suggested-web-topics.png)

## Add suggested topics to an existing bot

Once the extraction process has completed, you'll see the successfully extracted topic suggestions appear under the **Suggested** tab. You can then review them and decide which ones you want to include in your bot. You can also just add suggestions without reviewing them. 

We recommend that you review and look at the extracted content first, so that you know what you're adding to your bot. 

**Review suggestions and add to bot:**

1. Select the name of the suggested topic.

2. Review the trigger phrases and suggested **Message** node. Note that each topic will end with a survey so your customers can identify if it was helpful or not. You can deal with the suggested topic in three ways:
    a. To make edits to the topic (which you may want to do to add to the trigger phrases, or change the answer in the **Message** node), select **Add to topics and edit**. This will [open that topic where you can edit the trigger phrases or enter the authoring canvas](authoring-create-edit-topics.md) to make changes to the conversation flow. This will also remove the topic from the list of suggested topics.
    b. To directly add the suggested topic without making any changes, select **Add to topics**. This all add the topic and save it, but you'll stay on the list of suggested topics. This will also remove the topic from the list of suggested topics.
    c. To completely remove the suggestion, select **Delete suggestion**. This will delete it from the list of suggested topics and you'll need to run the extraction wizard again to get it back.

    ![](media/suggested-web-add-edit.png)

**Add or delete suggested topics directly from the suggestions list:**

1. In the suggested topics list, hover over the name of the suggested topic you want to add or delete.
    a. To add the topic to your bot, select the **Add to Existing topics** button. You won't see a preview of the topic, and the topic will be automatically removed from the list of suggested topics.
    b. To delete the suggested topic, select the **Delete** button. This will delete it from the list of suggested topics and you'll need to run the extraction wizard again to get it back.

    ![](media/suggested-web-quick.png)

## Enable topics in your bot

Topic suggestions are added to your bot with a status of **Off**. This is to prevent accidental inclusion of erroneous or incorrect topics in your bot.

**Enable topics for use:**

1. Select **Topics** on the side navigation pane.
    
    ![](media/menu-topics.png)

2. Go to the **Existing** tab. 

3. For each topic you want to enable, slide the switch under **Status** to **On**.

    ![](media/suggested-enable.png)

## Related links
- [Create your first bot](authoring-first-bot.md)
- [Create and edit topics](authoring-create-edit-topics.md)
- [Fundamentals - Publish your bot](publication-fundamentals-publish-channels.md)

