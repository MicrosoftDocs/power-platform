---
title: Choosing the right option for intent recognition and entity extraction for your intelligent application workloads
description: Choosing the right option for intent recognition and entity extraction for your intelligent application workloads TODO
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Choosing the right option for intent recognition and entity extraction for your intelligent application workloads

Intent recognition and entity extraction are key components of natural language understanding in Microsoft Copilot Studio.

Intent recognition involves identifying the user's goal or purpose behind their input. For example, if a user says, "I want to book a flight," the intent is to book a flight. This helps the copilot understand what action needs to be taken based on the user's request.

Entity extraction involves identifying and extracting specific pieces of information from the user's input. Entities can be things like dates, names, locations, or any other relevant data. For instance, in the sentence "Book a flight to New York on September 15th," "New York" and "September 15th" are entities.

By combining intent recognition and entity extraction, Copilot can understand both what the user wants to do and the specific details needed to complete the task. This makes interactions more efficient and accurate, enhancing the overall user experience.

When designing your intelligent application workload, it's important to choose the right option for intent recognition and entity extraction to ensure your intelligent application workload provides accurate and efficient responses.

## Definitions

| Term | Definition| 
| --- | ---- | 
| NLU |  Natural Language Understanding (NLU) is a subset of natural language processing (NLP) in artificial intelligence that focuses on machine reading comprehension. |
| CLU | Conversational Language Understanding (CLU) is a feature of Azure AI that enables the creation of custom natural language understanding models. |
| LLM | A large language model (LLM) is a type of artificial intelligence model designed to understand and generate human language. |
| GPT | GPT stands for Generative Pre-trained Transformer. It refers to a family of large language models (LLMs) that use the transformer architecture to understand and generate human-like text. |

Choosing the right option for intent recognition and entity extraction in your intelligent application workload involves several key considerations:

- **Prebuilt vs. Custom Entities**: Evaluate whether the prebuilt entities provided by Copilot Studio meet your needs. These cover common information types like dates, numbers, and names. If your application requires domain-specific knowledge, you might need to create custom entities.

- **Complexity of User Inputs**: Consider the complexity and variability of user inputs. For straightforward scenarios, prebuilt entities might suffice. For more complex interactions, custom entities and advanced configurations like regular expressions (regex) might be necessary.

- **Slot Filling**: Determine if your application requires proactive slot filling, where the copilot actively seeks out and fills in missing information from user inputs. This can enhance the user experience by reducing the need for follow-up questions.

- **Performance and Scalability**: Assess the performance and scalability of your chosen method. Custom entities and complex configurations might require more processing power and could impact response times.

- **Ease of Maintenance**: Consider the ease of maintaining and updating your entities. Prebuilt entities are easier to manage, while custom entities might require ongoing adjustments as your application evolves.

## Choose between the standard NLU, Azure CLU or dynamic chaining

In Copilot Studio, topic or action triggering can be done in different ways: You can choose to override the standard NLU (Natural Language Understanding) model with Azure CLU (Conversational Language Understanding) or you can fully replace it with [dynamic chaining](/microsoft-copilot-studio/advanced-generative-actions), a GPT LLM-based model.

| | Standard NLU model | Custom Azure CLU model | Dynamic chaining |
|---|---|---|---|
| **Pro** |  Default, out-of-the-box, model that comes pre-trained, with many predefined entity types.<br><br>Configuration is done by adding trigger phrases and custom entities (either closed lists with values and synonyms, or regular expressions). | Supports additional languages, with native models.<br><br>Allows to further customize the intent triggering model for better intent recognition or to address specific industry requirements.<br><br>Allows for complex entity extraction (e.g., of the same type).<br><br>Entity extraction can also use Copilot Studio standard NLU. |Uses a GPT LLM.<br><br>Can handle multiple intents and chain topics and/or plugins.<br><br>Automatically generate questions for missing inputs and answers complex entities and questions from the conversation context.<br><br>Configuration is done by describing topics, plugin actions, inputs and outputs. | 
| **Con** |Single intent recognition per query.<br><br>Cannot be extended.<br><br>Slot-filling multiple entities of the same type in the same query requires disambiguation for each (for example, from and to cities) |Single intent recognition per query.<br><br>Configuration is done in Azure and involves additional costs.<br><br>Has its own service limits that need to be evaluated.<br><br>Azure CLU intents and Copilot Studio topics must be carefully kept in sync. |As it’s a generative AI feature, the licensing burn rate of messages is higher than in regular topic triggering. |

## Trigger phrases and slot filling

When developing intelligent application workloads, it's essential to use native capabilities for better intent recognition and efficient conversations. Start by defining topic trigger phrases, which can be derived from existing FAQ bases and chat transcripts to ensure relevance and accuracy. Consider your expected use of entities, such as using regular expressions to identify order IDs, prebuilt entities for emails, and closed lists for operation types with synonyms. Additionally, plan how you will test topic triggering with test utterances to validate and refine the accuracy of your intent recognition and entity extraction processes. Learn more: [Deployment and testing](publishing.md)

### Trigger phrases

Trigger phrases train your copilot's natural language understanding (NLU) model. They help the copilot recognize and respond accurately to user utterances by defining specific phrases that trigger particular topics. Proper configuration of these trigger phrases ensures that the copilot can correctly identify the user's intent and respond appropriately. When the copilot is uncertain about which topic to trigger, it can suggest up to three potential topic candidates (Multiple Topics Matched topic) or fall back to a default response if no topic is identified. This mechanism helps maintain the flow of conversation and ensures that the copilot can handle a wide range of user inputs effectively. By carefully defining and configuring trigger phrases, you can develop intelligent application workloads that provide accurate and efficient responses.

### Entity extraction and slot filling

Entity extraction and slot filling are important components in developing effective copilots. These processes enable the copilot to acquire and utilize information efficiently by identifying and extracting relevant details from user queries.

**Entity Extraction** involves parsing the user's input to identify specific pieces of information, known as entities. For example, in the query "I’d like to order 3 large blue t-shirts," the copilot's Natural Language Understanding (NLU) model can extract the following entities:
- **Quantity**: 3
- **Color**: Blue
- **Size**: Large
- **Item Type**: T-Shirt

**Slot Filling** is the process of using these extracted entities to complete the necessary information for a given task. In this example, the copilot recognizes the topic as an order and fills in the required slots with the extracted entities. This allows the copilot to understand the user's request without needing additional questions, streamlining the interaction.

By implementing entity extraction and slot filling, copilots can handle complex queries more effectively, providing accurate and contextually relevant responses. This enhances the user experience by reducing the need for follow-up questions and ensuring that the copilot can quickly and accurately fulfill user requests.

Learn more:

- [Trigger phrases best practices](/microsoft-copilot-studio/guidance/trigger-phrases-best-practices)
- [Slot filling best practices](/microsoft-copilot-studio/guidance/slot-filling-best-practices)

## Integrating Microsoft Copilot Studio with Azure CLU

Integrating a Conversational Language Understanding (CLU) model with a Copilot Studio copilot can significantly enhance the copilot's capabilities. This integration involves mapping Azure CLU intents to Copilot Studio topics, allowing the copilot to understand and respond to user intents more accurately. Additionally, Copilot Studio prebuilt entities can be used alongside Azure CLU entities, providing a robust framework for entity extraction.

When considering this integration, it's important to evaluate whether your intelligent application workload requires Azure CLU. For instance, Azure CLU supports additional languages, industry-specific dictionaries, and complex entity extraction, which might be essential for your application. Custom entity extractions with Azure CLU can also enable silent or lucky slot filling, allowing the copilot to handle scenarios like identifying both source and destination cities in a single phrase without needing to ask follow-up questions.

Another critical aspect is ensuring that the Azure CLU service quotas and limits align with your copilot's usage. For example, if you expect less than 1,000 calls requiring intent recognition per minute, you might set up Azure CLU using the S tier. This ensures that your copilot can handle the expected workload without exceeding service limits or incurring unexpected costs.

Learn more:

- [Azure CLU integration overview](/microsoft-copilot-studio/advanced-clu-integration)
- [Azure CLU supported languages](/azure/ai-services/language-service/conversational-language-understanding/language-support#languages-supported-by-conversational-language-understanding)
- [Azure CLU limits](/azure/ai-services/language-service/conversational-language-understanding/service-limits)
- [Azure CLU pricing](https://azure.microsoft.com/pricing/details/cognitive-services/language-service/)

## Considerations for Topic Structures

When developing copilots, structuring topics effectively is crucial for creating natural and seamless conversations. Topics are discrete conversation paths that, when combined, allow users to interact with the copilot smoothly. Here are some key considerations for designing topic structures:

- **Trigger-Based Topics**: These topics are activated based on user utterances and serve as entry points. It's important to define clear trigger phrases for these topics. If trigger phrases overlap across multiple topics, consider implementing a catch-all topic that can redirect to the appropriate topic after asking clarifying questions. With entity extraction and slot filling, these clarifying questions can be skipped if the necessary information is already provided.

- **Redirect-Based Topics**: These topics are triggered by redirect actions, activities, or events and can be called by multiple other topics. They should be designed to be reusable and modular, with input and output variables to facilitate seamless integration into various conversation paths.

- **Dual-Trigger Topics**: Some topics can be triggered either through intent recognition or by an explicit redirect. This flexibility allows for more dynamic and responsive conversations.

- **Conversational Boosting and Fallback**: Implement topics that handle scenarios where no matching topic is triggered based on a user query. These fallback topics can provide generic responses or suggest potential topics to keep the conversation going.

**Design Approach:**

- **Custom Topics for Key Scenarios**: Develop a few custom topics for key scenarios with relevant trigger phrases and redirects. Use a parent-child topic structure to manage complex interactions. For unrecognized intents, implement generative answers and fallback mechanisms.

- **Disambiguation Topics**: Plan to use disambiguation topics for operations that require clarifying questions. For example, user account operations might need clarification on the type of operation (for example, create, unlock, suspend) and the system involved (for example, SAP, ServiceNow, Microsoft).

- **Avoiding Duplication**: To avoid duplicating content, create reusable topics for dialog paths that need to be repeated. These reusable topics can be called by a parent topic, and once completed, the conversation can resume the parent topic's logic.

Learn more:

- [Topic best practices](/microsoft-copilot-studio/guidance/topics-overview)

## Handling unrecognized intents

When developing a copilot, effectively managing unrecognized intents ensures a smooth user experience. Unrecognized intents occur when the copilot doesn't understand a user utterance and lacks sufficient confidence to trigger any existing topics. Here are some key considerations for handling these scenarios:

- **Managing Unrecognized Intents**: Initially, direct unrecognized intents to the Conversational Boosting topic, which searches for answers in corporate resources like SharePoint sites and public websites. If no relevant information is found, the system can then fall back to a ChatGPT-like experience using a custom system prompt with the Azure OpenAI GPT-4 model. This approach ensures that users receive helpful responses even when their queries are unplanned.

- **Integration with External Systems**: Consider if you are integrating with external systems as part of the fallback strategy. For example, you could integrate with the Azure OpenAI GPT-4 model using HTTP requests to provide a compliant ChatGPT-like experience.

- **Monitoring Fallback Usage**: Regularly review the percentage of conversations hitting fallback. Use these insights to enrich existing topics or create new ones, ensuring that the copilot continuously improves its understanding and response capabilities.

- **Fallback Topic and Generative Answers**: The [Fallback topic](/microsoft-copilot-studio/guidance/fallback-topic) is triggered when no matching topic is identified. If [Generative Answers](/microsoft-copilot-studio/nlu-boost-conversations) are enabled, the Conversational Boosting topic triggers first on unknown intent events, followed by the Fallback topic if necessary. This layered approach helps manage unrecognized intents effectively.

- **Leveraging Conversational Boosting and Fallback**: Utilize [Generative Answers](/microsoft-copilot-studio/nlu-boost-conversations) to search various data sources or integrate with other systems like Azure Cognitive Service for Language for question answering. This service can handle large volumes of question-and-answer pairs and includes a chitchat model for random questions.

- **Core Scenarios and Custom Topics**: Ensure that core scenarios and topics are well-defined and handled through custom topics. Clearly define the outcomes of these topics to maintain a structured and efficient conversation flow.

## Localization & languages

When building a copilot, consider what languages your intelligent application workload needs to speak and what markets your copilot should support. Localization and language support are critical factors to ensure your intelligent application workload meets the needs of diverse user bases. Here are the main approaches and considerations:

- **One Copilot per Language**: This approach involves creating a separate copilot for each language. It ensures that each copilot is fully optimized for its specific language, but it can be resource-intensive to maintain multiple copilots.

- **One Copilot for Multiple Languages (Configured Translations)**: In this approach, a single copilot supports multiple languages, with translations provided as part of the copilot configuration. This requires updating translations each time the copilot is updated or new content is added. It offers a balance between resource efficiency and language support but requires careful management of translation updates.

- **One Copilot for Multiple Languages (Real-Time Translations)**: This method uses a relay copilot to provide real-time translations at runtime. It allows for rapid deployment of additional languages and reduces the need for frequent translation updates. However, it introduces a dependency on the relay copilot and a real-time translation layer, such as Azure Service Copilot and Azure Cognitive Services Translator.

**Key Considerations:**

- **Languages and Markets**: Determine which languages and markets your copilot needs to support. This will influence your choice of localization strategy.
  
- **Single vs. Multi-Language Copilot**: Decide whether to develop a single copilot that supports multiple languages or separate copilots for each language. This decision depends on factors like resource availability, maintenance capabilities, and the complexity of the languages involved.

- **Translation Timing**: Consider whether translations should be set during the configuration phase or provided in real-time at runtime. Configured translations offer stability and control, while real-time translations provide flexibility and rapid deployment.

Learn more:

- [Copilot Studio supported languages](/microsoft-copilot-studio/authoring-language-support)
- [Azure CLU supported languages](/azure/ai-services/language-service/conversational-language-understanding/language-support#languages-supported-by-conversational-language-understanding)
