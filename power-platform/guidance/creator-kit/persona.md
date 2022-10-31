---
title: Persona control reference (preview) | Creator Kit
description: Learn about the details and properties of the Persona control in the Creator Kit.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 10/25/2022
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
  - Ramakrishnan24689
---

# :::no-loc text="Persona"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control used to create a loading experience.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/p ersona).

:::image type="content" source="media/Persona.png" alt-text="Persona control.":::

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

## Description

Progress indicators are used to show the completion status of an operation lasting more than two seconds. If the state of progress can't be determined, use a [Spinner](spinner.md) or use the `Indeterminate Indicator` type instead. Progress indicators can appear in a new panel, in a flyout window, under the UI that initiated the operation, or they can even replace the initiating UI as long as the UI can return if you cancel or stop the activity.

This code component provides a wrapper around the [Fluent UI Persona](https://developer.microsoft.com/en-us/fluentui#/controls/web/Persona) control for use in canvas & custom pages. See component documentation for best practices.

## Key properties

| Property | Description |
| -------- | ----------- |

## Additional properties

| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label |

## Behavior



## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
