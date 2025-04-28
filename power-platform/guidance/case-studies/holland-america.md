---
title: How Holland America Line uses Copilot Studio and AI Builder to enhance customer support
description: Discover how Holland America Line uses Microsoft Copilot Studio and AI Builder to create Anna, a virtual concierge enhancing customer support and cruise booking experiences.
#customer intent: As a Power Platform user, I want to learn how to use Copilot Studio and AI Builder to create a virtual agent so that I can enhance customer support and automate tasks.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 04/28/2025
---

# How Holland America Line uses Copilot Studio and AI Builder to enhance customer support

In this case study, you learn how [Holland America Line](https://www.hollandamerica.com/) uses Microsoft Copilot Studio to create a sophisticated virtual agent named Anna that acts as a digital concierge on their website. For 150 years, Holland America Line has been a recognized leader in cruising. Their fleet of 11 ships offers more than 500 sailings a year visiting all seven continents.

## Challenges

Holland America Line wants to provide faster, more personalized support for customers without increasing call center volumes or using a traditional chatbot. A traditional chatbot directs customers to web pages, where they must complete forms and contact agents to finish transactions, administrative tasks, and onboard experiences.

> With so many stateroom options and packages, booking a cruise can be a complicated process, and once you're booked, it's not always easy to understand how to prepare for a cruise and add additional services.
>
> -Scott Pettit, Holland America Line’s Senior Director of E-Commerce

To help customers, Holland America Line provides a website with live chat and call support. But this recognized leader in the cruising industry wants to go further for Holland America guests and the valued travel advisors who assist them. 

The company aims to simplify the global customer journey, enable self-service, provide generative AI assistance, connect to the cruise search API, and ensure 24/7 availability. 


> We wanted to provide faster, more personalized, and targeted customer support without increasing call volumes.
>
> -Scott Pettit

## Meet the team

:::image type="content" source="media/holland-america/team.png" alt-text="Screenshot of a person wearing sunglasses. AI-generated content may be incorrect." lightbox = "media/holland-america/team.png":::

> What we’re finding is that when customers engage with Anna, they are more likely to find the right cruise that fits their needs than if they do not engage at all.
>
> -Scot Pettit, Holland America Line​

## Solution

Adding a chatbot with 24/7 support is the next logical step. However, Holland America Line is clear that it doesn't want a traditional chatbot with limited if-then responses that often send customers links to pages with forms or methods to contact representatives.

Holland America Line uses Microsoft Copilot Studio to develop a virtual agent called “Anna”—an advanced, natural language conversational experience that uses AI to support the guest’s digital journey. Anna acts as a digital concierge on their website to help new and existing customers and travel advisors book cruises, onboard them to various experiences, and reduce service-related calls. The development process integrates advanced AI capabilities to ensure that Anna can handle complex customer interactions and provide accurate, timely responses.

The following example shows the Anna digital concierge:

:::image type="content" source="media/holland-america/anna-digital.png" alt-text="Screenshot of a chat AI-generated content may be incorrect." lightbox = "media/holland-america/anna-digital.png":::

## Implementation approach

The minimal viable product (MVP) operating today was built in just three months.  
> We worked with various chatbot development tools and processes. We like Microsoft Copilot Studio because it’s the fastest and easiest way to build complex, AI-driven agents. The single interface, extensible connectors, and tight integration with the Power Platform ecosystem are also reasons to recommend it to other clients.
>
> -Pettit 

In the first MVP release, Holland America Line’s Anna supports new and existing customers, including travel agents. Anna is designed to support three core scenarios: booking new cruises, adding products and services to existing bookings, and responding to general questions.

> We get an incredibly diverse number of questions—from basic cruise and booking requests to travel documentation needed for specific routes, even what to wear on specific dates and destinations. The goal was to create an agent that addresses a wide range of customer questions and requests with natural language—just like a live agent, and with 24/7 availability.
>
> -Pettit

## Generative answers use case

One of the key benefits of using Copilot Studio is the ability to create a natural language conversational experience that goes beyond traditional chatbots. Creating a virtual agent lets Holland America Line offer a more engaging and effective support system for their customers.

To inform both generative actions and knowledge, the agent is integrated with several back-end systems, including the company’s CRM system and their cruise reservations and booking system. Integration with the company’s website content uses Bing Search APIs, including Bing Custom Search.

Working closely with Microsoft, Holland America Line pushes the boundaries of generative answers and actions in Copilot Studio and develops the following significant custom improvements and enhancements to the agent:

- **Multi-intent detection**: Ability to understand queries such as, “Help me find a cruise to Alaska for 6 to 8 days from Seattle.”

- **Custom entity extraction**: Ability to expand on predefined entities such as dates and add custom entities, such as dates and custom entities. For example, "I want to go next summer" generates a JSON object for the June-August summer season `{"departurefromdate": "2025-06-01", "departuretodate": "2025-08-01"}.`

- **Single-page reasoning**: Ability to reason over a particular cruise itinerary page to answer questions like, “Which day do we get to the Bahamas and what do we see before we get there?”

## Hybrid orchestration with AI prompt for intent recognition

The team develops an alternative approach for intent recognition. Classic orchestration, which relies solely on trigger phrases, is simple, and generative orchestration is still in preview at that time. As an alternative, they use a hybrid mode.

Hybrid orchestration uses classic orchestration and enhances it with AI Prompt Builder to interpret user intent more flexibly and powerfully. They create a powerful prompt that processes user queries, considers previous conversations, determines intent, and routes to the most relevant topic.

Key benefits of hybrid orchestration:

- More powerful than classic orchestration
- Lets users take advantage of generally available features
- A cost-effective approach compared to using generative orchestration at that time
- Allows the use of different AI models, depending on specific needs
- Control over the type of structured output
- Possible to include conversation context, to make use of past asked questions
- Easy to maintain, continuing to use topics while centralizing incoming queries
- Can easily be broken down into modules

Overall idea of hybrid orchestration:

- Route all conversations through an AI prompt rather than relying solely on topic triggers.
- The AI prompt acts as intent recognizer based on conversation context and current question.
- The output of the prompt matches a certain topic and the conversation redirects to it.

:::image type="content" source="media/holland-america/orchestration.png" alt-text="Screenshot of a diagram showing hybrid orchestration with AI Prompt for intent recognition." lightbox = "media/holland-america/orchestration.png":::

### How to set it up

The following are prerequisites for setting up hybrid orchestration.

1. Configure the general agent settings to use Classic orchestration.
1. Set up custom topics without triggering phrases.
1. Modify the conversational boosting topic.
1. Create an AI Prompt to integrate within the conversational boosting topic.
1. Add a conditional branch to route conversations to various custom topics.
1. Include fallback mechanisms.

The goal is to capture the user’s intent in a prompt, extract it as output, and redirect the conversation to the appropriate custom topic. A key aspect is to avoid trigger phrases in topics and ensure conversation boost activates consistently.

In this case study, a Power Automate cloud flow is used to integrate the AI prompt. AI prompts are initially unavailable for use within Copilot Studio. However, they're now integrated, allow agents to utilize AI Prompts directly without requiring a flow as an intermediary.

In the first step, the user information is saved as a variable. Next, an action calls a Power Automate cloud flow, where the AI Prompt extracts the intent and returns it to the agent.

:::image type="content" source="media/holland-america/ai-prompt-integration.png" alt-text="Screenshot of a Power Automate cloud flow integrating AI Prompt for intent extraction." lightbox = "media/holland-america/ai-prompt-integration.png":::

The image below displays the overview of the flow:

:::image type="content" source="media/holland-america/flow-overview.png" alt-text="Screenshot of a flow overview showing AI Prompt integration for intent recognition.":::

We can see an action that utilizes an AI prompt. Upon a successful return, the agent receives the interpreted intent and applies it within a conditional branch. The following example demonstrates how the system redirects to the Beverage, Spa, or Dining topics.

:::image type="content" source="media/holland-america/system-redirects.png" alt-text="Screenshot of a system redirecting to Beverage, Spa, or Dining topics based on AI Prompt intent recognition." lightbox = "media/holland-america/system-redirects.png":::

Users can also speak with an agent. The 'All other conditions' setting triggers various fallback mechanisms.

:::image type="content" source="media/holland-america/fallback-mechanism.png" alt-text="Screenshot of fallback mechanisms triggered by 'All other conditions' setting." lightbox = "media/holland-america/fallback-mechanism.png":::

One example of a fallback is an FAQ based on their website and a node that uses generative answers with Bing Custom Search as a data source.

:::image type="content" source="media/holland-america/generative-answers.png" alt-text="Screenshot of a fallback FAQ node using generative answers and Bing Custom Search." lightbox = "media/holland-america/generative-answers.png":::

Below is an overview of the intent recognition part of the conversational boosting topic.

:::image type="content" source="media/holland-america/conversational-boosting.png" alt-text="Screenshot of the intent recognition part of the conversational boosting topic." lightbox = "media/holland-america/conversational-boosting.png":::

## The AI prompt

An AI prompt can be added directly into the agent in Copilot Studio. You choose the model you want to use. GPT-4o is used in the example below:

:::image type="content" source="media/holland-america/model-gpt4.png" alt-text="Screenshot of an AI prompt example in Copilot Studio showing text and instructions." lightbox = "media/holland-america/model-gpt4.png":::

The prompt in this case study is built up as follows:

1.  General instructions

    Under Instruction, first include the task and general instructions. Make sure to use previous context and history from earlier conversations. This lets the agent retain details, such as the user's previously mentioned desired departure location, so the agent doesn't need to ask for it again. The following example demonstrates a prompt for the general instructions:

    **Example:**

    Your task is to understand the intention of the user from the user query `<userinput\>` and return the appropriate user intent defined below.  
    - Use the previous context: `<previouscontext\>` to determine the intent of the user, give the output by clubbing both context and user intent.  
    - Look up the history of all previous conversations between bot and the user.  
    - Analyze the current question from the user.  
    - Group all topics discussed in the conversation history.  
    - Identify which topic from the conversation history matches the current question.  
    - Strictly match the current question with the most recent relevant topic only.  
    - Strictly don't give any explanations just give the user intent from the below categories other than that don't give anything.

2.  Specific instructions about Use Cases (matching topics)

    Then give specific instructions for your use cases that align with your custom topics. In this case the following topics are used: Beverages, Spa, Dining, Internet, Shore, Gifts, Deal, Cruise and Existing Cruise.

    There's a topic for FAQ. For example, a user might want to purchase dining for a trip and should be directed to the Dining topic. Or a user might have a general Dining question and then the FAQ topic suits better. The prompt can be crafted to cover both use cases, buying or information context. The example below demonstrates a prompt for the general instructions:
    
    **Example:**
    Instructions:  
    Dining: If the user's intent is to purchase dining services then return "dining". Else if it includes "provide recommendations", "how", "can I", "availability of dining reservations" in the user query then return "faq".

3.  Few-shot examples

    After instructions about the use cases, more example queries (few-shot examples) can be given.

    Example user queries: "Is there a gym onboard?" "What amenities are available on the cruise?" "How do I book a cruise?" Example user input: how do i book spa service expected output: faq  
    User query: what are available packages?  
    Expected output: faq

You can test the prompt. Below, the user query 'Can you add a drink package to my reservation?' is interpreted as the topic 'Beverage' and redirected accordingly.

:::image type="content" source="media/holland-america/prompt-plugin.png" alt-text="Screenshot of a test case where a user query about adding a drink package is interpreted as the Beverage topic." lightbox = "media/holland-america/prompt-plugin.png":::

## Multi-extraction powered by multiple AI prompts

For multi-extraction, multiple AI prompts are used. For example, if the intent is identified as a cruise, the user query is sent to multiple AI prompts to extract additional information. The extracted data is converted into JSON format, making it easy to transfer to their APIs.

To improve the user experience by minimizing follow-up questions, use a prompt capable of extracting dates from the initial user input. For instance, if a user expresses travel plans in natural language, such as 'next summer', an AI prompt interprets it and generates JSON output.


:::image type="content" source="media/holland-america/prompt-extract.png" alt-text="Screenshot of a display showing text, software, numbers, and a computer icon. AI-generated content may be inaccurate." lightbox = "media/holland-america/prompt-extract.png":::

## Architecture diagram

The architecture below explains how Holland America Line develops the Anna virtual agent.

:::image type="content" source="media/holland-america/architecture.png" alt-text="Screenshot of a diagram showing a software development process. AI-generated content may be incorrect." lightbox = "media/holland-america/architecture.png":::

1. The customer visits the HAL website and interacts with Anna, the virtual agent built with Microsoft Copilot Studio.  
2. On the customer service side, an AI-driven agent provides customers with a live chat with customer representatives.  
3. AI processing enables multi-intent recognition and custom entity extraction, using GPT-4o and Power Automate. For example, the customer asks the virtual agent, “Help me find a cruise to Alaska for 6 to 8 days from Seattle.”  
4. An API gateway connects the virtual agent to the backend system for generative actions and knowledge. Holland America’s backend system includes their reservations and booking system and CRM.  
5. Activity from customers engaging with Anna goes through a performance monitoring system:  

   1. Adobe Analytics converts the data to custom metrics, including conversion rates.  
   2. Azure Application Insights performs technical monitoring.  
   3. Microsoft Dataverse provides conversational and feedback logs.  

## Response rates

The first-generation Anna is made available as a tool for call center agents to answer customer questions, and then it's tested internally with all their employees. From there, Anna is launched on the external website, initially available to 5% of customers, then 50%, and then 100% of all customers visiting the website.

Anna’s accuracy and performance are monitored using multiple tools and data sources. 

> The built-in analytics tools in Microsoft Copilot Studio and connectivity to other analytics platforms enabled us to set up an effective feedback loop.
>
> -Pettit. 

Integration with Dataverse delivers conversational logs and feedback from customers. Adobe Analytics provides custom business metrics, and Azure Application Insights provides near-real-time technical monitoring of the platform.

Copilot Studio also made it easy to use this feedback to improve the virtual agent.    

> With Microsoft Copilot Studio, we are able to quickly assess what was answered and not answered by Anna; then organize responses into clear topics and categories, so we know exactly where to focus our time on content updates.
>
> -Pettit

Using generative answers, along with a highly effective monitoring and training process, the virtual agent achieves strong resolution rates with early users. The excellent response rates by Anna help deliver more of the information customers need faster, which leads to a better overall experience.

This is reflected in the latest business results. 

> What we’re finding is that when customers engage with Anna, they are more likely to find the right cruise that fits their needs than if they do not engage at all.
> 
> -Pettit. 

At the same time, there are early indications that Anna helps reduce the total number of call center queries. 

## Takeaways

The case study of Holland America Line’s Anna virtual agent demonstrates the potential of using Microsoft Copilot Studio, along with supporting technologies like Azure Application Insights and Dataverse to monitor its performance. The following key takeaways are for IT professionals who look to implement a similar solution in their own organizations:

- **Use Copilot Studio to build a virtual agent**:

  - **Use multi-intent detection** to understand and answer complicated queries with multiple parameters.

  - **Use custom entity extraction** to extract predefined entities, such as dates and locations, and generate the data into JSON objects or files.

  - **Use single-page reasoning** to answer specific questions using logic, based on information on a cruise itinerary, such as, “Will I have time to go scuba diving day are we getting to the Bahamas and what are we seeing before we get there?”

- **Create an effective feedback loop**:

  - **Use Copilot Studio’s built-in analytics tools** for quick analysis.

  - **Use Azure Application Insights** for near real-time performance monitoring.

- **Use Copilot Studio to improve your virtual agent experience**.  
  Copilot helps the team assess what was answered and not answered by Anna and organizes the responses into topics and categories, which help Holland America prioritize what content updates to make.

Since deploying the Anna virtual agent, Holland America Line receives the following key benefits:

- **High resolution rate**: The virtual agent has a high resolution rate and handles thousands of conversations each week.

- **Decreased customer support**: Telemetry indicates that Anna helps reduce the number of basic informational queries to call center representatives.

- **Increased customer satisfaction**: Customers find reduced friction from immediate answers, 24/7 support, and more tasks accomplished than they’d be able to complete on previous systems.

- **Sales support**: When customers engage with Anna, they get smart recommendations and are more likely to find the right cruise that meets their needs. This approach helps support sales goals. 

## Looking ahead

Holland America Line expects to continue to grow their customer engagement levels with the Anna virtual agent, as they continue expanding Anna’s capabilities. This first MVP release of Anna is currently running in the US, and the Anna virtual agent is set to go live in Australia, Canada, and the UK, equipped with market-specific cruise and booking information. Anna will also soon be introduced in non-English markets.

Looking further ahead, Holland America Line is ready to advance the AI capabilities of their agent by integrating additional secondary flows, which will allow customers to book excursions, spa services, drink packages, and other services. Anna also helps customers find specific information about port and destination interests. Holland America is also evaluating opportunities for Anna to help guests during their cruise, with activities like booking onboard activities, dinner reservations, and room service.

These advancements enhance the experience throughout a customer’s journey, having a single interface precruise, during their cruise, and even after the cruise.


> With Microsoft Copilot Studio, we have an effective platform for delivering the benefits of generative AI to our customers, providing them with faster service and an even better overall cruise experience.
>
> -Pettit

## Related information

- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Building your own copilot with Copilot Studio](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/building-your-own-copilot-with-copilot-studio/)
- [Quickstart guide for building copilots with generative AI](/microsoft-copilot-studio/nlu-gpt-quickstart)
- [Introduction to Generative AI - Exploring the basics](/training/modules/intro-generative-ai-explore-basics/)
- [Copilot Studio Implementation Guide](https://aka.ms/CopilotStudioImplementationGuide)