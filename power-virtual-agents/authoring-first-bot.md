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

# Creating the first bot

To help get you started and tailor the bot to your specific needs, Power Virtual Agents lets you create a bot using built-in content building blocks containing topics, trigger phrases, and pre-authored conversation paths.

## To create your first bot

1. Go to [aka.ms/virtual-agent](http://aka.ms/TryPVA) and select **Try Preview**. Sign in using your work account.

   If you don't have a license, you will sign up for one using the guided wizard like experience.
    
2. In the **Create a new bot** dialog box, you’ll name your bot. This can be something generic to your company or specific to the scenario you are tailoring your bot to.

   ![New bot dialog](media/create_new_bot.jpg)

   Your virtual agent is created in the default PowerApps environment. For most users, this is sufficient. However, if you want to specify a custom PowerApps environment for your virtual agent, you can do so by expanding the **More options** menu and selecting a different environment. To learn more about environments read the [PowerApps environment overview](environments-first-run-experience.md) documentation.
  
3. Once you select **Create**, the process for creating the first bot within a new environment can take up to 15 minutes. 

   > [!NOTE]
   >
   > If you are the first user in an environment creating a bot, it can take up to 15 minutes to finish the creation.
   
 4.	When the bot creation process completes, you will be informed in the application via the notification banner. You now have full functionality in the bot and can modify topics, test your changes, or deploy your bot.
 

## Creating additional bots

If you have already created a bot, you can create a new bot by selecting the icon on the title bar to open the **Bots** pane and then selecting **New bot**.

   ![New bot icon in title bar](media/new-bot-icon.png)

## Known issues with creating a bot

When you are creating your bot, you might encounter the following issues.

### Insufficient permissions for the selected environment

In this case, you see this error: “You do not have permissions to any environments. Please get access from an administrator.”

You will need to create a new environment (read article on [working with environments](environments-first-run-experience.md). Use that environment to create your bot.

### The environment I created does not show up in the drop-down menu of Virtual Agent

Your environment might not show up in the drop-down menu due to one of the following:
 - The environment doesn't have a database created. To resolve this, go to [admin.powerplatform.com](https://admin.powerplatform.com) to create a database in your environment.
 - The environment is created in an unsupported region. Learn more about [supported data locations](https://go.microsoft.com/fwlink/?linkid=2106441).
