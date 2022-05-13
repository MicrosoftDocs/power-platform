---
title: Spinner control reference | Creator Kit
description: Learn about the details and properties of Spinner control in the Creator Kit.
author: denisem-msft
manager: devkeydet

ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/06/2022
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

A control used to create a loading experience.

:::image type="content" source="media/spinner.png" alt-text="Spinner control.":::

## Description

A Spinner is an outline of a circle which animates around itself indicating to the user that things are processing. A Spinner is shown when it's unsure how long a task will take making it the indeterminate version of a ProgressIndicator. They can be various sizes, located inline with content or centered. They generally appear after an action is being processed or committed. They are subtle and generally do not take up much space, but are transitions from the completed task.

This Canvas component mimics the style and behavior of the [Fluent UI Spinner control](https://developer.microsoft.com/fluentui#/controls/web/spinner).

[View component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/CanvasApps/cat_powercatcomponentlibrary_0be3a_DocumentUri_msapp_src)

## Limitations
This Canvas component can only be used in Canvas apps and Custom Pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `AnimatedGIF` | A text field that renders the image displayed in the spinner. A Url to a publicly hosted image or   |
| `Text` | Text displayed under the Spinner control |
| `IsLoading` | Whether the spinner control is visible. |

## Style properties

| Property | Description |
| -------- | ----------- |
| `Theme` | The Theme JSON object |

## Configuring the spinner visibility

## Best Practices
Refer to [Fluent UI Spinner control best practices](https://developer.microsoft.com/fluentui#/controls/web/spinner)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]