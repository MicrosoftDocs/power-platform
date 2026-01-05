---
title: Identify and rate flows recommendation for Power Platform workloads
description: Learn how to create a catalog of user and system flows for your Power Platform workload and how to determine their criticality and impact on reliability.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/18/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for identifying and rating flows

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

| [RE:02](checklist.md) | **Identify and rate user and system flows. Use a criticality scale based on your business requirements to prioritize the flows.** |
| --- | --- |

This guide describes the recommendations for identifying and prioritizing workload flows. Identifying and prioritizing workload flows involves mapping user flows and system flows to determine their criticality to the organization. This practice ensures that you identify and prioritize the most critical workload functionality to reduce the risk of damaging failures. Failure to identify and prioritize workload flows can lead to system breakdowns and compromised workload reliability.

**Definitions**

| Term | Definition |
| --- | --- |
| User flow | The paths or sequences of actions that users take within an application or system. |
| System flow | The flow of information and processes within a system. The system automatically follows this flow to enable user flows or workload functionality. |

## Key design strategies

When you design your workload, it's essential to define the user flows and system flows.

- User flows chart the movement of a user through your application. They focus on the user interface, interactions, decisions, and the steps required to complete a task. User flows provide a user-centric perspective on user experience and interface design.

- System flows chart the internal workings of your workload. They focus on data movement, input processing, output processing, and interactions among workload components, back-end services, and external APIs. System flows indicate the intricate details of how the workload operates internally.

You should identify and define flows early in the design phase of your workload. It gives you a clearer understanding of what affects the reliability of your workload. It aligns your architectural decisions closely with the reliability goals of your workload.

### Identify all user and system flows

The output of identifying all user and system flows is a catalog of all the flows in your workload. This identification process requires you to map out every user interaction and process within a system from beginning to end. This mapping is a prerequisite for identifying critical flows. Here are recommendations for identifying all user and system flows in a workload:

- **Identify key contributors**. Think through everyone who contributes to the process. This includes people in your department and other departments who all work together on the problem. Understand what they do in the context of the business problem that's being solved.

- **Interview stakeholders**. Stakeholders can provide valuable information to identify flows, and they can even help you map and prioritize flows. You can also interview users, business analysts, and technical teams to gather insights about user interactions and dependencies within the workload.

- **Discover processes to improve on using process mining**. If your task is done fully on the desktop, you can use [process mining](/power-automate/process-advisor-overview) to discover all the steps that people in your organization take to complete the task. Process mining visualizes your process in a [process map](/power-automate/process-advisor-visualize) and reveals bottlenecks and metrics for your process in an analytical report. Use [Plan designer](/power-apps/maker/plan-designer/process-diagram) to generate process diagrams as part of the plan to clarify user interactions.

- **Review documentation**. In the design phase, you might not have documentation to review. However, if documentation exists, you should use it. Ask for system architecture diagrams, user manuals, and process descriptions. These documents can help you understand the intended functionality of the workload and its individual flows. You can use existing documentation to [create a plan](/power-apps/maker/plan-designer/create-plan) using Plan designer. Plan designer generates a complete Power Platform solution tailored to your needs.

- **Observe what activities are being performed**. If the task is performed today in a different way, monitor the task in operation. Write down the activities that the user does to complete the tasks in this step of the business process. Get into the details of the activities. When deciding on the activities, you'll want to consider cause and effect for each one, how they relate to each other, and how they move you closer to your desired objective. Identify the starting point of the process, and fill in the activities that lead to the objective. Activities can be sequential, meaning that one activity can't occur until the previous one is completed, or parallel, meaning that two or more activities can occur at the same time.

- **Identify what data is needed and where it's coming from**. Make a list of all data sources and observe where data is coming from. Is it from an internal system or an external data source? How do users authenticate to get the data? Are there different permission levels? Does the data change based on who is using the system?

- **Identify what data is created or edited**. Is a paper form or electronic form used to capture the data today? Such a form can serve as a starting point as you think about the layout of screens and how the data is captured. What is the data that's being captured? What is it called? Is this the real name from the data source or a common name that's used in this part of the business? You might need to map the name in the data source to the "friendly" name your users know.

- **Determine the decisions made as part of the user or system flow**. At the conclusion of this activity in the process, is a decision being made? Is there a way that the solution can make the decision automatically based on the data? Is there a hierarchy for the data? For example, each expense report can have multiple expenses, and some expense types require additional information. Is this decision communicated to anyone? How is it communicated? Are approvals needed before the next step of the process begins? How are those approvals captured? Is there a specific user or role that can approve the next step in the process?

- **List identified flows**. The interviews, documentation, and observation should enable you to identify all the flows in the workload. Compile a list of all the flows you identify and categorize them into user flows (focusing on user interactions) and system flows (focusing on back-end processes and data movement).

- **Define flow start and end points**. For each identified flow, clearly define where the flow starts and where it ends. For user flows, document each user interaction and its expected outcome. Focus on the user experience and interface design. For system flows, you need to identify underlying triggers and expected outcomes.

- **Break down each flow**. Break down each flow into individual steps, describing the actions, decisions, or processes that occur at each point. Note how each step interacts with other parts of the system, including dependencies on other flows or external systems. You should be able to pinpoint how flows integrate with and affect the workload and user experience. This dual approach provides a holistic view of your entire workload.

- **Document unique outputs**. Identify any alternative paths or exceptions within each flow, such as error handling or conditional branching. If a flow has multiple possible outcomes, you should add them to the catalog as distinct entries. For user flows, you should identify the intended behavior of the interaction. For system flows, you should identify the intended behavior of the process.

- **Visualize with diagrams**. Create flowcharts or diagrams to visually represent the flow and its steps. You can use tools like Microsoft Visio, Unified Modeling Language (UML) sequence diagrams, use-case diagrams, simple drawing tools, or a descriptive list in text format (see [Example flow catalog](#example-flow-catalog)).

- **Update flow mapping iteratively**. Flow mapping is an iterative process. Flows can change, split, or combine, especially in the design phase. As the workload flows become more clearly defined, you should update the catalog of flows to match. Validate and refine your flow diagrams with feedback from stakeholders to ensure accuracy and completeness.

### Identify business processes for each flow

Business processes are a series of tasks to achieve an output, such as expense reporting, annual leave management, order fulfillment, or inventory control. The identification of business processes for each flow involves mapping flows to one or more business processes. This mapping helps you understand the importance of each flow to the business.

You might have existing documentation or business plans that provide a mapping of flows to business processes. Sometimes user manuals, training materials, or system specifications can provide insights into the intended use and purpose of the workload and its flows. If not, you need to map flows to the business processes they support. Here are recommendations to identify business processes for each flow:

- **Use workload outputs**. You can use the workload outputs and flow breakdown to correlate flows with the business processes they support. First, review the outputs the workload generates. The output could be sales reports, data files, or completed tasks.

- **Conduct interviews**. Speak with team members and stakeholders who interact with the workload. You should ask specific questions about their daily tasks, how they use the workload, and what objectives they achieve with it. Technical teams often have a deeper understanding of the workload structure and can provide insights into the business processes it supports.

- **Monitor workload usage**. For existing workloads, monitor the workload and look for patterns in usage that indicate underlying business processes, such as data entry, order processing, or customer interaction.

- **Connect the output to a business process**. Connect the dots from the flow outputs to the overall business process they support. For example, if a flow step involves processing customer orders, then it directly supports the business process of order fulfillment. Order fulfillment contributes to the business objectives of maintaining customer satisfaction and generating revenue. Finally, use the flow breakdown to help determine which flow created the sales report.

### Identify process owners and stakeholders for each flow

The process owner for a flow is the individual who's responsible for the successful execution of a given process. They're responsible for that process and the flows that support it. You should identify the process owner for each workload flow. You should also identify the stakeholders for each flow. Stakeholders can be involved in the workload, have dependencies on a flow, or manage a dependency that the flow has.

You might have a responsibility assignment matrix (RAM) or Responsible, Accountable, Consulted, and Informed (RACI) matrix that already identifies process owners and stakeholders. Typically, process owners are responsible or accountable for a process, and you consult or inform stakeholders.

### Identify escalation paths for each flow

The identification of escalation paths is about determining channels for escalating issues related to a flow. Issues that need escalation could be urgent updates, security concerns, degradations, or technical incidents. The goal of identifying an escalation path is to ensure timely and effective resolution of issues.

The escalation path you map out should start with the person or group most likely to resolve a particular issue. If this person or group can't resolve the issue, the escalation path should identify the next point of contact. The next point of contact has broader responsibilities and can coordinate mitigation strategies with more parts of the organization. The number of people on an escalation path varies by flow and organization. Too many people on an escalation path can slow the resolution efforts.

### Identify the business impact of each flow

The identification of the business impact of each flow is essential for understanding how each flow contributes to key business objectives. Business impact could include performance improvement, direct or indirect cost savings, risk mitigation, or business transformation. By understanding both the positive and negative impact of each flow, you can prioritize efforts to ensure the reliability of the flows that matter the most to your business. It's important to consider the direct impact of flow failure and its indirect effect on other interconnected processes. Here are steps to identify the business impact of each flow:

- **Identify positive impact**. Determine the expected benefits when a flow runs as intended. The expected benefits could include improved operational efficiency and effectiveness, increased customer or employee satisfaction, improved data security, ensuring compliance with regulatory requirements, or any other positive effect on the business.

- **Identify negative impact**. Assess the potential negative impacts if a process fails or doesn't work as expected. Consider quantifying specific losses, such as revenue drops. Include subjective effects like damage to reputation, erosion of customer trust, or adverse effects on other related business processes.

- **Define capacity and availability assumptions**. Establish assumptions about the expected capacity and availability of each process. Consider factors like expected business hours and target percentage uptime. If there are expectations for recovery time objective (RTO) or recovery point objective (RPO), you should include these expectations. These assumptions help in understanding reliability requirements of each flow.

By systematically evaluating these aspects, you can gain a comprehensive view of how each flow impacts the business and make strategic decisions about reliability optimization.

### Assign a criticality rating to each flow

A detailed evaluation of flow importance relative to the overall business impacts allows you to assign a criticality rating to each flow. The purpose is to sort the flows by priority and assign a label that allows you to identify the critical flows. This process is a logical continuation of identifying, mapping, and aligning with business processes and impact. Use the following criticality descriptions to assign your critical ratings:

- **Critical (high criticality)**: Critical flows are integral to core business functions. They directly affect critical aspects of a business such as customer experience, financial transactions, security protocols, human health, and safety. The failure or disruption of these flows could lead to significant immediate or long-term negative effects. Examples of negative effects include loss of revenue, breach of trust, and legal issues. Prioritizing these flows ensures that the most crucial aspects of the workload are robust and resilient.

- **Important (medium criticality)**: Important flows fulfill part of a business function but don't directly interface with or affect critical business operations. For example, if an issue disrupts an internal data processing flow, you can retry the data processing without immediate external effects. These flows are essential for smooth operations but offer a buffer in terms of immediate customer or financial effect, allowing for managed responses to issues.

- **Productivity (low criticality)**: Productivity flows don't have a direct or significant effect on the core business functions or customer experience. Examples include ancillary processes and small team use cases like transferring files regularly to backup storage or processing feedback surveys. While these flows contribute to the overall system, their disruption is unlikely to cause significant immediate business or operational issues, and often a manual workaround exists.

By following this structured approach to assigning criticality, you can effectively prioritize resources and focus on maintaining and enhancing the reliability and effectiveness of your most critical flows.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Higher expectations for reliability sometimes coincide with higher operational costs and management burden for operators. Ensure that stakeholders understand the potential cost increases of improving the reliability of critical flows.

## Example flow catalog

The following example provides a complete scenario and illustrates important points to help you identify, map, and prioritize your flows. The example workload is a line-of-business app for expense reporting, which enables employees to fill in expense forms, managers to review and approve the expenses, and auditors to review weekly reports.

:::image type="content" source="media/identify-flows/image1.png" alt-text="Example business process flowchart showing the steps of filling in the expense report, getting it approved, entering the data into the accounting system, and creating reports.":::

### User flow 1: Fill in the expense form

**Flow description**: Employees use the application to fill in the expense form.

- **Business processes**: This flow supports **filling in and submitting the expense form**, but it's asynchronous, making it less critical.

- **Process owner**: Business admin

- **Stakeholders**: Employees, line manager, business admin

- **Escalation paths**: Application team, platform team

- **Business impact**: This flow is important for employees to claim expenses, but it doesn't directly influence the main revenue stream of the business or have a direct customer impact. When employees are unable to create expense claims due to unavailability of this flow, it doesn't have a negative impact on the revenue or reputation of the company. Employees can file expenses at a later time. A prolonged downtime might lead to credit card surcharges if payments of expenses are missed. However, high availability isn't essential for this process. The business admins specified a requirement of 90% availability for this process and are agreeable to downtime outside of business hours for maintenance purposes.

- **Criticality rating**: Productivity (Low)

### User flow 2: Review and approve expenses

**Flow description**: Line managers of the employee review and approve the expense claim.

- **Business processes**: This flow supports the **reviewing and approving of expense claims**, but it's an asynchronous process.

- **Process owner**: Business admin

- **Stakeholders**: Employees, line manager, business admin

- **Escalation path**: Application team, platform team

- **Business impact**: This flow allows line managers to review and approve expense claims and request more details. High availability of this flow isn't critical, since line managers have seven days to approve expense claims. When employees are unable to create expense claims due to unavailability of this flow, it doesn't have a negative impact on the revenue or reputation of the company. Employees can file expenses at a later time. A prolonged downtime might lead to credit card surcharges if payments of expenses are missed. However, high availability isn't essential for this process. The business admins specified a requirement of 90% availability for this process and are agreeable to downtime outside of business hours for maintenance purposes.

- **Criticality rating**: Productivity (Low)

### User flow 3: Enter and post transactions

**Flow description**: Business admins need to review expenses and post transactions for credit cards to be paid.

- **Business processes**: This flow supports the payment of credit card charges.

- **Process owner**: Business admin

- **Stakeholders**: Business admin, platform team, data team

- **Escalation path**: Platform team, data team, platform team on-call engineer

- **Business impact**: This flow is integral to paying expenses, and missing payments could lead to credit card charges. However, there's usually enough time between expenses being filed and payment being due. The business admins specified a requirement of 90% availability for this process and are agreeable to downtime outside of business hours for maintenance purposes.

- **Criticality rating**: Medium

### System flow 4: Create weekly expense report

**Flow description**: A weekly report of expenses is created for the CFO to review. The report is generated and published to Power BI, and a notification is sent to the CFO.

- **Business processes**: This flow supports the review of expenses.

- **Process owner**: CFO

- **Stakeholders**: Business admin, all technical teams

- **Escalation path**: Application team on-call engineer, platform team on-call engineer, data team on-call engineer

- **Business impact**: Unavailability of this flow doesn't affect the revenue or reputation of the company. The business admins specified a requirement of 90% availability for this process and are agreeable to downtime outside of business hours for maintenance purposes.

- **Criticality rating**: Medium

### User flow 5: Audit expenses

**Flow description**: External auditors perform just-in-time audits of expenses to check whether the reports meet compliance requirements.

- **Business processes**: This flow directly supports the **compliance and auditing processes**. Without this functionality, the company might face fines from external auditors.

- **Process owner**: Platform team

- **Stakeholders**: Platform team, operations team, business admins

- **Escalation path**: Platform team on-call engineer

- **Business impact**: This flow requires high availability because external auditors can request reporting of expenses without warning or notification. If this flow isn't available, it could lead to fines. It's a key process that the business expects 99.9% uptime for, including during extended business hours.

- **Criticality rating**: High

## Power Platform facilitation

Use [Plan designer](/power-apps/maker/plan-designer/plan-designer) to describe your business case in natural language and provide information, like business process flows or screenshots of legacy systems. Plan designer will then generate a complete Power Platform solution tailored to your needs. Plan designer also generates process diagrams to help you clarify user interactions.

Consider using [process mining and task mining in Power Automate](/power-automate/process-advisor-overview) including a [process map](/power-automate/process-advisor-visualize), a powerful tool that can help you visualize and analyze your business processes.

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
