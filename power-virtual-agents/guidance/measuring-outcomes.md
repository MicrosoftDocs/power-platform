---
title: "Measuring chatbot outcomes"
description: "Guidance for measuring chatbot outcomes in Power Virtual Agents"
author: HenryJammes
ms.date: 05/23/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.reviewer: iawilt
---

# Measuring chatbot outcomes

Tracking conversation engagement and outcomes is crucial to measure the chatbot performance metrics and spot areas for improvements in the analytics dashboard.

> [!IMPORTANT]
> A Power Virtual Agents conversation between an end-user and a chatbot generates one or multiple analytics sessions. [All analytics sessions are either **Engaged** or **Unengaged**](./measuring-engagement.md).

## Understanding analytics sessions outcomes

Analytics sessions each have an outcome:
> [!div class="checklist"]
>
> * **Unengaged** sessions always have an outcome of **None**.
> * **Engaged** sessions have one of the following outcomes:
>>
>> * **Resolved**,
>> * **Escalated**,
>> * **Abandoned**.

## Engagement and outcomes

Conversation analytics sessions, their engagement status, and their outcomes are available as part of the [analytics dashboard](/power-virtual-agents/preview/analytics-summary) or in the [`ConversationTranscript` table](/power-virtual-agents/analytics-sessions-transcripts) in Dataverse.

|Engagement | Outcome | Definition |
|----------|-----------|------------|
| **Unengaged** | **None** (`None`) | All unengaged sessions have an outcome of *None*. |
| **Engaged** | **Escalated** (`HandOff`) | A session is considered *escalated* when the **[Escalate](/power-virtual-agents/preview/authoring-system-topics#escalate)** topic is triggered, or the **Transfer Conversation** node is reached. |
| **Engaged** | **Resolved** (`Resolved`) | A session is considered *resolved* when the **[End of Conversation](/power-virtual-agents/preview/authoring-system-topics#end-of-conversation)** topic is triggered and the user confirms that the interaction was a success (`impliedSuccess` = `FALSE`) or doesn't answer and lets the session time out (`impliedSuccess` = `TRUE`). |
| **Engaged** | **Abandoned** (`Abandoned`) | A session is considered *abandoned* when an engaged session ends and didn't reach a *resolved* or *escalated* state. |

## Properly ending conversations to measure outcomes

It’s important to end conversation with the **End of Conversation** topic, so that the end-user can confirm their issue was resolved or not (and potentially escalate).

When the bot confirms success, a CSAT survey is displayed to the end-user [to capture a 0-5 score](/power-virtual-agents/preview/analytics-csat).

If you’re certain of the outcome of a conversation based on the topic logic, you can directly flag it as a confirmed success or redirect to the Escalate topic.

> [!TIP]
> In the unified authoring canvas, in the code editor, you can set the `conversationOutcome` within an action. For example `conversationOutcome: ResolvedConfirmed` for confirmed success or `conversationOutcome: ResolvedImplied` for implied success.
