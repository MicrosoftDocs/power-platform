---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator maturity model"
description: "Apply Power Platform Maturity to decide when to use ALM Accelerator using the Center of Excellence (CoE) and Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Maturity model

The [Power CAT adoption maturity model](https://aka.ms/powercatadoptionmaturity) provides a set of levels and capabilities that can be used to evaluate usage of the Application Lifecycle Management (ALM) and how the ALM Accelerator for Power Platform (AA4PP) can assist.

## Quick start

![Decision Tree](./decision-tree.png)

AA4PP is a good match if you can check to see if the following apply:

1. What is the impact of the solution?
   - Are the applications classified as Critical or High [Business Impact](#business-impact)?
   - Who is using the application?
      - Is this a Productivity application used by everyone in your organization?
      - Is it used by Senior Leadership to make business impact Decisions?
      - Is it integrated with External users, for example,  Partners / Customer who will rely on solution as part of external process?
   - Are there specific Compliance and Auditing needs?
      - How important is tracking and auditing who is using the application?
      - Is there compliance and auditing requirements of the solution?

1. Do you have the prerequisites in place?
   - Do you have a defined [Environment strategy](../before-you-start.md#power-platform) for Development, Validation, Test, and Production?
   - Do you use Azure DevOps or can you integrate with Azure DevOps for Source Control and Build Pipelines?
   - Do you have license prerequisites in place?
     - Do you have Basic or above Azure DevOps licenses for Makers?
     - Per App or Per User Power Apps licenses to access the AA4PP Maker Solution?

1. Are you looking to move to Level 300 - Defined or beyond?

1. Administration
    - Do you have Environment Strategy in place?
    - What is the request strategy for environments?
      - Do you have a process to create Development / Test and Production Environments?
      - Is the process automated to request environments?

1. Are Source control concepts understood?
    - Is [Branching and Merging](/azure/devops/repos/git/git-branching-guidance) understood?
    - Are [Pull Request](/azure/devops/repos/git/git-branching-guidance?#review-and-merge-code-with-pull-requests) used to review and merge changes?
    - Are [Build Pipelines](/azure/devops/pipelines/get-started/key-pipelines-concepts) used to integrate and deploy between Validation and Test, Production environments?

1. Are [Fusion development](/learn/paths/transform-business-applications-with-fusion-development/) teams engaged to include Low code and Pro code teams?

1. Are your professional development teams familiar with [Branching and Merging](../branching-and-merging.md) strategies and able to assist makers?

1. Do your Pro Code and Operations teams manage Azure Pipelines?

1. Are you a Pro code team creating components in JavaScript?

1. Are you integrating with OpenAPI enabled Web APIs?

1. Are you using or planning to creating [plugins](/powerapps/developer/data-platform/plug-ins) to extend business process in Dataverse?

1. Support
   - Who is supporting the application / solution?
   - Do you have formal support team to manage issues for the solution?

## Addressing gaps

Where some gaps exist from the leading questions, then consider what proactive training and or workshops can help grow the maturity of people, process, and technology to assist them in moving toward Advanced Maker integration inside your organization.

## Leading questions

### Alignment

The following questions may help with qualifying alignment:

1. Is innovation driven by Business Areas (bottom up)?

1. Is there a Common vision between IT and Business?

1. Is there a Dedicated Power Platform product owner?

1. Is there an established [Center of Excellence team](/power-platform/guidance/adoption/coe)?

1. Is Power Platform a key part of the digital transformation strategy?

### Impact

The following questions may help with qualifying impact:

1. Is the Power Platform targeting low complexity scenarios?

1. Is there limited reuse of common components and services?

1. Do applications allow Bottom up and top down innovation?

1. Do applications focus on increased delivery efficiency, supporting rapidly changing business needs?

1. Are there organization-wide initiatives to deliver large-scale integrated apps?

### Strategy

The following questions may help with qualifying strategy:

1. Is the Power Platform strategy defined?

1. Is there a demand management process in place?

1. Is there a defined understanding of Power Platform's role in your organization’s IT portfolio?

1. Are business plans shared across departments?

1. Is Vision and strategy understood by all?

1. Do Enterprise Architecture decisions include Power Platform capabilities?

### Business value

Evaluate the business value looking at:

### Business strategy viability

Leading questions to consider:

1. What Business outcomes will this solution realize?

1. What is the expected time frame?

1. What do you do well today?

1. What do you want to do today better?

1. What thing do you want to do differently?

## Technological viability

Leading questions to consider:

1. What are manual steps vs automated steps?

1. How measurable are the qualitative and quantitative outcomes?

1. What is the dashboard/report capability to allow stakeholders to visualize and drill into and tack action on data?

1. How available are analytics?

1. On what frequency are analytics updated?

1. How frequently are changes required?

1. What is the technical debt that needs to be accounted for?

1. What are the security implications?

## Financial Viability

Leading questions to consider

1. What is the economic value added?

1. Does this address current market model or is a new model being developed?

1. What time horizon for implementation?

1. What investment model is required?

## Business impact

### Critical

Production, operations, or deployment deadlines will be severely affected, or there will be a severe impact on production or profitability. Multiple users or services are affected.

Initial Response time < 60 minutes with 24x7 access.

Issues demand an immediate response and require 24x7 operation, every day.

### High

The system has moderate business impact and can be dealt with during business hours. The expected usage could be by multiple users or single users, customers.

Initial Response time 2, 4 Hours, or Next Day, Business hours access with 24x7 available support.

### Non-critical

The system has minimal business impact. The issue is important but does not have a significant current service or productivity impact. Acceptable workarounds will be considered.

Initial Response time 4-8 hours or greater with Business hours access and support (For example 9:00AM - 5:00PM).

#### Administration and governance

Leading questions to consider:

1. Who can create environments?

1. What [Data Loss Prevention (DLP)](/power-platform/admin/wp-data-loss-prevention) policies are in place?

1. [Power Platform Service Admin](/power-platform/admin/overview-role-powerapps-admin) roles exist to Administer Power Platform tenants and Environments?

1. Are tenants / environments isolated from each other?

1. Is there monitoring in place?
   - Has the [CoE Starter Kit – Core](/power-platform/guidance/coe/core-components) been installed?
   - Does [License, capacity and consumption monitoring](/power-platform/guidance/adoption/capacity-and-licenses) inform decision making?
   - Has the [CoE Starter Kit – Governance Module](/power-platform/guidance/coe/governance-components) been adopted to gain compliance insights and archive resources?
   - Does telemetry help identify business-critical apps and makers?

1. Are custom environments used for specific use cases and ALM scenarios?

### Support

Leading questions to consider:

1. Are apps created by makers supported by a help desk or dedicated team?

1. Has application / solution risk profile been defined detailing what level of support will be received?

1. Is there an ongoing continuous improvement plan for the application?

1. Are there clearly defined roles and responsibilities for the solution?

1. Do the roles and responsibilities include ownership to build and operate the solution?

#### Nurture and citizen makers

Leading questions to consider:

1. Do you have a [Training and Upskilling](/power-platform/guidance/adoption/training-strategy) program for your makers to help them learn key concepts to grow your pool of Makers?

1. Do you have an Internal [Champions](/power-platform/guidance/adoption/champions) Community established?

1. Do you have the [CoE Starter Kit – Nurture](/power-platform/guidance/coe/nurture-components) module adopted?

1. Do you have show and Tell sessions to demonstrate Advanced Maker Concepts?

1. Do you have an adoption campaign to demonstrate how fusion development processes work?

1. Do you have a career path option for makers?

1. Have you built a community of mentors to share Advanced Maker concepts and best practices?

1. Do you have a Common development strategy and goals for Citizen and Professional developers?

### Automation

1. Do you have Environment and DLP connector policy requests that are automated?

1. Do you have Communication about processes and compliance between Admin and Makers? Is this process automated?

### Fusion teams

1. Do you have [Standard libraries, custom connectors, and components](/power-platform/guidance/adoption/reusable) to be consumed by makers?

1. Do you have the need for fusion teams manage source control and app lifecycle (for example, Build, Verification, Test, Production)?

1. Do you have Cross-functional teams that plan and execute work jointly, including makers, testers, and operational teams?

1. Do you have Common development strategy and goals for Citizen and Pro developers needed for new projects?

[!INCLUDE[footer-include](../../../../../includes/footer-banner.md)]
