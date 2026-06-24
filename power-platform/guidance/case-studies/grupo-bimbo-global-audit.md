---
title: Grupo Bimbo standardizes global audit processes with Copilot Studio
description: Learn how Grupo Bimbo used Microsoft Copilot Studio to build the Comatrix and Audit Assist agents, helping standardize audit planning and execution across a global internal audit team.
#customer intent: As a Power Platform user, I want to learn how Grupo Bimbo used Copilot Studio to build agents grounded in enterprise content, so that I can standardize processes and improve consistency in my organization.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.topic: overview
ms.date: 06/23/2026
ai-usage: ai-assisted
---

# Grupo Bimbo standardizes global audit processes with Copilot Studio

[Grupo Bimbo](https://www.grupobimbo.com/), headquartered in Mexico, is one of the world's largest baking companies. It operates across multiple regions with complex, highly regulated business processes. Its global internal audit team oversees risks, controls, and compliance across operations, IT, finance, and commercial areas.

The internal audit team includes more than 100 auditors working across multiple countries/regions, supported by regional and functional leaders. Audits typically span several weeks and require consistent planning, execution, and reporting. However, auditors rely on manual processes, which makes it difficult to work consistently across regions.

To address these challenges, Grupo Bimbo built two AI-powered agents using Microsoft Copilot Studio. This case study shows how Grupo Bimbo uses the Comatrix and Audit Assist agents to standardize audit workflows, help auditors work more efficiently, and scale expertise across a global audit team.

## Business challenges

Grupo Bimbo's auditors relied heavily on manual searches in SharePoint to find audit methodologies, templates, and procedural guidance. Although documentation was centralized, locating the correct and most up-to-date information often took significant time and effort. Auditors also found it difficult to confirm whether they were using the latest approved templates and procedures, which led to rework when outdated formats were discovered late in the audit process.

When questions came up, auditors depended on a small quality assurance team for clarification on methodology and standards. Because this team supported a global organization across multiple time zones, responses weren't always immediate, which caused delays and disrupted audit workflows. At the same time, key planning activities such as creating risk and control matrices were done manually and could take up to two days per audit.

At a global scale, these challenges became harder to manage. Differences in how audit guidance was interpreted and applied across regions led to inconsistent outcomes and increased compliance risk. As audit activity grew, manual processes reduced efficiency and made it more difficult to maintain consistent audit quality across teams.

## Solution

To address these challenges, Grupo Bimbo built two AI agents, Audit Assist and Comatrix, using Copilot Studio. The agents use approved audit content stored in SharePoint to provide guidance directly within auditors' existing workflows. Comatrix supports audit planning, while Audit Assist helps auditors follow procedures, reporting requirements, and standard communications defined by the quality assurance team. This approach helps standardize audit practices across regions.

Key benefits:

- The planning-phase audit completion time decreased by approximately 20 percent.

- Risk and control matrix preparation was reduced from about two days to less than half a day.

- Early feedback shows improved auditor experience, with users reporting greater confidence, less frustration, and more time for analytical work.

- Adoption continues to grow. As of early 2026, an estimated 50 to 60 percent of auditors actively use the agents, supported by workshops, internal communication, and champion programs.

By handling routine questions, the agents reduce the dependency on the quality assurance team, allowing that team to focus on improving audit methodologies and supporting complex scenarios. Auditors continue to review and refine outputs, but the agents reduce the initial effort required to prepare planning artifacts.

> If an auditor has a question outside business hours, they don't have to wait until the next day anymore. They can ask Audit Assist and get the answer right away.
>
> — *Eduardo Arenas, Data Analyst, Grupo Bimbo*

## Architecture

The architecture combines Copilot Studio, Microsoft 365 Copilot, and Microsoft Teams to make audit guidance available within auditors' daily workflows. The quality assurance team maintains audit knowledge in SharePoint.

:::image type="content" source="media/grupo-bimbo-global-audit/architecture.png" alt-text="Diagram showing auditors using Microsoft 365 Copilot and Microsoft Teams connected to Microsoft Copilot Studio and SharePoint audit knowledge." lightbox="media/grupo-bimbo-global-audit/architecture.png":::

Core components include:

- **Microsoft Copilot Studio** to design, configure, and publish both agents.

- **Microsoft 365 Copilot** as the conversational interface.

- **Microsoft Teams** as an access channel for auditors.

- **Microsoft SharePoint** as the source of audit methodology, standards, procedures, and templates.

> What mattered most to us was how easy it was to connect our agents directly to our SharePoint documentation using Copilot Studio. Every time our quality team updates a procedure or template, the agent automatically uses the latest version. We don't have to maintain a separate knowledge base anymore.
>
> — *Mauricio Imenez, Director of Data Analytics and AI, Global Internal Audit, Grupo Bimbo*

## Key features

These two agents support different stages of the audit process, with Comatrix focused on planning and Audit Assist focused on execution and reporting.

### Comatrix agent

Auditors use Comatrix during audit planning to generate an initial risk and control matrix based on approved global procedures. This process provides a structured starting point, instead of building matrices manually from scratch. Auditors then review and refine the output to align it with the scope of each audit.

The following image shows how Comatrix supports audit planning within Microsoft Teams. This example uses sample data to illustrate the interaction.

:::image type="content" source="media/grupo-bimbo-global-audit/comatrix-agent.png" alt-text="Screenshot of the Comatrix agent in Microsoft Teams displaying a generated Risk Matrix with sample rows to illustrate audit planning." lightbox="media/grupo-bimbo-global-audit/comatrix-agent.png":::

### Audit Assist agent

Audit Assist supports auditors during audit execution and reporting. It answers natural language questions about audit methodology, retrieves approved report templates, and helps structure audit findings based on reporting standards.

It provides consistent guidance on audit processes, required notifications, reporting formats, and standard templates. It also clarifies details such as audience, format, notice periods, and required content, helping auditors track progress and document completed actions.

The following image shows how Audit Assist provides standardized audit communication templates within Microsoft 365 Copilot. This example uses sample content for illustration.

:::image type="content" source="media/grupo-bimbo-global-audit/audit-assist-agent.png" alt-text="Screenshot of the Audit Assist agent in Microsoft 365 Copilot displaying a standardized audit start email template with placeholders for scope and dates." lightbox="media/grupo-bimbo-global-audit/audit-assist-agent.png":::

This image shows how Audit Assist helps auditors retrieve approved reporting guidance:

:::image type="content" source="media/grupo-bimbo-global-audit/audit-assist-agent-prompt.png" alt-text="Screenshot of Audit Assist in Microsoft 365 Copilot displaying audit reporting guidelines and responsibilities." lightbox="media/grupo-bimbo-global-audit/audit-assist-agent-prompt.png":::

## Implementation approach

The solution originated from an internal hackathon, where auditors from different regions identified common pain points and proposed ways to improve audit efficiency and consistency. Several of these auditors later became key users during development and testing. Their continued involvement helped ensure the solution reflected real audit scenarios, built early trust, and stayed aligned with day-to-day audit practices.

The team chose Copilot Studio to build the agents because it connects natively to SharePoint, where approved audit guidance, procedures, and standards were already maintained. This approach made it possible to reuse existing content without duplicating or reauthoring documentation.

To support reliable and compliant outputs, SharePoint content was structured to clearly separate procedures, templates, and standards. The team also selected a deterministic orchestration approach for Audit Assist to meet strict global audit quality requirements. The team invested significant effort in designing system prompts to control agent behavior, enforce approved formats, and ensure responses are grounded in authoritative sources.

### System prompt design

The team iterated extensively on the system prompts to ensure responses were accurate, consistent, and aligned with audit standards. Rather than relying on general responses, the prompts were designed to control how information is retrieved, structured, and presented, while ensuring that answers are based only on approved sources.

For Audit Assist, the prompt defines how the agent responds to user questions, including how information is structured and how guidance is explained. The prompt definitions help ensure responses are clear, consistent, and easy for auditors to apply across different scenarios.

Comatrix uses a structured prompt tailored specifically to generating risk and control matrices. It defines when a matrix should be generated and how risks and controls are organized, ensuring outputs follow a consistent format and remain grounded in approved procedures.

Designing and refining these prompts was one of the most complex parts of the implementation and required multiple iterations. Prompt design, knowledge structure, and Copilot Studio configuration evolved together as the team tested responses against real audit scenarios.
  
## Takeaways

This case study shows how Copilot Studio can help you conduct consistent audits across multiple regions. Key takeaways for IT professionals who want to implement similar solutions include:

- Use approved enterprise content as the foundation for your agents. This approach helps build trust, especially in compliance-focused environments.

- Start with tasks that are time-consuming or repetitive, where clear guidance can quickly reduce manual effort.

- Spend time early on prompt design. Clear constraints and formatting rules make a significant difference in the quality and reliability of responses.

- Choose your orchestration approach based on compliance needs, not just user experience. In this case, a deterministic approach was key for maintaining consistency.

- Involve real users early and integrate the solution into daily tools like Microsoft Teams and Microsoft 365 Copilot to encourage adoption and ongoing improvement.

## Looking ahead

The team plans to build more agents in Copilot Studio to support other centers of excellence, particularly in areas such as control testing and data extraction. Future enhancements to the existing agents might include expanding knowledge sources beyond global procedures, incorporating other internal and external guidance, and working with analytics to better understand usage patterns and common questions.

Grupo Bimbo sees Audit Assist and Comatrix as part of a broader approach to using AI in internal audits, with more scenarios expected over time. This approach also provides a scalable model for extending AI support to new audit scenarios as needs evolve.

> We've taken significant steps toward incorporating artificial intelligence into audit activities. While this journey came with many lessons learned, the progress made this year is a foundation for the future of Internal Audit.
>
> — *Mauricio Imenez, Director of Data Analytics and AI, Global Internal Audit, Grupo Bimbo*

## Related information

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Write agent instructions](/microsoft-copilot-studio/authoring-instructions)
- [Add SharePoint as a knowledge source](/microsoft-copilot-studio/knowledge-add-sharepoint)
