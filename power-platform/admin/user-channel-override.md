---
title: User channel override
description: Learn how to override the release channel for a user.
author: adrianorth 
ms.component: pa-admin
ms.topic: concept-article
ms.date: 11/06/2023
ms.subservice: admin
ms.reviewer: sericks
ms.author: aorth
search.audienceType: 
  - admin 
---
# User channel override

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

With [release channels](/power-apps/maker/model-driven-apps/channel-overview), you can control how often the users in your organization get new features by specifying the release channel.

Admins can override the release channel for a user, called _user channel override_. User channel override takes precedence over the environment channel and app channel. Only the [browser session URL](/power-apps/maker/model-driven-apps/channel-change#changing-the-browser-session-channel) overrides the user channel override.

## View a user's release channel

To view the release channel for a user, complete the following steps.

The release channel for a user is based on the environment channel and the user channel override. The release channel for a user isn't based on the app channel because the app channel is only available when the app is running and needs to be checked from the **Settings** > **About** pane.

1. Open the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and select an environment.
1. Select **Users** > **See all**.
1. Search for a user.
1. Select the user's name.
1. Note the value in the **Model apps channel** field.

## Override a user's release channel

Only admins can change the release channel for a user. Complete the following steps to do so.

1. [View a user's release channel](#view-a-users-release-channel).
1. Under the **Model apps channel** field, select **Change channel**.
1. Select a channel from **User channel override** dropdown menu.

    | Option | Description |
    |--|--|
    | None | There's no user channel override. The environment or app channel value is used. |
    | Semi-annual channel |  Users get new features twice a year, starting early April and early October. |
    | Monthly channel | Users receive new features monthly, on the first release for the month. |

1. Select **Submit**.

## See also

[Release channels for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview)
