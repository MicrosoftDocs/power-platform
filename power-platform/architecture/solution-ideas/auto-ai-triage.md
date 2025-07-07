---
title: Automate the bug reporting process in software development with Auto AI Triage
description: Discover how to use Copilot Studio and Power Platform to automate the bug reporting and updating processes in software development with Auto AI Triage
#customer intent: As a Power Platform user, I want to use automate the bug reporting and updating processes in software development
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 06/05/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Automate the bug reporting process in software development with Auto AI Triage

This article describes the Auto Triage AI Agent, which automates bug reporting and updating in software development. Two agents handle bug creation and follow-up, which improves user experience and operational speed.

For a demo and more information, go to [Auto AI Triage on GitHub](https://github.com/Shrusti13/TriageAutonomousAgent?tab=readme-ov-file).

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/auto-triage/auto-triage.jpg" alt-text="Architecture diagram of the Cardio Triage AI solution." border="true" lightbox="media/auto-triage/auto-triage.jpg":::

## Workflow

The workflow has two main sections: one for autonomous bug report creation and one for autonomous bug update and follow-up. Each section is handled by a dedicated agent.

### Agent 1: Autonomous bug report creation

- When an email detailing a product issue arrives, Agent 1 starts. The agent uses generative AI to analyze the email and extract key details, like the issue title. The agent uses the title to cross-reference product documentation—including specifications, business and technical process flows, installation manuals, error codes, and troubleshooting guides—to generate clear reproduction steps and system information. These details are essential for triage.
- The AI creates a bug in Azure DevOps and fills in fields like the issue description, repro steps, and system information.
- After creating the bug, the agent emails the user the tracking number and confirms that the bug is logged.

### Agent 2: Autonomous bug update and follow-up

- When a user replies with more information or asks for an update on their tracking ID, Agent 2 retrieves the bug details from Azure DevOps using the tracking ID.
- Generative AI analyzes the email and updates the bug report, so the information is always up to date.
- The agent sends a follow-up email to the user with the current bug status and confirms that the new information is added. This automation reduces human error, speeds up the process, and makes sure all bug reports are consistent, accurate, and detailed.

## Components

- **Microsoft Outlook (autonomous agent)**: Outlook lets you use autonomous agents from Copilot Studio, so agents can be triggered directly from your email workflow. Learn more in [Event trigger overview](/microsoft-copilot-studio/authoring-triggers-about).
- [**Copilot Studio agent**](/microsoft-copilot-studio/): An autonomous agent that analyses emails and creates bugs in Azure DevOps.
- [**Azure DevOps**](/azure/devops/user-guide/what-is-azure-devops): Azure DevOps supports the software development lifecycle and tracks bugs and features.
- **[Power Automate](/power-automate/):** Power Automate automates repetitive tasks and workflows. It connects services and apps to perform tasks automatically, saving time and reducing the chance of human error.
- **[AI Builder](/ai-builder/)**: AI Builder lets you add artificial intelligence to your apps without deep technical knowledge. It helps build features like predictive analytics or automated insights.
- **Knowledge**: Knowledge is the information and data sources that agents use to provide relevant and accurate responses.
  - Product specification
  - Business and technical process flows
  - Installation manuals
  - Error codes
  - Troubleshooting guides

## Scenario details

Managing and triaging product issues quickly is critical in today’s software development environments. As the number of bug reports grows, support teams can get overwhelmed by the repetitive and time-consuming task of logging and updating bugs. For example, a product support specialist might get hundreds of emails each day from users reporting product issues. For each email, the support specialist needs to create a bug report in Azure DevOps, pull relevant information from documentation, and send follow-up emails to users. This manual process is slow, error prone, and doesn't scale.
Auto Triage AI changes this process by automating it with generative AI. With two intelligent copilot agents working together, Auto Triage AI handles both the initial bug creation and follow-up updates, so you get faster resolution times and a better user experience without manual work.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- Automates triage of bug reports with no drop in performance, even at high volume.
- Uses cloud architecture for scalable and resilient operations.
- Uses redundancy, parallel processing, and automatic scaling on demand.

### Security

- Uses enterprise-grade authentication with Microsoft Entra ID for secure access.
- Uses secure connections and access controls to protect sensitive data.
- Keeps data in secure systems that follow Azure DevOps security standards.

### Operational Excellence

- Automation reduces manual work in bug triage.
- Delivers consistent quality and response time for bug reports.
- Monitors system health with integrated tools to keep high uptime.

### Performance Efficiency

- System scales automatically based on the number of bug reports.
- Uses Power Automate and AI Builder to optimize performance without manual scaling.
- Uses cloud resources efficiently to deliver a smooth experience.

### Experience Optimization

- Reduces manual tasks and speeds up issue resolution to improve user experience.
- Triages bugs quickly with AI-powered insights to improve the user experience.

### Responsible AI

- **Fairness:** AI models trained on diverse datasets deliver balanced bug classification.
- **Reliability and safety:** The architecture delivers reliable AI-powered decisions.
- **Privacy and security:** Data stays in secure environments to keep it confidential.
- **Transparency:** The AI decision-making process is traceable for transparency.
- **Accountability:** Clear access controls and auditing mechanisms keep the system accountable.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- [Shrushti Shah](https://www.linkedin.com/in/shrushti-shah-bba565162/), Senior Cloud Consultant
- [Bhushan Gawale](https://www.linkedin.com/in/bhushangawale/), Azure Architect

## Related resources

- [Microsoft Copilot Studio documentation](/microsoft-copilot-studio/)
- [Responsible AI considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/responsible-ai)

## Next steps

For a demo video, more details about functionality, architecture, source code, and other resources, go to the Auto AI Triage solution on [GitHub](https://github.com/Shrusti13/TriageAutonomousAgent?tab=readme-ov-file​).
