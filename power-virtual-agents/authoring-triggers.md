---
title: "Using Topic Triggers"
description: "Use topic triggers to control when a topic should be executed, such as when a message or event is received by the bot."
keywords: "PVA"
ms.date: 04/28/2023
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

By default, topics use the **Phrases** trigger, meaning they are triggered when one or more of their trigger phrases match closely with an incoming message from a user. However, a number of additional triggers types are available, to determine when a topic should be executed.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Create and edit topics in your Microsoft Copilot Studio bot](authoring-create-edit-topics.md).

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

## Trigger types

The following trigger types exist for determining when a topic should be fired.

> [!TIP]
> When a message is received from a user to a bot, the payload on which it arrives is called an [Activity](/javascript/api/botframework-schema/activity?view=botbuilder-ts-latest&preserve-view=true), where the type of Activity is a ***message***. Bots can also receive activities of other types, usually sent by the channel being used to let the bot know that something has happened or changed. For example, Microsoft Teams sends hidden activities of type ***invoke***, which let the bot know that the Teams user did something, such as interacting with a Message Extension. Many of the available triggers discussed in this allow you to intercept and handle activities of different types.

| Type     | Description                                                                                                                                |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Phrases   | Topic is triggered when one or more of the trigger phrases match with the incoming message from a user |
| Activity Received  | Topic is triggered when an Activity of any type is received |
| Message Received   | Topic is triggered when an Activity of type ***message*** is received. This is the most common type of Activity and they are received when a user types or says something to a bot |
| Event Received    | Topic is triggered when an Activity of type ***event*** is received |
| Conversation update received   | Topic is triggered when an Activity of type ***conversationupdate*** is received. e.g. Microsoft Teams sends an activity of this type when a user joins a conversation |
| Invoke received | Topic is triggered when an Activity of type ***invoke*** is received. Most commonly received from the Microsoft Teams channel, when the user interacts with a Teams app, such as a Message or Search extension |
| Inactivity   | Topic is triggered when a user has not interacted with the bot for a period of time. The time period can be configured. |

## Changing the trigger for a topic

1. Hover over the **Trigger** node and click the change trigger button. This reveals the list of triggers that you can choose from.

    :::image type="content" source="media/authoring-triggers/change-trigger.png" alt-text="Screenshot of the trigger selection.":::

1. Select the type of trigger that you would like to associate with your topic. If you have configuration associated with your current trigger, such as a list of trigger phrases, you will be asked to confirm before continuing, as you will lose this content when the trigger type is changed.

1. Click the **Edit** button on the trigger to open the properties for the trigger.

## Trigger condition

The **Condition** property allows you to specify a condition, or conditions, which must be met in order for the trigger to fire. In the example below, the trigger, and its associated topic, would only be fired if the channel being used by the end user is Microsoft Teams.

:::image type="content" source="media/authoring-triggers/trigger-condition.png" alt-text="Screenshot of the trigger condition property.":::

You can also optionally switch to the full Power Fx editor, to author more complex conditions, by switching the **Builder** dropdown to **Formula**.

## Trigger priority

More than one trigger can fire for a single incoming Activity (such as a message). The order in which triggers, that respond to an incoming Activity, fire is initially determined by the trigger type. Below is the order in which trigger types are executed.

1. Activity Received
2. Message / Event / Conversation Update / Invoke Received
3. Phrases

If there is more than one qualifying trigger of the same type then, by default, the triggers will be executed in the order of creation of the associated topic (oldest first). You can use the **Priority** property to explicitly determine the order in which they will execute.

## Additional trigger properties

Some of the individual trigger types have additional properties, beyond **Condition** and **Priority**.

### Activity Received

**Activity Type** - By default this property is empty. If it is populated, the trigger will only fire if the incoming activity's type property matches the value selected here.

### Event Received

**Event Name** - By default this property is empty. If it is populated, the trigger will only fire if the incoming event activity's name property matches the value entered here.

### Inactivity

**Duration** - This determines the duration that the user should be inactive before this trigger, and its associated topic, is fired. The default is 30 minutes. You can choose from the available options within the dropdown or, alternatively, switch to the formula editor to provide a Power Fx formula to determine the value.

:::image type="content" source="media/authoring-triggers/inactivity-duration.png" alt-text="Screenshot of the duration property for the inactivity trigger.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
