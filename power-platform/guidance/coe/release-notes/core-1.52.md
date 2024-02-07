---
title: "Release notes and latest version of the CoE starter kit Core components 1.52 | MicrosoftDocs"
description: "Release notes and latest version of the CoE Starter Kit 1.52."
author: manuelap-msft

ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/08/2020
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---

# Released version Core Components 1.52

Version 1.52 for the CoE Starter Kit Core Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on July 8, 2020.

## Power Virtual Agents inventory

This version introduces inventory information for Power Virtual Agents. A new Admin | Sync Flows v3 (Chatbots) has been added to sync Power Virtual Agent information to the new Chatbot, Chatbot Component, and Chatbot Component Flow tables. The Power Platform Admin View has been updated to include Chatbot information. The CoE Starter Kit Power BI Dashboard has been updated to include a Virtual Agents overview and Virtual Agents detail page.

Information available for chatbots:

- ID
- Name
- Environment
- Created by/on
- Modified by/on
- State (Published,...)
- Last launched
- Number of sessions
- Number of components, plus component details
- Number of flows

![Power Platform Admin View - Virtual Agents inventory.](../media/pb-4.png "Power Platform Admin View - Virtual Agents inventory")

## Power Apps (canvas apps) "shared with" information

This version introduces new tables that store information on users canvas apps have been shared with. A new Admin | Sync Flow v3 (Power Apps User Shared With) has been added to retrieve role assignments per app. Group size is stored for apps shared with Microsoft Entra security groups.

Information available for users an app is shared with:

- User Name
- Role (Owner, Editor, Viewer)
- Type (User, Group, Tenant)
- Group Size

The Power Platform Admin View has been updated to show this information on the PowerApps App form:

![Power Platform Admin View - View who an app is shared with.](../media/coe-mda2.png "Power Platform Admin View - View who an app is shared with")

## Set App Permissions and Set Flow Permissions

This version renames the Set New App Owner app to Set App Permissions, and introduces the capability to search by environment, by maker, and by orphaned app. Additionally, it is now possible to change app owners, add new editors and viewers as well as remove app permissions with this app.

This version also introduces a new Set Flow Permissions app that allows admins to search by environment, by maker, and by orphaned flows and add new users to those flows.

## Admin | Sync Template v3 (Check Deleted)

This flow runs weekly, and compares CoE to the tenant to determine if any objects were deleted since last run. Either just marks them as deleted.


[!INCLUDE[footer-include](../../../includes/footer-banner.md)]