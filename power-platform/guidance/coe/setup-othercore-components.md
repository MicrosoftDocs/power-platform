---
title: "Set up environment request components | MicrosoftDocs"
description: "Setup instructions for how to set up the core admin components solution of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/13/2021
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

[!INCLUDE[cc-data-platform-banner](../../includes/cc-data-platform-banner.md)]

This article will help you to setup the remaining components in the Core solution, not related to [inventory](setup-core-components.md) and [environment request management](setup-environment-components.md). These components are related to **capacity alerting** and **welcoming new makers**.

>[!IMPORTANT]
> Get started by completing the [before the setup](before-setup.md) and [setup inventory](setup-core-components.md) instructions. This article assumes you have your environment setup, and are logged in with the correct identity.

## Before you start

### Update environment variables

During solution import, you will configure environment variable values. Make sure to have the below information ready:

| Name | Description |
|------|---------------|
|Community URL  | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams). It is needed for the flow: Admin | Welcome Email v3. Please refer to [What groups will you use](internal link to Before you Setup)  |

## Turn on flows

There are several flows which will need to be turned on for this component:  

- Admin | Capacity Alerts
- Admin | Welcome Email v3
- App Catalog > Request Access

## Share apps with admins and makers

Share the **Maker - Command Center** with your makers and assign them the **Power Platform Maker SR**.
Share the **App Catalog** with your end users and assign them the **Power Platform User SR**.

More information:
[Share a canvas app in Power Apps](/powerapps/maker/canvas-apps/share-app)
[Publish and add an app to Teams](/powerapps/teams/publish-and-share-apps#publish-and-add-an-app-to-teams)

## Environment variables in the Core components solution

Here is the full list of environment variables that impact other components. You may have to [update environment variables](setup-core-components.md#update- environment-variables) after import.

| Name | Description | Default Value |
|------|---------------|------|
|Community URL  | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams)  | n/a|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
