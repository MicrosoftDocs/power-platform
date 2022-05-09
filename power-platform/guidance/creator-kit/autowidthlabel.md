---
title: Auto width control reference | Creator Kit
description: Learn about the details and properties of Autowidth control in the Creator Kit.
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
  - demora-msft
  - mehdis-msft
---
# Auto width label control

A control used to display data.

![Auto width label](media/autowidthlabel.png "Auto width label")

## Description
This code component acts similar to the standard canvas app label, but will expand dynamically in width to accommodate the text. It will automatically expand width wise and return the new width. This functionality is currently not supported in canvas apps today.

## Limitations
This PCF component can only be used in Canvas apps and Custom Pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| Text | Data displayed in the label |
| AutoWidth | The new width of the label based on the text |

## Best Practices
Refer to [Fluent UI Label control best practices](https://developer.microsoft.com/en-us/fluentui#/controls/web/label)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]