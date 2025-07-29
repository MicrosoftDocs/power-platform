---
title: Persona control reference (preview) | Creator Kit
description: Learn about the Persona control in the Creator Kit, a feature for displaying formatted user information, including avatars, names, and statuses.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 07/29/2025
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: jhaskett-msft
search.audienceType:
  - maker
contributors:
  - tapanm-msft
  - slaouist
  - Ramakrishnan24689
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:07/28/2025
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

A persona is a visual representation of a person across products, typically showing the image the person uploaded. The control can also be used to show that person's online status.

The complete control includes an individual's avatar (an uploaded image or a composition of the person's initials on a background color), their name or identification, and online status.

The persona control is used in the [PeoplePicker](./peoplepicker.md) and [Facepile](./facepile.md) controls.

This code component provides a wrapper around the [Fluent UI Persona](https://developer.microsoft.com/en-us/fluentui#/controls/web/Persona) control for use in canvas & custom pages. Consult the component documentation for best practices.

## Key properties

| Property | Description |
| -------- | ----------- |
| `ImageUrl` |  Url to the image to use. Use an image with a square aspect ratio and is large enough to fit in the image area. |
| `ImageInitials` |  The user's initials to display in the image area when there's no image. |
| `Text` |  Primary text to display, usually the name of the person. |
| `SecondaryText` |  Secondary text to display, usually the role of the user. |
| `TertiaryText` |  Tertiary text to display, usually the status of the user. The tertiary text is shown only when using size72 or size100. |
| `OptionalText` |  Optional text to display, usually a custom message set. The optional text is shown only when using size100.|
| `ImageAlt` |  Alternative text for the image. | 
| `HidePersonaDetails` |  Specifies whether to not render persona details, and just render the persona image/initials. |
| `PersonaSize` |  Size of the persona to appear on screen. |
| `Presence` |  Presence of the person to display. Presence isn't displayed if undefined. The value can be one of: `away`, `blocked`, `busy`, `dnd`, `none`, `offline`, or `online`. |

### Style Properties

| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). If left blank, the default theme defined by Power Apps is used. Learn more about [theming](theme.md). |
| `AccessibilityLabel` | Screen reader aria-label. |

## Example

Here are some example values for the Persona component:

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
