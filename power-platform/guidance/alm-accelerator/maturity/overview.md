---
title: ALM maturity model
description: Learn how to apply the Power Platform adoption maturity model to evaluate ALM usage and how the ALM Accelerator can help.
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.reviewer: sericks
manager: pladhani
ms.custom: bap-template
ms.date: 04/10/2023
ms.topic: concept-article
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# ALM adoption maturity model

Use the levels and capabilities in the [Power Platform adoption maturity model](../../adoption/maturity-model.md) to evaluate your organization's usage of application lifecycle management (ALM) and how the ALM Accelerator for Power Platform can help.

## Quick start

:::image type="content" source="media/decision-tree.png" alt-text="Diagram of a decision tree for evaluating ALM." lightbox="media/decision-tree.png":::

The ALM Accelerator is a good match when you can verify that the following considerations apply to your organization.

1. What is the impact of the solution?
   - Are the applications classified as critical or high [business impact](#business-impact)?
   - Who is using the application?
      - Is it a productivity application used by everyone in your organization?
      - Is it used by senior leadership to make business-impact decisions?
      - Is it integrated with external users; for example, partners and customers who rely on the solution as part of an external process?
   - Are there specific compliance and auditing needs?
      - How important is tracking and auditing who is using the application?
      - Does the solution have compliance and auditing requirements?

1. Do you have the prerequisites in place?
   - Do you have a defined environment strategy for development, validation, test, and production?
   - Do you use Azure DevOps Services or can you integrate with Azure DevOps Services for source control and build pipelines?
   - Do you have license prerequisites in place?
     - Do you have Basic or above Azure DevOps licenses for makers?
     - Do you have Per App or Per User Power Apps licenses to access the ALM Accelerator maker solution?

1. Are you looking to move to Level 300 - Defined or beyond?

1. Do you have an environment strategy in place?
    - What is the request strategy for environments?
      - Do you have a process to create development, test, and production environments?
      - Is the process to request environments automated?

1. Do you understand and have you implemented source control concepts?
    - Is [branching and merging](/azure/devops/repos/git/git-branching-guidance) understood?
    - Are [pull requests](/azure/devops/repos/git/git-branching-guidance?#review-and-merge-code-with-pull-requests) used to review and merge changes?
    - Are [build pipelines](/azure/devops/pipelines/get-started/key-pipelines-concepts) used to integrate and deploy between validation, test, and production environments?

1. Are [fusion development](/learn/paths/transform-business-applications-with-fusion-development/) teams engaged to include low-code and pro-code teams?

1. Are your professional development teams familiar with branching and merging strategies and able to assist makers?

1. Do your pro-code and operations teams manage Azure Pipelines?

1. Are you a pro-code team creating components in JavaScript?

1. Are you integrating with OpenAPI-enabled Web APIs?

1. Are you using or planning to create [plug-ins](/powerapps/developer/data-platform/plug-ins) to extend business processes in Microsoft Dataverse?

1. Do you have a support plan?
   - Who is supporting the application and solution?
   - Do you have a formal support team to manage issues with the solution?

## Leading questions

If the following leading questions reveal gaps, consider what proactive steps you can take to help grow the maturity of your people, processes, and technology to move toward advanced maker integration inside your organization.

### Alignment

1. Is innovation driven by business areas, from the bottom up?

1. Is there a common vision between IT and business?

1. Is there a dedicated Power Platform product owner?

1. Is there an established [Center of Excellence team](../../adoption/coe.md)?

1. Is Power Platform a key part of your digital transformation strategy?

### Impact

1. Is Power Platform targeting low-complexity scenarios?

1. Is there limited reuse of common components and services?

1. Do applications allow bottom-up and top-down innovation?

1. Do applications focus on increased delivery efficiency, supporting rapidly changing business needs?

1. Are there organization-wide initiatives to deliver large-scale integrated apps?

### Strategy

1. Is your Power Platform strategy defined?

1. Is there a demand management process in place?

1. Is there a defined understanding of the role of Power Platform in your organization's IT portfolio?

1. Are business plans shared across departments?

1. Are vision and strategy understood by all?

1. Do enterprise architecture decisions include Power Platform capabilities?

### Business value and business strategy viability

1. What business outcomes will this solution realize?

1. What is the expected time frame?

1. What do you do well today?

1. What do you want to do better?

1. What thing do you want to do differently?

### Technological viability

1. What are manual steps vs automated steps?

1. How measurable are the qualitative and quantitative outcomes?

1. What is the dashboard and report capability to allow stakeholders to visualize and drill into and track action on data?

1. How available are analytics?

1. On what frequency are analytics updated?

1. How frequently are changes required?

1. What is the technical debt that needs to be accounted for?

1. What are the security implications?

### Financial viability

1. What is the economic value added?

1. Does this address the current market model or is a new model being developed?

1. What is the time horizon for implementation?

1. What investment model is required?

### Business impact

#### Critical

The system severely affects production, operations, or deployment deadlines or production or profitability. Multiple users or services are affected.

Initial response time is less than 60 minutes with 24x7 access.

Issues demand an immediate response and require 24x7 operation, every day.

#### High

The system has moderate business impact and can be dealt with during business hours. Multiple users, single users, or customers are affected.

Initial response time is one hour, four hours, or next-day business hours, with support available 24x7.

#### Noncritical

The system has minimal business impact. The issue is important but doesn't significantly affect service or productivity. Acceptable workarounds are considered.

Initial response time is four to eight hours or greater, with business hours access and support.

### Administration and governance

1. Who can create environments?

1. What [data loss prevention (DLP)](../../../admin/wp-data-loss-prevention.md) policies are in place?

1. Do [Power Platform Service Admin](../../../admin/overview-role-powerapps-admin.md) roles exist to administer Power Platform tenants and environments?

1. Are tenants and environments isolated from each other?

1. Is there monitoring in place?
   - Has the [CoE Starter Kit – Core](../../coe/core-components.md) been installed?
   - Does [license, capacity, and consumption monitoring](../../adoption/capacity-and-licenses.md) inform decision making?
   - Has the [CoE Starter Kit – Governance Module](../../coe/governance-components.md) been adopted to gain compliance insights and archive resources?
   - Does app usage data help identify business-critical apps and makers?

1. Are custom environments used for specific use cases and ALM scenarios?

### Support

1. Are apps created by makers supported by a help desk or dedicated team?

1. Has an application and solution risk profile been defined that details what level of support will be received?

1. Is there an ongoing continuous improvement plan for the application?

1. Are there clearly defined roles and responsibilities for the solution?

1. Do the roles and responsibilities include ownership to build and operate the solution?

### Nurture citizen developers (makers)

1. Do you have a [training and upskilling](../../adoption/training-strategy.md) program for your makers to help them learn key concepts to grow your pool of makers?

1. Do you have an internal [champions](../../adoption/champions.md) community established?

1. Have you adopted the [CoE Starter Kit – Nurture](../../coe/nurture-components.md) module?

1. Do you have show-and-tell sessions to demonstrate advanced maker concepts?

1. Do you have an adoption campaign to demonstrate how fusion development processes work?

1. Do you have a career path option for makers?

1. Have you built a community of mentors to share advanced maker concepts and best practices?

1. Do you have a common development strategy and goals for citizen and professional developers?

### Automation

1. Do you have environment and DLP connector policy requests that are automated?

1. Do you have communication about processes and compliance between admin and makers? Is this process automated?

### Fusion teams

1. Do you have [standard libraries, custom connectors, and components](../../adoption/reusable.md) to be consumed by makers?

1. Do you have the need for fusion teams to manage source control and app lifecycle; for example, build, verification, test, and production?

1. Do you have cross-functional teams that plan and execute work jointly, including makers, testers, and operational teams?

1. Do you have a common development strategy and goals for citizen and pro developers needed for new projects?

[!INCLUDE [footer-include](../../../includes/footer-banner.md)]
