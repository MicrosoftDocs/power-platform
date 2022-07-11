---
title: "Set up Dataverse for Teams environment management | MicrosoftDocs"
description: "Learn how to set up the Microsoft Teams governance components of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet

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

# Set up Dataverse for Teams environment management

>[!IMPORTANT]
>The flows supporting this processes post adaptive cards to users using the [Microsoft Teams](/connectors/teams/) connector. The ability to post adaptive cards in Teams is not available in GCC, GCC High and DoD.
> It is important that these flows remain **turned off** in these regions as they will not work fully. If turned on, makers will never receive the request to submit a business justification via an adaptive card and the [weekly cleanup](teams-governance.md#monitoring-and-weekly-cleanup-process) will remove all Dataverse for Teams environments as none have a business justification submitted. 

This article will help you to setup the Dataverse for Teams environment management components of the Governance solution. Learn more: [Microsoft Dataverse for Teams environment management](teams-governance.md)

This set of functionality allows you to monitor new Dataverse for Teams environments.

>[!IMPORTANT]
>This article assumes you have [installed the governance components solution](before-setup-gov.md) and you have your [environment setup](setup.md#create-your-environment), and are logged in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

## Turn on flows

Turn on these flows which are installed as part of the **Governance components** solution:

- [Microsoft Teams Admin | Weekly Clean Up of Microsoft Teams environments](governance-components.md#microsoft-teams-admin--weekly-clean-up-of-microsoft-teams-environments)
- [Microsoft Teams Admin | Ask for Business Justification when Microsoft Teams environment is created](governance-components.md#microsoft-teams-admin--ask-for-business-justification-when-microsoft-teams-environment-is-created)
- [Microsoft Teams Admin | Send Reminder Mail](governance-components.md#microsoft-teams-admin--send-reminder-mail)

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
