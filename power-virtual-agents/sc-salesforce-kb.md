---
title: "Service Copilot Salesforce Knowledge Base Setup"
description: "Configure your service copilot bot to search Salesforce Knowledge Base Articles and provide the user a response"
ms.reviewer: pm-alias
ms.date: 09/27/2023

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

# Setup Service Copilot Salesforce Knowledge Base 

With Service Copilot, you can create a bot that connects to Salesforce's Knowledge Base search. Service Copilot will automatically create a bot and use Generative Answers to summarize the Knowledge Base search to the user.

## Prerequisites

- An active Salesforce account with the Knowledge Base component, containing KB content
- You'll need an account for Power Virtual Agents. 

  > [!NOTE]
  > If you don't have a Power Virtual Agents account, or you haven't created chatbots with Power Virtual Agents before, see the [Quickstart guide for building bots Power Virtual Agents](fundamentals-get-started.md?tabs=web).

## Steps

Follow these steps to create a Service Copliot bot and connect to Salesforce KB Search:

### Step 1: Select Salesforce Service Copilot and Sign in

{TODO: Validate these steps, potentially add screenshots}

1. Create a new Service Copilot Bot

1. Select External User or Agent facing Service Copilot

1. Select Salesforce as the Knowledge Base provider

1. Follow steps to login with username and password, this will establish the connection with Salesforce

### Step 2: Configure Salesforce KB Search Parameters

The following configurations will be used to filter the knowledge base to expose the proper subsection of articles to the user or agent

1. Select the language of the knowledge base articles.  
> [!NOTE]
> The language must match an active language in the Salesforce organization and supported by the Knowledge component

1. Select the appropriate channel:
    - **App**: Visible in the internal Salesforce Knowledge application
    - **Pkb**: Visible in the public knowledge base
    - **Csp**: Visible in the Customer Portal
    - **Prm**: Visible in the Partner Portal
    - **Default**: Will default to the Salesforce user's context

1. (Optional) Define Categories to further filter  
Categories are in map json format {“group1”:”category1”,”group2”:”category2”,...} and defaults to None.  
Category group must be unique in each group:category pair, otherwise you get ARGUMENT_OBJECT_PARSE_ERROR. There is a limit of three data category conditions, otherwise you get INVALID_FILTER_VALUE.

1. (Optional) Select a pageSize:  
pageSize is the maximum number of articles to be returned by the KB Search. Defaults to 20. Valid range is 1 to 100

1. (Optional) Define Order  
Optional, either ASC or DESC, defaults to DESC. Valid only when sort is valid.

1. (Optional) Define Sort  
Optional, a sortable field name LastPublishedDate, CreatedDate, Title, ViewScore. Defaults to LastPublishedDate for query and relevance for search.

### Step 3: Choose whether or not to fetch article details  
Select either the option to use just the article list and summary or to fetch the article detail.

> [!NOTE]
> Selecting to fetch the article detail will help provide a more accurate and complete answer provide by Generative Answer, however there may be a performance hit with the additional API call to execute 

### Step 4: Create your bot

Select Finish to create your bot 
