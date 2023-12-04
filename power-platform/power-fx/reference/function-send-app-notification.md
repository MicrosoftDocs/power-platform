---
title: XSendAppNotification and related functions
description: Reference information including syntax and examples for the XSendAppNotification, XCreateUrlAction, XCreateSidePaneActionForDashboard, XCreateSidePaneActionForEntity, XCreateSidePaneActionForEntityList, and XCreateTeamsChatAction functions.
author: jaredha
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 5/8/2023
ms.subservice: power-fx
ms.author: jaredha
search.audienceType:
  - maker
contributors:
---

# XSendAppNotification and related action functions (preview)

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps 

[This article is pre-release documentation and is subject to change.]

Send an in-app notification with optional actions to a recipient.  

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use, may have restricted functionality, and may change significantly before release. These features are available before an official release so that customers can get early access and provide feedback.  
> - To help identify these as preview features, each function is prefixed with an **X**. Upon release, the **X** will need to be removed from any formulas that use these functions and arguments updated for any function changes.
> - These functions can only be used with the [Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins).

## Description

The **XSendAppNotification** function is used to send notifications within an app to a recipient. These notifications appear as either a toast or within the notification center for the app user. For more information, see [Send in-app notifications within model-driven apps](/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications).

In addition, an in-app notification can include zero to many actions on the notification card. To add actions to the app notification card, the following functions are used as parameters in the **XSendAppNotification** function. For more information on each action type, see [Notification actions](/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications#notification-actions).

- **XCreateUrlAction**: Adds a URL action to the notification card.
- **XCreateSidePaneActionForDashboard**: Adds a side pane action that navigates to a page with a type of `dashboard` within the side pane.  
- **XCreateSidePaneActionForEntity**: Adds a side pane action that navigates to a page with a type of `entityrecord` within the side pane. 
- **XCreateSidePaneActionForEntityList**: Adds a side pane action that navigates to a page with a type of `entitylist` within the side pane.
- **XCreateTeamsChatAction**: Adds a Teams chat action to the notification card.

## Syntax

### XSendAppNotification 

**XSendAppNotification** (_Title_, _Recipient_, _Body_, _Actions_, _Icon Type_, _Toast Type_, _Expiry_, _Priority_) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title of the app notification. |
| Recipient | Entity | Yes | An entity of `systemuser` who is the recipient of the notification. |
| Body | String | No | The notification body. |
| Actions | Function | No | An array of the action functions to add actions ot the notification. |
| Icon Type | Int | No | Picklist value for the type of icon (info, success, failure, warning, mention, custom). | 
| Toast Type | Int | No | Picklist value for the type of toast (timed versus hidden). |
| Expiry | Int | No | The number of seconds from when the notification should be deleted if not already dismissed. |
| Priority | Int | No | Picklist value for the priority of notification (normal or high). |

### XCreateUrlAction

**XCreateUrlAction** (_Title_, _URL_, _Navigation Target_)

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action. |
| URL | String | Yes | The URL to be opened when the action is selected. |
| Navigation Target | String | No | Defines where the navigation link opens. The options are: <br><ul><li>`dialog`: Opens in the center dialog.</li><li>`inline`: Default. Opens in the current page.</li><li>`newWindow`: Opens in a new browser tab.</li></ul> | 

### XCreateSidePaneActionForDashbaord

**XCreateSidePaneActionForDashboard** (_Title_, _Pane ID_, _Pane Title_, _Dashboard ID_) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action. |
| Pane ID | String | Yes | The ID of the new side pane. |
| Pane Title | String | Yes | The title to display for the side pane. |
| Dashboard ID | GUID | Yes | The ID of the dashboard to open in the side pane. |

### XCreateSidePaneActionForEntity

**XCreateSidePaneActionForEntity** (_Title_, _Pane ID_, _Pane Title_, _Entity Name_, _Entity ID_) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action. |
| Pane ID | String | Yes | The ID of the new side pane. |
| Pane Title | String | Yes | The title to display for the side pane. |
| Entity Name | String | Yes | The logical name of the entity. |
| Entity ID | String | Yes | The ID of the entity record to open in the side pane. |

### XCreateSidePaneActionForEntityList

**XCreateSidePaneActionForEntityList** (_Title_, _Pane ID_, _Pane Title_, _Entity Name_) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action. |
| Pane ID | String | Yes | The ID of the new side pane. |
| Pane Title | String | Yes | The title to display for the side pane. |
| Entity Name | String | Yes | The logical name of the entity to open as a list in the side pane. |

### XCreateTeamsChatAction

**XCreateTeamsChatAction** (_Title_, _Chat ID_, _Member IDs_, _Record ID_, _Entity Name_, _Initial Message_) 

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| Title | String | Yes | The title that displays for the action. |
| Chat ID | String | No | If opening an existing chat, the ID of the chat session to be opened. |
| Member IDs | GUID | No | If creating a new chat, an array of Microsoft Entra Object ID values of the participants to be included in the chat. |
| Record ID | GUID | No | If linking to a Dynamics 365 record, the ID of the record to which the chat should be linked. |
| Entity Name | String | No | If linking to a Dynamics 365 record, the logical name of the entity of the record to which the chat should be linked. |
| Initial Message | String | No | An introductory message of the new chat. |

## Examples

### In-app notification with a title, recipient, and body

The following sends a simple in-app notification to a recipient with a title and body. It doesn't include any actions and utilizes default values for all other parameters.

```powerapps-dot
XSendAppNotification(
    "Welcome", 
    LookUp(Users, 'Primary Email'="<User's email address>"), 
    "Welcome to the world of in-app notifications!"
)
```
### In-app notification with two actions



The following example formula can be used with an automated plugin when a a new Task record is created. The formula is designed to send an in-app notification to the owner of the task record. The notification card contains two actions that the owner can take:

- A **side pane** action, opens the new task record in a side pane.
- A **Teams chat** action, initiates a Teams chat with the owner of the account record that is assigned as the **Regarding** table record for the new task. It's important to note that this assumes an account record has been selected in the task field.

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
		[AsType(AsType(ThisRecord.Regarding, Accounts).Owner, Users).'Microsoft Entra Object ID'],
		AsType(ThisRecord.Regarding, Accounts).Account, 
		"account", 
		ThisRecord.Description
		)
	]
)

```


[!INCLUDE[footer-include](../../includes/footer-banner.md)]