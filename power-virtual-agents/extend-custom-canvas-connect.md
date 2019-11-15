---
title: "Connect Power Virtual Agents to a custom canvas"
description: "Use an advanced custom canvas to change the display and functionality of your bot (dev coding required)."
keywords: ""
ms.date: 11/15/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "extend, azure, byoc"
ms.collection: virtualagent
---

# Connect your Power Virtual Agents bot to a custom canvas

You can connect your Power Virtual Agents bot to a custom canvas so that you can directly send messages and receive dynamic responses (such as Adaptive Cards and Carousels) and then custom render them directly from the bot engine. 

This article describes how to set up a demo to test and configure this functionality.

>[!IMPORTANT]
>When dealing with personal data, please respect user privacy. Follow platform guidelines and post your privacy statement online.

>[!WARNING]
>Instructions in this section require software development from you or your developers. It is intended for experienced IT professionals, such as IT admins or developers who have a solid understanding of developer tools, utilities, and IDEs.

# How to run locally

This demo integrates with multiple services that you need to set up to host the demo.

1. [Clone the code](#clone-the-code)
1. [Setup Azure Bot Services](#setup-azure-bot-services)
1. [Setup V2 bot And Direct Line](#setup-v2-bot-and-direct-line)
1. [Prepare and run the code](#prepare-and-run-the-code)

## Clone the code

To host this demo, you will need to clone the code and run it locally.

1. Clone this repository (https://github.com/microsoft/dynamics365-virtualagent-samples/tree/master/Utilities/ContentConverter)
1. Create two empty files for environment variables, `/bot/.env` and `/web/.env`

## Setup Azure Bot Services

>[!TIP]
> We suggest you use [Bot Channel Registration](https://ms.portal.azure.com/#create/Microsoft.BotServiceConnectivityGalleryPackage) during development. This will help you diagnose problems locally without deploying to the server, and speed up development.

You can follow our instructions at [Setup a new Bot Channel Registration](https://docs.microsoft.com/azure/bot-service/bot-service-quickstart-registration?view=azure-bot-service-3.0).

1. Save the Microsoft App ID and password to `/bot/.env`
   -  `MICROSOFT_APP_ID=12345678-1234-5678-abcd-12345678abcd`
   -  `MICROSOFT_APP_PASSWORD=a1b2c3d4e5f6`

>[!IMPORTANT]
>When you are building your production bot, never expose your Web Chat or Direct Line secret to the client. 
>Instead, you should use the secret to generate a limited token and send it to the client. 
>For more information, refer to the documentation on [Direct Line token generation](https://docs.microsoft.com/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0#generate-token) and the [Enhanced Direct Line Authentication feature](https://blog.botframework.com/2018/09/25/enhanced-direct-line-authentication-features/).

During development, you will run your bot locally. Azure Bot Services will send activities to your bot through a public URL. You can use [ngrok](https://ngrok.com/) to expose your bot server on a public URL.

1. Run `ngrok http -host-header=localhost:3978 3978`

1. Update your Bot Channel Registration. You can use [Azure CLI](https://aka.ms/az-cli) or [Azure Portal](https://portal.azure.com)
   -  With Azure CLI
      -  Run `az bot update --resource-group <your-bot-rg> --name <your-bot-name> --subscription <your-subscription-id> --endpoint "https://a1b2c3d4.ngrok.io/api/messages"`
   -  With the Azure Portal
      -  Browse to Bot Channel Registration
      -  Select **Settings**
      -  In the **Configuration** section, set **Messaging Endpoint** to `https://a1b2c3d4.ngrok.io/api/messages`

## Set up bot and Direct Line
1. Create your bot at the [Power Virtual Agents portal](https://powerva.microsft.com)

1. Select **Manage** and then go to the **Channels** tab on the side navigation panel.

1. Select **Demo Website** and copy the bot's URL to your clipboard.

1. Retreive the `botid` and `bottenentid` from the URL, you will need to place these within `/bot/.env`
      -  `BOT_ID=8ef39aa5-81a8-460e-8a15-2ebc338ce456`  
      -  `BOT_TENANT_ID=816d751c-c4fd-48b0-bc7d-898eed92e911`    


## Prepare and run the code

1. Under each of the `bot` and `web` folders, run the following
   1. `npm install`
   1. `npm start`

1. Browse to http://localhost:3000/ to start the demo


## Code

-  `/bot/` is the bot server
-  `/web/` is the REST API for distributing Direct Line tokens
   -  `GET /api/directline/token` will generate a new Direct Line token for the React app
   -  During development-time, it will also serve the bot server via `/api/messages/`
      -  To enable this feature, add `PROXY_BOT_URL=http://localhost:3978` to `/web/.env`

## Overview

This sample includes multiple parts:

-  A basic web page with Web Chat integrated through a JavaScript bundle
-  A Restify web server for distributing tokens
   -  A REST API that generates Direct Line tokens for new conversations
-  Connection to the V2 bot engine allowing for dynamic responses based off configuration.


## Content of the .env files

The `.env` files hold the environment variables critical to run the service. This is usually security-sensitive information and must not be committed to version control. 

Although we recommend to keep them in [Azure Key Vault](https://azure.microsoft.com/en-us/services/key-vault/), for simplicity in this demo, we keep them in the `.env` files.

To ease the setup of this sample, the following is the template of the `.env` files.

### `/bot/.env`

```
MICROSOFT_APP_ID=12345678-1234-5678-abcd-12345678abcd
MICROSOFT_APP_PASSWORD=a1b2c3d4e5f6
```

### `/web/.env`

```
BOT_ID=8ef39aa5-81a8-460e-8a15-2ebc338ce456
BOT_TENANT_ID=816d751c-c4fd-48b0-bc7d-898eed92e911 
```


## Related links

-  [Setting up a new Bot Channel Registration](https://docs.microsoft.com/azure/bot-service/bot-service-quickstart-registration?view=azure-bot-service-3.0)
-  [Generating a Direct Line token](https://docs.microsoft.com/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0#generate-token)
-  [Enhanced Direct Line Authentication feature](https://blog.botframework.com/2018/09/25/enhanced-direct-line-authentication-features/)
-  [Add Power Virtual Agent bot to Azure Bot Service channels](https://docs.microsoft.com/power-virtual-agents/publication-connect-bot-to-azure-bot-service-channels)
