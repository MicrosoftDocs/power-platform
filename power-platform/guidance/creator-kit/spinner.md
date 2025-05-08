---
title: Spinner control reference | Creator Kit
description: Learn about the details and properties of the Spinner control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 11/02/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - mehdis-msft
  - Ramakrishnan24689
---

# :::no-loc text="Spinner"::: control

A control used to create a loading experience.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/Spinner).

:::image type="content" source="media/spinner.png" alt-text="Spinner control.":::

## Description

A Spinner is an outline of a circle that animates around itself indicating to the user that things are processing. It appears when the process is unsure how long a task will take, making it the indeterminate version of a [ProgressIndicator](progressindicator.md) control.

Spinners can vary in size, and can be located inline with content or centered. Spinners generally appear after an action is being processed or committed. They're subtle and generally don't take up much space, but are transitions from the completed task.

This code component provides a wrapper around the [Fluent UI Spinner](https://developer.microsoft.com/en-us/fluentui#/controls/web/spinner) control for use in canvas & custom pages. See component documentation for best practices.

## Key Properties

| Property | Description |
| -------- | ----------- |
| `Label` | Optional label for spinner.
| `SpinnerSize` | The size of spinner to be rendered. Choices: `xSmall`, `Small`, `Medium`, `Large` |
| `SpinnerAlignment` | The alignment of the spinner within the control boundaries. Choices: `Left`, `Center`, `Right` |
| `LabelPosition` | Optional placing of spinner label to a particular position. Choices: `Bottom`, `Top`, `Left`, `Right` |

### Style properties

| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label |

## Example

### Display the spinner when loading

Make the spinner control visible when a process begins, then hide it when the process is complete.

Use a variable to control the visibility of the spinner, and update the values before and after the code block of the process.

```power-fx
UpdateContext({ var_showLoader: true });

/* Some code ... */

UpdateContext({ var_showLoader: false });

```

Then, provide the `var_showLoader` variable as the value for the `IsLoading` property of the spinner.


## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
