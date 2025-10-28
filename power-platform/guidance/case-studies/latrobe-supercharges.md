---
title: La Trobe University supercharges academic productivity with AI and Copilot Studio
description: Discover how La Trobe University uses AI and Copilot Studio to streamline operations, enhance academic productivity, and improve staff support services.
#customer intent: As a Power Platform user, I want to learn how to use Copilot Studio and AI Builder to build a knowledge retrieval agent so that I can streamline support services at my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.date: 10/23/2025
ms.topic: overview
---

<!-- ask about Chatham Vidanagamage title -->


# La Trobe University supercharges academic productivity with AI and Copilot Studio

[La Trobe University](https://www.latrobe.edu.au/) in Melbourne, Australia, ranks among the top 1 percent of universities globally and serves over 35,000 students each year. Known for its academic excellence and research achievements, La Trobe is dedicated to streamlining operations, driving innovation, and enhancing services for its students, staff, and partners.

With an ambitious plan to transform operations through an "AI-first" approach, La Trobe introduced the Troby agent, first making it available to academic staff. In this case study, you learn:

- How the Troby agent enhances support services for staff at La Trobe University.
- That intent recognition can be optimized by saving sample user queries in KB articles, implementing a classification process, and using AI prompts.
- How AI prompts can be used for summarizing responses back to the user.
- An alternative approach for integrating ServiceNow knowledge articles to be used by a Copilot Studio agent.

## Challenges

La Trobe's digital transformation vision is anchored in an AI-first approach—a belief that artificial intelligence can and should be applied across university operations to improve productivity, unlock insights, and elevate the experience for staff and students.

But like every ambitious strategy, the journey began by addressing one of La Trobe's biggest pain points: knowledge fragmentation.

Academic and professional staff needed to access information from multiple knowledge sources across departments such as HR, Finance, and IT. This information sits across multiple systems. Of these systems, ServiceNow contained the largest and most critical repository, with more than 10,000 knowledge base articles.

However, accessing this information was cumbersome and time-consuming. Staff often spent valuable minutes navigating articles and piecing together the right answers—time that could be better spent supporting students and advancing academic work. By solving this challenge first, La Trobe laid the foundation for scaling AI into every corner of the university.

La Trobe also acknowledged students' expectations for modern digital solutions. As a next step, the university plans to extend access to this solution for students' knowledge base articles as well.

> Students expect a consumer-grade experience with seamless, mobile-friendly applications for admissions and student management, and they want to be able to perform tasks from anywhere at any time. This expectation reflects the shift toward hybrid learning post-COVID.
>
> — *Shainal Kavar, Chief Information Officer, La Trobe University*

Together with Shainal Kavar, the following people make up the team behind Troby:

- Chatham Vidanagamage, Associate Director AI, and Innovation, La Trobe University. Serves as the product owner.
- Varanga De Silva, AI Engineering Lead, La Trobe University. Serves as solution lead and developer.

## Solution

To enhance access to the university knowledgebase, La Trobe University developed an AI-powered conversational agent named Troby by using Microsoft Copilot Studio and deployed it to Microsoft Teams. The academic staff at the university can now use natural language to gain access to university specific information.

Troby integrates with ServiceNow via a custom-developed middleware API to retrieve over 10,000 articles and sends them through a "low code RAG solution pipeline." La Trobe University adopted this approach when it reached the limits of the built-in ServiceNow connector.

The solution was built using Copilot Studio, Power Automate, and AI Builder with a set of custom no-code trained models and AI prompts to facilitate intent recognition, data retrieval and summarization, ensuring efficient interaction. A user feedback process continuously improves the KB articles.

## Implementation approach

The process of building the agent began by validating Copilot Studio's built-in ServiceNow connector. However, limitations quickly emerged:

- It could only retrieve brief snippets of knowledgebase articles.
- Structured, step-by-step instructions within knowledge articles weren't accessible.
- The connector couldn't perform intent-based routing or semantic retrieval.

To overcome these limitations, design a low-code RAG (retrieval-augmented generation) architecture that consists of:

- Middleware API-based data extraction from ServiceNow.
- AI Builder-powered intent classification.
- Power Automate flows for knowledge retrieval and generative answering.
- Dataverse as the storage and search engine backend.

Each of these components works seamlessly with Copilot Studio to deliver contextual, permission-aware, and maintainable knowledge experiences.

### Conversation routing and orchestration

The La Trobe agent uses a hybrid approach to intent recognition, starting with a customized version of the system topic *Conversational Boosting*.

1. Users interact with the agent through Microsoft Teams. When a user sends a query to Troby via Microsoft Teams, the Copilot Studio topic "Conversational Boosting" is triggered, and the user query is captured.
1. A flow is triggered to classify the intent of the query using a custom-trained AI Builder classification model.
1. The AI model returns the predicted knowledge category (for example, "Information Services," "HR," "Finance") and a confidence score.
1. If the confidence score exceeds 0.80, the conversation is routed to a corresponding topic based on the predicted category.
1. That topic then triggers a second flow to retrieve the relevant knowledge article.

This hybrid orchestration model ensures that intent recognition, retrieval logic, and conversational generation are cleanly separated but tightly integrated.

The following image illustrates academic staff asking the agent a question and getting a response back.

:::image type="content" source="media/la-trobe-university/promogenius-app-interface.png" alt-text="Screenshot of the chat interface where an academic staff member asks a question, and Troby responds with a relevant answer." lightbox="media/la-trobe-university/promogenius-app-interface.png":::

The default conversational boosting passes the user query to a flow to check the classification and redirects the flow to different topics if the identified intent in the output of an AI prompt has a confidence score that's 0.80 or higher.

:::image type="content" source="media/la-trobe-university/user-questions.png" alt-text="Screenshot of a conversational boosting flow illustrating user intent classification and confidence score.":::

The following image illustrates how a flow is called from the agent. The flow includes an AI prompt, and the output is the response from the AI model, along with other related information.

:::image type="content" source="media/la-trobe-university/power-automate-flow.png" alt-text="Screenshot showing a flow called from the agent including an AI prompt with output presented as the response along with other information." lightbox="media/la-trobe-university/power-automate-flow.png":::

The following image shows a selection of topics within the agent, different topics depending on user intent, and the data source to be used.

:::image type="content" source="media/la-trobe-university/agent-topics.png" alt-text="Screenshot showing categorized agent topics, including user intent labels and linked data sources for retrieval." lightbox="media/la-trobe-university/agent-topics.png":::

### Custom low-code RAG

The team built a low-code knowledge article retrieval pipeline, which works like a typical RAG architecture except that it retrieves data from Dataverse based on similar keyword matching rather than embedded vector similarity.

1. **Data ingestion from ServiceNow**

    Per category, two nightly flows are executed:

    1. Intent Model Trainer flow
        - Fetches 10–30 sample questions per KB article from ServiceNow.
        - Populates a Dataverse intent table with:
            - Sample question
            - KB article number
            - Knowledge category (for example, "IS," "HR")
        
        This Dataverse table is used to train a "Custom Category Classification Model" available from AI Builder. Learn more in [Intent recognition process](#intent-recognition-process).

    1. Knowledge Content flow
        - Fetches article metadata, heading, full HTML content, and links.
            - Cleans and strips HTML, then stores the result in a dedicated Dataverse table per category.
            - Fields include: Cleaned Content, Heading, Sample Questions, KB URL, KB Number, Group, Author, and more.

    Each KB article is stored as one record, preserving structure and metadata for accurate retrieval and citation.

1. **Runtime Knowledge Retrieval flow**

    Once routed to a knowledge category topic, another flow runs:

    - Formats the user query into markdown and strips special characters.
    - Uses AI Builder prompts to convert the user's query into a keyword search query.
    - Searches the corresponding Dataverse table (based on category) for the best-matching article. The match is done against content, heading, and stored sample questions.
    - The matched article is formatted into a structured JSON table compatible with Copilot Studio's "Generative Answers" action.

This custom retrieval logic effectively simulates the role of a semantic search engine by using only Power Platform tools.

The following image shows the AI Builder prompts used for extracting keywords from the user query.

:::image type="content" source="media/la-trobe-university/ai-builder-prompt.png" alt-text="Screenshot showing the AI Builder prompt used to extract keywords from a user query." lightbox="media/la-trobe-university/ai-builder-prompt.png":::

The following image shows how the extracted keywords are then used to search Dataverse for articles.

:::image type="content" source="media/la-trobe-university/extracted-keywords.png" alt-text="Screenshot showing how extracted keywords are used to search Dataverse for relevant articles.":::

Using the knowledge article contents returned from the search, AI Builder prompts are further used for formatting and constructing a generative response.

:::image type="content" source="media/la-trobe-university/ai-builder-formatting.png" alt-text="Screenshot showing how AI Builder prompts are used for formatting and constructing the generative response." lightbox="media/la-trobe-university/ai-builder-formatting.png":::

The formatted generative response is then returned back to Copilot Studio for the next steps.

### Generative answer construction

Once the matching KB article is retrieved and formatted, Copilot Studio uses a dedicated topic called "Conversation Flow" to:

- Maintain previous interactions and follow-up context
- Feed the article content, user query, and context into the Generative Answers node
- Generate a natural-language response
- Render the response in an Adaptive Card with links and context

This conversational experience feels fully natural to users, while being grounded in enterprise knowledge and security.

The following image shows the generative answers node used in the conversation flow and display of the generative response based on a condition if citations exist or not.

:::image type="content" source="media/la-trobe-university/generative-answers.png" alt-text="Screenshot of the generative answers node displaying a generative response based on conditions.":::

### Intent recognition process

To support effective classification and routing:

- Every ServiceNow KB article includes sample questions, populated manually by domain SMEs (subject matter experts).
- These samples are used to train a custom AI Builder classification model, which powers intent detection.
- The AI model is triggered at runtime via a flow and returns the predicted category and confidence score.

The model uses the Dataverse intent table, which might be enhanced in the future to:

- Act as a permissions filter, using Microsoft Entra ID group membership.
- Act as a routing guide for multi-agent environments.

The following image shows the model trained as the "Intent Classification" using the "Custom Category Classification" model available in AI Builder.

:::image type="content" source="media/la-trobe-university/intent-classification.png" alt-text="Screenshot showing the User Intent Classification model.":::

## Technologies used

This solution uses the following technologies:

- Copilot Studio
    - Chatbot development
    - Topic orchestration
    - Generative answers
- Dataverse
    - Structured storage for KB articles, classifications, and metadata
- AI Builder
    - Custom classification model
    - Prompt-based query to keyword conversion
- Power Automate
    - Data ingestion
    - Runtime classification
    - Search and orchestration
- Microsoft Teams
    - Primary channel for the Troby staff assistant

## Architecture

The Copilot Studio agent is currently deployed in Teams and used by academic staff. Future channels will include adding Troby to the website and Facebook, and enabling students to use the agent.

The architecture is organized in three layers: data, conversation, and user interface. The following image shows a high-level view of the architecture of the Troby agent across the multiple features used in the solution.

:::image type="content" source="media/la-trobe-university/troby-architecture.png" alt-text="Diagram showing the high-level architecture of the Troby agent." lightbox="media/la-trobe-university/troby-architecture.png":::

1. Data Layer
    1. Scheduled Power Automate flows extract data via ServiceNow API.
    1. Raw HTML is cleaned and organized into structured Dataverse tables per category.
    1. A separate intent table is populated with sample questions for training.
1. Conversation Layer
    1. User queries trigger intent classification and get routed to appropriate topics.
    1. Category topic triggers retrieval flow, which searches and fetches relevant article.
    1. JSON-formatted results are passed to the "Conversation Flow" topic.
    1. Generative response is created and returned using Adaptive Cards.
1. User Interface Layer
    1. Deployed within Teams (for staff)
    1. The roadmap includes deploying to the University website and Facebook for students.

## Takeaways

The case study of La Trobe University's Copilot Studio agent, Troby, demonstrates the potential of using Copilot Studio to create an agent that provides KB article information to users through natural language queries. 

Here are some key takeaways for IT professionals who want to implement a similar solution in their own organizations:

- Consider using an approach that includes AI prompts, flows, and Dataverse to overcome the limitations of a built-in connector.
- Use AI prompts for intent recognition in combination with classic orchestration and custom topics, an approach referred to as "hybrid orchestration."

Since La Trobe University launched Troby, the university has realized the following key benefits:

- Efficient access to academic resources and administrative information for faculty and staff, significantly reducing manual workloads and optimizing daily operations.
- Compared to their former platform that used chatbot functionality, they found Copilot Studio a powerful and cost-effective alternative for accelerating their AI journey.
- Overall metrics indicate that the Troby agent solves 71% of inquiries and five KB articles are updated per user feedback.

Other key learnings shared by La Trobe University include that AI-generated responses are as good as the quality of your data. The built-in connectors get you started connecting to enterprise data sources but might present limitations.

## Looking ahead

La Trobe University plans to continue expanding its AI capabilities, including extending agent functionalities for student use.

> "The idea is to expand Troby to our future and current students by 2026 whereby the entire university community will be served via Troby for their needs for university services and support"
>
> — *Chatham Vidanagamage, Associate Director AI and Innovation, La Trobe University*

Additionally, the university is exploring the integration of ServiceNow data into Azure AI Search as an alternative to the existing low-code RAG approach. Another initiative involves assessing the feasibility of a multi-agent architecture.

As La Trobe University advances its AI-first strategy, it aims to serve as a model for other institutions pursuing similar digital transformations.

## Related information

- [Copilot Studio overview](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)
- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Create and publish agents with Microsoft Copilot Studio](/training/paths/work-power-virtual-agents/)
- [Use generative answers in a topic](/microsoft-copilot-studio/nlu-boost-node)
- [Add tools to custom agents](/microsoft-copilot-studio/advanced-plugin-actions)
- [Use agent flows with your agent](/microsoft-copilot-studio/advanced-flow)
- [What is Microsoft Dataverse?](/power-apps/maker/data-platform/data-platform-intro)
