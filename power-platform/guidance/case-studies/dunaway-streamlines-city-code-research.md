---
title: Dunaway streamlines city code research with Copilot Studio
description: Learn how Dunaway's engineers transformed compliance workflows with Atlas, a conversational AI agent that delivers instant, accurate regulatory answers.
#customer intent: As a Power Platform user, I want to learn how Dunaway used Copilot Studio to build a conversational agent, including a knowledge ingestion pipeline that keeps content up to date, so that I can build a similar agent for my organization.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.date: 03/05/2026
ms.topic: overview
---

# Dunaway streamlines city code research with Copilot Studio

[Dunaway](https://dunaway.com/) is a Texas-based, multidiscipline design, planning, and engineering firm with a presence in more than 100 cities across the state. Their teams deliver complex civil and structural projects that rely on accurate interpretation of city, county, and state regulations.

Engineers often spent hours searching through large, frequently updated city-maintained manuals and repeatedly verifying requirements to ensure designs stayed compliant.

To streamline this work, Dunaway built a Microsoft Copilot Studio conversational agent that centralizes the regulatory documents their engineers depend on. By replacing manual searches with instant, natural language queries, the solution reduced research time by 90 percent, saving more than 10,000 hours each year.

This case study highlights how an AI-powered agent, called Atlas, provides a faster, more reliable way to access critical information, allowing teams to focus on design quality and delivering exceptional client service.

## Business challenges

Dunaway's engineers spent more than 10,000 hours each year manually searching, viewing, and interpreting regulatory documents across all the cities in which they operate. The volume and complexity of city, county, and state codes made the work slow and difficult.

Each local government maintains its own requirements, updates are frequent, and engineers often had to navigate multiple websites or outdated PDFs to find the latest information and verify compliance. Some cities offered keyword searchable PDFs, but inconsistent formatting and scattered sources still made the process cumbersome.

This manual approach consumed valuable time and introduced risk across multiple rounds of review. Engineers often worked across several manuals at once, each ranging from 100 to more than 3,000 pages, making it tedious to cross-check requirements without a central, reliable reference point. The scale and fragmentation of the information increased the risk of incorrect references or missed requirements, which could lead to costly redesigns and months of project delays for both Dunaway and its clients.

## Solution

Dunaway built Atlas to serve as an always updated, instantly searchable expert on regulatory requirements. It now acts as the company's single source of truth for civil engineering regulations. Engineers use it to verify compliance requirements during design, avoid outdated or incorrect code references, reduce internal review cycles, and eliminate manual document hunting across cities.

Key benefits include:

- Manual research time reduced by 90 percent
- More than 10,000 hours saved annually
- Increased productivity for civil engineering teams
- Improved project delivery speed and quality
- Greater accuracy and confidence in compliance

Instead of spending hours searching websites and databases, engineers now type a question into Atlas and receive an immediate, grounded answer.

> The speed to getting the answer was the end goal of creating the bot. Previously, if a client had a question in a meeting, our engineers would have to say, 'We'll look into that and get back to you.' Now, they're able to query the bot in a meeting and answer the client's question immediately.
>
> — *Brian Bowden, Vice President of Technology, Dunaway*

## Architecture

The solution is built on three connected components:

- **User-facing experience** delivers structured, citation-rich answers directly in Microsoft Teams.
- **Knowledge ingestion pipeline** continuously gathers and indexes regulatory content.
- **Citation enhancement** layer improves the precision of source references.

Together, these components ensure engineers receive fast and reliable responses backed by an up-to-date regulatory knowledge base.

:::image type="content" source="media/dunaway/architecture.png" alt-text="Diagram showing the technologies Dunaway used to build the Atlas agent, including Microsoft Copilot Studio, Azure AI Search, Azure Functions, and Power Automate." lightbox="media/dunaway/architecture.png":::

User-facing experience:

- **Copilot Studio** provides a conversational interface for querying regulatory information through the Atlas agent, deployed in Microsoft Teams.

- **Microsoft Teams** act as the primary channel where engineers interact with Atlas.

- **Adaptive Cards** ensure all responses are presented in a consistent, easy-to-read format.

Knowledge ingestion pipeline:

- **Microsoft Excel** stores a curated manifest of regulatory document sources.

- **Power Automate** retrieves content from those sources and prepares it for use.

- **SharePoint** stores the regulatory PDFs as the company's single source of truth.

- **Azure AI Search** provides the index that Atlas uses through agent flows.

Citation enhancement:

- **Azure Function apps** improve citation accuracy by linking answers back to the correct location in the source document. Atlas calls the function through agent flows.

## Key features

Atlas includes the following capabilities:

- City-specific document access
- Preconfigured options
- Natural language querying
- Direct citations to sources
- Escalation to subject matter experts

### City-specific document access

Engineers start by selecting a city, county, or entity. Once chosen, Atlas immediately displays the regulatory documents associated with it. Engineers can search for a specific document when they know what they need.

:::image type="content" source="media/dunaway/atlas-intro-card.png" alt-text="Screenshot of Atlas showing a welcome page in which the user can select city, county, entity, or a specific document." lightbox="media/dunaway/atlas-intro-card.png":::

This city-level separation helps prevent incorrect information and cross-referencing errors, and it ensures engineers always know exactly which jurisdiction they're working with. For example, selecting Fort Worth immediately returns a card filtered to Fort Worth-specific regulatory documents.

:::image type="content" source="media/dunaway/atlas-knowledge-card.png" alt-text="Screenshot of Atlas showing a list of Fort Worth knowledge documents." lightbox="media/dunaway/atlas-knowledge-card.png":::

From here, engineers can open any document stored in SharePoint, ask city-specific questions, or use the preconfigured **Suggest Code Addition** option to flag missing information for review. When new projects introduce new jurisdictions, the goal is for Atlas to already contain the relevant documents by the time the project kicks off. The team also wanted a simple way to show what information is available and what still needs to be added, so engineers can continue contributing the documents and details they need.

:::image type="content" source="media/dunaway/atlas-code-addition-card.png" alt-text="Screenshot of Atlas showing the code addition suggestion card." lightbox="media/dunaway/atlas-code-addition-card.png":::

### Natural language querying

When you query Atlas, it presents results in a clear, structured format. Inline citations make it easy to trace information back to its original source, while Adaptive Cards provide the consistent layout that keeps every response easy to understand. Engineers can jump straight to the exact paragraph used to generate the answer.

Each answer includes:

- A confidence score
- A clearly formatted response
- Direct citations to sources
- A list of documents used

:::image type="content" source="media/dunaway/atlas-response-card.png" alt-text="a response card with the preconfigured options suggest code addition and view similar questions." lightbox="media/dunaway/atlas-response-card.png":::

The preconfigured **View Similar Questions** option shows engineers a list of suggested next questions.

:::image type="content" source="media/dunaway/atlas-similar-questions-card.png" alt-text="Screenshot of Atlas showing the similar questions card." lightbox="media/dunaway/atlas-similar-questions-card.png":::

To make it easier for engineers to view the sources and quickly verify the information, Dunaway uses an open source PDF viewer that highlights the referenced content.

:::image type="content" source="media/dunaway/pdf-viewer.png" alt-text="Screenshot of a PDF viewer showing City of Houston regulatory information with text certain highlighted in green." lightbox="media/dunaway/pdf-viewer.png":::

If an answer seems unclear or incomplete, engineers can escalate the conversation directly to a subject matter expert. Atlas packages the conversation history and sends it to the appropriate reviewer, ensuring fast follow-up and reducing the risk of misinterpretation.

## Implementation approach

The team initially built a knowledge ingestion pipeline by using Microsoft Excel, Power Automate, SharePoint, and Dataverse. By using the Copilot Studio Kit feature [SharePoint synchronization](/microsoft-copilot-studio/guidance/kit-file-synchronization), the team brought documents from SharePoint into Dataverse as Copilot Studio knowledge documents. To further improve response accuracy and retrieval quality, the team later replaced Dataverse with an Azure AI Search index.

With the Dataverse approach, Atlas used multiple Copilot Studio topics, one for each city. During ingestion, each document was placed into the appropriate city topic, which kept the knowledge base organized and improved retrieval accuracy. After moving to Azure AI Search, the team consolidated everything into a single Copilot Studio topic and achieved knowledge isolation through index filtering instead of topic separation.

### Knowledge ingestion pipeline

The workflow is as follows:  

1. Subject matter experts maintain an Excel manifest listing more than 200 regulatory document sources, including URLs and metadata for each city.  

1. A Power Automate cloud flow reads the manifest, collects both static and dynamic content, converts the material into PDFs, and stores the documents in SharePoint as the single source of truth.

1. A second flow processes the PDFs, extracts content and metadata, and updates an Azure AI Search index. The team uses a single Azure AI Search index but controls indexing so each document is assigned to a specific city bucket.

### Chunk retrieval and response generation

When a user selects a city, Atlas stores that selection in a city variable. An agent flow is used to connect Atlas to Azure AI Search. This approach returns results in JSON format and supports precise filtering.

The city variable is passed into the agent flow, which combines the user's query with the city filter before sending it to Azure AI Search. The index returns the top five relevant chunks, which are then passed back to Copilot Studio for response generation using an AI prompt.

:::image type="content" source="media/dunaway/atlas-ai-flow.png" alt-text="Screenshot of an agent flow configuration, sending an HTTP request to an Azure AI Search index and retrieving a response." lightbox="media/dunaway/atlas-ai-flow.png":::

After the agent flow returns the top chunks, Atlas runs each one through a citation‑matching step that maps the chunk back to the correct page in the source PDF. Atlas then attaches the page number and metadata to each chunk before passing everything into the AI prompt to generate the final response.

### Improving citation accuracy

Reliable paragraph‑level citations were essential for building trust. Although many document chunks included paragraph metadata, citations could initially be added correctly only about 70 percent of the time.

The team introduced an Azure Functions app that processes the full PDF text and matches each returned chunk against all paragraphs in the document. This approach ensures the correct paragraph is identified even when metadata is incomplete.

The solution uses keyword‑based search over page‑grouped JSON documents, powered by the BM25 (Best Match 25) ranking algorithm. This structure makes it straightforward to map each chunk back to its page number. Each chunk is then passed to an AI prompt with its associated URL, enabling Atlas to produce clean, user‑friendly links in the final response.

## Takeaways

This case study demonstrates how Copilot Studio can centralize complex information from different sources and make it instantly accessible through natural language, so teams can find answers faster and focus their expertise.

> With this new generation of AI tools, intelligence is more accessible and easier to navigate than ever before. Instead of spending hours scrolling through PDFs or hunting for answers, our experts can focus their time and energy on high-leverage work&mdash;the kind that truly requires their judgment and experience. It hasn't just improved efficiency; it's sparked a wave of innovation across our company.
> 
> — *Brian Bowden, Vice President of Technology, Dunaway*

The Dunaway team shares three key takeaways:

1. **Start now&mdash;even small experiments matter**

    There's no perfect time to begin, and waiting is the bigger risk. The ecosystem is moving fast. Start with a small proof of concept, something tangible enough to learn from and concrete enough to demonstrate to others. Even a modest pilot builds momentum and uncovers opportunities you wouldn't anticipate. The learning compounds quickly once you're in it.

1. **Build with people, not just for them**

    Adoption is the whole game. The most powerful tool in the world doesn't create value if no one uses it. Involve your users early. Develop iteratively with their feedback. Let them see the evolution. When people feel ownership in the process, adoption follows naturally, and they start imagining use cases you never would have.

1. **Dream bigger**

    What's possible today is remarkable, and it's expanding quickly. Initial obstacles are inevitable, but the broader ecosystem offers more pathways and workarounds than you'd expect. Once you understand the building blocks, you realize that most constraints are architectural challenges, not hard limits. The real opportunity isn't just solving today's problem&mdash;it's reimagining how work gets done.

## Looking ahead

Dunaway plans to expand Atlas's capabilities, including adding tools that automatically check drawings against city codes to support QA/QC workflows. Atlas currently supports document‑related work in roughly half of Dunaway's cities, and its coverage continues to expand to encompass all of them. The team uses Copilot Studio Kit for monitoring and plans to deepen that usage, with [conversation transcript analysis](/microsoft-copilot-studio/guidance/kit-conversation-analyzer) as one of the next focus areas.

Beyond Atlas, the team launched DAVE, the Dunaway AI Virtual Expert, a company‑wide conversational agent that brings HR, IT, and accounting support into a single experience. Employees can get answers, complete forms, and submit support requests in one place, reducing IT tickets by 80 percent. DAVE has quickly become part of the culture, embraced by teams as a true colleague.

> We wanted to make the AI agent a team member and part of the company. Everyone has bought into that concept. In meetings, people ask, 'Can DAVE do this?'
>
> — *Brian Bowden, Vice President of Technology, Dunaway*

## Related information

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
- [Using Adaptive Cards in Copilot Studio](/microsoft-copilot-studio/adaptive-cards-overview)
- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Copilot Studio Kit overview](/microsoft-copilot-studio/guidance/kit-overview)
- [What is Azure Functions?](/azure/azure-functions/functions-overview)
- [What is Azure AI Search?](/azure/search/search-what-is-azure-search)
