---
title: Extract and analyze agent conversation transcripts
description: Learn how to extract and analyze agent conversation transcripts with AI to uncover key insights, improve accuracy, and enhance decision-making.
#customer intent: As a Copilot Studio maker, I want to analyze agent conversation transcripts to identify key insights and improve accuracy.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 12/05/2025
ms.author: pubehera
ms.reviewer: jhaskett-msft
---  

# Extract and analyze agent conversation transcripts

Extracting and analyzing agent conversation transcripts can help organizations gain valuable insights into user interactions, improve agent performance, and enhance customer satisfaction. 

This architecture demonstrates how to automatically capture, analyze, and visualize information from agent conversation transcripts. By using advanced AI algorithms supported by structured prompts, the system efficiently processes conversational data, extracts critical insights, and enhances decision-making. It also provides a comprehensive overview of the extracted data for better strategic planning.

> [!TIP]
> You can find a sample implementation of this feature in the [Copilot Studio Kit](/microsoft-copilot-studio/guidance/kit-overview). The Conversation Analyzer feature in the Copilot Studio Kit analyzes conversation transcripts and finds the desired actionable insights.
>
> Learn more: [Analyze conversation transcripts with Copilot Studio Kit (preview)](/microsoft-copilot-studio/guidance/kit-conversation-analyzer)

## Architecture diagram

:::image type="content" source="media/analyze-agent-conversation-transcripts/agent-conversation-transcript.png" alt-text="Diagram of the Copilot Studio workflow showing an agent interaction and transcript logging process." lightbox="media/analyze-agent-conversation-transcripts/agent-conversation-transcript.png":::

## Workflow

1. A user interacts with the agent.

1. Copilot Studio logs the transcript.

1. Flow triggers upon the conversation transcript record creation.

1. Flow fetches and forwards the transcript to AI Builder.

1. AI Builder processes and returns sentiment, topics, and summary.

1. Flow collects the structured results from AI Builder and stores them in Microsoft Dataverse.

1. Power BI visualizes this data for actionable insights.

## Components

1. **Users:** Users interact with the agents in Copilot Studio through a supported channel such as Microsoft Teams or a website.

1. **Agents:** Hosted in [Microsoft Copilot Studio](/microsoft-copilot-studio/), the agent handles conversations and logs the interaction internally.

1. **Conversation Transcripts:** Conversation transcripts in Copilot Studio are structured logs of interactions between users and AI agents. The backend Copilot Studio service automatically generates transcripts during user-agent interactions and stores them in the [ConversationTranscript table](/power-apps/developer/data-platform/reference/entities/conversationtranscript) in Dataverse in JSON/text format.

1. **[Power Automate cloud flow](/power-automate/overview-cloud):** Retrieves conversation transcript records from Dataverse, processes them through [AI Builder](/ai-builder/), and stores the generated analysis results in Dataverse.

1. **[AI Builder](/ai-builder/):** Applies AI models to analyze sentiment (positive, neutral, negative), identify and flag personal data, extract key phrases and issues, detect escalation indicators, and generate conversation summaries.

1. [**Microsoft Dataverse**](/power-apps/maker/data-platform/): Securely stores structured data including raw transcripts, processed AI metadata, and sentiment scores and categories.

1. **Dashboard:** Visualizes insights from Dataverse such as agent performance, user satisfaction trends, escalation patterns, and frequent user intents and topics.

## Scenario details

Organizations that use Copilot Studio agents for customer or employee support often struggle to extract valuable insights from conversation history. By using Power Platform capabilities like AI Builder, Power Automate, and Dataverse, this architecture provides:

- Automated capture of conversation transcripts.
- AI-powered analysis of sentiment, key topics, and agent effectiveness.
- A secure and structured data store.
- A rich dashboard for supervisors and decision-makers.

### Business value

- Improves agent training and customer satisfaction through sentimental insights.
- Identifies trending topics and frequent issues.
- Automates post-conversation reporting workflows.
- Ensures compliance and data governance through Dataverse security.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

## Security

- Stores data securely in Dataverse.
- Role-based access control (RBAC) ensures only authorized users access data.
- All data flows comply with data policies in Power Platform environments.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- [**Purnananda Behera**](https://www.linkedin.com/in/purnanandabehera/), Senior Software Engineer

## Next steps

- Integrate Azure OpenAI for advanced natural language processing use cases.
- Add user feedback or rating modules for supervised learning.
- Connect to Dynamics 365 or ServiceNow for incident creation or escalation.
