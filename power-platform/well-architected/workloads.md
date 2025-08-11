---
title: Power Platform Well-Architected workloads
description: Learn about workloads in the context of Power Platform Well-Architected.
author: robstand
ms.author: rstand
ms.date: 08/05/2025
ms.topic: concept-article
---

# Power Platform Well-Architected workloads

Power Platform Well-Architected uses the term _workload_ to describe a set of application resources, data, and supporting infrastructure that work together to deliver desired business outcomes. A workload comprises application and technology components as well as behavioral, development, and operational processes.

Workloads are designed by architects and built by a workload team. They meet functional and nonfunctional business needs. Workloads have many types.

Typical criteria for workload classification include:

- Utility, characteristics, and usage patterns of a workload.
- Key influential drivers.
- Intended target audience.
  
Workloads that are in the same class can share similarities, including their target audience, compliance requirements, and technology stacks. The five pillars of Power Platform Well-Architected, their principles, checklists, and tradeoffs are relevant for all workload classes.

Apply the pillar guidance to technical design principles and design areas that represent the priorities of your workload. Follow the recommendations to help set up a successful workload and to align it with Power Platform Well-Architected.

## What is a Power Platform Well-Architected workload?

The design and operations of any workload must consider the five architectural pillars: Reliability, Security, Operational Excellence, Performance Efficiency, and Experience Optimization.

|:::image type="icon" source="./_images/goal.svg"::: To create a successful workload, develop it according to Power Platform Well-Architected principles.|
|---|

A Power Platform Well-Architected workload:

- Has requirements that describe what the system should do and how well it should do it, and that are ranked by importance to achieve a goal.
- Is designed so you can achieve those requirements by using resources and incorporating design patterns and tradeoffs.
- Is built and operated to the specifications of a design and purpose.
- Is measured by how well it achieves its purpose.
- Can adapt as its purpose is refined or changed.
- Is just as reliable as it needs to be.
- Is just as secure as it needs to be.
- Is developed and operated responsibly.
- Accomplishes its purpose within an acceptable time period.
- Provides an experience that ensures users are successful.

A collaboration between the workload team and central teams of an organization must create a workload with the preceding characteristics. The following sections describe these teams and their functions.

## Workload team

Create a workload team that has team members with a wide range of technical and business disciplines. The primary focus of all team members should be the success of the workload.

|Examples of workload team members|&nbsp;|
|---| ---|
|Business stakeholders<br>Developers or software engineers <br>Solution architects <br>Data analysts <br>Database administrators <br>|Makers<br>Security architects or engineers <br>Infrastructure engineers <br>Product managers or owners <br>Quality assurance (QA) engineers <br>Support team members <br>|

## Centralized teams and stakeholders

The workload team often receives support from centralized teams. These teams offer support functions and enforce governance for many or all of the organization's cloud workloads. Centralized teams aim for the success of the organization, which depends partly on the performance of its workloads. They provide services, guidance, and guardrails for workloads.

|Examples of centralized teams and team members|&nbsp;|
|---| ---|
|Business intelligence analysts<br>Business stakeholders<br>Center of Excellence (CoE) board<br> Platform team<br> Cybersecurity analysts<br>Database administrators<br>Enterprise architects<br>|Business analysts<br>Infrastructure engineers<br>Legal and compliance officers<br>Network engineers<br>Procurement specialists<br>Project managers<br>|

A Power Platform Well-Architected workload team focuses on workload outcomes. They coordinate with and benefit from the specialized support from centralized team members.

## Fulfill requirements

Throughout Power Platform Well-Architected, recommendations coincide with the purpose and expected outcomes of the workload. Recommendations are not explicit about which team member or team facilitates the obligations of the workload. You can decide who should perform each action by performing workload-level mapping to determine your team's roles and responsibilities related to the workload type and criticality.

The direct workload team handles most workload requirements. Some requirements are handled as a joint effort with centralized teams. For example, the implementation choices might be based on guardrails that a centralized team sets. Or a centralized team might exclusively handle the implementation choices.

Your workload team must build a working relationship with other teams to help cooperatively deliver on workload goals. If you outsource components or responsibilities, you must successfully deliver on those obligations.

## Learn the constraints

A centralized team supports diverse workloads based on the team's core capabilities and core infrastructure. To provide this support on an organizational scale, the centralized team might implement uniformity and constraints on the service offered or the infrastructure. As you design your workload, it's critical that you understand those constraints and, where possible, partner with enterprise architects who know those constraints. Learn from prior implementations as much as possible.

## Explicitly communicate requirements

When your workload requirement encounters a limitation or a service-level agreement (SLA) that is vague about a core capability or infrastructure offering, consider that as a risk. Your workload team should explain to the other teams how this issue impacts the workload. You might need to adjust the workload requirements, design, or implementation, or modify the infrastructure offering.

When you understand the platform team's obligations related to organizational directives and your workload team's obligations, you can communicate workload requirements with realistic expectations and recommendations.

## Look for unified wins

Shared responsibility isn't just about tradeoffs, constraints, and compromise. Platform teams often have highly specialized skills and dedicated budgets that can augment beyond what an individual workload team can sustain. Consider the following examples.

**Security specialists.** Your workload might have a secure development lifecycle. As a centralized security team performs secure development tasks at scale across your organization, it might perform routine penetration testing that's above and beyond your efforts. It might also help with planning and performing an incident response strategy.

**Enterprise architecture guidance.** You can save time and effort if you align with an enterprise architecture team's patterns and practices because the team has already streamlined the processes. You can also prevent rework if a solution isn't possible within the partnership without negotiation.

Platform teams often provide self-service options to workload teams for various activities, such as providing a documentation repository for self-guided education.

Explore self-service options that might be suitable for your workload.

## Share successes and challenges

Collaborating with other teams also means celebrating and acknowledging the outcomes and difficulties of a workload. When your workload fulfills its requirements and achieves the desired value, let your partner teams know that. Show them how they helped the workload's success. When your workload falls short of its requirements, share the problems and work together and adjust to get back on track.

Platform teams also have obligations and success criteria. You should expect your partners to tell you whether your workload works well with an offering or if it's at risk of being a noisy neighbor.

## Strive for continuous improvement

Continuous improvement is a theme among all Power Platform Well-Architected. Be open to change. You may encounter new ways to solve existing problems, use new technology, meet new demands, or work under new limitations. As your workload evolves over time, encourage the same attitude from your collaborating teams. However, every improvement opportunity also involves changes and should be backed by a suitable management process.

Workload teams need to inform platform teams about any planned changes to workload needs that could affect the platform team's services. Similarly, platform teams need to involve their workload partners in change management processes and communicate clearly about any significant platform changes. Set up a regular communication schedule with partners to understand and share how a product develops.

## Achieve a successful outcome

Workloads face many demands from various stakeholders, such as users, shareholders, regulators, employees, the center of excellence, and chief experience officers. Such demands can make it hard to choose a clear direction. Power Platform Well-Architected helps you make sense of the design and implementation by explaining the reasons for architectural choices to achieve a positive result. Build a successful workload, and celebrate that success with your organization.
