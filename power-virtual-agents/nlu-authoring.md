---
title: Create and edit with Copilot
description: Use AI powered by GPT to create and edit copilot topics, and get your copilot ready for your users in minutes.
keywords: "PVA"
ms.date: 12/22/2023
ms.topic: how-to
author: KendalBond007
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope: "Power Virtual Agents"
---

# Create and edit with Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Normally, you can manually [create and edit topics](authoring-create-edit-topics.md), but Microsoft Copilot Studio lets you create and iterate on topics with a description. By describing what you want and having AI build it for you, time is saved in creating and updating copilot topics.

AI understands what you want to do, then automatically creates a topic with different node types and conversational responses.

The [AI-based copilot authoring overview](nlu-gpt-overview.md) shows how this capability works. You can also use copilot authoring with [Generative answers](nlu-boost-conversations.md) to boost conversations.

## Prerequisites

- An account for Microsoft Copilot Studio.
  
  > [!NOTE]
  >  
  > To create an account or get more familiar with Copilot Studio, see the [Quickstart guide for building copilots with generative AI](nlu-gpt-quickstart.md).

- Review the [AI response generation training, model, and usage FAQ](faqs-copilot.md) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note).

- This capability might be subject to usage limits or capacity throttling.

- To see the language support, go to [Supported languages](authoring-language-support.md).

## Use Copilot Studio to create a topic

You can create a new topic from a description on the **Topics** page in your copilot.

1. Select **+ Add** > **Topic** > **Create from description**.

   :::image type="content" source="media/nlu-gpt/describe-it-new-topic.png" alt-text="Screenshot of the Microsoft Copilot Studio navigation pane with Topics and the New topics button highlighted.":::

   > [!NOTE]
   >  
   > If you don't see the **Create from description** option, enable **Intelligent authoring support**:
   >
   > 1. Select the **Settings** icon on the top menu and then **General settings**.
    >:::image type="content" source="media/nlu-gpt/nlu-authoring-general-settings.png" alt-text="Screenshot of the Microsoft Copilot Studio menu with the Settings icon open.":::
   > 1. Set the switch under **Intelligent authoring support** to **On**.

1. In the **Create it with Copilot** window, add a name in the **Name your topic** field.

1. In the **Create a topic to...** field, describe the topic you want to create in simple, plain English. You can include questions you want the copilot to ask, messages it should show, and details of the behavior you want the copilot to take.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-describe-it-create-topic.png" alt-text="Screenshot of the Describe it to build it pop-up window.":::

   You can select any of the examples to automatically insert them into the **Create a topic to...** field. Select **View more examples** to generate new suggestions.

1. Select **Create**.

   The authoring canvas generates and opens a new topic. The topic includes trigger phrases, and one or more nodes, based on your description.

> [!TIP]
> For more information on editing topics manually, see [Create and edit topics in your Microsoft Copilot Studio copilot](authoring-create-edit-topics.md).

## Use Copilot to edit a topic

You can make changes to any topic using the power of natural language understanding (NLU). For example, if you want to move or update the nodes, you can describe what you want in the **Edit with Copilot** pane.

1. From the **Topics** page in your copilot, select the topic you want to modify.
1. Choose **Edit with Copilot** on the menu bar.

    :::image type="content" source="media/nlu-gpt/edit-with-copilot-on-toolbar.png" alt-text="Screenshot of the Copilot Studio authoring window with the Edit with Copilot button highlighted.":::

    > [!TIP]
    > When describing a task for your copilot, there's no need to mention canvas elements. For example, adding _ask the user their full name_ to a question node, you don't have to direct the AI with _ask the user their full name in the question node_.

1. In the **What do you want to do?** field, describe the change or addition to the topic.

   :::image type="content" source="media/nlu-gpt/edit-with-copilot-modify.png" alt-text="Screenshot of the Copilot Studio authoring window showing the What do you want to do box where you can add a description of your change or addition to a topic.":::

   Use simple, plain English to direct the AI, like in these examples:

   - _add a question to ask the user for their date of birth_
   - _add 2 message variations to all questions in the topic_
   - _summarize the information collected from the user in an [Adaptive Card](authoring-send-message.md#add-an-adaptive-card)_

1. Select **Update**.

   You can continue to [edit topics](authoring-create-edit-topics.md) or describe more changes.

    If you don't like the changes, select the **Undo** button and try again.

    :::image type="content" source="media/nlu-gpt/undo-button.png" alt-text="Screenshot of the location of the Copilot Studio undo button.":::

    You can update your description under the **What you asked for** label on the **Edit with Copilot** pane.

> [!TIP]
>  
> To give feedback on the AI, select the "thumbs up" or "thumbs down" icon at the bottom of the **Edit with Copilot** panel.  
> :::image type="content" source="media/nlu-gpt/thumbs-up-or-down.png" alt-text="Screenshot of the location of the thumbs up or down buttons.":::
> Select the thumbs down icon to see the **Send feedback** pane and add detailed feedback. We'll use this feedback to improve the quality of the AI.
>  
> :::image type="content" source="media/nlu-gpt/submit-feedback.png" alt-text="Screenshot of the Send feedback pane.":::

## What's supported

### Topic node support

Copilot can create **Message**, **Question**, and **Condition** nodes when building and iterating on topics. Other node types aren't currently supported.

There are some limitations on how Copilot Studio works with nodes:

- Copilot understands the required properties on **Message**, **Question**, and **Condition** nodes, such as text to prompt the user or the appropriate output variables. However, Copilot doesn't understand advanced properties of these nodes, such as the reprompt and interruption settings on a Question node.
  - You can still manually edit these properties.

- **Condition** nodes created by Copilot Studio that branch a topic from a multiple choice question show errors in the generated conditions.
  - You can [troubleshoot these errors](error-codes.md) manually.

[!INCLUDE[footer-include](includes/footer-banner.md)]
