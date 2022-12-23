---
title: "Topics best practices"
description: "Best practices for efficient topic management in Power Virtual Agents"
author: hejammes

ms.date: 11/29/2022
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Best practices to manage topics in Power Virtual Agents

## Topics in Power Virtual Agents

### Topic definition

[Topics](/power-virtual-agents/authoring-fundamentals) are the core building blocks of your bot. They can be seen as the bot competencies, and they define how a conversation dialog plays out, by being discrete conversation paths that, when used together within a single bot, allow for users to have a conversation with a bot that feels natural and flows appropriately. 

To author topics, you can:
- Customize provided [templates](/power-virtual-agents/authoring-template-topics), 
- Create [new topics](/power-virtual-agents/authoring-create-edit-topics) from scratch, 
- Or [use content from existing webpages](/power-virtual-agents/advanced-create-topics-from-web). This is useful if you already have help or support content, such as FAQ pages or support sites.

A topic can have trigger phrases and typically contains conversation nodes:
- **Trigger phrases** are phrases, keywords, and questions that a user is likely to use that are related to a specific topic. 
- **Conversation nodes** define how a bot should respond to a trigger phrase and what it should do.

### System topics

When setting up a new bot, several [system topics](/power-virtual-agents/preview/authoring-system-topics) are automatically created to  make the bot readily operational with some basic and core capabilities (e.g. Greetings, Goodbye, Thank you, etc.).
There are also a few system topics that are used to manage specific events:
- **[Conversation Start](/power-virtual-agents/preview/authoring-system-topics#conversation-start)**: this is the a that proactlvely starts the conversation in the unified authoring experience. Users can be greeted with messages by the bot, even before they’ve started entering any input.
- **[Multiple Topics Matched](/power-virtual-agents/preview/authoring-system-topics#multiple-topics-matched)** (also known as 'Did You Mean' or DYM): this topic is triggered when multiple topics can potentially address the user input and the bot doesn't have sufficient confidence to trigger one over the others. When a 'Multiple Topics Matched' topic is triggered, the user is presented with a list of topics and can choose the most appropriate one.
- **[End of conversation](/power-virtual-agents/preview/authoring-system-topics#end-of-conversation)**: at the end of each conversation with a bot, you should redirect the user to the ‘end of conversation’ topic, so that the user can either confirm success or failure, and fill out a statisfaction survey.
- **[Escalate](/power-virtual-agents/preview/authoring-system-topics#escalate)**: this topic is used to hand off the conversation to a live agent (when configured – for example to [Dynamics 365 Omnichannel for Customer Service](/power-virtual-agents/configuration-hand-off-omnichannel)).
- **[Fallback](/power-virtual-agents/preview/authoring-system-topics#fallback)**: this is a specific topic that gets triggered when the user intent isn’t understood and can’t be associated with confidence with any existing topic.

### Triggering topics

There are two main ways to trigger a topic: 
- **Based on the user inputs** (also known as utterances). Topic triggering based on what an end-user writes or says is also referred to as intent recognition. The AI uses natural language understanding (NLU) to parse what a user says and find the most appropriate trigger phrase or node. 
- **By redirecting** to it from another topic, with a redirect node.

**Example 1: The "Store Locations" topic gets triggered based on the user utterance and the matching trigger phrases.**

:::image type="content" source="media/topics/topic-triggering-with-trigger-phrases.png" alt-text="Diagram showing a Power Virtual Agents being triggered with a matching trigger phrase":::

**Example 2: The "Request New Location" topic gets triggered when it is called from another topic with a redirect.**

:::image type="content" source="media/topics/topic-triggering-with-redirect.png" alt-text="Diagram showing a Power Virtual Agents being triggered by a redirect from another topic":::

## Defining your bot topics

Defining the best topics for your bot requires understanding the questions users will ask or tasks they will try accomplish, and the kind of information and automation you’ll need to provide. For example, a retail chatbot might start by asking the user which of four things they want to do: find a store, place an order, check the status of an order, or return a purchased product. Their answer could lead them into one of four topics, each with its own topic dialog. 

Obvious places to start are:
- Any existing **Frequently Asked Questions** (FAQ) or **Knowledge Base** (KB).
- **Common subjects raised by your employees or customers** in internal or customer service scenarios. If you’re building a customer service bot, talk with existing service representatives to learn what the most common questions are and the order in which they’re typically asked.

> [!TIP] 
> **Start quickly with the Suggest Topics feature**
> 
> For existing FAQs, Power Virtual Agents includes a [suggest topics](/power-virtual-agents/advanced-create-topics-from-web) feature. You supply URLs, then let Power Virtual Agents crawl these webpages for FAQ information. The feature will automatically import suggestions that you can promote to preformatted topics, including trigger phrases. You’re also free to edit or delete these suggestions before they’re promoted to topics. 

### Different types of topics

People will use your bot with a specific topic to address or resolve. You can loosely categorize topics into 3 types:  
1. **Informational**: E.g. "*What is…?*", "*When will…?*", "*Why…?*"
2. **Task completion**: "*I want to…*", "*How do I…?*"
3. **Troubleshooting**: *"Something isn’t working…*", "*I got an error message…*"

You may also need some topics that are just there to take ambiguous user questions ("I need help" or "shopping") and ask for clarification, so you can then route the user to the correct topic.

### Topic design process

| Identify the topic | List all scenarios | Design a high-level conversation tree | Validate and iterate on the design |
|---------------|---------------|---------------|---------------|
| <ul><li>Choose topics end-users will ask about.</li><li>Start with high-impact topics.</li><li>Think about topics from an end-user's point of view. Never forget that they might know much less about an area then you do.</li></ul>  | <ul><li>List all possible scenarios.</li><li>Categorize scenarios: informational needs, task completion, and troubleshooting.</li><li>Hierarchize topics: what are the initial questions a user asks?</li></ul>  | <ul><li>Draw the conversation tree.</li><li>Define the hierarchy of questions asked inside each topic.</li><li>Define the fewest number of questions to understand the situation and provide the right  solution.</li></ul> | <ul><li>Read the dialog out loud before publishing.</li><li>Get analytics and read session transcripts for further optimization.</li><li>Bot topic authoring is an iterative process, and it involves authors observe bot/end-user interactions with each authoring iteration.</li></ul> |

> [!NOTE]
> - Don’t just replicate what your website or application can already do – most customers are familiar with websites apps and will accomplish these tasks themselves without needing to interact with a bot. 
> - Look to create topics for things which generate a high volume of chats or calls. 
> - Build automations for those to start with, and then work on the longer tail of other topics over a period of time. 
> - When designing a topic, you should try to be as thorough as possible in your design and all the potential scenarios that your users might ask or fall into.

### Expect to create both single-turn and multi-turn interactions

For simple interactions, you’ll create single-turn conversations with just one question and one answer. But more substantive topics require a multi-turn conversation with multiple back-and-forth interactions between the user and your bot. For instance, if a user asks a retail bot whether there are any stores nearby, the chatbot might respond with a question such as *"What city do you live in*" or "*What is your postal code?*" to narrow down its possible responses. The user’s response to this will determine the bot’s next response in the conversation.

## Topic authoring best practices

### Create bite-size topics

> [!TIP]
> It’s often more manageable to create many bite-size topics rather than a few large topics. Taking this approach also helps making triggering more effective, by clearly mapping trigger phrases to the specific topics that address those areas.

Bite-size topics doesn’t mean that all topics should have trigger phrases, as topics triggered with trigger phrases can in turn redirect to other topics based on additional user inputs and answers.

The number of topics is a Conversational Design preference and decision, as it either results in having a few bigger topic (in case of joining) or having more smaller topics (in case of splitting). 

<!-- ADD EXAMPLE + VISUAL. Check Order Status > Update Order -->

### When multiple topics are too close, create a disambiguation topic

> [!TIP]
> On joining vs splitting topics, E.g. “unblock credit card” and “unblock debit card”. Users might just say “unblock card” and the model doesn’t know what specific topic and process to trigger. You can start an “unblock card” topic, use a question and an entity for the type of card (debit or credit) and launch the appropriate child topic accordingly.

<!-- ADD EXAMPLE + VISUAL. E.g. Credit Card / Debit Card  -->

### Balance the number of trigger phrases per topic

> [!TIP]
> Try to balance the number of trigger phrases between topic (starting with at least 5 to 10 per topic). That way, the Power Virtual Agents Natural Language Understanding capabilities don’t overweight a topic versus another based on the configured trigger phrases. 

<!-- ADD EXAMPLE + VISUAL. E.g. same amout of trigger phrases in different topics -->

### Leverage entities to reduce the number of topics

> [!TIP]
> For intents that are more complex to recognize (for example when they could be about a large number of options in a customer’s existing implementation, e.g. “request” for a banking customer, as one could request many different things), then splitting the topics might be a better option, with adequate trigger phrases.

Instead of creating similar topics:
- Order Pizzas
- Order Burgers
- Order Drinks
Create:
- 1 topic for Order
- 1 entity for Pizzas/Burgers/Drinks

<!-- ADD EXAMPLE + VISUAL -->

### Avoid topic overlap

> [!TIP]
> 
For topics triggered with trigger phrases, you should:
- Compare the trigger phrases across your topics and remove ambiguous pairs.
- Try to not use the same words in different topics. 
There are multiple ways to monitor topic overlap:
- Analyze the user utterances that trigger a “Did You Mean” topic, as it’s a key indicator that you have overlap
- Power Virtual Agents offers a Topic Overlap detection feature that enables authors to discover overlapping topics to resolve accordingly (deleting/moving trigger phrases between topics).

<!-- ADD EXAMPLE + VISUAL -->

### Leverage the Fallback topic

> [!TIP]
> The Fallback topic gets triggered when Power Virtual Agents doesn’t understand a user utterance and doesn’t have sufficient confidence to trigger any of the existing topics.
There are multiple ways to leverage the Fallback topic and offer a great user experience.

#### Offloading single question/answer pairs.

If you have a large number question/answer pairs for single-turn conversations you can also consider offloading them to the Fallback topic and integrate with external services such as custom question answering in Azure Language Studio (part of Azure Cognitive Services). It will also help Power Virtual Agents Natural Language Understanding focus on the trigger phrases you have configured for your topics.

<!-- ADD EXAMPLE + VISUAL -->

#### Providing your chatbot with a personality 

When user inputs are not understood, you can also leverage Custom Question Answering in the Azure Cognitive Services Language Studio. “Chitchat” skills of various tone (professional, familiar, etc.) are available. This allows your chatbot to be able to answer trivial questions, such as “how are you feeling today, bot?”.

<!-- ADD EXAMPLE + VISUAL -->

#### Learning from the Fallback topic

You should track what your customers are saying that doesn’t trigger a standard Power Virtual Agents topic. These could be used to enrich an existing topic’s trigger phrases (typically when the user utterance should have triggered a topic) or lead to the creation of new topics to better serve your users as you understand better what they’re trying to accomplish.

<!-- ADD EXAMPLE + VISUAL -->