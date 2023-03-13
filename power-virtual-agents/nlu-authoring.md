---
title: Authoring
description: Copilot for authoring
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

# How to use Copilot to create and edit topics (Preview)

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]



In addition to the traditional method for [creating and editing topics](authoring-create-edit-topics.md), Power Virtual Agents lets you create and iterate on topics by describing what you want and having AI build it for you, significantly decreasing the time it takes to create and update bot topics.

The AI behind the Copilot feature is powered by the Azure OpenAI GPT-3 model (which is also used in Bing).



## Prerequisites
- You must be using the preview version of Power Virtual Agents, and the bot type must be **Preview**. Preview chatbots have **(preview)** added to their name.
- Review the [Copilot topic creation training, model, and usage FAQ](nlu-authoring-faq.md).

## Use Copilot to create a topic

When create a new topic, you can select **Describe it** and ask the AI to make it for you. You need to do this for each topic you want to create, and you can't create multiple topics in one description.

1. Open your bot and select **Topics**. On the **Topics** page, select **+ New topic** and then **Create with Copilot (preview)**.

    :::image type="content" source="media/nlu-gpt/describe-it-new-topic.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the New topics button highlighted.":::

    >[!NOTE]
    >If you don't see the **Copilot** option, confirm that **Intelligent authoring support** in the Power Virtual Agents **Settings** page is set to **On**:
    >>1. Select the **Settings** cogwheel icon on the main menu bar, and then select **General settings**.
    >>    :::image type="content" source="media/nlu-gpt/describe-it-enable.png" alt-text="Screenshot of the Power Virtual Agents top menu with the Settings icon open.":::
    >>2. Confirm the toggle switch under **Intelligent authoring support (preview)** is set to **On**.

2. In the **Create it with Copilot (preview)** window that appears, enter a name for your topic in the **Name your topic** field. 

3. In the **Create a topic to...** field, describe the topic you want to create in simple, plain English. You can include questions you want the bot to ask, messages it should show, and details of the specific behavior you want the bot to take.

    :::image type="content" source="media/nlu-gpt/describe-it-create-topic.png" alt-text="Screenshot of the Describe it to build it pop-up window.":::
   
    You can select any of the examples to automatically insert them into the **Create a topic to...** field. Select **View more examples** to generate new suggestions. 
      
4. Select **Create**.
   
5. The authoring canvas will open and a new topic, with trigger phrases, as well as one or more nodes, created for you. You can [use Copilot to further refine and update the topic](#use-copilot-to-edit-a-topic), in addition to the [usual ways of editing topics](authoring-create-edit-topics.md).


## Use Copilot to edit a topic

You can use AI to help you modify any topic in your bot. The topic doesn't need to have been created with the **Copilot** feature.

1. Open your bot and select **Topics**. Select the topic you want to modify, and then **Edit with Copilot** on the menu bar just above the topic's conversation path.

    :::image type="content" source="media/nlu-gpt/describe-it-toolbar.png" alt-text="Screenshot of the Power Virtual Agents authoring window with the Describe it button highlighted.":::
   
2. In the **What do you want to do** field, describe what you want to change or add in the topic. 

    :::image type="content" source="media/nlu-gpt/describe-it-modify.png" alt-text="Screenshot of the Power Virtual Agents authoring window with the Describe it side panel open.":::

    Use simple, plain English to direct the AI with what you want it to do, as in the these examples:

    - _add a question to ask the user for their date of birth_
    - _add 2 message variations to all questions in the topic_
    - _summarize the information collected from the user in an Adaptive Card_

> [!TIP]
>
>If you have any nodes selected on your canvas, they will be used to scope your request.  
>For example, if you have a question node selected, you could write, _add a speech response_, instead of _add a speech response to the question node_.
> You can see if you have any nodes selected, and how many, next to the **Update** button.

3. Click **Update**. The AI will make updates based on your directions.
   
4. Once the update has been applied, you can review the changes and continue to edit your topic, either in the [usual ways of editing topics](authoring-create-edit-topics.md) or by describing more things you want to change. 
    
    If you don't like the changes, select the **Undo** button. You can then change your directions and try again.

    :::image type="content" source="media/nlu-gpt/describe-it-modify-undo.png" alt-text="Screenshot of the Power Virtual Agents Describe it side panel open, showing the Undo button.":::

    You can always see the last thing you asked **Copilot** to do under the **What you asked for** label.

> [!TIP]
>  
> You can provide feedback on how well the AI did by selecting the "thumbs up" or "thumbs down" icon at the bottom of the **Edit with Copilot** panel.  
> If you select the thumbs down icon, you can also include more verbose feedback. We'll use this feedback to improve the quality of the AI.
>  
> :::image type="content" source="media/nlu-gpt/describe-it-feedback.png" alt-text="Screenshot of the Power Virtual Agents Describe it feedback panel.":::


## What's supported

As Copilot in is currently in preview, it is limited in terms of its support for PVA topics and its understanding of the available nodes used within them.

- Copilot is currently able to use Message, Question and Condition nodes when building and iterating on topics. Other node types are not currently supported.

- Copilot currently understands the required properties on Message, Question and Condition nodes, such as the text to use when prompting the user, or generating appropriate output variables. However, Copilot does not currently understand all of the available, more advanced, properties (such as reprompt and interruption settings on a Question node). You can use the authoring canvas to make changes to these.

- Condition nodes that are created by Copilot, to branch a topic following a multiple choice question, will currently have errors within the generated conditions. You will need to fix these conditions manually.

[!INCLUDE[footer-include](includes/footer-banner.md)]

