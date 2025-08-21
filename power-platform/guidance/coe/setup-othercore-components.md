---
title: "Set up other core components"
description: "Learn how to set up other parts of the core admin components solution of the Microsoft CoE Starter Kit."
author: manuelap-msft

ms.component: pa-admin
ms.topic: how-to
ms.date: 02/08/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set up other core components

This article helps you set up the remaining components in the core solution, not related to [inventory](setup-core-components.md) and [environment request management](setup-environment-components.md). These components are related to **capacity alerting**, making apps discoverable in an **app catalog** and **welcoming new makers**.

## Prerequisites

1. Complete the [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) steps.
1. [Set up your environment](setup.md#create-your-environments).
1. Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

## Set up other core components using the Setup Wizard (preview)

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Capacity alerts and Welcome email**.

This app provides a guided step by step experience through the configuration steps.

:::image type="content" source="media/setupwizard-other.png" alt-text="Screenshot that shows the CoE Starter Kit Setup Wizard for other core components." lightbox="media/setupwizard-other.png":::

> [!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and set up the Inventory components manually.

## Set up other core components manually

### Update environment variables

[Update environment variables](faq.md#update-environment-variables) used by these components:

The **Community URL** lets you link to your internal Microsoft Power Platform community, for example Yammer or Teams. You need the URL for the flow: Admin: Welcome Email v3. For more information, see [How to communicate with your admins, makers, and end users](setup.md#whats-the-best-way-to-communicate-with-admins-makers-and-users).

### Turn on flows

There are several flows which need to be turned on for these components:  

- [Admin: Capacity Alerts](core-components.md)
- [Admin: Add-Ons Alerts](core-components.md)
- [Admin: Welcome Email v3](core-components.md)
- [App Catalog > Request Access](core-components.md)

> [!IMPORTANT]
> The [Admin | Welcome Email v3](core-components.md) flow automatically adds new makers to the [Power Platform Maker Microsoft 365 Group](setup-core-components.md#all-environment-variables) environment variable. For more information, see: [How to communicate with your admins, makers, and end users](setup.md#whats-the-best-way-to-communicate-with-admins-makers-and-users).

### Share apps with admins and makers

You can share these apps with makers or end users, then assign them the **Power Platform Maker SR** security role.

- The **CoE Maker Command Center** for makers.
- The [**App Catalog**](core-components.md#app-catalog) for end users.

For more information, see [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment).

## All environment variables

This environment variable affects other components:

`Community URL`: Allows you to link to your internal Microsoft Power Platform community, for example Yammer or Teams. There's no default option for this variable.

You might need to [update environment variables](faq.md#update-environment-variables) after import.

[!INCLUDE[file-an-issue](../../includes/file-an-issue.md)]
