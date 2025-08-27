---
title: "Set up app quarantine components | MicrosoftDocs"
description: "Learn how to set up the app quarantine components of the CoE Starter Kit"
author: manuelap-msft
ms.service: power-platform
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/13/2024
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---

# Set up app quarantine components

This article will help you to set up the app quarantine components of the governance solution. A quarantined app will present end users who launch the app a message indicating they’re unable to access the app. This feature is currently only available for canvas apps. Learn more: [Manage app quarantine state](/power-platform/admin/admin-manage-apps#manage-app-quarantine-state)

>[!IMPORTANT]
>This article assumes you have [installed the governance components solution](before-setup-gov.md), and you have your [environment set up](setup.md#create-your-environments) and are signed in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

## Set up the App quarantine components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Compliance process**.
1. This app provides a guided step by step experience through the configuration steps.
     :::image type="content" source="media/setupwizard-compliance.png" alt-text="CoE Starter Kit Setup Wizard":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

## Set up the App quarantine components manually

### Configure mandatory environment variables

[Update environment variables](faq.md#update-environment-variables) after you import the solution. Environment variables are used to store application and flow configuration data. This means that you only have to set the value once per environment, and it will be used in all necessary flows and apps in that environment.

>[!TIP]
>Learn how to [update environment variables](faq.md#update-environment-variables).

| Name | Description | Default value |
|------|---------------|------|
| Quarantine Apps after x days of non-compliance | If using the Compliance flow for apps to gather compliance details from makers, specify whether you want to quarantine apps if they're not compliant and for how many days.  | 7 days |

### Add or exempt environments from the app quarantine process

You might want to exempt some environments from the app quarantine process—for example, dedicated environments that are already well-managed. More information: [Establishing an environment strategy](/power-platform/guidance/white-papers/environment-strategy)

You can exempt environments from the app quarantine process by using the Power Platform Admin View app.  

1. Go to [make.powerapps.com](<https://make.powerapps.com>).
1. Go to your Center of Excellence (CoE) environment.
1. Open the **Power Platform Admin View** app.
1. Select **Environments**, and then select the environment you want to exempt.
1. Set the **Excuse From App Quarantine Flow** field to **Yes** to exempt the environment from the app quarantine flow. Set the **Excuse From App Quarantine Flow** field to **No** to include the environment in the app quarantine flow.
    >[!NOTE]
    >Due to the impact of quarantining apps, all environments are initially exempt from the quarantine process and you will have to manually update environments to include them in the quarantine process.
1. Select **Save**.

   ![Exclude an environment from the app quarantine process in a production environment.](media/quarantine1.png "Exclude an environment from the app quarantine process in a production environment")

### Turn on flows

Turn on the following flows, which are installed as part of the governance components solution:

- [Admin | Quarantine non-compliant apps](governance-components.md#admin--quarantine-non-compliant-apps)
- [Admin | Set app quarantine status](governance-components.md#admin--set-app-quarantine-status)

## All environment variables

This section includes the full list of environment variables that affect the compliance process, including environment variables with default values. You might have to [update environment variables](faq.md#update-environment-variables) after import.

>[!IMPORTANT]
> You don't have to change the values during setup, just when you need to change the value of an environment variable that you configured during import or when you want to change a default value. To make sure the latest values are picked up, restart all flows after you change environment variables.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default value |
|------|---------------|------|
| Quarantine Apps after x days of non-compliance | If using the Compliance flow for apps to gather compliance details from makers, specify whether you want to quarantine apps if they're not compliant and for how many days.  | 7 days |

[!INCLUDE[file-an-issue](../../includes/file-issue.md)]
