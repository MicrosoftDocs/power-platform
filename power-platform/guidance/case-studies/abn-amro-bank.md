---
title: Enhance AI capabilities at ABN AMRO with Copilot Studio and Azure
description: Learn how ABN AMRO enhanced customer and employee interactions using Microsoft Copilot Studio and Azure, reducing costs and improving AI capabilities.
#customer intent: As a Power Platform user, I want to learn how ABN AMRO enhanced customer and employee interactions using Copilot Studio and Azure so that I can apply similar strategies in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 04/25/2025
---

# Enhance AI capabilities at ABN AMRO with Copilot Studio and Azure

In this article, you learn how ABN AMRO Bank, one of the largest banks in the Netherlands, enhances its customer and employee interactions using Microsoft Copilot Studio. The bank uses Azure services for various purposes, including platform monitoring, application lifecycle management, and Power BI for analyzing and visualizing Copilot key performance indicators.

Headquartered in Amsterdam, ABN AMRO has over 22,000 employees and serves over 5 million retail customers and 365,000 commercial clients across 15 countries. With the adoption of Copilot Studio, ABN AMRO is better positioned to deliver personalized and effective digital banking experiences for all its customers and employees, while using advanced AI technologies to stay at the forefront of innovation.

The bank, which already operates several chatbots, wants to explore a new platform that enhances its AI capabilities. 

> With the rapid introduction of Generative AI, we anticipate that our customers are going to expect much more from a chatbot and we want to get ahead of that demand. 
>
> -Bobby van Groningen, IT Lead at ABN AMRO.

By rapidly transitioning to Copilot Studio and deploying its new agents, ABN AMRO integrates Azure AI Conversational Language Understanding (CLU) for superior accuracy in processing Dutch, leading to more precise and reliable customer and employee interactions.

Because Copilot Studio already enables the features it needs, ABN AMRO significantly reduces its operational and maintenance costs. The bank also experiences reduced drop-off and transfer rates.




:::image type="content" source="media/abn-amro-bank/lead.png" alt-text="Screenshot of Bobby van Groningen, IT Engineering Lead at ABN AMRO Bank." lightbox = "media/abn-amro-bank/lead.png":::

> Microsoft’s leadership and innovation in the AI space led us to select Microsoft Copilot Studio. We also liked that many of the chatbot capabilities we needed are available out of the box. This contributes to an intuitive and easy-to-use development experience.
> 
> Bobby van Groningen, IT Engineering Lead at ABN AMRO Bank  

## Case study

In this technical case study, you learn how:

- ABN AMRO Bank improves customer and employee interactions using Copilot Studio, Azure, and Power BI.

- Copilot Studio improves service accuracy and efficiency while significantly reducing operational and maintenance costs.

- Deliver personalized and effective digital customer services using advanced AI technologies.

- Transition efficiently to a sophisticated AI platform with advanced language recognition.

- Build a roadmap and foundation for advanced AI features, such as retrieval-augmented generation (RAG) patterns and large language models (LLMs) for intent recognition.

## The scenario

To enhance customer and employee interactions, ABN AMRO Bank deployed an AI-powered chatbot infrastructure for its customers, Anna, which is available as both a text-based chatbot and an Interactive Voice Response (IVR) bot.

The infrastructure around Anna faced challenges like high maintenance and scaling costs, high drop-off and transfer rates, limited capabilities restricting evolving use cases, and difficulties in natural language understanding (NLU) performance, especially in Dutch. Anna features both text and voice-based interactions.

ABN AMRO experienced similar limitations with their internal Abby chatbot, which is designed to support the bank’s employees. Abby assists employees with IT support, facilities questions, and HR and company-related questions. Abby is used with text-based interactions.

By transitioning to Microsoft Copilot Studio, ABN AMRO uses Azure AI Conversational Language Understanding (CLU) for intent recognition, which is critical for accurately interpreting customer and employee requests.

ABN AMRO delivers personalized and effective digital banking experiences using advanced AI technologies to stay at the forefront of innovation.

## Implementation approach

To create a contact center platform with a Copilot Studio agent, ABN AMRO follows these steps:

- Migrate the chatbot infrastructure to Copilot Studio.
- Set up a dialog manager to recognize intents and extract entities.
- Enable continuous integration and delivery.

## Migrate a chatbot infrastructure to Copilot Studio

ABN AMRO Bank used Copilot Studio to create ‘agents’ – a new AI-driven, natural-language experience that replaced ABN AMRO’s original chatbots. The Copilot Studio agents replaced both of their existing chatbots: Anna, for customer services, and Abby, for employee questions and support.

The image below demonstrates how the new Anna agent helps customers with their banking needs.

:::image type="content" source="media/abn-amro-bank/agent.png" alt-text="Screenshot of the Anna agent interface that helps customers with banking needs." lightbox="media/abn-amro-bank/agent.png":::

The “Anna” agent supports over 2 million text conversations and 1.5 million voice conversations with customers every year. It covers a wide variety of topics, such as unblocking a debit card, changing the withdrawal limit at an ATM, or navigating ABN AMRO's digital bank services.

The “Abby” agent covers internal questions, such as IT Helpdesk support and facilities services.

The migration to Copilot Studio was completed in six months, driven by a successful partnership with Microsoft and [CapGemini](https://www.capgemini.com/). 

> We anchored the partnership with our team and the ABN AMRO team, laying the groundwork for a successful implementation.
>
> -Mark Oost, Vice President AI & Generative AI, Insights and Data at CapGemini. 

## Copilot Studio for intent recognition and entity extraction

ABN AMRO created a new version of Anna as a Copilot Studio agent, supported by text and voice channels.

ABN AMRO's chat interactions are now passed from ABN AMRO Bank’s Azure middleware and Contact Center as a Service (CCaaS) platform, which is used for both the voice and text channels of the Anna agent. Voice calls are processed in Azure Communication Services (ACS) before reaching the middleware.

The middleware layer further enhances these interactions by using Microsoft Copilot Studio as the dialog manager, integrated with Azure AI Conversational Language Understanding (CLU) for precise intent recognition and entity extraction. Anna uses intent recognition to identify what the user wants to do and entity extraction to find and extract specific information from text and voice that helps provide customers with the information they need.

The Abby employee agent is generated directly from Copilot Studio and deployed to the employee portal. The agent answers internal questions, including topics like HR, benefits, IT, system support, and employee facilities.

The following image provides more information about Azure’s role in the middleware component.

:::image type="content" source="media/abn-amro-bank/component.png" alt-text="Screenshot of a diagram showing Azure's role in the middleware component for ABN AMRO Bank." lightbox = "media/abn-amro-bank/component.png":::

With Copilot Studio, the conversational IVR on the voice channel understands customer inquiries and routes them to the correct call center department. It also resolves certain queries without escalating to a live agent, enhancing ABN AMRO’s operational efficiency and customer satisfaction.

## Enable continuous integration and delivery

To support continuous integration and continuous delivery (CI/CD), ABN AMRO uses Azure DevOps with Power Platform Build Tools. Copilot Studio agents are solution aware. Components are consolidated into a solution and deployed to downstream environments using Azure DevOps pipelines. This technical setup supports efficient development, testing, and deployment processes, enabling rapid and reliable updates. Azure Application Insights provides near real-time technical monitoring of the platform.

The architecture's scalability and integration with advanced AI capabilities let ABN AMRO continuously innovate, enhancing its customer-facing and employee-support solutions.

## Takeaways

The case study of ABN AMRO’s customer banking and employee services agent shows the potential of using Copilot Studio with Azure services to set up a complete contact center as a service (CCaaS) platform. Here are some key takeaways for IT professionals who are looking to implement a similar agent-based solution in their own organizations:

- **Intent recognition:** Use Copilot Studio with Azure AI conversational language understanding (CLU), along with Azure Communication Services and Azure AI Speech (for speech-to-text and text-to-speech), to build high-quality intent recognition and entity extraction for a specific language.

- **Application lifecycle management:** Use Azure DevOps for source control-centric and automated application lifecycle management.

- **Key performance indicators:** Use Power BI for visualizations and business intelligence on agents' key performance indicators.

Since migrating to Copilot Studio and deploying its new agents, ABN AMRO gains the following key benefits:

- **Enhanced customer and employee experience:** The Anna agent, operating across both text and voice channels, consistently delivers high customer satisfaction, while the IVR bot experiences reduced drop-off and transfer rates. The Abby agent, supporting internal employee needs, is a more effective and dependable tool, contributing to an overall streamlined user experience.

- **Superior accuracy in language processing:** By integrating Azure AI conversational language understanding (CLU) with Copilot Studio, ABN AMRO improves its accuracy rate in intent recognition by 7% for Dutch, leading to more precise and reliable customer and employee interactions.

- **Cost efficiency and scalability:** The transition to Copilot Studio reduces operational and maintenance costs, allowing ABN AMRO to scale its AI capabilities more effectively to meet evolving business needs.

- **Faster time to market:** The speed of migrating to Copilot Studio lets ABN AMRO achieve faster time to market for improvements and added functionality to its new agents. It also enables faster launches of new products and integration with other Power Platform products.

## What’s next

With Copilot Studio's robust architecture, ABN AMRO is positioned to integrate advanced AI features, including retrieval-augmented generation (RAG) patterns, and future developments like large language models (LLMs) as the orchestration layer for intent recognition.

>ABN AMRO creates a maturity model to enable more natural and productive conversations with its customers. This is implemented through a combination of features in Copilot Studio and Azure services, like OpenAI models and Azure Search.
>
> -van Groningen.

ABN AMRO is planning agents for other areas of the business. 

> Thanks to the efficiency of Microsoft Copilot Studio, ABN AMRO can develop chatbot support for a wide range of business applications—and get them into production quickly.
>
> -van Groningen.

The bank's next agent is set up as a full generative AI agent. The project is also used as a testing ground for similar generative AI-driven experiences in Anna. 
> At ABN AMRO, the generative AI journey is just beginning. But with Microsoft Copilot Studio, ABN AMRO delivers the benefits of generative AI quickly and effectively to its customers.
>
> -van Groningen 

## Related information

- [Copilot Studio overview](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)

- [Build agents with Copilot Studio agent builder](/microsoft-365-copilot/extensibility/copilot-studio-agent-builder-build)

- [Quickstart guide for building agents with generative AI](/microsoft-copilot-studio/nlu-gpt-quickstart)

- [AI-based agent authoring overview](/microsoft-copilot-studio/nlu-gpt-overview)

- [Conversational language understanding integration overview](/microsoft-copilot-studio/advanced-clu-integration)

- [Configure and create multilingual agents](/microsoft-copilot-studio/multilingual)

- [Create and manage solutions in Copilot Studio](/microsoft-copilot-studio/authoring-solutions-overview)