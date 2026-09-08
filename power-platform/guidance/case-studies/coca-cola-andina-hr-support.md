---
title: Coca-Cola Andina improves HR support for frontline workers with Copilot Studio
description: Learn how Coca-Cola Andina uses Microsoft Copilot Studio to give employees faster answers while reducing the need for manual HR support.
#customer intent: As a Power Platform user, I want to learn how Coca-Cola Andina used Copilot Studio to create an HR assistant so that I can build a similar agent for my organization.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.date: 09/08/2026
ms.topic: overview
---

# Coca-Cola Andina improves HR support for frontline workers with Copilot Studio

[Coca-Cola Andina](https://www.koandina.com/en/home/) is one of the largest Coca-Cola bottlers in Latin America, with operations in Argentina, Chile, Brazil, and Paraguay. With thousands of employees across offices and bottling facilities, Coca-Cola Andina needed a scalable way to provide clear and timely answers to HR questions.

As the business expanded, HR teams faced a growing volume of routine questions, while many employees, especially those working in plants, struggled to find the information they needed. In Argentina, the company addressed this challenge with an AI-powered HR assistant called Andi. The solution is now used by 1,200 employees monthly, helping workers get answers faster while reducing the need for manual HR support.

This case study shows how Coca-Cola Andina improved HR support for employees using Microsoft Copilot Studio.

Read the full story: [Coca-Cola Andina modernizes HR operations with AI-powered agent on Microsoft Copilot Studio](https://www.microsoft.com/en/customers/story/26256-coca-cola-andina-microsoft-copilot-studio)

## Business challenges

Coca-Cola Andina needed to improve how it communicated with a highly distributed workforce. While office employees had easy access to corporate tools like Microsoft Teams, most employees work in factories and bottling plants. These employees typically rely on mobile phones rather than laptops, which made it difficult to reach them through traditional channels.

Earlier HR initiatives had introduced new apps and communication tools, but adoption remained low. The company found that employees were being asked to use tools that didn't fit into their daily routines. In Argentina, WhatsApp is the default communication channel, something nearly every employee already uses.

> The business need was clear—we had to communicate with our workers through WhatsApp. Otherwise, adoption just wasn't going to happen.
>
> — *Tomas Colla, IT Senior Solution Developer, Coca-Cola Andina*

At the same time, HR teams were handling a constant stream of repetitive questions. The complexity of HR policies added to the challenge. Answers often depend on factors such as location, contract type, tenure, and role.

Coca-Cola Andina needed a solution that could:

- Reach employees through familiar channels
- Reduce repetitive HR workload
- Provide answers tailored to each individual

## Solution

Coca-Cola Andina built Andi, an AI-powered HR assistant, by using Copilot Studio. The company designed the solution to meet employees where they already work, by making WhatsApp the primary channel.

Andi provides tailored responses by using employee data such as location and role to retrieve relevant HR content. This approach enables answers that reflect each employee's specific situation, such as available vacation days or benefits.

If the agent can't resolve a request, employees can escalate it directly. The agent combines their question with their profile data to create a ticket, which HR managers can handle through a Power Apps application.

## Key benefits

Coca-Cola Andina measures adoption, engagement, and employee satisfaction to evaluate success. One key metric is the number of questions employees ask outside HR working hours. These cases previously required employees to wait until the next day. A significant share of interactions now occurs during these periods, showing clear value for employees.

Business benefits include:

- **Reduced HR workload**: The agent automatically handles routine inquiries, freeing HR teams to focus on more complex cases.

- **Faster access to information**: Employees receive immediate, context-aware answers.

Key metrics include:

- **High adoption**: 1,200 employees out of approximately 3,600 active employees in Argentina use Andi each month.

- **Strong engagement**: Users have conducted nearly 5,000 conversations with Andi, with an average conversation length of 6 minutes and 33 seconds.

- **Employee satisfaction**: Andi achieved a customer satisfaction (CSAT) score of 4.1 out of 5, based on 976 employee surveys.

> With our agent, Andi, we are spending a lot less time answering basic, routine questions and that gives us more time to address more complex HR issues for our employees.
>
> — *Rocio Duarte, Product Manager of HR, Coca-Cola Andina*

## Architecture

The solution includes several Microsoft technologies alongside external integrations.

:::image type="content" source="media/coca-cola-andina-hr-support/architecture.png" alt-text="Diagram of the Andi HR agent architecture: employee uses WhatsApp, Entra ID authenticates, Copilot Studio answers using data from SharePoint, indexed in Dataverse." lightbox="media/coca-cola-andina-hr-support/architecture.png":::

Core components:

- **Copilot Studio** for orchestration and conversational experience
- **Microsoft Entra ID** for authentication and identity data
- **SharePoint** for HR content management
- **Microsoft Dataverse** for knowledge indexing
- **Power Automate** for HR ticket creation and notifications
- **Power Apps** for HR case management
- **Direct Line API** and the **Meta WhatsApp Business API** for WhatsApp integration

The workflow is as follows:

1. The employee starts a conversation in WhatsApp

1. The user signs in via a secure authentication flow

1. The system retrieves user profile data from Entra ID

1. The system retrieves additional attributes from SharePoint, which are synchronized from SAP

1. Copilot Studio retrieves relevant knowledge and generates a response

1. If needed, a Power Automate flow creates a ticket

1. HR managers handle the case in Power Apps

> We especially like how documents can be uploaded to Copilot Studio and the system takes it from there—no vector database or embeddings required on our part. It just works.
>
> — *Tomas Colla, IT Senior Solution Developer, Coca-Cola Andina*

## Implementation approach

The project started as an HR initiative and then became a joint effort between HR, IT, and the regional AI team. An IT manager noticed an internal prototype and recognized the opportunity to solve HR's communication challenges.

> An IT manager saw our demo and connected the dots—HR had the problem, and the AI team had the solution. That's when the project really started.
>
> — *Tomas Colla, IT Senior Solution Developer, Coca-Cola Andina*

Coca-Cola Andina formed a team to bring the solution to life. The team included developers from both the regional organization and the local team in Argentina. They worked closely with HR specialists.

### Building on Copilot Studio

The team adopted Copilot Studio and made rapid progress, supported by their Power Platform experience. Making the solution available in WhatsApp was essential for adoption. However, native support in Copilot Studio wasn't available when the project started. The main challenge wasn't building the agent itself, but making it accessible through WhatsApp.

> We had everything working—except WhatsApp. That was actually the main reason we chose Copilot Studio in the first place.
>
> — *Tomas Colla, IT Senior Solution Developer, Coca-Cola Andina*

Because native WhatsApp support wasn't available when the project began, the team created a custom integration by using the Direct Line API and the Meta WhatsApp Business API. This approach continues to work well.

> We used the Direct Line API together with the Meta API to connect the agent to WhatsApp. That allowed us to deploy it even before the native channel was available.
>
> — *José Miranda Valderrama, IT Solution Developer, Coca-Cola Andina*

The following image shows Andi helping employees navigate HR topics and find answers to common workplace questions.

:::image type="content" source="media/coca-cola-andina-hr-support/andi-agent-navigate.png" alt-text="Screenshot of the Andi WhatsApp chat showing a list of general questions employees can ask.":::

The following image shows Andi providing workplace-related information.

:::image type="content" source="media/coca-cola-andina-hr-support/andi-agent-workplace.png" alt-text="Screenshot of the Andi WhatsApp chat showing menu options and a list of cafeteria consumption details by month.":::

The following image shows Andi providing guidance on HR policies and employee benefits.

:::image type="content" source="media/coca-cola-andina-hr-support/andi-agent-policies.png" alt-text="Screenshot of the Andi WhatsApp chat showing an employee question about family leave and a detailed personalized policy reply.":::

### Delivering personalized answers

Another important part of the implementation was tailoring responses to each employee.

When an employee signs in, Microsoft Entra ID handles authentication through a custom Azure application. This application generates a token that allows the system to identify the user and retrieve basic profile information such as name, employee ID, and city.

The solution then enriches this data in a second step. A Power Automate flow queries a SharePoint list, synchronized daily from SAP, to retrieve more attributes such as:

- Region
- Contract type (office or factory)
- Tenure

By using these attributes, Andi can adapt answers dynamically. For example, vacation days or benefits differ depending on years of service and employee category.

### Managing knowledge and content

The team initially planned to link the agent to a SharePoint site and use the site as a live knowledge source. However, they found that uploading files and using Dataverse for indexing worked best in their case. They found that content quality and structure significantly affected response accuracy.

To improve consistency, they introduced a governance model where designated HR representatives manage and centralize content updates. The team also helped HR representatives structure content so the agent could use it effectively.

- A designated HR representative in each region manages content
- Content updates are centralized through these owners
- The technical team uploads and updates knowledge in Copilot Studio

This approach ensured higher quality and control without requiring every HR contributor to understand technical constraints.

> Content structure mattered more than we expected. We had to work closely with HR to make sure information was written in a way the agent could actually use it.
>
> — *Tomas Colla, IT Senior Solution Developer, Coca-Cola Andina*

### Refining prompts and behavior

The team worked closely with HR specialists to ensure responses aligned with company policies and HR communication style. Prompt design required continuous iteration and became one of the most time-intensive parts of the project.

A few weeks before the launch, the team encountered an unexpected issue. The agent started making jokes in situations where it wasn't appropriate, such as when responding to questions about sick leave or doctor's appointments. After investigating, they discovered that a configuration setting that affected the agent's tone caused the behavior. When they updated the setting, the responses became more consistent with HR expectations.

Through this process, the team learned to separate concerns clearly:

- Define general tone and personality in the global configuration
- Handle specific instructions, such as including links in answers, at the topic level

HR teams reviewed responses, shared feedback, and helped refine the agent over time.

> We separate the personality from the specific instructions. The tone goes in the general configuration, and the detailed behavior goes in the topic-level prompts.
>
> — *Tomas Colla, IT Senior Solution Developer, Coca-Cola Andina*

### Managing HR tickets in Power Apps

Power Automate handles the escalation and creates a ticket stored in a SharePoint list. HR managers manage and track requests through a Power Apps canvas app that existed before Andi was built.

The following images show the canvas app. (*The data shown in these images is fictional and provided for illustration only. The images don't include real user or personal data.*)

This image shows the list of HR tickets in the Power Apps canvas app.

:::image type="content" source="media/coca-cola-andina-hr-support/canvas-app-tickets.png" alt-text="Screenshot of the Power Apps canvas app showing an HR ticket list." lightbox="media/coca-cola-andina-hr-support/canvas-app-tickets.png":::

This image shows the details of a specific HR ticket with ticket metadata and editable fields.

:::image type="content" source="media/coca-cola-andina-hr-support/canvas-app-ticket-details.png" alt-text="Screenshot of the fictive ticket 6987 in the Power Apps canvas app with ticket details." lightbox="media/coca-cola-andina-hr-support/canvas-app-ticket-details.png":::

The team identified several best practices as they built the solution. They learned how to write effective prompts and how to configure the agent. They also learned to keep topics small and use separate environments and pipelines in Power Platform. If they were starting again, they would consider splitting functionality across multiple agents instead of relying on a single agent.

The team now monitors adoption patterns, including how many users return after initial sign-in issues. Early data showed that awareness and credential access were barriers. The team led internal communication campaigns to promote usage, including banners around the company reminding employees to use Andi.

## Takeaways

Coca-Cola Andina identified several practical lessons that can help other organizations:

- **Design for real user behavior**: Meet employees in the tools they already use to encourage adoption. In this case, WhatsApp made the difference.

- **Keep topics small and modular**: Use smaller, focused topics to improve manageability and clarity. Large topics are difficult to maintain.

- **Separate global and local prompt logic**: Use global settings for tone and topic-level prompts for specific behaviors.

- **Invest in content governance**: Assign clear ownership of knowledge content to ensure consistency and quality.

- **Expect iteration**: Treat prompt tuning and testing as ongoing processes rather than one-time setup tasks.

- **Think about access and sign-in early on**: Address sign-in issues and missing credentials through communication and onboarding to encourage early adoption.

- **Set up environments early**: Use development, test, and production environments, and pipelines in Power Platform to move changes between them more easily.

## Looking ahead

Coca-Cola Andina plans to expand Andi to additional countries and regions and to continue improving the experience.

Future developments include:

- Expanding to Microsoft Teams for office-based employees
- Exploring multi-agent scenarios to support additional business areas
- Integrating document processing capabilities for handling images such as invoices or receipts

The company also plans to expand its governance so that business users can build and manage their own agents within defined security boundaries.

## Related information

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Publish agents to channels and clients](/microsoft-copilot-studio/guidance/channels)
- [Publish an agent to WhatsApp](/microsoft-copilot-studio/publication-add-bot-to-whatsapp)
- [Write agent instructions](/microsoft-copilot-studio/authoring-instructions)
- [Pipelines in Power Platform](../../alm/pipelines.md)
