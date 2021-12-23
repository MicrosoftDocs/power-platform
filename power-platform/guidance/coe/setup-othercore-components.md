---
title: "Set up other core components | MicrosoftDocs"
description: "Setup instructions for how to set up the core admin components solution of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/10/2022
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up other core components

This article will help you to setup the remaining components in the Core solution, not related to [inventory](setup-core-components.md) and [environment request management](setup-environment-components.md). These components are related to **capacity alerting**, making apps discoverable in an **app catalog** and **welcoming new makers**.

>[!IMPORTANT]
> Get started by completing the **[Get started](setup.md)** and **[Setup Inventory](setup-core-components.md)** instructions. This article assumes you have your environment setup, and are logged in with the correct identity.

## Before you start

### Update environment variables

During solution import, you will configure environment variable values. Make sure to have the below information ready:

| Name | Description |
|------|---------------|
|Community URL  | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams). It is needed for the flow: Admin \| Welcome Email v3. See: [How will you communicate with your admins, makers and end users?](setup.md#how-will-you-communicate-with-your-admins-makers-and-end-users)  |

## Turn on flows

There are several flows which will need to be turned on for these components:  

- Admin | Capacity Alerts
- Admin | Welcome Email v3
- App Catalog > Request Access

## Share apps with admins and makers

Share the **Maker - Command Center** with your makers and assign them the **Power Platform Maker SR**.
Share the **App Catalog** with your end users and assign them the **Power Platform User SR**.

More information:
[Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)
[Share a canvas app in Microsoft Teams](faq.md#share-an-app-from-a-dataverse-for-teams-environment)

## All environment variables

Here is the full list of environment variables that impact other components. You may have to [update environment variables](faq.md#update-environment-variables) after import.

| Name | Description | Default Value |
|------|---------------|------|
|Community URL  | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams)  | n/a|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
