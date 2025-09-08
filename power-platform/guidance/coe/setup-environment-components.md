---
title: "Set up environment request components"
description: "Learn how to set up the environment request components solution of the Microsoft CoE Starter Kit."
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

# Set up environment request components

This article helps you set up the environment request components of the core solution, which automate the request, approval, and creation of environments and data policies.

## Prerequisites

- Complete [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md).
- [Set up your environments](setup.md#create-your-environments).
- Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

[Watch a walk-through](https://www.youtube.com/watch?v=16mspbGz1zA&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the environment and DLP request process works.

## Set up the Environment request components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Environment Request management**.
1. This app provides a guided step by step experience through the configuration steps.

   :::image type="content" source="media/setupwizard-env.png" alt-text="Screenshot showing the CoE Starter Kit Setup Wizard." lightbox="media/setupwizard-env.png":::

> [!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and set up the inventory components manually.

## Set up the Environment request components manually

### Update environment variables

Update the `Environment Request Admin App Url` environment variable with the URL for the **Admin - Environment Request** canvas app. You can [Get a Power Apps URL from a production environment](faq.md#get-a-power-apps-url-from-a-production-environment).

Learn more in [Update environment variables](faq.md#update-environment-variables). These variables are used by the environment request management components.

### Turn on flows

Turn on these flows for the following components:  

- DLP Request: Apply Policy to Environment (Child)
- DLP Request: Sync Policy to Dataverse (Child)
- DLP Request: Process Approved Policy Change
- DLP Request: Sync new Policy
- DLP Request: Sync Shared Policies
- Env Request: Cleanup environments
- Env Request: Create approved environment
- Env Request: Notify admin when new request submitted
- Env Request: Notify requestor when rejected

### Share apps with admins and makers

The environment request components are two apps. One app for admins and one for makers. Both apps can be shared with admin and makers who you can assign to a Power Platform Maker SR security role.

- [**Admin - Environment Requests**](core-components.md) app for admins to view and approve environment and connectors requests.
- [**Maker - Environment Request**](core-components.md) app for makers to request environments and connectors.

Learn more in [Share an app from a production environment](faq.md#share-an-app-from-a-production-environment).

## All environment variables

Environment variables can affect the environment request components.

Update the `Environment Request Admin App Url` variable with the URL for the **Admin - Environment Request** canvas app. You can [get a Power Apps URL from a production environment](faq.md#get-a-power-apps-url-from-a-production-environment). There's no default value for this environment variable.

You might have to [update environment variables](faq.md#update-environment-variables) after import.

[!INCLUDE[file-an-issue](../../includes/file-issue.md)]
