---
title: Holland America Line transforms customer experience with Copilot Studio
description: Learn how Holland America Line used Microsoft Copilot Studio to create Anna, a virtual concierge that enhances customer support and cruise booking experiences.
#customer intent: As a Power Platform user, I want to learn how Holland America Line used Copilot Studio to create a virtual agent so that I can apply similar strategies in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: guidance
ms.topic: overview
ms.date: 05/13/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/29/2025
---

# Holland America Line transforms customer experience with Copilot Studio

In this case study, you learn how [Holland America Line](https://www.hollandamerica.com/) used Microsoft Copilot Studio to create a sophisticated virtual agent named Anna that acts as a digital concierge on its website. Holland America Line has been a recognized leader in cruising for 150 years. The company is known for its premium cruise experiences, with a fleet of 11 ships and a commitment to providing exceptional service to its guests. Holland America Line is part of Carnival Corporation, the world's largest cruise company.

## Challenges

Holland America Line's Senior Director of E-Commerce, Scott Pettit, explains, "With so many stateroom options and packages, booking a cruise can be a complicated process, and once you're booked, it's not always easy to understand how to prepare for a cruise and add additional services. We wanted to provide faster, personalized, and more targeted customer support, without driving up call volumes"&mdash;and without using a traditional chatbot.

A chatbot typically directs customers to web pages, where they must complete forms and contact customer representatives to finish transactions, administrative tasks, and onboard experiences. Holland America Line had an excellent website with live chat and call support. However, the company wanted to provide a more engaging and effective support system for its customers and the valued travel advisors who assist them. It wanted to help customers find the right cruise, book it, and add onboard experiences, all while reducing service-related calls.

> What we're finding is that when customers engage with Anna, they are more likely to find the right cruise that fits their needs than if they do not engage at all.
>
> — *Scott Pettit, Senior Director of E-Commerce, Holland America Line*

## Solution

The company's goals were to simplify the global customer journey, make the experience more self-service, provide generative AI assistance, connect to the cruise search API, and ensure all-hours availability.

Adding a chatbot with all-hours support seemed to be the next logical step. However, Holland America was certain that it didn't want a traditional chatbot with limited if-then responses that often simply send customers links to web pages with forms or methods to contact representatives.

Instead, Holland America Line used Microsoft Copilot Studio to develop a virtual agent called "Anna"&mdash;an advanced conversational experience that uses natural language and AI to support the guest's digital journey. Anna acts as a digital concierge on Holland America Line's website, helping new and existing customers and travel advisors book cruises, add experiences, and reduce service-related calls. Anna integrates advanced AI capabilities to ensure that it can handle complex customer interactions and provide accurate, timely responses.

The following screenshot shows the user interface of the Anna digital concierge, in which a customer asked about cruise options to Alaska. Anna uses generative AI to provide a personalized response, guiding the user through the process of finding the right cruise.

:::image type="content" source="media/holland-america/anna-digital.png" alt-text="Screenshot of Anna, Holland America Line's digital concierge, guiding a user through cruise options to Alaska using AI-generated responses.":::

### Implementation approach

The company built the minimal viable product (MVP) that's in operation today in just three months. As Pettit explains, "We worked with various chatbot development tools and processes. We like Microsoft Copilot Studio as it's proving to be the fastest and easiest way to build complex, AI-driven agents. The single interface, extensible connectors, and tight integration with the Power Platform ecosystem are also reasons we recommend it to other clients."

In the first MVP release, Holland America Line's Anna supports new and existing customers, including travel agents. Anna was designed to support three core scenarios: booking new cruises, adding products and services to existing bookings, and responding to general questions.

"We get an incredibly diverse number of questions, from basic cruise and booking requests to travel documentation needed for specific routes, even what to wear on specific dates and destinations," says Pettit. "Our goal was to create an agent that could address a wide range of customer questions and requests with natural language&mdash;just like a live agent, and with 24/7 availability."

### Generative answers use case

One of the key benefits of using Copilot Studio is the ability to create a natural language conversational experience that goes beyond traditional chatbots to offer more engaging and effective customer support.

To inform both generative actions and knowledge, the agent is integrated with several back-end systems, including the company's customer relationship management (CRM) system and its cruise reservations and booking system. Bing Search APIs, including Bing Custom Search, integrate the agent with the company's website content.

Working closely with Microsoft, Holland America Line pushed the boundaries of generative answers and actions in Copilot Studio and developed the following significant custom improvements and enhancements:

- **Multi-intent detection**: The ability to understand queries such as "Help me find a cruise to Alaska for 6 to 8 days from Seattle."

- **Custom entity extraction**: The ability to expand on predefined entities such as dates and add custom entities. For example, "I want to go next summer" generates a JSON object for the June-August summer season (2025) as follows:

     ```json
    {"departurefromdate": "2025-06-01", "departuretodate": "2025-08-01"}
    ```

- **Single-page reasoning**: The ability to reason over a particular cruise itinerary page to answer questions like "Which day do we get to the Bahamas and what do we see before we get there?"

### Hybrid orchestration with AI prompt for intent recognition

The Holland America team used an alternative approach for intent recognition. Classic orchestration, which relies solely on trigger phrases, was too basic. Generative orchestration was in preview when they developed the agent. As an alternative, they used a hybrid mode.

Hybrid orchestration enhances classic orchestration with AI Builder prompts to help interpret user intent. A powerful, defined prompt processes user queries, considers previous conversations, determines intent, and routes to the most relevant topic.

Hybrid orchestration offers several key benefits:

- More powerful than classic orchestration
- Lets users take advantage of generally available features
- More cost-effective than using generative orchestration at the time
- Allows the use of different AI models depending on specific needs
- Provides control over the type of structured output
- Lets users include conversation context to make use of previously asked questions
- Easy to maintain by continuing to use topics while centralizing incoming queries
- Easy to break down into modules

In general, hybrid orchestration works like this:

- All conversations route through an AI prompt rather than relying solely on topic triggers.
- The AI prompt recognizes intent based on conversation context and the current question.
- The output of the prompt matches a certain topic and the conversation redirects to it.

:::image type="content" source="media/holland-america/orchestration.png" alt-text="Flowchart showing how hybrid orchestration uses AI to route user utterances to topics or fallback responses in a conversational system." lightbox="media/holland-america/orchestration.png":::

#### How to set up hybrid orchestration

The goal with hybrid orchestration is to capture the user's intent in a prompt, extract it as output, and redirect the conversation to the appropriate custom topic. Key considerations are to avoid including trigger phrases in topics and ensure the conversational boosting topic activates consistently.

To set up hybrid orchestration, follow these steps:

1. Configure the general agent settings to use classic orchestration.
1. Set up custom topics without triggering phrases.
1. Modify the conversational boosting topic.
1. Create an AI Builder prompt to integrate in the conversational boosting topic.
1. Add a conditional branch to route conversations to custom topics.
1. Include fallback mechanisms.

In this case study, a Power Automate cloud flow integrates the AI Builder prompt. AI prompts are now integrated in Copilot Studio, allowing agents to use them directly without requiring a flow as an intermediary.

In the first step, shown in the following image, the user information is saved as a variable. Next, an action calls a Power Automate cloud flow, where the AI Builder prompt extracts the intent and returns it to the agent.

:::image type="content" source="media/holland-america/ai-prompt-integration.png" alt-text="Screenshot of a Microsoft Power Automate workflow handling unknown intent, parsing a value, saving it as user information, and performing an action with specific inputs and outputs.":::

The following image shows an overview of the flow. Notice that an action uses an AI Builder prompt. When successful, the agent interprets the intent and applies it in a conditional branch.

:::image type="content" source="media/holland-america/flow-overview.png" alt-text="Screenshot of a flow overview showing AI Builder prompt integration for intent recognition.":::

The following image demonstrates how the system redirects to the Beverage, Spa, or Dining topics.

:::image type="content" source="media/holland-america/system-redirects.png" alt-text="Screenshot showing how the flow redirects to Beverage, Spa, or Dining topics based on AI Builder prompt intent recognition.":::

Customers can also speak with a human customer service representative. As shown in the following image, the **All other conditions** action triggers fallback mechanisms.

:::image type="content" source="media/holland-america/fallback-mechanism.png" alt-text="Screenshot of fallback mechanisms triggered by The All other conditions action in the flow.":::

The following example of a fallback is an FAQ based on website content and a node that uses generative answers with Bing Custom Search as a data source.

:::image type="content" source="media/holland-america/generative-answers.png" alt-text="Screenshot of a fallback FAQ node using generative answers and Bing Custom Search.":::

The following image shows an overview of the intent recognition part of the conversational boosting topic.

:::image type="content" source="media/holland-america/conversational-boosting.png" alt-text="Screenshot of a Power Automate workflow titled 'Conversational boosting,' focusing on intent recognition with interconnected nodes for conditions, actions, and responses." lightbox="media/holland-america/conversational-boosting.png":::

### How to build the AI prompt

An AI prompt can be added directly to the agent in Copilot Studio. You choose the model you want to use. In the following example, GPT-4o is used.

:::image type="content" source="media/holland-america/model-gpt4.png" alt-text="Screenshot of Copilot Studio showing model selection options: Basic GPT-4o mini, Standard GPT-4o, and Premium o1.":::

Here's how Holland America Line built the prompt in this case study:

1. General instructions

    Under **Instructions**, first describe the task and provide general instructions. Make sure to include the context and history from earlier conversations. This information lets the agent retain details, such as the user's previously mentioned desired departure location, so the agent doesn't need to ask for it again.

    **Example Instructions:**

    *Your task is to understand the intention of the user from the user query `<userinput>` and return the appropriate user intent defined below.*
    - *Use the previous context: `<previouscontext>` to determine the intent of the user, give the output by clubbing both context and user intent.*  
    - *Lookup the history of all previous conversations between bot and the user.*
    - *Analyze the current question from the user.*  
    - *Group all topics discussed in the conversation history.*  
    - *Identify which topic from the conversation history matches the current question.*  
    - *Strictly Match the current question with the most recent relevant topic only.*
    - *Strictly Do not give any explanations just give the user intent from the below categories other than that don't give anything.*

2. Specific instructions about use cases (matching topics)

    Then give specific instructions for your use cases that align with your custom topics. In this case the following topics are used: Beverages, Spa, Dining, Internet, Shore, Gifts, Deal, Cruise, and Existing Cruise.

    Note that there's a topic for FAQ. For example, a customer might want to purchase dining for a trip and should be directed to the Dining topic. Or a customer might have a general dining question, and then the FAQ topic suits better. The prompt can be crafted to cover both use cases, buying or information context.

    **Example Instructions:**

    *Dining: If the user's intent is to purchase dining services then return "dining". else if it includes "provide recommendations", "how", "can I", "availability of dining reservations" in the user query then return "faq".*

3. Few-shot examples

    After instructions about the use cases, you can provide more example queries, known as few-shot examples.

    *Example user queries: "Is there a gym onboard?" "What amenities are available on the cruise?" "How do I book a cruise?"*

    *Example user input: how do i book spa service?*
    *Expected output: faq*

    *User query: what are available packages?*
    *Expected output: faq*

Be sure to test the prompt. In the following image, the user query "Can you add a drink package to my reservation?" is interpreted as the topic 'Beverage' and is redirected accordingly.

:::image type="content" source="media/holland-america/prompt-plugin.png" alt-text="Screenshot of a test case where a user query about adding a drink package is interpreted as the Beverage topic." lightbox="media/holland-america/prompt-plugin.png":::

### Multi-extraction powered by multiple AI Builder prompts

For multi-extraction, multiple AI Builder prompts are used. For example, if the intent is identified as a cruise, the user query is sent to multiple AI Builder prompts to extract additional information. The extracted data is converted into JSON format, making it easy to transfer to APIs.

To improve the user experience by minimizing follow-up questions, use a prompt that's capable of extracting dates from the initial user input. For instance, if a customer expresses travel plans in natural language, such as "next summer," an AI Builder prompt interprets it and generates JSON output.

:::image type="content" source="media/holland-america/prompt-extract.png" alt-text="Screenshot of a display showing JSON output in response to the 'next summer' user response." lightbox="media/holland-america/prompt-extract.png":::

## Architecture

The following diagram shows the architecture of Holland America's virtual agent, Anna.

:::image type="content" source="media/holland-america/architecture.png" alt-text="Architecture of Holland America Line's Anna digital concierge, with customer interaction, AI-driven services, multi-intent recognition, contact center, performance monitoring, and data integration." lightbox="media/holland-america/architecture.png":::

1. The customer visits the Holland America website and interacts with Anna, the virtual agent built with Microsoft Copilot Studio.  

1. On the customer service side, an AI-driven agent provides customers with a live chat with customer representatives.  

1. AI processing provides multi-intent recognition and custom entity extraction, using GPT-4o and Power Automate. For example, the customer asks the virtual agent, "Help me find a cruise to Alaska for 6 to 8 days from Seattle."  

1. An API gateway connects the virtual agent to the back-end system for generative actions and knowledge. Holland America's back-end system includes its reservations and booking system and CRM.  

1. Activity from customers engaging with Anna goes through a performance monitoring system:  

   - Adobe Analytics converts the data to custom metrics, including conversion rates.  
   - Azure Application Insights performs technical monitoring.  
   - Microsoft Dataverse stores conversational and feedback logs.  

## Response rates

The first-generation Anna was first available as a tool for Holland America Line's call center agents to answer customer questions. Then it was tested internally with all employees. After that, the company launched Anna on its external website. It was initially available to 5% of customers, then 50%, and finally to all customers who visit the website.

The company monitors Anna's accuracy and performance using several tools and data sources. "The built-in analytics tools in Microsoft Copilot Studio and connectivity to other analytics platforms enabled us to set up an effective feedback loop," says Pettit. Integration with Dataverse delivers conversational logs and feedback from customers. Adobe Analytics provides custom business metrics, and Azure Application Insights provides near real-time technical monitoring of the platform.

Copilot Studio also made it easy to use this feedback to improve the virtual agent. As Pettit explains, "With Microsoft Copilot Studio, we are able to quickly assess what was answered and not answered by Anna, then organize responses into clear topics and categories, so we know exactly where to focus our time on content updates."

Using generative answers, along with a highly effective monitoring and training process, the virtual agent has achieved strong resolution rates with early users. The agent's excellent response rates help deliver more of the information customers need faster, which leads to a better overall experience.

This is reflected in the latest business results. "What we're finding is that when customers engage with Anna, they are more likely to find the right cruise that fits their needs than if they do not engage at all," says Pettit. At the same time, there are early indications that Anna helps reduce the total number of call center queries.

## Key takeaways

The case study of Holland America Line's Anna virtual agent demonstrates the potential of using Microsoft Copilot Studio, along with supporting technologies like Azure Application Insights and Dataverse to monitor its performance. Here are some key takeaways for IT professionals who are looking to implement a similar solution in their own organizations:

- **Use Copilot Studio to build a virtual agent**

  - **Use multi-intent detection** to understand and answer complicated queries with multiple parameters.
  - **Use custom entity extraction** to extract predefined entities, such as dates and locations, and generate the data into JSON objects or files.
  - **Use single-page reasoning** to answer specific questions using logic, based on information on a cruise itinerary, such as "Will I have time to go scuba diving" or "What day are we getting to the Bahamas and what are we seeing before we get there?"

- **Create an effective feedback loop**

  - **Use Copilot Studio's built-in analytics tools** for quick analysis.
  - **Use Azure Application Insights** for near real-time performance monitoring.

- **Use Copilot Studio to improve your virtual agent experience**: Copilot helps the team assess what was answered and not answered by Anna and organizes the responses into topics and categories. This assistance helps Holland America prioritize content updates.

Since deploying the Anna virtual agent, Holland America Line has enjoyed the following key benefits:

- **High resolution rate**: The virtual agent has a high resolution rate and handles thousands of conversations each week.
- **Decreased customer support**: Anna helps reduce the number of basic informational queries to call center representatives.
- **Increased customer satisfaction**: Customers find reduced friction from immediate answers and all-hours support, with more tasks accomplished than on previous systems.
- **Sales support**: When customers engage with Anna, they get smart recommendations and are more likely to find the right cruise for their needs. This approach helps support sales goals.

## Looking ahead

Holland America Line expects to continue to grow its customer engagement levels with the Anna virtual agent as it continues expanding Anna's capabilities. The first MVP release of Anna is running in the US now and is set to go live in Australia, Canada, and the UK, equipped with market-specific cruise and booking information. Anna will also soon be introduced in non-English markets.

Looking further ahead, Holland America Line is ready to advance the AI capabilities of its agent by integrating secondary flows that will allow customers to book excursions, drink packages, and spa and other services. Anna will also help customers find specific information about port and destination interests. Holland America is also evaluating opportunities for Anna to help guests during their cruise, with activities like booking onboard activities, dinner reservations, and room service.

These advancements will improve the customer experience with a single interface before, during, and after the cruise&mdash;throughout a customer's entire journey. As Pettit says, "With Microsoft Copilot Studio, we have an effective platform for delivering the benefits of generative AI to our customers, providing them with faster service and an even better overall cruise experience."

## Related information

- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Building your own copilot with Copilot Studio](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/building-your-own-copilot-with-copilot-studio/)
- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
- [Introduction to Generative AI - Exploring the basics (training module)](/training/modules/intro-generative-ai-explore-basics/)
- [Copilot Studio Implementation Guide](https://aka.ms/CopilotStudioImplementationGuide)
