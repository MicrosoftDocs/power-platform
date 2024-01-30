---
title: EncodeUrl and PlainText functions
description: Reference information including syntax and examples for the EncodeUrl and PlainText functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 12/18/2023
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# EncodeUrl and PlainText functions

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Desktop flows :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Power Platform CLI

Encodes and decodes strings.

## Description

The **EncodeUrl** function encodes a URL string, replacing certain non-alphanumeric characters with % and a hexadecimal number.

The **PlainText** function removes HTML and XML tags, converting certain tags such as these to an appropriate symbol:

- **&amp;nbsp;**
- **&amp;quot;**

The return value from these functions is the encoded or decoded string. This function doesn't remove all HTML and XML tags.

## Syntax

**EncodeUrl**( _String_ )

- _String_ - Required. URL to be encoded.

**PlainText**( _String_ )

- _String_ - Required. String from which HTML and XML tags will be stripped.

## Examples

If you show an RSS feed in a text gallery and then set the **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property of a label in that gallery to **ThisItem.description**, the label might show raw HTML or XML code as in this example:

```html
<p>
  We have done an unusually&nbsp;&quot;deep&quot; globalization and
  localization.
</p>
```

If you set the **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property of the label to **PlainText(ThisItem.description)**, the text appears as in this example:

```
    We have done an unusually "deep" globalization and localization.
```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
