---
title: "Hand off a bot conversation to a live agent"
description: "Learn how to use Virtual Agent to create a bot conversation that hands off to a live agent."
ms.date: 05/29/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Hand off a bot conversation to a live human agent

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

A bot can resolve many customer support issues, but there are times when an issue requires a live human agent. As you design the conversation path for your bot topic, you can initiate a handoff by redirecting users to the Escalate system topic. To get started, update the Escalate system topic.

## Update the Escalate system topic to hand off to a live agent

1. Select **Topics** in the left pane to open the Topics page.

   ![Open Topics page](media/open-topics.png)

2. Hover over the Escalate system topic, and then select **Edit conversation** to open the topic in the conversation editor.

   ![Edit Escalate topic](media/open-escalate.png)

3. In the **Bot Says** box, replace the *[link]* placeholder with a link to your engagement hub chat canvas. Then select **Save** to save the topic.

   ![Save topic](media/replace-placeholder.png)

You are now ready to redirect users to this topic to initiate a handoff.

## Initiate handoff to a human agent from any user topic

1. Select **Topics** in the left pane to open the Topics page.

   ![Open Topics page](media/open-topics.png)

2. Open the topic where you want to add the handoff in the conversation editor. Navigate to where you want to trigger a handoff to a live human agent, and then select **Escalate**.

   ![Select Escalate](media/select-escalate.png)

    Virtual Agent adds an **Escalate** node to the conversation path.

   ![Add Escalate node](media/add-escalate.png)

3. Select **Save** to save the topic. 

Your topic now redirects to "Escalate" to initiate a handoff to a human agent. 
