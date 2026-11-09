---
title: Build a multilingual IT self-service agent with Copilot Studio
description: Learn how to build a multilingual IT self-service agent with Microsoft Copilot Studio that integrates with external systems and hands off to human agents when needed.
#customer intent: As a Power Platform architect, I want to learn how to enable employees to resolve common IT issues through a multilingual self-service agent that provides answers, finds IT services, and manages support requests in Microsoft Teams.
ms.date: 11/09/2026
ms.topic: example-scenario
ms.subservice: architecture-center
author: caclaesson
ms.author: mapichle
ms.reviewer: jhaskett-msft
---

# Build a multilingual IT self-service agent with Copilot Studio

IT service desks receive a constant flow of routine requests that employees can often handle themselves, including how-to questions, password and access issues, hardware and software orders, and ticket status inquiries. This reference architecture shows how to build a multilingual IT self-service agent in Copilot Studio that enables employees to get answers from IT knowledge sources, search the service catalog, and create, update, or track incidents directly within Microsoft Teams.

The solution also addresses integrations with IT service management (ITSM) platforms that don't use Microsoft Entra ID. By maintaining employee identity throughout the process, organizations can enforce the correct access controls, keep actions tied to the individual user, and preserve auditability while allowing the agent to interact securely with external ITSM systems.

> [!TIP]
> This article provides an example scenario and a visual representation of an IT self-service agent built with Copilot Studio. This solution is a generalized example architecture that you can adapt to many scenarios and industries.

## Architecture

:::image type="content" source="media/multilingual-it-self-service-agent/multilingual-it-self-service-agent.png" alt-text="Architecture diagram showing an IT support agent in Microsoft Teams using Entra ID authentication and Copilot Studio for multilingual employee requests." lightbox="media/multilingual-it-self-service-agent/multilingual-it-self-service-agent.png":::

## Workflow

The following workflow describes how employees interact with the IT self-service agent, how the agent processes requests, and how administrators monitor and improve it.

1. **Sign in and ask**: An employee opens the IT self-help agent in Microsoft Teams. The agent signs the employee in with Microsoft Entra ID, so every conversation starts with a known identity.

1. **Detect language and orchestrate**: The agent detects the employee's language and responds in that language. Generative orchestration in Copilot Studio routes each request to the right topic or to a knowledge search, and asks a clarifying question when the request is ambiguous. Adaptive Cards let employees select options instead of typing responses.

1. **Ground the answer**: For how-to questions and troubleshooting issues, the agent searches IT guides in SharePoint and knowledge articles in the ITSM platform, and returns a short summary with a link to the source.

1. **Find a catalog item**: For hardware and software requests, the agent searches the service catalog and returns a short list of matching items, each with a link to its order form in the ITSM platform.

1. **Create, track, and update incidents**: When an employee needs to open a ticket, the agent presents incident categories for the employee's country or region and prefills the description from the conversation. The employee can list their open tickets and add updates. The agent acts only on tickets the employee owns.

1. **Connect to the ITSM platform**: Topics call the ITSM platform through a Power Platform connector. Where the ITSM platform trusts a different identity provider than the agent, the connection uses a tightly scoped service account. It passes the employee's identity in every query so the ITSM platform can enforce access checks and record actions in its audit trail. When per-user sign-in to the ITSM platform is available in the chat, the connection switches to the employee's credentials.

1. **Hand off to a person** (optional): The agent offers employees the option to talk to a service desk analyst when it can't resolve their requests. Build a hand-off bridge by using the Microsoft 365 Agents SDK and connect a sub-agent to open a live chat with a service desk analyst in the same Teams conversation. The agent passes a conversation summary through the bridge to give the analyst context. Messages are translated in both directions so the employee and analyst can each use their preferred language.

1. **Monitor and improve**: Copilot Studio analytics, automated evaluations, Copilot Agent Kit ([Agent Debugger](/microsoft-copilot-studio/guidance/kit-agent-debugger) and [Agent Review Tool](/microsoft-copilot-studio/guidance/kit-agent-review-tool)), and Azure Application Insights capture answer quality, resolution, hand-off, and error signals. Use these signals to fix content gaps, tune topics, and extend automation.

## Components

| Component | Role in this architecture |
|----|----|
| [Copilot Studio](/microsoft-copilot-studio/) | Hosts the IT self-help agent. Provides language detection, knowledge search, Adaptive Cards, and evaluations. |
| [Microsoft Teams](/microsoftteams/teams-overview) | The channel employees use to reach the agent and, for hand-off, to chat with a service desk analyst in the same conversation. |
| [Microsoft Entra ID](/entra/identity/) | Authenticates employees and supplies the identity that the agent passes to downstream systems. |
| [Power Platform connectors](/connectors/connector-reference/connector-reference-powerapps-connectors) | Connect agent topics to the ITSM platform to search the catalog and create, list, and update incidents. |
| [Microsoft SharePoint](/sharepoint/) | Stores IT guides and procedures that the agent uses as knowledge sources. |
| [Microsoft 365 Agents SDK](/microsoft-365/agents-sdk/agents-sdk-overview) | Enables the hand-off bridge that connects the agent, as a connected agent, to the ITSM platform's live chat queue. |
| [Agent Debugger in Copilot Agent Kit](/microsoft-copilot-studio/guidance/kit-agent-debugger) | Provides analysis, monitoring, and debugging capabilities. Tracks agent quality over time. |
| [Azure Application Insights](/azure/azure-monitor/app/app-insights-overview) | Captures conversation telemetry, errors, and custom events for monitoring and troubleshooting. |
| [Power Platform environments and data policies](../../admin/environments-overview.md) | Separate development, test, and production, and restrict the agent to approved connectors. |

Other technologies involved include:

- **IT service management platform**: A third-party ITSM platform, such as ServiceNow, is the system of record for knowledge articles, the service catalog, incidents, and live agent chat. The agent reads from and writes to the platform, which enforces its own access rules on every request.

- **Third-party identity provider**: In the scenario from which this reference architecture originates, the ITSM platform trusts a separate identity provider rather than Microsoft Entra ID. The connection design in this architecture preserves the employee's identity across identity providers.

## Scenario details

This scenario is based on an organization's move to a self-service-first IT support model, with an agent as the main entry point for IT help.

> [!NOTE]
> For examples of similar employee-facing architectures, learn how the Copilot Studio agent [MAIA supports Banco Hipotecario's employees](https://www.microsoft.com/en/customers/story/26969-banco-hipotecario-github-copilot) and how Microsoft [accelerates employee services with the Employee Self-Service Agent](https://www.microsoft.com/insidetrack/blog/accelerating-employee-services-at-microsoft-with-the-employee-self-service-agent/).

### Business challenge

A large, multinational manufacturer supports tens of thousands of employees across several countries and regions. Employees reach IT support through a mix of portals, phone lines, and an outsourced live-chat desk. Many support requests involve repeated questions or simple tasks, such as finding a procedure, ordering a standard device, or checking a ticket's status. Each request takes service desk time. Employees must find the right portal for answers and often work in a language other than their own. They also have to reenter details when requests move between channels. Any new support channel must enforce existing ITSM access permissions, even though the ITSM platform and collaboration tools use different identity providers.

### Solution

Build an IT self-help agent in Copilot Studio and publish it in Microsoft Teams as the default entry point for IT support. The agent:

- Answers IT questions in the employee's language from approved IT guides and ITSM knowledge articles, with short summaries and clarifying questions.

- Searches the service catalog and links directly to the right order form.

- Creates incidents with categories specific to the employee's country or region and a prefilled description.

- Lets employees track and update only their own tickets.

- Connects to the ITSM platform through a governed connection that maintains the employee's identity in every request.

- Designed to hand off to a live service desk analyst in the same chat, with a conversation summary and two-way translation.

Roll out the agent in waves, from a selected group of users to the full workforce, while monitoring answer quality and support volume at each step.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

Treat the ITSM platform as a dependency the agent doesn't control. Handle connector timeouts and errors in every topic. Give employees a clear next step, such as a link to the ITSM portal. Roll out the agent in phases so you can monitor connector load and ITSM throttling before adding the next group of users.

### Security

Include the employee's identity in every request to the ITSM platform. If you use a service account and sign-in across identity providers isn't available, take these steps:

- Grant the account only the permissions the agent's topics need.
- Store its secret securely.
- Pass the employee's identity in each query.
- Get approval from your security team.

Plan to move to per-user connections when you can share connection parameters with users. This approach lets employees sign in to the ITSM platform through an inline card without leaving the chat. Check ticket ownership before showing or updating a ticket.

### Operational Excellence

Move the agent through development, test, and production environments with solutions and application lifecycle management. Assign owners to maintain IT knowledge articles in each supported language. Answer quality depends on keeping this content current and well structured. Evaluate against a fixed set of test questions in every supported language before each release. Use Copilot Agent Kit for continuous analysis, debugging and monitoring.

### Performance Efficiency

Keep knowledge answers short and present catalog results as a compact list to help employees complete tasks in fewer turns. When possible, limit knowledge searches to content in the employee's language to improve relevance. Plan connector capacity for peak demand, such as the first day of a rollout phase or a major outage.

### Experience Optimization

Use Adaptive Cards to let employees select options, such as incident categories or tickets, reducing typing and input errors. Prefill incident descriptions with details from the conversation to reduce repeated questions. When the agent hands off to a service desk analyst, share a conversation summary to help the analyst continue where the agent left off. Keep the employee in the same Teams chat.

## Responsible AI

Ground answers in approved IT content and include source links so employees can verify the answers. Test answer quality and tone in every supported language. Confirm that translated messages preserve their meaning during hand-offs. Give employees a clear way to reach a service desk analyst. Use analytics and feedback to identify incorrect answers and questions the agent can't answer, then address those gaps.

## Contributors

*Microsoft maintains this article. The following contributors wrote this article.*

Principal authors:

[**Petros Feleskouras**](https://www.linkedin.com/in/petros-feleskouras-111644138), Senior Program Manager

## Related resources

### Copilot Studio

- [Establish an application lifecycle management strategy for Copilot Studio](/microsoft-copilot-studio/guidance/alm)
- [Orchestrate agent behavior with generative AI](/microsoft-copilot-studio/advanced-generative-actions)
- [Configure user authentication with Microsoft Entra ID](/microsoft-copilot-studio/configuration-authentication-azure-ad)
- [Monitor agent performance in Copilot Studio](/microsoft-copilot-studio/analytics-overview)

### Copilot Agent Kit

- [Copilot Agent Kit overview](/microsoft-copilot-studio/guidance/kit-overview)
- [Analyze agents using Agent Review Tool in Copilot Agent Kit](/microsoft-copilot-studio/guidance/kit-agent-review-tool)
- [Troubleshoot agent conversations with Agent Debugger in Copilot Agent Kit](/microsoft-copilot-studio/guidance/kit-agent-debugger)

### Integrations

- [ServiceNow connector reference](/connectors/service-now/)
- [Microsoft 365 Agents SDK](/microsoft-365/agents-sdk)

### Agent patterns

- [Workplace and IT services pattern](/agents/adoption-patterns/pattern-workplace-it-services)
