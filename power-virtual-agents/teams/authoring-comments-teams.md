---
title: "Create conversational chatbots"
description: "You can easily create new bots using the bot-builder wizard in Power Virtual Agents."
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: onboarding, ceX
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Create and delete Power Virtual Agents bots

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](authoring-comments.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-comments-teams.md)

To help get you started and tailor the bot to your specific needs, Power Virtual Agents lets you create a bot using built-in content building blocks containing topics, trigger phrases, and pre-authored bot conversations.

>[!WARNING]
>New bots are configured with "No authentication" and without [web channel security](configure-web-security.md), and can be accessed by anyone with a link to it. Ensure you have the right [authentication](configuration-end-user-authentication.md), [access](configuration-security.md), and [security](configure-web-security.md) configurations set for your particular usage.

>[!NOTE]
>You can only see bots in the version of Power Virtual Agents where you created them.  
>This means if you create a bot with the Power Virtual Agents app in Microsoft Teams, you will not see the bot in the web app of Power Virtual Agents at https://web.powerva.microsoft.com.


## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]


Adding comments to a bot (preview) 

 

Comments overview 

Comments are notes that are associated with items in your bot. Use comments to help your team collaborate on the bot and provide feedback, or provide additional information on implementation details in your bot.  

In Power Virtual Agents, the anchors, which are what comments can attach to, are topics and nodes within topics. The comments are stored in a table in Dataverse in the default solution.  

 

Important Note:  

•                 This is a preview feature.

•                 Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

•

Add a comment to a topic 

1.                 Open a bot and select any topic within the bot.

4.                 Open the topic in the authoring canvas and there will be a 'Comments' button on the command bar on the top right

5.                 Click 'Comments' to open the Comments pane.

6.                 Click 'New' and type the comment message in the box, and then select Enter.



You can also reply to a comment in a thread in the same way, in the box below.

 

Add a comment to a node 

2.                 Open a bot and select any topic within the bot.

7.                 Open the topic in the authoring canvas and select any node in the topic.

8.                 Use the … menu on the node to select 'New comment'.

9.                 This will open the comments pane with a new comment started up. Type the comment message in the box, and then select Enter.



You can also reply to a comment in a thread in the same way, in the box below.



Once a comment has been added to a node, a purple icon next to the node will indicate that it has one or more comments. Clicking on the purple icon, will scroll the comments pane to the first comment associated with the node. In the same way, clicking on a comment will scroll the authoring canvas to the node the comment is associated with.

 

Edit a comment 

You can edit existing comments of your own.  

1.                 In the comments pane, on a comment, select the "…" and select Edit comment

2.                 In the message box, edit the text of your comment, and then select Enter.



Delete a comment 

To remove comments from showing in the topic, you can delete them.  

1.                 In the comments pane, on a comment, select the "…" and select Delete comment

2.                 The comment will be removed.

 

You can only delete comments you have created.



Resolve a comment 

Comments are commonly questions, feedback or ideas that are important context to live alongside your topic, but they may not be active discussions anymore. You can resolve or unresolve a thread to track the open comments.  

1.                 In the comments pane, on a comment, select the "…" and select Resolve comment

2.                 The comment thread will be resolved.



Known limitations 

•                 Exporting and importing comments across environments is not supported yet. Accordingly, Comments will not be exported with solutions as they are moved across different environments.

•                 Mentioning other people in comments will not tag them or send any notification.

•                 This experience cannot be turned

•                 Comments' polling / auto refresh is not supported yet. Makers who have the same app open concurrently won't see newly added comments until they refresh the page. On page refresh, a maker will see all new comments, even without an explicit save on the topic by the comment creator.


[!INCLUDE[footer-include](includes/footer-banner.md)]
