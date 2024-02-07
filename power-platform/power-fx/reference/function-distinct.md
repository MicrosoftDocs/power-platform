---
title: Distinct function
description: Reference information including syntax and examples for the Distinct function.
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

# Distinct function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Desktop flows :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Power Platform CLI

Summarizes [records](/power-apps/maker/canvas-apps/working-with-tables#records) of a [table](/power-apps/maker/canvas-apps/working-with-tables), removing duplicates.

## Description

The **Distinct** function evaluates a formula across each record of a table and returns a one-column table of the results with duplicate values removed. The name of the column is **Value**.

[!INCLUDE [record-scope](../../includes/record-scope.md)]

[!INCLUDE [delegation-no-one](../../includes/delegation-no-one.md)]

## Syntax

**Distinct**( _Table_, _Formula_ )

- _Table_ - Required. Table to evaluate across.
- _Formula_ - Required. Formula to evaluate for each record.

## Example

1. Insert a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control, and set its **OnSelect** property to this formula.

   ```powerapps-dot
   ClearCollect( CityPopulations,
       { City: "London",    Country: "United Kingdom", Population: 8615000 },
       { City: "Berlin",    Country: "Germany",        Population: 3562000 },
       { City: "Madrid",    Country: "Spain",          Population: 3165000 },
       { City: "Hamburg",   Country: "Germany",        Population: 1760000 },
       { City: "Barcelona", Country: "Spain",          Population: 1602000 },
       { City: "Munich",    Country: "Germany",        Population: 1494000 }
   );
   ```

1. Select the button while holding down the Alt key.

   The formula is evaluated and the **CityPopulations** collection is created which you can show by selecting **CityPopulations** in the formula bar:

    > [!div class="mx-imgBorder"] 
    > ![CityPopulations collection shown in result view.](media/function-distinct/citypopulations-create.png)

1. Insert a [**Data table**](/power-apps/maker/canvas-apps/controls/control-data-table) control, and set its **Items** property to this formula:

   ```powerapps-dot
   Distinct( CityPopulations, Country )
   ```

   You can view the result of this formula in the formula bar by selecting the entire formula:

    > [!div class="mx-imgBorder"] 
    > ![Output from Distinct function shown in result view.](media/function-distinct/citypopulations-distinct.png)

1. Use the **Edit fields** link in the data table's properties pane to add the **Value** column:

    > [!div class="mx-imgBorder"] 
    > ![Output from Distinct function shown in data table.](media/function-distinct/citypopulations-datatable.png)

1. Insert a [**Label**](/power-apps/maker/canvas-apps/controls/control-text-box) control, and set its **Text** property to the formula:

   ```powerapps-dot
   First( Sort( Distinct( CityPopulations, Country ), Value ) ).Value
   ```

   This formula sorts the results from **Distinct** with the [**Sort**](function-sort.md) function, takes the first record from the resulting table with the [**First**](function-first-last.md) function, and extracts the **Result** field to obtain just the country/region name.

    > [!div class="mx-imgBorder"] 
    > ![Output from Distinct function showing the first country/region by name.](media/function-distinct/citypopulations-first.png)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
