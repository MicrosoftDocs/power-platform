---
title: "Getting Started"
description: "Getting Started with Power Virtual Agents projects."
author: nesrivastavaMS
ms.date: 09/26/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: nesrivastava
ms.reviewer: iawilt
---

# Getting Started/Ideation

## Setting Goals 
We normally recommend customers separate the project goals around 3 distinct areas – core delivery, business 
metrics, and governance. If chatbots are brand-new to your organization, then the examples below are a good starting 
point. One clear trend we see with goals – once you go live you will learn very quickly what is important, how your 
customers behave, and where you would like to improve.

## Project goals 
Below is an example of goals a customer may define at project inception

1. **Delivery goals (Minimum Viable Project (MVP))**

    a. Go-live with chatbot on target date - target less than 3 months
    
    b. Bot can answer top target use cases - using a script of test phrases
    
    c. Target complex use cases with back-end integration - this will help with deflection

2. **Business goals (driven toward once live)**
    
    a. Resolved session % - normally the project team aims to increase this number
       over time. This figure is often referred to as the ‘Deflection’ amount.
    
    b. Escalated session % - normally the project team aims to reduce this number over time.
    
    c. Abandoned session %
    
    d. Deflection/resolution – value (based on business value per session calculation)
    
    e. Monthly Active Users (often referred to as MAU)

3. **Establish Chatbot governance and management model.**
    
    a. Application Lifecycle process & automation setup
    
    b. Chatbot author onboarding process in place
    
    c. Reporting & review cadence arranged

## Usecase building
Inspiring usecases is a key part to beginning your bot building journey. 
The program includes the following:

1. Interested employees will participate in a
[Power Virtual Agents in a Day](https://learn.microsoft.com/training/paths/power-virtual-agents-workshop/) training where they
will learn the fundamentals of conversational bot building.

2. Once attendees have experience building bots,
   split the training group into small teams of 2-3 people.
3. Allow teams to identify opportunities that they feel they could
solve using a chatbot.
4. Each team should then establish milestones over a 4-week
period that includes activities each team member will
perform. This is very similar to a project plan.
5. After 2 weeks, bring the entire training group together
and have each team present their chatbot. This provides an
opportunity for each team to demonstrate their progress and
identify any challenges/gaps.
6. After 4 weeks, bring the entire training group back together
to show off their final product to the rest of the group and
leaders from the respective business areas.
7. When possible, provide some level of rewards to the
participants of this initiative. Incentives can vary from
recognition, all the way to monetary rewards.
8. Include a “path to production” period to ensure all chatbots
make it into production.
9. Share success with the rest of the organization.
Inspire others to do more.
10. Rinse and repeat. You have now acquired a program that
you can run on a regular cycle to further promote chatbot
development within your organization.

> [!TIP]
>
> Hackathons encourage organizations to learn and apply what they’ve learnt in real-world use cases to develop bots


## Licensing 
Make sure you scope out how much you expect your project to cost. Speak to your Microsoft account team to confirm 
you’re using accurate pricing for your organization. The licensing of Power Virtual Agents is relatively simple with a few 
key components. Most important to understand is that the license is based on chatbot sessions. A session is defined as:

“The session begins when a user topic is triggered and ends when one of these conditions is met—either the user’s questions are answered, or the conversation exceeds 60 minutes or 100 turns.”


There are 3 main ways in which customers acquire PVA licenses: 

**Power Virtual Agents**

1. **Tenant license (billed monthly, capacity pooled at Tenant)**

    a. 2000 sessions (no limits on channel)
    
    b. Power Automate rights included (with higher throttling limits), including Premium connectors (All flows must start and end with PVA connectors)
    
    c. Dataverse capacity (10GB DB, 10GB File, 2GB Log)

2. **Add-on license (billed monthly, capacity pooled at Tenant)**
    
    a. 1000 sessions (no limits on channel)
 
3. **User license (Grants permission to author bots)**
        
    a. Currently available for no cost, but should be purchased in the same transaction as the Tenant license

    b. Assigned to users in the admin portal

    c. One license required for each bot author

>[!TIP]
>
>Customer who expects up to 10000 sessions a month for their bot, which will be managed by 10 users, would purchase 1x Tenant license, 9x Add-on license, and 10x User licenses.


**Power Virtual Agents for Teams**

1. **Microsoft 365 license**

    a. Unlimited sessions (Teams channel only)

    b. Power Automate rights (Standard connectors only)

    Generally, if a customer is interested in using PVA for Teams, no further licensing is required (as they need Microsoft 
    365 to use Teams) unless they wish to deploy their bot to additional channels (they will need the standard PVA licenses 
    detailed above).

 
  **Chat for Dynamics 365 Customer Service (Omnichannel)**
    Customers deploying PVA with Dynamics 365 for Customer Service now receive a version of the PVA tenant license with their Dynamics 365 purchase:

1. **Tenant license (billed monthly, capacity pooled at Tenant)**
    
    a. 1000 sessions per tenant
    
    b. Power Automate rights included (with higher throttling limits), including Premium
       connectors (All flows must start and end with PVA connectors)
    
    c. Dataverse capacity (10GB DB, 10GB File, 2GB Log)
       Add-on and User licenses are still required, as detailed above. Latest information on [Power Virtual Agents licensing.](https://powervirtualagents.microsoft.com/en-us/pricing/)

> [!div class="nextstepaction"]
> [Building a team](project-building-a-team.md)