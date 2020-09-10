---
title: "Share chatbots with other users in Teams"
description: "Share Power Virtual Agents chatbots with other people in your group.
keywords: "Administration, share, multi-author, PVA, teams"
ms.date: 9/9/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "multi-author, admin, ceX, teams"
ms.collection: virtual-agent
---

# Share and publish your bot so other people can use it

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Web service (https://powerva.microsoft.com)](../admin-share-bots.md)
> - [Teams (online or app)](admin-share-bots-teams.md)


After you've built a bot, you'll want people to use it.

The first step is to publish the bot, this makes it available to everyone in your orgnization as an app that they can find in the Teams app store.

You can customize the way the bot looks on the Teams app store, and you can look at how other people have built their bots.





## Publish a bot

When you publish a bot, you make it available for people in your organization to install it into their Teams. Whenever you make updates to your bot and publish it, those updates will be reflected in everyone's copy of the bot.

>[!IMPORTANT]
>Make sure to **Publish** your bot if you make changes - otherwise everyone that is using the bot won't see your updates.  
>It typically takes 15 minutes for published changes to be seen by everone.


:::image type="content" source="media/" alt-text=" ":::
publish-share-to-store:::image type="content" source="media/" alt-text=" ":::


:::image type="content" source="media/publish-share-to-store.png" alt-text=" ":::



1. Go to the **Chatbot** tab.

    :::image type="content" source="media/publish-chatbot-tab-on-homepage.png" alt-text="Alt text here.":::

3. Open the bot you want to publish.
3. On the bot's homepage, select **Publish bot**. Select **Publish** and then **Publish** again.

    :::image type="content" source="media/publish-option.png" alt-text="Alt text here.":::


4. Select **Open the bot** to have it go to the Teams app store, where it will automatically find and open the bot you just created. Click **Add for me** to have it added as an app in Teams. Note that this only shows the bot for you.


5. Select **Make the bot available to others** if you want to share it with other people.

    This pops up a new window where you can customize how the bot will be shown to people searching for it on the Teams app store. 
    You can also get a link to share directly with other people who want to use this bot: just select **Copy link**.

6. Select **Edit details** to change the bot's icon, color, and descriptions. These will be shown in the search results in the Teams app store.

    :::image type="content" source="media/publish-share-to-store.png" alt-text=" ":::

7. Select **More** to add additional information. We filled this with defaults but you should use your own:  
    - Developer name  
    - Website
    - Privacy Statement
    - Terms of use

  See the [Privacy statement and terms of use](publication-terms-of-use-teams.md) topic for more details and examples.

8. Select Save to return to screen where you can make your bot available in Teams. You'll see your updates to the color, icon, and description are shown.
9. Select **Make available in Teams** and then choose who can find and use your bot. By default this is everyone on your team. You can also go to the security settings to make additional changes.

This allows other people in your Team to use your bot - but they can't edit or change the topics or answers. They can add the bot as an app by searching for it in the Teams app store, and they can see the list of topics and analytics for the bot, but they won't be able to edit anything.

>[!WARNING]
> or can they? can they only choose between team and org?


 
 >[!WARNING]
 >Are Automate flows still special here, or will they be shared?

### Share Power Automate flows used in a bot
You can [add actions to a bot using flows in Power Automate](advanced-flow-teams.md); however flows in a bot aren't automatically shared with other users when sharing a bot. 

Users who don't have access to the shared flow can still run it by using the test bot canvas.

To let other users edit or add flows you'll need to share them in Power Automate. You can open flows directly from the topic where the flow is used.

1. Select **View flow details** to go to the flow's details page in Power Automate.
 
    ![Highlight of the view flow details on a flow in a topic](media/sharing-view-flow-details-teams.png)

2. Select **Edit** in the **Owners** section.
 
    ![Select the Edit link](media/sharing-flow-owners-teams.png)

3. Enter the name or email address of the user you want to give editing permissions to.


>[!WARNING]
>How do I unshare or unpublish a bot?

## Stop sharing a bot

You can stop sharing a bot with a user, and any shared user can stop the bot from being shared with other users, except for the owner. The owner will always have access to the bot.

1. Sign in to Power Virtual Agents and select **Share** at the top of the bot's home page.

2. Select **X** next to the users that you want to stop sharing the bot with.
 
    ![Remove bot access ‘X’](media/sharing-remove-user-teams.png) 

3. Select **Share** to stop sharing the bot with the user.



>[!WARNING]
>Does collaboration work - similar to question above about how other team memebers can interact with my bot. Note we still have a 'currently editing' columm in the topics list.

## Collaborate on bots

After you've shared a bot, everyone can edit the bot's topics. 

In the **Topics** list, you can see who's working on a topic under the **Currently editing** column. You can hover or click on the person's icon to quickly chat with them in Teams or send them an email. 

This can help prevent conflicts if multiple people are working on the same topic.

![Screenshot showing the Power Virtual Agents list of topics with the Currently editing column highlighted](media/sharing-multi-authors-teams.png)

>[!NOTE]
>The list of authors in the **Currently editing** column is only refreshed when the page is loaded.

A topic's **Properties** page also shows all the people currently editing a topic, as well as the last time someone saved.

![Screenshot of a topic's details page on the properties pane with the Modified by section on the right highlighted](media/sharing-multi-details-teams.png)

A list of who's editing the page also appears as user icons on the top of the authoring canvas when you've opened a topic for editing.

![Screenshot of a topic being edited with user profile pictures appearing on the top menu bar](media/sharing-multi-editing-teams.png)

If an author does not make any changes to the topic, or disconnects their computer or closes the browser window, they are considered to have abandoned the topic. After 30 minutes of inactivity the user will not be identified as editing the topic.

Occasionally, multiple people might make changes to a topic and attempt to save their changes concurrently. For example, you might open and start editing a topic. Your coworker opens the same topic, makes a small change, and saves it. Then, when you've finished editing the topic, you go to save it, only to find yourself in a conflict state.

Power Virtual Agents will detect this and prevent you from overwriting your coworker by prompting you with an option - you can reload the content with the latest changes (discarding your work), or you can save a copy of the topic (keeping your changes in a new, duplicate copy of the topic). 

![Screenshot showing a prompt that says Updated content available and gives you options to discard your changes or save a copy](media/sharing-multi-conflict-teams.png)

If you save your changes to a new topic, you can then review your coworker's changes and merge the two topics, deleting the copy of the topic once you've finished.
