---
title: "Creating and Connecting a Zendesk Agent Desktop to Power Virtual Agents (PVA)"
description: "Instructions and references to setup Zendesk Agent Desktop Console to connect with Service Copilot PVA"
ms.reviewer: pm-alias
ms.date: 10/13/2023

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

# Creating and Connecting Zendesk Agent Desktop to Power Virtual Agents (PVA) Bots

This document provides step-by-step instructions on how to create and connect Zendesk Desktop to a Power Virtual Agents (PVA) Bot. This integration allows you to leverage the capabilities of both platforms to enhance your agent experience by providing an agent widget that gives Generative Answers based on Zendesk Agent KBs.

## Prerequisites

Before you begin, ensure that you have the following prerequisites in place:

1. An active Zendesk Support account with Zendesk
1. You'll need an account for Power Virtual Agents 

  > [!NOTE]
  > If you don't have a Power Virtual Agents account, or you haven't created chatbots with Power Virtual Agents before, see the [Quickstart guide for building bots Power Virtual Agents](fundamentals-get-started.md?tabs=web)

1. Admin or developer access to both Zendesk and Microsoft Power Platform
1. An active and deployed Service Copilot KB Bot with Zendesk

## Steps

Follow these steps to connect Zendesk Agent Desktop to a Power Virtual Agents (PVA) Bot:

### Step 1: Retrieve the custom PVA iframe

[Configure and add your bot to your live website](https://learn.microsoft.com/en-us/power-virtual-agents/publication-connect-bot-to-web-channels?tabs=web)

### Step 2: Add Iframe app to the agent interface with the PVA iFrame


1. Login to Zendesk Support and navigate to the 'Admin Section' (You can find the 'Admin Section' link under the 'Zendesk Products' menu at the top right corner)
1. Click on 'Zendesk Support apps' from the 'Apps' section on the left-hand menu


Find the Iframe Ticket Sidebar:

1. Go to the  [Marketplace](https://www.zendesk.com/marketplace/apps/support/124716/iframe-ticket-sidebar/) and in the search bar, type and search for `Iframe Ticket Sidebar`

1. Install the Iframe app



 Configuring the Iframe Sidebar:

  1. Input the URL of your PVA into the `iframe URL` field (Refer to Step 1). Ensure you paste only the URL, excluding any HTML tags

> [!NOTE]
> You may have to adjust the height of the iframe based on the size of the Agent Desktop widget

1. Click 'Update'

### Step 3: Add a Component to the Agent Desktop 

1. Log in to your Zendesk account and open a ticket 
2. From the right side menu, choose 'Apps'
3.  Under Apps, select `Iframe Ticket Sidebar`

  > [!NOTE]
  > For quicker access, use the 'Pin to Sidebar' option

### Step 4: Escalate to view the new component

1. Now upon escalation to an agent you will see the widget in the designated area. Agents will be able to interact with the copilot widget and get Generative AI answers based on the previously setup bot.