---
title: "Set up environment request components | MicrosoftDocs"
description: "Setup instructions for how to set up the environment request components solution of the CoE Starter Kit"
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

# Set up environment request components

This article will help you to set up the environment request components of the core solution, which automate the request, approval, and creation of environments and data loss prevention (DLP) policies.

>[!IMPORTANT]
>Complete the instructions in [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) before continuing with the setup here. This article assumes you have your [environment set up](setup.md#create-your-environments) and are logged in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

[Watch a walk-through](https://www.youtube.com/watch?v=16mspbGz1zA&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the environment and DLP request process works.

## Set up the Environment request components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Environment Request management**.
1. This app provides a guided step by step experience through the configuration steps.
        :::image type="content" source="media/setupwizard-env.png" alt-text="CoE Starter Kit Setup Wizard":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

## Set up the Environment request components manually

### Update environment variables values

[Update environment variables](faq.md#update-environment-variables) used by the environment request management components as described in the following table.

| Name | Description |
|------|---------------|
|Environment Request Admin App Url | Update this environment variable with the URL for the Admin - Environment Request canvas app. More information: [Get an app URL from a production environment](faq.md#get-a-power-apps-url-from-a-production-environment) |

### Turn on flows

There are several flows which will need to be turned on for these components:  

- DLP Request | Apply Policy to Environment (Child)
- DLP Request | Sync Policy to Dataverse (Child)
- DLP Request | Process Approved Policy Change
- DLP Request | Sync new Policy
- DLP Request | Sync Shared Policies
- Env Request | Cleanup environments
- Env Request | Create approved environment
- Env Request | Notify admin when new request submitted
- Env Request | Notify requestor when rejected

### Share apps with admins and makers

The environment request components consist of two apps:

- [**Admin - Environment Requests**](core-components.md#admin---environment-requests) app for admins to view and approve environment and connectors requests. Share this app with other admins, and assign them the Power Platform Admin SR security role.
- [**Maker - Environment Request**](core-components.md#maker---environment-requests) app for makers to request environments and connectors. Share this app with your makers, and assign them the Power Platform Maker SR security role.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)

## All environment variables

This section includes the full list of environment variables that affect the environment request components. You might have to [update environment variables](faq.md#update-environment-variables) after import.

| Name | Description | Default value
|------|---------------|------|
|Environment Request Admin App Url | Update this environment variable with the URL for the Admin - Environment Request canvas app. More information: [Get an app URL from a production environment](faq.md#get-a-power-apps-url-from-a-production-environment) | None |

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
