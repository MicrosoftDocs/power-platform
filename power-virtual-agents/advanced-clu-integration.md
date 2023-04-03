---
title: "Automate bot creation with CLU integration"
description: "Automate the creation of bots in Power Virtual Agents bots with CLU integration"
keywords: "Cognitive language understanding, PVA, CLU, CLU models"
ms.date: 4/03/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent

---

# Automate bot creation with CLU integration

Cognitive language understanding (CLU) model integration with Power Virtual Agents lets users import Azure CLU models directly into PVA. For bots created with this capability, bot creators can now access existing CLU model intents and entities without having to directly access the model in [Azure Language Studio](https://aka.ms/languageStudio). Azure Language Studio is a cloud-based service from Azure Cognitive Service for Language, providing natural language processing (NLP) features for understanding and analyzing conversational text. For more information, see [Conversational Language Understanding](https://learn.microsoft.com/azure/cognitive-services/language-service/conversational-language-understanding/overview).

With this new capability, PVA users can import CLU models directly into the PVA authoring canvas. Entities imported from the CLU model appear in PVA on the Entities page. Then, bot creators can add new question nodes in a PVA topic and select available entities and intents from the imported CLU model. CLU entities are bound to equivalent PVA objects. For each entity, users can specify the name, the datatype, and the JSON structure of a custom datatype, if required. 

> [!NOTE]
> For existing bots that you want to take advantage of CLU integration, you'll need to import the bot into PVA (unless it’s been previously created in PVA), then manually or bulk update the bot’s trigger phrases to bind each topic to a corresponding CLU intent. 

## Prerequisites

- A fully trained CLU model
- Enabled deployment of the model (including the key, appointment info, and prediction URL)
- CLU project name and deployment name 
- [Power Virtual Agents](requirements-licensing-subscriptions.md) account
- [Existing PVA](authoring-first-bot.md) bot

## Key concepts

### CLU connectors

A *connector* is a wrapper around an API that allows the Azure Cognitive Service services to talk to Power Virtual Agents. It provides a way for users to connect their accounts and leverage a set of prebuilt actions and triggers to build their apps and workflows. For more information, see [Azure Cognitive Service for Language - Connectors](https://learn.microsoft.com/connectors/cognitiveservicestextanalytics). 

Power Platform connectors allow Microsoft services to talk to the CLU API. For more information, see [Power Platform and Azure Logic Apps connectors documentation - Connectors](https://learn.microsoft.com/connectors). Although you can import any connector types, PVA doesn’t currently validate connectors. 

### Connections in PVA

A [connection](https://learn.microsoft.com/power-automate/add-manage-connections) is a stored [authentication credential](https://learn.microsoft.com/connectors/custom-connectors/connection-parameters#authentication-types) for a connector, for example OAuth credentials for the SharePoint connector. A connection reference is a solution component that contains a reference to a connection about a specific connector.

PVA connections are environment specific. When you import a bot, you need to set up a connection for it. There is a standard way of achieving this in Power Platform by way of a Connection reference. For more information, see [Connection references in solutions - Power Apps[(https://learn.microsoft.com/power-apps/maker/data-platform/create-connection-reference). 


### External recognizers 

CLU integration supports specific external recognizers. The OnRecognize trigger fires in the following scenarios:

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

For a complete list of PVA variables, including system variables, see [Use variables - Power Virtual Agents](authoring-variables.md).

## Mix and match entity component types 

CLU entities include relevant information extracted from NLU utterances. An entity can be extracted using different methods. They can be learned through context, mixed and matched from a list, or detected by a prebuilt recognized entity. For a complete list of entity component types, see [Component Types](https://learn.microsoft.com/azure/cognitive-services/language-service/conversational-language-understanding/concepts/entity-components#component-types).

## Related topics

Other bot building features that CLU integration supports include:

- System topics: [Use system topics in Power Virtual Agents](authoring-system-topics.md)
- Entities and slot filling: [Create and use entities in Power Virtual Agents](advanced-entities-slot-filling.md)
- CLU best practices: [Conversational language understanding best practices - Azure Cognitive Services](https://learn.microsoft.com/azure/cognitive-services/language-service/conversational-language-understanding/concepts/best-practices)
- Topic flow interruptions: [Design and control conversation flow - Bot Service](https://learn.microsoft.com/azure/bot-service/bot-service-design-conversation-flow)
- Power Fx expressions: [Create expressions using Power Fx](advanced-power-fx.md)


