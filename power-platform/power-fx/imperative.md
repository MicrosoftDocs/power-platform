---
title: Understand imperative logic in a Microsoft Power Fx | Microsoft Docs
description: Reference information about working with imperative logic, which can change state in Microsoft Power Fx
author: gregli-msft
manager: kvivek
ms.service: power-platform
ms.topic: conceptual
ms.reviewer: nabuthuk
ms.date: 02/26/2021
ms.subservice: power-fx
ms.author: gregli
search.audienceType: 
  - maker
search.app: 
  - PowerApps
---
# Imperative logic

> [NOTE]
> Microsoft Power Fx is the new name for the canvas apps formula language. These articles are work in progress as we extract the language from canvas apps, integrate it with other Microsoft Power Platform products, and make it available as open source.  Start with the [Microsoft Power Fx Overview](overview.md) for an introduction to the language.   

Most formulas in Microsoft Power Fx calculate a value.  Like an Excel spreadsheet, recalculation happens automatically as values change.  For example, you might want to show the value in a **Label** control in red if the value is less than zero or in black otherwise. So you can set the **Color** property of that control to this formula:

```powerapps-dot
If( Value(TextBox1.Text) >= 0, Color.Black, Color.Red )
```

In this context, what does it mean when the user selects a **Button** control?  No value has changed, so there is nothing new to calculate. Excel has no equivalent to a **Button** control.  

By selecting a **Button** control, the user initiates a sequence of actions, or behaviors, that will change the state of the app:

* Change the screen that's displayed: **Back** functions.
* Control a signal (Power Apps only): **Enable** and **Disable** functions.
* Refresh, update, or remove items in a [data source](/powerapps/maker/canvas-apps/working-with-data-sources): **Refresh**, **Update**, **UpdateIf**, **Patch**, **Remove**, **RemoveIf** functions.
* Update a context variable (Power Apps canvas only):  **[UpdateContext](/powerapps/maker/canvas-apps/functions/function-updatecontext)** function.
* Create, update, or remove items in a [collection](/powerapps/maker/canvas-apps/functions/function-clear-collect-clearcollect):  **Collect**, **Clear**, **ClearCollect** functions.

Because these functions change the state of the app, they can't be automatically recalculated. You can use them in the formulas for the **OnSelect**, **OnVisible**, **OnHidden**, and other **On...** properties, which are called behavior formulas.

### More than one action
Use semicolons to create a list of actions to perform. For example, you might want to update a context variable and then return to the previous screen:

```powerapps-dot
UpdateContext( { x: 1 } ); Back()
```

Actions are performed in the order in which they appear in the formula.  The next function won't start until the current function has completed. If an error occurs, subsequent functions might not start.

