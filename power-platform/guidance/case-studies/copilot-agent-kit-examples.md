---
title: Copilot Agent Kit real-world examples
description: Learn how organizations use Copilot Agent Kit to improve visibility, monitor performance, and refine their agents.
#customer intent: As a Power Platform user, I want to learn how organizations use Copilot Agent Kit to improve visibility, monitor performance, and refine their agents so that I can apply similar practices in my own organization.
author: carcla
ms.author: v-caclaesson
ms.reviewer: edoyle
ms.subservice: case-study
ms.date: 06/29/2026
ms.topic: overview
---

# Copilot Agent Kit real-world examples

[Copilot Agent Kit](/microsoft-copilot-studio/guidance/kit-overview) (formerly known as *Copilot Studio Kit*) extends [Microsoft Copilot Studio](https://aka.ms/CopilotStudio) with capabilities for productivity, governance, testing, and analytics. It helps organizations scale agents while maintaining control and consistency. [Copilot Studio](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio), [Power Platform admin center](/power-platform/admin/admin-documentation), and [Microsoft Agent 365](/microsoft-agent-365/) already cover many core needs, and Microsoft keeps adding new capabilities. As organizations expand their use of agents, however, new governance, monitoring, and operational challenges arise.

Copilot Agent Kit was created to respond to these real-world needs. It often introduces practical capabilities early, based on what teams experience in production. This case study shows how organizations use the kit to improve visibility, monitor performance, and refine their agents.

## Adoption brings new challenges

As organizations expand their use of Copilot Studio across teams and business scenarios, they move from individual use cases to broader, organization-wide adoption. This transition brings new operational challenges:

- The number of agents grows quickly, which can lead to duplicated logic, inconsistent naming, and unclear ownership. Over time, these issues make solutions harder to maintain and can result in inconsistent behavior.

- Different teams often build agents independently, without shared guidance or oversight. This approach increases the risk of security and compliance problems.

- It becomes harder to get a clear view of how agents are performing, with no single place to track usage, quality, or trends.

- Prompt quality and design vary between agents, leading to uneven user experiences.

Copilot Studio provides the core capabilities for building agents. Copilot Agent Kit builds on this foundation by providing additional governance, monitoring, and productivity capabilities.

## What the kit enables

Copilot Agent Kit helps makers build more effectively while giving administrators stronger governance and control. It evolves based on customer needs, adding new capabilities and retiring tools as similar functionality becomes available in Copilot Studio.

The kit includes tools that support governance and administration, analytics and insights, and productivity and customization.

### Governance and administration

These tools help organizations maintain control, enforce standards, and gain visibility across their agents.

- **Agent Inventory** for tenant-wide, feature-level visibility of agents
- **Agent Debugger** for debugging routing, variable states, and actions
- **Agent Value Summary** for classifying agents by type and business value
- **Agent Review Tool** for validating agents against best practices
- **Agent Compliance Hub** for defining and enforcing agent compliance
- **Power Shield** for approval-based workflows for Data Loss Prevention (DLP) policies

### Analytics and insights

These tools provide visibility into usage, performance, and conversation quality.

- **Agent Insights Hub** for monitoring performance and trends
- **Conversation Analyzer** for exploring transcripts using natural language prompts
- **Conversation KPIs** for long-term performance monitoring

### Productivity and customization

These tools support makers during agent creation and customization.

- **Adaptive Cards Gallery** for reusable templates and preapproved adaptive cards
- **Agent Library** for reusable building blocks
- **Prompt Advisor** for creating structured and effective prompts
- **Rubric Refinement** for improving evaluation via automated AI rubric refinement
- **SharePoint synchronization** for automatic sync from SharePoint to agents
- **Test automation** for testing at scale and end-to-end validation
- **Webchat Playground** for customizing web chat appearance and behavior

:::image type="content" source="media/copilot-agent-kit-examples/copilot-agent-kit-overview.png" alt-text="Screenshot of Copilot Agent Kit homepage showing Admin, Govern, and Make sections with apps and agents." lightbox="media/copilot-agent-kit-examples/copilot-agent-kit-overview.png":::

## Real-world examples

Organizations across industries and regions use Copilot Agent Kit. It supports different stages of adoption, from gaining visibility into agents across environments to analyzing transcripts and improving answer quality.

### City of Montréal: Improving answer quality with transcript analysis

The City of Montréal serves 1.7 million residents and uses a conversational agent on its website to make information easier to access across more than 40,000 pages of content.

As the agent evolved, the team needed better insight into how it performed across a large and distributed knowledge base. It was difficult to understand how information was used in conversations, to identify accuracy issues, and to review large volumes of transcripts. Existing tools also made it hard to share access across teams, limiting visibility into conversation patterns and customer satisfaction (CSAT) trends.

By using Conversation KPIs in Copilot Agent Kit, the team can now:

- Identify where conversations go off track or fall back to generative answers.

- Detect missing or poorly structured content.

- Find common citizen questions and themes.

- Improve Copilot Studio topic design and trigger phrases.

- Deliver more consistent experiences and improved CSAT.

By filtering transcripts with low CSAT scores, the team focuses on conversations that didn't meet expectations. They review contributing factors, such as missing content or misrouted Copilot Studio topics, and use these insights to refine both website content and agent design.

> [Copilot Agent Kit] gives us the ability to analyze transcripts in ways we couldn't before. It complements our existing governance tools by providing the insights we need to refine content and ensure our agent delivers accurate, citizen-focused answers.
>
> — *Mohamed Arhab, Solution Architect, IT Department of the City of Montréal*

> [!NOTE]
> The City of Montréal used these insights to refine its website content and agent design. Improvements included optimizing content structure, improving indexation, standardizing content practices across web teams, and refining custom topics based on real-world language used by citizens. Learn more in [The City of Montréal enhances citizen engagement with Copilot Studio](/power-platform/guidance/case-studies/city-montreal-citizen-engagement).

### Other customer experiences

Organizations use Copilot Agent Kit to address different challenges, from governance and visibility to customization and deployment.

For example, Nationwide uses the kit to maintain visibility and control as their agent landscape grows:

> As our use of Copilot Studio expanded, Agent Inventory in the [Copilot Agent Kit] helped us maintain visibility and control. It gives us a clear way to see what agents exist across environments and manage them consistently.
>
> — *Tobianna Milanovich, Director Intelligent Automation Center of Excellence, Nationwide*

Other teams focus on improving the development and deployment experience. At Business France, the Webchat Playground helped simplify customization and speed up delivery:

> The Webchat Playground in [Copilot Agent Kit] enabled us to go from concept to production. It made it easier to customize the look and feel of our website agent while reducing the effort needed to embed it.
>
> — *Alexandru Iftene, Team Lead Innovation, Business France*

## Architecture

Copilot Agent Kit is built on Power Platform components, including Power Apps, Dataverse, Power Automate, and standard connectors. Dataverse acts as the central data layer, storing agent metadata, configuration, and analytics data.

The following diagram shows three scenarios supported by the kit:

1. Monitoring and governing agents
1. Turning analytics into improvements
1. Simplifying web chat configuration

Across these scenarios, the kit builds on data from Copilot Studio and Power Platform to provide more visibility, insights, and tools for makers and administrators.

:::image type="content" source="media/copilot-agent-kit-examples/architecture.png" alt-text="Diagram of Copilot Agent Kit real-world examples: monitoring agents, turning analytics into improvements, and simplifying web chat configuration." lightbox="media/copilot-agent-kit-examples/architecture.png":::

## Takeaways

This case study shows how organizations use Copilot Agent Kit to improve visibility, performance, and overall agent quality, while also working more efficiently.

- Teams use tools like Webchat Playground to simplify how they configure and deploy agents on their websites.

- The kit provides a central place to track agents across environments.

- Analytics insights help teams refine agent instructions, conversation design, and knowledge sources over time.

- As the number of agents and teams grows, the kit helps organizations stay organized and maintain consistency across environments.

## Looking ahead

Copilot Agent Kit continues to add new capabilities based on customer needs while adapting as Copilot Studio adds new functionality.

The Power CAT team introduced a new app in the March 2026 release. The [Agent Insights Hub](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit/blob/main/AGENT_INSIGHTS_HUB.md) and [Component Library](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit/blob/main/COMPONENT_LIBRARY.md) were the first tools built on Power Apps code apps. With the addition of [Compliance Hub](/microsoft-copilot-studio/guidance/kit-configure-compliance-hub) and [Power Shield](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit/blob/main/POWER_SHIELD.md), the kit also expanded into governance.

The roadmap continues to focus on closing gaps, improving usability, and aligning more closely with how organizations use agents in production. With the rebrand to Copilot Agent Kit, the toolkit is also expanding into new areas such as Microsoft 365 Copilot, Microsoft Agent 365, and Microsoft Foundry to support scenarios beyond Copilot Studio.

New releases are announced [on GitHub](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit/releases) where users can track updates and improvements. The Power CAT team also hosts [office hours](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit/blob/main/OFFICEHOURS.md) to demonstrate newly released features and provide a forum for questions and feedback.

## Related information

**Copilot Agent Kit**

- [Copilot Studio Kit overview](/microsoft-copilot-studio/guidance/kit-overview)
- [Copilot Studio Kit prerequisites](/microsoft-copilot-studio/guidance/kit-prerequisites)
- [Install Copilot Studio Kit](/microsoft-copilot-studio/guidance/kit-install)

**Copilot Studio**

- [Best practices](/microsoft-copilot-studio/advanced-generative-actions#best-practices)
- [Writing great instructions](/microsoft-copilot-studio/authoring-instructions#writing-great-instructions)
- [Configure high-quality instructions for generative orchestration](/microsoft-copilot-studio/guidance/generative-mode-guidance)
