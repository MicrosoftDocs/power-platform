---
title: "Set up Admin tasks component | MicrosoftDocs"
description: "The admin tasks component contains a model driven app for managing your admin tasks."
author: stjeffer, joalva
manager: phtopnes

ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/14/2020
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Use Power Platform Administration Planning component

Organizations have unique requirements for governance and administration of Power Platform, making standardized guidance for planning administration, and best practices for customers hard.  

The Power Platform Administration Planning solution aims to help provide insights to organizations to help plan and analyze if:

1. Your organization is setting up an administration team.  Knowing which administrative tasks need to be performed, the frequency, how long they take & what level of expertise is required is a common challenge.
1. Your organization already administrates Power Platform. Having access to insights about:
    1. Where you focus time (for example: reporting, security, configuration). 
    1. Understanding how reactive / proactive your team is.
    1. The effects that automation and outsourcing have (or can have) on the team workload

Help your team mature.

## What is the Power Platform Administration Planning component?

The Power Platform Administration Planning component contains:

1. A Dataverse table for storing administrative task data.
1. A Power Apps Model Driven App to manage tasks.
1. A Power BI dashboard providing insights.
1. A Microsoft Excel spreadsheet containing sample admin tasks.

> [!NOTE]
> The sample admin tasks provided have been compiled based on the most common administrative tasks performed in:
>
> - AI builder
> - Power Pages
> - Power Apps
> - Power Automate
> - Power Virtual Agents
> - Environments, DLP and connectors

## How to use the Power Platform Administration Planning component.

Follow the steps describing how to [set up and configure](setup-admin-tasks-component.md) the Power Platform Administration Planning component.

If you imported the sample admin task data, it's recommended you review the tasks in the model driven app and modify the following fields to your requirements, via the Admin tasks app:

1. Frequency
1. Duration
1. Anticipated task iterations

If you want to start by adding your own tasks, the table below describes the fields used to define a task:

| Column | Value type | Description |
|---|---|---|
| Name | Text | A short description of the task, for example: 'Create an environment' |
| Task description | Text | A detailed description of the task |
| Task documentation link | Text (URL format) | URL to documentation | 
| Active task | Two options (boolean) | Specifies if the task is performed in your organization |
| Outsourced task | Two options (boolean) | Specifies if the task is outsourced |
| Automation | Two options (boolean) | Specifies if the task is automated |
| Frequency | Choice | Specifies the frequency that the task is performed |
| Anticipated task iterations | Number - Business rule calculation | How many times in a year do you anticipate performing this task |
| Duration | Number | Specifies how long the task should take to complete |
| Experience required | Choice | Specifies the level of experience required to complete the task |
| Core admin persona | Choice | Specifies the role that usually performs the task |
| Peripheral admin persona | Choice | Specifies other roles required to complete the task |
| Primary task category | Choice | Specifies the primary category for the task, for example: Security |
| Secondary task category | Choice | Specifies the secondary category for the task, for example: Reporting |
| Product or service | Choice | Specifies the product or service, for example: AI Builder, Power Apps |

### How to use the Power BI dashboard

The dashboard is structured in a way to help you focus on what you do, how reactive your team is and the impact that automation and outsourcing have on overall efficiency.

#### Team, outsourcing and automation

![Team, outsourcing and automation](media\PPAP-TeamOutsourcingAndAutomation.png "Team, outsourcing and automation dashboard section")

This section aggregates administrative task data and indicates:

1. **Team workload**: enter the number of team members, and based on aggregated task data (duration, anticipated number of iterations & frequency) the number of hours required per day are calculated.  This is then divided by the number of team members, and 80% of an 8 hour working day to estimate if you have enough people in your team.
1. **Outsourcing**: this illustrates the impact that outsourcing is having on your overall workload.  The number of tasks, expertise required and duration (hours) are used to display this.
1. **Automation**: this illustrates how much time is being saved, what this translates into resources and the expertise required.

#### Task breakdown - proactive & reactive balance

![Task breakdown - proactive & reactive balance](media\PPAP-TaskBreakdownProactiveAndReactiveBalance.png "Task breakdown - proactive and reactive balance")

This section helps focus on how many tasks are ad-hoc, or reactive. By displaying the percentage of tasks that have been categorized as ad-hoc and providing a filtered list, it encourages you to look for automation, outsourcing or innovation opportunities.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]