---
title: Manage collaboration settings
description: Learn how to use collaboration settings to adjust how collaboration features work in Power Platform.
author: fikaradz
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/14/2023
ms.subservice: admin
ms.author: fikaradz 
ms.reviewer: sericks
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
ms.custom: bap-template
---

# Manage collaboration settings

Use collaboration settings to adjust how collaboration features work in Power Platform. Adjust the settings in the Power Platform admin center, **Environments** > *select an environment* > **Settings** > **Product** > **Collaboration**.

## Prerequisites

[Make sure you have the System Administrator security role](/powerapps/user/view-your-user-profile) or equivalent permissions to change the collaboration settings. If you don't, ask your system administrator.

## User experiences

- Model-driven apps

  - Show modern share on views and dashboards (preview): The **Share** button is shown in views and dashboards, which makes it easy to copy links and share them with others.

- Enable sharing

  - Allow users to share read-only links to records with other users from this environment: Allows users who have the share privilege to give read-only access to records when they share them with the **Specific people** option selected.

- Team integration

  - Show record name and type to unauthorized users when unfurling links in Teams chats: When a link is pasted into a Microsoft Teams chat, display the name and type of record in a card.

  - Install the Dynamics 365 app for Teams for users in the organization. Lets people in your org see business data while working in Teams: Active users of Dynamics 365 apps and Power Apps model-driven apps get the Dynamics 365 app for Teams automatically installed in their Teams client.

## App authoring experiences

- Coauthoring (preview): Enable [coauthoring](/power-apps/maker/model-driven-apps/coauthoring), which lets people simultaneously edit model-driven apps together
