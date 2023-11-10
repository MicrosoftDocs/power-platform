---
title: "Project Planning"
description: "Project Planning for Power Virtual Agents projects."
author: nesrivastavaMS
ms.date: 11/6/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: nesrivastava
ms.reviewer: iawilt
---

# Project planning

## Sample project overview and timelines

:::image type="content" source="./media/topics/Project_Planning.png" alt-text="Project planning":::

Chatbot projects based on Power Virtual Agents can have wildly different timelines and specifications depending on the use case and organization. However, one advantage that low code technologies bring is the *rapid time to market* as shown in the 10-week timeline.

The advantages in choosing a rapid delivery timeline as your initial project phase include:

- Developing a minimum viable product to accelerate customer adoption.
- Customer feedback is generated quickly (see [Engage your flywheel](project-best-practices.md#principles)) to provide insights on what can be improved.
- Insights return value back to your product and organization, enabling new developments—faster.

Whether this approach is right for your use case depends on organizational need, support, and the ability to align the necessary workstreams.

## Project workstreams

:::image type="content" source="./media/topics/ProjectWorkstreams.png" alt-text="Project Workstreams":::

Setting up an adoption platform requires several workstreams that can execute in parallel, each with their own goals, timelines, and owners.

The following five workstreams summarize and describe responsibilities:

### Bot building

1. Building out related content for chatbot use cases.
1. Content creation and development tasks.

### Rhythm of Business (ROB)

A Rhythm of Business (ROB) meeting allows all participants to provide status updates and blocking issues, which stakeholders aim to resolve. These meetings should be actionable and driven by dates and business goals.

1. **Customer driven** Microsoft and other partners attend.

   The customer is responsible for booking meetings and setting the agenda. Run this meeting as an engineering project with success metrics and scorecards.

   Activities and features for the meeting include:

   - Standups for chatbot development, one or two times per week.
   - Weekly demos to show progress.
   - Weekly status update emails, highlighting blockers.
   - Bi-weekly bug prioritization.
   - Celebrate successes.
   - Periodic retrospectives.
   - Weekly office hours to support customers adoption.
   - Teams channel for open communication.

1. **Jointly owned** Microsoft and other partners attend.

   - Architectural reviews guide core decisions for the platform.
   - Monthly executive reviews.
   - Scorecard review with progress, risks, blockers, and feedback.
   - Forum for demos.
  
### Testing

User acceptance testing is a large part of delivering your Power Virtual Agents chatbot. Testing ensures the integration of the complete solution with the back-end, client API, and chatbot responses to customer input.

### Production deployment and readiness checklist

Ensuring you're ready to deploy is a critical step to a successful launch.

Here are some considerations:
  
1. Have all scenarios been tested to validate business requirements?
  
1. Do you have a cutover plan that identifies all the activities required to successfully go live?
  
1. Has this cutover plan been tested and validated?
  
1. Do you have access to all the production resources you need?

   Resources such as:

   - Environments
   - DLP policies
   - Gateways (optional)
   - Azure resources (optional)
   - External APIs (optional)
  
1. Do you have a communication plan to inform both internal and external stakeholders of the changes? This plan includes both pre- and post- deployment.

### Power Platform administration

Many customers have Power Platform, Microsoft 365 administration, or a Center of Excellence (CoE) team that's accountable to the management of a technology set.

This team can focus on activities such as:

- Environment setup.
- Security/Access.
- DLP Policies.
- Gateways.
- Custom analytics.

For more information, see [custom analytics strategy](custom-analytics-strategy.md).
