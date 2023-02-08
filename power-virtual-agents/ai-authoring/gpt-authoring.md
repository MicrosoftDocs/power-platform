---
title: Create and edit topics using natural language (preview)
description: Create and edit topics by describing what you want in natural language.
keywords: "PVA"
ms.date: 12/12/2022
ms.topic: how-to
author: gapretty
ms.author: iawilt
ms.reviewer: clmori
manager: shellyha
ms.custom: authoring, topics, variables, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---

# Create and edit topics using natural language (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

In addition to the traditional method for [creating and editing topics](authoring-create-edit-topics.md), Power Virtual Agents allows you to use create and iterate on topics by describing what you want and having AI build it for you, boosting your productivity as an author significantly. 

## Creating a topic

1. Open your bot and select **Topics**. On the **Topics** page, select **+ New topic** and then **Describe it to build it (preview)**.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the New topics button highlighted.":::

2. In the **Describe it to build it (preview)** window that appears, enter a description of the topic you would like to create. 
   
   You can include details of the questions you want your topic to ask your users and messages and even details of specific behavior you want your topic to have. Below are some examples of requests you could make, based on the same, but increasing in their detail.
   
   - create a topic to let a user check the status of a flight
   - create a topic to let a user check the status of a flight, asking the user for their flight date and flight number.
   - create a topic to let a user check the status of a flight, asking the user for their flight date and flight number. Repeat the users responses back to them and add 3 message variations to each question.

3. Optionally, enter a name for your topic in the **Name your topic** input.
   
   > Giving your topic a name can help to improve the topic that is built for, because it adds content to your request. 
   
4. Click **Create**.
   
5. The authoring canvas will now open and a new Topic, which can include a generated title and trigger phrases, as well as one or more nodes, will be created for you. You can now review the content that has been generated for you and make any changes required, which you can do either via [natural language descriptions]() or using the [other authoring canvas tools](authoring-create-edit-topics.md).

## Making changes to a topic

You can make additions or changes to a topic, regardless of how the topic was created (from a natural language description or manual authoring) by describing what you want to do.

1. Open the **Describe** panel by clicking the button in the tool bar.
   
2. You can now enter a description of what you would like to add or change within your topic. Below are some examples requests.

- add a question to ask the user for their date of birth
- add 2 message variations to all questions in the topic
- update the content within the topic to be more appropriate for customer service

> If you have any nodes selected on your canvas, they will be used to provide further context to your request. For example, if you have a question node selected, you could say, `add a speech response`, instead of needing to say `add a speech response to the question node`.

3. Click **Update** to make updates based on your description.
   
4. Once the update has been applied, you can review the changes and continue to edit your topic, either via the authoring canvas or making another natural language request. If you're not happy with the changes made, you can use the **Undo** button in the panel to revert the change, amend your request, and try again.

> You can provide feedback about the outcomes of your request using the thumbs up / down icons available within the panel. If you indicate that a request didn't do what you were expecting using the thumbs down icon, you can optionally provide additional details relating to your request to help us understand how we can improve the quality of future results. 

[!INCLUDE[footer-include](includes/footer-banner.md)]