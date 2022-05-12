---
title: "Use sample topics to understand capabilities"
description: "Use specific template topics to understand the capabilities when authoring topics for use in Power Virtual Agents bots."
keywords: "PVA"
ms.date: 05/10/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Use sample topics in Power Virtual Agents

Power Virtual Agents includes a set of three samples from which you can see examples of topics. These samples range from simple to complex scenarios that use [conditional branching](authoring-create-edit-topics.md) and [custom entities](advanced-entities-slot-filling.md).

## Access and use sample topics for new bots

When a bot is created, several samples are automatically created as topics.

While the topics are functional, they are examples for the purposes of learning how to create content for your bots. The topics aren't designed for production use.

**Use sample topics to understand how topics work:**

1. Go to the **Topics** tab.

1. Select **Sample 1** and work through to **Sample 3**. Review the title and description, and see which trigger phrases are being used.  

1. To see the bot's flow, select each topic. The flow includes the bot's comments, expected user responses, decision points, and entity references.

   :::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="List of sample topics." border="false":::

> [!IMPORTANT]
> You will see these samples when you create a new bot. If you have previously created a bot and don't see them, try creating a new bot and then going to the **Topics** tab.

## Available sample topics

Each sample is designed to teach you how to use the authoring canvas to create basic and advanced bot conversations.

You should start with **Sample 1** and work through each sample in order.

### Sample 1 - Text variation with quick replies

This sample shows you how to create a simple topic with multiple text variation responses and a quick reply.

### Sample 2 - Question with images, quick replies, and a condition

This sample shows you how you to create a simple question with an image and quick reply that identifies an [entity](advanced-entities-slot-filling.md) and stores it as [a variable](authoring-variables.md), a condition, and a redirect to the [next sample topic](#sample-3---set-variable-with-function).

When you use entities in your topic, the bot can identify key information from user response and automatically fills in that information into your variables. A variable is a name for an item that will be used later in the topic flow.

In this sample, the bot uses the State entity to recognize any US state the user enters and stores it as the `state` variable. This variable is used in the condition, which determines which shipping message to send the user. The topic ends by redirecting to the next sample topic.

### Sample 3 - Set variable with function

This sample shows you how you to create a topic with [a variable](authoring-variables.md) and set it to the value of a function. This variable is used in the a message about shipping time, and finishes by redirecting to the End of Conversation topic.

[!INCLUDE[footer-include](includes/footer-banner.md)]
