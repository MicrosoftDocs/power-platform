---
title: "Set up environment request components | MicrosoftDocs"
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

# Set up environment request components

This article will help you to setup the environment request components of the Core solution, which automate the request, approval and creation of environments and Data Loss Prevention (DLP) policies.

>[!IMPORTANT]
>Complete the **[Get started](setup.md)** and **[Setup Inventory](setup-core-components.md)** instructions before continuing with the setup here. This article assumes you have your environment setup, and are logged in with the correct identity.

## Before you start

### Update environment variables values

[Update environment variables](faq.md#update-environment-variables) used by the environment request management components:

| Name | Description |
|------|---------------|
|Environment Request Admin App Url | Update this environment variable with the URL for the **Admin - Environment Request** canvas app. See: [Get App URL – Production Environment](faq.md#get-a-power-apps-url-from-a-production-environment) or [Get App URL – Teams Environment](faq.md#add-apps-to-microsoft-teams) |

## Turn on flows

There are several flows which will need to be **turned on** for these components:  

- DLP Request | Make approved policy change
- Env Request | Cleanup expired environments
- Env Request | Create approved environment
- Env Request | Notify admin when new request submitted
- Env Request | Notify requestor when rejected

## Share apps with admins and makers

The Environment Request components consist of two apps:

- **Admin - Environment Request** app for admins to view and approve environment and connectors requests - share this app with other admins and assign them the **Power Platform Admin SR** security role.
- **Environment Request** app for makers to request environments and connectors - share this app with your makers and assign them the **Power Platform Maker SR** security role.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)
- [Share a canvas app in Microsoft Teams](faq.md#share-an-app-from-a-dataverse-for-teams-environment)

## All environment variables

Here is the full list of environment variables that impact the environment request components. You may have to [update environment variables](faq.md#update-environment-variables) after import.

| Name | Description | Default Value
|------|---------------|------|
|Environment Request Admin App Url | Update this environment variable with the URL for the **Admin - Environment Request** canvas app. See: [Get App URL – Production Environment](faq.md#get-a-power-apps-url-from-a-production-environment) or [Get App URL – Teams Environment](faq.md#add-apps-to-microsoft-teams) | n/a |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
