---
title: ABN AMRO Bank enhances AI capabilities with Copilot Studio and Azure services
description: Learn how ABN AMRO enhanced customer and employee interactions using Microsoft Copilot Studio, reducing costs and improving AI capabilities.
#customer intent: As a Power Platform user, I want to learn how ABN AMRO enhanced customer and employee interactions using Copilot Studio so that I can apply similar strategies in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.topic: overview
ms.date: 05/13/2025
---

# ABN AMRO Bank enhances AI capabilities with Copilot Studio and Azure services

In this article, you learn how ABN AMRO Bank, one of the largest banks in the Netherlands, used Microsoft Copilot Studio to enhance its customer and employee interactions. The bank uses Azure services for platform monitoring and application lifecycle management, among other purposes. It uses Power BI for analyzing and visualizing Copilot key performance indicators.

Headquartered in Amsterdam, ABN AMRO has more than 22,000 employees and serves more than 5 million retail customers and 365,000 commercial clients in 15 countries/regions. With the adoption of Copilot Studio, ABN AMRO is now better positioned to deliver personalized and effective digital banking experiences for all its customers and employees, while using advanced AI technologies to stay at the forefront of innovation.

The bank, which was already operating several chatbots, wanted to explore a new platform to enhance its AI capabilities. "With the rapid introduction of generative AI, we anticipate that our customers are going to expect much more from a chatbot and we wanted to get ahead of that demand," says Bobby van Groningen, IT Lead at ABN AMRO.

By rapidly transitioning to Copilot Studio and deploying its new agents, ABN AMRO was able to integrate Azure AI Language conversational language understanding for superior accuracy in processing Dutch, leading to more precise and reliable customer and employee interactions.

Because Copilot Studio includes out of the box the features the bank needs, ABN AMRO significantly reduced its operational and maintenance costs. The bank also experienced reduced drop-off and transfer rates.

> Microsoft's leadership and innovation in the AI space led us to select Microsoft Copilot Studio. We also liked that many of the chatbot capabilities we needed are available out of the box. This contributed to an intuitive and easy-to-use development experience.
>
> — *Bobby van Groningen, IT Engineering Lead at ABN AMRO Bank*

Read the full story: [ABN AMRO Bank migrates to Microsoft Copilot Studio to support over 3.5 million customer conversations](https://www.microsoft.com/en/customers/story/19754-abn-amro-bank-microsoft-copilot-studio)

## Case study

In this technical case study, you learn how:

- ABN AMRO Bank enhanced customer and employee interactions using Copilot Studio, Azure, and Power BI.
- Copilot Studio improves service accuracy and efficiency while significantly reducing operational and maintenance costs.
- You can deliver personalized and effective digital customer services using advanced AI technologies.
- You can transition efficiently to a sophisticated AI platform with advanced language recognition.
- You can build a roadmap and foundation for further advanced AI features, such as retrieval-augmented generation (RAG) patterns and language models for intent recognition.

## The scenario

As part of its strategy to enhance customer and employee interactions, ABN AMRO Bank deployed an AI-powered chatbot infrastructure called Anna for its customers. The infrastructure around Anna faced challenges such as high maintenance and scaling costs, high drop-off and transfer rates, limited capabilities that restricted evolving use cases, and difficulties in natural language understanding (NLU) performance, especially in Dutch. Anna was available as both a text-based chatbot and an interactive voice response (IVR) bot.

ABN AMRO experienced similar challenges with its internal chatbot, Abby. Abby assisted bank employees with IT support, facilities questions, and HR and other company-related questions. Abby was used with text-based interactions.

By transitioning to Microsoft Copilot Studio, ABN AMRO was able to use [Azure AI Language conversational language understanding](/azure/ai-services/language-service/conversational-language-understanding/overview) (CLU) for intent recognition, a critical factor in accurately interpreting customer and employee requests. The bank replaced its Anna and Abby chatbots with a new Anna and Abby agent experience for customers and employees. The new agents handle more complex queries, provide better service, and reduce operational costs.

## Implementation approach

ABN AMRO created a contact center platform with a Copilot Studio agent in a stepped approach:

1. Migrate the chatbot infrastructure to Copilot Studio.
1. Set up a dialog manager to recognize intents and extract entities.
1. Implement continuous integration and delivery.

### Migrate the chatbot infrastructure to Copilot Studio

ABN AMRO Bank used Copilot Studio to create a new AI-driven, natural-language experience that replaced its chatbots with new Anna and Abby agents. The Abby agent handles internal requests, such as IT Helpdesk support and facilities services.

The Anna agent handles more than 2 million text conversations and 1.5 million voice conversations with customers every year. It covers a wide variety of topics, such as unblocking a debit card, changing the withdrawal limit at an ATM, or navigating ABN AMRO's digital bank services. The following screenshot shows the new Anna agent interface on the bank's customer website:

:::image type="content" source="media/abn-amro-bank/agent.png" alt-text="Screenshot of the Anna agent interface that helps ABN AMRO customers with their banking needs." lightbox="media/abn-amro-bank/agent.png":::

The bank completed the migration to Copilot Studio in just six months, driven by a successful partnership with Microsoft and [Capgemini](https://www.capgemini.com/). "We helped anchor the partnership with our team and the ABN AMRO team, laying the groundwork for a successful implementation," says Mark Oost, Vice President AI & Generative AI, Insights & Data at Capgemini.

### Use Copilot Studio for intent recognition and entity extraction

Like its predecessor, the new Abby agent supports both text and voice channels. The text channel passes chat interactions from the bank's contact center as a service (CCaaS) platform to Azure middleware. Voice calls are processed in Azure Communication Services before reaching the middleware.

The middleware layer enhances these interactions by using Copilot Studio as the dialog manager, integrated with Azure AI Language CLU for precise intent recognition and entity extraction. Intent recognition helps Anna understand what the customer wants to do. Entity extraction recognizes information in the text or voice interaction and extracts the specific elements that are relevant to the customer's intent.

With Copilot Studio, the conversational IVR on the voice channel understands customer inquiries and routes them to the correct call center department. It also fully resolves certain queries without escalating to a live agent, which enhances ABN AMRO's operational efficiency and customer satisfaction.

The Abby employee agent is generated directly from Copilot Studio and is deployed to the employee portal.

The following diagram shows the integration of Microsoft Copilot Studio with various services for conversational AI and generative AI at ABN AMRO Bank. It includes the following components:

- Anna customer agent: Chat, voice, live agent handoff, CCaaS platform
- Abby employee agent: Chat on employee portal
- Azure AI Language: Intent recognition
- Azure middleware: Message relay and personal data removal
- IVR: Telephony and speech services
- AI-generated answers: GPT models and vector search
- Continuous integration: Azure DevOps
- Analytics: Power BI and Azure Data Lake Storage

:::image type="content" source="media/abn-amro-bank/component.png" alt-text="Diagram of ABN AMRO's integration with Microsoft Copilot Studio and Azure AI components for AI-powered customer and employee support." lightbox="media/abn-amro-bank/component.png":::

### Implement continuous integration and delivery

To support continuous integration and continuous delivery (CI/CD), ABN AMRO uses Azure DevOps with Microsoft Power Platform Build Tools. Copilot Studio agents are solution aware: Components are consolidated into a solution, which is deployed to downstream environments using Azure Pipelines, one of the services in Azure DevOps. This technical setup supports efficient development, testing, and deployment processes, which in turn makes possible rapid and reliable updates. Azure Application Insights provides near real-time technical monitoring of the platform.

The architecture's scalability and integration with advanced AI capabilities allow ABN AMRO to continuously innovate, enhancing its customer-facing and employee-support solutions.

## Key takeaways

This case study of ABN AMRO's customer banking and employee services agents demonstrates the potential of using Copilot Studio with Azure services to set up a complete contact center as a service platform. Here are some key takeaways for IT professionals who are considering implementing a similar agent-based solution in their own organizations:

- **Intent recognition:** Use Copilot Studio with Azure AI Language CLU, along with Azure Communication Services and Azure AI Speech for speech-to-text and text-to-speech, to build best-in-class intent recognition and entity extraction for a specific language.

- **Application lifecycle management:** Use Azure DevOps for source control and automated application lifecycle management.

- **Key performance indicators:** Use Power BI for visualizations and business intelligence on your agent's key performance indicators.

With the migration to Copilot Studio and after deploying its new agents, ABN AMRO enjoys the following key benefits:

- **Enhanced customer and employee experience:** The Anna agent, operating across both text and voice channels, consistently delivers high customer satisfaction. The IVR bot experience reduced drop-off and transfer rates. The Abby agent, supporting internal employee needs, is a more effective and dependable tool, contributing to an overall streamlined user experience.

- **Superior accuracy in language processing:** By integrating Azure AI Language CLU with Copilot Studio, ABN AMRO increased its accuracy rate in intent recognition by 7% for Dutch, leading to more precise and reliable customer and employee interactions.

- **Cost efficiency and scalability:** The transition to Copilot Studio significantly reduced operational and maintenance costs, allowing ABN AMRO to scale its AI capabilities more effectively to meet evolving business needs.

- **Faster time to market:** The speed of migrating to Copilot Studio allowed ABN AMRO to foresee faster time to market for improvements and added functionality to its new agents. ABN AMRO also foresees faster launches of new products and integration with other Power Platform products.

## Looking ahead

With Copilot Studio's robust architecture, ABN AMRO is well positioned to integrate advanced AI features, including retrieval-augmented generation patterns, and future developments in language models as the orchestration layer for intent recognition.

"ABN AMRO has created a maturity model towards having even more natural and productive conversations with our customers," says van Groningen. "This will be implemented via a combination of great features in Copilot Studio as well as strong Azure services, like OpenAI models and Azure AI Search."

Looking to the future, ABN AMRO is already planning agents for other areas of the business. "Thanks to the efficiency of Microsoft Copilot Studio, we're now able to develop chatbot support for a wide range of business applications&mdash;and get them into production very quickly," says van Groningen.

The bank's next new agent will be set up as a full generative AI agent. The project will also be used as a testing ground for similar, generative AI-driven experiences in Anna. As van Groningen notes, "At ABN AMRO, we are just beginning our joint generative AI journey. But with Microsoft Copilot Studio, we're delivering the benefits of generative AI quickly and effectively to our customers."

## Related information

- [Copilot Studio overview](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)
- [Build agents with Copilot Studio agent builder](/microsoft-365-copilot/extensibility/copilot-studio-agent-builder-build)
- [Quickstart guide for building agents with generative AI](/microsoft-copilot-studio/nlu-gpt-quickstart)
- [AI-based agent authoring overview](/microsoft-copilot-studio/nlu-gpt-overview)
- [Conversational language understanding integration overview](/microsoft-copilot-studio/advanced-clu-integration)
- [Configure and create multilingual agents](/microsoft-copilot-studio/multilingual)
- [Create and manage solutions in Copilot Studio](/microsoft-copilot-studio/authoring-solutions-overview)
