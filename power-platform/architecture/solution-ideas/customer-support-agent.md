---
title: ​​Streamline customer service with a customer support assistance agent​
description: Learn how to streamline customer support by building a Microsoft Copilot Studio conversational agent that integrates to Dynamics 365, Dataverse, and SharePoint.
#customer intent: As a Copilot Studio maker, I want to integrate a customer support agent with Dynamics 365, Dataverse, and SharePoint so that it can access relevant knowledge sources for efficient issue resolution.
author: carcla
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 02/03/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---

# ​​Streamline customer service with a customer support assistance agent​

Customer service teams often struggle with high ticket volumes, repetitive queries, and inconsistent response quality. By creating a custom assistance agent using Microsoft Copilot Studio, the agent can answer many of the queries using its knowledge sources. The agent helps with issue categorization, sentiment analysis, and recommends personalized resolutions by retrieving relevant knowledge articles and historical case data from Dynamics 365, Dataverse, and SharePoint. When necessary, the agent can hand off the request to a live agent to assist with resolution. The custom agent can also answer other customer inquiries beyond support and route support requests for handling by the organization's engagement hub.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/customer-support-agent/architecture.png" alt-text="Architecture diagram of a customer support solution agent showing Customer Relationship Management (CRM), agent, data sources, and knowledge integration points.":::

### Knowledge sources

To assist with customer problem resolution, the solution requires several knowledge sources.

- **Customer service documents**: Documents that contain information about customer service approaches, previous problems solved, contact information, and similar details.

- **Industry documents**: Documents that contain guidelines, best practices, regulatory information, or reference material relevant to the organization's industry or sector.

- **Resolution documents**: Documents that outline step-by-step instructions, troubleshooting guides, or standard procedures to resolve known problems or support requests.

- **Guidance documents**: Documents that offer structured recommendations, workflows, or decision-making frameworks to support users in performing tasks or adhering to the organizational processes.

- **FAQs**: Documents that provide answers to frequently asked questions, helping users quickly find information related to common problems, processes, or policies.

## Workflow

1. **​Customer message analysis**: A customer interacts with the agent that analyzes customer messages in real-time to determine their intent. You can configure the agent to handle a broad range of topics or focus on the support of a specific product set. This agent routes requests to specialized agents or escalates complex issues to a human for more personal support.

1. **​Customer questions and answers (Q&A)**: The agent uses the configured knowledge sources, such as Frequently Asked Questions (FAQs) and guidance, to provide responses to the customer queries via chat. When the agent can't answer a question, it escalates to a human for a timely response. Depending on the product type and urgency of the issue, the agent helps the customer create a follow-up ticket that a customer service representative addresses later.

1. **​Escalation**: You can configure the agent to identify when users want to escalate to a human. Configure an [Escalate system](/microsoft-copilot-studio/authoring-system-topics#escalate) topic, to handle these types of user requests. By default, the agent's Escalate system topic notifies users that no one is available to help them. By adding a [Transfer conversation node](/microsoft-copilot-studio/advanced-hand-off#configure-the-escalate-system-topic) to that topic, the topic starts the transfer of the customer conversation to a customer engagement hub that you configure. When the transfer happens, the available session context is included in the transfer so the receiving agent has context of the customer's inquiry that led to the escalation. You can also configure the agent to escalate under specific conditions. For example, if the agent encounters an error and can't create a ticket, it could request the escalation process directly.

1. **​Handling the transfer**: When the Transfer conversation occurs, the agent uses the configured customer engagement hub to hand off the user to the configured hub for further processing. The following are the customer engagement hub options on the channel configuration panel for the agent.

   :::image type="content" source="media/customer-support-agent/customer-engagement-hub.png" alt-text="Screenshot that shows the customer engagement hub with chat handoff options to live agents through integrated platforms like Dynamics 365." lightbox="media/customer-support-agent/customer-engagement-hub.png":::

   Using Dynamics 365 as an example, when the transfer happens, the context information passed is used to route the session to the appropriate workstream that the agent is associated with. The workstream configuration includes routing and queues that result in the transferred session being handed to the appropriate agent. The agent is then able to directly interact with the customer using the Copilot service workspace, where they receive a summary of the customer's prior interactions and can interact with them using the tools provided by Dynamics 365. You can accomplish similar experiences with other providers or by using the custom engagement hub capabilities available to other solutions. Learn more in [Hand off a conversation to a live agent](/microsoft-copilot-studio/guidance/channels#hand-off-a-conversation-to-a-live-agent).

1. **Escalation Insights**: Using [escalation analysis](/microsoft-copilot-studio/guidance/deflection-topic-escalation-analysis) can help you understand how your agent handles interactions and when it escalates them. When an agent answers a user query without escalating to a human representative, that's a deflection. The goal is to increase the deflection rate of an agent by reducing the number of escalations. Using built-in analytics, all the agent sessions that led to an escalation or transfer to a representative are captured from beginning to end. The analytics dashboard has a section for "Escalation Rate Drivers," which gives details on which agent topics were escalated to human representatives most of the time and why. Use this information to customize your agent to increase deflections.​

## Components

[​​**Power Platform environment**](/power-platform/admin/environments-overview): Contains the Power Platform resources such as the agent built in Copilot Studio. Use [solutions](/microsoft-copilot-studio/authoring-solutions-overview) to move resources from one environment to another, like development to test. Depending on the customer engagement Hub you configure, it might require configuration in the same Power Platform environment.

​[**Copilot Studio agents**](/microsoft-copilot-studio): Use Copilot Studio to implement the agents in the solution. The primary agent, the Support agent, interacts with users directly or it can be triggered autonomously. For example, an inbound email to the support email address triggers the agent. You configure the Support agent with knowledge sources so it has organizational knowledge about products and support procedures for investigating and resolving customer problems.

**​Customer engagement hub**: This component is separate from the agent and is designed to handle omnichannel customer engagement with a live representative. For example, Dynamics 365 Contact Center could be used to handle the transfer from the agent to the live representative. Typically, these engagement hubs manage the queuing and prioritization of inbound sessions and skill matching to live representatives.

**​Microsoft 365 document library**: ​Store the product guidance, FAQs, and other knowledge information in a document library so agents can easily access these assets as a knowledge source.

## Scenario details

> [!NOTE]
> This solution idea shows how the [Using AI Agents to create a customer support assistance agent](https://adoption.microsoft.com/scenario-library/customer-service/customer-support-assistance-agent/) scenario from the [Microsoft Scenario Library](https://adoption.microsoft.com/scenario-library/) could be architected. Refer to the details in the scenario library to learn more about the business impact and key performance indicators (KPIs).

The customer support assistance agent helps service teams resolve customer problems faster by pulling answers instantly, guiding troubleshooting steps, and automating common case actions. It provides real‑time response support during live interactions, ensuring agents can deliver accurate, consistent information without searching across systems.

This agent reduces handling time, improves resolution accuracy, and lowers the need for escalations through faster information access and structured troubleshooting. It also boosts customer satisfaction by enabling timely, reliable responses while giving leaders insights that highlight knowledge gaps and process improvement opportunities.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

​**​Design your workload to avoid unnecessary complexity**: By integrating the agent with a supported customer engagement hub, you reduce complexity by not requiring custom integrations to be built to complete the handoff of the session between the agent and the engagement hub. This approach also allows you to use each platform's strengths. For example, matching the session to the representative is something the engagement hub handles.

**​Test for resiliency and availability**: With multiple integrated systems, it's important to implement error handling and transient fault handling for any interactions with those systems that might affect the process. For example, if the agent can't transfer the conversation, it might automatically create a ticket for follow-up later.

**​Measure and publish the health indicators**: Telemetry from the agent runtime should provide adequate indicators of the agent's health. You can also configure the agent to publish to Application Insights. By using the telemetry in Application Insights, you can query the data and include custom telemetry events from your topics. Escalations have built-in telemetry that is captured and can be analyzed to increase your deflection rates. You can also build on your own custom analytics on top of the conversation transcripts data. Learn more in [Analytics considerations for Copilot Studio vs Dynamics 365 Omnichannel](/microsoft-copilot-studio/guidance/oc-pva-analytics).

**Enforce knowledge source accuracy**: Customers depend on getting accurate information from the agent. Scope these types of agents to use only their preconfigured knowledge sources, such as a specific website or a specific set of documents. These resources should be organizationally controlled with a process for change management. Allowing these types of support agents to use knowledge acquired by searching the web could lead to inconsistent accuracy. You must also consider how the product or service versions information. You might need to query knowledge across multiple versions simultaneously.​

### Operational Excellence

**​​Adopt safe deployment practices**: Standardize deployment of any changes to the apps and agents by using automated deployment processes such as pipelines. Promote the application to production only after testing changes. Power Platform custom connectors are also solution components and deploy alongside the apps and agents. However, keep them in their own Dataverse solution. Agents can live in their own solution separate from the applications and custom connectors. However, this separation can increase deployment complexity. Keep them separate to deliver the agents on a separate timeline from the application. Consider how the engagement hub and its lifecycle might affect the Copilot Studio agent. For example, you likely have a test engagement hub and a production hub that your agents connect to at their respective lifecycle stage. Learn more in [Establish an application lifecycle management strategy](/microsoft-copilot-studio/guidance/alm).

**Automate all tasks that don't benefit from the insight and adaptability of human intervention**: Measuring the accuracy, relevancy, and quality of answers to questions is an important ongoing activity. Create test sets in Copilot Studio that simulate real-world scenarios for the agent. Use the [evaluation capability](/microsoft-copilot-studio/analytics-agent-evaluation-intro) to automate and repeat this process as you deploy changes, as models retire and are replaced, or when you want to verify your agent is answering user queries successfully.

**Design and implement automation up front**: [Create test sets](/microsoft-copilot-studio/analytics-agent-evaluation-create) early in the agent development to allow automated evaluation of the agents in your solution. Early on, you might not know all the tests you need for the agent. Copilot Studio can generate test sets from your configured knowledge sources.

### Performance Efficiency

​**​Optimize logic**: An agent's instructions are a form of logic. They provide the instructions for how the agent should guide the user through the onboarding process. As your instructions in a single agent become more complex, the agent might not be as precise in following the instructions or might become confused by overlapping instructions. Move some of the responsibility to another agent, a tool such as a prompt, a custom connector, or Model Context Protocol (MCP). Use agent flows when you need a more deterministic path of execution for the onboarding process. Agents see agent flows as tools and can include instructions for using specific tools. For example, you can implement Create Product as an agent flow that collects customer product information and prepares a return material authorization (RMA) using connectors to integrate with the organization's other systems to complete the RMA process.​

**Test performance**: Along with testing for functionality and failures, test and develop a baseline for performance. Evaluate it as part of your release cycle. Learn more in [Design a testing strategy](/microsoft-copilot-studio/guidance/sec-gov-phase4).

### Experience Optimization

**Know when to hand off**: It's important to build a handoff process for when your conversational user experience can't understand the user or can't help them. You might direct the customer to a human support representative or to resources such as support websites or online documentation. Learn more in [Design graceful fallbacks and handoffs](/microsoft-copilot-studio/guidance/cux-fallbacks).

**Understand the user's intent**: Take time up front to understand why your user might be using the agent. Start by identifying what users want to accomplish. Map out key intents for your workload, and design targeted interactions that match those intents. Study user behavior, preferences, and contextual cues to anticipate the various ways users might communicate their intentions. Evaluate the built-in phrases that trigger escalation based on your user audience.

## Responsible AI

​**​Ensure fair treatment**: Ensure fair treatment across all customers by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, and enforce strict data privacy and security protocols.

**​Transparency and trust**: Ensure users know when they're using a support agent that uses AI capabilities. For example, responses should reference a specific knowledge source when possible and agents should make clear when the user is interacting with an agent and when they're receiving a response from a human.

**​Feedback loops**: Agents can easily accept feedback from the users on their interactions. Users can give a thumbs up or down by using the feedback control. Copilot Studio aggregates and presents this feedback for your review. Implement processes to review this feedback to identify bias or fairness issues.

**​Human-in-the-loop**: Product support isn't always deterministic, and responses can be dynamic based on the user input. Ensure humans can review escalations and let users verify unexpected responses.

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Copilot Studio documentation](/microsoft-copilot-studio)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance)
- [Copilot Studio implementation guide (PDF)](https://aka.ms/CopilotStudioImplementationGuide)
- [Knowledge sources summary](/microsoft-copilot-studio/knowledge-copilot-studio)
- [Agents for customer engagement and handoff](/microsoft-copilot-studio/customer-copilot-overview)
- [Hand off to a live agent](/microsoft-copilot-studio/advanced-hand-off)
