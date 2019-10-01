---
title: "TITLE"
description: "DESCRIPTION"
keywords: "KEYWORDS"
ms.date: 09/04/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "VA"
ms.collection: virtualagent
---

# Test your bot

As you design your bot in Power Virtual Agents for Customer Service, you can use the **Test bot** pane to see how the bot leads a customer through the conversation path. To help you find and fix unexpected behavior, you can enable tracking to take you through the conversation path step by step, and go to the corresponding node in the authoring canvas.

## To test a topic in the Test bot pane

1. To make sure you are using the most current bot content, select **Reset** at the top of the **Test bot** pane. This will also clear any previous conversation in the test pane.

<<< INCLUDE IMAGE OF TEST PANE WITH RESET BUTTON HIGHLIGHTED >>>

2. At the **Type your message** prompt at the bottom of the **Test bot** pane, enter a trigger phrase for the topic.

<<< INCLUDE IMAGE OF ENTERING SOMETHING IN THE TYPE YOUR MESSAGE BOX >>>

   The trigger phrase starts the topic's conversation, and the **Test bot** pane displays the bot responses and user response choices you specified.


<<< INCLUDE IMAGE OF CONVERSATION STARTED IN THE TEST BOT PANE >>>


3. Continue the conversation path until you complete the conversation.

<<< INCLUDE IMAGE OF END OF CONVERSATION WITH SURVEY >>>

   If the conversation editor is open, you can select a response in the **Test bot** pane, which will take you to the response in the conversation editor.

You can return to the conversation editor at any time to revise the topic's conversation path.

As you fine-tune your bot, it can be useful to enable tracking to take you through the conversation path step by step.

## To track through the topic's conversation path

1. In the upper-left corner of the **Test bot** pane, select the **Track between topics** toggle button to enable tracking.

<< INCLUDE IMAGE TO SHOW TOGGLE HIGHLIGHTED >>>

2. Follow the steps discussed above to test your topic. 

3. As you move through the conversation in the **Test bot** pane, the authoring canvas highlights the current place in the conversation path. The authoring canvas displays highlighted nodes in green.

<<< INCLUDE IMAGE OF HIGHLIGHTED NODE IN CANVAS >>>

4. To navigate to an earlier place in the conversation path in the authoring canvas, select it in the **Test bot** pane.

If the conversation path in the **Test your bot** pane moves from one topic to another topic, the authoring canvas refreshes and moves between topics to the appropriate highlighted nodes.



