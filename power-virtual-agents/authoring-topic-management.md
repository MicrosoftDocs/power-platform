---
title: "Fix errors, set status, and copy topics"
description: "Resolve errors, set the status of individual topics, and copy topics when creating new topics to save time."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Manage topics in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

There are a number of ways you can manage your topics. Microsoft Copilot Studio includes a topic checker that lets you know if there are errors in your topics, you can turn topics on or off so they don't appear to people chatting with your bot, and you can copy or duplicate topics to make it easier to create new ones.

- [Manage topics in Microsoft Copilot Studio](#manage-topics-in-microsoft-copilot-studio)
  - [Prerequisites](#prerequisites)
  - [Topic errors](#topic-errors)
    - [Types of errors](#types-of-errors)
  - [Topic status](#topic-status)
  - [Copying a topic](#copying-a-topic)

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/webApp)

Microsoft Copilot Studio offers many ways to manage your topics. It includes a topic checker that flags topics that contain errors. You can turn topics on or off so that they don't appear to people chatting with your bot. And you can copy topics to make it easier to create new ones.

### Topic errors

When you save a topic, Microsoft Copilot Studio notifies you if it contains an error or raises a warning. Errors will stop your bot from working. You must fix them before you can publish your bot. Warnings won't stop your bot from working, but they may cause individual topics not to work as expected. You should fix them when you see them.

:::image type="content" source="media/authoring-topic-status/topics-errors-save.png" alt-text="Screenshot of the message that indicates a topic has errors that you must fix.":::

You can see whether a topic has errors, and how many errors it has, in the Topics page. The Topics page only shows errors, not warnings, because errors will prevent your bot from working.

:::image type="content" source="media/authoring-topic-status/topics-errors.png" alt-text="Screenshot of the Topics page, with the number of errors in a topic highlighted.":::

#### View topic errors

1. In the **Topics** page, select the error count to open the authoring canvas to where the first error is.

1. Select **Topic checker** to view a list of the topic's errors and warnings.

    :::image type="content" source="media/authoring-topic-status/topic-checker.png" alt-text="Screenshot of the Topic checker and the list of errors in the topic.":::

1. Select an error to go directly to the node that contains the error.  

#### Types of errors

The topic checker flags four types of errors:

- _Node_: The entire node is incorrect. It's highlighted in red.
- _Field_: The field might be missing required data. It's highlighted in red.
- _Expression_: The expression might be invalid. It's highlighted in red.
- _Variable deletion_: A variable was deleted, causing it to become "orphaned." It must be either removed or replaced. It's highlighted in red wherever it was used.

### Topic status

Topics can have a status of **On** or **Off** to indicate whether they can be used or triggered in a bot conversation. By default, new topics are created with their status set to **On**. Change it using the toggle in the **Status** column in the Topics page.

When a topic is **On**, it will trigger as expected, either as a result of its trigger phrases or when another topic redirects to it.

When a topic is **Off**, it won't trigger at all. It won't trigger if its trigger phrases are used in a conversation or if another topic redirects to it. As far as your bot knows, the topic doesn't exist. The topic checker will identify an error if another topic redirects to an **Off** topic.

When you publish your bot, all topics are published whether they're **On** or **Off**.

> [!TIP]
> Turn a topic **Off** to work on it in a draft state. Leave its status at **Off** while publishing changes to other topics that are ready to go live.

:::image type="content" source="media/authoring-topic-status/topics-status.png" alt-text="Screenshot of the Topics page, with the Status column highlighted.":::

### Copy a topic

After you've created a few topics, you may want to use a previous topic as a baseline when creating new topics.

In the **Topics** page, select the **More actions** menu (**&vellip;**), and then select **Make a copy**.

:::image type="content" source="media/authoring-topic-status/topics-menu-icon.png" alt-text="Screenshot of a topic's More actions menu, with the Make a copy option highlighted.":::

This option duplicates the selected topic with _(Copy)_ added to the name. All the topic content, such as the description, trigger phrases, and the entire conversation, is copied over to the new topic.

A copied topic is **Off** by default to avoid confusion with the original topic, which has the same trigger phrases.

When you're done editing the new topic, turn it **On** to [test it](authoring-test-bot.md). When it's ready, publish the new topic.

There's no limit to the number of times you can copy a topic. A number will be added to the name and each topic will have its own internal ID.


To shift the conversation from the current topic to another topic without starting over, add a **Redirect** node. When the conversation reaches the end of the new topic, it resumes in the original topic by default. However, you can use two special nodes, **End current topic** and **End all topics**, to change the normal course of the conversation.

### Redirect to another topic

1. Open your topic in the authoring canvas.

1. Where you want the transition to occur, select **+** to add a node, then select **Topic management**, and then select **Go to another topic**.

    :::image type="content" source="media/authoring-topic-management/topics-redirect-add-subtopic.png" alt-text="Screenshot of the Topic management menu, with Topic management highlighted.":::

1. Select a custom or system topic from the list.

    :::image type="content" source="media/authoring-topic-management/topics-redirect-select-topic.png" alt-text="Screenshot of the list of topics to redirect to.":::

1. [Pass variables between topics](authoring-variables.md) if needed. If the topic you're redirecting to requires any input or output variables, enter or select a value for each one.

1. Save your topic, and then use the **Test bot** pane to confirm that your bot successfully calls the redirect topic.

You can insert more nodes after the **Redirect** node if you need to. When the topic that's redirected to ends, the bot returns to the original topic and continues with any nodes that follow the **Redirect** node.

:::image type="content" source="media/authoring-topic-management/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes that follow a redirected topic node.":::

### End the current topic or all topics

By default, a redirected conversation returns to the original topic at the end of the called topic. Use the **End current topic** and **End all topics** nodes to exit a topic&mdash;or the conversation&mdash;early.

- An **End current topic** node ends the current topic at that point. If the current topic was called from another topic, the conversation returns to the original topic immediately. A common use of this node is in a condition branch. One branch exits the topic early, while another branch continues the current topic.
- An **End all topics** node ends all active topics immediately. Your bot treats the next message from the user as the first message in a new conversation.

    To signal to the user's channel that the bot thinks the conversation has ended, add an **End Conversation** node before the **End all topics** node.

Many of the system topics use these nodes to control how conversations end or start over. Learn how to [use system topics in Microsoft Copilot Studio](authoring-system-topics.md).

> [!TIP]
> The **End all topics** node doesn't clear or reset any global variables. To clear global variables, use a **Clear all variables** node first. For an example, see the default [Reset Conversation system topic](authoring-system-topics.md#reset-conversation).

# [Classic](#tab/classic)

Microsoft Copilot Studio offers many ways to manage your topics. It includes a topic checker that flags topics that contain errors. You can turn topics on or off so that they don't appear to people chatting with your bot. And you can copy topics to make it easier to create new ones.

### Topic errors

When you save a topic, you'll be notified if there are errors or warnings. Warnings won't stop the bot from working, but they may cause individual topics to not work as expected, so you should fix them when you see them.

Errors will prevent the bot from working and must be fixed before you can publish your bot.

:::image type="content" source="media/authoring-topic-management/topics-errors-save.png" alt-text="The message indicates you have errors you should fix.":::

You can see the error state of a topic on the Topics page.

> [!NOTE]
> The Topics page only shows errors as they will stop your bot from working, unlike warnings.

:::image type="content" source="media/authoring-topic-management/topics-errors.png" alt-text="The topics page identifies the number of errors in your topic.":::

Select the error count to open the authoring canvas to where the first error is. Select **Topic checker** to see a list of the errors. Selecting each error goes directly to the error.  

:::image type="content" source="media/authoring-topic-management/topics-checker.png" alt-text="The topic checker is on the top bar and shows all errors and warnings.":::

> [!NOTE]
> You can save topics with errors. Topics with errors can't be published.

### Types of errors

There are four types of errors that appear in the topic checker and in the authoring canvas:

- _Node_: The entire node is incorrect and is highlighted red.
- _Field_: The field might be missing required data and is highlighted red.
- _Expression_: The expression might be invalid and is highlighted red.
- _Variable deletion_: A variable in a topic was deleted and is highlighted red wherever it was used. This causes the variable to become "orphaned", and it must be either removed or replaced.

### Topic status

Topics can have a status of **On** or **Off**. This refers to their ability to be used or triggered in a bot conversation.

When a topic is **On**, it will trigger as expected, either as a result of its trigger phrases or when it is redirected to from another topic. The majority of your topics are likely to be in the **On** state.

When a topic is **Off**, it will not trigger at all. This means that if its trigger phrases are used in a bot conversation, it will not trigger, just as if the topic doesn't exist. An **Off** topic will also not be redirected to, even if another topic has specified that it should be.

When a bot is published, all topics (**On** or **Off**) will be published, but the **Off** topics will not trigger.

> [!TIP]
> Turning a topic to **Off** allows you to work on a particular topic and leave it in a draft state while publishing changes to other topics that are ready to go live.  
>
> Leave the topic that you are still working on as **Off** before publishing the bot.

You can change this with the toggle in the **Status** column on the Topics page.

:::image type="content" source="media/authoring-topic-management/topics-status.png" alt-text="The Status column shows each topic with an On or Off toggle switch.":::

By default new topics will be created with their status set to **On**.

> [!NOTE]
> The Topic Checker will identify an error if a topic redirects to an 'off' topic.

### Copying a topic

Once you have created a few topics, you may want to use a previous topic as a baseline when creating new topics.

On the Topics page, select the menu icon on a topic's name and then **Make a copy**.

:::image type="content" source="media/authoring-topic-management/topics-menu-icon.png" alt-text="Make a copy from the menu icon." border="false":::

This option creates a duplicate of the selected topic with _(Copy)_ added to the name. All of the topic content - such as the description, trigger phrases, and the entire conversation - is copied over to the new topic.

A copied topic has a status of **Off** by default when it is copied to avoid confusion on which topic will trigger, since the trigger phrases are the same as the original topic.

Once you are done editing the new topic, you can turn it **On** to [test it in the Test bot](authoring-test-bot.md) and, when ready, publish the new topic.

There is no limit to the number of times a topic can be copied. A number will be added to the name and each topic will have its own internal ID.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
