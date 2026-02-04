---
title: ​Improve the new hire experience with a smart onboarding agent
description: Learn how to create a conversational onboarding agent in Copilot Studio that automates the onboarding process.
#customer intent: As a Copilot Studio maker, I want to create an onboarding agent using Copilot Studio so that I can automate the new hire onboarding process and improve efficiency.
author: carcla
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 02/04/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---  

# Improve the new hire experience with a smart onboarding agent

Use Copilot Studio and Power Platform to create an AI-driven onboarding agent that automates the onboarding process by integrating multiple systems, creating custom learning recommendations, and answering candidate questions. Manual and fragmented onboarding processes lead to inefficiencies, delays, and inconsistent new-hire experiences. By using the custom agent approach, you can integrate multiple sources to provide a seamless experience for new hires and HR teams.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/onboarding-agent/architecture.png" alt-text="Architecture diagram of Copilot Studio onboarding agent workflow showing Human Resources Information System (HRIS), Learning Management System (LMS), SharePoint knowledge sources, and tools integration for HR teams." lightbox="media/onboarding-agent/architecture.png":::

### Knowledge sources

To properly respond to the new employee's questions, the agent requires several knowledge sources.

- **Candidate information**: Information from the HR system about the candidate. The agent gets this information by using a connection to Human Resources Information System (HRIS) systems like Workday, SAP SuccessFactors, and other similar HR systems.

- **New hire Frequently Asked Questions (FAQ)**: Common new hire questions and answers.

- **Training guidance**: Training documents outline requirements for training new employees. These documents typically combine training on company policies with role-specific training based on the employee's position. The agent uses this knowledge to create custom learning plans based on the employee's role, team, and required skills.

- **New hire process**: This information outlines the steps the new employee takes, such as completing required forms, training, selecting employee devices, and more. The agent uses this knowledge to prepare a step-by-step onboarding plan.

## Workflow

1. **Candidate data retrieval**: The agent uses a connection to the HR system that manages candidate information to retrieve the candidate info (role, department, team, contact information) and starts the onboarding process. You can enable multiple methods to start the onboarding process. The agent could trigger an event from the HR system indicating a new hire. For example, the [Workday HCM](/connectors/workdayhcm/) connector supports a *When an Employee is Added or Updated* trigger. The new employee can also interact with the agent to start the process by providing the appropriate information.

1. **Document processing**: Onboarding commonly includes collection, validation, and submission of onboarding documents. The agent uses a connection to the candidate management system to access the files submitted by the candidate.

1. **Candidate Q&A**: The agent uses the knowledge sources you configured (FAQs, training guidance, and more) to provide responses to the candidate queries via chat. For questions that the agent can't answer, it uses human-in-the-loop capabilities to get a timely response.

1. **Create learning plans**: Once configured with the training knowledge, the agent creates a personalized learning plan based on the candidate's role, team, and required skills. This step could also involve connecting to the Learning Management System (LMS) to enroll the candidate in the appropriate training courses.

1. **Progress monitoring**: Onboarding includes many activities that must be completed, and ensuring the process is completed in a timely manner is important. The agent monitors onboarding milestones, flags any blockers, and escalates them to appropriate people.

## Components

[​​**Power Platform environment**](/power-platform/admin/environments-overview): Contains the Power Platform resources such as the agent built in Copilot Studio, and any supporting Power Apps that implement the human-in-the-loop user experience. Use [solutions](/microsoft-copilot-studio/authoring-solutions-overview) to move these resources from one environment to another, like development to test.

​[**Copilot Studio agents**](/microsoft-copilot-studio): Use Copilot Studio to implement the agents in the solution. The primary agent, the Onboarding Agent, interacts with users directly or it can trigger autonomously. While multiple agents aren't required for this scenario, you can use them to break the agent into more manageable components. For example, an Onboarding Learning agent could handle all the learning plan related tasks.

[​**Power Apps​**](/power-apps): Use Power Apps to create the user experience for the manager overseeing candidate onboarding. Managers use the application to monitor candidate progress and address blockers to keep things moving.

[​**Power Platform custom connectors​**](/connectors/custom-connectors): Implement custom connectors to interact with any HR candidate systems or learning management systems that don't have certified connectors available.

[​**Microsoft Dataverse**](/power-apps/maker/data-platform): Use Dataverse to track the onboarding process from start to completion. Synchronize Dataverse detailed data with Microsoft Fabric to analyze insights on the overall onboarding process.

​**Microsoft 365 document library**: ​Store FAQs, training guidance, and other onboarding knowledge in a document library so agents can easily access these assets as a knowledge source.

## Scenario details

> [!NOTE]
> This solution idea shows how the [Using AI Agents to create a smart onboarding agent](https://adoption.microsoft.com/scenario-library/human-resources/smart-onboarding-agent-2/) scenario from the [Microsoft Scenario Library](https://adoption.microsoft.com/scenario-library/) could be architected. Refer to the details in the scenario library to learn more about the business impact and key performance indicators (KPIs).

This agent streamlines the entire new‑hire onboarding journey by automating routine steps, answering questions in real time, and providing personalized guidance throughout the process. It retrieves candidate details from HR systems, manages document collection and validation, responds instantly to new‑hire queries, generates tailored learning plans, and monitors progress to highlight blockers early.

The agent delivers value by:

- Reducing manual HR workload by automating document handling, reminders, progress tracking, and information delivery.
- Accelerating new‑hire readiness through personalized training plans and immediate access to role‑specific information.
- Improving the onboarding experience with real‑time responses that eliminate delays and increase clarity for new employees.
- Enhancing visibility for HR and managers with milestone tracking and insights into onboarding progress and common challenges.
- Strengthening compliance and consistency by ensuring required documents and steps are completed correctly and on time.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Design your workload to avoid unnecessary complexity**: By allocating the responsibilities between the agents and custom connectors, you avoid unnecessary complexity. Creating this solution as a single solution with all onboarding instructions in a single agent could make the primary agent complex. Evaluate your onboarding process. If any single area has enough complexity, consider whether multiple agents would reduce overall complexity. However, breaking down the process into too many agents likely increases complexity. Evaluate your process and adjust your agent composition accordingly.

**​Test for resiliency and availability**: With multiple integrated systems, it's important to implement error handling and transient fault handling for any interactions with those systems that might affect the onboarding process. For example, in situations where the user might be affected by the transient error and the agent isn't able to complete the interaction with the user. If it's an important interaction, handle the error by using automation to follow up with the user after the problem is resolved.

**​Measure and publish the health indicators**: Telemetry from the agent runtime should provide adequate indicators of the agent's health. You can also configure the agent to publish to Application Insights. By using the telemetry in Application Insights, you can query the data and include custom telemetry events from your topics.​

### Operational Excellence

**Adopt safe deployment practices**: Standardize deployment of any changes to the apps and agents by using automated deployment processes such as pipelines. Promote the application to production only after testing changes. Power Platform custom connectors are also solution components and deploy alongside the apps and agents. However, keep them in their own Dataverse solution. Agents can live in their own solution separate from the applications and custom connectors. However, this separation can increase deployment complexity. Keep them separate to deliver the agents on a separate timeline from the application. Learn more in [Establish an application lifecycle management strategy](/microsoft-copilot-studio/guidance/alm).

**Automate all tasks that don't benefit from the insight and adaptability of human intervention**: Measuring the accuracy, relevancy, and quality of answers to questions is an important ongoing activity. Create test sets in Copilot Studio that simulate real-world scenarios for the agent. Use the [evaluation capability](/microsoft-copilot-studio/analytics-agent-evaluation-intro) to automate and repeat this process as you deploy changes, as models retire and are replaced, or when you want to verify your agent is answering user queries successfully.

**Design and implement automation up front**: [Create test sets](/microsoft-copilot-studio/analytics-agent-evaluation-create) early in the agent development to allow automated evaluation of the agents in your solution. Early on, you might not know all the tests you need for the agent. Copilot Studio can generate test sets from your configured knowledge sources early in the development process.

### Performance Efficiency

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements. The solution architecture has both user interactive and autonomous agent processing. These two types of processing likely require a different level of performance scrutiny. User interactive logic is more sensitive to response time, while you're likely more concerned with the consumption of the autonomous agents than processing time. Performance testing should address the testing needs of both processing types. If any of the logic is implemented by using agent flows, evaluate whether they're eligible for express mode to speed up processing and reduce agent response wait time.

**​Optimize logic**: An agent's instructions are a form of logic. They provide the instructions for how the agent should guide the user through the onboarding process. As your instructions in a single agent become more complex, the agent might not be as precise in following the instructions or might become confused by overlapping instructions. Move some of the responsibility to another agent, a tool such as a prompt, a custom connector, or Model Context Protocol (MCP). Use agent flows when you need a more deterministic path of execution for the onboarding process. Agents see agent flows as tools and can include instructions for using specific tools. For example, you can implement Create Learning Plan as an agent flow that takes as input the role and uses connectors to the learning management system to identify and enroll the candidate in the appropriate courses.​

**Test performance**: Along with testing for functionality and failures, it's important to test and develop a baseline for performance and evaluate it as part of your release cycle. Learn more in [Design a testing strategy for your agents](/microsoft-copilot-studio/guidance/sec-gov-phase4).

## Responsible AI

**Ensure fair treatment**: Ensure fair treatment across all candidates by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, and enforce strict data privacy and security protocols.

**Transparency and trust**: Ensure users know when they're using a workload that uses AI capabilities. For example, responses should reference a specific knowledge source when possible. Agents should make clear when the user is interacting with an agent and when they're receiving a response from a human.

**Feedback loops**: Agents can easily accept feedback from the users on their interactions with the agent. Users can give a thumbs up or down by using the feedback control. Copilot Studio aggregates and presents this feedback for your review. Implement processes to review this feedback to identify bias or fairness issues.

**Human-in-the-loop**: Onboarding can often involve sensitive questions. Review onboarding solutions to ensure that adequate escalation to a human is implemented.

### Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Copilot Studio documentation](/microsoft-copilot-studio)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance)
- [Knowledge sources summary](/microsoft-copilot-studio/knowledge-copilot-studio)
- [Explore multi-agent orchestration patterns](/microsoft-copilot-studio/guidance/multi-agent-patterns)
