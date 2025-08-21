---
title: "Set up Dataverse for Teams environment management | MicrosoftDocs"
description: "Learn how to set up the Microsoft Teams governance components of the CoE Starter Kit"
author: manuelap-msft

ms.component: pa-admin
ms.topic: how-to
ms.date: 09/05/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set up Dataverse for Teams environment management

> [!IMPORTANT]
> Flows post adaptive cards to users using the [Microsoft Teams](/connectors/teams/) connector. The ability to post adaptive cards in Teams isn't available in Government Community Cloud (GCC) High and Department of Defence (DoD).
> The flows should remain **turned off** in these regions, since they don't fully work. If turned on, makers don't receive the request to submit a business justification via an adaptive card, therefore the [weekly cleanup](teams-governance.md#monitoring-and-weekly-cleanup-process) removes all Dataverse for Teams environments, since none have a business justification submitted.

This article helps you set up the Dataverse for Teams environment management components of the Governance solution. This set-up allows you to monitor new Dataverse for Teams environments.

For more information, see [Microsoft Dataverse for Teams environment management](teams-governance.md).

## Prerequisites

- [Install the governance components solution](before-setup-gov.md).
- [Set up your environment](setup.md#create-your-environments).
- Sign in to your environment with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

> [!NOTE]
> The Power Platform admin center automatically deletes an inactive Dataverse for Teams environment. For more information, see [Automatic deletion of inactive Microsoft Dataverse for Teams environments](../../admin/inactive-teams-environment.md).

## Set up the Dataverse for Teams environment management components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Teams environment governance**. This app provides a guided step by step experience through the configuration steps.

   :::image type="content" source="media/setupwizard-teams.png" alt-text="Screenshot of the CoE Starter Kit Setup Wizard." lightbox="media/setupwizard-teams.png":::

> [!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and set up the Inventory components manually.

## Set up the Dataverse for Teams environment management components manually

### Exempt environments from the empty environment processes

You can exempt certain environments from the empty environment clean-up process, using the Power Platform Admin View app.  

### Turn on flows

Turn on flows installed as part of the **Governance components** solution:

- [Microsoft Teams Admin | Weekly Clean Up of Microsoft Teams environments](governance-components.md#microsoft-teams-admin--weekly-clean-up-of-microsoft-teams-environments)
- [Microsoft Teams Admin | Ask for Business Justification when Microsoft Teams environment is created](governance-components.md#microsoft-teams-admin--ask-for-business-justification-when-microsoft-teams-environment-is-created)
- [Microsoft Teams Admin | Send Reminder Mail](governance-components.md#microsoft-teams-admin--send-reminder-mail)

[!INCLUDE[file-an-issue](../../includes/file-an-issue.md)]
