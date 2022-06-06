---
title: Spinner control reference | Creator Kit
description: Learn about the details and properties of the Spinner control in the Creator Kit.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/16/2022
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

# :::no-loc text="Spinner"::: control

[This article is pre-release documentation and is subject to change.]

A control used to create a loading experience.

:::image type="content" source="media/spinner.png" alt-text="Spinner control.":::

## Description

A Spinner is an outline of a circle that animates around itself indicating to the user that things are processing. It appears when the process is unsure how long a task will take, making it the indeterminate version of a [ProgressIndicator control](progressindicator.md).<!--note from editor: Very nice!-->

Spinners can vary in size, and can be located inline with content or centered. Spinners generally appear after an action is being processed or committed. They're subtle and generally don't take up much space, but are transitions from the completed task.

This canvas component mimics the style and behavior of the [Fluent UI Spinner control](https://developer.microsoft.com/fluentui#/controls/web/spinner).

[View the component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/CanvasApps/cat_powercatcomponentlibrary_0be3a_DocumentUri_msapp_src).

## Limitations

This canvas component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `AnimatedGIF` | A text field that renders the image displayed in the spinner, such as a URL to a publicly hosted image   |
| `Text` | Text displayed under the Spinner control |
| `IsLoading` | Whether the spinner control is visible |

## Style properties

| Property | Description |
| -------- | ----------- |
| `Theme` | The Theme JSON object |

## Configuring spinner loading behavior

Make the spinner control visible when a process begins, then hide it when the process is complete.

Use a variable to control the visibility of the spinner, and update the values before and after the code block of the process.

```powerapps-dot
UpdateContext({ var_showLoader: true });

/* Some code ... */

UpdateContext({ var_showLoader: false });

```

Then, provide the `var_showLoader` variable as the value for the `IsLoading` property of the spinner.

## Best practices

Go to [Fluent UI Spinner control best practices](https://developer.microsoft.com/fluentui#/controls/web/spinner).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
