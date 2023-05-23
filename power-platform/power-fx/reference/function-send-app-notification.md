---
title: XSendAppNotification and related functions in Power Apps
description: Reference information including syntax and examples for the XSendAppNotification, XCreateUrlAction, XCreateSidePaneActionForDashboard, XCreateSidePaneActionForEntity, XCreateSidePaneActionForEntityList, and XCreateTeamsChatAction functions in Power Apps.
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

# XSendAppNotification and related action functions in Power Apps

Send an in-app notification with optional actions to a recipient.  

> [!IMPORTANT]
> The functions in this topic are in preview and will change before general availability. While in preview, the "X" prefix will be used on the functions, and the functions will be available for use only with [Dataverse low-code plug-ins](https://learn.microsoft.com/power-apps/maker/data-platform/low-code-plug-ins).

## Description

The **XSendAppNotification** function sends an in-app notification to a recipient. These notifications are displayed ot the app user as a toast or within the notification center. See [Send in-app notifications within model-driven apps](https://learn.microsoft.com/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications.md) for more information.

An in-app notification can have zero to many actions on the notification card. The following functions are used as parameters in the XSendAppNotification function to add actions to the app notification card. See [Notification actions](https://review.learn.microsoft.com/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications?branch=jaredha-appnotificationapi&tabs=powerfx%2Csdk2%2Cwebapi3%2Cpowerfx4%2Cwebapi5%2Cwebapi6#notification-actions) for more information on each action type.
- **XCreateUrlAction**: adds a URL action to the notification.
- **XCreateSidePaneActionForDashboard**: adds a side pane action that will navigate in the side pane to a page with a type of `dashboard`.
- **XCreateSidePaneActionForEntity**: adds a side pane action that will navigate in the side pane to a page with a type of `entityrecord`.
- **XCreateSidePaneActionForEntityList**: adds a side pane action that will navigate in the side pane to a page with a type of `entitylist`.
- **XCreateTeamsChatAction**: adds a teams chat action.

## Syntax

### XSendAppNotification 

**XSendAppNotification**( _Title_, _Recipient_, _Body_, _Actions_, _Icon Type_, _Toast Type_, _Expiry_, _Priority_ ) 

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

### XCreateUrlAction

**XCreateUrlAction**( _Title_, _URL_, _Navigation Target_ )

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| URL | String | Yes | The URL to be opened when the action is selected |
| Navigation Target | String | No | Defines where the navigation link opens. The options are: <br><ul><li>`dialog`: Opens in the center dialog.</li><li>`inline`: Default. Opens in the current page.</li><li>`newWindow`: Opens in a new browser tab.</li></ul> | 

### XCreateSidePaneActionForDashbaord

**XCreateSidePaneActionForDashboard**( _Title_, _Pane ID_, _Pane Title_, _Page Type_, _Dashboard ID_ ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Pane ID | String | Yes | The ID of the new side pane |
| Pane Title | String | Yes | The title to display for the side pane |
| Dashboard ID | GUID | Yes | The ID of the dashboard to open in the side pane |

### XCreateSidePaneActionForEntity

**XCreateSidePaneActionForEntity**( _Title_, _Pane ID_, _Pane Title_, _Page Type_, _Entity Name_, _Entity ID_ ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Pane ID | String | Yes | The ID of the new side pane |
| Pane Title | String | Yes | The title to display for the side pane |
| Entity Name | String | Yes | The logical name of the entity |
| Entity ID | String | Yes | The ID of the entity record to open in the side pane |

### XCreateSidePaneActionForEntityList

**XCreateSidePaneActionForEntityList**( _Title_, _Pane ID_, _Pane Title_, _Page Type_, _Entity Name_  ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Pane ID | String | Yes | The ID of the new side pane |
| Pane Title | String | Yes | The title to display for the side pane |
| Entity Name | String | Yes | The logical name of the entity to open as a list in the side pane |

### XCreateTeamsChatAction

**XCreateTeamsChatAction**( _Title_, _Chat ID_, _Member IDs_, _Record ID_, _Entity Name_, _Initial Message_ ) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action |
| Chat ID | String | No | If opening an existing chat, the ID of the chat session to be opened |
| Member IDs | GUID | No | If creating a new chat, an array of Azure AD Object ID values of the participants to be included in the chat |
| Record ID | GUID | No | If linking to a Dynamics 365 record, the ID of the record to which the chat should be linked. |
| Entity Name | String | No | If linking to a Dynamics 365 record, the logical name of the entity of the record to which the chat should be linked |
| Initial Message | String | No | An introductory message of the new chat. |

## Examples

### In-app notification with a title, recipient, and body
The following formula will send a basic in-app notification to a recipient with a title and body. It will not have any actions, and all other parameters will be the default values.

```powerapps-dot
XSendAppNotification(
    "Welcome", 
    LookUp(Users, 'Primary Email'="<User's email address>"), 
    "Welcome to the world of in-app notifications!"
)
```
### In-app notification with two actions
The following is an example formula that can be used with an automated plugin when a new [Task](https://learn.microsoft.com/power-apps/developer/data-platform/reference/entities/task) record is created. The formula sends an in-app notification to the owner of the task record, with two actions on the notification card:
- A **side pane** action opens the new task record in a side pane.
- A **Teams chat** action initiates a Teams chat with the owner of the account record assigned as the "Regarding" entity record for the new task (Note: assumes an account record is selected in the field for the task).

```powerapps-dot
XSendAppNotification(
	"New task assigned",
	AsType(ThisRecord.Owner, Users),
	"A new task has been assigned to you to follow up with your customer",
	[XCreateSidePaneActionForEntity(
		"View task",
		1123,
		"Your task",
		"task",
		ThisRecord.Task    
		),
	XCreateTeamsChatAction(
		"Chat with account manager",
		[AsType(AsType(ThisRecord.Regarding, Accounts).Owner, Users).'Azure AD Object ID'],
		AsType(ThisRecord.Regarding, Accounts).Account, 
		"account", 
		ThisRecord.Description
		)
	]
)

```


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
