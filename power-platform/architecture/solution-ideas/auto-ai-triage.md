---
title: Automate the bug reporting processes in software development with Auto AI Triage
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

# Automate the bug reporting processes in software development with Auto AI Triage

This article outlines the Auto Triage AI Agent, which automates the bug reporting and updating processes in software development. It highlights the efficiency gained through two agents that handle bug creation and follow-up, significantly improving the user experience and operational speed.

For a demo and more information about this solution, visit [Auto AI Triage on GitHub](https://github.com/Shrusti13/TriageAutonomousAgent?tab=readme-ov-file).

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/auto-triage/auto-triage.jpg" alt-text="Architecture diagram of the Cardio Triage AI solution." border="true" lightbox="media/auto-triage/auto-triage.jpg":::

## Workflow

### Agent 1: Autonomous bug report creation

- When an email detailing a product issue is received, Agent 1 is triggered. The agent uses generative AI to carefully analyse the email to extract key details, such as the issue title. The agent uses the title to cross-references product documentation—including specifications, business and technical process flows, installation manuals, error codes, and troubleshooting guides—to generate comprehensive reproduction steps and system information, which are essential for the triage process.
- The AI autonomously creates a bug in Azure DevOps, populating fields such as the issue description, repro steps, and system information.
- After creating the bug, the agent sends an email to the user with the tracking number, confirming that the bug has been successfully logged.

### Agent 2: Autonomous bug update and follow-up

- When a user replies with additional information or asks for an update on their tracking ID, Agent 2 automatically retrieves the corresponding bug details from Azure DevOps using the tracking ID.
- Generative AI then analyses the email and updates the bug report accordingly, ensuring the information is always up to date.
- The agent sends a follow-up email to the user, updating them with the current bug status and confirming that the new information has been added. This intelligent automation reduces human error, speeds up the process, and ensures that all bug reports are consistent, accurate, and detailed.

## Components

- **Microsoft Outlook (autonomous agent)**: Outlook provides seamless access to autonomous agents from Copilot Studio, allowing agents to be triggered directly from an employee's email workflow. Learn more in [Event trigger overview](/microsoft-copilot-studio/authoring-triggers-about).
- [**Copilot Studio agent**](/microsoft-copilot-studio/): An autonomous agent that analyses emails and creates bugs in Azure DevOps.
- [**Azure DevOps**](/azure/devops/user-guide/what-is-azure-devops?view=azure-devops): Azure DevOps supports the software development lifecycle and is used to track bugs and features.
- **[Power Automate](/power-automate/):** Power Automate is a tool that helps automate repetitive tasks and workflows. It connects different services and apps to perform tasks automatically, saving time, and reducing the chance of human error.
- **[**AI Builder](/ai-builder/)**: AI Builder is a tool that lets you add artificial intelligence to your apps without needing deep technical knowledge. It can help build features like predictive analytics or automated insights.
- **Knowledge**: "Knowledge" refers to the information and data sources that agents use to provide relevant and accurate responses.
  - Product specification
  - Business and technical process flows
  - Installation manuals
  - Error codes
  - Troubleshooting guides

## Scenario details

In today’s software development environments, managing and triaging product issues effectively is critical to delivering high-quality products. However, as the volume of incoming bug reports increases, support teams often find themselves overwhelmed by the repetitive and time-consuming task of manually logging and updating bugs. For instance, a product support specialist might receive hundreds of emails daily from users reporting product issues. For each email, the support specialist needs to manually create bug reports in Azure DevOps, extract relevant information from knowledge documentation, and send follow-up emails to users. This manual process is slow, prone to errors, and not scalable.
Auto Triage AI revolutionizes this process by automating it with the power of generative AI. With two intelligent copilot agents working seamlessly together, Auto Triage AI autonomously handles both the initial bug creation and follow-up updates, ensuring faster resolution times and improving user experience without any manual intervention.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- Ensures automated triage of bug reports with no degradation in performance even at high volume.
- Achieved by using cloud architecture, ensuring scalable and resilient operations.
- Implements redundancy, parallel processing, and automatic scaling on demand.

### Security

- Uses enterprise-grade authentication via Microsoft Entra ID for secure access.
- Implements secure connections and access controls, ensuring that sensitive data is protected.
- Data resides within secure systems, following Azure DevOps security standards.

### Operational Excellence

- Automation reduces manual intervention in bug triage processes.
- Ensures consistent quality and response time for bug reports.
- Monitors system health through integrated tools, ensuring high operational uptime.

### Performance Efficiency

- System scales automatically based on the volume of bug reports.
- Uses Power Automate and AI Builder to optimize performance without manual scaling.
- Employs efficient use of cloud resources to ensure a smooth and performant experience.

### Experience Optimization

- User experience is enhanced by reducing manual tasks and speeding up issue resolution.
- Ensures that bugs are triaged quickly with AI-powered insights, improving the user’s experience.

### Responsible AI

- **Fairness:** AI models trained on diverse datasets ensure balanced bug classification.
- **Reliability and safety:** The architecture is designed to ensure reliable AI-powered decisions.
- **Privacy and security:** Data is processed within secure environments, maintaining confidentiality.
- **Transparency:** The AI’s decision-making process is traceable for transparency.
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

For a demo video, further explanation of functionality, architecture, source code, and more, visit the Auto AI Triage solution on [GitHub](https://github.com/Shrusti13/TriageAutonomousAgent?tab=readme-ov-file​).
