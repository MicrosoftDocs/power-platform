---
title: SendAppNotification and related functions in Power Apps
description: Reference information including syntax and examples for the SendAppNotification, CreateUrlAction, CreateSidePaneActionForDashboard, CreateSidePaneActionForEntity, CreateSidePaneActionForEntityList, and CreateTeamsChatAction functions in Power Apps.
author: jaredha

ms.topic: reference
ms.custom: canvas
ms.reviewer: 
ms.date: 5/8/2023
ms.subservice: power-fx
ms.author: jaredha
search.audienceType:
  - maker
contributors:
---

# SendAppNotification and related action functions in Power Apps

Send an in-app notification with optional actions to a recipient.  

## Description

The **SendAppNotification** function sends an in-app notification to a recipient. These notifications are displayed ot the app user as a toast or within the notification center. See [Send in-app notifications within model-driven apps](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications.md) for more information.

An in-app notification can have zero to many actions on the notification card. The following functions are used as parameters in the SendAppNotification function to add actions to the app notification card. See [Notification actions](https://review.learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications?branch=jaredha-appnotificationapi&tabs=powerfx%2Csdk2%2Cwebapi3%2Cpowerfx4%2Cwebapi5%2Cwebapi6#notification-actions) for more information on each action type.
- **CreateUrlAction**: adds a URL action to the notification.
- **CreateSidePaneActionForDashboard**: adds a side pane action that will navigate in the side pane to a page with a type of `dashboard`.
- **CreateSidePaneActionForEntity**: adds a side pane action that will navigate in the side pane to a page with a type of `entityrecord`.
- **CreateSidePaneActionForEntityList**: adds a side pane action that will navigate in the side pane to a page with a type of `entitylist`.
- **CreateTeamsChatAction**: adds a teams chat action.

## Syntax

### SendAppNotification 

**SendAppNotification**( _Title_, _Recipient_, _Body_, _Actions_, _Icon Type_, _Toast Type_, _Expiry_, _Priority_ ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title of the app notification |
| Recipient | Entity | Yes | An entity of `systemuser` who is the recipient of the notification |
| Body | String | No | The notification body |
| Actions | Function | No | An array of the action functions to add actions ot the notification |
| Icon Type | Int | No | Picklist value for the type of icon (Info, Success, Failure, Warning, Mention, Custom) | 
| Toast Type | Int | No | Picklist value for the type of toast (Timed vs Hidden) |
| Expiry | Int | No | The number of seconds from when the notification should be deleted if not already dismissed |
| Priority | Int | No | Picklist value for the priority of notification (Normal or High) |

### CreateUrlAction

**CreateUrlAction**( _Title_, _URL_, _Navigation Target_ )

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| URL | String | Yes | The URL to be opened when the action is selected |
| Navigation Target | String | No | Defines where the navigation link opens. The options are: <br><ul><li>`dialog`: Opens in the center dialog.</li><li>`inline`: Default. Opens in the current page.</li><li>`newWindow`: Opens in a new browser tab.</li></ul> | 

### CreateSidePaneActionForDashbaord

**CreateSidePaneActionForDashboard**( _Title_, _Pane ID_, _Pane Title_, _Page Type_, _Dashboard ID_ ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Pane ID | String | Yes | The ID of the new side pane |
| Pane Title | String | Yes | The title to display for the side pane |
| Dashboard ID | GUID | Yes | The ID of the dashboard to open in the side pane |

### CreateSidePaneActionForEntity

**CreateSidePaneActionForEntity**( _Title_, _Pane ID_, _Pane Title_, _Page Type_, _Entity Name_, _Entity ID_ ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Pane ID | String | Yes | The ID of the new side pane |
| Pane Title | String | Yes | The title to display for the side pane |
| Entity Name | String | Yes | The logical name of the entity |
| Entity ID | String | Yes | The ID of teh entity record to open in the side pane |

### CreateSidePaneActionForEntityList

**CreateSidePaneActionForEntityList**( _Title_, _Pane ID_, _Pane Title_, _Page Type_, _Entity Name_  ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Pane ID | String | Yes | The ID of the new side pane |
| Pane Title | String | Yes | The title to display for the side pane |
| Entity Name | String | Yes | The logical name of the entity to open as a list in the side pane |

### CreateTeamsChatAction

**CreateTeamsChatAction**( _Title_, _Chat ID_, _Member IDs_, _Record ID_, _Entity Name_, _Initial Message_ ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Chat ID | String | No | If opening an existing chat, the ID of the chat session to be opened |
| Member IDs | GUID | No | If creating a new chat, an array of Azure AD Object ID values of the participants to be included in the chat |
| Record ID | GUID | No | If linking to a Dynamics 365 record, the ID of the record to which the chat should be linked. |
| Entity Name | String | No | If linking to a Dynamics 365 record, the logical name of the entity of the record to which the chat should be linked |
| Initial Message | String | No | An introductory message of the new chat. |


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
