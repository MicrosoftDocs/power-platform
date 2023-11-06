---
title: User channel override
description: Changing the user release channel override
author: adrianorth 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/06/2023
ms.subservice: admin
ms.reviewer: sericks
ms.author: aorth
search.audienceType: 
  - admin 
---
# User channel override

With [release channels](/power-apps/maker/model-driven-apps/channel-overview), you can control how often the users in your organization get new features by specifying the release channel.

Admins can override the release channel for a user, and this is called _user channel override_. _User channel override_ takes precedence over the org release channel or app release channel. Only the [browser session URL](/power-apps/maker/model-driven-apps/channel-change#changing-the-browser-session-channel) overrides the user channel override.

## Viewing a user's release channel

An admin can see the release channel for a user based on the org release channel and the user channel override only. The app channel is not considered here because the app release channel is only available when the app is running and needs to be checked from the **Settings** > **About** dialog. 

1. Open Power Platform Admin center to the environment
1. Click **Users** > **See all**
1. Search for the user
1. Click the user name link to open the dialog
1. Find **Model apps channel** and it is effective value of org + user

## Changing a user's release channel

Only admins can change the user release channel override.  

| User channel override | Behavior |
| -- | -- |
| None | No user override, use the org or app release channel value |
| Semi-annual channel | Explicitly set the user channel to be semi-annual, overriding both org or app |
| Monthly channel | Explicitly set the user channel to be monthly, overriding both org or app |

1. Find the user's current release channel using above steps
1. Click **Change channel**
1. Select a channel from **User channel override**
1. Click **Submit**
