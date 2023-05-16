---
title: Create (and edit) with Copilot
description: Use AI powered by GPT to create and edit bot topics, and get your chatbot ready for your users in minutes.
keywords: "PVA"
ms.date: 3/16/2023
ms.topic: how-to
author: KendalBond007
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Create (and edit) with Copilot

[!INCLUDE [AI tech disclosure](includes/disclosure-ai-preview.md)]



In addition to the traditional method for [creating and editing topics](authoring-create-edit-topics.md), Power Virtual Agents lets you create and iterate on topics by describing what you want and having AI build it for you, significantly decreasing the time it takes to create and update bot topics.

This means you can quickly create and deploy a functional bot, without having to first manually author multiple topics.

The capability uses AI to understand what you want to do, and then automatically creates a functioning topic, complete with different node types and conversational responses.

See the [AI-based chatbot authoring overview (preview)](nlu-gpt-overview.md) for more examples and descriptions of how this capability works, and how to use it with the [Boost conversations (preview)](nlu-boost-conversations.md) capability.

## Prerequisites

> [!CAUTION] 
>  
> Your bot must be created in the US region. 
>  
> Other regions, and languages other than English, aren't currently supported.

- You'll need an account for Power Virtual Agents. 

    > [!NOTE]
    >  
    > If you don't have a Power Virtual Agents account, or you haven't created chatbots with Power Virtual Agents before, see the [Quickstart guide for building bots with GPT (preview)](nlu-gpt-quickstart.md).

- You must be using the [preview version of Power Virtual Agents](overview-preview.md), and the bot type must be **Preview**. Preview chatbots have **(preview)** added to their name. When you create a new bot, select **Try the unified canvas (preview)**.

    :::image type="content" source="media/nlu-gpt/nlu-boost-preview-bots.png" alt-text="Screenshot of the list of chatbots showing bots with preview added to their names.":::

- Review the [AI response generation training, model, and usage notes](#ai-response-generation-training-model-and-usage-notes) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note). 

- This capability may be subject to usage limits or capacity throttling.

## Use Copilot to create a topic

When creating a new topic, you can select **Create with Copilot** and ask the AI to make it for you. You need to do this for each topic you want to create, and you can't create multiple topics in one description.

1. Open your bot and select **Topics**. On the **Topics** page, select **+ New topic** and then **Create with Copilot**.

    :::image type="content" source="media/nlu-gpt/describe-it-new-topic.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the New topics button highlighted.":::

    > [!NOTE]
    >  
    > If you don't see the **Copilot** option, you may need to enable **Intelligent authoring support**:
    > 1. Select the **Settings** icon on the top menu and then **General settings**.
    >:::image type="content" source="media/nlu-gpt/describe-it-enable.png" alt-text="Screenshot of the Power Virtual Agents menu with the Settings icon open.":::
    >  
    > 2. Set the switch under **Intelligent authoring support (preview)** to **On**.

2. In the **Create it with Copilot (preview)** window that appears, enter a name for your topic in the **Name your topic** field. 

3. In the **Create a topic to...** field, describe the topic you want to create in simple, plain English. You can include questions you want the bot to ask, messages it should show, and details of the specific behavior you want the bot to take.

    :::image type="content" source="media/nlu-gpt/describe-it-create-topic.png" alt-text="Screenshot of the Describe it to build it pop-up window.":::
   
    You can select any of the examples to automatically insert them into the **Create a topic to...** field. Select **View more examples** to generate new suggestions. 
      
4. Select **Create**.
   
5. The authoring canvas will generate and open a new topic, with trigger phrases and one or more nodes, based on what you asked for. You can [use Copilot to further refine and update the topic](#use-copilot-to-edit-a-topic), in addition to the [usual ways of editing topics](authoring-create-edit-topics.md).


## Use Copilot to edit a topic

With the new **Edit with Copilot (preview)** pane, you can make changes to your topic using the power of NLU. For example, if you want to make updates to your bot, such as moving and updating the nodes, all you need to do is describe what you want with Copilot.
Think of this new capability as a powerful wizard-like feature that walks you through the editing a topic process to fine-tune your bot's topics without having to work directly in the authoring canvas. You can also make additions and changes to existing nodes, and tell Copilot what you want it to do.

You can use AI to help you modify any topic in your bot. The topic doesn't need to have been created with Copilot.

1. Open your bot and select **Topics**. Select the topic you want to modify, and then **Edit with Copilot** on the menu bar just above the topic's conversation path.

    :::image type="content" source="media/nlu-gpt/describe-it-toolbar.png" alt-text="Screenshot of the Power Virtual Agents authoring window with the Describe it button highlighted.":::

    > [!TIP]
    >
    >If you have selected any nodes on the canvas, they will be used to scope your request.  
    >For example, if you have a **Question** node selected, you could write _add a speech response_, instead of _add a speech response to the question node_.
    > You can see the nodes you've selected next to the **Update** button.
   
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
    > You can see the nodes you've selected next to the **Update** button.

3. Click **Update**. The AI will make updates based on your directions.
   
4. Once the update has been applied, you can review the changes and continue to edit your topic, either in the [usual ways of editing topics](authoring-create-edit-topics.md) or by describing more things you want to change. 
    
    If you don't like the changes, select the **Undo** button. You can then change your directions and try again.

    :::image type="content" source="media/nlu-gpt/describe-it-modify-undo.png" alt-text="Screenshot of the Power Virtual Agents Describe it side panel open, showing the Undo button.":::

    You can always see the last thing you asked Copilot to do under the **What you asked for** label.

> [!TIP]
>  
> You can provide feedback on how well the AI did by selecting the "thumbs up" or "thumbs down" icon at the bottom of the **Edit with Copilot** panel.  
> If you select the thumbs down icon, you can also include more verbose feedback. We'll use this feedback to improve the quality of the AI.
>  
> :::image type="content" source="media/nlu-gpt/describe-it-feedback.png" alt-text="Screenshot of the Power Virtual Agents Describe it feedback panel.":::

## Disable Copilot in Power Virtual Agents

Admins can disable Copilot for their organization by starting a support request with Microsoft.

## What's supported

### Topic node support

During this preview, Copilot can create Message, Question, and Condition nodes when building and iterating on topics. Other node types aren't currently supported.

There are some additional limitations on how Copilot works with nodes:

- Copilot understands the required properties on Message, Question, and Condition nodes, such as the text to use when prompting the user, or generating appropriate output variables. However, Copilot doesn't understand all of the more advanced properties that can be configured in these nodes, such as the reprompt and interruption settings on a Question node. 
    - You can still configure these properties manually by editing the generated topic in the authoring canvas, just as you would when [normally creating topics](authoring-create-edit-topics.md).

- Condition nodes that are created by Copilot, to branch a topic following a multiple choice question, will show errors in the generated conditions. 
    - You'll need to resolve these errors manually in the [authoring canvas](authoring-create-edit-topics.md).

## AI response generation training, model, and usage notes

This FAQ answers common questions about the AI that is used when creating new topics, or modifying existing topics, in Power Virtual Agents.


### Does the capability produce perfect topics?   

Topics generated by the **Copilot** capability are not always perfect, and may not accurately reflect the logic you wanted to implement. 

The system is designed to generate a single bot topic from a human-written description. We have implemented mitigations to filter out irrelevant and offensive language from appearing in the configured topic, and the system is designed not to respond when offensive language is detected. 

We also monitor output and the feedback that bot users provide to continually improve our content filters.

These filters and mitigations are not foolproof.

You should always test and review your bots before publishing them.

### How was the capability evaluated? What metrics are used to measure performance?

The capability was evaluated on a collection of manually curated prompt-and-topic datasets, covering common, edge-case, and offensive content, as well as synthetic generation.

During evaluation, topics generated from the capability were manually reviewed and scored for relevance to the input prompt, usefulness, and offensiveness. 

## Fairness and broader impact

### Will the capability work as well using languages other than English?

The system only supports English. Inaccurate responses may be returned when users converse with the system in languages other than English.

## Privacy

### What data does the capability collect? How is the data used?

The capability collects user prompts, the returned configured Topics, and any feedback you provide.

We use this data to evaluate and improve the quality of the capability. More information on what data is collected is available in the [terms](https://go.microsoft.com/fwlink/?linkid=2236010).

## Reporting Concerns

### How can I report concerns about Copilot?

If you have any concerns (such as those relating to content policies or codes of conduct) about the Copilot feature, you can raise them by [emailing us](pvareport@microsoft.com). We will aim to respond to you within 2 business days.

[!INCLUDE[footer-include](includes/footer-banner.md)] 
