---
title: "Share chatbots with other users in Teams"
description: "Share Power Virtual Agents chatbots with other people in your group.
keywords: "Administration, share, multi-author, PVA, teams"
ms.date: 9/9/2020
ms.service: dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "multi-author, admin, ceX, teams"
ms.collection: virtual-agent
---

# Collaborate with others 

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../admin-share-bots.md)
> - [Power Virtual Agents app in Microsoft Teams](admin-share-bots-teams.md)


You can collaborate with others when building chatbots in Microsoft Teams. This means other members of your team can make edits and changes, and you can see who else is editing a topic.

Your permissions are determined by your [Microsoft Teams roles](/microsoftteams/assign-roles-permissions) in the team where your bot is created: 
- Team Members can create, view, edit and configure all bots in the team, unless otherwise specified.




## Collaborate on bots

In the **Topics** list, you can see who's working on a topic under the **Currently editing** column. You can hover or click on the person's icon to quickly chat with them in Teams or send them an email. 

This can help prevent conflicts if multiple people are working on the same topic.

![Screenshot showing the Power Virtual Agents list of topics with the Currently editing column highlighted](media/sharing-multi-authors-teams.png)

>[!NOTE]
>The list of authors in the **Currently editing** column is only refreshed when the page is loaded.

A topic's **Details** page also shows all the people currently editing a topic, as well as the last time someone saved.

![Screenshot of a topic's details page on the properties pane with the Modified by section on the right highlighted](media/sharing-multi-details-teams.png)

A list of who's editing the page also appears as user icons on the top of the authoring canvas when you've opened a topic for editing.

![Screenshot of a topic being edited with user profile pictures appearing on the top menu bar](media/sharing-multi-editing-teams.png)

After 30 minutes of inactivity you will not be identified as editing the topic.

Occasionally, multiple people might make changes to a topic and attempt to save their changes at the same time.

Power Virtual Agents will detect this and prevent you from overwriting your coworker by prompting you with an option - you can reload the content with the latest changes (discarding your work), or you can save a copy of the topic (keeping your changes in a new, duplicate copy of the topic). 

![Screenshot showing a prompt that says Updated content available and gives you options to discard your changes or save a copy](media/sharing-multi-conflict-teams.png)

If you save your changes to a new topic, you can then review your coworker's changes and merge the two topics, deleting the copy of the topic once you've finished.
