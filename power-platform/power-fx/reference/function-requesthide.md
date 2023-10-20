---
title: RequestHide function
description: Reference information including syntax and examples for the RequestHide function.
author: emcoope-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/18/2020
ms.subservice: power-fx
ms.author: emcoope
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# RequestHide function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps

Hides the [SharePoint form](/power-apps/maker/canvas-apps/sharepoint-form-integration#understand-the-sharepointintegration-control).

> [!NOTE]
> Only works with [SharePoint forms](/power-apps/maker/canvas-apps/sharepoint-form-integration).

## Description

Use the **RequestHide** function to hide the SharePoint form. By default, RequestHide() is used for the _OnSuccess_ property of a SharePoint form being customized.

![RequestHide example.](media/function-requesthide/requesthide-fuction.png)

This function is not required for the **SharePointIntegration** control's **OnCancel** event as SharePoint by default hides the form when a user selects **Cancel**, and the function only reacts to a SharePoint form.

## Syntax

**RequestHide** ( )

- No parameters.

## Examples

| Formula           | Description     |
| ----------------- | --------------- |
| **RequestHide()** | Hides the form. |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
