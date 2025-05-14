---
title: SubwayNav control reference (preview) | Creator Kit
description: Learn about the details and properties of the SubwayNav control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 01/30/2023
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
  - Ramakrishnan24689
---

# :::no-loc text="SubwayNav"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control used to guide users through a process.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/SubwayNav).

:::image type="content" source="media/subwaynav.png" alt-text="SubwayNav control.":::

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

## Description
The `SubwayNav` control allows you to visualize the steps required for a given wizard. The Wizard is a component that guides users to complete predefined steps to achieve a setup or creation task.

This code component provides a wrapper around a forked version of the Office 365 Admin Control `SubwayNav`.

> [!IMPORTANT]
> **Do not open bugs with the Admin Controls team** - always submit issues to the Creator Kit Github Repository at [aka.ms/creatorkit/bug](https://aka.ms/creatorkit/bug).


## Key properties

| Name                 | Description | 
|----------------------|-------------|
| `Items`        | The table of Items (steps) to render (see `Items` table schema below). |
| `WizardCompleteorError` | Shown as "SubwayNav state" |

### `Items` table properties

Each object in the `Items` input table must use the following properties to render correctly:

| Name                   | Description |
|------------------------|-------------|
| `ItemLabel`            | Label for the step |
| `ItemKey`              | The key to use to indicate which item/step is selected. The keys must be unique. |
| `ParentItemKey`        | Optional. ItemKey of the parent, used for rendering substeps. |
| `ItemState`            | Specifying the state of the step. The following supported states are available:<br>`Current`, `NotStarted`, `Completed`, `Unsaved`, `ViewedNotCompleted`, `Error`, `CurrentWithSubSteps`, `Skipped`, `WizardComplete` |
| `ItemDisabled`         | Optional. Whether the step is disabled. |
| `ItemVisuallyDisabled` | Optional. Whether the step is visually disabled. |

## Additional properties

| Name                 | Description | 
|----------------------| -------------|
| `AccessibilityLabel` | Screen reader aria-label. |
| `InputEvent`         | An event to send to the control. E.g. `SetFocus`. See below. |
| `Theme`              | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. |

## Example

- Supports [SetFocus](setfocus.md) as an `InputEvent`.

Example of input collection value for Items property:

```power-fx
Table(
    { ItemKey:"1", ItemLabel:"Step 1", ItemState:"Current" },
    { ItemKey:"2", ItemLabel:"Step 2", ItemState:"Completed" },
    { ItemKey:"3", ItemLabel:"Step 3", ItemState:"Unsaved" },
    { ItemKey:"4", ItemLabel:"Step 4", ItemState:"ViewedNotCompleted" },
    { ItemKey:"5", ItemLabel:"Step 5", ItemState:"Error" },
    { ItemKey:"6", ItemLabel:"Step 6", ItemState:"WizardComplete" }
)
```

To get the selected step by the user, use the `OnSelect` or `OnChange` property of the `SubwayNav` control.

Example code:

```power-fx
Notify( Concatenate(Self.Selected.ItemLabel, " selected and its status is ", Self.Selected.ItemState ));
```

#### Example for Substep scenarios

Below is a sample item collection example that defines how substeps needs to be linked with main/parent step using ParentItemKey.

```power-fx
Table(
    { ItemKey:"1", ItemLabel:"Step 1", ItemState:"Current" },
    { ItemKey:"2", ItemLabel:"Step 2 have sub-steps", ItemState:"WizardComplete" },
    { ItemKey:"3", ItemLabel:"Sub Step 2.1", ParentItemKey:"2", ItemState:"Error" },
    { ItemKey:"4", ItemLabel:"Sub Step 2.2", ParentItemKey:"2", ItemState:"WizardComplete" }, 
    { ItemKey:"5", ItemLabel:"Sub Step 3.1", ParentItemKey:"8", ItemState:"ViewedNotCompleted" }, 
    { ItemKey:"6", ItemLabel:"Sub Step 3.2", ParentItemKey:"8", ItemState:"Unsaved" }, 
    { ItemKey:"7", ItemLabel:"Sub Step 3.2", ParentItemKey:"8", ItemState:"Unsaved" }, 
    { ItemKey:"8", ItemLabel:"Step 3 too have sub-steps", ItemState:"Unsaved" }, 
    { ItemKey:"9", ItemLabel:"Step 4", ItemState:"Error" }, 
    { ItemKey:"10", ItemLabel:"Step 5", ItemState:"WizardComplete" }
)
```

### Output Schema

State of each item (step) changes as we select or move to different step happens internally, especially the `Current` & `CurrentWithSubStep`. The current status can be determined using Output property called `Steps`.

Example code (referenced from the `SubwayNav` control):

```power-fx
Self.Steps
```

Example code (referencing the steps from another control):

```power-fx
SubwayNav1.Steps
```

## Limitations
This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
