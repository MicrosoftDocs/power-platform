---
title: "Manage topics in Microsoft Copilot Studio"
description: "Resolve errors, set the status of individual topics, and copy topics when creating new topics to save time."
keywords: "PVA"
ms.date: 1/10/2024

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "ceX"
ms.service: power-virtual-agents

---

# Manage topics in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

There are many ways you can manage your topics. Copilot Studio includes a topic checker that lets you know if there are errors in your topics. You can turn topics on or off so they don't appear to people chatting with your copilot. You can also copy or duplicate topics to make it easier to create new ones.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

# [Web app](#tab/webApp)

### Topic errors

When you save a topic, Copilot Studio tells you if it contains an error or raises a warning.

:::image type="content" source="media/authoring-topic-status/topics-errors-save.png" alt-text="Screenshot of the message that indicates a topic has errors that you must fix.":::

- **Errors** stop your copilot from working. You must fix them before you can publish your copilot.
- **Warnings** don't stop your copilot from working, but might cause individual topics not to work as expected. You should fix warnings when you see them.

You can see if a topic has errors, and the number of errors, in the **Errors** column of your topic. This page only shows errors, not warnings, because errors prevent your copilot from working.

:::image type="content" source="media/authoring-topic-management/topics-errors.png" alt-text="Screenshot of the Topics page, with the number of errors in a topic highlighted." lightbox="media/authoring-topic-management/topics-errors.png":::

#### View topic errors

1. Open your topic from the **Topics & Plugins** page.

1. Select **Topic checker**.

   :::image type="content" source="media/authoring-topic-management/open-topic-checker.png" alt-text="Screenshot of the Topic checker button location.":::

   You see the **Topic checker** pane open that reveals a list of the topic's errors and warnings.

   :::image type="content" source="media/authoring-topic-management/topic-checker-pane.png" alt-text="Screenshot of the Topic checker list of errors in the topic.":::

1. Select an error to go directly to the node that contains the error.  

#### Types of errors

The topic checker flags four types of errors:

- _Node_: The entire node is incorrect. The node is highlighted in red.
- _Field_: The field might be missing required data. The data is highlighted in red.
- _Expression_: The expression might be invalid. The error is highlighted in red.
- _Variable deletion_: A variable was deleted, causing it to become "orphaned." The variable must be removed or replaced. The error gets highlighted in red wherever the variable is used.

### Topic status

Topics can have a status of **On** or **Off** to indicate whether they can be used or triggered in a copilot conversation. By default, new topics are created with their status set to **On**. Change the status using the toggle in the **Status** column of the **Topics & Plugins** page.

When a topic is **On**, it triggers as expected. Topics get triggered as a result of its trigger phrases or when another topic redirects to it.

When a topic is set to **Off**:

- The topic doesn't trigger at all.
- The topic doesn't trigger when trigger phrases are used in a conversation or if another topic redirects to it.
- The topic checker identifies an error if another topic redirects to the **Off** topic.
- All topics are published, when you're ready to publish your copilot, whether they're **On** or **Off**.

> [!TIP]
> Turn a topic **Off** to work on it in a draft state. Leave its status at **Off** while publishing changes to other topics that are ready to go live.

To check or change your topic status, select the `...` **More options** next to your topic name and toggle the **Status** option.

:::image type="content" source="media/authoring-topic-management/topics-status.png" alt-text="Screenshot of the Topics page, with the Status column highlighted.":::

### Copy a topic

After you create a few topics, you can use a previous topic as a baseline when creating new topics.

In the **Topics & Plugins** page, select the `...` **More actions** menu, then select **Make a Copy**.

:::image type="content" source="media/authoring-topic-management/topics-copy.png" alt-text="Screenshot of a topic's More options menu, with the Make a Copy option highlighted.":::

This option duplicates the selected topic with _(Copy)_ added to the name. All the topic content, such as the description, trigger phrases, and the entire conversation, is copied over to the new topic.

A copied topic is **Off** by default to avoid confusion with the original topic, which has the same trigger phrases.

When you're done editing the new topic, turn it **On** to [test it](authoring-test-bot.md). When it's ready, publish the new topic.

There's no limit to the number of times you can copy a topic. A number is added to the name and each topic has its own internal ID.

To shift the conversation from the current topic to another topic without starting over, add a **Redirect** node. When the conversation reaches the end of the new topic, it resumes in the original topic by default.

### Redirect to another topic

1. Open your topic in the authoring canvas.

1. Where you want the transition to occur, select **+** to add a node, then select **Topic management** and choose **Go to another topic**.

    :::image type="content" source="media/authoring-topic-management/topics-redirect-add-subtopic.png" alt-text="Screenshot of the Topic management menu, with Topic management highlighted.":::

1. Select a custom or system topic from the list.

    :::image type="content" source="media/authoring-topic-management/topics-redirect-select-topic.png" alt-text="Screenshot of the list of topics to redirect to.":::

1. [Pass variables between topics](authoring-variables.md) if needed. If the topic you're redirecting to requires any input or output variables, enter or select a value for each one.

1. Save your topic, and then use the **Test your copilot** pane to confirm that your copilot successfully calls the redirect topic.

You can insert more nodes after the **Redirect** node if needed. When the topic from the redirection ends, the copilot returns to the original topic and continues with any nodes that continue after the **Redirect** node.

:::image type="content" source="media/authoring-topic-management/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing the flow of nodes from a question that follow a redirected topic node." lightbox="media/authoring-topic-management/authoring-subtopic-redirect.png":::

### End the current topic or all topics

By default, a redirected conversation returns to the original topic at the end of the called topic. Use the **End current topic** or **End all topics** nodes to exit a topic—or the conversation—at any time.

:::image type="content" source="media/authoring-topic-management/end-topic.png" alt-text="Screenshot that shows where the End current topic and End all topics selections are located.":::

- An **End current topic** node ends the current topic. If the current topic is called from another topic, the conversation returns to the original topic immediately. A common use of this node is in a condition branch. One branch exits the topic early, while another branch continues the current topic.
- An **End all topics** node ends all active topics immediately. Your copilot considers the next message from the user as the first message in a new conversation.

  To let the user know that the copilot thinks the conversation ended, add an **End Conversation** node _before_ the **End all topics** node.

Many of the system topics use these nodes to control how conversations end or start over. Learn how to [use system topics in Microsoft Copilot Studio](authoring-system-topics.md).

> [!TIP]
> The **End all topics** node doesn't clear or reset any global variables. To clear global variables, use a **Clear all variables** node first. For an example, see the default [Reset Conversation system topic](authoring-system-topics.md#reset-conversation).

# [Classic](#tab/classic)

### Topic errors

When you save a topic, you're notified if there are errors or warnings. Warnings don't stop the copilot from working, but can cause individual topics to not work as expected, so you should fix them when you see them.

Errors prevent the copilot from working and must be fixed before you can publish your bot.

:::image type="content" source="media/authoring-topic-management/topics-errors-save.png" alt-text="The message indicates you have errors you should fix.":::

You can see the error state of a topic on the Topics page.

> [!NOTE]
> The **Topics & Plugins** page only shows errors, since they stop your copilot from working, unlike warnings.

You can find errors in the **Errors** column of the **Topics & Plugins** page.

:::image type="content" source="media/authoring-topic-management/topics-errors.png" alt-text="The topics page identifies the number of errors in your topic.":::

Select the error count to open the authoring canvas to go to the error location. Select **Topic checker** to see a list of the errors. Selecting each error goes directly to the error.  

:::image type="content" source="media/authoring-topic-management/topics-checker.png" alt-text="The topic checker is on the top bar and shows all errors and warnings.":::

> [!NOTE]
> You can save topics with errors, but topics with errors can't be published.

### Types of errors

There are four types of errors that appear in the topic checker and in the authoring canvas:

- _Node_: The entire node is incorrect and highlighted red.
- _Field_: The field is likely missing required data and highlighted red.
- _Expression_: The expression might be invalid and is highlighted red.
- _Variable deletion_: A variable in a topic was deleted and the error is highlighted red wherever the variable is used. A deleted variable causes the variable to become "orphaned" and must be removed or replaced.

### Topic status

Topics can have a status of **On** or **Off** to indicate whether they can be used or triggered in a copilot conversation. By default, new topics are created with their status set to **On**. Change the status using the toggle in the **Status** column of the **Topics & Plugins** page.

When a topic is **On**, it triggers as expected. Topics get triggered as a result of its trigger phrases or when another topic redirects to it.

When a topic is set to **Off**:

- The topic doesn't trigger at all.
- The topic doesn't trigger when trigger phrases are used in a conversation or if another topic redirects to it.
- The topic checker identifies an error if another topic redirects to the **Off** topic.
- All topics are published, when you're ready to publish your copilot, whether they're **On** or **Off**.

> [!TIP]
> Turn a topic **Off** to work on it in a draft state. Leave its status at **Off** while publishing changes to other topics that are ready to go live.
>
> When ready, you can turn the status **On** before publishing the copilot.

Control the status from the **Status** column, toggling it **On** or **Off**.

:::image type="content" source="media/authoring-topic-management/topics-status-teams.png" alt-text="Screenshot that shows the Status column of each topic with an On or Off toggle switch." lightbox="media/authoring-topic-management/topics-status-teams.png":::

By default, new topics are created with their status **On**.

> [!NOTE]
> The Topic Checker identifies an error if a topic redirects to an **Off** topic.

### Copying a topic

After you create a few topics, you can use a previous topic as a baseline when creating new topics.

On the **Topics** page, select the `...` menu icon near a topic's name and choose **Make a copy**.

:::image type="content" source="media/authoring-topic-management/copy-topic-teams.png" alt-text="Screenshot that shows where the Make a copy button is located.":::

This option creates a duplicate of the selected topic with _(Copy)_ added to the name. All the topic content—the description, trigger phrases, and entire conversation—is copied over to the new topic.

A copied topic has its status **Off** by default when copied to avoid confusion on which topic triggers, since the trigger phrases are the same as the original topic.

Once you're done editing the new topic, you can turn it **On** to [test it in the Test your copilot](authoring-test-bot.md) pane. When you're ready, publish the new topic.

> [!TIP]
> There's no limit to topic copies. A number gets added to the name of the copy and each topic has its own internal ID.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
