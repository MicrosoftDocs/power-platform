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

# Use GPT AI to create and edit topics (Preview)

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

> [!WARNING]
>  
> This doc is under stakeholder review and is not final. Feature names are not final.

In addition to the traditional method for [creating and editing topics](../authoring-create-edit-topics.md), Power Virtual Agents lets you create and iterate on topics by describing what you want and having AI build it for you, significantly decreasing the time it takes to create and update bot topics.

The AI behind the GPT Authoring feature is powered by the Azure OpenAI GPT-3 model (which is also used in Bing).

> [!WARNING]
>
> Need to update with official branding. cw Jack.

## Use GPT AI to create a topic

1. Open your bot and select **Topics**. On the **Topics** page, select **+ New topic** and then **Describe it to build it (preview)**.

    :::image type="content" source="media/describe-it-new-topic.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the New topics button highlighted.":::

2. In the **Describe it to build it (preview)** window that appears, describe the topic you want to create in simple, plain English. You can include questions you want the bot to ask, messages it should show, and details of the specific behavior you want the bot to take.

    :::image type="content" source="media/describe-it-create-topic.png" alt-text="Screenshot of the Describe it to build it pop-up window.":::
   
    You can select any of the examples to automatically insert them into the **Create a topic to...** field. Select **View more examples** to generate new suggestions. 

3. Enter a name for your topic in the **Name your topic** field. You can include punctuation in the trigger phrase, but it's best to use short phrases rather than long sentences.
   
   > [!TIP]
   > 
   > Giving your topic a name helps the AI to construct your topic, as it adds context to your request. 
   
4. Select **Create**.
   
5. The authoring canvas will open and a new topic, including a generated title and trigger phrases as well as one or more nodes, will be created for you. You can [use AI to further refine and update the topic](#use-gpt-ai-to-edit-a-topic), in addition to the [usual ways of editing topics](../authoring-create-edit-topics.md).


## Use GPT AI to edit a topic

You can use AI to help you modify any topic in your bot. The topic doesn't need to have been created with the **Describe it** feature.

1. Open your bot and select **Topics**. Select the topic you want to modify, and then **Describe it** on the menu bar just above the topic's conversation path.

    :::image type="content" source="media/describe-it-toolbar.png" alt-text="Screenshot of the Power Virtual Agents authoring window with the Describe it button highlighted.":::
   
2. Describe what you want to change or add in the topic. 

    :::image type="content" source="media/describe-it-modify.png" alt-text="Screenshot of the Power Virtual Agents authoring window with the Describe it side panel open.":::

    Use simple, plain English to direct the AI with what you want it to do, as in the these examples:

    - _add a question to ask the user for their date of birth_
    - _add 2 message variations to all questions in the topic_
    - _update the content within the topic to be more appropriate for customer service_

> [!TIP]
>
>If you have any nodes selected on your canvas, they will be used to provide further context to your request.  
>For example, if you have a question node selected, you could write, _add a speech response_, instead of _add a speech response to the question node_.

3. Click **Update**. The AI will make updates based on your directions.
   
4. Once the update has been applied, you can review the changes and continue to edit your topic, either in the [usual ways of editing topics](../authoring-create-edit-topics.md) or by describing more things you want to change. 
    
    If you don't like the changes, select the **Undo** button. You can then change your directions and try again.

    :::image type="content" source="media/describe-it-modify-undo.png" alt-text="Screenshot of the Power Virtual Agents Describe it side panel open, showing the Undo button.":::

> [!TIP]
>  
> You can provide feedback on how well the AI did by selecting the "thumbs up" or "thumbs down" icon at the bottom of the **Describe it** panel.  
> If you select the thumbs down icon, you can also include more verbose feedback. We'll use this feedback will to improve the quality of the AI.
>  
> :::image type="content" source="media/describe-it-feedback.png" alt-text="Screenshot of the Power Virtual Agents Describe it feedback panel.":::


[!INCLUDE[footer-include](includes/footer-banner.md)]