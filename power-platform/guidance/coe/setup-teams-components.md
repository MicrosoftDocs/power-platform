---
title: "Set up Dataverse for Teams environment management | MicrosoftDocs"
description: "Learn how to set up the Microsoft Teams governance components of the CoE Starter Kit"
author: manuelap-msft

ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/05/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set up Dataverse for Teams environment management

> [!IMPORTANT]
> The flows supporting this processes post adaptive cards to users using the [Microsoft Teams](/connectors/teams/) connector. The ability to post adaptive cards in Teams is not available in GCC High and DoD.
> It is important that these flows remain **turned off** in these regions as they will not work fully. If turned on, makers will never receive the request to submit a business justification via an adaptive card and the [weekly cleanup](teams-governance.md#monitoring-and-weekly-cleanup-process) will remove all Dataverse for Teams environments as none have a business justification submitted. 

This article will help you to setup the Dataverse for Teams environment management components of the Governance solution. Learn more: [Microsoft Dataverse for Teams environment management](teams-governance.md)

This set of functionality allows you to monitor new Dataverse for Teams environments.

> [!IMPORTANT]
> This article assumes you have [installed the governance components solution](before-setup-gov.md) and you have your [environment setup](setup.md#create-your-environments), and are logged in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

> [!NOTE]
> Automatically deleting an inactive Dataverse for Teams environment is now part of the Power Platform admin center. More information: [Automatic deletion of inactive Microsoft Dataverse for Teams environments](../../admin/inactive-teams-environment.md).

## Set up the Dataverse for Teams environment management components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Teams environment governance**.
1. This app provides a guided step by step experience through the configuration steps.
 :::image type="content" source="media/setupwizard-teams.png" alt-text="CoE Starter Kit Setup Wizard":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

## Set up the Dataverse for Teams environment management components manually

### Exempt environments from the empty environment processes

You may want to exempt certain environments from the empty environment cleanup process. You can exempt environments from the this process using the Power Platform Admin View app.  

### Turn on flows

Turn on these flows which are installed as part of the **Governance components** solution:

- [Microsoft Teams Admin | Weekly Clean Up of Microsoft Teams environments](governance-components.md#microsoft-teams-admin--weekly-clean-up-of-microsoft-teams-environments)
- [Microsoft Teams Admin | Ask for Business Justification when Microsoft Teams environment is created](governance-components.md#microsoft-teams-admin--ask-for-business-justification-when-microsoft-teams-environment-is-created)
- [Microsoft Teams Admin | Send Reminder Mail](governance-components.md#microsoft-teams-admin--send-reminder-mail)

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
