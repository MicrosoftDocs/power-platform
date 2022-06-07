---
title: ProgressIndicator control reference | Creator Kit
description: Learn about the details and properties of the ProgressIndicator control in the Creator Kit.
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
  - slaouist
---

# :::no-loc text="ProgressIndicator"::: control

[This article is pre-release documentation and is subject to change.]

A control used to create a loading experience.

:::image type="content" source="media/ProgressIndicator.png" alt-text="ProgressIndicator control.":::

## Description

Progress indicators are used to show the completion status of an operation lasting more than two seconds. If the state of progress can't be determined, use a **Spinner** instead. Progress indicators can appear in a new panel, in a flyout window, under the UI that initiated the operation, or they can even replace the initiating UI&mdash;as long as the UI can return if you cancel or stop the activity.

This canvas component mimics the style and behavior of the [Fluent UI ProgressIndicator control](https://developer.microsoft.com/fluentui#/controls/web/ProgressIndicator).

[View the component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/CanvasApps/cat_powercatcomponentlibrary_0be3a_DocumentUri_msapp_src).

## Limitations

This canvas component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Value` | The value of the progress that's rendered, which should be an integer between 0 and 100. |

## Configure loading behavior

Make the `ProgressIndicator` control itself (or the surface it's located within) visible when a process begins, then update a variable with the value as segments of the process are completed. Hide it when the process is complete. Use a variable to control the visibility of the control, and update the values between the major code blocks of the process that need to be indicated.

```powerapps-dot
UpdateContext({ var_showProgress: true , var_progressValue: 0 });

/* Some code ... */

UpdateContext({ var_progressValue: 25 });

/* Some code ... */

UpdateContext({ var_progressValue: 50 });

/* Some code ... */

UpdateContext({ var_progressValue: 75 });

/* Some code ... */

UpdateContext({ var_progressValue: 100 });

Notify("Successfully completed process", NotificationType.Success);

UpdateContext({ var_showProgress: false });

```

Provide the `var_showProgress` variable as the value for the `Visible` property of the `ProgressIndicator` (or the surface containing it), and assign the `var_progressValue` variable for the `Value` property.

## Best practices

Go to [Fluent UI ProgressIndicator control best practices](https://developer.microsoft.com/fluentui#/controls/web/ProgressIndicator).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
