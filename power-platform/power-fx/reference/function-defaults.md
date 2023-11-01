---
title: Defaults function
description: Reference information including syntax and examples for the Defaults function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 11/01/2015
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# Defaults function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps 

Returns the default values for a [data source](/power-apps/maker/canvas-apps/working-with-data-sources).

## Description

Use the **Defaults** function to pre-populate a data entry form, making it easier to fill.

This function returns a [record](/power-apps/maker/canvas-apps/working-with-tables#records) that contains the default values for the data source. If a [column](/power-apps/maker/canvas-apps/working-with-tables#columns) within the data source doesn't have a default value, that property won't be present.

Data sources vary in how much default information they provide, including not providing any at all. When you work with a [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections) or another data source that doesn't support default values, the **Defaults** function will return an [empty](function-isblank-isempty.md) record.

You can combine the **Defaults** function with the **[Patch](function-patch.md)** function to [create a record](/power-apps/maker/canvas-apps/working-with-data-sources).

## Syntax

**Defaults**( _DataSource_ )

- _DataSource_ – Required. The data source for which you want default values.

## Examples

| Formula                          | Description                                                | Result           |
| -------------------------------- | ---------------------------------------------------------- | ---------------- |
| **Defaults(&nbsp;Scores&nbsp;)** | Returns the default values for the **Scores** data source. | **{ Score: 0 }** |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
