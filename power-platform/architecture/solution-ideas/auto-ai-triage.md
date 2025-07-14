---
title: Automate software bug reporting with the Auto Triage AI Agent
description: Discover how to use Copilot Studio and Power Platform to automate the bug reporting and updating processes in software development with the Auto Triage AI agent
#customer intent: As a business decision maker, I want to evaluate Auto Triage AI's operational benefits so that I can reduce manual effort, improve efficiency, and enhance the user experience.  
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 07/14/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Automate software bug reporting with the Auto Triage AI Agent

In this article, you learn about the Auto Triage AI Agent, which automates bug reporting in software development. The solution highlights the efficiency gained through using generative AI to automate triage and follow-up of product issues, reducing the burden on customer support teams and enhancing the customer experience.

For a demo and more information, visit the Auto Triage AI Agent solution on [GitHub](https://github.com/Shrusti13/TriageAutonomousAgent?tab=readme-ov-file​).

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/auto-triage/auto-triage.jpg" alt-text="Architecture diagram of the Auto Triage AI Agent solution." lightbox="media/auto-triage/auto-triage.jpg":::

## Workflow

The solution consists of two agents: one dedicated to bug report creation, and the other to bug updates and follow-up. 

### Agent 1: Autonomous bug report creation

1. When an email detailing a product issue arrives, Agent 1 is triggered. The agent uses generative AI to analyze the email and extract key details, such as the issue title. The agent uses the title to cross reference product documentation—including specifications, business and technical process flows, installation manuals, error codes, and troubleshooting guides—to generate comprehensive reproduction steps and system information. These details are essential for the triage process.

1. The AI autonomously creates a bug in Azure DevOps and fills in fields like the issue description, reproduction steps, and system information.

1. After creating the bug, the agent emails the user the tracking number, confirming successfully logging of the bug.

### Agent 2: Autonomous bug update and follow-up

1. When a user replies with more information or asks for an update on their tracking ID, Agent 2 retrieves the bug details from Azure DevOps using the tracking ID.

1. Generative AI analyzes the email and updates the bug report, ensuring the information is always up to date.

1. The agent sends a follow-up email to the user with the current bug status and confirms that the new information has been added. 

This intelligent automation reduces human error, speeds up the process, and ensures that all bug reports are consistent, accurate, and detailed.

## Components

**Microsoft Outlook (autonomous agent)**: Outlook provides seamless access to autonomous agents from Copilot Studio, allowing agents to be triggered directly from an employee's email workflow. Learn more in [Event trigger overview](/microsoft-copilot-studio/authoring-triggers-about).

[**Copilot Studio agent**](/microsoft-copilot-studio/): The Copilot Studio agent is an autonomous agent that analyzes emails and creates bugs in Azure DevOps.

[**Azure DevOps**](/azure/devops/user-guide/what-is-azure-devops): Azure DevOps supports the software development lifecycle and is used to track bugs and features.

**[Power Automate](/power-automate/):** Power Automate automates repetitive tasks and workflows. It connects services and apps to perform tasks automatically, saving time and reducing human error.

**[AI Builder](/ai-builder/)**: AI Builder lets you add artificial intelligence to your apps without requiring deep technical knowledge. It helps build features like predictive analytics or automated insights.

**Knowledge**: "Knowledge" refers to the information and data sources that an agent uses to provide relevant and accurate responses. Sources of knowledge can include product specifications, business and technical process flows, installation guides, lists of error codes, and knowledge bases. Learn more about [knowledge sources](/microsoft-copilot-studio/knowledge-copilot-studio).

## Scenario details

In today's software development environments, managing and triaging product issues effectively is critical to delivering high-quality products. As the number of bug reports grows, support teams increasingly become overwhelmed by the repetitive and time-consuming task of manually logging and updating bugs. For example, a product support specialist might receive hundreds of emails daily from users reporting product issues. For each email, the support specialist needs to manually create bug reports in Azure DevOps, extract relevant information from knowledge documentation, and send follow-up emails to users. This manual process is slow, error prone, and doesn't scale.

Auto Triage AI changes this process by automating it with generative AI. With two intelligent agents working seamlessly together, Auto Triage AI autonomously handles both the initial bug creation and follow-up updates. By combining advanced AI capabilities with real-time automation, Auto Triage AI transforms a traditionally manual, slow, and error-prone process into a streamlined, efficient workflow.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- Automates bug report triage without degrading performance, even at high volume.
- Uses cloud architecture to ensure scalable and resilient operations.
- Implements redundancy, parallel processing, and automatic scaling on demand.

### Security

- Uses enterprise-grade authentication with Microsoft Entra ID for secure access.
- Uses secure connections and access controls to protect sensitive data.
- Ensures data resides within secure systems, following Azure DevOps security standards.

### Operational Excellence

- Reduces manual intervention in bug triage processes.
- Ensures consistent quality and response time for bug reports.
- Monitors system health with integrated tools, ensuring high operational uptime.

### Performance Efficiency

- Scales automatically based on the volume of bug reports.
- Uses Power Automate and AI Builder to optimize performance without manual scaling.
- Uses cloud resources efficiently to deliver a smooth and performant experience.

### Experience Optimization

- Reduces manual tasks and speeds up issue resolution.
- Triages bugs quickly with AI-powered insights.

### Responsible AI

- **Fairness:** AI models trained on diverse datasets deliver balanced bug classification.
- **Reliability and safety:** The architecture delivers reliable AI-powered decisions.
- **Privacy and security:** Data stays in secure environments to maintain confidentiality.
- **Transparency:** The AI decision-making process is traceable for transparency.
- **Accountability:** Clear access controls and auditing mechanisms ensure accountability for actions taken by the system.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- [Shrushti Shah](https://www.linkedin.com/in/shrushti-shah-bba565162/), Senior Cloud Consultant
- [Bhushan Gawale](https://www.linkedin.com/in/bhushangawale/), Azure Architect

## Related resources

- [Microsoft Copilot Studio documentation](/microsoft-copilot-studio/)
- [Responsible AI considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/responsible-ai)

## Next steps

For a demo video, more details about functionality, architecture, source code, and more, visit the Auto Triage AI Agent solution on [GitHub](https://github.com/Shrusti13/TriageAutonomousAgent?tab=readme-ov-file​).
