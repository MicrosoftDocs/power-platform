---
title: Persona control reference (preview) | Creator Kit
description: Learn about the details and properties of the Persona control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 07/25/2025
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: jhaskett-msft
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
  - Ramakrishnan24689
---

# :::no-loc text="Persona"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control designed to display formatted information.

> [!NOTE]
> Full documentation and source code are found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/Persona).

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

:::image type="content" source="media/persona.png" alt-text="Persona control":::

## Description

A persona is a visual representation of a person across products, typically showcasing the image that person has chosen to upload themselves. The control can also be used to show that person's online status.

The complete control includes an individual's avatar (an uploaded image or a composition of the person’s initials on a background color), their name or identification, and online status.

The persona control is used in the [PeoplePicker](./peoplepicker.md) and [Facepile](./facepile.md) controls.

This code component provides a wrapper around the [Fluent UI Persona](https://developer.microsoft.com/en-us/fluentui#/controls/web/Persona) control for use in canvas & custom pages. See component documentation for best practices.

## Key properties

| Property | Description |
| -------- | ----------- |
| `ImageUrl` |  Url to the image to use, should be a square aspect ratio and large enough to fit in the image area. |
| `ImageInitials` |  The user's initials to display in the image area when there's no image. |
| `Text` |  Primary text to display, usually the name of the person. |
| `SecondaryText` |  Secondary text to display, usually the role of the user. |
| `TertiaryText` |  Tertiary text to display, usually the status of the user. The tertiary text will only be shown when using size72 or size100. |
| `OptionalText` |  Optional text to display, usually a custom message set. The optional text will only be shown when using size100.|
| `ImageAlt` |  Alt text for the image to use. | 
| `HidePersonaDetails` |  Whether to not render persona details, and just render the persona image/initials. |
| `PersonaSize` |  Size of the persona to appear on screen. |
| `Presence` |  Presence of the person to display - won't display presence if undefined. Value should be from one of the following: `away`, `blocked`, `busy`, `dnd`, `none`, `offline`, `online` |

### Style Properties

| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label |

## Example

Following are some example values that could be used in the Persona component:

| Property | Value |
| -------- | ----- |
| `Text` | "Megan Brown" |
| `SecondaryText` | "Software Engineer" |
| `TertiaryText` | "In a meeting" |
| `OptionalText` | "Available at 4:00pm" |
| `HidePersonaDetails` | false |
| `ImageUrl` | User().Image |
| `PersonaSize` | PowerCAT.Persona.PersonaSize.Size100 |
| `Presence` | PowerCAT.Persona.Presence.Online |

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
