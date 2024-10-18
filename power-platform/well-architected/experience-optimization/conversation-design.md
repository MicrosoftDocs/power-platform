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

This guide describes the recommendations for designing the user experience for conversational AI. Conversation design is the process of creating structured, intuitive, and natural dialogues between users and AI. It involves crafting the flow of interactions, ensuring the AI understands user intent, responds effectively, and guides the user toward their goals. Good conversation design enhances the user experience by making interactions feel more human-like and seamless, which increases user engagement and satisfaction.

## Key design strategies

When designing conversational AI for your workload, a key objective is to create human-like, user-friendly interactions between people and AI systems, ensuring smooth, natural communication while helping users achieve their goals efficiently.

### Understand the user's intent

When the AI recognizes and responds to intent appropriately, it helps avoid dead ends and frustration, making the conversation more fluid and effective. Understanding user intent plays a crucial role in designing a conversation because it ensures the AI interprets and responds accurately to user needs.

Start with identifying what users want to achieve. Map out key intents for your workload and design AI interactions that meeth those intents. Analyze user behavior, preferences, and contextual cues to anticipate the various ways users might communicate their intentions.

### Explain the capabilities of the AI

Be upfront about the AI’s capabilities. For example, if the AI is only able to perform specific tasks, make sure this is communicated early in the interaction. Help the user understand what the AI is capable of doing. Make sure users understand why the AI provides certain suggestions or outputs. Adding explanations or suggestions for the AI’s recommendations will increase user trust.

### Optimize how the AI interprets input

At the core of any conversational AI is the ability to understand human language accurately. Conversational AI relies on natural language understanding to discern the user's intent, so optimizing how the AI interprets user input ensures that the AI correctly understand the intent, even when users phrase things in unexpected ways. Design responses that sound natural and how people communicate.

Anticipate various ways users might phrase their requests and structure the AI's responses to accomodate different intents. Allow the AI to handle both structured commands and open-ended questions, ensuring users feel understood, regardless of how they phrase their requests.

For more complex user inputs, break down the conversation into manageable steps, guiding users through a series of questions or actions that resolve their issue without overwhelming them.

### Guide the user through interactions

Conversation flows determine how the conversation progresses depending on what the user says or chooses. The goal of a good conversation flow is to guide the user through the interaction smoothly. Design a conversation flow that maps out possible interactions and decision trees based on user inputs.

In a good conversation, there's a natural back-and-forth between participants.Conversation design ensures that the AI knows when to ask questions, when to provide infromation, and when to prompt the user for further clarification or action. Design the conversation flow to manage transitions gracefully.

### Design fallback mechanisms

Conversations don’t always go as planned, so part of conversation design is ensuring that when the AI doesn’t understand a user input, it can recover gracefully. This might involve asking clarifying questions or offering alternative suggestions. Plan for edge cases, where users might say something unexpected or off-topic, by creating fallback responses that redirect the conversation.

Design strategies for when the AI doesn’t understand a user input. Instead of simply saying, “I didn’t understand that,” provide helpful fallback options like clarifying questions or suggesting alternative ways to ask. If the user provides incomplete or confusing information, guide them with prompts that clarify their intent rather than abruptly ending the conversation.

## Power Platform facilitation

Todo: Describe Copilot features and link to documentation or guidance.

- Pre-built models
- Customization
- In-app assistance
- Pre-built error management
- Handling unexpected user input

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)