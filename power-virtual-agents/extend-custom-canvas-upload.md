---
title: "Upload attachments in Power Virtual Agent bot conversations"
description: "Connect your bot to Azure Storage so users can upload attachments within a bot conversation (dev coding required)."
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

# Connect your Power Virtual Agents bot to Azure Storage

You can configure your Power Virtual Agents bot so users can directly upload files to an Azure Storage blob, and then send the blob URL to the bot for validation and further processing.

This article describes how to set up a demo to test and configure this functionality.

>[!NOTE]
>Instructions in this section require software development from you or your developers. It is intended for experienced IT professionals, such as IT admins or developers who have a solid understanding of developer tools, utilities, and IDEs.

## Direct line storage considerations

[Direct line](https://docs.microsoft.com/azure/bot-service/bot-service-channel-directline?view=azure-bot-service-4.0) provides a temporary storage of user attachments, up to 4 MB per attachment for about 24 hours. If the user needs to upload more than 4 MB, you should use your own storage rather than direct line.

>[!IMPORTANT]
>When handling user input such as attachments, verify that the attachment is free of inappropriate content and is what your bot expected to receive.

>[!IMPORTANT]
>When dealing with personal data, respect user privacy. Follow platform guidelines and post your privacy statement online.


## How to run locally

This demo integrates with multiple services that you need to set up to host the demo.

1. [Clone the code](#clone-the-code)
1. [Set up Azure storage](#set-up-azure-storage)
1. [Set up Azure Bot Services](#set-up-azure-bot-services)
1. [Set up the bot and direct line](#set-up-the-bot-and-direct-line)
1. [Prepare and run the code](#prepare-and-run-the-code)

## Clone the code

To host this demo, you will need to clone the code and run it locally.

1. Clone this repository (https://github.com/microsoft/dynamics365-virtualagent-samples/tree/master/Utilities/ContentConverter)
1. Create two empty files for environment variables, `/bot/.env` and `/web/.env`

## Set up Azure storage

This procedure creates new Azure storage for temporary storage of user uploads.

1. Sign into the Azure Portal and create a new storage account.
   1. Browse to https://ms.portal.azure.com/#create/Microsoft.StorageAccount
   1. Fill out **Storage account name**, for example, `webchatsampleuploadtoazure`
   1. Select **Review + create**.

1. Save the account name and key.
   1. Select **Access keys**.
   1. Copy **Storage account name** and save it to both `/bot/.env` and `/web/.env`
      - `AZURE_STORAGE_ACCOUNT_NAME=youraccountname`
   1. Copy **Key** of **key1** and save it to both `/bot/.env` and `/web/.env`
      - `AZURE_STORAGE_ACCOUNT_KEY=a1b2c3d`

1. Create a new blob container named **userupload**.
   1. Select **Blobs**.
   1. Select **+ Container**.
   1. In the **Name** field, type `userupload`
   1. Leave the **Public access level** field as **Private (no anonymous access)**.
   1. Select **OK**.

1. Add an automatic clean-up rule.
   1. Select **Lifecycle Management**.
   1. Select **Add rule**.
   1. In the **Rule name** field, type `clean-up-userupload`
   1. Select **Delete blob**.
   1. In the **Days after last modification** field under **Delete blob**, type `1`
   1. Select **Next : Filter set >**
   1. Under **Prefix match**, type `userupload`
   1. Select **Next : Review + add >**.
   1. Select **Add**.

## Set up Azure Bot Services

>[!TIP]
> We suggest you use [Bot Channel Registration](https://ms.portal.azure.com/#create/Microsoft.BotServiceConnectivityGalleryPackage) during development. Bot Channel Registration will help you diagnose problems locally without deploying to the server, and speed up development.

You can follow the instructions at [Setup a new Bot Channel Registration](https://docs.microsoft.com/azure/bot-service/bot-service-quickstart-registration?view=azure-bot-service-3.0).

1. Save the Microsoft App ID and password to `/bot/.env`
   -  `MICROSOFT_APP_ID=12345678-1234-5678-abcd-12345678abcd`
   -  `MICROSOFT_APP_PASSWORD=a1b2c3d4e5f6`

>[!IMPORTANT]
>When you are building your production bot, never expose your web chat or direct line secret to the client. 
>Instead, you should use the secret to generate a limited token and send it to the client. 
>For more information, refer to the documentation about [direct line token generation](https://docs.microsoft.com/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0#generate-token) and the [enhanced direct line authentication feature](https://blog.botframework.com/2018/09/25/enhanced-direct-line-authentication-features/).

During development, you will run your bot locally. Azure Bot Services will send activities to your bot through a public URL. You can use [ngrok](https://ngrok.com/) to expose your bot server on a public URL.

1. Run `ngrok http -host-header=localhost:3978 3978`

1. Update your Bot Channel Registration. You can use [Azure CLI](https://aka.ms/az-cli) or [Azure Portal](https://portal.azure.com)
   -  With Azure CLI
      -  Run `az bot update --resource-group <your-bot-rg> --name <your-bot-name> --subscription <your-subscription-id> --endpoint "https://a1b2c3d4.ngrok.io/api/messages"`
   -  With the Azure Portal
      -  Browse to Bot Channel Registration
      -  Select **Settings**
      -  In the **Configuration** section, set **Messaging Endpoint** to `https://a1b2c3d4.ngrok.io/api/messages`

## Set up the bot and direct line
1. Create your bot at the [Power Virtual Agents portal](https://powerva.microsft.com).

1. Select **Manage** and then go to the **Channels** tab on the side navigation panel.

1. Select **Demo Website** and copy the bot's URL to your clipboard.

1. Retrieve the `botid` and `bottenentid` from the URL, you will need to place these within `/bot/.env`
      -  `BOT_ID=<your bot ID>`  
      -  `BOT_TENANT_ID=<your bot tenant ID>`


## Prepare and run the code

1. Under each of the `bot` and `web` folders, run the following:
   1. `npm install`
   1. `npm start`

1. Browse to http://localhost:3000/ to start the demo.

## Code

-  `/bot/` is the bot server
-  `/web/` is the REST API for distributing Shared Access Signature (SAS) tokens
   -  `GET /api/directline/token` will generate a new direct line token for the react app
   -  `GET /api/azurestorage/uploadsastoken` will generate a new shared access signature token for the web app to upload a file
   -  During development, it will also serve the bot server via `/api/messages/`
      -  To enable this feature, add `PROXY_BOT_URL=http://localhost:3978` to `/web/.env`

## Overview

This sample includes multiple parts:

-  A basic web page with web chat integrated via JavaScript bundle
-  Azure storage with blob container named `userupload`
-  A restify web server for distributing tokens
   -  A REST API that generates direct line tokens for new conversations
   -  A REST API that generates shared access signature tokens for temporary storage of attachments
-  A bot that would verify and process uploaded attachments

## Goals

-  When the user sends one or more attachments, it will be uploaded to Azure Storage using a shared access signature token.
   -  For security reason, the token should not allow the bearer to re-download the file.
   -  After upload, web chat will send an event activity named "upload" to the bot with blob URLs.
-  When the bot receives the "upload" event activity, it will start validating each uploaded blob and process it.
-  Azure Storage for temporary upload will be automatically cleaned up daily.

### Uploading attachments

When a user starts uploading files, web chat will dispatch `WEB_CHAT/SEND_FILES` action. In our web app, we will intercept this action. Instead, we will read each attachment as `ArrayBuffer` and upload to Azure Storage using a SAS token.

After all attachments are uploaded to Azure Storage, we will send an event activity named `upload` to the bot with the array of URLs pointing to every attachment.

>[!Note]
>The SAS token allows the user to upload huge files that may incur unexpected charges to your system. 
>You should take countermeasures against abuse. 
>For example, using reverse-proxy, removing files more frequently, or capping the size that your system can handle per hour based on certain demographic data.




### Processing attachments

>[!IMPORTANT]
>It is critical that you verify the uploaded files before continuing to process them in your system.

When the bot receives event activity named `upload`, it will start validating the content of the file, and respond to the user with the result of the validation.

In our sample, we will only read metadata and properties from each blob, and respond with a thumbnail card.

In your production system, you should always verify if the uploaded file is valid and contains appropriate content. To continue processing the files, you should copy the uploaded files into a separate container. You can use [Azure Service Bus](https://docs.microsoft.com/azure/service-bus/) or [Azure Queue Storage](https://azure.microsoft.com/services/storage/queues/) for long-processing jobs.

### Automatic clean up of temporary storage

We use the [Lifecycle Management](https://docs.microsoft.com/azure/storage/blobs/storage-lifecycle-management-concepts) feature from Azure Storage. 

## Content of the .env files

The `.env` files hold the environment variables critical to run the service. This is usually security-sensitive information and must not be committed to version control. 

Although we recommend to keep them in [Azure Key Vault](https://azure.microsoft.com/services/key-vault/), for simplicity in this demo, we keep them in the `.env` files.

To ease the setup of this sample, the following is the template of the `.env` files.

### `/bot/.env`

```
AZURE_STORAGE_ACCOUNT_NAME=youraccountname
AZURE_STORAGE_ACCOUNT_KEY=a1b2c3d
MICROSOFT_APP_ID=12345678-1234-5678-abcd-12345678abcd
MICROSOFT_APP_PASSWORD=a1b2c3d4e5f6
```

### `/web/.env`

```
AZURE_STORAGE_ACCOUNT_NAME=youraccountname
AZURE_STORAGE_ACCOUNT_KEY=a1b2c3d
BOT_ID=21wejwl2-2j34-dse3-12df-1123rgted34
BOT_TENANT_ID=3fde45d-32we-3342-ewer-err3fr32564 
```



## Further reading

-  [Add Power Virtual Agents bots to Azure Bot Service channels](https://docs.microsoft.com/power-virtual-agents/publication-connect-bot-to-azure-bot-service-channels)
-  [Power Virtual Agents documentation](https://docs.microsoft.com/power-virtual-agents/overview)
-  [Setting up a new Bot Channel Registration](https://docs.microsoft.com/azure/bot-service/bot-service-quickstart-registration?view=azure-bot-service-3.0)
-  [Generating a direct line token](https://docs.microsoft.com/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0#generate-token)
-  [Enhanced direct line authentication feature](https://blog.botframework.com/2018/09/25/enhanced-direct-line-authentication-features/)
-  [Azure Storage: Setting up storage lifecycle management](https://docs.microsoft.com/azure/storage/blobs/storage-lifecycle-management-concepts)
-  [Microsoft Flow documentation](https://docs.microsoft.com/flow/)
