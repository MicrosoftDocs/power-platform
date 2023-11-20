---
title: "Hand off to a live agent (contains video)"
description: "Learn how to hand off a bot conversation to a human agent, complete with context and conversation history."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: how-to
author: iaanw 
ms.author: iawilt
ms.reviewer: pawant
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: handoff, ceX, advanced-authoring
---

# Hand off to a live agent

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

With Microsoft Copilot Studio, you can hand off conversations to live agents seamlessly and contextually.

When you hand off a conversation, you share the full history of the conversation (the context) and all user-defined variables. With this context, a live agent that uses a connected engagement hub can be: notified that a conversation requires a live agent, see the context of the prior conversation, and resume the conversation.

For more information about how to configure hand-off with [Omnichannel for Customer Service](/dynamics365/customer-service/configure-bot-virtual-agent), see the [Configure hand-off to Omnichannel for Customer Service](configuration-hand-off-omnichannel.md) topic.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4n4G1]
>

> [!NOTE]
> You can choose to escalate a bot conversation without linking to an engagement hub:
>
> 1. In the **Authoring canvas** for the topic you want to add an escalation option to, at the end of the topic, select **Add node** (**+**) to add a new node.
> 1. Select **Go to another topic** and then **Escalate**.
>
> **Escalate** is a [system topic](authoring-create-edit-topics.md#use-system-and-sample-topics) that, by default, provides a simple message to a user if they ask for a human agent.
>
> You can edit the topic to include a simple URL to a support website or ticketing system, or to include instructions for emailing or contacting support.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- A bot built with [Microsoft Copilot Studio](https://aka.ms/TryPVA).
- An engagement hub that is being used by live agents, such as [Omnichannel for Customer Service](/dynamics365/omnichannel/try-channels), and you need to configure the connection, as described in [Configure hand-off to Omnichannel for Customer Service](configuration-hand-off-omnichannel.md).
- If your bot does not have escalation to agent configured in the "Escalate" System topic, follow the instructions below to configure it 

## Configuring the Escalate system topic 

When you create a bot from Dynamics 365 Customer Service, the default bot content includes the "Transfer conversation" node at the end of the **Escalate** system topic. But if you create if from the Microsoft Copilot Studio portal, that configuration will not be done ahead of time. To configure, follow the steps below:

1. Go to Topics, then select the System tab and click on **Escalate** topic

    :::image type="content" source="media/advanced-hand-off/PVA2-escalate-topic-list.png" alt-text="Screenshot of escalate topic in the topic list page." border="false":::

1. At the bottom of the topic, select **Add node** (**+**), go to **Topic Management** and then select **Transfer conversation**

    :::image type="content" source="media/advanced-hand-off/PVA2-escalate-topic-with-tranfer.png" alt-text="Screenshot of escalate topic with tranfer conversation node." border="false":::


## Triggering hand-off to a live agent

Customers engaging with the bot can ask for a live agent at any point in the conversation. This escalation can happen in two ways, with an implicit trigger or an explicit trigger.

Upon triggering the hand-off topic, Microsoft Copilot Studio starts the hand-off to the configured engagement hub and sends over all conversation context to find the next best live agent to ramp them up so they can resume the conversation.

### Implicit triggers

In some instances, the bot may be unable to determine the intent of a customer's conversation. For example, the customer may be asking a specific question for which there's no [topic](./authoring-create-edit-topics.md), or no matching option within a topic.

In other instances, your customers may ask to be handed off to a live agent immediately. For example, customers may type "talk to agent" mid-way into a conversation.

When the bot detects an escalation in this manner, it will automatically redirect the user to the [**Escalate** system topic](authoring-system-topics.md?tabs=preview#escalate). This type of trigger is known as _implicit triggering_.

### Explicit triggers

When creating topics for your bot, you may determine that some topics require interaction with a human. This type of trigger is known as _explicit triggering_.

In these instances, you must add a **Transfer conversation** node into the topic.

This node lets you add a **Private message to agent**, which is sent to the connected engagement hub to help the live agent understand the history and context of the conversation.

> [!NOTE]
> Conversations that reach this node will be marked as **Escalated** sessions in [reporting analytics](./analytics-overview.md).

**Add a "Transfer to agent" node into a topic:**

1. Go to the [**Topics page**](./authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to add the **Transfer conversation** node to.

1. Select **Add node** (**+**) to add a message node. Enter what the bot should say to indicate that transferal to a live agent is about to occur.

    :::image type="content" source="media/advanced-hand-off/handoff-add-node.png" alt-text="Screenshot of adding a node." border="false":::

1. Underneath the message node, select **Add node** (**+**), go to **Topic Management** and then select **Transfer conversation**

    :::image type="content" source="media/advanced-hand-off/PVA2-transfer-conversation.png" alt-text="Screenshot of adding the transfer conversation node." border="false":::

1. Enter an optional private message to the live agent in the **Transfer conversation** node. This optional message can be useful if you have multiple topics with **Transfer conversation** nodes as the information is stored in the `va_AgentMessage` [context variable](#contextual-variables-available-upon-hand-off).

The topic will start the transfer to a live agent when this node is reached. You can test the hand-off by triggering the topic in the test canvas.

> [!NOTE]
> Once you add a **Transfer conversation** node into a conversation, each time you trigger hand-off your users will see a "No renderer for this activity" message on the demo website. This message suggests the need to [customize your chat canvas](./customize-default-canvas.md) to implement custom client-side code that brings in a human agent from your engagement hub into the conversation.

## Contextual variables available upon hand-off

Beyond providing an automated way for a conversation to be ported into an engagement hub, it's important to ensure that the best agent for a specific problem is engaged. To help route conversations to the most appropriate live agent there are context variables that are also passed to the engagement hub.

You can use these variables to automatically determine where the conversation should be routed. For example, you may have added **Transfer conversation** nodes to several different topics, and you want to route conversations related to certain topics to specific agents.

The following table lists the context variables available by default.

| Context                               | Purpose                                                                                                                                  | Example                                                   |
| ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| `va_Scope`                            | Route escalations to a live agent.                                                                                                       | `"bot"`                                                   |
| `va_LastTopic`                        | Route escalations to a live agent and help them ramp-up. Includes the last topic that was triggered by an utterance from the user.       | `"Return items"`                                          |
| `va_Topics`                           | Ramp-up a live agent. Only includes topics triggered by end user using a trigger phrase. Doesn't include topics that were redirected to. | `[ "Greetings", "Store Hours", "Return Item" ]`           |
| `va_LastPhrases`                      | Route escalation to a live agent and help them ramp-up.                                                                                  | `"Can I return my item"`                                  |
| `va_Phrases`                          | Ramp-up a live agent.                                                                                                                    | `["Hi", "When does store open", "Can I return my item" ]` |
| `va_ConversationId`                   | Uniquely identify a bot conversation.                                                                                                    | `6dba796e-2233-4ea8-881b-4b3ac2b8bbe9`                    |
| `va_AgentMessage`                     | Ramp-up a live agent.                                                                                                                    | `"Got a gift from: HandoffTest"`                          |
| `va_BotId`                            | Identify the bot that is handing off a conversation.                                                                                     | `6dba796e-2233-4ea8-881b-4b3ac2b8bbe9`                    |
| `va_Language`                         | Route escalation to a live agent.                                                                                                        | `"en-us"`                                                 |
| All [user-defined topic variables][1] | Ramp-up a live agent.                                                                                                                    | `@StoreLocation = "Bellevue"`                             |

[1]: authoring-variables.md

A customer may go through several topics prior to escalating. Microsoft Copilot Studio gathers all contextual variables across topics and merges them before sending to the engagement hub.

If there are topics with similarly named context variables, Microsoft Copilot Studio promotes the most recently defined topic variable.

[!INCLUDE[footer-include](includes/footer-banner.md)]
