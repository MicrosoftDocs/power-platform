---
title: AutoWidthLabel control reference | Creator Kit
description: Learn about the details and properties of AutoWidthLabel control in the Creator Kit.
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
  - demora-msft
  - mehdis-msft
---

# :::no-loc text="AutoWidthLabel"::: control

A control used to display data.

:::image type="content" source="media/autowidthlabel.png" alt-text="Auto width label.":::

## Description

This code component acts similar to the standard canvas app label, but will expand dynamically in width to accommodate the text and return the new width. This functionality is currently not supported in canvas apps today.

[View component in the GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/Controls/cat_PowerCAT.AutoWidthLabel)

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Text` | Data displayed in the label |
| `AutoWidth` | The new width of the label based on the text |

## Best practices

For more information, see [Fluent UI Label control best practices](https://developer.microsoft.com/en-us/fluentui#/controls/web/label).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]