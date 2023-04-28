---
title: "Environment strategy for Power Virtual Agents"
description: "Set of best practices for enviroment strategy for Power Virtual Agents"
author: athinesh
ms.date: 1/20/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---
# Introduction

## Managing your bot

Bot Key Performance Indicators (KPIs) There are some key terms that relate to how Power Virtual Agents measures user behavior. It’s useful to have a base understanding of them.

## Session

This is a user interacting with the chatbot

## Engaged

Session A user interacts with the chatbot, and activates a user topic (content created by the chatbot author – not one of the built-in system topics).

<!-- Insert Image -->
  
Engaged sessions can have one of three possible outcomes – it's these outcomes that customers tend to measure once live:

- Resolved session – an engaged session where the user indicates that their question was answered
- Abandoned session – an engaged session where the user doesn't indicate that their question was answered
- Escalated session – an engaged session where the user escalates to a human agent
  
Importantly, resolved sessions + abandoned sessions + escalated sessions = 100% of engaged sessions. More detail on Power Virtual Agents metrics + data dictionary.

## Environment Strategy

Microsoft provides a comprehensive Environments strategy in our product documentation. However, there are some considerations related to Power Virtual Agents that should be accounted for.

## Region/Data privacy

Environments are bound to a specific region. Does the chatbot have any regulatory requirements related to privacy and residency? For example, a foreign government customer may have a requirement to provision their chatbot under their country’s tenant instance instead of USA tenant, ensure the data lives in their country specific data center. Power Virtual Agents lets you choose where you want your data to live. Power Virtual Agents can be deployed into the Microsoft Azure datacenters (also referred to as “regions”). You can create a bot in your tenant’s location by default, or you can choose the datacenter you want to use when setting up your environment. Data is stored in the United States if a bot author’s tenant location isn’t listed.

## Security Roles/Privileges

Environments include predefined security roles that reflect common user tasks with access levels defined to match the security best-practice goal of providing access to the minimum amount of business data required to use the app.

Users in the environment must have the Environment Maker security role before a Power Virtual Agents bot can be shared with them. For users who make apps that connect to the database and need to create or update entities and security roles, you need to assign the System Customizer security role in addition to the Environment Maker security role. This is necessary because the Environment Maker security role doesn’t have privileges on the environment’s data.

System Administrators of the environment need to assign the Environment Maker security role to the user before you share the bot. If you’re a System Administrator, you can assign the Environment Maker role when you share the bot. You can only share a bot with individual users, which means you can’t share it with a security group or distribution group in your organization. You also can’t share with users or groups outside of your organization.
  
## Security Groups

At the bot level, the “access” option controls who can access your bot. You can select one of two security groups:

- All bot managers. This lets only bot managers  chat with the bot. You can share your bot so other bot managers can access it.
- Everyone in my organization (Organization name). This lets everyone in the organization access and chat with your bot. Users outside of the organization sees an error when chatting with the bot.
- Data Loss Prevention (DLP) policies Organizations want to safeguard their data by using existing Microsoft Power Platform capabilities like data loss prevention. With DLP enforcement in Power Virtual Agents, bot authors can ensure that data used by connectors and skills is properly managed and authenticated.
- Dedicated vs Shared The environments for the Power Virtual Agents can be either dedicated or shared with other Dynamics 365/Power Platform Apps. In the table below are some pros and cons for shared vs dedicated environments.

## Omnichannel for Dynamics 365 Customer Service

It's recommended to have a shared environment for Power Virtual Agents and Omnichannel for Dynamics 365 Customer Service. This provides the extensibility for Dynamics 365 entities through the connectors in a low code fashion and enable reusing existing Dataverse customizations for the data export pipeline, clean up etc.

## Environment Types

 Customers generally have somewhere between three and five environments for their Power Virtual Agents from Development to Production, using the Production and Sandbox environment types.

More on Power Platform environment types.
It's recommended to have the environment provisioned in the same geographical location as the tenant to ensure optimal performance. The Scale group of the environment determines the performance of the bot. The Trial and Default environments have less capacity and hence it's advised to use Production environments as much as possible, especially for the live/production chatbot that will be consuming the external traffic. The deployment of the bots across environments can be automated using Azure DevOps tools.  
