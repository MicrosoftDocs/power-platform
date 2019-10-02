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

# First run experience

You can use Power Virtual Agents to create a powerful custom bot.

To help get you started and tailor the bot to your specific needs, Virtual Agent lets you create a bot using built-in content building blocks containing topics, trigger phrases, and pre-authored conversation paths. These built-in topics can also be useful as a model for building your own conversations for similar customer-support issues. For more information, see [Work with built-in topics](how-to-templates.md).

## To create your first bot

If you encounter an issue while creating your bot, see [Known issues with creating a bot](#known-issues-with-creating-a-bot).

1. Go to [aka.ms/virtual-agent](http://aka.ms/virtual-agent) and select **Get Started**. Sign in using your work account.

   ![Sign up screen](media/sign-up-screen.png)
    
   You are then presented with several license agreements and terms-of-service screens. When you agree to these terms, you are assigned licenses that allow you to access the product.
    
2. In the **Create a new bot** dialog box, you’ll name your bot. This can be something generic to your company or specific to the scenario you are tailoring your bot to.

   ![Create a new bot](media/create-new-bot.PNG)

   Your virtual agent is created in the default PowerApps environment that was created for you in the prior step. For most users, this is sufficient. However, if you want to specify a custom PowerApps environment for your virtual agent, you can do so by expanding the **More options** menu and selecting a different environment.
  
3. Once you select **Create**, the process for creating the first bot within a new environment can take up to 15 minutes. 

   ![Creating new bot screen](media/creating-bot-animation.png) 

   > [!NOTE]
   >
   > Explore some features of Power Virtual Agents while you are waiting:
   > - [Chat with a test bot](how-to-test-bot.md#work-with-the-test-bot-pane)
   > - [Trace your conversation in the authoring canvas](how-to-test-bot.md#to-trace-through-the-topics-conversation-path)
   > - [View and edit topics](getting-started-bot-designer.md#topics-page) (but not save them)
   > - [Watch product videos](virtual-agent-videos.md)
   
 4.	When the bot creation process completes, the banner changes. You now have full functionality in the bot and can modify topics, test your changes, or deploy your bot.

## Creating additional bots

If you have already created a bot, you can create a new bot by selecting the icon on the title bar to open the **Bots** pane and then selecting **New bot**.

   ![New bot icon in title bar](media/new-bot-icon.PNG)

## Known issues with creating a bot

When you are creating your bot, you might encounter the following issues.

### No read/write access to any environment

In this case, you see this error: “You do not have permissions to any environments. Please get access from an administrator.”

To resolve this issue, follow the steps in [To create a new PowerApps environment](getting-started-new-environment.md). Use that environment to create your bot.


### Insufficient permissions for the selected environment

If an user selects an environment that they have insufficient access to, they get the following error: “An unexpected server error occurred. Please retry creating your bot.”

To resolve this issue, create a new environemnt. To learn how follow the steps in [the environment overview article](environments-fundamentals-virtual-agent.md). Use that environment to create your bot.

### The PowerApps environment I created does not show up in the drop-down menu of Virtual Agent

Your environment might not show up in the drop-down menu due to one of the following:
 - The environment doesn't have a database created. To resolve this, go to [admin.powerapps.com](https://admin.powerapps.com) to create a database in your environment.
 - The environment is created in an unsopported region. See the list of [supported regions](requirements-geographic-virtual-agent.md).
