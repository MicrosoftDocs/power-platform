---
title: "Project Planning"
description: "Project Planning for Power Virtual Agents projects."
author: nesrivastavaMS
ms.date: 10/10/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: nesrivastava
ms.reviewer: iawilt
---
11/6/2023
# Project Planning

## **Sample Project Overview and Timelines**

:::image type="content" source="./media/topics/Project_Planning.png" alt-text="Project planning":::

Chatbot projects based on Power Virtual Agents, like any technology, can have wildly different timelines and 
specifications depending on the needs of the particular use case and organization. However, one advantage that low 
code technologies can bring, is rapid time to market as illustrated in the 10-week timeline. The advantages in 
choosing a rapid delivery timeline as your initial project phase include:
- Developing a minimum viable product to accelerate customer adoption
- Customer feedback is generated quickly (see Engage your flywheel section) to provide insights on what can be improved
- Return value back to your organization in an accelerated manner

Whether this approach is right for your use case depends on organizational need, support, and the ability to align the necessary workstreams.

## **Project Workstreams**
:::image type="content" source="./media/topics/ProjectWorkstreams.png" alt-text="Project Workstreams":::

Setting up an adoption platform requires several workstreams that can execute in parallel, each with their own goals, timelines, and owners. These workstreams are as follows, with summary callouts on responsibilities: 

### **Bot building**

  1. This workstream focuses on building out the related content for the chatbot use case.
  1. Content creation/development tasks 
  Refer to the Action Development section for

### **Rhythm of Business (ROB)** 

A Rhythm of Business (ROB) meeting allows all participants, involved in the project, to provide status updates and identify any blocking issues so that they can be get resolved by stakeholders. These meetings should be actionable and driven by dates and business goals. 

**1. Customer driven –**  Microsoft/partner attend but customer is responsible for booking meetings and setting the agenda. The goal of this meeting is to run it as an engineering project, with success metrics and scorecards, and likely consists of:

  -Standups for chatbot development, 1-2 times a week
  - Weekly demos for progress
  - Weekly status update emails highlighting blockers
  - Bi-weekly bug prioritization
  - Internal nurture – celebrate success
  - Periodic retrospectives
  - Weekly office hours to support customers adoption
  - Teams channel for open communication


**2. Jointly owned (Microsoft/partner)**

  - Architectural reviews to guide core decisions for the platform
  - Monthly exec reviews
  - Scorecard review with progress, risks, blockers, and feedback
  - Forum for demos as appropriate
  
  ### **Testing**

  User acceptance testing will likely take up a significant portion of delivering your Power Virtual Agents chatbot – ensuring not only the integration of the complete solution (with backends/handoff clients/APIs), but also of the chatbots responses to customer input. More information on testing, refer to the testing strategy section.
    
  ### **Production Deployment/Readiness checklist**

 Ensuring that you're ready to deploy is a critical step in having a successful launch. Here are some considerations: 
  
  a. Have all scenarios been tested end to end to validate business requirements have been addressed?
  
  b. Do you have a cutover plan that identifies step by step all the activities required to successfully go live?
  
  c. Has this cutover plan been tested and validated?
  
  d. Do you have access to all the production resources that will be needed?
    - Environment
    - DLP policies
    - Gateways (if needed)
    - Azure resources (if needed)
    - External APIs (if needed)
  
  e.  Do you have a communication plan established to inform both internal and external stakeholders of the changes? This plan includes both pre and post deployment.

### **Power Platform Administration**

a. Many customers will already have Power Platform/M365 administration teams/CoEs that are accountable to the management of the technology set.

b. This team may focus on activities such as
- Environment setup
- Security/Access
- DLP Policies
- Gateways
- Custom analytics
 
Refer to the Environment Strategy and 
Custom Analytics Strategy sections for more details.

     
