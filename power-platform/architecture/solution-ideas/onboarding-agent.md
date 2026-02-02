---  
title: ​Improve new hire onboarding with a smart onboarding agent
description: Learn how to create a conversational onboarding agent in Copilot Studio that automates the onboarding process.
#customer intent: As a Copilot Studio maker, I want to create a conversational agent to automate onboarding.
author: carcla
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 01/20/2025
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---  

# Improve new hire onboarding with a smart onboarding agent

Use Copilot Studio and Power Platform to create an AI-driven onboarding agent that automates the onboarding process by integrating multiple systems, creating custom learning recommendations, and answering candidate questions. Manual and fragmented onboarding processes lead to inefficiencies, delays, and inconsistent new-hire experiences. By using the custom agent approach, you can integrate multiple sources to provide a seamless experience for new hires and HR teams.

> [!TIP]
> This article provides example scenarios and a generalized example architecture to illustrate how to create a conversational agent for onboarding processes. You can modify the architecture example for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/onboarding-agent/architecture.png" alt-text="Diagram that shows integration points and knowledge sources for creating a conversational onboarding agent in Copilot Studio." lightbox="media/onboarding-agent/architecture.png":::

### Knowledge sources

To properly respond to the new employee’s questions, the agent requires several knowledge sources. 

- **Candidate information**: Information from the HR system about the candidate. The agent likely gets this information by using a connection to Human Resources Information System (HRIS) systems like Workday, SAP SuccessFactors, and other similar HR systems.
- **New hire FAQ**: Common new hire questions and answers.
- **Training guidance**: The training documents outline what is required for training the new employee. It's likely a combination of both common training on company policies and role-specific training depending on their specific position. The agent uses this knowledge to create custom learning plans based on their role, team, and required skills.
- **New hire process**: This information outlines the steps the new employee takes, for example, completing required forms, training, selecting employee devices, and more. The agent uses this knowledge to prepare a step-by-step plan for the employee onboarding.

## Workflow

1. **Candidate data retrieval**: The agent uses a connection to the HR system that manages candidate information to retrieve the candidate info (role, department, team, contact information) and starts the onboarding process. You can enable multiple methods to start the onboarding process. The agent could trigger an event from the HR system indicating a new hire. For example, the [Workday HCM](/connectors/workdayhcm/) connector supports a *When an Employee is Added or Updated* trigger that you can use. The new employee can also interact with the agent to start the process by providing appropriate information to allow the agent to initiate the process.
1. **Document processing**: Onboarding commonly includes collection, validation, and submission of onboarding documents. The agent uses a connection to the candidate management system to access the files submitted by the candidate.
1. **Candidate Q&A**: The agent uses the knowledge sources you configured (FAQs, training guidance, and more) to provide responses to the candidate queries via chat. For questions that the agent can't answer, it uses the human in the loop capabilities to get a timely response.
1. **Create learning plans**: Once configured with the training knowledge, the agent creates a personalized learning plan based on the candidate’s role, team, and required skills. This step could also involve connecting to the learning management system to enroll the candidate in the appropriate training courses.
1. **Progress monitoring**: Onboarding can have many activities that must be completed, and ensuring the process is completed in a timely manner is important. The agent monitors onboarding milestones, flags any blockers, and escalates them to appropriate people.

## Components

[​​**Power Platform environment**](/power-platform/admin/environments-overview): Contains the Power Platform resources such as the agent built in Copilot Studio, and any supporting Power Apps that implement the human in the loop user experience. Move these resources from one environment to another (for example, from dev to test) by using Dataverse solutions. 

​[**Copilot Studio agents**](/microsoft-copilot-studio): Use Copilot Studio to implement the agents in the solution. The primary agent, the Onboarding Agent, interacts with users directly or it can trigger autonomously. While multiple agents aren't required for this scenario, you can use them to break up the agent into more manageable components. For example, an Onboarding Learning agent could handle all the learning plan related tasks. 

[​**Power Apps​**](/power-apps): Use Power Apps to implement the user experience for the manager of the candidate who's going through the onboarding. By using the application, they can monitor the progress of their candidate and address any blockers to keep things moving.   

[​**Power Platform custom connectors​**](/connectors/custom-connectors): Implement custom connectors to interact with any HR candidate systems or learning management systems that don't have certified connectors available. 

[​**Microsoft Dataverse**](/power-apps/maker/data-platform): Use Dataverse to track the onboarding process. From the time the candidate starts onboarding to when they complete the process, Dataverse centralizes the progress of the onboarding. You can also synchronize this detailed data with Microsoft Fabric by using the built-in capabilities to allow insights on the overall onboarding process to be analyzed. 

​**Microsoft 365 Document Library**: Storing the FAQs, training guidance, and other onboarding process knowledge information in a document library allows these assets to be easily used as a knowledge source by the different agents.​ 

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

**Design your workload to avoid unnecessary complexity**: By allocating the responsibilities between the agents and the custom connectors, the solution can ensure that it avoids unnecessary complexity. For example, creating this solution as a single solution with all the instructions for onboarding in a single agent could make the primary agent complex. Evaluate your onboarding process and if there's enough complexity in any single area, consider if multiple agents would result in reduced complexity. However, breaking down the process into too many agents likely results in more complexity. Evaluate your process and adjust your agent composition accordingly. 

**​Test for resiliency and availability**: With multiple integrated systems, it's important to implement error handling and transient fault handling for any interactions with those systems that might affect the onboarding process. For example, in situations where the user might be affected by the transient error and the agent isn't able to complete the interaction with the user, if it's an important interaction, you could handle the error by using an implement automation to follow up with the user later once the problem is resolved. 

**​Measure and publish the health indicators**: Telemetry from the agent runtime should provide adequate indicators of the agent’s health. You can also configure the agent to publish to Application Insights. By using the telemetry in Application Insights, you can query the data and include custom telemetry events from your topics.​ 

### Operational Excellence

**Adopt safe deployment practices**: Standardize deployment of any changes to the apps and agents by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. Power Platform custom connectors are also solution components and deploy alongside the apps and agents. However, keep them in their own Dataverse solution. Agents can also live in their own solution separate from the applications and custom connectors. However, this separation can increase the complexity of the deployment. Keep them separate to support the need to deliver the agents on a separate timeline from the application.  

**​Automate all tasks that don't benefit from the insight and adaptability of human intervention**: Measuring the accuracy, relevancy, and quality of answers to questions is an important ongoing activity. Copilot Studio allows creating test sets that simulate real-world scenarios for the agent. By using the evaluation capability, you can automate and repeat this process as you deploy changes, as models retire and are replaced, or during other situations where you want to make sure your agent is answering user queries successfully. 

**​Design and implement automation up front**: Test sets should be created early in the agent development to allow automated evaluation of the agents in your solution. Early on, you might not know all the tests you need for the agent. Copilot Studio can generate test sets from your configured knowledge sources.​ 

### Performance Efficiency

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements. The solution architecture has both user interactive and autonomous agent processing. These two types of processing likely require a different level of scrutiny of performance. The user interactive logic is more sensitive to response time, while you're likely more concerned with the consumption of the autonomous agents and less worried how long the processing takes. Performance testing should cater to the testing needs of both these requirements. If you implement any of the logic by using agent flows, evaluate if they're eligible for express mode to accelerate their processing and reduce the time a user might be waiting for a response from the agent. 

**​Optimize logic**: An agent's instructions are a form of logic. They provide the instructions for how the agent should guide the user through the onboarding process. As your instructions in a single agent become more complex, the agent might not be as precise in following the instructions or can become confused with overlap between the instructions that might not be obvious. Move some of the responsibility to another agent, a tool such as a prompt, a custom connector, or all together to model-context protocol (MCP). Consider agent flows where a more deterministic path of execution is required for the onboarding process. Agent flows are seen by the agent as tools and can have instructions that include using specific tools. For example, **Create Learning Plan** might be implemented as an agent flow that takes as input the role and uses connectors to the learning management system to identify and enroll the candidate into the appropriate courses.​ 

**Test performance**: Along with testing for functionality and failures, it's important to test and develop a baseline for performance and evaluate it as part of your release cycle. 

### Responsible AI

**Ensure fair treatment**: Ensure fair treatment across all candidates by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, and enforce strict data privacy and security protocols. 

**Transparency and trust**: Ensure users know when they're using a workload that uses AI capabilities. For example, responses should reference a specific knowledge source when possible. Agents should make clear when the user is interacting with an agent and when they're receiving a response from a human. 

**Feedback loops**: Agents can easily accept feedback from the users on their interactions with the agent. Users can thumb up or down by using the feedback control and Copilot Studio aggregates and presents this feedback for your review. Implement processes to review this feedback to identify issues of bias or fairness. 

**Human-in-the-loop**: Onboarding can often involve sensitive questions. Review onboarding solutions to ensure that adequate escalation to a human is implemented.

### Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Copilot Studio documentation](/microsoft-copilot-studio)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance)
- [Copilot Studio implementation guide (PDF)](https://aka.ms/CopilotStudioImplementationGuide)
- [Knowledge sources summary](/microsoft-copilot-studio/knowledge-copilot-studio)
- [Multi-agent orchestration and more | Microsoft Copilot Blog](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/multi-agent-orchestration-maker-controls-and-more-microsoft-copilot-studio-announcements-at-microsoft-build-2025)
