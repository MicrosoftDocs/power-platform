---
title: Set focus on a control | Creator Kit
description: Learn how to set the focus on a Creator Kit component.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 08/24/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - mehdis-msft
---

# Set Focus on a control

When a new dialog is shown, and the default focus should be on the control, an explicit set focus will be needed. 

To make calls to the input event, you can set a context variable that is bound to the Input Event property to a string that starts with `SetFocus` and followed by a random element to ensure that the app detects it as a change.

Example Power Fx formula that triggers the focus behavior:

```powerapps-dot
UpdateContext({ ctxComponentEvent: "SetFocus" & Text(Rand()) });
```

The context variable `ctxResizableTextareaEvent` would then be bound to the `InputEvent` property.

Note: `Text(Rand())` is used to generate a unique value for the `ctxComponentEvent`, which triggers an event in the component.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]