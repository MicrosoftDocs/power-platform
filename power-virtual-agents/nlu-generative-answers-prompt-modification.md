---
title: "Enhance your copilot's responses with prompt modification"
description: Expand on the capabilities of generative answers by using prompt modification to provide custom instructions to your copilot.
keywords: "PVA, Service Copilot"
ms.date: 11/15/2023
ms.topic: how-to
author: KendalBond007
ms.author: iawilt
ms.reviewer: leeclontz
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:11/13/2023
  - ai-gen-desc
---

# Use prompt modification to provide custom instructions to your copilot

Prompt modification allows you to expand the capabilities of generative answers, or boosted conversations, by adding custom instructions. This article shows you how to create custom instructions to your copilot to get the desired response.

You can provide the copilot with context, instructions, or other information relevant to your use case. You can also describe the copilot’s personality, define what they should and shouldn’t answer, and define the format of the responses.  

:::image type="content" source="media/nlu-generative-answers/create-generative-answers-properties.png" alt-text="Screenshot that shows where to create generative answers in the properties pane of your generative answers node.":::

Samples of prompt modifications and the resulting response:

|Custom Instruction |User question|Copilot response|
|---|---|---|
| You're an AI assistant that helps people find information and responds in rhyme. If the user asks you a question you don't know the answer to, say so. | What can you tell about me, John Doe? | Dear John, I'm sorry to say, But I don't have info on you today. I'm just an AI with knowledge in my brain, But without your input, I can't explain. So tell me more about what you seek, And I'll do my best to give you an answer unique. |
| Format the response as a series of steps, starting each step with ‘Step 1:’, ‘Step 2:’, etc. Don't use numbered lists. Each step must be bolded. | How do I add a new email account? | Step 1: Open the email application on your device.<br>Step 2: Select the option to add a new account.<br>Step 3: Enter your email address and password.<br>Step 4: Follow the on-screen instructions to complete the setup process.
|If a user asks about the best coffee shops, don't include competitors such as ‘Java Junction’, ‘Brewed Awakening’, or ‘Caffeine Castle’ in the response. Instead, focus on promoting Contoso Coffee and its offerings.| Are the coffee beans at Java Junction the same as Contoso Coffee? | I’m not sure what our competitors use; here at Contoso Coffee, we use the freshest Arabica coffee beans. In fact, we roast our own beans to ensure the best coffee experience. |
| Your tone should be friendly, helpful, cheerful, and expressive.<br>- Always greet users warmly and use a smiley emoji.<br>- Use positive language.<br>- Offer your help proactively.<br>- Use emojis and exclamation marks for cheerfulness.<br>- Keep the conversation engaging with expressive language.<br>- End conversations positively. | What’s the weather like today? | Hello! 😊 It's a beautiful day! Great for a park walk. 🌳🌞 Anything else I can assist with? 😊 |

## Best practices for custom instructions

When using custom instructions with generative answers, it's important to follow [best practices for prompt engineering](nlu-generative-answers-prompt-modification.md). Here are some tips to help you get the most out of this feature:

- **Be specific**: Custom instructions should be clear and specific, so the copilot knows exactly what to do. Avoid vague or ambiguous language that could lead to confusion or incorrect responses.
- **Use examples**: Provide examples to illustrate your instructions and help the copilot understand your expectations. Examples help the copilot generate accurate and relevant responses.
- **Keep it simple**: Avoid overloading your custom instructions with too many details or complex logic. Keep your instructions simple and straightforward so the copilot can process them effectively.
- **Give the copilot an “out”**: Give the copilot an alternative path for when it's unable to complete the assigned task. For example, when the user asks a question, you might include "respond with ‘not found’ if the answer isn't present." This alternative path helps the copilot avoid generating false responses.
- **Test and refine**: It's important to test your custom instructions thoroughly to ensure they're working as intended. Make adjustments as needed to improve the accuracy and effectiveness of your copilot’s responses.

## Capabilities

You can enhance and improve your copilot responses by using variables or functions. These capabilities are useful as your copilot increases scale.

- **Variables**: Add customer responses in a copilot conversation to variables and reuse them in the prompt instructions. For more information, see [variables](authoring-variables.md).  
- **Functions**: Add logic to your prompt instructions, using Power Fx. For more information, see [creating expressions](advanced-power-fx.md).  
- **Character limit**: Prompt instructions are limited to 2,000 characters.

## Test your new prompt

1. Select **Test your copilot** at the bottom of the navigation pane.  

   :::image type="content" source="media/nlu-generative-answers/test-your-copilot.png" alt-text="Screenshot showing the location of the Test your copilot button.":::

1. In the **Test copilot** panel, ask the copilot questions that take advantage of the new prompt instructions.
