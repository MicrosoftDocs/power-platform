---
title: Manage collaboration settings
description: Learn how to use collaboration settings to adjust how collaboration features work in Power Platform.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/3/2025
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType:
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
ms.custom:
- bap-template
- NewPPAC
ms.contributors:
- srihas
---

# Manage collaboration settings

Use collaboration settings to adjust how collaboration features work in Power Platform. 

To adjust the settings in the Power Platform admin center for an environment, follow these steps:

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Collaboration**. 

## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Collaboration**. 
---

Make sure you have the System Administrator security role or equivalent permissions to update the settings. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

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

## Security roles

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable app level security roles for canvas apps. | When you share a canvas app, you can control who can view or edit the app by assigning specific security roles to each user. This ensures that only authorized users have access to the app’s features and data. | Off
|  Enable plan level security roles for plan designer. | When you share a plan, you can control who can access or modify it by assigning specific security roles to each user. | Off |

