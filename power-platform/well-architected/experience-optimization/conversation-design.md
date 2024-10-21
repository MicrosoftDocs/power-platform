---
title: Recommendations for designing conversational UX
description: Learn strategies for effective conversation design for AI in your workloads.
author: Robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.date: 11/6/2024
ms.subservice: well-architected
ms.topic: conceptual
---
# Recommendations for designing conversational user experiences

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:10](checklist.md)| **Design conversations that align with users' needs and help the AI accomplish its objectives. Create natural interactions that feel inutitive and human-like. Make it clear what the AI can do.** |
|---|---|

This guide describes the recommendations for designing the user experience for conversational AI in a workload. Conversation design is the process of creating structured, intuitive, and natural dialogues between users and AI. Conversation design is important in a well-architected workload because it significantly enhances user experience by making interactions intuitive and efficient, thereby reducing frustration. It fosters trust as users feel understood and are more likely to engage repeatedly. It improves productivity by allowing users to complete tasks quickly without needing human intervention.

## Key design strategies

Conversation design involves crafting the flow of interactions, ensuring the AI understands user intent, responds effectively, and guides the user toward their goals. Good conversation design enhances the user experience by making interactions feel more human-like and seamless, which increases user engagement and satisfaction. When creating conversational AI for your workload, aim to develop human-like, user-friendly interactions that facilitate natural communication and help users achieve their goals efficiently.

### Understand the user's intent

When the AI recognizes and responds to intent appropriately, it helps avoid dead ends and frustration, making the conversation more fluid and effective. Understanding user intent plays a crucial role in designing a conversation because it ensures the AI interprets and responds accurately to user needs.

Start with identifying what users want to achieve. Map out key intents for your workload and design AI interactions that match the intents. Study user behavior, preferences, and contextual cues to anticipate the various ways users might communicate their intentions.

### Explain the capabilities of the AI

Be upfront about the AI’s capabilities to help ensure users know what the AI can do. For example, if the AI is only able to perform specific tasks, let the user know right from the start. Make sure users understand why the AI suggests specific actions or produces particular results. Adding explanations or suggestions for the AI’s recommendations will help users be successful with the AI and increase their trust in its capabilities and accuracy.

Clear communication about the AI's abilities helps manage user expectations by preventing unrealistic assumptions and minimizing disappointment and frustration, leading to a more positive user experience. When an AI system is transparent about its limitations and strengths, it builds trust, which is essential for user engagement and satisfaction. This transparency significantly bolsters user confidence in the technology.

Awareness of the AI’s specific capabilities improves usability by enabling users to navigate interactions more effectively and utilize the AI more efficiently. Outlining the AI’s capabilities reduces miscommunication, as users are less likely to make requests beyond the AI’s scope, thus reducing potential frustration and dead ends.

### Optimize how the AI interprets input

At the core of any conversational AI is the ability to understand human language accurately. Conversational AI relies on natural language understanding to discern the user's intent, so optimizing how the AI interprets user input ensures that the AI correctly understand the intent, even when users phrase things in unexpected ways. Design responses that sound natural and how people communicate.

Anticipate various ways users might phrase their requests and structure the AI's responses to accomodate different intents. Allow the AI to handle both structured commands and open-ended questions, ensuring users feel understood, regardless of how they phrase their requests.

For more complex user inputs, break down the conversation into manageable steps, guiding users through a series of questions or actions that resolve their issue without overwhelming them.

### Guide the user through interactions

Conversation flows determine how the conversation progresses depending on what the user says or chooses. The goal of a good conversation flow is to guide the user through the interaction smoothly. Design a conversation flow that maps out possible interactions and decision trees based on user inputs.

In a good conversation, there's a natural back-and-forth between participants.Conversation design ensures that the AI knows when to ask questions, when to provide information, and when to prompt the user for further clarification or action. Design the conversation flow to manage transitions gracefully.

### Design fallback mechanisms

Conversations don’t always go as planned. Good conversation design ensures that when the AI doesn’t understand a user input, it can recover gracefully. This might involve asking clarifying questions or offering alternative suggestions. Plan for edge cases, where users might say something unexpected or off-topic, by creating fallback responses that redirect the conversation.

Design strategies for when the AI doesn’t understand a user input. Instead of simply saying, “I didn’t understand that,” provide helpful fallback options like clarifying questions or suggesting alternative ways to ask. If the user provides incomplete or confusing information, guide them with prompts that clarify their intent rather than abruptly ending the conversation.

## Power Platform facilitation

Copilot Studio includes [pre-built entities](/microsoft-copilot-studio/advanced-entities-slot-filling) that are designed to understand common user intents. You can map user intents using these built-in entities.

You can use [agent templates](/microsoft-copilot-studio/template-fundamentals) as a starting point and customize them for your workload's users' needs.

[Provide custom instructions](/microsoft-copilot-studio/nlu-generative-answers-prompt-modification) to your copilot with prompt modification.

[Configure the fallback topic](/microsoft-copilot-studio/authoring-system-fallback-topic) that a copilot can use when it doesn't understand a user's input or cannot handle the request.

## Additional information

- [Intelligent application workload](../intelligent-application/overview.md)
- [Introduction to conversational experiences](/microsoft-copilot-studio/guidance/cux-overview)
- [Conversational AI best practices](/microsoft-copilot-studio/guidance/project-best-practices)

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)