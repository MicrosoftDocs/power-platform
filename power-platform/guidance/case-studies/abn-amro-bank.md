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

In this article, you learn how ABN AMRO Bank, one of the largest banks in the Netherlands, enhances their customer and employee interactions using Microsoft Copilot Studio. They use Azure services for various purposes, including platform monitoring and application lifecycle management, as well as Power BI for analyzing and visualizing Copilot key performance indicators.

Headquartered in Amsterdam, ABN AMRO has over 22,000 employees and serves over 5 million retail customers and 365,000 commercial clients across 15 countries. With the adoption of Copilot Studio, ABN AMRO is now better positioned to deliver personalized and effective digital banking experiences for all their customers and employees, while leveraging advanced AI technologies to stay at the forefront of innovation.

The bank, which is already operating several chatbots, wants to explore a new platform that would enhance their AI capabilities. 

> With the rapid introduction of Generative AI, we anticipate that our customers are going to expect much more from a chatbot and we want to get ahead of that demand. 
>
> -Bobby van Groningen, IT Lead at ABN AMRO.

By rapidly transitioning to Copilot Studio and deploying their new agents, ABN AMRO is able to integrate Azure AI Conversational Language Understanding (CLU) for superior accuracy in processing Dutch, leading to more precise and reliable customer and employee interactions.

Because Copilot Studio already enables the features they need, ABN AMRO significantly reduces their operational and maintenance costs. They also experienced reduced drop-off and transfer rates.




:::image type="content" source="media/abn-amro-bank/lead.png" alt-text="Screenshot of Bobby van Groningen, IT Engineering Lead at ABN AMRO Bank." lightbox = "media/abn-amro-bank/lead.png":::

> Microsoft’s leadership and innovation in the AI space led us to select Microsoft Copilot Studio. We also liked that many of the chatbot capabilities we needed were available out of the box. This contributed to an intuitive and easy-to-use development experience.
> 
> Bobby van Groningen, IT Engineering Lead at ABN AMRO Bank  

## Case study

In this technical case study, you learn how:

- ABN AMRO Bank enhanced their customer and employee interactions using Copilot Studio, Azure, and Power BI.

- Copilot Studio can improve service accuracy and efficiency while significantly reducing operational and maintenance costs.

- To deliver personalized and effective digital customer services while leveraging advanced AI technologies.

- To efficiently transition to a sophisticated AI platform with advanced language recognition.

- To build a roadmap and foundation for further advanced AI features, such as Retrieval-Augmented Generation (RAG) patterns and Large Language Models (LLMs) for intent recognition.

## The scenario

As part of its strategy to enhance customer and employee interactions, ABN AMRO Bank previously deployed an AI-powered chatbot infrastructure for its customers, Anna, which was available as both a text-based chatbot and an Interactive Voice Response (IVR) bot.

However, the infrastructure around Anna faced several challenges, including high maintenance and scaling costs, high drop-off and transfer rates, limited capabilities that restricted evolving use cases, and difficulties in their natural language understanding (NLU) performance, particularly in Dutch. Anna features both text and voice-based interactions.

ABN AMRO experienced similar limitations with their internal Abby chatbot, which is designed to support the bank’s employees. Abby assists employees with IT questions and support, facilities questions, as well as HR and company-related questions. Abby is used with text-based interactions.

By transitioning to Microsoft Copilot Studio, ABN AMRO leveraged Azure AI Conversational Language Understanding (CLU) for intent recognition, a critical factor in accurately interpreting customer and employee requests.

ABN AMRO is now better positioned to deliver personalized and effective digital banking experiences, leveraging advanced AI technologies to stay at the forefront of innovation.

## Implementation approach

To create a contact center platform with a Copilot Studio agent, ABN AMRO takes the following steps:

- Migrate a chatbot infrastructure to Copilot Studio.

- Set up a dialog manager for intent recognition and entity extraction.

- Enable continuous integration and delivery.

## Migrate a chatbot infrastructure to Copilot Studio

ABN AMRO Bank used Copilot Studio to create ‘agents’ – a new kind of AI-driven, natural-language experience that replaced ABN AMRO’s original chatbots. The Copilot Studio agents replaced both of their existing chatbots: Anna, for customer services, and Abby, for employee questions and support.

The image below demonstrates how the new Anna agent helps customers with their banking needs.

:::image type="content" source="media/abn-amro-bank/agent.png" alt-text="Screenshot of the Anna agent interface helping customers with banking needs." lightbox = "media/abn-amro-bank/agent.png":::

The “Anna” agent supports over 2 million text conversations and 1.5 million voice conversations with customers every year and can cover a wide variety of topics – from help with unblocking a debit card or changing the withdrawal limit at an ATM – to navigate through the services provided in ABN AMRO's digital bank.

The “Abby” agent covers internal questions, such as IT Helpdesk support and facilities services.

The migration to Copilot Studio was completed in just 6 months – driven by a successful partnership with Microsoft and [CapGemini](https://www.capgemini.com/). 

> We helped anchor the partnership with our team and the ABN AMRO team, laying the groundwork for a successful implementation.
>
> -Mark Oost, Vice President AI & Generative AI, Insights and Data at CapGemini. 

## Copilot Studio for intent recognition and entity extraction

ABN AMRO created a new version of Anna, as a Copilot Studio agent, which is supported by text and voice channels.

ABN AMRO's chat interactions are now passed from ABN AMRO Bank’s Azure middleware and Contact Center as a Service (CCaaS) platform, which is used for both the voice and text channels of the Anna agent. Voice calls are processed in Azure Communication Services (ACS) before the middleware.

The middleware layer further enhances these interactions by leveraging Microsoft Copilot Studio as the dialog manager, integrated with Azure AI Conversational Language Understanding (CLU) for precise intent recognition and entity extraction. Anna uses intent recognition to identify what the user wants to do and entity extraction to recognize and extract the specific information from the text and voice that’s relevant to getting the customers the information they need.

Meanwhile, the Abby employee agent is generated directly as an agent from Copilot Studio and is deployed to the employee portal. The agent answers internal questions, including topics like HR, benefits, IT and system support, and employee facilities.

The image below provides more information about Azure’s role in the middleware component.

:::image type="content" source="media/abn-amro-bank/component.png" alt-text="Screenshot of a diagram showing Azure's role in the middleware component for ABN AMRO Bank." lightbox = "media/abn-amro-bank/component.png":::

With Copilot Studio, the conversational IVR on the voice channel can understand customer inquiries and route them to the correct call center department. Additionally, it fully resolves certain queries without escalating to a live agent, which enhances ABN AMRO’s operational efficiency and customer satisfaction.

## Enable continuous integration and delivery

To support continuous integration and continuous delivery (CI/CD), ABN AMRO utilizes Azure DevOps in conjunction with Power Platform Build Tools. Copilot Studio agents are solution aware. Components are consolidated into a solution, which is deployed to downstream environments using Azure DevOps pipelines. This technical setup facilitates efficient development, testing, and deployment processes, which enables rapid and reliable updates. Azure Application Insights provides near real-time technical monitoring of the platform.

The architecture’s scalability and integration with advanced AI capabilities allow ABN AMRO to continuously innovate, enhancing their customer-facing and employee-support solutions.

## Takeaways

The case study of ABN AMRO’s customer banking and employee services agent demonstrates the potential of using Copilot Studio with Azure services to set up a complete Contact Center as a Service (CCaaS) platform. Here are some key takeaways for IT professionals who are looking to implement a similar agent-based solution in their own organizations:

- **Intent recognition:** Leverage Copilot Studio with Azure AI Conversational Language Understanding (CLU), in conjunction with Azure Communication Services and Azure AI Speech (for speech-to-text and text-to-speech) to build best-in-class intent recognition and entity extraction for a specific language.

- **Application lifecycle management:** Use Azure DevOps for source control-centric and automated application lifecycle management.

- **Key performance indicators:** Use Power BI for visualizations and business intelligence on your agent’s key performance indicators.

Since migrating to Copilot Studio and deploying its new agents, ABN AMRO receives the following key benefits:

- **Enhanced customer and employee experience:** The Anna agent, operating across both text and voice channels, has consistently delivered high customer satisfaction, while the IVR bot experienced reduced drop-off and transfer rates. The Abby agent, supporting internal employee needs, became a more effective and dependable tool, contributing to an overall streamlined user experience.

- **Superior accuracy in language processing:** By integrating Azure AI Conversational Language Understanding (CLU) with Copilot Studio, ABN AMRO increased its accuracy rate in intent recognition by 7% for Dutch, leading to more precise and reliable customer and employee interactions.

- **Cost efficiency and scalability:** The transition to Copilot Studio significantly reduced operational and maintenance costs, allowing ABN AMRO to scale their AI capabilities more effectively to meet evolving business needs.

- **Faster time to market:** As demonstrated by the speed of migrating to Copilot Studio, ABN AMRO foresees faster time to market for improvements and added functionality to its new agents. They also foresee faster launches of new products and integration with other Power Platform products.

## What’s next

With Copilot Studio’s robust architecture, ABN AMRO is well-positioned to integrate advanced AI features, including Retrieval-Augmented Generation (RAG) patterns, and future developments like Large Language Models (LLMs) as the orchestration layer for intent recognition.

>ABN AMRO creates a maturity model towards having even more natural and productive conversations with our customers. This is implemented via a combination of great features in Copilot Studio as well as strong Azure Services, like OpenAI models and Azure Search.
>
> -van Groningen.

Looking to the future, ABN AMRO is already planning agents for other areas of the business. 

> Thanks to the efficiency of Microsoft Copilot Studio, we’re now able to develop chatbot support for a wide range of business applications – and get them into production very quickly.
>
> -van Groningen.

The bank’s next new agent is set up as a full Generative AI agent. The project is also be used as a testing ground for similar, Generative AI-driven experiences in Anna. 
> At ABN AMRO, we are just beginning our joint Generative AI journey. But with Microsoft Copilot Studio, we’re delivering the benefits of Generative AI quickly and effectively to our customers.
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