---
title: Hand off to ServiceNow
description: Step-by-step instructions on how to create and connect a ServiceNow Virtual Assistant to a Copilot Studio copilot and escalate to ServiceNow Live Agent.
ms.reviewer: pswimm
ms.date: 11/14/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: power-virtual-agents
ms.service: power-virtual-agents
---

# Hand off to ServiceNow

This document provides step-by-step instructions on how to create and connect an ServiceNow Virtual Assistant to a Copilot bot and escalate to ServiceNow Live Agent. This integration allows you to leverage the capabilities of both platforms and generative answers to enhance your chatbot experience.

## Prerequisites

Before you begin, ensure that you have the following prerequisites in place:

1. An active ServiceNow account with ServiceNow Virtual Agent enabled and ServiceNow Bot Interconnect enabled. (ServiceNow Vancouver or later required)
1. A Copilot Studio bot.
1. Admin or developer access to both ServiceNow and Power Platform.

## Steps

Follow these steps to create and connect a ServiceNow Bot to a Power Virtual Agents (PVA) Bot:

1. [Create a JavaScript function in Microsoft Azure using Visual Studio Code](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/create-js-function-azure-mspv-sec-bot.html).

    1. Sign in to Microsoft Azure.

    1. Create a JavaScript function in Microsoft Azure.

    1. Create an Azure Function for Microsoft Copilot Studio as Secondary bot with Servicenow Bot Interconnect setup ([KB1112368](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB1112368)) **KV Function Version3*.

    1. Install the request-promise libraries.

    1. [Deploy the project to Azure](/azure/azure-functions/create-first-function-vs-code-node).

    1. From the Azure portal, navigate to All Resources.

    1. Click the name of the function app that you created.

    1. On the **Overview** page for the function, copy the function URL and keep it for use in a later step. The Azure function URL will be used as the secondary bot endpoint in your ServiceNow instance.

2. [Retrieve Direct Line secret for your bot](/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0).

3. [Add the Direct Line secret key to your Virtual Agent Bot Interconnect instance](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/add-dl-secret-key-sn-instance.html).

4. [Create a Virtual Agent Bot Interconnect shell topic to call Microsoft Copilot Studio topics](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/create-primary-va-topic-ms-pva.html).

5. [Create a Virtual Agent conversational custom chat integration configuration](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/create-adapter-for-virtual-agent.html).

    1. [Create a new channel or update an existing channel for the integration](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/create-channel-va-cccif.html).

    1. [Configure a new provider for the integration](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/create-provider-va-cccif.html).

    1. [Set up message authentication](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/set-up-msg-auth-va-cccif.html).

    1. [Create a channel identifier](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/create-channel-id-va-cccif.html).

    1. [Select rich controls for inbound (user input) and outbound (bot response) transformation](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/map-rich-controls-va-cccif.html).

    1. [Create and configure a scripted REST API for your custom chat integration](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/configure-rest-api-va-cccif.html).

    1. [Create the action scripts](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/task/create-action-scripts-va-cccif.html).

6. Transferring Virtual Agent conversations to a live agent

See [Transferring Virtual Agent conversations to a live agent](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/concept/transfer-to-live-agent.html) and [Configuring handoff from Copilot Studio](configure-generic-handoff.md)

### Step 7: [Closing Virtual Agent and Agent Chat conversations](https://docs.servicenow.com/bundle/vancouver-servicenow-platform/page/administer/virtual-agent/concept/va-open-conversations.html)

