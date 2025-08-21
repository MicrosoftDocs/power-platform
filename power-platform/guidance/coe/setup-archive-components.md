---
title: "Set up inactivity notifications components | MicrosoftDocs"
description: "Learn how to set up the inactivity notifications components of the CoE Starter Kit"
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

# Set up inactivity processes

This article will help you to set up the inactivity notifications for unused canvas apps and cloud flows, and for how to clean up unused connection references.

>[!NOTE]
>These flows used to be called called "archive" flows, however they did not automatically archive apps and flows. The name has recently changed to "inactivity notifications", however if you are on an older version of the Governance components solution they may still be called "archive" flows.

You use this functionality to detect unused objects, and ask makers to either archive or unshare them to keep your tenant tidy.

>[!IMPORTANT]
>This article assumes you have [installed the governance components solution](before-setup-gov.md), and you have your [environment set up](setup.md#create-your-environments) and are signed in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

[Watch a walk-through](https://www.youtube.com/watch?v=PZ5u_2E9uUI&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the inactivity process works.

## Grant makers environment access

Make sure your environment isn't restricted with an [environment security group](limitations.md#security-groups-and-approvals).

## Set up the Inactivity process components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Inactivity notifications process**.
1. This app provides a guided step by step experience through the configuration steps.
 :::image type="content" source="media/setupwizard-inact.png" alt-text="CoE Starter Kit Setup Wizard":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

## Set up the Inactivity process components manually

### Configure mandatory environment variables

You'll [update these environment variables](faq.md#update-environment-variables) after you import the solution. Environment variables are used to store application and flow configuration data. This means that you only have to set the value once per environment, and it will be used in all necessary flows and apps in that environment.

>[!TIP]
>Learn how to update environment variables: [Update environment variables](faq.md#update-environment-variables).

| Name | Description |
|------|---------------|
| Individual Admin | This is separate from the Admin Email environment variable because you can't use a distribution list for approvals. This environment variable holds the individual or shared account who will be charged with approving the removal of unused orphaned objects. |
| Cleanup Old Objects App URL | (Optional) A link to the Cleanup Old Objects canvas app included in this solution. To make cleanup easier, any communication about old objects that are no longer considered to be useful will include this link. More information: [Get an app URL from a production environment](faq.md#get-a-power-apps-url-from-a-production-environment)|
| Flow Approvals URL | (Optional) A link to the Power Automate approval page for your CoE environment. To make cleanup easier, any communication about old objects that are no longer considered to be useful will include this link. To get the URL, go to flow.microsoft.com for your CoE environment > **Action Items** > **Approvals**. The URL will end in **approvals/received**. |  

### Exempt environments from the inactivity notifications process

You might want to exempt some environments from the inactivity notification process—for example, dedicated environments that are already well-managed. More information: [Establishing an environment strategy](../white-papers/environment-strategy.md)

You can exempt environments from the inactivity notification process by using the Power Platform Admin View app.  

1. Go to [make.powerapps.com](<https://make.powerapps.com>).
1. Go to your CoE environment.
1. Open the **Power Platform Admin View** app.
1. Select **Environments**, and then select the environment you want to exempt.
1. Set the **Excuse From Archival Flows** field to **Yes**.
1. Select **Save**.

   ![Exclude an environment from the inactivity notification process in a production environment.](media/coe-archive2.png "Exclude an environment from the inactivity notification in a production environment")

### Turn on flows

Turn on the following flows, which are installed as part of the governance components solution:

- [Admin | Inactivity notifications v2 (Check Approval)](governance-components.md#admin--inactivity-notifications-check-approval)
- [Admin | Inactivity notifications v2 (Clean Up and Delete)](governance-components.md#admin--inactivity-notifications-clean-up-and-delete)
- [Admin | Inactivity notifications v2 (Start Approval for Apps)](governance-components.md#admin--inactivity-notifications-v2-start-approval-for-apps)
- [Admin | Inactivity notifications v2 (Start Approval for Flows)](governance-components.md#admin--inactivity-notifications-v2-start-approval-for-flows)
- [Admin | Email Managers Ignored Approvals](governance-components.md#admin--email-managers-ignored-inactivity-notifications-approvals)

### Share apps with makers

The governance components solution contains the [Cleanup Old Objects App](governance-components.md#cleanup-old-objects-app) app for makers and admins to manage archive approvals. Share this app with your makers and admins, assigning them the Power Platform Maker SR security role.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)

Consider adding this app to the **CoE Maker Command Center** for makers to easily find and access it.

## All environment variables

This section includes the full list of environment variables that affect the compliance process, including environment variables with default values. You might have to [update environment variables](faq.md#update-environment-variables) after import.

>[!IMPORTANT]
> You don't have to change the values during setup, just when you need to change the value of an environment variable that you configured during import or when you want to change a default value. To make sure the latest values are picked up, restart all flows after you change environment variables.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default value |
|------|---------------|------|
| Individual Admin | This is separate from the Admin Email environment variable because you can't use a distribution list for approvals. This environment variable holds the individual or shared account who will be charged with approving the removal of unused orphaned objects. | None |
| Auto Delete on Archive | Determines whether apps and flows are deleted when they're approved for deletion in the following flow: Admin \|Inactivity notifications v2 (Check Approval) and Admin \|Inactivity notifications v2 (Clean Up and Delete). The value must be Yes or No.  | Yes |
| Cleanup Old Objects App URL | (Optional) A link to the Cleanup Old Objects canvas app included in this solution. To make cleanup easier, any communication about old objects that are no longer considered to be useful will include this link. More information: [Get an app URL from a production environment](faq.md#get-a-power-apps-url-from-a-production-environment) | None |
| Flow Approvals URL | (Optional) A link to the Power Automate approval page for your CoE environment. To make cleanup easier, any communication about old objects that are no longer considered to be useful will include this link. To get the URL, go to make.powerautomate.com for your CoE environment > **Action Items** > **Approvals**. The URL will end in **approvals/received**.|  None |
| ProductionEnvironment | Set to **No** if you've installed the solution for development or test purposes. This will send approvals to the admin email instead of the maker. | Yes |
| InactivityNotifications-PastTime-Interval | The interval for the past time for how far back to go to see if an app/flow is useful. | 6 (months) |
| InactivityNotifications-PastTime-Unit | The units for the past time for how far back to go to see if an app/flow is useful. | Month. |


[!INCLUDE[file-an-issue](../../includes/file-an-issue.md)]