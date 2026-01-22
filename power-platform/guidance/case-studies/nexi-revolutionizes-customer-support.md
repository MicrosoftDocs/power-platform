---
title: Nexi Group revolutionizes customer support with Copilot Studio 
description: Learn how Nexi Group uses Microsoft Copilot Studio and Azure AI services to streamline customer interactions, reduce contact center workload, and modernize card-service support.
#customer intent: As a Power Platform user, I want to learn how Nexi built a conversational agent with Copilot Studio and Azure AI services so that I can implement similar solutions in my organization.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.topic: overview
ms.date: 01/19/2026
---

<!-- note from editor: I looked up Azure AI services in the style guide, and it says this has been renamed to "Foundry Tools". Here's the link to the entry: https://learn.microsoft.com/en-us/product-style-guide-msft-internal/a_z_names_terms/a/azure-ai-services. Do you want to change Azure AI services or leave as is? You could say "Foundry Tools (formerly known as Azure AI services)" -->


# Nexi Group revolutionizes customer support with Copilot Studio

[Nexi Group](https://www.nexigroup.com/), Europe's leading PayTech company, supports cardholders and partner banks across 25 countries or regions, representing about 65 percent of European card-based consumption. Operating at this scale requires managing thousands of card products, service variations, and regulatory requirements, often across multiple back-end systems. For customers and contact center teams, even routine card operations can become complex, time-consuming, and error-prone.

To modernize its service experience, Nexi built a secure, AI-powered conversational agent by using Microsoft Copilot Studio and Azure AI services. The solution streamlines customer interactions, reduces contact center workload, and strengthens Nexi's digital service reputation. Nexi was among the first to adopt generative AI, complementing its human‑assisted chat with an advanced agent powered by algorithmic and generative intelligence.

Today, the agent handles more than 3,000 customer interactions daily with a 70 percent satisfaction rate, significantly reducing escalations to live agents. By combining intelligent document retrieval, secure system integration, and advanced analytics, Nexi has redefined how card services are delivered. This approach improves customer experience, lowers operational costs, and establishes a scalable foundation for autonomous, multi-agent innovation.

In this case study, you learn how Nexi:

- Enhances document-based information retrieval for more accurate, context-aware answers.
- Securely connects internal apps to Copilot Studio to enable end-to-end self-service actions.
- Extends analytics beyond the out-of-the-box options for deeper visibility and reporting.

## Business challenges

Nexi's customer support teams relied on extensive documentation covering different card types, contractual conditions, and operational procedures. Because this information was spread across multiple sources, human agents had to manually search for information when assisting customers. This process increased handling time and made it difficult to consistently deliver fast, accurate responses.

Recognizing the need for better self-service capabilities without compromising security or compliance, Nexi set out to transform its existing documentation and back-end processes into a conversational experience that could scale with demand.

## Solution

Nexi's conversational agent is deployed on their website, https://www.nexi.it/. Cardholders can interact with the agent using natural language and access self-service capabilities. It securely integrates with internal systems to support end-to-end processes such as blocking or reissuing cards and listing transactions, providing structured access to card services.  

The following image shows how the agent appears on Nexi's website.

:::image type="content" source="media/nexi/homepage-agent.png" alt-text="Screenshot of Nexi's conversational agent supporting a user through a chat experience on the Nexi website." lightbox="media/nexi/homepage-agent.png":::

Key benefits include:

- **Reduced costs**: Customers resolve common problems through self-service, lowering the number of escalations to human agents.

- **Customer retention**: Tailored guidance eliminates frustration caused by navigating lengthy manuals with subtle but important differences.

- **Greater business agility**: Business teams can update agent messages independently, while IT maintains oversight through custom security roles, streamlining changes without requiring IT intervention.

The agent handles more than 3,000 end-user interactions daily, with a satisfaction rate of 70 percent.

> By using generative AI responses and enabling self-service, this solution significantly reduced the escalation rates. It didn't just enhance our brand reputation for digital services, it also improved the overall user experience while reducing operating costs.
>
> — *Clemente Pescatore, Global Head of Contact Center & RPA Factory*

### Personalized and authenticated experiences

The agent supports user authentication and adapts its responses based on the customer's authentication status and profile. Sessions start unauthenticated, so users can access general information. When customers request services that require personalization, such as card-specific actions, the agent prompts them to sign in.

The following image shows how the agent prompts the user to authenticate and directs the user to the correct page.

:::image type="content" source="media/nexi/agent-login.png" alt-text="Screenshot of Nexi's conversational agent prompting the user to authenticate on the Nexi website." lightbox="media/nexi/agent-login.png":::

After authentication, the agent retrieves only the documents and knowledge relevant to that customer's card type and entitlements. For example, if a customer has a gold card, the agent surfaces only gold-specific information, avoiding irrelevant details about other cards that don't apply.

This segmentation also enables proactive guidance by anticipating profile-specific questions and addressing them before they arise. Additionally, any customer inquiry that involves accessing Nexi's internal systems requires prior authentication to ensure secure and personalized service.

Behind these capabilities is a robust architecture that powers intelligent document retrieval, secure back-end integration, and advanced analytics.

## Architecture

The architecture integrates the Copilot Studio agent with three core capability areas, each built on Azure services.

:::image type="content" source="media/nexi/agent-architecture.png" alt-text="Diagram showing the technologies used including Copilot Studio, Azure AI services, and Power BI." lightbox="media/nexi/agent-architecture.png":::

- **Intelligent document retrieval**: To overcome limitations of basic document uploads, Nexi implemented a retrieval-augmented generation (RAG) architecture using Azure OpenAI and Azure AI Search. Documents are stored in Azure Storage and indexed with custom metadata—such as card tier and eligibility rules—using tailored chunking strategies. Azure OpenAI processes customer queries and generates grounded responses based on the most relevant retrieved content, delivering accurate, context-aware answers even when documents overlap.
 
- **Secure internal systems integration**: For transactional requests, the agent routes conversations to Azure Functions, which connect securely to Nexi's internal web services. Azure Key Vault manages secrets, while Azure Cosmos DB stores logs and audit records for traceability. This integration layer enables the agent to automate sensitive operations, such as blocking or reissuing cards, while maintaining strict security controls.

- **Extended analytics and monitoring**: Copilot Studio telemetry is captured through Azure Monitor, Application Insights, and Log Analytics. These signals are consolidated and visualized in Power BI dashboards, providing real-time visibility into performance, customer satisfaction, and operational trends. The analytics layer supports both governance and continuous improvement.

When AI-generated responses don't fully meet customer needs, Copilot Studio seamlessly escalates the interaction to a live agent in Genesys Cloud, preserving conversation context.

The following image shows one of the dashboards.

:::image type="content" source="media/nexi/dashboard.png" alt-text="Screenshot of a Power BI dashboard showing an overview of agent analytics captured through Azure Monitor, Application Insights, and Log Analytics." lightbox="media/nexi/dashboard.png":::

The workflow is as follows:

- A customer initiates a chat with the conversational agent.
- Copilot Studio manages intent recognition, based on Copilot Studio topics and trigger phrases, and routes the conversation accordingly. If no topic matches, it uses generative answers.
- If the intent relates to document-based guidance, the query is routed to an App Service that retrieves relevant information from the indexed document collection.
- If the intent involves back-end actions, such as blocking or reissuing cards, the query is routed to a function app that securely connects to internal systems.
- Internal applications are accessed through a secure integration layer.
- Analytics from the interactions are captured and visualized in a Power BI dashboard.
- In cases where the generative response doesn't meet the customer's needs, the interaction can be escalated to a live agent in Genesys Cloud.

## Takeaways

Here are some key takeaways for organizations looking to modernize customer support with conversational agents:

- Improve document-based information retrieval by using Azure AI Search and related Azure services to deliver more accurate, context-aware responses.
- Establish a secure integration layer with Azure services such as Azure Functions, Azure Key Vault, and Azure Cosmos DB to connect safely with internal applications.
- Extend analytics capabilities beyond Copilot Studio's built-in tools by integrating Azure services with Power BI for deeper insights and reporting.

## Looking ahead

Nexi plans to refine the deployed agent based on user feedback, with a focus on more advanced natural language processing and strengthened security. The next major step is the development of an autonomous agent that analyzes conversation history daily, evaluates user satisfaction, and flags low satisfaction interactions. It identifies the triggering question, reviews the knowledge base for gaps or outdated content, and delivers a consolidated report to IT, driving continuous improvement.

Nexi also aims to implement a full multi-agent model, with specialized customer care agents dedicated to distinct areas of expertise. With a commitment to ongoing innovation, Nexi is focused on meeting evolving digital demands and maintaining a strong competitive edge.

## Related information

- Copilot Studio
  - [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
  - [Copilot Studio Implementation Guide](https://aka.ms/CopilotStudioImplementationGuide)
  - [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
  - [Capture telemetry with Application Insights](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry)
  - [Configure user authentication in Copilot Studio](/microsoft-copilot-studio/configuration-end-user-authentication)
  - [Add user authentication to topics](/microsoft-copilot-studio/advanced-end-user-authentication)
- Azure
  - [What is Azure Functions?](/azure/azure-functions/functions-overview)
  - [What is Azure AI Search?](/azure/search/search-what-is-azure-search)
  - [Azure App Service overview](/azure/app-service/overview)
