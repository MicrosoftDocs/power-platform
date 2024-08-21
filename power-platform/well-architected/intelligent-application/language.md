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

1. **Prebuilt vs. Custom Entities**: Evaluate whether the prebuilt entities provided by Copilot Studio meet your needs. These cover common information types like dates, numbers, and names. If your application requires domain-specific knowledge, you might need to create custom entities.

2. **Complexity of User Inputs**: Consider the complexity and variability of user inputs. For straightforward scenarios, prebuilt entities might suffice. For more complex interactions, custom entities and advanced configurations like regular expressions (regex) might be necessary.

3. **Slot Filling**: Determine if your application requires proactive slot filling, where the copilot actively seeks out and fills in missing information from user inputs. This can enhance the user experience by reducing the need for follow-up questions.

4. **Performance and Scalability**: Assess the performance and scalability of your chosen method. Custom entities and complex configurations might require more processing power and could impact response times.

5. **Ease of Maintenance**: Consider the ease of maintaining and updating your entities. Prebuilt entities are easier to manage, while custom entities might require ongoing adjustments as your application evolves.


## Choose between the standard NLU, Azure CLU or dynamic chaining

In Copilot Studio, topic or action triggering can be done in different ways: You can choose to override the standard NLU (Natural Language Understanding) model with Azure CLU (Conversational Language Understanding) or can be fully replaced with dynamic chaining, a GPT LLM-based one.

| | Standard NLU model | Custom Azure CLU model | Dynamic chaining |
|---|---|---|---|
| **Pro** |  Default, out-of-the-box, model that comes pre-trained, with many predefined entity types.<br>Configuration is done by adding trigger phrases and custom entities (either closed lists with values and synonyms, or regular expressions). | Supports additional languages, with native models.<br>Allows to further customize the intent triggering model for better intent recognition or to address specific industry requirements.<br>Allows for complex entity extraction (e.g., of the same type).<br>Entity extraction can also leverage Copilot Studio standard NLU. |Uses a GPT large language model.<br>Can handle multiple intents and chain topics and/or plugins.<br>Automatically generate questions for missing inputs and answers complex entities  and questions from the conversation context.<br>Configuration is done by simply describing topics, plugin actions, and inputs/outputs. | 
| **Con** |Single intent recognition per query.<br>Cannot be extended.<br>Slot-filling multiple entities of the same type in the same query requires disambiguation for each (e.g., from and to cities) |Single intent recognition per query.<br>Configuration is done in Azure and involves additional costs.<br>Has its own service limits that need to be evaluated.<br>Azure CLU intents and Copilot Studio topics must be carefully kept in sync. |As it’s a generative AI feature, the licensing burn rate of messages is higher than in regular topic triggering. |

## See also

- [Trigger phrases best practices](/microsoft-copilot-studio/guidance/trigger-phrases-best-practices)
- [Slot filling best practices](/microsoft-copilot-studio/guidance/slot-filling-best-practices)
- [Copilot Studio supported languages](/microsoft-copilot-studio/authoring-language-support)
- [Azure CLU supported languages](/azure/ai-services/language-service/conversational-language-understanding/language-support#languages-supported-by-conversational-language-understanding)
- [Azure CLU limits](/azure/ai-services/language-service/conversational-language-understanding/service-limits)
- [Azure CLU pricing](/pricing/details/cognitive-services/language-service/?cdn=disable)
- [How to use CLU as your NLU (video)](https://www.youtube.com/watch?v=PHFEZL_HCY4)
- [Dynamic chaining](/microsoft-copilot-studio/advanced-generative-actions)
