---
title: Rabobank conversational banking with Copilot Studio
description: "Copilot Studio for conversational banking: Discover how Rabobank uses Microsoft Copilot Studio to deliver efficient, compliant chat and voice customer service."
#customer intent: As a Power Platform user, I want to learn how Rabobank uses Copilot Studio for conversational banking so that I can implement similar solutions in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 05/13/2025
---


# Rabobank conversational banking with Copilot Studio

Rabobank is a multinational banking and financial services company based in the Netherlands. As part of its mission to grow a better world together, Rabobank aspires to conversational banking; prioritizing friendly, efficient customer service on demand, in alignment with the company’s principles of cooperation and putting people first.  

In this case study, you learn how to:

- Use Copilot Studio to help bank customers
- Continuously improve intent recognition
- Anonymize customer conversations for testing
- Use Gen AI features and stay compliant
- Integrate Azure AI Speech service with Copilot Studio

## Challenges

Rabobank explores chatbot functionality for customer self-service to improve efficiency and lower operational costs. With rising customer expectations and many inquiries, Rabobank needs a chatbot that answers common questions.

Rabobank sets up text- and voice-enabled chatbot functionality on another platform, partly on-premises. Rabobank relies on vendors for implementation and maintenance, but the solution isn't efficient and causes several challenges.

- The systems for chat and voice support need updates with new conversations and logic separately, even though they often use the same information and models. This approach isn't efficient.

- The platform needs specialized developer support, which slows innovation, and Rabobank wants to speed up time to market.

- The chatbot is hard to integrate with external systems and their APIs, which Rabobank needs to get the right output for agent conversations and make agents actionable, supporting end-to-end processes.

> We need a flexible platform that can integrate with external APIs, transforming our chatbot into a true financial assistant. We want one conversational platform to manage all chatbots and optimize it ourselves.
>
> - Chris den Arend, Solution Architect, Rabobank

## Solution

Rabobank transitioned to Microsoft Copilot Studio, creating three Copilot Studio agents for customer self-service; one voice-enabled and two text-based agents. The text-based are split on business banking and retail customers.

Customers either call the bank or start a chat. In a call, they get asked by the agent why they're calling. Then there's a process for intent recognition, and they finally get routed to the correct human live agent.

For text-based conversations, there's also an intent recognition process in place and routing to Copilot Studio topics, which in turn can solve whole end-to-end processes like blocking a card.

The following image shows the text-based agent embedded on Rabobank’s website.

:::image type="content" source="media/rabobank/text-based-agent.png" alt-text="Screenshot of the text-based Copilot Studio agent embedded on Rabobank’s website." lightbox="media/rabobank/text-based-agent.png":::

### Implementation approach

Rabobank migrated from a previous platform to Microsoft Copilot Studio. The implementation included migration of topics. Setting up the Copilot Studio agents was a straight-forward process, and the text-based agents
were created and deployed within just three months.

To provide escalation to human live agents, Genesys Cloud was chosen. There's no native integration between Genesys Cloud and Copilot Studio, so custom-built middleware is used.

They have integrated with APIs managing certain processes, using Power Automate mainly and http calls. In case the customer inquiry can't be solved, there are fallback topics, which will utilize generative AI.

Challenges they faced during implementation were mostly related to improving intent recognition and to overcoming barriers related to using generative AI features.

Rabobank found intent recognition essential for creating successful agents. If the voice-enabled agent doesn't understand the intent, it could route to the wrong advisor. A text-based agent that doesn't understand the intent wouldn't be able to help customers.

They continuously work with improving intent recognition and have a process in place for finding areas to improve and how to properly test the changes.

### Intent recognition

The intent recognition process includes:

- Genesys Cloud and Pega Business Rules

- An external intent catalog, based on TIBCO EBX

- Copilot Studio topics and specified trigger phrases

- Escalation to the right live agents’ queue for the voice enabled chatbot

All calls and text inquiries start in Genesys Cloud. The voice-enabled agent helps identify the intent for calls and the conversation gets routed to the correct live agent. The main purpose of the voice-enabled agent is intent recognition to be able to route the call to the correct
team, whereas the text-based agent can solve more end-to-end processes.



For the two text-based agents there are 300 to 400 topics and the intent recognition process is similar to the voice-enabled agent. The chat first goes to Genesys Cloud, then to the Copilot Studio agent. Based on intent, the customer’s question is redirected to a path in the agent
that can solve whole end-to-end processes, such as blocking a card.

### Genesys Cloud and Copilot Studio integration

Genesys Cloud and Copilot Studio don't have native interoperability, so Rabobank uses custom-built middleware to manage communication. For text-based agents, a Java application manages translation between systems. For voice-enabled agents, AudioCodes handles translation, while
Azure Speech to Text and Text to Speech process the interaction.

Rabobank is working to strengthen their voice branding by making their voice-enabled bot sound more natural. They're exploring the possibility of using a voice that is a good fit for their brand. The process involves inviting the chosen individual into a studio to create a synthetic voice, which will then be integrated into Azure AI Speech services.

### Generative AI features

To meet regulatory requirements, Rabobank hasn't yet adopted the built-in generative AI features of Copilot Studio. Instead, they continue to use classic orchestration and have developed an alternative approach for using generative AI. Their decision is driven by three key factors:

- Platform compliance: Enabling generative AI features while
  maintaining compliance proved complex, requiring involvement from dedicated security personnel whenever new features were introduced.

- Scalability: They faced challenges in efficiently integrating rabobank.nl as a knowledge source, given its 8,000+ URLs. Using Bing Search Service wasn't a viable option, as it would have resulted in data being stored outside their region.

- Quality control: Ensuring reliable output before production, including model evaluation, was difficult, making it challenging to maintain a high level of quality.

Rabobank uses generative AI in their fallback topics. If the agent can't answer a question, generative AI is used, but the setup resides outside of Copilot Studio.

They have used Azure AI Foundry to deploy AI models, within their own Azure subscription. For compliance, that was important for Rabobank. There are certain approvals they need to go through to use generative AI in SaaS products and deploying models in their own Azure subscription was the quicker way to use generative AI.

An Azure Function is called from the agent’s fallback topic, through an HTTP call, including the conversation ID and bot ID. It performs the following functions:

- Retrieves the transcript.

- Sends the transcript to Azure OpenAI to get the user inquiry from the transcript.

- Sends the user inquiry and their own data to Azure OpenAI.

- Gets a response back and responds the agent.

This setup includes Azure AI Search for indexing content from Rabobank’s website. The image below illustrates the process:

:::image type="content" source="media/rabobank/ai-search.png" alt-text="Screenshot of the fallback generative AI process for Rabobank’s Copilot Studio agent, showing Azure Function, OpenAI, and AI Search integration." lightbox="media/rabobank/ai-search.png":::

Rabobank also have an alternative approach for getting the correct data from their website to be used by the agent. They scrape their website daily, using a custom-built Python-based solution, consisting of four steps:

1. Create new Azure AI Search index.

1. Get and filter website data so old irrelevant pages aren't used.

1. Clean the data with OpenAI, model: text-embedding-ada-002.

1. Add data to Azure AI Search.

The Copilot Studio agent uses Azure AI Search for retrieving their filtered website information. It gives them more accurate retrieval of information while staying compliant. The image below illustrates the approach.

:::image type="content" source="media/rabobank/filtered-information.png" alt-text="Screenshot of the Azure AI Search data retrieval process for Rabobank’s Copilot Studio agent." lightbox="media/rabobank/filtered-information.png":::

### Test strategy

Using Power BI, they analyze transcripts and find out what needs to be optimized. When trigger phrases have been updated or existing merged, they want to validate before launching to production.

For validation, they use real conversations. The validation process consists of taking a list of customer inputs (questions), anonymizing it, and using those real conversations to try out the changes to see if the intent recognition was improved.

Testing is done in multiple ways, one of the tools being a self-built testing tool. This tool was designed to verify the accuracy of virtual agents. It accepts large sets of trigger phrases and tests whether the correct topics are triggered as well as whether the desired responses were generated.

## Technologies used

This article uses these technologies:

- Microsoft Copilot Studio as the agent platform
- Power Automate to connect to external APIs through HTTP calls
- Power BI to track conversation success
- Azure AI Search to get more accurate information from the website
- Azure AI Foundry as a compliant generative AI enabler that uses specific AI models
- Azure AI Speech service for the voice-enabled agent

## Architecture

Rabobank's conversational AI architecture uses several Microsoft technologies to streamline customer interactions across chat and voice channels. Genesys Cloud lets initial contacts via chat escalate to live agents, and voice interactions use Azure Speech for text-to-speech and speech-to-text features.

Microsoft Copilot Studio manages both text and voice virtual agents, offering 24/7 self-service and IVR features for authentication and intent recognition. Power BI gives unified analytics, tracking conversation transcripts and business metrics to help deliver efficient, high-quality customer service.

:::image type="content" source="media/rabobank/arch.png" alt-text="Screenshot of Rabobank's conversational AI architecture diagram that shows integration of Genesys Cloud, Copilot Studio, Azure Speech, and Power BI." lightbox="media/rabobank/arch.png":::

For voice-enabled interaction:

1. A customer calls and the call lands in Genesys Cloud.

1. The conversation redirects to the Copilot Studio agent. AudioCodes manages translations.

1. Azure Speech-to-Text translates the message.

1. The Copilot Studio agent authenticates the customer and recognizes intent. The conversation is labeled by intent.

1. The agent's text output is converted to speech using Azure Text-to-Speech before it's delivered to the customer.

1. In Genesys Cloud, Pega business rules use parameters (like business area and intent in the external intent catalog) to decide which live agent queue to redirect the conversation to.

For text-enabled interaction:

A. A customer starts a chat and it lands in Genesys Cloud.

B. The chat redirects to a Copilot Studio agent, which uses topics for intent recognition and manages end-to-end processes. Fallback topics use generative AI to better answer customer questions.

## Takeaways

Rabobank’s transition to Microsoft Copilot Studio shows how you can use Copilot Studio and other Microsoft technologies to set up agents for chat and voice scenarios. Here are some key takeaways for IT professionals who want to implement a similar solution:

- Set up a process to improve intent recognition for your agents.

- Establish a robust test strategy. Use anonymized user queries.

- Consider alternative approaches while going through approvals for using generative AI in SaaS products.

The agents provide these key benefits:

- 20,000 daily calls and 7,000 daily chats.

- 62 percent self-service rate for chats (for example, not escalated to live agents).

Rabobank manages and updates its virtual agents without external help.

> We wanted a complete solution with the control, openness, and flexibility to tune it to our detailed needs and differentiate ourselves from virtual assistants in the market, and we found that.
>
> - Chris den Arend, Solution Architect, Rabobank

## Looking ahead

Rabobank plans to transition to built-in features for generative AI and check compliance. This work includes:

- Testing generative orchestration and checking if it improves recognition.
- Providing generative answers to questions using Rabobank’s knowledge bases.
- Connecting generative actions with the bank’s systems and APIs.
- Exploring future options in Copilot Studio, like bringing in your own model.

Other improvement areas include:

- Using Azure AI Search as a knowledge source in the agent instead of Azure Function.
- Adding more knowledge sources.
- Adding a custom voice for the voice-enabled chatbot.
- Adding real-time monitoring of all conversations.
- Making the chatbot easier to reach on the website.
- Adding first-party voice and IVR capabilities to remove the dependency on AudioCodes. 

## Related information

- [Copilot Studio Overview](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)
- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Move data across regions for Copilots and generative AI features](/power-platform/admin/geographical-availability-copilot)
- [Speech service documentation](/azure/ai-services/speech-service/)
