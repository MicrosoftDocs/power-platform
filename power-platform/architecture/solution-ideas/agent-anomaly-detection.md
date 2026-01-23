---
title: ​​Build anomaly detection with Copilot Studio and Fabric​
description: Learn how to automate fraud detection by identifying duplicate invoices, suspicious vendor activity, and policy violations, using Microsoft Copilot Studio and Fabric.
#customer intent: As a business decision maker, I want to explore an example implementation of automated anomaly detection so that I can design a well-architected solution.
author: carcla
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 01/23/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
search.audienceType:
- admin
- flowmaker
---

# ​​Build anomaly detection with Copilot Studio and Fabric​

Use Copilot Studio and Microsoft Fabric to automate fraud detection by identifying duplicate invoices, suspicious vendor activity, and policy violations. Manual spend monitoring processes lead to missed duplicates, delayed fraud detection, and inconsistent compliance enforcement. Instead, autonomous processing identifies potential problems and alerts the finance team for follow up investigation. The finance team can use the custom agent and can ask questions in natural language like "show me suspicious vendors" or "are there any duplicate invoices?" and receive instant, prioritized findings with recommended actions.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/agent-anomaly-detection/anomaly-detection-arch.png" alt-text="Architecture diagram of a solution that automates anomaly detection using Microsoft Copilot Studio and Fabric." border="true" lightbox="media/agent-anomaly-detection/anomaly-detection-arch.png":::

## Knowledge sources

To be able to properly identify potential problems the solution will require several knowledge sources to be available.

- **ERP data**: Invoices and vendor information will need to be available from the organization’s ERP system.

- **Policy rules**: Policy rules define the categories and thresholds and other metadata required to be able to evaluate and identify policy violations.

- **Anomaly guidance**: To increase consistency in handling anomalies the finance team has created a guidance document documenting their investigation steps and procedures for when anomalies are identified.

# ​Workflow

1. **​Extract financial transactions**: Using a connection to the ERP or financial system (Dynamics 365, SAP, Oracle, etc.), transaction data flows into Microsoft Fabric. Multiple methods can be used to ingest data. For batch processing, Fabric Data Factory pipelines can extract invoices and vendor data on a scheduled basis. For real-time detection, Microsoft Fabric Eventstream can capture transactions as they occur, enabling immediate analysis. Data is stored in the Fabric Lakehouse.

1. **​Anomaly detection processing**: An Agent Flow using the Azure Data Explorer action analyzes the data using detection logic in the Fabric Eventhouse. KQL (Kusto Query Language) functions evaluate transactions against multiple detection patterns including duplicate invoice matching (same vendor, amount, and date proximity), vendor activity anomalies (volume spikes, unusual category spread, new vendor risk), and policy threshold violations. Each detection generates a severity score (0-1) indicating the confidence level and risk priority. Detection results are stored in dedicated tables for querying.

1. **​Proactive alerting**: The Agent Flow escalates new items that require investigation by posting to the finance team’s Anomaly channel on Microsoft Teams. Alerts include the anomaly type, vendor name, amount at risk, severity level, and recommended action. For critical findings, the system can automatically create investigation tasks in Microsoft Planner or the organization’s task tracking application.

1. **​Interactive investigation**: Finance team members interact with the Spend Anomaly agent through Microsoft Teams or Microsoft 365 Copilot. Users can ask natural language questions like "Show me suspicious vendors" or "Are there duplicate invoices this week?" Any questions regarding data will utilize the custom Spend Anomaly Data agent that was configured in the Fabric Workspace by customizing a Fabric Data Agent to know how to query the Lakehouse and Eventhouse data. This agent translates questions into the appropriate queries, retrieves results from the Lakehouse or Eventhouse, and presents findings in a summarized, actionable format. The agent provides context including severity interpretation, historical patterns, and recommended next steps.

1. **​Action and resolution**: Once an anomaly is investigated, the Spend Anomaly agent supports resolution workflows. Users can mark items as reviewed, escalate to management, create investigation tasks, or flag as false positives directly through the conversation. The agent can connect to other systems via Agent Flows and connectors to hold payments, request additional documentation, or update vendor risk ratings.

# ​Components

​**​ERP**: The organization’s system that tracks their financial data. For example, Dynamics 365, SAP, Oracle, etc. The ERP system will be the source for financial data for analysis but will not be directly accessed by the agents to perform the investigations.

[**​Microsoft Fabric Workspace**](/fabric/fundamentals/workspaces): Contains the Lakehouse and Eventhouse. The Lakehouse serves as the central repository for transactional data, storing invoice details, vendor records, and policy rules. The Eventhouse functions as the real-time analytics engine, running KQL (Kusto Query Language) detection functions against transaction data to identify anomalies such as duplicate invoices and suspicious vendor activity patterns. Detection results are stored in dedicated Eventhouse tables with severity scores and status tracking, enabling the Fabric Data Agent to query findings through natural language and to trigger human-in-the-loop workflows when high-risk anomalies are detected.

[**​Power Platform environment**](/power-platform/admin/environments-overview): Contains the Power Platform resources such as the agent built in Copilot Studio. These resources are moved from one environment to another (e.g. dev to test) using Dataverse solutions.

[**​Copilot Studio agents**](/microsoft-copilot-studio/): Copilot Studio is used to implement the agents in the solution.  The primary agent, the Spend Anomaly agent, interacts with users directly or it can be triggered autonomously.  The Spend Anomaly agent is configured with knowledge sources, so it has organizational knowledge of the finance team’s procedures for investigating and resolving anomalies.  Using the connect to external agent capability of Copilot Studio the Spend Anomaly Data agent is connected to the Spend Anomaly agent. Prior to establishing this connection, the Spend Anomaly Data agent was configured in the Fabric Workspace.

[**​Microsoft Fabric data agents**](/fabric/data-science/concept-data-agent): Data agent in Microsoft Fabric is a feature that enables you to build your own conversational Q&A systems by using generative AI. A Fabric data agent makes data insights more accessible and actionable for everyone in your organization. Once configured, Fabric data agents can also be used by other Copilot Studio agents to add specialized data capabilities to that agent. With a Fabric data agent, your team can have conversations, with plain English-language questions, about the data that your organization stored in Fabric OneLake and then receive relevant answers. For this scenario the Spend Anomaly Lakehouse and Eventhouse were configured for access by the data agent. The agent instructions were customized to tailor the agent for spend anomaly investigation interactions with users. Example prompts were also configured for common user queries.

**​Anomaly Detection**: Rule-based anomaly detection using KQL functions in the Fabric Eventhouse where implemented. Functions provided a reusable component for managing the logic for detecting anomalies. The Fabric Data agent can also call these functions directly, allowing users to ask "run duplicate detection" and get fresh results on demand. The functions can also be run by Agent Flows. Having the data in Fabric also sets up the ability to do more advanced anomaly detection using Fabric’s data science capabilities. For example, you could train an anomaly detection model on 12+ months of historical transaction data and then use that to score in real-time. Review Anomaly detection in Real-Time Intelligence for more details on Fabric’s capabilities.

**​Microsoft 365 Document Library**: Storing the finance team’s anomaly guidance and other knowledge information in a document library allows these assets to be easily used as a knowledge source by the agents.​

# Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

​**​Design your workload to avoid unnecessary complexity**: By allocating the responsibilities between the Copilot Studio agents and Microsoft Fabric unnecessary complexity is avoided and you leverage each platform's strengths. While you could implement the anomaly detection as part of the agent instructions and tools, Fabric provides a more natural fit for that type of processing. Having the agent query raw transaction data, apply detection logic, and calculate severity scores in real-time would likely result in complex prompts, slower response times, and potentially inconsistent results.

**​Test for resiliency and availability**: With multiple integrated systems it is important to implement error handling and transient fault handling for any interactions with those systems that might impact the process.

**​Measure and publish the health indicators**: Telemetry from the agent runtime should provide adequate indicators of the agent’s health. The agent can also be configured to publish to Application Insights. With the telemetry in Application Insights, you can query the data as well as include custom telemetry events from your topics.​

### Operational Excellence

​**​Adopt safe deployment practices**: Standardize deployment of any changes to the apps and agents by using automated deployment processes, such as pipelines. Promote the application to production only after testing changes. Power Platform custom connectors are also solution components and deploy alongside the apps and agents, however it is recommended to keep them in their own Dataverse solution. Agents can also live in their own solution separate from the applications and custom connectors, however, this can also increase the complexity of the deployment. The reason to keep them separate would be to support the need to deliver the agents on a separate timeline from the application. Consideration should also be given to the Fabric assets and how their lifecycle might impact the Copilot Studio agent.

**​Automate all tasks that don't benefit from the insight and adaptability of human intervention**: Measuring the accuracy, relevancy, and quality of answers to questions is an important ongoing activity. Copilot Studio allows creating test sets that simulate real-world scenarios for the agent. Using the evaluation capability, you can automate and repeat this process as you deploy changes, as models retire and are replaced or during other situations where you want to make sure your agent is answering user queries successfully.

**​Design and implement automation up front**: Test sets should be created early in the agent development to allow automated evaluation of the agents in your solution. Early on you might not know all the tests you will need for the agent so Copilot Studio can generate test sets from your configured knowledge sources. Test sets should also be developed to test the responses from the data agent by performing common queries that users might use.​

### Performance Efficiency

​**​Design to meet performance requirements**: Evaluate your solution performance and volume of data requirements.  The solution architecture has both user interactive and autonomous agent processing. These will likely require a different level of scrutiny of performance. The user interactive logic will be more sensitive to response time, while you will likely be more concerned with the consumption of the autonomous agents and less worried how long the processing takes. Performance testing should be crafted to cater to the testing needs of both these requirements. If any of the logic is implemented using Agent Flows, evaluate if they are eligible for express mode to accelerate their processing and reduce the time a user might be waiting for a response from the agent. Where necessary additional data processing can be done in the Fabric workspace to optimize data operations and improve performance of the interactive queries.

**​Optimize logic**: Agent’s instructions are a form of logic; they provide the instructions for how the agent should guide the user through the onboarding process.  Be aware as your instructions in a single agent become more complex, there can be a tendency for the agent not to be as precise in following the instructions or can become confused with overlap between the instructions that might not be obvious. Moving some of the responsibility to another agent, a tool such as a prompt, a custom connector, or all together to MCP. Agent flows should be considered where a more deterministic path of execution is required for the onboarding process. Agent Flows are seen by the agent as tools and can have instructions that include using specific tools. For example, Suspend Vendor might be implemented as an Agent Flow that takes as input the vendor information and uses connectors to the organizations other systems to suspend the vendor until further investigation is completed.​

**Test Performance**: Along with testing for functionality, and failures it is important to test and develop a baseline for performance and evaluate it as part of your release cycle.

### Responsible AI

​**​Ensure fair treatment**: Ensure fair treatment across all vendors by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, enforce strict data privacy and security protocols.

**​Transparency and trust**: Ensure users know when they are using a workload that uses AI capabilities. For example, responses should reference a specific knowledge source when possible and agents should make clear when the user is interacting with an agent and when they are receiving a response from a human.

**​Feedback loops**: Agents can easily accept feedback from the users on their interactions with the agent. Users can thumb up or down using the feedback control and Copilot Studio aggregates and presents this feedback for your review. Implement processes to review this feedback to identify issues of bias or fairness.

**​Human-in-the-loop**: Anomaly detection is not always deterministic and the impact on a vendor for false allegations could be significant. It is important to ensure that adequate review and escalation to a human is implemented.​

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Copilot Studio documentation](/microsoft-copilot-studio/)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance/)
- [Copilot Studio implementation guide](https://aka.ms/CopilotStudioImplementationGuide) (PDF)
- [Knowledge sources summary](/microsoft-copilot-studio/knowledge-copilot-studio)
