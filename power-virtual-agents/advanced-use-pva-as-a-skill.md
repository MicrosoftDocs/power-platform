---
title: "Use Power Virtual Agents bot as a skill"
description: "Use Power Virtual Agents bot as a skill for Bot Framework bots."
keywords: "composer, skills, bot framework"
ms.date: 
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Use Power Virtual Agents bot as a skill

You can use your Power Virtual Agents bot as a [skill](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0) with Bot Framework bots. 

If you already have Bot Framework bots in your organization, you can call a Power Virtual Agents bot as a skill from within your Bot Framework bots.


When you add a Power Virtual Agents bot as a skill, the Bot Framework bot will determine if anything the bot user says matches [with any of the trigger phrases in the Power Virtual Agent's bot](authoring-create-edit-topics.md). 

If there is a match, the Bot Framework bot will invoke the Power Virtual Agents bot and pass the entire user utterance to it to extract any [entities](advanced-entities-slot-filling.md) and trigger a matching Power Virtual Agents topic.

>[!NOTE]
>This article is intended for system administrators or IT professionals who are familiar with [Bot Framework skills](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0&preserve-view=true).

>[!IMPORTANT]
>This feature is not available with the [Teams Power Virtual Agents license](requirements-licensing-subscriptions.md).  
>You must have a [trial](sign-up-individual.md) or full Power Virtual Agents license.

To set up your Power Virtual Agents bot as a skill:

1. You add the Bot Framework bot to the allowlist for the Power Virtual Agents bot.
2. You download the skill manifest for the Power Virtual Agents bot.
3. You use the downloaded skill manifest in Bot Framework Composer to create a connection between the bots.
3. You test the bot works as a skill by using the Bot Framework Emulator.

## Prerequisites

- [Understand how Bot Framework skills work](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0) 
- [Learn how to use Bot Framework Composer](/composer/introduction)
- [Learn how to use skills in Bot Framework Composer](/composer/concept-skills)
- [Get your Bot Framework bot's app ID](/azure/bot-service/bot-service-manage-overview#get-azure-bot-resource-app-id)
- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Add your Bot Framework bot to the allowlist for your Power Virtual Agents bot


You have to add the Bot Framework bot's app ID to the allowlist for the Power Virtual Agents bot that you want to use as a skill.

The Bot Framework and Power Virtual Agents bots must be deployed in the same tenant.

1. In Power Virtual Agents, expand the **Manage** section on the side navigation pane for the bot you want to use as a skill, and go to the **Skills** tab.

2. Select **Manage allowlist** on the top menu bar.

    :::image type="content" source="media/PVA-as-a-skill/Skill_ManageAllowlistMenu.png" alt-text="Screenshot highlighting the Manage, Skills, and Manage allowlist elements in the web portal.":::

    >[!TIP]  
    >You can also get to your bot's allowlist by going to the **Security** tab under **Manage** on the side navigation pane.
    >
    >:::image type="content" source="media/PVA-as-a-skill/Skill_ManageAllowlistSecurity.png" alt-text="Screenshot of the allowlist tile on the Security or Authentication page.":::

3. Select **+ Add allowed caller** on the **Manage allowlist for \<bot name\>** panel.

    :::image type="content" source="media/PVA-as-a-skill/Skill_AddAllowedCallers.png" alt-text="Highlight of the Add allowed called button at the top of the Manage allowlist flyout panel.":::


4. Enter your Bot Frameworks bot's [app ID](/azure/bot-service/bot-service-manage-overview#get-azure-bot-resource-app-id) and select **Next**.

    :::image type="content" source="media/PVA-as-a-skill/Skill_AddBotAppID.png" alt-text="Screenshot of the Add allowed caller dialog window.":::


    >[!CAUTION]  
    >Power Virtual Agents cannot act as a skill for other Power Virtual Agents bots. 
    >
    >Only Bot Framework bots can be added to the Power Virtual Agents allowlist. Trying to add a bot app ID that belongs to a Power Virtual Agent bot will result in an error.



    Power Virtual Agents will validate the Bot Framework bot's app ID and confirm that it belongs to a bot deployed in the same tenant. 

5. You can optionally add a **Display name** for the bot you've added.

    :::image type="content" source="media/PVA-as-a-skill/Skill_AllowedCallerDisplayName.png" alt-text="Add a display name for the bot on the allowlist.":::

6. Select **Save** to add your bot to the allowlist.


The Bot Framework bot will be displayed by the **Dispaly name** (if you entered one) or by its **App ID**. You can **Delete** or **Edit** it at any time from the **Manage allowlist for \<bot name\>** panel.

:::image type="content" source="media/PVA-as-a-skill/Skill_AllowedCallerAdded.png" alt-text="The manage allowlist panel showing a list of allowed bot.":::



## Download the bot skill manifest for your Power Virtual Agents bot


Bot Framework bots can use a Power Virtual Agents skill manifest to configure a connection to the bot that produced the manifest. 

All Power Virtual Agents bots have skill manifests, which are JSON files that describes a skill's name, interface, and trigger phrases.

By using the manifest, the Bot Framework bot will know when to trigger the Power Virtual Agents bot (for example, in response to something a user says to the bot).

Power Virtual Agents skill manifests are implemented according to [version 2.2 of the Bot Framework skill manifest schema](/azure/bot-service/skills-write-manifest#the-skill-manifest).

When a Bot Framework bot decides, based on the manifest data, that what the user said should be handled by a Power Virtual Agents bot, it will pass the entire user utterance to it. Then, the Power Virtual Agents bot's own NLU will match this user utterance [to a Power Virtual Agents topic](authoring-create-edit-topics.md), extract any [entities needed for slot-filling](advanced-entities-slot-filling.md) and trigger the Power Virtual Agents topic.


All Power Virtual Agents skill manifests are automatically generated and updated. A Power Virtual Agents bot has two skill manifests: 

- **Test manifest**: Allows the Bot Framework bot to connect to the test version of your Power Virtual Agents bot. You can use the test manifest to validate changes in your skill before publishing it.  
    - The test manifest is immediately available for every newly created Power Virtual Agents bot.  
    It is automatically updated to reflect the changes every time you **save** bot content. 

- **Published manifest**: Allows the Bot Framework bot to connect to the published version of your Power Virtual Agents bot.  
    - The published manifest is only available for Power Virtual Agents bots that have been published at least once.  
    - It is automatically updated to reflect the changes every time you [**publish** your bot](publication-fundamentals-publish-channels.md#publish-the-latest-bot-content).


>[!NOTE]
> The **Published manifest** is not available in Power Virtual Agents bots that have never been **Published**.  To generate your bot's **Published manifest**, your need to [publish your Power Virtual Agents bot](https://docs.microsoft.com/en-us/power-virtual-agents/publication-fundamentals-publish-channels). 

Both Power Virtual Agents bot's skill manifests can be found on **Manage allowlist** panel.
![Power Virtual Agents bot Manifests on Manage Allowlist panel](media/PVA-as-a-skill/Skill_Manifest1.png)

Additionally, you can find Power Virtual Agents bot's skill manifests on **Details** page under **Manage** tab along other bot's metadata like **Environment ID**, **Tenant ID** and **Bot app ID**.
![Power Virtual Agents bot Manifests on Details page](media/PVA-as-a-skill/Skill_Manifest2.png)

Click the buttons to download **Test manifest** or **Published manifest** as .zip archives.

![Power Virtual Agents - Downloaded Test and Published Manifests](media/PVA-as-a-skill/Manifests_Zip.png)

**Test manifest** and **Published manifest** follow [version 2.2](https://docs.microsoft.com/en-us/azure/bot-service/skills-write-manifest?view=azure-bot-service-4.0&tabs=v2-2) of Bot Framework skill manifest schema and consist of **intents.lu** and **manifest.json** files.

![Power Virtual Agents skill manifest files](media/PVA-as-a-skill/Manifests_Files.png)

>[!NOTE]
> **System Topics** and Composer **dialogs** added to Power Virtual Agents bot will not be included in skill manifest. Only user-created **Topics** and Coposer **intent triggers** added to the bot will be added to Power Virtual Agents bot skill manifest.

## Connect to a Power Virtual Agents skill in Composer

You can use the Power Virtual Agents bot skill **Test manifest** or **Published manifest** that you have downloaded in a .zip archive to create a skill connection in your Bot Framework bot in Composer.

In Bot Framework Composer project, use **+ Add** button and choose **Connect to a skill** menu option.

![Composer - connect Bot Framewok bot to a skill](media/PVA-as-a-skill/Composer_ConnectToSkill.png)

On **Add a skill** screen, select a Power Virtual Agents manifest .zip archive and press **Next**.

![Composer - select a Power Virtual Agents skill zip archive](media/PVA-as-a-skill/Composer_AddSkillZip.png)

Select what Power Virtual Agents bot skill's Topics you want to add to your Bot Framework bot and press **Next**.

![Composer - select a Power Virtual Agents Topics](media/PVA-as-a-skill/Composer_SelectTopics.png)

Review and edit your Power Virtual Agents bot skill's Trigger Phrases and press **Next**.

![Composer - edit trigger phrases](media/PVA-as-a-skill/Composer_EditTriggerPhrases.png)

Make sure the **Orchestrator** option is checked and press **Continue**.

![Composer - enable Orchestrator](media/PVA-as-a-skill/Composer_Orchestrator.png)

Verify that Power Virtual Agents skill is added to your Bot Framework bot correctly and a new **trigger** with your Power Virtual Agents bot's name is added to the project in Composer.
![Composer - Power Virtual Agents skill added](media/PVA-as-a-skill/Composer_PVASkillAdded.png)


>[!IMPORTANT]
>Your Bot Framework bot must be added to the Power Virtual Agents bot's **Allowlist** for the skill connection to work.

## Test Power Virtual Agents bot as a skill with a Bot Framework bot
You can test your Bot Framework bot calling a Power Virtual Agents bot as a skill by using [Emulator](https://docs.microsoft.com/en-us/composer/how-to-connect-to-a-skill?tabs=v2x#test-in-the-emulator).

Please make sure that your Bot Framework bot **App ID** is added to the Power Virtual Agents bot's **Allowlist** of your Power Virtual Agents bot first before testing. You can find your Bot Framework bot's **App ID** by going to **Configure** tab and selecting **Development Resources** section in Composer. 

![Composer - Bot App ID](media/PVA-as-a-skill/Composer_BotAppID.png)

## Learn More

To learn more about developing in Bot Framework Composer and using skills, see these resources:
- [Skills overview](https://docs.microsoft.com/en-us/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0)
- [Skills manifest](https://docs.microsoft.com/en-us/azure/bot-service/skills-write-manifest?view=azure-bot-service-4.0&tabs=v2-2)
- [Bot Framework Composer documentation](/composer/) 
- [Skills in Composer](https://docs.microsoft.com/en-us/composer/concept-skills)
- [Connect to a remote skill in Composer](https://docs.microsoft.com/en-us/composer/how-to-connect-to-a-skill?tabs=v2x)
- [Test your skill in Emulator](https://docs.microsoft.com/en-us/composer/how-to-connect-to-a-skill?tabs=v2x#test-in-the-emulator)


[!INCLUDE[footer-include](includes/footer-banner.md)]
