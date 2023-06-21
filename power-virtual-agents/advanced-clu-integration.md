---
title: Conversational language understanding integration overview (preview)
description: Automate the creation of bots in Power Virtual Agents bots with CLU integration.
keywords: "Azure, conversational language understanding, PVA, CLU, CLU models"
ms.date: 6/6/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Conversational language understanding integration overview (preview)

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

You can integrate your [conversational Language Understanding (CLU)](/azure/cognitive-services/language-service/conversational-language-understanding/overview) model with a Power Virtual Agents bot. Conversational language understanding is one of the custom features offered by Azure Cognitive Service for Language. It is a cloud-based service that applies machine-learning intelligence to enable you to build natural language understanding component to be used in an end-to-end conversational application. Language service APIs are available (but not required for you to integrate with Power Virtual Agents) and the [Azure Language Studio](/azure/cognitive-services/language-service/overview) provides natural language processing (NLP) features for analyzing conversational text.

For projects created with this capability, bot creators can now access existing CLU model intents and entities directly in Power Virtual Agents. Power Virtual Agents users can now map CLU intents to trigger bot dialogs in the same way as native Power Virtual Agents [utterance triggers](advanced-hand-off.md). Entities imported from a CLU model appear on the Power Virtual Agents [Entities](advanced-entities-slot-filling.md) page and can be used alongside Power Virtual Agents prebuilt entities. Bot creators can add new [question nodes](authoring-create-edit-topics.md) in a topic and select available entities and intents from the imported CLU model. CLU entities are bound to equivalent Power Virtual Agents objects. Users specify the name, the data type, and the [JSON structure](advanced-clu-entity-registration.md) of a custom data type, if desired for each entity. 

> [!NOTE]
> For existing bots that you want to take advantage of CLU integration, you'll need to map the CLU model to Power Virtual Agents, then you can update the bot’s trigger phrases to bind each topic to a corresponding CLU intent. You can also manually manage the relationship between the CLU model and Power Virtual Agents.

## Prerequisites

- A fully [trained CLU model](/azure/cognitive-services/language-service/conversational-language-understanding/quickstart?pivots=language-studio#train-your-model). This includes intents for each of [PVA's system topics](https://learn.microsoft.com/en-us/power-virtual-agents/authoring-system-topics?tabs=webApp) and for [any custom topics](https://learn.microsoft.com/en-us/power-virtual-agents/authoring-create-edit-topics?tabs=preview) you may want to author.
- Enabled deployment of the model (including the key and prediction URL)
- CLU project name and deployment name 
- [Power Virtual Agents](requirements-licensing-subscriptions.md) account
- [Existing Power Virtual Agents](authoring-first-bot.md) bot

## Key concepts

The concepts discussed in this article help you understand how to integrate CLU models with Power Virtual Agents projects. For more information, see [Get started with language understanding](advanced-clu-get-started.md).

### CLU connectors

A *connector* is a wrapper around an API that allows the Azure Cognitive Service to talk to Power Virtual Agents. It provides a way for users to connect their accounts and apply a set of prebuilt actions and triggers to build their apps and workflows. For more information, see [Azure Cognitive Service for Language - Connectors](/connectors/cognitiveservicestextanalytics). 

Power Platform connectors allow Microsoft services to talk to the CLU API. For more information, see [Power Platform and Azure Logic Apps connectors documentation - Connectors](/connectors). Although you can import any connector types, Power Virtual Agents doesn’t currently validate connectors. 

### Connections in Power Virtual Agents

A [connection](/power-automate/add-manage-connections) is a stored [authentication credential](/connectors/custom-connectors/connection-parameters#authentication-types) for a connector, for example OAuth credentials for the SharePoint connector. A connection reference is a solution component that contains a reference to a connection about a specific connector.

Power Virtual Agents connections are environment specific. When you import a bot, you need to set up a connection for it. We offer a standard way of achieving this capability in Power Platform by way of a Connection reference. For more information, see [Connection references in solutions - Power Apps](/power-apps/maker/data-platform/create-connection-reference). 


### External recognizers 

CLU integration supports specific external recognizers. The `OnRecognize` trigger fires in the following scenarios:

- When a topic is triggered:
`LanguageUnderstandingReason.TriggerTopic`

- When a question node does not support interruptions and requires an answer: `LanguageUnderstandingReason.AnswerQuestion`

- When a question node supports interruptions and requires an answer: 
` LanguageUnderstandingReason.AnswerQuestionWithInterruptions`

### External intents

CLU integration supports recognized external intents that utilize the `System.Recognizer.IntentOptions` system variable in the following scenarios:

- Reuse *TopicId* for the external intent id
- Reuse *TriggerId* for the external intent id
- Create a new property *IntentId* for the external intent id
- System variable(s) that support the reason for triggering the recognizer

| Property name | Type        | Description | 
|---------------|-------------|-------------|
| DisplayName   | String      | The display name for the recognized intent; localized in the current language and to be shown in the DYM prompt (if applicable) |
| Score         | Number      | The recognizer score |
| TopicId       | String      | The Dataverse schema name of the topic |
| TriggerId     | String      | The unique ID of the trigger within the AdaptiveDialog topic |

For a complete list of Power Virtual Agents variables, including system variables, see [Use variables - Power Virtual Agents](authoring-variables.md).

## Mix and match entity component types 

CLU entities include relevant information extracted from NLU utterances. An entity can be extracted using different methods. They can be learned through context, mixed and matched from a list, or detected by a prebuilt recognized entity. For a complete list of entity component types, see [Component Types](/azure/cognitive-services/language-service/conversational-language-understanding/concepts/entity-components#component-types).

> [!NOTE]
> You can also use Power Virtual Agents [prebuilt entities](authoring-variables.md) along with CLU entities.

## Related topics

Other bot-building features that CLU integration supports include:

- System topics: [Use system topics in Power Virtual Agents](authoring-system-topics.md)
- Entities and slot filling: [Create and use entities in Power Virtual Agents](advanced-entities-slot-filling.md)
- CLU best practices: [Conversational language understanding best practices - Azure Cognitive Services](/azure/cognitive-services/language-service/conversational-language-understanding/concepts/best-practices)
- Topic flow interruptions: [Design and control conversation flow - Bot Service](/azure/bot-service/bot-service-design-conversation-flow)
- Power Fx expressions: [Create expressions using Power Fx](preview/advanced-power-fx.md)
