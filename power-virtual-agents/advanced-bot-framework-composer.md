---
title: "Extend you bot with Bot Framework Composer"
description: "Extend you bot with Bot Framework Composer"
keywords: "Bot Framework Composer"
ms.date: 11/06/2020
ms.service: power-virtual-agents
ms.topic: article
author: makolomi
ms.author: iawilt
manager: shellyha
ms.reviewer: pm-alias
ms.custom: "cex"
ms.collection: virtualagent
---

# Extend you bot with Bot Framework Composer
You can enhance your bot by developing custom dialogs using Bot Framework Composer tool and adding them to your Power Virtual agents bot.  Bot Framework Composer tool is integrated into Power Virtual Agents to allow developers and business users to build bots together.
Bot Framework Composer can extend your Power Virtual Agents bot with such Bot Framework functionality as Adaptive Dialogs, Language Generation (LG), Regular Expressions (RegEx), Adaptive Cards and more. 
Using Bot Framework Composer integrated with Power Virtual Agents, you will be able to access conversational memory and context, including the variables defined in Power Virtual Agents. You could create event-driven dynamic dialogs to handle interruptions, cancelations and context switching. Adding Adaptive Cards in Bot Framework Composer will enable you to display interactive elements like images and videos, forms and more in the bot. 
You can also use a variety of pre-build functions and expressions in Composer and define multiple variations of a phrase for the bot to select at random at runtime.
Custom dialogs added via Bot Framework Composer tool are deployed, hosted and executed together with the rest of Power Virtual Agents bot content and do not require any additional Azure hosting.

[!IMPORTANT]
Bot Framework Composer integration feature is not available to users who only have Teams Power Virtual Agents license. Bot Framework Composer integration feature is only included with a full Power Virtual Agents trial or Production license. 


## Prerequisites
[Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md)<br>
[Introduction to Bot Framework Composer](https://docs.microsoft.com/en-us/composer/introduction)

## Access Bot Framework Composer from Power Virtual Agents Topics page
1.	Go to the **Topics** tab for the bot you want to edit.
2.	Select the **Open in Bot Framework Composer (Preview)** button on the top menu.
![Open Composer from Topics page](media/Composer_OpeninBotFrameworkComposerButton_tooltip.png)
3.  Click on the button to open or download Bot Framework Composer.

## Download and Install Bot Framework Composer 
Using **Open in Bot Framework Composer (Preview)** will open a Bot Framework Composer info window in Power Virtual Agents. If you do not have Composer installed on your computer, you can do so from this window.
![Dowload Bot Framework Composer](media/OpenDownloadWiComposer_ndow.png)

Clicking on **download Composer** link will lead you to a **Download confirmation** window where you can learn more about Composer, an open source Bot Framework development studio that can be used to extend Power Virtual Agents with custom dialogs.
![Confirm Bot Framework Composer](media/Composer_DownloadConfirmWindow.png)

Click on **Download Composer** button to start the download process. After your download is complete, click on the downloaded file to start the installation:
![Start Installation for Bot Framework Composer](media/Composer_StartInstallComposer.png)

Go through the install wizard to install Bot Framework Composer on your computer:
![Bot Framework Composer Install Wizard Step 1](media/Composer_InstallWizardStep1.png)

Click **Next** to proceed with installation and select the location for Bot Framework Composer application. Then click on **Install** button to start the installation.
![Bot Framework Composer Install Wizard Step 2](media/Composer_InstallWizardStep2.png)

Unselect **Run Bot Framework Composer** button, since you will need to open Composer application from within Power Virtual Agents tobe able to use it with your bot. Then, click **Finish** button to close the installation wizard.
![Bot Framework Composer Install Complete](media/Composer_InstallWizardFinish.png)

Go back to Power Virtual Agents **Topics** page. You can now click on **Open in Bot Framework Composer (Preview)** button to open your Bot Framework Composer. 
![Open Bot Framework Composer](media/Composer_AfterDownload.png)



