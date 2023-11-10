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

# Getting started

## Setting goals

We recommend customers separate the project goals into three distinct areas: core delivery, business metrics, and governance. If chatbots are brand-new to your organization, then the examples in this article are a good starting point. Once you go live, you learn quickly what is important, how your customers behave, and where you would like to improve.

### Project goals

Here's an example of the goals a customer defines at project inception.

1. **Delivery goals - Minimum Viable Project (MVP)**

    1. Go-live with a chatbot on a target date fewer than three months.

    1. The bot can answer your target use cases, using a script of test phrases.

1. **Business goals after you go live**

    1. *Resolved* session percentage: the project team aims to increase this number over time. This figure is often referred to as the *deflection* amount.

    1. *Escalated* session percentage: the project team aims to reduce this number over time.

    1. *Abandoned* session percentage.

    1. *Deflection* or *Resolution*: the business value per session.

    1. Monthly Active Users (MAU).

1. **Establish Chatbot governance and management model**

    1. The Application Lifecycle process and automation setup.

    1. The chatbot author onboarding process.

    1. The reporting and review cadence.

## Use case building

Creating inspiring use cases is a key part of beginning your bot building journey.

The program includes:

1. Interested employees participate in a [Power Virtual Agents in a Day](https://learn.microsoft.com/training/paths/power-virtual-agents-workshop/) training where they learn the fundamentals of conversational bot building.
1. Once attendees have experience building bots, split the training group into small teams of two to three people.
1. Allow teams to identify moments in the use case they could solve using a chatbot.
1. Each team should establish milestones over a four-week period that includes activities for each team member. This practice is similar to a project plan.
1. After two weeks, each team of the training group presents their chatbot, demonstrates their progress, and identifies any challenges or gaps.
1. After four weeks, each team of the training group reveals their final product to the rest of the group and leaders from the respective business areas.
1. When possible, provide some level of reward to the participants of this initiative. Incentives can vary from recognition to monetary rewards.
1. Include a *path to production* period to ensure all chatbots are finalized into production.
1. Share success with the rest of the organization. Inspire others to do more.
1. Rinse and repeat. You now have a program you can run on a regular cycle to promote chatbot development within your organization.

> [!TIP]
>
> Hackathons encourage organizations to learn and apply what they’ve learnt in real-world use cases to develop bots.

## Licensing

Scope out how much you expect your project to cost. Speak to your Microsoft account team to confirm you’re using accurate pricing for your organization. The licensing of Power Virtual Agents is relatively simple with a few key components. Most importantly, understand that the license is based on chatbot sessions.

A session is defined as:
>The time between when a user topic is triggered and ends. The end is when either the user's questions have been answered or the conversation exceeds 60 minutes or 100 turns.

Here are three ways that customers can get Power Virtual Agents licenses.

### Power Virtual Agents licensing

1. **Tenant license** Billed monthly, capacity pooled at Tenant.

    1. 2000 sessions with no limits on channel.

    1. Power Automate rights included with higher throttling limits, including Premium connectors. All flows must start and end with Power Virtual Agents connectors.

    1. Dataverse capacity: 10 GB DB, 10 GB File, 2 GB Log.

1. **Add-on license** Billed monthly, capacity pooled at Tenant.

    1000 sessions with no limits on channel.

1. **User license** Grants permission to author bots.

    1. Currently available for no cost, but should be purchased in the same transaction as the Tenant license.

    1. Assigned to users in the admin portal.

    1. One license required for each bot author.

>[!TIP]
>
> A customer who needs up to 10,000 sessions per month for their bot (managed by 10 users) would purchase a 1x Tenant license, 9x Add-on license, and 10x User licenses.

### Power Virtual Agents for Teams licensing

1. **Microsoft 365 license**

    1. Unlimited sessions. Teams channel only.

    1. Power Automate rights. Standard connectors only.

    If a customer wants to use Power Virtual Agents for Teams, no further licensing is required since they have Microsoft 365. To deploy their bot to more channels, they need the standard Power Virtual Agents licenses.

  **Chat for Dynamics 365 Customer Service** Omnichannel.

   Customers deploying Power Virtual Agents with Dynamics 365 for Customer Service receives a version of the Power Virtual Agents tenant license with their Dynamics 365 purchase.

1. **Tenant license** Billed monthly, capacity pooled at Tenant.

    1. 1000 sessions per tenant.

    1. Power Automate rights included with higher throttling limits, including Premium connectors. All flows must start and end with Power Virtual Agents connectors.

    1. Dataverse capacity: 10 GB DB, 10 GB File, 2 GB Log.

       Add-on and User licenses are still required. Here's pricing information on [Power Virtual Agents licensing](https://powervirtualagents.microsoft.com/en-us/pricing/).

> [!div class="nextstepaction"]
> [Building a team](project-building-a-team.md)
