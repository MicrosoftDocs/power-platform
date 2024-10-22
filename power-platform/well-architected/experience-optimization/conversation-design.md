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

|[XO:10](checklist.md)| **Design conversations that align with users' needs and help the AI accomplish its objectives. Create natural interactions that feel intuitive and human-like. Make it clear what the AI can do.** |
|---|---|

This guide describes the recommendations for designing the user experience for conversational AI in a workload. Conversation design is the process of creating structured, intuitive, and natural dialogues between users and AI. Conversation design is important in a well-architected workload because it significantly enhances user experience by making interactions intuitive and efficient, reducing frustration. It fosters trust as users feel understood and are more likely to engage repeatedly. It improves productivity by allowing users to complete tasks quickly without needing human intervention.

## Key design strategies

Conversation design involves crafting the flow of interactions, ensuring the AI understands user intent, responds effectively, and guides the user toward their goals. Good conversation design enhances the user experience by making interactions feel more human-like and seamless, which increases user engagement and satisfaction. When you create conversational AI for your workload, aim to develop human-like, user-friendly interactions that facilitate natural communication and help users achieve their goals efficiently.

### Explain the capabilities of the AI

Be upfront about the AI’s capabilities and help ensure users know what the AI can do. For example, if the AI is only able to perform specific tasks, let the user know right from the start. Make sure users understand why the AI suggests specific actions or produces particular results. Adding explanations or suggestions for the AI’s recommendations help users be successful with the AI and increase their trust in its capabilities and accuracy.

Clear communication about the AI's abilities helps manage user expectations by preventing unrealistic assumptions and minimizing disappointment and frustration, leading to a more positive user experience. When an AI system is transparent about its limitations and strengths, it builds trust, which is essential for user engagement and satisfaction. This transparency significantly bolsters user confidence in the technology.

Awareness of the AI’s specific capabilities improves usability by enabling users to navigate interactions more effectively and utilize the AI more efficiently. Outlining the AI’s capabilities reduces miscommunication, as users are less likely to make requests beyond the AI’s scope, thus reducing potential frustration and dead ends.

### Understand the user's intent

Understanding user intent is a cornerstone of conversation design, as it directly influences how well the AI can fulfill user requests and navigate complex dialogues. Accurately capturing intent ensures that the AI not only understands what the user is asking for but also responds in ways that feel intuitive and relevant to the user’s needs.

When the AI recognizes and responds to intent appropriately,  it creates a more natural and seamless conversation, reducing frustration and ensuring that users can accomplish their goals efficiently. Proper intent recognition helps the AI avoid "dead ends" — moments where it doesn’t know how to proceed — by ensuring that the AI understands the underlying purpose behind a user’s input, even if the phrasing or terminology varies. This keeps the interaction fluid, with the AI proactively guiding users toward solutions, recommendations, or further actions, ultimately making the conversation more effective and satisfying.

Start by identifying what users want to accomplish. Map out key intents for your workload and design targeted interactions that match the intents. Study user behavior, preferences, and contextual cues to anticipate the various ways users might communicate their intentions.

### Optimize how the AI interprets input

At the core of any conversational AI is the ability to understand human language accurately. Conversational AI relies on natural language understanding to discern the user's intent. Optimizing how the AI interprets user input ensures that the AI correctly understands the intent, even when users phrase things in unexpected ways. Design responses that sound natural and how people communicate.

Anticipate various ways users might phrase their requests and structure the AI's responses to accommodate different intents. Allow the AI to handle both structured commands and open-ended questions, ensuring users feel understood, regardless of how they phrase their requests.

For more complex user inputs, break down the conversation into manageable steps, guiding users through a series of questions or actions that resolve their issue without overwhelming them.

### Guide the user through interactions

Conversation flows determine how the conversation progresses depending on what the user says or chooses. A good conversation flow should always be goal-oriented. Each step in the interaction should bring the user closer to completing their objective, whether it’s scheduling a meeting, retrieving information, or resolving an issue. Designing with the user’s end goal in mind ensures that the conversation stays focused and purposeful, reducing frustration and improving the overall experience.

To create an effective conversation flow, you first need to map out all possible interactions a user might have with the AI. This includes designing clear decision trees that branch out based on different user responses or choices. By anticipating various paths a conversation could take, you ensure that the AI is prepared to handle both expected and unexpected inputs. For example, if the user is interacting with the AI to schedule a meeting, the flow might involve paths where the AI asks about the date, time, and participants. The flow should account for responses to these questions as well as possible follow-up questions if details are unclear or incomplete.

In a well-designed conversation, there’s a natural back-and-forth between the user and the AI, mirroring the dynamics of human interaction. The AI must not only respond to user inputs but also know when to take initiative, such as prompting the user for more information, asking clarifying questions, or providing suggestions. This requires designing the conversation flow to include moments where the AI can offer options, confirm user choices, or propose next steps, creating an interaction that feels cooperative and engaging.

Design conversation flows to handle interruptions and deviations gracefully. Users may change their mind mid-interaction or ask unrelated questions. A flexible flow will allow the AI to manage these situations effectively, such as pausing the current task to address a new query and returning to the original task when appropriate. This ensures that the AI can maintain context while still accommodating dynamic user behavior.

To enhance the fluidity of the conversation, transitions between different stages of the flow need to be managed with care. When the AI shifts from gathering information to executing an action, it should communicate this transition clearly to the user. 

### Design fallback mechanisms

Conversations don’t always go as planned. Good conversation design ensures that when the AI doesn’t understand a user input, it can recover gracefully, for example, asking clarifying questions or offering alternative suggestions. Plan for edge cases, where users might say something unexpected or off-topic, by creating fallback responses that redirect the conversation.

Design strategies for when the AI doesn’t understand a user input. Instead of simply saying, "I didn’t understand that," provide helpful fallback options like clarifying questions or suggesting alternative ways to ask. If the user provides incomplete or confusing information, guide them with prompts that clarify their intent rather than abruptly ending the conversation.

## Power Platform facilitation

Copilot Studio includes [prebuilt entities](/microsoft-copilot-studio/advanced-entities-slot-filling) that are designed  to understand and categorize common user intents across a variety of domains. Use the prebuilt entities to map user intents to the relevant actions or responses without needing to build everything from scratch.  Prebuilt entities are optimized to handle common variations in user input.

You can use [agent templates](/microsoft-copilot-studio/template-fundamentals) as a starting point as a starting point for building copilots. The templates are pre-configured with core conversational patterns, capabilities, and workflows designed to handle common tasks and scenarios. They incorporate built-in intents, entities, and dialogue flows tailored for specific use cases, such as customer support, productivity tasks, or FAQs. You can customize the templates to meet the specific needs of your workload and users.

[Provide custom instructions](/microsoft-copilot-studio/nlu-generative-answers-prompt-modification) in your copilot through prompt modification, providing you with exact control over how the AI engages with users and answers specific questions. By altering the underlying instructions that shape the Copilot’s comprehension and language generation, prompt modification allows developers to tailor the AI's behavior, responses, and emphasis. These bespoke prompts can be customized to fit various use cases, sectors, or company requirements, ensuring that the Copilot offers contextually appropriate and useful replies.

[Configure the fallback topic](/microsoft-copilot-studio/authoring-system-fallback-topic) that a copilot can use when it doesn't understand a user's input or can't handle the request. The fallback topic acts as a safety net, providing a pre-set response that keeps the conversation on track and prevents user frustration when the AI reaches the limits of its capabilities. By configuring the fallback topic, you can determine how the copilot responds when it's unable to interpret a user's intent. For example, you can set the fallback response to politely inform the user that it didn’t understand the request and offer helpful suggestions, such as asking the user to rephrase the query or providing a set of related options or commands that the AI can process. In more advanced configurations, the fallback topic can guide users to other resources or escalate the conversation to a human agent.

## Additional information

- [Intelligent application workload](../intelligent-application/overview.md)
- [Introduction to conversational experiences](/microsoft-copilot-studio/guidance/cux-overview)
- [Conversational AI best practices](/microsoft-copilot-studio/guidance/project-best-practices)

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)