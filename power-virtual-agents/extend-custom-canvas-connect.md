---
title: "Connect Power Virtual Agents to a custom canvas"
description: "Use an advanced custom canvas to change the display and functionality of your bot (development coding required)."
keywords: ""
ms.date: 12/5/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "extend, azure, byoc"
ms.collection: virtualagent
---

# Customize the look and feel of your bot chat canvas

Power Virtual Agents allows you customize the look and feel of your bot's chat canvas. Our chat canvas builds on the highly customizable [Bot Framework Web Chat canvas](https://github.com/microsoft/BotFramework-WebChat). This article explains how you can customize your canvas and connect it with a Power Virtual Agents bot.

>[!IMPORTANT]
>When dealing with personal data, respect user privacy. Follow platform guidelines and post your privacy statement online.

>[!WARNING]
>Creating a custom canvas requires software development. Our guidance here is intended for experienced IT professionals, such as IT admins or developers who have a solid understanding of developer tools, utilities, and IDEs.

## Pick a sample to customize

We recommend starting with one of the samples custom built to work with Power Virtual Agents (see table below) or [pick a sample provided by Bot Framework](https://github.com/microsoft/BotFramework-WebChat#samples-list).

| Samples name | Description | Screenshot |
| ------------ | ----------- | :----: |
| 1. [Full bundle](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BuildYourOwnCanvasSamples/1.starter-full-bundle) | Custom canvas capable of showing all rich content from Power Virtual Agents | (image) |
| 2. [Location and file uploading](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BuildYourOwnCanvasSamples/2.location-and-file-uploading) | Custom canvas capable of getting user's location and sending it to a bot using Power Virtual Agents | (image) |
| [Other samples](https://github.com/microsoft/BotFramework-WebChat/#samples-list) | Other sample web chat canvases provided by Bot Framework | -  | 

## Retrieve Bot ID and Tenant ID details

Next, you will need to retrieve your bot details to configure the custom canvas to send and receive messages from your bot.

1. Select **Manage** and then go to the **Channels** tab on the side navigation panel.

1. Select **Demo Website** and copy the bot's URL to your clipboard.

1. Retrieve the `botid` and `bottenantid` from the URL and save it, you will need to reference this later
      -  `BOT_ID=<your bot ID>`  
      -  `BOT_TENANT_ID=<your bot tenant ID>`    

## Update environment files

Next, you will need to update `.env` files from your sample web chat canvas.

### `/web/.env`

```
BOT_ID=21wejwl2-2j34-dse3-12df-1123rgted34
BOT_TENANT_ID=3fde45d-32we-3342-ewer-err3fr32564
```

## Customize canvas using `sytlesetOptions`

You can now customize your canvas by updating `styleSetOptions`, which is the supported method of changing existing DOM elements in the canvas. A full list of customizable look and feel properties are shown in [defaultStyleOptions.js](https://github.com/microsoft/BotFramework-WebChat/blob/master/packages/component/src/Styles/defaultStyleOptions.js)

## Host your custom canvas

Once you've customized the look and feel of the bot, you must deploy your custom canvas for your users to use it with your Power Virtual Agents bot.

## Related links

-  [Bot Framework Web Chat](https://github.com/microsoft/BotFramework-WebChat)
-  [Generating a direct line token](https://docs.microsoft.com/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0#generate-token)
