---
title: Recommendations for formalizing software development management practices
description: Learn how to establish standards for managing your workload team's software development practices.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: sericks
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for formalizing software development management practices

**Applies to this Well-Architected Framework Operational Excellence checklist recommendation:**

|[OE:03](checklist.md)| Formalize the software ideation and planning process, drawing from established industry and organizational standards. Use a common, prioritized backlog and sufficiently detailed specifications. Drive continuous improvements in the planning process based on outcomes. |
|---|---|

This guide describes the recommendations for managing workload development practices in accordance with established standards. Your team's ability to produce high quality software relies on a structured, collaborative approach to development planning. This means workload teams understand and are able to clearly communicate the work that is being done to their stakeholders, they have a clear view of the work to be done in a development cycle and everyone is aligned around the “why” of the work to be done. Established standards define how development practices should be performed and allow the workload team to collaborate effectively, reducing the risk of confusion on goals and expectations.

## Key design strategies

Formalize your workload development practices to help ensure that everyone is aligned around the “why” of the work that is being done. 

Don’t treat low code workloads as low complexity, you will still benefit from formalizing the development and management of low code workloads. Learn from your other software development teams. Have a decision matrix in place that dictates what level of formalization is required based on the complexity and criticality of the workload. 

## Standards for development planning

- **Prioritization**: Prioritization means planning the order and scope of the work and involves understanding the true impact and value of workload features on the business, as well as evaluating those impacts against other work requests and the overall roadmap for your product or program. One way to prioritize workloads is by evaluating the business value of the entire workload ([Measuring the business value of Power Platform solutions - Power Platform | Microsoft Learn](/power-platform/guidance/adoption/business-value)), but it may be also be useful to evaluate individual workload features for the business value. 
- **Categorize** solutions built based on criticality—this will allow you to come up with processes that ensure that critical applications have the necessary guardrails to support them while at the same time not stifling innovation of productivity scenarios.
- **Collaboration**: The process of defining proposed changes to the workload should be a collaborative effort. Most changes to the workload will impact multiple functions and/or components, so involving as many workload team members as possible will help ensure that important considerations are not missed and that everyone is aware of the impact on their particular domain. Collaboration also helps clearly define the scope of a change and how to divide the necessary tasks needed to accomplish the change into well-defined work items, as a larger group with expertise across domains will be able to provide experience-backed estimates for the required effort.
- **Tools**: Use established, industry-proven tools and processes, like [Agile](/devops/plan/what-is-agile-development), [Scrum](/devops/plan/what-is-scrum), and [Kanban boards](/devops/plan/what-is-kanban). 

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Agile methodology can become too strict if it's overly prescriptive. Strive for a balance between well-defined standards and innovation.

- **Deployment**: Plan to use frequent small, iterative deployments instead of large infrequent deployments. 
- **Terms**: Standardize your definition of _finished_ development cycles to help ensure that supporting functions, including testing, documentation, and accessibility features, are successfully completed.
- **Communication**: Define the standard protocols for product owners and project managers to promote upcoming releases.
- **User stories**: Standardize a template for user stories. Well-written user stories should follow the INVEST approach:
  - I - Independent: Each user story should be independent of others, allowing the team to deliver in small incremental steps.
  - N - Negotiable: User stories should be negotiable and open to discussion and change.
  - V - Valuable: User stories should provide value to the end customer.
  - E - Estimable: User stories should be estimable and have a clear definition of done.
  - S - Small: User stories should be small and focused on a single feature.
  - T - Testable: User stories should be testable and have clear acceptance criteria.<br><br>By following these characteristics, workload teams can ensure that their user stories
- **Acceptance criteria**: Standardize a template for acceptance criteria. Ensure that acceptance criteria relates specifically to the user story and can be unambiguously proven using one or more acceptance tests.
- **Tracing**: Ensure that the development process is traceable. You should clearly trace the state of your production workload and the associated code back to quality assurance testing, acceptance criteria, user stories, and features. Detailed tracing might also be a regulatory requirement in some cases, like healthcare, for example.
- **Review**: Regularly perform internal audits of your development practices via development cycle retrospectives and postmortems. Process reflection should be blameless and should focus on learning that can be applied as improvements. Ensure that the team reflects on how effective the user story and tasks were in defining the necessary tasks and on the accuracy of time estimates.
- **Reports**: Standardize reports for stakeholders that provide useful metrics focusing on change. Focusing on change allows you to track product acceleration and deceleration. Helpful metrics can include changes in:
  - The monthly growth rate of adoption.
  - Performance.
  - Training time.
  - The frequency of incidents.

Reporting shouldn't be used as a tool to evaluate the work of individuals, so avoid metrics like story points or lines of code for each engineer.

## Power Platform facilitation

Although there are no Power Platform products that directly facilitate this recommendation, you can use other tools in the Microsoft stack. [Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards) is a web-based service that enables teams to plan, track, and discuss work across the entire development process. It's well suited for Agile-based development practices.

[GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects) is a customizable project management tool that can organize projects and integrates by using issues and pull requests in GitHub.

## Related links

- [Best practices for Agile project management](/azure/devops/boards/best-practices-agile-project-management)
- [Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards)
- [User support strategy - Microsoft Power Platform - Power Platform | Microsoft Learn](/power-platform/guidance/adoption/support-strategy-solutions)
- [Measuring the business value of Power Platform solutions - Power Platform | Microsoft Learn](/power-platform/guidance/adoption/business-value)
