---
title: "Set up Developer Compliance components"
description: "Learn how to set up the governance components for the Microdoft CoE Starter Kit."
author: manuelap-msft

ms.component: pa-admin
ms.topic: how-to
ms.date: 06/13/2024
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set up Developer Compliance components

This article helps you to set up the [Developer Compliance Center](example-processes.md) components of the **Core** and **Governance** solutions of the CoE Starter Kit.  

You can detect frequently used apps and chatbots in your tenant and request that their makers provide more information about them, such as a business justification, data classification, and support plan. The goal is for admins to have better visibility into the solutions built by their makers and support them in making decisions. For example, admins might decide to move highly used applications to a dedicated environment.

## Prerequisites

1. [Install the governance components solution](before-setup-gov.md).
1. [Set up your environment](setup.md#create-your-environments).
1. Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

[Watch a walk-through](https://www.youtube.com/watch?v=WXXFjHLt5ss&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the compliance process works.

## Set up the Developer Compliance components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Compliance process**.

This app guides you through the configuration steps.
:::image type="content" source="media/setupwizard-compliance.png" alt-text="Screenshot that shows the CoE Starter Kit Setup Wizard compliance process." lightbox="media/setupwizard-compliance.png":::

> [!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and set up the Inventory components manually.

## Set up the Developer Compliance request components manually

### Configure mandatory environment variables

This step gets completed after you import the solution. Environment variables store application and flow configuration data. Using environment variables means that you only have to set the value once per environment and used in all necessary flows and apps in that environment.

> [!TIP]
> Learn how to update environment variables: [Update Environment Variables](faq.md#update-environment-variables).

The `Developer Compliance Center URL` should be set to the URL for the **Developer Compliance Center** app.

For more information, see [Get App URL – Production Environment](faq.md#get-a-power-apps-url-from-a-production-environment).

### Exempt environments from the compliance process

You can exempt environments from the compliance process, for example well-managed and dedicated environments or the environment with the CoE Starter Kit. For more information, see [Establishing an environment strategy](/power-platform/guidance/white-papers/environment-strategy).

You can exempt environments from the compliance process using the Power Platform Admin View app:  

1. Go to [make.powerapps.com](<https://make.powerapps.com>).
1. Go to your CoE environment.
1. Open the **Power Platform Admin View** app.
1. Select **Environments**, then choose the environment you want to exempt.
1. Set the **Excuse From Compliance Flow** field to *Yes*.
1. Select **Save**.

   :::image type="content" source="media/coe-compliance1.png" alt-text="Screenshot that shows where the Excuse From Compliance Flow setting is located." lightbox="media/coe-compliance1.png":::

### Turn on flows

Turn on these flows that are installed as part of the Core components solution:

- Admin: Compliance request complete apps v3
- Admin: Compliance request complete bots v3
- Admin: Compliance request complete custom connector v3
- Admin: Compliance request complete flows v3
- Admin: Compliance Teams Environment BPF kickoff v3
- Admin: Compliance Details Request eMail (Apps)
- Admin: Compliance Details Request eMail (Chatbots)
- Admin: Compliance Details Request eMail (Custom Connectors)
- Admin: Compliance Details Request eMail (Desktop Flows)
- Admin: Compliance Details Request eMail (Flows)
- **Admin: Compliance detail request v3**(governance-components.md#admin:-compliance-detail-request-v3)

### Share apps with makers

The **Governance Components** solution contains the [**Developer Compliance Center**](governance-components.md#developer-compliance-center) app, which is used by makers to update the compliance details of their applications. Share these apps with your Power Platform makers and assign them the **Power Platform Maker SR** security role.

For more information, see [Share an app in Power Apps](faq.md#share-an-app-from-a-production-environment).

Your app, flow, and bot makers use the Developer Compliance Center app to get more information about the resources they're building. You can get familiar with the [audit process](example-processes.md) and share the app with your makers.

> [!TIP]
> Consider adding the **Developer Compliance Center** app to the **CoE Maker Command Center** for makers to easily find and access.

## All environment variables

Here's the full list of environment variables used as part of the compliance process, including environment variables with default values. You might have to [update environment variables](faq.md#update-environment-variables) after import.

> [!IMPORTANT]
> You don't have to change the environment variable values during setup. You can change the value you configured during import or when you want to change a default value. Restart all flows after you change environment variables to make sure the latest value is in effect.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default Value |
|------|---------------|------|
| Developer Compliance Center URL  | Set this environment variable to the URL for the **Developer Compliance Center** app. For more information, see [Get App URL – Production Environment](faq.md#get-a-power-apps-url-from-a-production-environment) | n/a |
| Compliance – Apps – Number Days Since Published | If an app is broadly shared and last published this many days ago or older, makers should republish the app to stay compliant. | 60 |
| Compliance – Apps – Number Groups Shared | If the app is shared with this many or more groups, makers are asked for a business justification. | 1 |
| Compliance – Apps – Number Launches Last 30 Days | If the app launched at least this many times in the last 30 days, makers are asked for a business justification. | 30 |
| Compliance – Apps - Number Users Shared | If the app is shared with this many or more users, makers are asked for a business justification. | 20 |
| Compliance – Chatbots – Number Launches | If the chatbot is launched this many or more times, makers are asked for a business justification. | 50 |

[!INCLUDE[file-an-issue](../../includes/file-issue.md)]