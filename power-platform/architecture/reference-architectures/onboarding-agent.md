---  
title: ​​Build agents with Copilot Studio for onboarding​
description: Learn how to create a conversational onboarding agent in Copilot Studio that automates the onboarding process.
#customer intent: As a Copilot Studio maker, I want to create a conversational agent to automate onboarding.
author: carcla
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 01/20/2025
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---  

# ​​Build agents with Copilot Studio for onboarding​

Use Copilot Studio and Power Platform to create an AI-driven onboarding agent that automates the onboarding process by integrating multiple systems, creating custom learning recommendations and answering candidate questions. Manual and fragmented onboarding processes lead to inefficiencies, delays, and inconsistent new-hire experiences. Using the custom agent approach integrates multiple sources to provide a seamless experience for new hires and HR teams.

> [!TIP]
> This article provides example scenarios and a generalized example architecture to illustrate how to create a conversational agent for onboarding processes. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/onboarding-agent/architecture.png" alt-text="Diagram that shows integration points and knowledge sources for creating a conversational onboarding agent in Copilot Studio." lightbox="media/onboarding-agent/architecture.png":::

### Knowledge sources

To be able to properly respond to the new employee’s questions the agent will require several knowledge sources to be available. 

- **Candidate information**: Information from the HR system about the candidate. This will likely come from the agent using a connection to HRIS systems like Workday, SAP SuccessFactors and others similar HR systems.
- **New hire FAQ**:  Common new hire questions and answers.
- **Training guidance**: The training documents would outline what is required for training the new employee.  Likely it would be a combination of both common training on company policies and role specific training depending on their specific position. This would be used by the agent to create custom learning plans based on their role, team and required skills.
- **New hire process**: This would be information that outlines the steps the new employee would take, for example, completing required forms, training, selecting employee devices etc. The agent would use this to prepare a step-by-step plan for the employee onboarding.

## Workflow

1. **Candidate data retrieval**: Using a connection to the HR system that manages candidate information the agent will retrieve the candidate info (role, department, team, contact information) and start the onboarding process. Multiple methods could be enabled to start the onboarding process. The agent could trigger an event from the HR system indicating a new hire. For example, the Workday HCM connector supports a When an Employee is Added or Updated trigger that could be used. The new employee could also interact with the agent to start the process by providing appropriate information to allow the agent to initiate the process.
1.	**Document processing**: Onboarding commonly includes collection, validation and submission of onboarding documents. Using a connection to the candidate management system the agent can access the files submitted by the candidate.
1.	**Candidate Q&A**: The agent can use the knowledge sources configured (FAQs, training guidance, etc.) to provide responses to the candidate queries via chat. For questions that the agent is unable to answer, the agent could use the human in the loop capabilities to get a timely response.
1.	**Create learning plans**: Once configured with the training knowledge, the agent could create a personalized learning plan based on the candidate’s role, team and required skills. This could also involve connecting to the learning management system to enroll the candidate in the appropriate training courses.
1.	**Progress monitoring**: Onboarding can have many activities that must be completed and ensuring the process is completed in a timely manner is important. The agent can monitor onboarding milestones, flag any blockers and escalate them to appropriate people.

## Components

[​​**Power Platform environment**](/power-platform/admin/environments-overview): Contains the Power Platform resources such as the agent built in Copilot Studio, any supporting Power Apps that implement the human in the loop user experience. These resources are moved from one environment to another (e.g. dev to test) using Dataverse solutions. 

​[**Copilot Studio agents**](/microsoft-copilot-studio): Copilot Studio is used to implement the agents in the solution. The primary agent, the Onboarding Agent, interacts with users directly or it can be triggered autonomously. While multiple agents are not required for this scenario, they can be used to break up the agent into more manageable components. For example, an Onboarding Learning agent could handle all the learning plan related tasks. 

[​**Power Apps​**](/power-apps): Power Apps is used to implement the user experience of the manager of the candidate that is going through the onboarding. Using the application, they could monitor the progress of their candidate and address any blockers to keep things moving.   

[​**Power Platform custom connectors​**](/connectors/custom-connectors): Custom connectors would be implemented to interact with any HR candidate systems or learning management systems that didn’t have certified connectors available. 

[​**Microsoft Dataverse**](/power-apps/maker/data-platform): Dataverse can be used to track the onboarding process. From the time the candidate starts onboarding to when they complete the process, Dataverse will be used to centralize the progress of the onboarding. This detailed data can also be synchronized with Microsoft Fabric using the built-in capabilities to allow insights on the overall onboarding process to be analyzed. 

​**Microsoft 365 Document Library**: Storing the FAQs, training guidance and other onboarding process knowledge information in a document library allows these assets to be easily used as a knowledge source by the different agents.​ 

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, which is a set of guiding tenets that can be used to improve the quality of a workload. For more information, see [Microsoft Power Platform Well-Architected](/power-platform/well-architected).

### Reliability

**Design your workload to avoid unnecessary complexity**: By allocating the responsibilities between the agents and the custom connectors, the solution can ensure that unnecessary complexity is avoided. For example, creating this as a single solution with all the instructions for onboarding in a single agent could make the primary agent unnecessarily complex. Evaluate your onboarding process and if there is enough complexity in any single area consider if multiple agents would result in reduced complexity. However, breaking the process down into too many agents would likely result in more complexity being added so it is important to evaluate your process and adjust your agent composition accordingly. 

**​Test for resiliency and availability**: With multiple integrated systems it is important to implement error handling and transient fault handling for any interactions with those systems that might impact the onboarding process. For example, in situations where the user might be impacted by the transient error and the agent is not able to complete the interaction with the user if it is an important interaction, you could handle the error using an implement automation to follow up with the user later once the problem is resolved. 

**​Measure and publish the health indicators**: Telemetry from the agent runtime should provide adequate indicators of the agent’s health. The agent can also be configured to publish to Application Insights. With the telemetry in Application Insights, you can query the data as well as include custom telemetry events from your topics.​ 

### Operational excellence

**Adopt safe deployment practices**: Standardize deployment of any changes to the apps and agents by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. Power Platform custom connectors are also solution components and deploy alongside the apps and agents, however it is recommended to keep them in their own Dataverse solution. Agents can also live in their own solution separate from the applications and custom connectors, however, this can also increase the complexity of the deployment. The reason to keep them separate would be to support the need to deliver the agents on a separate timeline from the application.  

**​Automate all tasks that don't benefit from the insight and adaptability of human intervention**: Measuring the accuracy, relevancy, and quality of answers to questions is an important ongoing activity. Copilot Studio allows creating test sets that simulate real-world scenarios for the agent. Using the evaluation capability, you can automate and repeat this process as you deploy changes, as models retire and are replaced or during other situations where you want to make sure your agent is answering user queries successfully. 

**​Design and implement automation up front**: Test sets should be created early in the agent development to allow automated evaluation of the agents in your solution. Early on you might not know all the tests you will need for the agent so Copilot Studio can generate test sets from your configured knowledge sources.​ 

### Performance efficiency

**Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements.  The solution architecture has both user interactive and autonomous agent processing. These will likely require a different level of scrutiny of performance. The user interactive logic will be more sensitive to response time, while you will likely be more concerned with the consumption of the autonomous agents and less worried how long the processing takes. Performance testing should be crafted to cater to the testing needs of both these requirements. If any of the logic is implemented using Agent Flows, evaluate if they are eligible for express mode to accelerate their processing and reduce the time a user might be waiting for a response from the agent. 

**​Optimize logic**: Agent’s instructions are a form of logic; they provide the instructions for how the agent should guide the user through the onboarding process.  Be aware as your instructions in a single agent become more complex, there can be a tendency for the agent to not be as precise in following the instructions or can become confused with overlap between the instructions that might not be obvious. Moving some of the responsibility to another agent, a tool such as a prompt, a custom connector, or all together to MCP. Agent flows should be considered where a more deterministic path of execution is required for the onboarding process. Agent Flows are seen by the agent as tools and can have instructions that include using specific tools. For example, Create Learning Plan might be implemented as an Agent Flow that takes as input the role and uses connectors to the learning management system to identify and enroll the candidate into the appropriate courses.​ 

**Test performance**: Along with testing for functionality, and failures it is important to test and develop a baseline for performance and evaluate it as part of your release cycle. 

### Responsible AI

**Ensure fair treatment**: Ensure fair treatment across all candidates by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, enforce strict data privacy and security protocols. 

**​Transparency and trust**: Ensure users know when they are using a workload that uses AI capabilities. For example, responses should reference a specific knowledge source when possible and agents should make clear when the user is interacting with an agent and when they are receiving a response from a human. 

**​Feedback loops**: Agents can easily accept feedback from the users on their interactions with the agent. Users can thumb up or down using the feedback control and Copilot Studio aggregates and presents this feedback for your review. Implement processes to review this feedback to identify issues of bias or fairness. 

**​Human-in-the-loop**: Onboarding can often involve sensitive questions and onboarding solutions should be reviewed to ensure that adequate escalation to a human is implemented.​

### Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Copilot Studio documentation](/microsoft-copilot-studio)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance)
- [Copilot Studio implementation guide (PDF)](https://aka.ms/CopilotStudioImplementationGuide)
- [Knowledge sources summary](/microsoft-copilot-studio/knowledge-copilot-studio)
- [Multi-agent orchestration and more | Microsoft Copilot Blog](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/multi-agent-orchestration-maker-controls-and-more-microsoft-copilot-studio-announcements-at-microsoft-build-2025)








