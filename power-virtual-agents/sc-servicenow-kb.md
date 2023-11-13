---
title: "Service Copilot ServiceNow Knowledge Base Setup"
description: "Configure your service copilot bot to search ServiceNow Knowledge Base Articles and provide the user a response"
keywords: "PVA"
ms.date: 09/26/2023

<!-- Do not update the following fields; the docs team uses them for content management -->
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: TBU
ms.service: TBU
searchScope:
  - "TBU"
<!-- End of content management section -->
---

# Setup Service Copilot ServiceNow Knowledge Base 

With Service Copilot, you can create a bot that connects to ServiceNow's Knowledge Base search. Service Copilot will automatically create a bot and use Generative Answers to summarize the Knowledge Base search to the user.


## Prerequisites

- An active ServiceNow account with the Knowledge Management component, containing KB content
or
- Setup a developer instance with the Knowledge Management component, which comes with preloaded sample data
- ServiceNow Bot Interconnect application (Note: ServiceNow Vancouver or later required)
- You'll need an account for Power Virtual Agents. 

  > [!NOTE]
  > If you don't have a Power Virtual Agents account, or you haven't created chatbots with Power Virtual Agents before, see the [Quickstart guide for building bots Power Virtual Agents](fundamentals-get-started.md?tabs=web).

## Steps

Follow these steps to create a Service Copliot bot and connect to ServiceNow KB Search:

### Step 1: Select ServiceNow Service Copilot and Sign in

1. Create a new Service Copilot Bot

1. Select External User or Agent facing Service Copilot

1. Select ServiceNow as the Knowledge Base provider

1. Follow steps to login with username and password, this will establish the connection with ServiceNow

### Step 2: Configure ServiceNow KB Search Parameters

The following configurations will be used to filter the knowledge base to expose the proper subsection of articles to the user or agent

1. Select Knowledge Base Enabled 

1. Select Article Count.  
Number of knowledge articles to retrieve from Service Now

1. (Optional) Define an article filter condition

1. (Optional) Specify the Knowledge Base list  
A comma-separated list of knowledge base sys_id values to search in.

### Step 4: Create your bot

Select Finish to create your bot 

