---
title: "Create custom topics for your bot"
description: "Learn how to use Power Virtual Agents to create custom topics for your bot."
ms.date: 05/29/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Create custom topics for your bot

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

In Power Virtual Agents, a topic defines a conversation path with the bot for a specific customer intent. You specify a trigger phrase that prompts the bot to start the conversation. Then create a conversation path in Power Virtual Agents's conversation editor to lead customers to a resolution of their support issue.

You can see how the conversation path works in practice by testing it in the **Test bot** pane and continue to fine-tune the topic until you are ready to deploy it.

## To create your custom topic

1. Select **Topics** in the left pane to open the Topics page.


   ![Open Topics page](media/open-topics.png)

    The Topics page displays a list of your bot's current topics. Power Virtual Agents includes some built-in topics to get you started.

   ![Built-in topics](media/template-topics.png)

    Power Virtual Agents also includes several system topics that help you address common situations—a customer greeting, escalation to a live agent, the end of the conversation, a confirmed success, or a confirmed failure.

2. On the Topics page, select **New topic**.

   ![New topic](media/create-new-topic.png)

3. Specify a name, description, and one or more trigger phrases for the topic.

    A trigger phrase is a phrase that a customer enters in the chat window to start a conversation with the bot. Once the conversation is started, the conversation follows the path you define. You can specify more than one trigger phrase for a topic. You can include punctuation in a trigger phrase, but it is best to use short phrases rather than long sentences.

    Select **Save topic** to add the topic to the topics list.


   ![Save topic](media/save-topic.png)

## To design the topic's conversation path

1. Select **Edit** to open the conversation editor.

   ![Edit conversation](media/edit-conversation.png)

    Power Virtual Agents opens the topic in the conversation editor and displays the topic's trigger phrases. The conversation editor is where you define the conversation path between a customer and the bot.

   ![Open conversation](media/open-conversation.png)

    As you define the topic's conversation path, you might want to expand the conversation editor design canvas. For more information on working with the design canvas, see [Working with the conversation editor design canvas](expanding-design-canvas.md).

2. Enter the bot's response to the trigger phrase in the **Bot Says** box.

   ![Add bot response](media/bot-response.png)

3. To specify an additional response by the bot, select **Bot says**.

   ![Additional bot response](media/add-response.png)

    Then enter the additional response in the **Bot Says** box.

   ![Additional response text](media/response-text.png)

4. To specify a response by the customer, select **User says**.

    You can provide several options for the user’s response. The options display as clickable buttons.

   ![Add user response](media/user-says.png)

    Enter a response in the **User Responses** box.

   ![Add user response text](media/user-response.png)

    To give the customer a choice between different responses, select **Add user response**.

   ![Additional user response](media/second-response.png)

    Then specify the additional response in the **User Responses** box.

   ![Additional user response text](media/second-response-text.png)

    The conversation editor creates separate paths in the conversation, depending on the customer's response. The conversation path leads the customer to the appropriate resolution for each user response.

5. Add additional bot and user responses to complete the conversation path.

   ![Complete conversation](media/complete-conversation.png)

6. To add a customer satisfaction survey at the end of a response that resolves the customer issue, select **End with survey**.

   ![End with survey](media/end-with-survey.png)

   Then select **Save** to save the conversation path.

As you design your topic's conversation path, you can use the **Test bot** pane to see how the bot leads the customer through a conversation.

## To test the topic in the Test bot pane

1. To make sure you are using the most current bot content, select **Start over with latest content** at the top of the **Test bot** pane.

   ![Restart conversation](media/restart-conversation.png)

2. At the **Type your message** prompt at the bottom of the **Test bot** pane, enter a trigger phrase for the topic.

   ![Trigger phrase](media/enter-trigger.png)

   The trigger phrase starts the topic's conversation. The **Test bot** pane displays the bot and user responses that you specified in the conversation editor.

   ![Start conversation](media/start-conversation.png)

3. Continue the conversation path until you complete the conversation.

   ![Complete conversation](media/complete-conversation.png)

   If the conversation editor is open, you can select a response in the **Test bot** pane to navigate to the response in the conversation editor.

You can return to the conversation editor at any time to revise the topic's conversation path and continue to fine-tune the bot until you are ready to deploy it. For more information, see [Deploying your bot](getting-started-deploy.md).

For more information on using the **Test bot** pane, see [Work with the Test bot pane](how-to-test-bot.md).
