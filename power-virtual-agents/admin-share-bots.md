---
title: ""
description: ""
keywords: "Administration, share, multi-author"
ms.date: 7/7/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "multi-author, admin, ceX"
ms.collection: virtual-agent
---

# Share your bot with other users
You can share your bot with other users to allow them to edit and manage your bot.  This allows multiple users to collaborate together in a bot.
>[!NOTE]
>You don’t need to share a bot with another user for them to chat with the bot.  Learn more on how to make the bot available for user to chat with it at [Key concepts – Publish your bot]().
## Share a bot
1. To share a bot, sign into Power Virtual Agents and at click on the Share button on the top right corner of the bot Home
![](media/IMAGE.png)
 
![](media/IMAGE.png)
2. Specify the name or email address of the users that you would like to share the bot with.  
**Note**
You cannot share a bot with a security group or distribution group in your organization.  You cannot share with users or group outside of your organization.
**Note**
 
![](media/IMAGE.png)
share panel with name input
3. Review the user’s permission.  
 
![](media/IMAGE.png)
view user’s permission
4. If you want to let the users know you have shared the bot with them.  Select the Send an email invitation to new users check box.
5. Select Share to share the bot with the new users.
Everyone you share the bot with can view, edit, configure, share and publish the bot.  They cannot delete the bot.
**Note**
You can only share the bot with users who have Power Platform licenses.  You can learn more at [Power Virtual Agents license]() and [licensing overview for Power Platform]().
**Note**
### Insufficient environment permission
If the specified user does not have sufficient environment permission, you will need to contact the System administrator of the environment to assign Environment maker security role to the user prior sharing the bot.
 
//screenshot – user does not have sufficient permission.
### Share Power Automate flows used in bot
Power Automate is a powerful tool to allow bot to take actions.  Learn more about [add actions to a bot using Power Automate]() on how to add a flow to your bot.  Flows in a bot is not automatically shared with other users when sharing a bot.  Users who do not have flow shared with them can continue to run flows by chatting with the bot in test bot canvas.
If you want to allow other users to edit or add flows in topics you uses in the bot, you will need to share it at Power Automate.  
1. Go to the flow detail of flows that are added to the bot’s topic by clicking on view flow details on the flow you used in your topic.
 
![](media/IMAGE.png)

2. Select Edit in the Owners section
 
![](media/IMAGE.png)

3. Enter names or email address of the user you want to allow adding the flow to the bot and editing the flow
## Stop sharing a bot
You can stop sharing a bot with user.  Any shared user can stop the bot from being shared with other user except for the owner.  Owner will always have access to the bot.
1. Select Share button on your bot’s Home in Power Virtual Agents.
2. Select ‘X’ on users that you want to stop sharing the bot with.
 
//Screenshot – remove bot access ‘X’
3. Select Share to stop sharing the bot with the user
## Environment security roles
User in an environment must have Environment maker security role before they can be shared with a bot.  Learn more about [security roles]() and [predefined security roles]().
### Prerequisites
You must be a System administrator of the environment where the bot is in to view and add security roles in the bot sharing UI.
**Note**
The Environment security roles section in bot sharing UI allows System administrator to share bots with users who do not have sufficient Environment permission to use Power Virtual Agents.  For full security role management experience, please visit Power Platform Admin Center. 
**Note**
### Assigning security role during bot sharing
You can assign a security role to user when sharing a bot with user who does not have sufficient environment permission to run Power Virtual Agents.
1. Specify the name or email address of the users that you would like to share the bot with.  
2. If the specified user does not have sufficient permission to use Power Virtual Agents in the environment, a notice bubble will notify you that Environment Maker security role will be assigned to user when sharing the bot.
 
//Screenshot – share panel with permission notice bubble 
3. Select Share to share the bot with the new users.  
### Conversation transcript access
You can assign Bot transcript viewer security role to users who do not have end user conversation transcript access when sharing a bot.  Depending on the content nature and target audience of the bot, you may want to only allow users who have appropriate privacy training to access conversation transcripts. 
**Important**
Conversation transcript access is managed by environment security roles.  After assigning Bot transcript viewer security role to user, the user can access conversation transcripts for all bots that they create or are shared with in the environment.  In default environment, every user by default has Bot transcript viewer assigned.  It is recommended to create an environment for bots that controls which user can view conversation transcripts.
**Important**
1. Specify the name or email address of the users that you would like to share the bot with.  You can also select a user who has already been shared with.
2. If the specified user does not have permission to access conversation transcript, you can assign Bot transcript viewer security role when sharing the bot with the user.
 
//Screenshot – Assigning Bot transcript viewer security role
3. Select Share to share the bot with the new user and allow them to access conversation transcript.  
### Manage security roles
To manage environment security role, go to [Power Platform admin center]().  You can assign, remove, and customize security roles for user.  
1. Go to Power Platform admin center
2. Select Environments on the left nav bar
 
![](media/IMAGE.png)

3. Select the environment that you want to manage security role
4. Select Settings on the top action bar
5. Expand User + permissions and select Users
 
![](media/IMAGE.png)

6. Select the user that you want to manage security role
7. Select Manage roles on the top action bar
8. Assign or remove security roles of the user
 
![](media/IMAGE.png)

## Known limitation
1. It can take up to 10 minutes for the bot to show up in the shared user’s bot list if the user was not previously part of an environment
