---
title: "Release notes and latest version of the CoE starter kit Governance components 1.25 | MicrosoftDocs"
description: "Release notes and latest version of the CoE starter kit 1.25."
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

The [Microsoft Teams integration](https://docs.microsoft.com/power-platform/admin/about-teams-environment) enables users to build custom apps, bots, and flows in Teams. We are providing a sample implementation of best practices for reactive governance of Microsoft Dataverse for Teams environments with this release. Learn more about the new components: [Microsoft Teams environment management](../teams-governance.md)

## Archival flows

In the past, the archival backed up the apps and flows for the owner in a SharePoint library, from where they could be restored. Due to the complexity of restoring apps and flows, the updated flows will prompt users to back up their apps and flows themselves for later use.

Additionally, the process for identifying apps and flows that need archiving has changed:

- Apps will now check for both modified and launched dates. Apps will be flagged for archival if they have not been launched or modified in six months.
- Flows will now be flagged for archival if they are not stopped and if they have not been modified in the last six months.

Here is the detailed new archival workflow process:

- A weekly flow sends an Archive Approval request for apps that have not been launched or modified in the last six months and flows that are not stopped and have not been modified in the last six months
- The user can approve, reject or ignore the request:
  - **Approve**: The user will be reminded weekly for three weeks to back up and the resource will be deleted after three weeks. If they delete themselves, the reminders will stop.
  - **Reject**: The resource will be ignored in the Archival flows for the next month.
  - **Ignore**: If the user ignores the request, and request will be sent the following week.

A cleanup flow runs daily and deletes timed out approvals and deletes resources that have been approved for deletion three weeks ago.
