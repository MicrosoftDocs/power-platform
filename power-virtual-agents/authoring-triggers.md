---
title: "Using Topic Triggers"
description: "Use topic triggers to control when a topic is executed, like when the copilot receives a message or event."
keywords: "PVA"
ms.date: 1/4/2024
ms.service: power-virtual-agents
ms.topic: article
author: KendalBond007
ms.author: iawilt
ms.reviewer: iawilt
manager: 
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Using topic triggers

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

By default, topics use the **Phrases** trigger, which activates when one or more of their trigger phrases match closely with an incoming message from a user. There are other trigger types available that determine when a topic should be executed.

## Prerequisites

- You might want to be familiar with creating and editing topics before understanding topic triggers. [Create and edit topics in your Microsoft Copilot Studio copilot](authoring-create-edit-topics.md).

- General Copilot Studio understanding might help contextualize topics and their triggers. [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

## Trigger types

Triggers allow you to intercept and handle activities of different types. The following trigger types determine when a topic should trigger.

> [!TIP]
> When a user sends a message to a copliot, the payload is a **_message_** type of [Activity](/javascript/api/botframework-schema/activity). Copilots can receive activities of other types with new changes in the chat.
>
> For example, Microsoft Teams sends hidden activities of type **_invoke_**, which signifies a user action, such as interacting with a Message Extension.

| Type     | Description |
| -------- | ----------- |
| Phrases  | When one or more of the trigger phrases match with the incoming message from a user |
| Activity received | When an Activity of any type is received |
| Message received  | When an Activity of type _**message**_ is received<br>The most common type of Activity.<br>Received when a user types or says something to the copilot. |
| Event received | When an Activity of type _**event**_ is received |
| Conversation update received | When an Activity of type _**conversationUpdate**_ is received<br>For example, Teams sends an activity of this type when a user joins a conversation. |
| Invoke received | When an Activity of type _**invoke**_ is received<br>Most commonly received from the Teams channel. For example, when the user interacts with a Message or Search extension in the Teams app. |
| Inactivity | When a user hasn't interacted with the copilot over time. The time period can be configured. |

## Changing the trigger for a topic

1. Open your copilot in Copilot Studio and go to the **Topics & Plugins** page.

1. Open any topic.

1. Hover over **Phrases** of the **Trigger** node and select the **Change trigger** icon. You see a list of triggers to choose from.

   :::image type="content" source="media/authoring-triggers/change-trigger.png" alt-text="Screenshot of the Change trigger selections.":::

1. Select the type of trigger for your topic.

   > [!IMPORTANT]
   > Your current trigger type content, if any, gets deleted when the trigger type is changed. You're asked to confirm before changing the type.
   > :::image type="content" source="media/authoring-triggers/lose-trigger-phrases-warning.png" alt-text="Screenshot of a warning that you'll lose trigger phrases by changing the trigger type.":::

1. Select **Edit** on the trigger to open the properties for that trigger type.

## Trigger condition

The **Condition** node allows you to specify condition(s) that must be met in order for the trigger to fire. For example, a condition fires only if the channel used by an employee is Microsoft Teams.

:::image type="content" source="media/authoring-triggers/trigger-condition.png" alt-text="Screenshot of the trigger condition property.":::

Optionally, you can switch to the full **Power Fx** editor, to author more complex conditions, by selecting the `...` **Node Menu** and choosing **Change to formula**.

For more information, see [Author using conditions (preview)](authoring-using-conditions.md).

## Trigger priority

More than one trigger can fire for a single incoming Activity, such as a message. The trigger type determines the order the triggers fire.

Order of execution:

1. Activity Received
1. Message / Event / Conversation Update / Invoke Received
1. Phrases

If there's more than one qualifying trigger of the same type, the triggers get executed in the order of creation (oldest first).

You can use the **Priority** property on a node's **Properties** pane to explicitly determine the order of execution.

:::image type="content" source="media/authoring-triggers/priority-property.png" alt-text="Screenshot of the priority property from a node's properties pane.":::

## Other trigger properties

Some trigger types have more properties, beyond **Condition** and **Priority**. For example, the **Inactivity** trigger type lets you set the inactivity duration.

:::image type="content" source="media/authoring-triggers/set-inactivity-duration.png" alt-text="Screenshot of the duration property for the inactivity trigger.":::

### Default trigger types

These properties are empty by default.

However, if you choose an activity or event type, only matching incoming types are fired. For example, if you select the **Hand off** activity type when a conversation needs to escalate to an agent, only incoming messages that trigger **Hand off** fire.

| Activity Received | Event Received |
| ----------------- | -------------- |
| [Activity types](/javascript/api/botframework-schema/activity#botframework-schema-activity-type) | Event types |

For more information, see [Sending event activities](authoring-send-event-activities.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
