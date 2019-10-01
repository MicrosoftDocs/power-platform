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

# Create and edit topics in your bot

In Power Virtual Agents, a topic defines a conversation path with the bot for a specific customer intent. You specify one or more trigger phrases that prompt the bot to start the conversation. Then create a conversation path in Power Virtual Agents' conversation editor to lead customers to a resolution of their support issue.

You can see how the conversation path works in practice by testing it in the **Test bot** pane and continue to fine-tune the topic until you are ready to deploy it.

## To create a topic

1. Select **Topics** in the left pane to open the Topics page.

<<< INCLUDE IMAGE OF LEFT NAV WITH TOPICS HIGHLIGHTED >>>

 The Topics page displays a list of your bot's current topics. Power Virtual Agents includes some built-in topics to get you started.

  Power Virtual Agents also includes several system topics that help you address common situations — a customer greeting, escalation to a live agent, the end of the conversation, a confirmed success, or a confirmed failure.
 

2. On the Topics page, select **New topic**.

<<< INCLUDE IMAGE OF NEW TOPIC BUTTON HIGHLIGHTED >>>>

3. Specify a name, description, and one or more trigger phrases for the topic.

    A trigger phrase is a phrase that a customer enters in the chat window to start a conversation with the bot. Once the conversation is started, the conversation follows the path you define. You can specify more than one trigger phrase for a topic. You can include punctuation in a trigger phrase, but it is best to use short phrases rather than long sentences.

    Select **Save topic** to add the topic to the topics list.

<<< INCLUDE IMAGE OF TOPIC DETAILS PAGE WITH SAVE HIGHLIGHTED >>>


## To design the topic's conversation path

1. Select **Go to authoring canvas** to open the conversation editor.

<<< INCLUDE IMAGE OF TOPIC DETAILS PAGE HIGHLIGHTING THE BUTTON  >>>

Power Virtual Agents opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

 <<< INCLUDE IMAGE OF AUTHORING CANVAS >>>
 
  As you define the topic's conversation path, you might want to expand the authoring canvas. 
  ....
  ....
  ....

2. Enter the bot's response to the trigger phrase in the **Message** box.

<<<< INCLUDE IMAGE OF MESSAGE NODE HIGHLIGHTED >>>>

3. To specify an additional response by the bot, select **+** to add a node, select **Show a message** to add a new Message node.

<<< INCLUDE IMAGE OF + CLICKED WITH OPTIONS EXPANDED >>>

   Then enter the additional response in the **Message** box.

4. To ask a question and get a response from the customer, select **Ask a question** in the options under the **+** to add a new node.    Enter the question text in the **Ask a question** box. 

<<< INCLUDE IMAGE OF ASK A QUESTION NODE ADDED >>>

   You can provide several options for the user’s response from the **Listen for** flyout. To understand more about the different options in this flyout, see [Using Entities](advanced-entities-greedy-slot-filling-virtual-agent.md).

<<< INCLUDE IMAGE OF THE LISTEN FOR FLYOUT EXPANDED >>>

   To give the customer a choice between different responses, select **Multiple choice options**.

  <<< INCLUDE IMAGE OF MULTIPLE CHOICE OPTIONS SELECTED >>>

   Then specify the options under **User options**. Add a couple options for the user to select from by clicking **+ New option** and entering the text of the option. Each option is presented as a multiple choice button to the user.

<<< INCLUDE IMAGE OF MULTIPLE CHOICE OPTIONS ADDED >>>

  The conversation editor creates separate paths in the conversation, depending on the customer's response. The conversation path leads the customer to the appropriate resolution for each user response.
  
<<< INCLUDE IMAGE OF THE FORKED TREE >>>

  You can save the user response in a variable to be used later. For more information on using variables, see [Use variables](authoring-variables-virtual-agent.md)

5. Add additional message nodes and user responses to complete the conversation path.


6. To add a customer satisfaction survey at the end of a response that resolves the customer issue, select **End the conversation**, then select **End with survey**.

<<< INCLUDE IMAGE OF ENDING WITH SURVEY >>>

   Then select **Save** to save the conversation path.

As you design your topic's conversation path, you can use the **Test your bot** pane to see how the bot leads the customer through a conversation.

## To test the topic in the Test bot pane

1. To make sure you are using the most current bot content, select **Reset** at the top of the **Test bot** pane.

 <<< INCLUDE IMAGE OF THE TEST BOT PANE >>>

2. At the **Type your message** prompt at the bottom of the **Test bot** pane, enter a trigger phrase for the topic.

<<< INCLUDE IMAGE OF TYPE A MESSAGE BOX >>>

   The trigger phrase starts the topic's conversation. The **Test bot** pane displays the bot and user responses that you specified in the conversation editor.

 <<< INCLUDE IMAGE OF CONVERSATION IN PROGRESS IN TEST BOT PANE >>>
 
3. Continue the conversation path until you complete the conversation.

<< INCLUDE IMAGE OF SURVEY SHOWING AT THE END OF CONVERSATION IN TEST BOT PANE >>>

   If the conversation editor is open, you can select a response in the **Test bot** pane to navigate to the response in the conversation editor.

You can return to the conversation editor at any time to revise the topic's conversation path and continue to fine-tune the bot until you are ready to deploy it. For more information, see [Fundamentals - Publish your bot](publication-fundamentals-virtual-agent.md).

For more information on using the **Test bot** pane, see [Test your bot](authoring-test-bot-virtual-agent.md).


