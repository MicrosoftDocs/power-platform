---
title: Manage collaboration settings
description: Learn how to use collaboration settings to adjust how collaboration features work in Power Platform.
author: fikaradz
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/16/2024
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
ms.contributors:
- srihas
---

# Manage collaboration settings

Use collaboration settings to adjust how collaboration features work in Power Platform. Adjust the settings in the Power Platform admin center, **Environments** > *select an environment* > **Settings** > **Product** > **Collaboration**.

Make sure you have the System Administrator security role or equivalent permissions to update the collaboration settings. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

## Model-driven apps

| Setting | Description | Default value |
|---------|-------------|---------------|
|Show other people when they're using the same form | When you're working on a record, you can also see other users who are working on the same record if this setting is set to **On**. | On |
| End users can add and join Teams meetings from appointments in model-driven apps |Teams meetings in model-driven apps include a **Join** button to allow users to easily join the call. | On |

## Enable sharing

| Setting | Description | Default value |
|---------|-------------|---------------|
| Allow users to share read-only links to records with other users from this environment | Users who have the share privilege can give read-only access to records when they share them with the **Specific people** option selected. | On |
| @mention people when in rich text editors to add and notify users| Users can mention other Dataverse users of the environment in Notes in model-driven apps, using the “@” character. [In-app notifications](/power-apps/user/notifications) must be enabled for the mentioned users to receive a notification. The environment must be on [monthly channel](/power-apps/maker/model-driven-apps/channel-change) for this option to appear in Power Platform admin center. | Off |

## Teams integration

| Setting | Description | Default value |
|---------|-------------|---------------|
| Show record name and type to unauthorized users when unfurling links in Teams chats| When a link is pasted into a Teams chat, display the name and type of record in a card.| On |
| Install the Dynamics 365 app for Teams for users in the organization. Lets people in your org see business data while working in Teams| Active users of Dynamics 365 apps and Power Apps model-driven apps get the Dynamics 365 app for Teams automatically installed in their Teams client. | On |
| Microsoft Teams activity feed notification for sharing events in the environment | When a record is shared in a model-driven app, a Teams activity feed notification appears for the recipient, alerting them to the record that was shared. | On|
