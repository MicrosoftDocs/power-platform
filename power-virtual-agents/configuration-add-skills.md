---
title: "Extend your bot using Bot Framework Skills"
description: "Skills extend your bot's conversational capabilities by automating a series of actions within a topic. Skills enable the bot to book an appointment, send a confirmation email, manage tasks, and more."
keywords: "extensibility, integration, extend bot, bot framework, skills, custom capabilities"
ms.date: 12/4/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "azure, extend"
ms.collection: virtual-agent
---

# Extend your bot using Bot Framework Skills

Power Virtual Agents enables you to extend your bot using Azure Bot Framework Skills. If you have already built and deployed bots in your organization (using Bot Framework pro-code tools) for specific scenarios, you can convert bots to a Skill and embed the Skill within a Power Virtual Agents bot.

This article is intended for system administrators or IT professionals who are familiar with [Azure Bot Framework Skills](/azure/bot-service/bot-builder-skills-overview?view=azure-bot-service-4.0). After a Skill has been registered, bot authors can seamlessly [call Actions into bot conversations](advanced-use-skills.md).

## Compare use of Flows and Skills actions
The following table will help you determine when to use Skills for a conversation.

|    | **Flow actions** | **Skill actions** |
| -- | -- | -- |
| **Persona** | Bot authors can build reusable Flows to embed into any bot conversation | Developers can create, deploy and host custom Skills in their own environment |
| **Conversation** | Use Flows for simple, single-turn transactions. For example, place an order, or get order status. | Use Skills for complex, multi-turn conversations. For example, schedule a meeting or book a flight. |
| **Response** | Use Flows to emit a simple bot response. For example, show a personalized message or inline images. | Use Skills to emit any supported bot response. For example, show an adaptive card or send random responses. |
| **Actions** | Use Flows to trigger server-side single-turn actions. For example, call an HTTP API or trigger a custom connector. | Use Skills to trigger server-side and client-side events and actions. For example, navigate to a page upon bot response. |


## Configure a Skill for use in Power Virtual Agents
First, [create a Power Virtual Agents bot](authoring-first-bot.md) and [create and deploy Skill using pro-code tools](https://go.microsoft.com/fwlink/?linkid=2110533) into your organization.

>[!NOTE]
>Power Virtual Agents only supports Skills built using [Bot Framework Skills package version 4.5](https://www.nuget.org/packages/Microsoft.Bot.Builder.Skills/4.5.1)

Before registering the Skill, provide the bot's ID to your Skills developer to authorize the bot to call actions in the Skill.

**Add bot to Skill's allow list:**

1. In the [Power Virtual Agents portal](https://powerva.microsoft.com), on the side navigation pane, expand the **Manage** menu and select **Skills**.

   ![Select Manage, then Skills](media/skills-menu.png)

1. At the top of the Skills page, select **Provide ID for allow list**.
 
   ![Select Provide id for allow list button](media/skills-provide-id.png)

1. A window will show with your unique ID. Copy this ID and provide it to your Skills developer.

   ![Windows showing unique ID](media/skills-provide-id-modal.png)


**Enter the Skill manifest URL to add a Skill to your bot:**

1. In the [Power Virtual Agents portal](https://powerva.microsoft.com), on the side navigation pane, expand the **Manage** menu and select **Skills**.

   ![Select Manage, then Skills](media/skills-menu.png)

1. At the top of the Skills page, select **Add skill**.
 
   ![Select Add skill button](media/skills-provide-id.png)

1. Enter the URL to the Skill manifest. A Skill's manifest contains the information that your bot will need to trigger actions within a Skill.

1. Select **Next** to begin the [validation process](#validation-performed-during-registering-a-skill). When successful, your Skill is added to your bot. You can now [use this Skill in your topics](advanced-use-skills.md). 

## Compliance considerations
To protect user's privacy, we restrict users from adding Skills that are deployed outside of the signed-in user's Azure tenant. However, your bot may send customer information to a Skill if your Skill and bot are deployed in different regions.

### Validation performed during registering a Skill

A series of validation checks are made against the URL. The checks are described as follows. The failure of these checks may result in an error message as described in this table.

Validation step|Error message|Description or mitigation
---|---|---
Valdate Skill manifest URL|The link isn't valid; The link must begin with https:// | Re-enter the link as a secure URL |
Validate if Skill manifest can be retrieved|We ran into problems getting the skill manifest| Try again or contact your skill developer
Validate if Skill manifest can be read|The manifest is too large, The manifest is incompatible| Please fix syntactical errors in the manifest e.g. optional manifest properties are missing that is required; Manifest size must be less than or equal to 500kb |
Validate if Skill is previously registered|This skill has already been added to your bot|Delete the skill and try again|
Validate Skill manifest endpoint origin|There's a mismatch in your skill endpoints|Contact your skill developer|
Validate Skill is hosted in signed in user's tenant|To add a skill, it must first be registered| Your global administrator must register the skill into the signed in user's organization |
Validate Skill actions|The skill is limited to 25 actions|There are too many Skill actions defined in Skill manigest. Remove actions and try again. |
Validate Skill action input parameters|Actions are limited to 25 inputs|There are too many Skill action input parameters. Remove parameters and try again. |
Validate Skill action output parameters|Actions are limited to 25 outputs|There are too many Skill action output parameters. Remove parameter and try again. |
Validate Skill count|Your bot can have a maximum of 25 skills| There are too many Skills added into a bot. Remove an existing Skill and try again. |
Validate Skill action language|Currently, skills are only supported in English| Skill has actions with unsupported locales. We only support Skills with Actions in English ('en') locale. |
Validate AAD app setting |The skill must be registered multi-tenant| Contact your skill developer. |
Validate security token |It looks like something went wrong|There may be a transient error to acquire a security token to trigger Skill. Please retry.|
Validate Skill health|Something went wrong while checking your skill|Try again or contact your skill developer|


