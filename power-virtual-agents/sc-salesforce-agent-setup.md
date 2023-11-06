---
title: "Creating and Connecting a Salesforce Agent Desktop to a Power Virtual Agents"
description: "Instructions and references to setup Salesforce Service Console to connect with Service Copilot PVA - Agent KB Search"
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

# Creating and Connecting Salesforce Service Console to a Power Virtual Agents (PVA) Bot

This document provides step-by-step instructions on how to create and connect Salesforce Service Cloud to a Power Virtual Agents (PVA) Bot. This integration allows you to leverage the capabilities of both platforms to enhance your agent experience by providing an agent widget that give Generative Answers based on Salesforce Agent KBs

## Prerequisites

Before you begin, ensure that you have the following prerequisites in place:

- An active Salesforce account with Service Cloud and Lightning enabled.
- You'll need an account for Power Virtual Agents. 

  > [!NOTE]
  > If you don't have a Power Virtual Agents account, or you haven't created chatbots with Power Virtual Agents before, see the [Quickstart guide for building bots Power Virtual Agents](fundamentals-get-started.md?tabs=web).

- Admin or developer access to both Salesforce and Microsoft Power Platform.
- An active and deploy Service Copilot KB Bot with Salesforce.  
[Placeholder Link to sc-salesforce-kb]()

## Steps

Follow these steps to connect Service Cloud to a Power Virtual Agents (PVA) Bot:

### Step 1: Retrieve the custom PVA iFrame

[Configure and add your bot to your live website](https://learn.microsoft.com/en-us/power-virtual-agents/publication-connect-bot-to-web-channels?tabs=web)

### Step 2: Create a Visualforce Page reference with the PVA iFrame

1. Log in to your Salesforce account.

1. In Salesforce, navigate to "Setup."

1. In the Quick Find box, type "Visualforce" and select "Visualforce Pages"

1. Select New to create a new Visualforce Page
    - Add a Label
    - Add a Name
    - Check "Available for Lightning Experience"

1. Inside the Visualforce Markup add the following code:

```html
<apex:page >
  <iframe src="https://{domain}/environments/{environment}/bots/{bot}}/webchat?__version__={version}" frameborder="0" style="width: 100%; height:100%;"></iframe>
</apex:page>
```
> [!NOTE]
> You may have to adjust the height of the iframe based on the size of the Service Cloud widget

1. Click Save

### Step 3: Add a Component to the Chat Lightning App 

1. Log in to your Salesforce account.

1. In Salesforce, navigate to "Setup."

1. In the Quick Find box, type "Lightning" and select "Lightning App Builder"

1. Select Edit for Chat Transcript Record Page

> [!NOTE]
> If the page does not exist you can get to the app builder from the Service Console.
> Once escalated to an agent on the Service Console, select the Setup icon, then Edit Page.

1. In the View, search for a Visualforce Component and drag the component on to the canvas where you would like to display the chat widget

1. Provide the following:
    - Label
    - Select the previously created Visualforce Page
    - Height

1. Activate and Save

### Step 4: Escalate to view the new component

1. Now upon escalation to an agent you will see the widget in the designated area. Agents will be able to interact with the copilot widget and get Generative AI answers based on the previously setup bot