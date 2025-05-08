---
title: Choosing the right option for intent recognition and entity extraction for your intelligent application workloads
description: Optimize your intelligent application workload by choosing the right intent recognition and entity extraction options in Microsoft Copilot Studio.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Intent recognition and entity extraction options for your intelligent application workloads

Intent recognition and entity extraction are key components of natural language understanding.

Intent recognition involves identifying the user's goal or purpose behind their input. For example, if a user says, "I want to book a flight," the intent is to book a flight. Intent recognition helps the agent understand what action needs to be taken based on the user's request.

Entity extraction involves identifying and extracting specific pieces of information from the user's input. Entities can be things like dates, names, locations, or any other relevant data. For instance, in the sentence "Book a flight to New York on September 15," "New York" and "September 15" are entities.

An agent uses the intent to understand the user's goal and the entities to identify the specific details needed to complete the task. Intent recognition and entity extraction, therefore, enable the agent to provide accurate and efficient responses to user queries.

When designing your intelligent application workload, you need to choose the best option for intent recognition and entity extraction to ensure your intelligent application workload provides a positive user experience.

## Definitions

| Term | Definition| 
| --- | ---- | 
| NLU |  Natural language understanding is a subset of natural language processing in AI that focuses on machine reading comprehension. |
| CLU | Conversational language understanding is a feature of Azure AI that enables the creation of custom NLU models. |
| LLM | A large language model is a type of AI model designed to understand and generate human language. |
| GPT | Generative pretrained transformer refers to a family of large language models that use the transformer architecture to understand and generate human-like text. |
| Dynamic chaining | Dynamic chaining is a method of automating triggers for generative actions. Instead of manually defining every possible topic or trigger phrase, dynamic chaining allows the AI to determine which topics or plugin actions need to be called based on the context of the conversation. |

Choosing the right option for intent recognition and entity extraction in your intelligent application workload involves several key considerations:

- **Prebuilt vs. custom entities**: Evaluate whether the prebuilt entities provided by Microsoft Copilot Studio meet your needs. Prebuilt entities cover common information types like dates, numbers, and names. If your application requires domain-specific knowledge, you might need to create custom entities.

- **Complexity of user inputs**: Consider the complexity and variability of user inputs. For straightforward scenarios, prebuilt entities may suffice. For more complex interactions, custom entities and advanced configurations like regular expressions (regex) might be necessary.

- **Slot filling**: Determine if your application requires proactive slot filling, where the agent actively seeks out and fills in missing information from user inputs. Slot filling can enhance the user experience by reducing the need for follow-up questions.

- **Performance and scalability**: Assess the performance and scalability of your chosen method. Custom entities and complex configurations often require more processing power and could affect response times.

- **Ease of maintenance**: Consider the ease of maintaining and updating your entities. Prebuilt entities are easier to manage, while custom entities require ongoing adjustments as your application evolves.

## Choose between the standard NLU, Azure CLU, or dynamic chaining

In Copilot Studio, topic or action triggering can be achieved by using the standard NLU model, combining or overriding it with a custom Azure CLU model, or by fully replacing the NLU model with [dynamic chaining](/microsoft-copilot-studio/guidance/optimize-prompts-topic-configuration), a GPT large language model-based model.

| | Standard NLU model | Custom Azure CLU model | Dynamic chaining |
|---|---|---|---|
| **Pro** |  Default, out-of-the-box model that comes pretrained, with many predefined entity types.<br><br>Configuration is done by adding trigger phrases and custom entities (either closed lists with values and synonyms, or regular expressions). | Supports more languages, with native models.<br><br>Supports customization of the intent triggering model for better intent recognition or to address specific industry requirements.<br><br>Allows for complex entity extraction (for example, of the same type).<br><br>Entity extraction can also use Copilot Studio standard NLU. |Uses a GPT large language model and comes pretrained on a wider spectrum of data.<br><br>Can handle multiple intents and chain topics and/or plugins.<br><br>Automatically generates questions for missing inputs and answers complex entities and questions from the conversation context.<br><br>Configuration is done by describing topics, plugin actions, inputs, and outputs. | 
| **Con** |Single intent recognition per query.<br><br>Can't be extended. You can't modify how the model behaves or fine-tune the model. It's provided as is. <br><br>Slot-filling multiple entities of the same type in the same query requires disambiguation for each (for example, from and to cities). |Single intent recognition per query.<br><br>Configuration is done in Azure at additional cost.<br><br>Has its own service limits that need to be evaluated.<br><br>Azure CLU intents and Copilot Studio topics must be carefully kept in sync. |As it's a generative AI feature, the licensing burn rate of messages is higher than for regular topic triggering. |

## Trigger phrases and slot filling

When developing intelligent application workloads, use native capabilities to enhance intent recognition and streamline conversations. Begin by identifying topic trigger phrases from existing FAQ databases and chat transcripts to ensure anticipated phrases are relevant and accurate. Consider how you'll use entities; for example, whether you'll use regular expressions to find order IDs, prebuilt entities for emails, or closed lists for operation types with synonyms. Also plan how you'll test topic triggers with sample phrases to validate and refine the accuracy of your intent recognition and entity extraction processes. Learn more in [Deployment and test considerations](publishing.md).

### Trigger phrases

Trigger phrases train your agent's NLU model. They help the agent recognize and respond accurately to user utterances by defining specific phrases that trigger particular topics. Proper configuration of these trigger phrases ensures that the agent can correctly identify the user's intent and respond appropriately. When the agent is uncertain about which topic to trigger, it can suggest up to three potential topic candidates (Multiple Topics Matched system topic) or fall back to a default response if no topic is identified. This mechanism helps maintain the flow of conversation and ensures that the agent can handle a wide range of user inputs effectively.

### Entity extraction and slot filling

Entity extraction and slot filling are important components in developing effective agents. These processes enable the agent to acquire and use information efficiently by identifying and extracting relevant details from user queries.

**Entity extraction** involves parsing the user's input to identify specific pieces of information. For example, in the query "I'd like to order three large blue t-shirts," the agent's NLU model should extract the following entities:

- **Quantity**: 3
- **Color**: Blue
- **Size**: Large
- **Item Type**: T-Shirt

**Slot filling** is the process of using these extracted entities to complete the necessary information for a given task. In this example, the agent recognizes the topic as an order and fills in the required slots with the extracted entities. The agent is able to understand the user's request without asking more questions, streamlining the interaction.

Entity extraction and slot filling enable agents to handle complex queries more effectively, providing accurate and contextually relevant responses and enhancing the user experience.

Learn more:

- [Optimizing trigger phrases and natural language understanding in Copilot Studio](/microsoft-copilot-studio/guidance/trigger-phrases-best-practices)
- [Entities and slot filling best practices in Copilot Studio](/microsoft-copilot-studio/guidance/slot-filling-best-practices)

## Integrating Microsoft Copilot Studio with Azure CLU

Integrating a CLU model with a Copilot Studio agent can significantly enhance the agent's capabilities. This integration involves mapping Azure CLU intents to Copilot Studio topics, allowing the agent to understand and respond to user intents more accurately. Additionally, Copilot Studio prebuilt entities can be used alongside Azure CLU entities, providing a robust framework for entity extraction.

When considering this integration, it's important to evaluate whether your intelligent application workload requires Azure CLU. For instance, Azure CLU supports more languages, industry-specific dictionaries, and complex entity extraction, which might be essential for your application. Custom entity extractions with Azure CLU can also enable silent or "lucky" slot filling, which allows the agent to handle scenarios like identifying both source and destination cities in a single phrase without asking follow-up questions.

Another important aspect is ensuring that the Azure CLU service quotas and limits align with your agent's usage. For example, if you anticipate fewer than 1,000 calls requiring intent recognition per minute, you might set up Azure CLU using the S tier. This configuration ensures that your agent can handle the expected workload without exceeding service limits or incurring unexpected costs.

Learn more:

- [Azure CLU integration overview](/microsoft-copilot-studio/advanced-clu-integration)
- [Azure CLU supported languages](/azure/ai-services/language-service/conversational-language-understanding/language-support#languages-supported-by-conversational-language-understanding)
- [Azure CLU limits](/azure/ai-services/language-service/conversational-language-understanding/service-limits)
- [Azure CLU pricing](https://azure.microsoft.com/pricing/details/cognitive-services/language-service/)

## Considerations for topic structures

Structuring topics effectively is important for creating natural and seamless conversations. Topics are discrete conversation paths that, when combined, allow users to interact with the agent smoothly. Here are some key considerations for designing topic structures:

- **Trigger-based topics**: These topics are activated based on user utterances and serve as entry points. Define clear trigger phrases for these topics. If trigger phrases overlap across multiple topics, consider implementing a catch-all topic that can redirect to the appropriate topic after asking clarifying questions. With entity extraction and slot filling, these clarifying questions can be skipped if the necessary information is already provided.

- **Redirect-based topics**: These topics are triggered by redirect actions, activities, or events, and can be called by multiple other topics. They should be designed to be reusable and modular, with input and output variables to facilitate seamless integration into various conversation paths.

- **Dual-trigger topics**: Some topics can be triggered either through intent recognition or by an explicit redirect. This flexibility allows for more dynamic and responsive conversations.

- **Conversational boosting and fallback**: Create fallback topics for situations where no matching topic is triggered by the user's query. These topics can offer generic responses or suggest relevant topics to maintain the conversation flow.

**Design approach:**

- **Custom topics for key scenarios**: Develop a few custom topics for key scenarios with relevant trigger phrases and redirects. Use a parent-child topic structure to manage complex interactions. For unrecognized intents, implement generative answers and fallback mechanisms.

- **Disambiguation topics**: Plan to use disambiguation topics for operations that require clarifying questions. For example, user account operations might need clarification on the type of operation (for example, create, unlock, suspend) and the system involved (for example, SAP, ServiceNow, Microsoft).

- **Avoiding duplication**: To avoid duplicating content, create reusable topics for dialog paths that need to be repeated. These reusable topics can be called by a parent topic and, once completed, the conversation can resume the parent topic's logic.

Learn more:

- [Topic best practices](/microsoft-copilot-studio/guidance/topics-overview)

## Handling unrecognized intents

Effectively managing unrecognized intents ensures a smooth user experience. Unrecognized intents occur when the agent doesn't understand a user utterance and lacks sufficient confidence to trigger an existing topic. Here are some suggestions for handling these scenarios:

- **Managing unrecognized intents**: Initially, direct unrecognized intents to the Conversational boosting system topic, which searches for answers in public websites and corporate resources like SharePoint sites. If no relevant information is found, the system can then fall back to a ChatGPT-like experience using a custom system prompt with the Azure OpenAI GPT-4 model. This approach ensures that users receive helpful responses even when queries are unplanned.

- **Integration with external systems**: Consider if you're integrating with external systems as part of your fallback strategy. For example, integrating with the Azure OpenAI GPT-4 model using HTTP requests to provide a compliant ChatGPT-like experience.

- **Monitoring fallback usage**: Regularly review the percentage of conversations hitting fallback. Use these insights to enrich existing topics or create new ones, ensuring that the agent continuously improves its understanding and response capabilities.

- **Fallback topic and generative answers**: The [Fallback system topic](/microsoft-copilot-studio/guidance/fallback-topic) is triggered when no matching topic is identified. If [Generative Answers](/microsoft-copilot-studio/nlu-boost-conversations) are enabled, the Conversational boosting topic triggers first on unknown intent events, followed by the Fallback topic as required. This layered approach helps manage unrecognized intents effectively.

- **Use conversational boosting and fallback**: Use [Generative Answers](/microsoft-copilot-studio/nlu-boost-conversations) to search various data sources or integrate with other systems like Azure Cognitive Service for Language. This service can handle large volumes of question-and-answer pairs and includes a chitchat model for random questions.

- **Core scenarios and custom topics**: Ensure that core scenarios and topics are well-defined and handled through custom topics. Clearly define the outcomes of these topics to maintain a structured and efficient conversation flow.

## Localization and languages

When building an agent, consider the languages and markets your intelligent application workload must support. Localization and language support are critical factors to ensure your intelligent application workload meets the needs of diverse user bases. Here are some suggested approaches:

- **One agent per language**: This approach involves creating a separate agent for each language. It ensures that each agent is fully optimized for its specific language; however, it can be resource-intensive to maintain multiple agents.

- **One agent for multiple languages (configured translations)**: With this approach, a single agent supports multiple languages, with translations provided as part of the agent configuration. This approach requires updating translations each time the agent is updated or new content is added. It offers a balance between resource efficiency and language support but requires careful management of translation updates.

- **One agent for multiple languages (real-time translations)**: This method uses a relay agent to provide real-time translations at runtime. It allows for rapid deployment of more languages and reduces the need for frequent translation updates. However, it introduces a dependency on the relay agent and a real-time translation layer, such as Azure Service Copilot and Azure Cognitive Services Translator.

**Key considerations:**

- **Languages and markets**: The languages and markets your agent must support influence your localization strategy.
  
- **Single vs. multilanguage agent**: Decide whether to develop a single agent that supports multiple languages or separate agents for each language. This decision depends on factors like resource availability, maintenance capabilities, and the complexity of the languages involved.

- **Translation timing**: Consider whether translations should be set during the configuration phase or provided in real time at runtime. Configured translations offer stability and control, while real-time translations provide flexibility and rapid deployment.

Learn more:

- [Copilot Studio supported languages](/microsoft-copilot-studio/authoring-language-support)
- [Azure CLU supported languages](/azure/ai-services/language-service/conversational-language-understanding/language-support#languages-supported-by-conversational-language-understanding)
