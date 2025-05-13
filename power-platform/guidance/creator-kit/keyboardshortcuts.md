---
title: KeyboardShortcuts control reference | Creator Kit
description: Learn about the details and properties of the KeyboardShortcuts control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 05/16/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
---

# :::no-loc text="KeyboardShortcut"::: control

A control used to capture and act on keyboard events.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/KeyboardShortcuts).

## Description

This code component registers keypress event handlers to allow keyboard shortcuts to be used inside canvas apps or custom pages. It isn't intended for use in model-driven or portal apps.

## Properties

| Property | Description |
| -------- | ----------- |
| `KeyConfig` | An array of strings indicating which keyboard shortcuts to listen for. The string must be serialized by using JSON (example given in the following section). |
| `OnKey` | The keyboard shortcut that was detected. |

After adding the `KeyboardShortcuts` code component to the form, configure the `KeyConfig` property with an array of key combinations.

For example:

```json
["alt + r","alt + a","alt + d","alt + b","alt + p","alt + l","alt + t","alt + k"]
```

For more information about the keyboard combination strings, go to [the KeyboardJS library](http://itsgreggreg.github.io/KeyboardJS/).

## Behavior

### Responding to the keystroke events

When a key combination is used, the `OnChange` event is raised. The `OnKey` property then holds the combination.

You might have an `OnChange` event similar to:

```power-fx
If( Self.OnKey = "alt + a",
    SetFocus(txtTextbox1)
);
If( Self.OnKey = "alt + r",
    UpdateContext({ ctxResizableTextareaEvent:"SetFocus" & Text(Rand()) })
);
If( Self.OnKey = "alt + b",
    SetFocus(txtTextbox2)
);
If( Self.OnKey = "alt + k",
    UpdateContext({ ctxPickerEvent:"SetFocus" & Text(Rand()) })
);
If( Self.OnKey = "alt + d",
    UpdateContext({ ctxDropdownEvent:"SetFocus" & Text(Rand()) })
);
If( Self.OnKey = "alt + l",
    UpdateContext({ ctxTagListEvent:"SetFocus" & Text(Rand()) })
);
If( Self.OnKey = "alt + t", 
    UpdateContext({ ctxTableEvent:"SetFocusOnRow" & Text(Rand()) })
);
```

This event handler sets focus on various controls, given the key combination used.

## Limitations

Some keyboard shortcuts are used by Power Apps Studio while editing the app, and some are used by the browser. For this reason, this component won't work for all keyboard shortcuts until the user places focus inside the app.

This code component can only be used in canvas apps and custom pages.

See more limitation notes in the [component design challenges](https://github.com/microsoft/powercat-code-components/tree/main/KeyboardShortcuts#design-challenges) section of the GitHub documentation.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
