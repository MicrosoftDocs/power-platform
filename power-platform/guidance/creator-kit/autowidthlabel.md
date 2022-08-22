---
title: AutoWidthLabel control reference | Creator Kit
description: Learn about the details and properties of the AutoWidthLabel control in the Creator Kit.
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

# :::no-loc text="AutoWidthLabel"::: control

A control used to display data.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/AutoWidthLabel).

:::image type="content" source="media/autowidthlabel.png" alt-text="Auto width label.":::

## Description

The behavior of this code component is similar to that of the standard canvas app label, but it expands dynamically in width to accommodate the text and return the new width.

Go to [Fluent UI Label control](https://developer.microsoft.com/en-us/fluentui#/controls/web/label) for best practices.

## Properties

### Key properties

| Property | Description |
| -------- | ----------- |
| `Text` | The text value of the label. |
| `AutoWidth` | (Output) The width set by the component to accommodate the text. |

### Style properties

| Property | Description |
| -------- | ----------- |
| `Padding Left` | The padding to add inside the label. |
| `Padding Right` | The padding to add inside the label. |
| `Padding Top` | The padding to add inside the label. |
| `Padding Bottom` | The padding to add inside the label. |

Not all combinations of style/state are implemented by every component. See more details in the [state dependent style properties](https://github.com/microsoft/powercat-code-components/blob/main/AutoWidthLabel/README.md#state-dependent-style-properties) section of the GitHub documentation.

## Limitations

This code component can only be used in canvas apps and custom pages.

See more limitation notes in the [design challenges](https://github.com/microsoft/powercat-code-components/blob/main/AutoWidthLabel/README.md#design-challenges) section of the GitHub documentation.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
