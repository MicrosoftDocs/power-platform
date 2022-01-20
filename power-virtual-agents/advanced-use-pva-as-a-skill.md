---
title: "Use a Power Virtual Agents bot as a skill in Bot Framework bots"
description: "Call a Power Virtual Agents bot from within a Bot Framework bot's session when a user says something that matches the bot's trigger phrases."
keywords: "composer, skills, bot framework"
ms.date: 01/13/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Use a Power Virtual Agents bot as a skill

You can use your Power Virtual Agents bot as a [skill](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0&preserve-view=true) with Bot Framework bots. 

When you add a Power Virtual Agents bot as a skill, the Bot Framework bot will determine if anything the bot user says matches [with any of the trigger phrases in the Power Virtual Agents bot](authoring-create-edit-topics.md). 

If there is a match, the Bot Framework bot will invoke the Power Virtual Agents bot with the entire user utterance. The Power Virtual Agents bot will extract any [entities](advanced-entities-slot-filling.md) then trigger the matching topic.

Additionally, from a Bot Framework bot, you can invoke a Power Virtual Agents bot's topic with inputs and utilize the outputs it returns.

> [!IMPORTANT]
> Using Power Virtual Agents bots as a skill is not available with the [Teams Power Virtual Agents license](requirements-licensing-subscriptions.md).  
> You must have a [trial](sign-up-individual.md) or full Power Virtual Agents license.

To set up your Power Virtual Agents bot as a skill:

1. [Add the Bot Framework bot to the allowlist for the Power Virtual Agents bot](#add-your-bot-framework-bot-to-the-allowlist-for-your-power-virtual-agents-bot).
2. [Download the skill manifest for the Power Virtual Agents bot](#download-the-bot-skill-manifest-for-your-power-virtual-agents-bot).
3. [Use the downloaded skill manifest in Bot Framework Composer to create a connection between the bots](#connect-to-a-power-virtual-agents-skill-in-composer).
3. [Test the bot works as a skill by using the Bot Framework Emulator](#test-your-power-virtual-agents-bot-as-a-skill-with-a-bot-framework-bot).

## Prerequisites

- An [Orchestrator bot](/composer/how-to-create-orchestrator-bot) created in Composer. LUIS and RegEx recognizers are not supported.
- [Understand how Bot Framework skills work](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0&preserve-view=true) 
- [Learn how to use Bot Framework Composer](/composer/introduction)
- [Learn how to use skills in Bot Framework Composer](/composer/concept-skills)
- [Get your Bot Framework bot's app ID](/azure/bot-service/bot-service-manage-overview#get-azure-bot-resource-app-id)
- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Add your Bot Framework bot to the allowlist for your Power Virtual Agents bot


Add the Bot Framework bot's app ID to the allowlist for the Power Virtual Agents bot that you want to use as a skill.

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

    >[!TIP]
    >You can find your Bot Framework bot's app ID in Composer, in the **Development Resources** section under the **Configure** tab.  
    >  
    >:::image type="content" source="media/PVA-as-a-skill/Composer_BotAppID.png" alt-text="Composer - Bot App ID.":::


    >[!CAUTION]  
    >Power Virtual Agents cannot act as a skill for other Power Virtual Agents bots. 
    >
    >Only Bot Framework bots can be added to the Power Virtual Agents allowlist. Trying to add a bot app ID that belongs to a Power Virtual Agent bot will result in an error.



    Power Virtual Agents will validate the Bot Framework bot's app ID and confirm that it belongs to a bot deployed in the same tenant. 

5. You can optionally add a **Display name** for the bot you've added.

    :::image type="content" source="media/PVA-as-a-skill/Skill_AllowedCallerDisplayName.png" alt-text="Add a display name for the bot on the allowlist.":::

6. Select **Save** to add your bot to the allowlist.


The Bot Framework bot will be displayed by the **Display name** (if you entered one) or by its **App ID**. You can **Delete** or **Edit** it at any time from the **Manage allowlist for \<bot name\>** panel.

:::image type="content" source="media/PVA-as-a-skill/Skill_AllowedCallerAdded.png" alt-text="The manage allowlist panel showing a list of allowed bot.":::

>[!Note]
>The Bot Framework bots added to the allowlist will not be [exported as part of the bot content](authoring-export-import-bots.md). 

## Download the bot skill manifest for your Power Virtual Agents bot


Bot Framework bots can use a Power Virtual Agents skill manifest to configure a connection to the bot that produced the manifest. 

All Power Virtual Agents bots have skill manifests, which are JSON files that describe a skill's name, interface, and trigger phrases.

By using the manifest, the Bot Framework bot will know when to trigger the Power Virtual Agents bot (for example, in response to something a user says to the bot).

Power Virtual Agents skill manifests are implemented according to [version 2.2 of the Bot Framework skill manifest schema](/azure/bot-service/skills-write-manifest#the-skill-manifest) and consist of *intents.lu* and *manifest.json* files.

When a Bot Framework bot decides, based on the manifest data, that what the user said should be handled by a Power Virtual Agents bot, it will pass the entire user utterance to it. Then, the Power Virtual Agents bot's own NLU will match this user utterance [to a Power Virtual Agents topic](authoring-create-edit-topics.md), extract any [entities needed for slot-filling](advanced-entities-slot-filling.md), and trigger the Power Virtual Agents topic.


All Power Virtual Agents skill manifests are automatically generated and updated. A Power Virtual Agents bot has two skill manifests: 

- **Test manifest**: Allows the Bot Framework bot to connect to the test version of your Power Virtual Agents bot. You can use the test manifest to validate changes in your skill before publishing it.  
    - The test manifest is immediately available for every newly created Power Virtual Agents bot.  
    - It is automatically updated to reflect the changes every time you **save** bot content. 

- **Published manifest**: Allows the Bot Framework bot to connect to the published version of your Power Virtual Agents bot.  
    - The published manifest is only available for Power Virtual Agents bots that have been published at least once.  
    - It is automatically updated to reflect the changes every time you [**publish** your bot](publication-fundamentals-publish-channels.md#publish-the-latest-bot-content).

>[!NOTE]
> The **Published manifest** is not available in Power Virtual Agents bots that have never been published.  
>  
>To generate your bot's **Published manifest**, your need to [publish your Power Virtual Agents bot](publication-fundamentals-publish-channels.md). 

Both skill manifests can be found on **Manage allowlist** panel.

:::image type="content" source="media/PVA-as-a-skill/Skill_Manifest1.png" alt-text="Power Virtual Agents bot Manifests on the Manage Allowlist panel.":::

Additionally, you can find the skill manifests on the **Details** tab under the **Manage** section on the side navigation pane. The **Details** tab shows other metadata like **Environment ID**, **Tenant ID**, and **Bot app ID**.

:::image type="content" source="media/PVA-as-a-skill/Skill_Manifest2.png" alt-text="Power Virtual Agents bot Manifests on Details page.":::

Selecting either manifest will download them as a .zip file labeled *\<bot name\>_manifest* for the **Published manifest** or *\<bot name\>_test__manifest* for the **Test manifest**.

:::image type="content" source="media/PVA-as-a-skill/Manifests_Zip.png" alt-text="Power Virtual Agents - Downloaded Test and Published Manifests.":::

>[!NOTE]
> System topics and Composer dialogs added to a Power Virtual Agents bot will not be included in the skill manifest. Only user-created topics and Composer intent triggers added to the bot will be added to the Power Virtual Agents bot skill manifest.

## Connect to a Power Virtual Agents skill in Composer

You can use Power Virtual Agents bot skill manifests to create a skill connection in your Bot Framework bot in Composer:

1. In a Bot Framework Composer project, select **+ Add** and then **Connect to a skill**.

    :::image type="content" source="media/PVA-as-a-skill/Composer_ConnectToSkill.png" alt-text="Composer - connect Bot Framework bot to a skill.":::

2. On the **Add a skill** screen, select a Power Virtual Agents manifest .zip archive and then **Next**.

    :::image type="content" source="media/PVA-as-a-skill/Composer_AddSkillZip.png" alt-text="Composer - select a Power Virtual Agents skill zip archive.":::

3. Select what Power Virtual Agents bot skill's topics you want to add to your Bot Framework bot and select **Next**.

    :::image type="content" source="media/PVA-as-a-skill/Composer_SelectTopics.png" alt-text="Composer - select a Power Virtual Agents Topics.":::

4. Review and edit your Power Virtual Agents bot skill's trigger phrases and select **Next**.

    :::image type="content" source="media/PVA-as-a-skill/Composer_EditTriggerPhrases.png" alt-text="Composer - edit trigger phrases.":::

5. Make sure the **Orchestrator** option is checked and select **Continue**.

    :::image type="content" source="media/PVA-as-a-skill/Composer_Orchestrator.png" alt-text="Composer - enable Orchestrator.":::

6. Verify that the Power Virtual Agents skill is added to your Bot Framework bot correctly and a new trigger with your Power Virtual Agents bot's name is added to the project in Composer.

    :::image type="content" source="media/PVA-as-a-skill/Composer_PVASkillAdded.png" alt-text="Composer - Power Virtual Agents skill added.":::


### Locate a Power Virtual Agents topic's event activity name

When calling specific topics from Composer, you'll need to refer to the topic by its event activity's name. 

**To find the event activity's name for a Power Virtual Agents bot topic:**

1. Select the **Connect to a Skill** action.

1. In the properties pane under **Skill Dialog Name** select **Show skill manifest**.
   
    :::image type="content" source="media/PVA-as-a-skill/SelectSkillManifest.png" alt-text="Show skill manifest":::
   
1. Locate the property named **activities**. This property will contain nested properties representing the topics available from your Power Virtual Agents bot.

    :::image type="content" source="media\PVA-as-a-skill\manifest-activities.png" alt-text="Show skill manifest":::
   
1. Locate the respective property of the topic you're looking for.
   
1. The topic property will contain the nested property **name** which is the topic's event activity name. In this example, the event activity name is `dispatchTo_new_topic_87609dabd86049f7bc6507c6f7263aba_33d`.

    :::image type="content" source="media/PVA-as-a-skill/SelectPVATopicName.png" alt-text="Select Power Virtual Agents topic name from the manifest.":::


### Call a Power Virtual Agents skill topic
You can directly call any Power Virtual Agents skill topic from a Bot Framework bot instead of relying on a user utterance to trigger it. Only the Power Virtual Agents topics that are listed in skill manifest can be directly invoked from your Bot Framework bot.


**To call a Power Virtual Agents skill topic:**

1. In the Composer authoring canvas select **+ Add**. Select **Access external resources**, then **Connect to a skill**.

    :::image type="content" source="media/PVA-as-a-skill/ConnectToSkill.png" alt-text="Composer - connect to a skill.":::

1. [Locate the event activity's name for your Power Virtual Agents bot topic](#locate-a-power-virtual-agents-topic-activity-name) you want to call. Copy the value (without quotes) and save it to use in the next steps.
    
1. Select **Close** to close the manifest window.
   
1. In the **Connect to a skill** panel under the **Activity** section, then select **Show code**.
   
    :::image type="content" source="media/PVA-as-a-skill/ActivityShowCode.png" alt-text="Select Show Code option in Activity panel.":::
  
1. Add the following code and replace `TOPIC_ACTIVITY_NAME` with your topic's event activity name. Make sure there are no quotes in the **name** property. 
   
    ```
    [Activity
        type = event
        name = TOPIC_ACTIVITY_NAME
    ]
    ```
    
    :::image type="content" source="media/PVA-as-a-skill/ActivityWithTopicName.png" alt-text="Add Activity event with Power Virtual Agents topic name to Show Code window. ":::
    
### Pass an input variable to a Power Virtual Agents skill topic 
It is possible to pass a variable to a Power Virtual Agents skill topic as an input from Bot Framework Composer. Refer to [Passing variables between topics](/authoring-create-edit-topics#passing-variables-between-topics) to learn how to create Power Virtual Agents topics that accept input variables.

If you have a Power Virtual Agents topic that can receive an input variable listed in your skill manifest, you can pass a Composer variable to it.

**Pass an input variable to a Power Virtual Agents skill topic:**

1. In the Composer authoring canvas select **+ Add**. Select **Access external resources**, then **Connect to a skill**.

    :::image type="content" source="media/PVA-as-a-skill/ConnectToSkill.png" alt-text="Composer - connect to a skill.":::

1. [Locate the event activity's name for your Power Virtual Agents bot topic](#locate-a-power-virtual-agents-topic-activity-name) you want to call. Copy the value (without quotes) and save it to use in the next steps.
    
1. If a Power Virtual Agents topic has inputs, there will a **value** property nested within the topic property. The **value** property will contain a **$ref** property. Take note of its value as you will use it in the next step.

    :::image type="content" source="media/PVA-as-a-skill/Lesson2_InputsValueSection.png" alt-text="Locate the values property for a Power Virtual Agents topic in skill manifest.":::
    
1. Locate the **definitions** property, then look for a nested property that matches the **$ref** value you found in the previous step. Take note of the the Power Virtual Agents topic's inputs names and types; you will use them in the next steps.

    :::image type="content" source="media/PVA-as-a-skill/Lesson2_InputsDefinitions.png" alt-text="Locate the definitions property for a Power Virtual Agents topic in skill manifest.":::
   
1. Select **Close** to close the manifest window.
   
1. In the properties pane, in the **Activity** section, select **Show code**.

    :::image type="content" source="media/PVA-as-a-skill/ActivityShowCode.png" alt-text="Select Show Code option in Activity panel."::: 
   
1. Add the following code with these values replaced:
   1. Replace `TOPIC_ACTIVITY_NAME` with your topic's event activity name.
   1. Replace `PVA_INPUT_VARIABLE` with an input variable from your topic.
   1. Replace `COMPOSER_INPUT_VARIABLE` with a Composer variable that will provide a value.
   
    ```
    [Activity
        Type = event
        Name = TOPIC_ACTIVITY_NAME
        Value = ${json("{'PVA_INPUT_VARIABLE': ${COMPOSER_INPUT_VARIABLE}}")}
    ]
    ```

    In following the example, the Composer variable `dialog.storeLocation` is used to provide a value to the input variable `pva_StoreLocation` in the Power Virtual Agents bot topic `dispatchTo_new_topic_127cdcdbbb4a480ea113c5101f309089_21a34f16`. 

    :::image type="content" source="media/PVA-as-a-skill/Lesson2_InputsActivityCode.png" alt-text="Add Activity event with a Power Virtual Agents input value to Show Code window.":::
 
### Receive an output variable from a Power Virtual Agents skill topic 
It is possible to receive outputs from a Power Virtual Agents skill topic in Composer. You can refer to [Passing variables between topics](/authoring-create-edit-topics#passing-variables-between-topics) to learn how to create Power Virtual Agents topics that return outputs.

**To receive an output variable from a Power Virtual Agents skill topic:**

1. In the Composer authoring canvas select **+ Add**. Select **Access external resources**, then **Connect to a skill**.

    :::image type="content" source="media/PVA-as-a-skill/ConnectToSkill.png" alt-text="Composer - connect to a skill.":::

1. [Locate the event activity's name for your Power Virtual Agents bot topic](#locate-a-power-virtual-agents-topic-activity-name) you want to call. Copy the value (without quotes) and save it to use in the next steps.
    
1. If a Power Virtual Agents topic has outputs, there will a **resultValue** property  nested within the topic property. Take note of the **$ref** in the **resultValue** property; you will use it to locate the in the next step.

    :::image type="content" source="media/PVA-as-a-skill/Lesson3_OutputsResultValueSection.png" alt-text="Locate the result value property for a Power Virtual Agents topic in skill manifest.":::
    
1. Locate the **definitions** property, then look for a nested property that matches the **$ref** value you found in the previous step. Take note of the the Power Virtual Agents topic's output variables names and types; you will use them in the next steps. 
   
   In the following example, the Power Virtual Agents topic returns 2 outputs of type String, **pva_State** and **pva_Item**.

    :::image type="content" source="media/PVA-as-a-skill/Lesson3_DefinitionsOutputsSection.png" alt-text="Locate the definitions property for a Power Virtual Agents topic in skill manifest.":::

1. Select **Close** to close the manifest window.

1. In the properties pane, in the **Activity** section, select **Show code**.
   
    :::image type="content" source="media/PVA-as-a-skill/ActivityShowCode.png" alt-text="Select Show Code option in Activity panel."::: 
   
1. Add the following code and replace `TOPIC_ACTIVITY_NAME` with your topic's event activity name. Make sure there are no quotes in the **name** property. 
   
    ```
    [Activity
        type = event
        name = TOPIC_ACTIVITY_NAME
    ]
    ```

    :::image type="content" source="media/PVA-as-a-skill/Lesson3_ActivitySection.png" alt-text="Add Activity event with the Power Virtual Agents topic name to Show Code   window.":::

1. In the properties pane, set **Property** to a Composer variable to receive and store the output values from a Power Virtual Agents skill topic.

    :::image type="content" source="media/PVA-as-a-skill/Lesson3_SetResultProperty.png" alt-text="Set the Property field in Activity window to dialog.skillResult.":::

1. In the Composer authoring canvas select **+ Add**. Select **Manage properties** then **Set properties**.
   
    :::image type="content" source="media/PVA-as-a-skill/Lesson3_SelectSetProperties.png" alt-text="Select Set Properties under Manage Properties menu option.":::

1. Select the **Set properties** action. In the properties pane, set **Property** to the Composer value that should store the extracted value. Then set **Value** to the Composer variable you stored the topic's outputs in. 
   
    In the following example, the output values from **dialog.skillResult.pvaState** and **dialog.skillResult.pvaItem** are extracted into new Composer variables **dialog.State** and **dialog.Item**.

    :::image type="content" source="media/PVA-as-a-skill/Lesson3_ExtractTopicOutputs.png" alt-text="Save the output values into dialog.State and dialog.Item in Composer Set properties window.":::
  
## Test your Power Virtual Agents bot as a skill with a Bot Framework bot

You can test that your Bot Framework bot is properly calling a Power Virtual Agents bot as a skill by using the [Bot Framework Emulator](/composer/how-to-connect-to-a-skill#test-in-the-emulator).

>[!IMPORTANT]
>Your Bot Framework bot must be added to the Power Virtual Agents bot's allowlist for the skill connection to work.



## Learn More

To learn more about developing in Bot Framework Composer and using skills, see these resources:
- [Skills overview](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0&preserve-view=true)
- [Skills manifest](/azure/bot-service/skills-write-manifest?view=azure-bot-service-4.0&preserve-view=true&tabs=v2-2)
- [Bot Framework Composer documentation](/composer/) 
- [Skills in Composer](/composer/concept-skills)
- [Connect to a remote skill in Composer](/composer/how-to-connect-to-a-skill?tabs=v2x)
- [Test your skill in Emulator](/composer/how-to-connect-to-a-skill?tabs=v2x#test-in-the-emulator)


[!INCLUDE[footer-include](includes/footer-banner.md)]
