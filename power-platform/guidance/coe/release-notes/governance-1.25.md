---
title: "Release notes and latest version of the CoE starter kit Governance components 1.25 | MicrosoftDocs"
description: "Release notes and latest version of the CoE Starter Kit."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Released version Governance Components 1.25

## Introduction

Version 1.25 for the CoE Starter Kit Governance Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on November 16, 2020.

## Microsoft Teams environment governance

The [Microsoft Teams integration](https://docs.microsoft.com/power-platform/admin/about-teams-environment) empowers users to build custom apps, bots, and flows in Teams by using Power Apps, Power Virtual Agents, and Power Automate. This release includes new components that provide a sample implementation of best practices for reactive governance of Microsoft Teams environment creation. Learn more about the new components: [Microsoft Teams environment management](../microsoftteams-governance.md)

## Archival flows

In the past, the archival backed up the apps and flows for the owner in a SharePoint library, from where they could be restored. Based on feedback regarding the complexity of restoring apps and flows, we have moved to a system in which the users will be responsible for backup of their apps and flows themselves for later use and will be prompted to take a back up as part of the archival email.

We have additionally changed the process for identifying apps and flows that need archiving:

- Apps will now check for both modified and launched dates. By default, if they have not been launched NOR modified in 6 months, they will flag for archival.
- Flows will now be flagged for archival if they are not in the stopped state, as well as not modified in the last 6 months..

Here is the detailed new archival workflow process:

- A weekly flow sends an Archive Approval request for apps that have not been launched or modified in the last 6 months and flows that are not stopped and have not been modified in the last 6 months
- The user can chose to Approve or Reject the request, and can of course ignore:
  - **Approve**: The user will be reminded weekly for 3 weeks to backup and the resource will be deleted after 3 weeks. If they delete themselves, the reminders will stop.
  - **Reject**: The resource will be ignored in the Archival flows for the next month.
  - **Ignore**: If the user ignores the request, they will get another request the following week.

A cleanup flow runs daily and deletes timed out approvals (1 month old) and deletes resources that have been approved for deletion 3 weeks ago.
