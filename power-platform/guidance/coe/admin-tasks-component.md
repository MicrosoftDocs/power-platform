---
title: "Using the Power Platform administration planning component | Microsoft Docs"
description: "Get insights into the tasks and time involved in administering Power Platform."
author: stjeffer

ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/07/2022
ms.subservice: guidance-toolkit
ms.author: stjeffer
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Use Microsoft Power Platform administration planning

Behind the scenes, your IT and Center of Excellence team spends time configuring, managing and nurturing the adoption of Microsoft Power Platform. Understanding how that time is spent can help you plan who you need on your team and find the highest-impact opportunities to streamline the administrative effort.

Microsoft Power Platform administration planning is designed to help you:

- Better plan your team structure.
- Review where you spend time, and look for automation or innovation opportunities.

Each organization has unique requirements for governance and administration of Microsoft Power Platform. The Microsoft Power Platform administration planning solution provides insight to your administrative tasks.

- If your organization is setting up an administration team, common challenges include knowing which administrative tasks need to be performed, their frequency, how long they take, and what level of expertise is required. The solution helps you get started by listing more than 70 common administrative tasks across Microsoft Power Platform.

- If your organization already administers Microsoft Power Platform, you can get insights into your effort, such as:

  - Where your team focuses time (for example reporting, security, configuration).
  - Understanding how reactive or proactive your team is.
  - The effects that automation and outsourcing have (or could have) on the team's workload.
  - What level of experience is required to complete various administrative tasks.
  - How many tasks rely on other teams and departments.

## What's in the Power Platform administration planning component?

The solution is built on Microsoft Dataverse. Admin tasks are defined in a model-driven app, and insights are provided in a Power BI dashboard.

You can start either by adding your own tasks or importing a set of example tasks from an Excel workbook that has been populated with some of the most common administration tasks, covering:

- AI Builder
- Power Apps
- Power Automate
- Power Pages
- Microsoft Copilot Studio
- Environments, data loss prevention (DLP) policies, and connectors

To set up the component, go to [Set up the Microsoft Power Platform administration planning component](setup-admin-tasks-component.md).

## Update the admin task data

The dashboard and insights this solution provides derive from admin task data that you interact with via the Admin Tasks app. Open the Admin Tasks app to manage the task list. Try to review task metadata frequently (monthly or quarterly), so that the dashboard accurately represents data.  

The table below describes the fields used to define a task.

| Column | Value type | Description |
|---|---|---|
| Name | Text | A short description of the task, for example "Create an environment" |
| Task description | Text | A detailed description of the task |
| Task documentation link | Text (URL format) | The URL of documentation about the task |
| Active task | Two options (Boolean) | Specifies whether the task is performed in your organization |
| Outsourced task | Two options (Boolean) | Specifies whether the task is outsourced |
| Automation | Two options (Boolean) | Specifies whether the task is automated |
| Frequency | Choice | The frequency with which the task is performed |
| Anticipated task iterations | Number | How many times in a year you anticipate performing this task (Unless you select **Ad-hoc**, this column is populated for you by a business rule that calculates the number of iterations based on the value of the **Frequency** column.)|
| Duration | Number | How long the task should take to complete, in minutes |
| Experience required | Choice | The level of experience required to complete the task |
| Core admin persona | Choice | Who in the core team will primarily perform the task, for example Environment Admin or Product Owner |
| Peripheral admin persona | Choice | Who else is required to complete the task, for example Microsoft Entra Administrator or SharePoint Administrator |
| Primary task category | Choice | The primary category for the task, for example Security |
| Secondary task category | Choice | The secondary category for the task, for example Reporting |
| Product or service | Choice | The product or service, for example AI Builder or Power Apps |

## Use the Power BI dashboard

The dashboard is structured in a way to help you focus on what you do, how reactive your team is, and the effect that automation and outsourcing have on overall efficiency.

### Team, outsourcing, and automation

:::image type="content" source="media/PPAP-TeamOutsourcingAndAutomation.png" alt-text="Screenshot showing Team workload, Outsourcing, and Automation sections in the dashboard.":::

The first section of the report contains aggregated administrative task data, illustrating:

- **Team workload**: Enter the number of team members in the dashboard input box, and—based on aggregated task data (duration, anticipated number of iterations, and frequency)—the number of hours required per day is calculated. It's then divided by the number of team members and 80&nbsp;percent of an eight-hour workday to estimate whether you have enough people on your team.
- **Outsourcing**: Illustrates the effect that outsourcing is having on your overall workload. The number of tasks, expertise required, and duration (hours) are displayed.
- **Automation**: Illustrates how much time is being saved, how it translates into resources, and the expertise required.

### Task breakdown - proactive & reactive balance

:::image type="content" source="media/PPAP-TaskBreakdownProactiveAndReactiveBalance.png" alt-text="Screenshot showing the Task breakdown - proactive & reactive balance section of the dashboard.":::

This section of the report focuses on how many tasks are reactive ("ad-hoc"). You can filter the list and analyze the percentage of tasks that have been categorized as ad-hoc to look for automation, outsourcing, or innovation opportunities.

### Task breakdown - experience & personas

:::image type="content" source="media/PPAP-ExperienceAndPersonas.png" alt-text="Screenshot showing the Task breakdown - experience & personas section of the dashboard.":::

This section of the report aggregates duration for all tasks, grouped by task frequency, and provides insight into:

- **Experience levels required**: Illustrates the experience required across all tasks, which can be useful in estimating training requirements for your existing team.
- **Core admin persona** and **peripheral admin persona**:  Illustrates how many tasks are assigned to the different personas in your core administration team and how many tasks require other teams to complete. For example, creating an environment might require the Power Platform administrator and a Microsoft Entra administrator to create the environment and security groups for managing access.

### Task overview - categorization

:::image type="content" source="media/PPAP-TaskOverviewPersonaAndCategorization.png" alt-text="Screenshot showing the Task breakdown - experience, persona and categorization section of the dashboard.":::

Tasks are categorized to show where your team spends the most time. Tasks have a primary and secondary category to provide further insight into where your administration team spends their time. Selecting a category refines a list of tasks to provide further insight.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
