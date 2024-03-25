---
title: Recommendations for formalizing software development management practices
description: Learn how to establish standards for managing your workload team's software development practices.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: robstand
ms.date: 03/15/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for formalizing software development management practices

**Applies to this Well-Architected Framework Operational Excellence checklist recommendation:**

|[OE:03](checklist.md)| **Formalize the software ideation and planning process, drawing from established industry and organizational standards. Use a common, prioritized backlog and sufficiently detailed specifications. Drive continuous improvements in the planning process based on outcomes.** |
|---|---|

This guide describes the recommendations for managing workload development practices in accordance with established standards. Your team's ability to produce high quality software relies on a structured, collaborative approach to development planning. This means workload teams understand and can clearly communicate the work that is being done to stakeholders. More precisely, workload teams should have a clear view of the work to be done in a development cycle and ensure that all stakeholders are aligned on the "why" of the work to be done. Established standards define how development practices should be performed and allow the workload team to collaborate effectively, reducing the risk of confusion on goals and expectations.

## Key design strategies

Formalize your workload development practices to help ensure a common understanding of the goals and expectations.

> [!NOTE]
> Don't treat low code workloads as low complexity. You'll still benefit from formalizing the development and management of low-code workloads. Learn from other software development teams. Have a decision matrix in place that dictates the level of formalization required based on the complexity and criticality of the workload.

### Standards for development planning

The following standards can help you design a comprehensive development planning strategy.

- **Prioritization**: Planning the order and scope of the work involves understanding the true impact and value of workload features on the business. It also includes evaluating those impacts against other work requests and the overall roadmap for your product or program. One way to prioritize workloads is by [evaluating the business value](/power-platform/guidance/adoption/business-value) of the entire workload. You might also find it useful to evaluate individual workload features for the business value.

- **Categorization**: Establish processes that ensure that critical applications have the necessary guardrails to support them. At the same time, ensure that productivity scenarios are not slowed down or stifled by too many rigorous processes.

- **Collaboration**: The process of defining proposed changes to the workload should be a collaborative effort. Most changes to the workload will impact multiple functions and/or components, so involving as many workload team members as possible will help ensure that important considerations are not missed and that everyone is aware of the impact on their particular domain. Collaboration also helps clearly define the scope of a change and how to divide the necessary tasks needed to accomplish the change into well-defined work items, as a larger group with expertise across domains will be able to provide experience-backed estimates for the required effort.

- **Tools**: Use established, industry-proven tools and processes, like [Agile](/devops/plan/what-is-agile-development), [Scrum](/devops/plan/what-is-scrum), and [Kanban boards](/devops/plan/what-is-kanban).

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Agile methodology can become too strict if it's overly prescriptive. Strive for a balance between well-defined standards and innovation.

- **Deployment**: Plan to use frequent small, iterative deployments instead of large infrequent deployments.

- **Terms**: Standardize your definition of *finished* development cycles to help ensure that supporting functions, including testing, documentation, and accessibility features, are successfully completed.

- **Communication**: Define the standard protocols for product owners and project managers to promote upcoming releases.

- **User stories**: Standardize a template for user stories. Well-written user stories should follow the *INVEST* approach:

  - I&ndash;Independent: Each user story should be independent of others, allowing the team to deliver in small incremental steps.
  - N&ndash;Negotiable: User stories should be negotiable and open to discussion and change.
  - V&ndash;Valuable: User stories should provide value to the end customer.
  - E&ndash;Estimable: User stories should be estimable and have a clear definition of done.
  - S&ndash;Small: User stories should be small and focused on a single feature.
  - T&ndash;Testable: User stories should be testable and have clear acceptance criteria.

- **Acceptance criteria**: Standardize a template for acceptance criteria. Ensure that acceptance criteria relate specifically to the user story and can be unambiguously proven using one or more acceptance tests.

- **Tracing**: Ensure that the development process is traceable. You should clearly trace the state of your production workload and the associated code back to quality assurance testing, acceptance criteria, user stories, and features. Detailed tracing might also be a regulatory requirement in some cases, like healthcare, for example.

- **Review**: Regularly perform internal audits of your development practices via development cycle retrospectives and postmortems. Process reflection should be blameless and should focus on learning that can be applied as improvements. Ensure that the team reflects on how effective the user story and tasks were in defining the necessary tasks and on the accuracy of time estimates.

- **Reports**: Standardize reports for stakeholders that provide useful metrics focusing on change. Focusing on change allows you to track product acceleration and deceleration. Helpful metrics can include changes in:
  - Monthly growth rate of adoption
  - Performance
  - Training time
  - Frequency of incidents

  Reporting shouldn't be used as a tool to evaluate the work of individuals, so avoid metrics like story points or lines of code for each engineer.

## Power Platform facilitation

Although there are no Power Platform products that directly facilitate this recommendation, you can use other tools in the Microsoft stack. [Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards) is a web-based service that enables teams to plan, track, and discuss work across the entire development process.

[GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects) is a customizable project management tool for organizing projects and integrates with your issues and pull requests in GitHub.

## See also

- [Best practices for Agile project management](/azure/devops/boards/best-practices-agile-project-management)
- [Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards)
- [User support strategy](/power-platform/guidance/adoption/support-strategy-solutions)
- [Measuring the business value of Power Platform solutions](/power-platform/guidance/adoption/business-value)
