---
title: Authoring
description: Desc for authoring
keywords: "PVA"
ms.date: 2/8/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: 
manager: shellyha
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---

# Create and edit topics using natural language (preview)

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

> [!WARNING]
>  
> This doc is still under construction. Headings, titles, page names, and TOC entries are placeholders.

In addition to the traditional method for [creating and editing topics](../authoring-create-edit-topics.md), Power Virtual Agents lets you create and iterate on topics by describing what you want and having AI build it for you, significantly decreasing the time it takes to create and update bot topics.

The AI behind the GPT Authoring feature is powered by the Azure OpenAI GPT-3 model (which is also used in Bing).

> [!WARNING]
>
> Need to update with official branding. cw Jack.

## Creating a topic

1. Open your bot and select **Topics**. On the **Topics** page, select **+ New topic** and then **Describe it to build it (preview)**.

    :::image type="content" source="media/describe-it-new-topic.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the New topics button highlighted.":::

2. In the **Describe it to build it (preview)** window that appears, describe the topic you want to create. You can include questions you want the bot to ask, messages it should show, and details of the specific behavior you want the bot to take.

    :::image type="content" source="media/describe-it-create-topic.png" alt-text="Screenshot of the Describe it to build it pop-up window.":::
   
    You can select any of the examples to automatically insert them into the **Create a topic to...** field. Select **View more examples** to generate new suggestions. 

3. Enter a name for your topic in the **Name your topic** field. You can include punctuation in the trigger phrase, but it's best to use short phrases rather than long sentences.
   
   > [!TIP]
   > 
   > Giving your topic a name can help improve the topic that is built for, because it adds content to your request. 
   
4. Click **Create**.
   
5. The authoring canvas will now open and a new Topic, which can include a generated title and trigger phrases, as well as one or more nodes, will be created for you. You can now review the content that has been generated for you and make any changes required, which you can do either via [natural language descriptions]() or using the [other authoring canvas tools](../authoring-create-edit-topics.md).

## Making changes to a topic

You can make additions or changes to a topic, regardless of how the topic was created (from a natural language description or manual authoring) by describing what you want to do.

1. Open the **Describe** panel by clicking the button in the tool bar.
   
2. You can now enter a description of what you would like to add or change within your topic. Below are some examples requests.

- add a question to ask the user for their date of birth
- add 2 message variations to all questions in the topic
- update the content within the topic to be more appropriate for customer service

> If you have any nodes selected on your canvas, they will be used to provide further context to your request. For example, if you have a question node selected, you could say, `add a speech response`, instead of needing to say `add a speech response to the question node`.

3. Click **Update** to make updates based on your description.
   
4. Once the update has been applied, you can review the changes and continue to edit your topic, either via the authoring canvas or making another natural language request. If you're not happy with the changes made, you can use the **Undo** button in the panel to revert the change, amend your request, and try again.

> You can provide feedback about the outcomes of your request using the thumbs up / down icons available within the panel. If you indicate that a request didn't do what you were expecting using the thumbs down icon, you can optionally provide additional details relating to your request to help us understand how we can improve the quality of future results. 

[!INCLUDE[footer-include](includes/footer-banner.md)]