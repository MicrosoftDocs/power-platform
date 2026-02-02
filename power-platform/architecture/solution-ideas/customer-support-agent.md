---
title: ​​Streamline customer support service operations with a customer support assistance agent​
description: Learn how to streamline customer support by building a Microsoft Copilot Studio conversational agent that integrates to Dynamics 365, Dataverse, and SharePoint.
#customer intent: As a Copilot Studio maker, I want to build an conversational agent to streamline customer support.
author: carcla
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 01/20/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---

# ​​Streamline customer support service operations with a customer support assistance agent​

Customer service teams often struggle with high ticket volumes, repetitive queries, and inconsistent response quality. By creating a custom assistance agent built using Microsoft Copilot Studio, the agent can answer many of the queries by using its knowledge sources. The agent helps with issue categorization, sentiment analysis, and recommends personalized resolutions by retrieving relevant knowledge articles and historical case data from Dynamics 365, Dataverse, and SharePoint. When necessary, the agent can hand off the request to a live agent to assist with resolution. The custom agent can also answer other customer inquiries beyond support and route support requests for handling by the organization’s engagement hub.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/customer-support-agent/architecture.png" alt-text="Diagram that shows integration points and knowledge sources for creating a conversational customer support agent in Copilot Studio." lightbox="media/customer-support-agent/architecture.png":::

### Knowledge sources

To assist with customer problem resolution, the solution requires several knowledge sources.

- **Customer service documents**: Documents that contain information about customer service approaches, previous problems solved, contact information, and similar details.

- **Industry documents**: Documents that contain guidelines, best practices, regulatory information, or reference material relevant to the organization’s industry or sector.

- **Resolution documents**: Documents that outline step-by-step instructions, troubleshooting guides, or standard procedures used to resolve known problems or support requests.

- **Guidance documents**: Documents that offer structured recommendations, workflows, or decision-making frameworks to support users in performing tasks or adhering to the organizational processes.

- **FAQs**: Documents that provide answers to frequently asked questions, helping users quickly find information related to common problems, processes, or policies.

## Workflow

1. **​Customer message analysis**: A customer interacts with the custom Copilot Agent that analyzes customer messages in real-time to determine their intent. You can configure the agent to handle a broad range of topics or focus on the support of a specific product set. This agent acts as the router and uses other agents for topics that are more specialized or escalates to a human for more personal care.

1. **​Customer Q&A**: The agent uses the configured knowledge sources, such as FAQs and guidance, to provide responses to the customer queries via chat. For questions that the agent can't answer, it can escalate to a human to get a timely response. Depending on the product type and urgency of the issue, the agent can help the customer create a follow-up ticket that an agent will follow up later.

1. **​Escalation**: You can configure the agent to identify when users want to escalate to a human. By configuring an Escalate system topic, the agent can handle these types of user requests. By default, the agent's Escalate system topic lets users know nobody is available to help them. By adding a Transfer conversation node to that topic, the topic starts the transfer of the customer conversation to a customer engagement hub that you configure. When the transfer happens, the available session context is included in the transfer so the receiving agent has context of the customer's inquiry that led to the escalation. You can also configure the agent to escalate under specific conditions. For example, if the agent encounters an error and can't create a ticket, it could request the escalation process directly.

1. **​Handling the transfer**: When the Transfer conversation occurs, the agent uses the configured Customer Engagement Hub to hand off the user to the configured hub for further processing. The following are the Customer Engagement Hub options on the channel configuration panel for the agent.

   :::image type="content" source="media/customer-support-agent/customer-engagement-hub.png" alt-text="Screenshot that shows the customer engagement hub with chat handoff options to live agents through integrated platforms like Dynamics 365." lightbox="media/customer-support-agent/customer-engagement-hub.png":::

   Using Dynamics 365 as an example, when the transfer happens, the context information passed is used to route the session to the appropriate workstream that the agent is associated with. The workstream configuration includes routing and queues that result in the transferred session being handed to the appropriate agent. The agent is then able to directly interact with the customer using the Copilot service workspace where they receive a summary of the customers’ prior interactions and can interact with them using the tools provided Dynamics 365. Similar experiences can be accomplished with other providers or using integration using the custom engagement hub capabilities available for other solutions not specifically listed.

1. **Escalation Insights**: Using escalation analysis can help you understand how your agent handles interactions and when they aren't handling them and they are escalated. When an agent answers the user query without having to escalate to a human representative, that's a deflection. The ideal goal is to increase the deflection rate of an agent by reducing the number of escalations. Using built-in analytics, all the agent sessions that led to an escalation or transfer to a representative are captured from beginning to end. The analytics dashboard has a section for "Escalation Rate Drivers", which gives details on which agent topics were escalated to human representatives most of the time and why. Use this information to customize your agent to increase your deflections.​

## Components

[​​**Power Platform environment**](/power-platform/admin/environments-overview): Contains the Power Platform resources such as the agent built in Copilot Studio. You move these resources from one environment to another (for example, dev to test) by using Dataverse solutions. Depending on the Customer Engagement Hub you configure, it might require configuration in the same Power Platform environment.

​[**Copilot Studio agents**](/microsoft-copilot-studio): Use Copilot Studio to implement the agents in the solution.  The primary agent, the Support agent, interacts with users directly or it can be triggered autonomously. For example, an inbound email to the support email could trigger the agent.  You configure the Support agent with knowledge sources, so it has organizational knowledge of the products and the support procedures for investigating and resolving customer problems.

**​Customer Engagement Hub**: This component is separate from the agent and is designed to handle omnichannel customer engagement with a live representative. For example, Dynamics 365 Contact Center could be used to handle the transfer from the agent to the live representative. Typically, these engagement hubs manage the queuing and prioritization of inbound sessions as well as skill matching to the live representatives.

**​Microsoft 365 Document Library**: Storing the product guidance, FAQs, and other knowledge information in a document library allows these assets to be easily used as a knowledge source by the agents.​

## Scenario details

> [!NOTE]
> This solution idea shows how the [Using AI Agents to create a customer support assistance agent](https://adoption.microsoft.com/scenario-library/customer-service/customer-support-assistance-agent/) scenario from the [Microsoft Scenario Library](https://adoption.microsoft.com/scenario-library/) could be architected. Refer to the details in the scenario library to learn more about the business impact and key performance indicators (KPIs).

The customer support assistance agent helps service teams resolve customer problems faster by pulling answers instantly, guiding troubleshooting steps, and automating common case actions. It provides real‑time response support during live interactions, ensuring agents can deliver accurate, consistent information without searching across systems. 

This agent reduces handling time, improves resolution accuracy, and lowers the need for escalations through faster information access and structured troubleshooting. It also boosts customer satisfaction by enabling timely, reliable responses while giving leaders insights that highlight knowledge gaps and process improvement opportunities.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

​**​Design your workload to avoid unnecessary complexity**: By integrating the agent with a supported customer engagement hub, you reduce complexity by not requiring custom integrations to be built to complete the handoff of the session between the agent and the engagement hub.  This approach also allows you to leverage each platform's strengths.  For example, matching the session to the representative is something the engagement hub handles. 

**​Test for resiliency and availability**: With multiple integrated systems, it's important to implement error handling and transient fault handling for any interactions with those systems that might impact the process. For example, if the agent can't transfer the conversation, it might automatically create a ticket for follow-up later. 

**​Measure and publish the health indicators**: Telemetry from the agent runtime should provide adequate indicators of the agent’s health. You can also configure the agent to publish to Application Insights. By using the telemetry in Application Insights, you can query the data as well as include custom telemetry events from your topics. Escalations also have built-in telemetry that is captured and can be analyzed to increase your deflection rates. You can also build on your own custom analytics on top of the conversation transcripts data. Learn more: [Analytics considerations for Copilot Studio vs Dynamics 365 Omnichannel](/microsoft-copilot-studio/guidance/oc-pva-analytics)

**​Knowledge source reliability**: Customers depend on getting accurate information from the agent. Typically, you should scope these types of agents to use only their pre-configured knowledge sources. For example, a specific website or a specific set of documents. These resources should be organizationally controlled with a process for change management. Allowing these types of support agents to use knowledge acquired by searching the web could lead to undesirable accuracy consistency. You must also consider how the product or service you're supporting versions – you might need knowledge for multiple versions all queryable at the same time.​ 

### Operational excellence

**​​Adopt safe deployment practices**: Standardize deployment of any changes to the apps and agents by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. Power Platform custom connectors are also solution components and deploy alongside the apps and agents, but keep them in their own Dataverse solution. Agents can also live in their own solution separate from the applications and custom connectors. However, this separation can increase the complexity of the deployment. Keep them separate to support the need to deliver the agents on a separate timeline from the application. Consider how the engagement hub you're using and how their lifecycle might impact the Copilot Studio agent. For example, you likely have a test engagement hub and a production one that your agents connect to at their respective lifecycle stage.

**​Automate all tasks that don't benefit from the insight and adaptability of human intervention**: Measuring the accuracy, relevancy, and quality of answers to questions is an important ongoing activity. Copilot Studio allows creating test sets that simulate real-world scenarios for the agent. Using the evaluation capability, you can automate and repeat this process as you deploy changes, as models retire and are replaced, or during other situations where you want to make sure your agent is answering user queries successfully.

**​Design and implement automation up front**: Create test sets early in the agent development to allow automated evaluation of the agents in your solution. Early on you might not know all the tests you need for the agent, so Copilot Studio can generate test sets from your configured knowledge sources.

### Performance efficiency

​**​Optimize logic**: An agent's instructions are a form of logic. They provide the instructions for how the agent should guide the user through the onboarding process. As your instructions in a single agent become more complex, the agent might not be as precise in following the instructions or can become confused with overlap between the instructions that might not be obvious. Move some of the responsibility to another agent, a tool such as a prompt, a custom connector, or all together to MCP. Consider agent flows where a more deterministic path of execution is required for the onboarding process. The agent sees agent flows as tools and they can have instructions that include using specific tools. For example, Create Product Return might be implemented as an Agent Flow that customer product information and prepares an RMA using connectors to the organization's other systems that need to be integrated with to complete the RMA process.​ 

**Test performance**: Along with testing for functionality and failures, test and develop a baseline for performance. Evaluate it as part of your release cycle.

### Experience optimization

**Know when to hand-off**: It's important to build a handoff process for when your conversational user experience can't understand the user or can't help them. You might direct the customer to a human support representative or to resources such as support websites or online documentation. Learn more: [Design graceful fallbacks and handoffs for more in-depth discussion](/microsoft-copilot-studio/guidance/cux-fallbacks).
 
**Understand the user's intent**: Take time up front to understand why your user might be using the agent. Start by identifying what users want to accomplish. Map out key intents for your workload, and design targeted interactions that match those intents. Study user behavior, preferences, and contextual cues to anticipate the various ways that users might communicate their intentions. Evaluate the built-in phrases that trigger escalation based on your user audience.

### Responsible AI

​**​Ensure fair treatment**: Ensure fair treatment across all customers by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, enforce strict data privacy and security protocols.

**​Transparency and trust**: Ensure users know when they're using a support agent that uses AI capabilities. For example, responses should reference a specific knowledge source when possible and agents should make clear when the user is interacting with an agent and when they're receiving a response from a human.

**​Feedback loops**: Agents can easily accept feedback from the users on their interactions with the agent. Users can thumb up or down by using the feedback control and Copilot Studio aggregates and presents this feedback for your review. Implement processes to review this feedback to identify issues of bias or fairness.

**​Human-in-the-loop**: Product support is not always deterministic, and responses can be dynamic based on the user input. Ensure that adequate review and escalation to a human is implemented giving the user a way to verify anything that didn't match with their expectations for a response.

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Copilot Studio documentation](/microsoft-copilot-studio)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance)
- [Copilot Studio implementation guide (PDF)](https://aka.ms/CopilotStudioImplementationGuide)
- [Knowledge sources summary](/microsoft-copilot-studio/knowledge-copilot-studio)
- [Agents for customer engagement and handoff](/microsoft-copilot-studio/customer-copilot-overview)
- [Hand off to a live agent](/microsoft-copilot-studio/advanced-hand-off)
