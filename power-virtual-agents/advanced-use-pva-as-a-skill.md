---
title: Use a Microsoft Copilot Studio bot as a skill in Bot Framework bots
description: Call a Microsoft Copilot Studio bot from a Bot Framework bot session when a user says something that matches the bot's trigger phrases.
keywords: "composer, skills, bot framework"
ms.date: 04/01/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtual-agent
---

# Use a Microsoft Copilot Studio bot as a skill

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

> [!NOTE]
> This topic includes information applicable to Microsoft Copilot Studio Classic only. This feature is not available in the new Microsoft Copilot Studio experience.

When you use a Microsoft Copilot Studio bot as a [skill](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0&preserve-view=true) with a Bot Framework bot, the Bot Framework bot determines if anything the user says matches the Microsoft Copilot Studio bot's [trigger phrases](authoring-create-edit-topics.md). If there's a match, the Bot Framework bot [passes the conversation to the Microsoft Copilot Studio bot](#call-a-microsoft-copilot-studio-skill-topic). The Microsoft Copilot Studio bot extracts any [entities](advanced-entities-slot-filling.md) and triggers the matching topic.

You can also [pass a variable to a Microsoft Copilot Studio skill topic as an input](#pass-an-input-variable-to-a-microsoft-copilot-studio-skill-topic) from Bot Framework Composer and [use the outputs it returns](#receive-an-output-variable-from-a-microsoft-copilot-studio-skill-topic).

> [!IMPORTANT]
> You must have a [trial](sign-up-individual.md) or full Microsoft Copilot Studio license to use Microsoft Copilot Studio bots as skills.
> This capability isn't available with the [Teams Microsoft Copilot Studio license](requirements-licensing-subscriptions.md).

To set up your Microsoft Copilot Studio bot as a skill:

1. [Add the Bot Framework bot to the allowlist for the Microsoft Copilot Studio bot](#add-your-bot-framework-bot-to-the-allowlist-for-your-microsoft-copilot-studio-bot).
1. [Download the skill manifest for the Microsoft Copilot Studio bot](#download-the-bot-skill-manifest-for-your-microsoft-copilot-studio-bot).
1. [Use the downloaded skill manifest in Bot Framework Composer to create a connection between the bots](#connect-to-a-microsoft-copilot-studio-skill-in-composer).
1. [Use the Bot Framework Emulator to confirm the bot works as a skill](#test-your-microsoft-copilot-studio-bot-as-a-skill-with-a-bot-framework-bot).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Understand how Bot Framework skills work](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0&preserve-view=true).
- [Understand how to use Bot Framework Composer](/composer/introduction).
- [Understand how to use skills in Bot Framework Composer](/composer/concept-skills).
- [Get your Bot Framework bot's app ID](/azure/bot-service/bot-service-manage-overview#get-azure-bot-resource-app-id).

## Add your Bot Framework bot to the allowlist for your Microsoft Copilot Studio bot

Add the Bot Framework bot's app ID to the allowlist for the Microsoft Copilot Studio bot that you want to use as a skill. The bots must be in the same tenant.

1. In Bot Framework Composer, open the bot that will use the skill. Select **Configure**, and then select **Development resources**. Copy the ID in **Microsoft App ID**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Composer_BotAppID.png" alt-text="Screenshot highlighting where to find a Bot Framework bot's app ID.":::

1. In Microsoft Copilot Studio, open the bot you want to use as a skill.

1. In the navigation menu, go to **Settings** and select **Security**. Then select **Allowlist**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Skill_ManageAllowlistSecurity.png" alt-text="Screenshot highlighting the Allowlist tile on the Security page.":::

1. Select **Add allowed caller**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Skill_AddAllowedCallers.png" alt-text="Screenshot highlighting the Add allowed caller button at the top of the Manage allowlist panel.":::

1. Paste your Bot Framework bot's [app ID](/azure/bot-service/bot-service-manage-overview#get-azure-bot-resource-app-id) and select **Next**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Skill_AddBotAppID.png" alt-text="Screenshot highlighting where to enter the Bot Framework bot's app ID.":::

    > [!CAUTION]  
    > A Microsoft Copilot Studio bot can't act as a skill for other Microsoft Copilot Studio bots. If you try to add an app ID that belongs to a Power Virtual Agent bot to the allowlist, you'll get an error. You can only add an app ID for a Bot Framework bot.

    Microsoft Copilot Studio validates the Bot Framework bot's app ID and confirms that it belongs to a bot in the same tenant.

1. (Optional) Add a **Display name** for the bot you've added to the allowlist.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Skill_AllowedCallerDisplayName.png" alt-text="Screenshot showing where to add a display name for the bot on the allowlist.":::

1. Select **Save**.

The Bot Framework bot is shown by its display name if you entered one, or by its app ID if you didn't enter a display name. To delete or edit it at any time, select the icon to the right of the bot's display name or app ID.

:::image type="content" source="media/advanced-use-pva-as-a-skill/Skill_AllowedCallerAdded.png" alt-text="Screenshot of the Manage allowlist panel showing the edit and delete icons for an allowed bot.":::

> [!NOTE]
> Bot Framework bots added to the allowlist aren't [exported as part of the bot content](authoring-export-import-bots.md).

## Download the bot skill manifest for your Microsoft Copilot Studio bot

Bot Framework bots can use a Microsoft Copilot Studio skill manifest to configure a connection to the bot that produced the manifest.

All Microsoft Copilot Studio bots have skill manifests. These are JSON files that include a skill's name, interface, and trigger phrases.

A Bot Framework bot can use a skill manifest to know when to trigger the Microsoft Copilot Studio bot (for example, in response to something a user says to it).

Microsoft Copilot Studio skill manifests follow [version 2.2 of the Bot Framework skill manifest schema](/azure/bot-service/skills-write-manifest#the-skill-manifest) and consist of *intents.lu* and *manifest.json* files.

A Bot Framework bot may decide a Microsoft Copilot Studio bot should handle the user's request, based on the manifest data. It passes to the bot everything the user said. Then, the Microsoft Copilot Studio bot matches what the user said [to a Microsoft Copilot Studio topic](authoring-create-edit-topics.md), extracts any [entities that are needed for slot-filling](advanced-entities-slot-filling.md), and triggers the Microsoft Copilot Studio topic.

Microsoft Copilot Studio skill manifests are automatically generated and updated. A Microsoft Copilot Studio bot has two skill manifests:

- **Test manifest**: Allows the Bot Framework bot to connect to the test version of your Microsoft Copilot Studio bot. Use the test manifest to validate changes to your skill before you publish it.  
  - The test manifest is immediately available for every newly created Microsoft Copilot Studio bot.  
  - It's automatically updated to reflect changes every time you **save** your bot.

- **Published manifest**: Allows the Bot Framework bot to connect to the published version of your Microsoft Copilot Studio bot.  
  - The published manifest is only available for Microsoft Copilot Studio bots that have been published at least once.  
  - It's automatically updated to reflect changes every time you [**publish** your bot](publication-fundamentals-publish-channels.md#publish-the-latest-content).

> [!NOTE]
> The **Published manifest** isn't available for Microsoft Copilot Studio bots that have never been published.  
>  
> To generate your bot's **Published manifest**, [publish your Microsoft Copilot Studio bot](publication-fundamentals-publish-channels.md).

Both skill manifests are shown on the **Manage allowlist** panel.

:::image type="content" source="media/advanced-use-pva-as-a-skill/Skill_Manifest1.png" alt-text="Screenshot of the Manage allowlist panel showing the Microsoft Copilot Studio bot manifests.":::

The skill manifests are also shown on the bot's Details page. In the navigation menu, select **Settings**, and then select **Details**. The Details page shows other metadata, including **Environment ID**, **Tenant ID**, and **Bot app ID**.

:::image type="content" source="media/advanced-use-pva-as-a-skill/Skill_Manifest2.png" alt-text="Screenshot of the Details page highlighting where to download the Microsoft Copilot Studio bot manifests.":::

To download a manifest, select it. It downloads as a .zip file labeled *\<bot name\>_manifest* for the **Published manifest**, or *\<bot name\>_test__manifest* for the **Test manifest**.

:::image type="content" source="media/advanced-use-pva-as-a-skill/Manifests_Zip.png" alt-text="Screenshot showing the two Microsoft Copilot Studio manifests after they've been downloaded.":::

> [!NOTE]
> The skill manifest doesn't include system topics and Composer dialogs that are added to a Microsoft Copilot Studio bot. Only topics that were created by bot authors and Composer intent triggers that authors add to the bot are included.

## Connect to a Microsoft Copilot Studio skill in Composer

Use Microsoft Copilot Studio skill manifests to create a skill connection in your Bot Framework bot in Composer.

1. In a Bot Framework Composer project, select **Add**, and then select **Connect to a skill**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Composer_ConnectToSkill.png" alt-text="Screenshot of Bot Framework Composer showing how to connect a Bot Framework bot to a skill.":::

1. Browse to and select a Microsoft Copilot Studio manifest .zip archive, and then select **Next**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Composer_AddSkillZip.png" alt-text="Screenshot of Composer showing where to select a Microsoft Copilot Studio skill zipped archive.":::

1. Select the topics, or intents, in your Microsoft Copilot Studio bot that you want to add to your Bot Framework bot, and then select **Next**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Composer_SelectTopics.png" alt-text="Screenshot of Composer showing the selection of Microsoft Copilot Studio topics.":::

1. Review and edit the trigger phrases for your Microsoft Copilot Studio bot, and then select **Next**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Composer_EditTriggerPhrases.png" alt-text="Screenshot of Composer showing where to edit trigger phrases for selected topics.":::

1. Make sure **Use Orchestrator for multi-bot projects** is selected, and then select **Continue**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Composer_Orchestrator.png" alt-text="Screenshot of Composer showing Orchestrator turned on.":::

1. Verify that the Microsoft Copilot Studio skill is added to your Bot Framework bot correctly, and that a new trigger with your Microsoft Copilot Studio bot's name appears in the project in Composer.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Composer_PVASkillAdded.png" alt-text="Screenshot of Composer after the Microsoft Copilot Studio skill has been added.":::

### Locate the topic in the skill manifest

Use an event to trigger a Microsoft Copilot Studio topic in the skill. To call a specific topic from Composer, refer to the topic by the name of the associated event in the skill manifest.

1. Select the **Connect to a skill** action.

1. Under **Skill Dialog Name**, select **Show skill manifest**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/SelectSkillManifest.png" alt-text="Screenshot of Composer highlighting where to show the skill manifest.":::

1. Find **activities** in the manifest. This property contains nested properties that represent the topics available in your Microsoft Copilot Studio bot.

    :::image type="content" source="media\advanced-use-pva-as-a-skill\manifest-activities.png" alt-text="Screenshot of a skill manifest highlighting the activities property.":::

1. Find the topic you want to call and look for its **name** property. When the Microsoft Copilot Studio skill receives an event with this name, it triggers the topic.

   In the following example, the event activity name is `dispatchTo_new_topic_87609dabd86049f7bc6507c6f7263aba_33d`.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/SelectPVATopicName.png" alt-text="Screenshot highlighting the Microsoft Copilot Studio topic name in the manifest.":::

### Call a Microsoft Copilot Studio skill topic

Instead of relying on what a user says to trigger a Microsoft Copilot Studio skill topic, you can call it directly. You can only directly call Microsoft Copilot Studio topics that are listed in the skill manifest.

1. In the Composer authoring canvas, select **Add**, then select **Access external resources**, and then select **Connect to a skill**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/ConnectToSkill.png" alt-text="Screenshot of Composer highlighting how to connect to a skill.":::

1. In the **Skill Dialog Name** list, select your Microsoft Copilot Studio bot.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/SelectSkillManifest.png" alt-text="Screenshot highlighting where to select your Microsoft Copilot Studio bot.":::

1. [Find the event activity's name for the Microsoft Copilot Studio bot topic](#locate-the-topic-in-the-skill-manifest) that you want to call. Copy the value, omitting the quotation marks, and save it to use in the next steps.

1. Select **Close**.

1. In the **Activity** section, select **Show code**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/ActivityShowCode.png" alt-text="Screenshot highlighting where to select Show Code.":::
  
1. Type or paste the following code. Replace `TOPIC_ACTIVITY_NAME` with your topic's event activity name. Make sure there are no quotation marks in the **name** property.

    ```lg
    [Activity
        type = event
        name = TOPIC_ACTIVITY_NAME
    ]
    ```

    :::image type="content" source="media/advanced-use-pva-as-a-skill/ActivityWithTopicName.png" alt-text="Screenshot highlighting where to add the Activity event code with the Microsoft Copilot Studio topic name.":::

### Pass an input variable to a Microsoft Copilot Studio skill topic

Bot Framework Composer can pass a variable to a Microsoft Copilot Studio skill topic as an input. To learn how to create Microsoft Copilot Studio topics that accept input variables, see [Passing variables between topics](authoring-variables.md).

If a Microsoft Copilot Studio topic that can receive an input variable is listed in your skill manifest, you can pass a Composer variable to it.

1. In the Composer authoring canvas, select **Add**, then select **Access external resources**, and then select **Connect to a skill**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/ConnectToSkill.png" alt-text="Screenshot of Composer highlighting how to connect to a skill.":::

1. In the **Skill Dialog Name** list, select your Microsoft Copilot Studio bot.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/SelectSkillManifest.png" alt-text="Screenshot highlighting where to select your Microsoft Copilot Studio bot.":::

1. [Find the event activity's name for the Microsoft Copilot Studio bot topic](#locate-the-topic-in-the-skill-manifest) that you want to call. Copy the value, omitting the quotation marks, and save it to use in the next steps.

1. Find the topic's **value** property. The **value** property contains a **$ref** property. Copy that value and save it to use in the next step.

    > [!WARNING]
    > If a Microsoft Copilot Studio topic doesn't have inputs, it won't have a **value** property.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson2_InputsValueSection.png" alt-text="Screenshot of a skill manifest highlighting the value property.":::

1. Find the **definitions** property, then look for a nested property that matches the **$ref** value you found in the previous step. Note the names and types of the Microsoft Copilot Studio topic's inputs. You'll use them in the next steps.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson2_InputsDefinitions.png" alt-text="Screenshot of a skill manifest highlighting where to find input variables for a Microsoft Copilot Studio topic.":::

1. Select **Close**.

1. Under the **Activity** section, select **Show code**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/ActivityShowCode.png" alt-text="Screenshot highlighting where to select Show Code.":::

1. Type or paste the following code. Replace these values:
   1. Replace `TOPIC_ACTIVITY_NAME` with your topic's event activity name.
   1. Replace `PVA_INPUT_VARIABLE` with an input variable from your topic.
   1. Replace `COMPOSER_INPUT_VARIABLE` with a Composer variable that will provide a value.

    ```lg
    [Activity
        Type = event
        Name = TOPIC_ACTIVITY_NAME
        Value = ${addProperty(json("{}"), 'PVA_INPUT_VARIABLE', COMPOSER_INPUT_VARIABLE)}
    ]
    ```

    In the following the example, the Composer variable `dialog.storeLocation` provides a value to the input variable `pva_StoreLocation` in the Microsoft Copilot Studio bot topic `dispatchTo_new_topic_127cdcdbbb4a480ea113c5101f309089_21a34f16`.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson2_InputsActivityCode.png" alt-text="Screenshot highlighting where to add the Activity event code with a Microsoft Copilot Studio input value.":::

### Receive an output variable from a Microsoft Copilot Studio skill topic

It's possible to receive outputs from a Microsoft Copilot Studio skill topic in Composer. To learn how to create Microsoft Copilot Studio topics that return outputs, see [Passing variables between topics](authoring-variables.md).

1. In the Composer authoring canvas, select **Add**, then select **Access external resources**, and then select **Connect to a skill**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/ConnectToSkill.png" alt-text="Screenshot of Composer highlighting how to connect to a skill.":::

1. In the **Skill Dialog Name** list, select your Microsoft Copilot Studio bot.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/SelectSkillManifest.png" alt-text="Screenshot highlighting where to select your Microsoft Copilot Studio bot.":::

1. [Find the event activity's name for your Microsoft Copilot Studio bot topic](#locate-the-topic-in-the-skill-manifest) you want to call. Copy the value, omitting the quotation marks, and save it to use in the next steps.

1. Find the topic's **resultValue** property. The **resultValue** property contains a **$ref** property. Copy that value and save it to use in the next step.

    > [!WARNING]
    > If a Microsoft Copilot Studio topic doesn't have outputs, it won't have a **resultValue** property.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson3_OutputsResultValueSection.png" alt-text="Screenshot of a skill manifest highlighting the resultValue property for a Microsoft Copilot Studio topic.":::

1. Find the **definitions** property, then look for a nested property that matches the **$ref** value you found in the previous step. Note the names and types of the Microsoft Copilot Studio topic's output variables. You'll use them in the next steps.

   In the following example, the Microsoft Copilot Studio topic returns two outputs of type String, **pva_State** and **pva_Item**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson3_DefinitionsOutputsSection.png" alt-text="Screenshot of a skill manifest highlighting where to find output variables for a Microsoft Copilot Studio topic.":::

1. Select **Close**.

1. In the **Activity** section, select **Show code**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/ActivityShowCode.png" alt-text="Screenshot highlighting where to select Show Code.":::

1. Type or paste the following code. Replace `TOPIC_ACTIVITY_NAME` with your topic's event activity name. Make sure there are no quotation marks in the **name** property.

    ```lg
    [Activity
        type = event
        name = TOPIC_ACTIVITY_NAME
    ]
    ```

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson3_ActivitySection.png" alt-text="Screenshot highlighting where to add the Activity event code with a Microsoft Copilot Studio topic name.":::

1. Under the code area, set **Property** to a Composer variable to receive and store the output values from the Microsoft Copilot Studio skill topic.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson3_SetResultProperty.png" alt-text="Screenshot highlighting where to set the Property field to dialog.skillResult.":::

1. In the Composer authoring canvas, select **Add**, then select **Manage properties**, and then select **Set properties**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson3_SelectSetProperties.png" alt-text="Screenshot highlighting where to select Set properties.":::

1. Set **Property** to the Composer value that should store the extracted value. Then set **Value** to the Composer variable you stored the topic's outputs in.

    In the following example, the output values from **dialog.skillResult.pvaState** and **dialog.skillResult.pvaItem** are extracted into new Composer variables **dialog.State** and **dialog.Item**.

    :::image type="content" source="media/advanced-use-pva-as-a-skill/Lesson3_ExtractTopicOutputs.png" alt-text="Screenshot highlighting the output values saved into dialog.State and dialog.Item in the Composer Set properties window.":::
  
## Test your Microsoft Copilot Studio bot as a skill with a Bot Framework bot

Use the [Bot Framework Emulator](/composer/how-to-connect-to-a-skill#test-in-the-emulator) to test that your Bot Framework bot is properly calling a Microsoft Copilot Studio bot as a skill.

> [!IMPORTANT]
> Your Bot Framework bot must be added to the Microsoft Copilot Studio bot's allowlist for the skill connection to work.

## Learn More

- [Skills overview](/azure/bot-service/skills-conceptual?view=azure-bot-service-4.0&preserve-view=true)
- [Skills manifest](/azure/bot-service/skills-write-manifest?view=azure-bot-service-4.0&preserve-view=true&tabs=v2-2)
- [Bot Framework Composer documentation](/composer/)
- [Skills in Composer](/composer/concept-skills)
- [Connect to a remote skill in Composer](/composer/how-to-connect-to-a-skill?tabs=v2x)
- [Test a skill in Emulator](/composer/how-to-connect-to-a-skill?tabs=v2x#test-in-the-emulator)

[!INCLUDE[footer-include](includes/footer-banner.md)]
