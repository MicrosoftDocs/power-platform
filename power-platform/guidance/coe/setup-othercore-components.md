---
title: "Set up other core components | MicrosoftDocs"
description: "Setup instructions for how to set up other parts of the core admin components solution of the CoE Starter Kit"
author: manuelap-msft

ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/08/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---

# Set up other core components

This article will help you to setup the remaining components in the Core solution, not related to [inventory](setup-core-components.md) and [environment request management](setup-environment-components.md). These components are related to **capacity alerting**, making apps discoverable in an **app catalog** and **welcoming new makers**.

>[!IMPORTANT]
>Complete the instructions in [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) before continuing with the setup here. This article assumes you have your [environment set up](setup.md#create-your-environments) and are logged in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

## Set up other core components using the Setup Wizard (preview)

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Capacity alerts and Welcome email**.
1. This app provides a guided step by step experience through the configuration steps.
 :::image type="content" source="media/setupwizard-other.png" alt-text="CoE Starter Kit Setup Wizard":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

## Set up other core components manually

### Update environment variables

[Update environment variables](faq.md#update-environment-variables) used by these components:

| Name | Description |
|------|---------------|
|Community URL  | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams). It is needed for the flow: Admin \| Welcome Email v3. See: [How will you communicate with your admins, makers and end users?](setup.md#how-will-you-communicate-with-your-admins-makers-and-users)  |

### Turn on flows

There are several flows which will need to be turned on for these components:  

- [Admin | Capacity Alerts](core-components.md#flows-2)
- [Admin | Add-Ons Alerts](core-components.md#flows-2)
- [Admin | Welcome Email v3](core-components.md#flows-2)
- [App Catalog > Request Access](core-components.md#flows-2)

>[!IMPORTANT]
> The [Admin | Welcome Email v3](core-components.md#flows-2) flow automatically adds new makers to the [Power Platform Maker Microsoft 365 Group](setup-core-components.md#all-environment-variables) environment variable. See: See: [How will you communicate with your admins, makers and end users?](setup.md#how-will-you-communicate-with-your-admins-makers-and-users)

### Share apps with admins and makers

Share the **CoE Maker Command Center** with your makers and assign them the **Power Platform Maker SR**.
Share the [**App Catalog**](core-components.md#app-catalog) with your end users and assign them the **Power Platform User SR**.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)

## All environment variables

Here is the full list of environment variables that impact other components. You may have to [update environment variables](faq.md#update-environment-variables) after import.

| Name | Description | Default Value |
|------|---------------|------|
|Community URL  | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams)  | n/a|

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
