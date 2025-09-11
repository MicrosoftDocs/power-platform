---
title: Summarize function
description: Reference information including syntax and examples for Summarize function.
author: gregli-msft
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 9/19/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Summarize"]
---
# Summarize function
[!INCLUDE[function-summarize-applies-to](includes/function-summarize-applies-to.md)]



Summarize [records](/power-apps/maker/canvas-apps/working-with-tables#records) of a [table](/power-apps/maker/canvas-apps/working-with-tables) by grouping on one or more [columns](/power-apps/maker/canvas-apps/working-with-tables#columns).

## Description

Use the **Summarize** function to group records of a table and summarize the columns in the group.

The first argument to **Summarize** is the table to operate on. The remaining arguments can be in any order and fall into two categories:
- Group column names. Use these to specify which columns to group on.
- Summarization formulas. Use these to summarize the columns in the **ThisGroup** table. **ThisGroup** is a table which contains all the columns of the original table, but is limited to just the records of one group at a time based on the group columns. Each formula must be named with **As** for column name in the result table.

A table is a value in Power Apps, just like a string or a number. You can specify a table as an argument for a function, and a function can return a table. **Summarize** doesn't modify a table; instead it takes a table as an argument and returns a different table. For more information, see [working with tables](/power-apps/maker/canvas-apps/working-with-tables).

## Delegation

**Summarize** can be delegated depending on the data source and complexity of the summarization formulas. Basic aggregate functions such as [**Sum**](function-aggregates.md), [**Average**](function-aggregates.md), [**Max**](function-aggregates.md), [**Min**](function-aggregates.md), [**CountRows**](function-table-counts.md), and [**Concat**](function-concatenate.md) have a good chance of being delegated. 

If complete delegation of a formula isn't possible, the authoring environment flags the portion that can't be delegated with a warning. When possible, consider changing the formula to avoid functions and operators that can't be delegated. 

For more information, see [delegation overview](/power-apps/maker/canvas-apps/delegation-overview).

## Syntax

**Summarize**( _Table_, _GroupByColumnName1_ [, _GroupByColumnName2_, ... ] [, _SummarizeColumns_ As _SummarizeNames_, ...] )

- _Table_ - Required. Table to be summarized.
- _GroupByColumnNames_ - At least one is required. The column names in _Table_ by which to group records. These columns become columns in the resulting table.
- _SummarizeColumns_ - Optional. Summarization formula over the **ThisGroup** table for each group.
- _SummarizeNames_ - Required for each _SummarizeColumn_. Each summarized column must be explicitly named for the output table.

## Examples

### Simple example

1. Create a table in your Power Fx host with this sample data:

```powerapps-dot
Set( CityPopulations,
   Table(
        { City: "London",    Country: "United Kingdom", Population: 8615000},
        { City: "Berlin",    Country: "Germany",        Population: 3562000},
        { City: "Madrid",    Country: "Spain",          Population: 3165000},
        { City: "Rome",      Country: "Italy",          Population: 2874000},
        { City: "Paris",     Country: "France",         Population: 2273000},
        { City: "Hamburg",   Country: "Germany",        Population: 1760000},
        { City: "Barcelona", Country: "Spain",          Population: 1602000},
        { City: "Munich",    Country: "Germany",        Population: 1494000},
        { City: "Milan",     Country: "Italy",          Population: 1344000}
    )
)
```

2. Evaluate the following formula:

```powerapps-dot
Summarize( CityPopulations, Country,
           Sum( ThisGroup, Population ) As 'Total Population',
           Concat( ThisGroup, City, ", " ) As Cities 
)
```

The result is this table:

| Country/Region | Total Population | Cities |
|---------|------------------|--------|
| United Kingdom | 8615000 | London |
| Germany | 6816000 | Berlin, Hamburg, Munich |
| Spain | 4767000 | Madrid, Barcelona | 
| Italy | 4218000 | Rome, Milan |
| France | 2273000 | Paris |

### Multiple group columns

1. Create a table in your Power Fx host with this sample data:

```powerapps-dot
Set( Inventory, 
   Table(
      {Supplier:"Contoso",  Fruit:"Grapes",  Price:220, Purchase:Date(2015,10,1), Tags: ["Red","Seedless"]},
      {Supplier:"Fabrikam", Fruit:"Lemons",  Price:31,  Purchase:Date(2015,10,1), Tags: ["Colombia"]},
      {Supplier:"Contoso",  Fruit:"Lemons",  Price:29,  Purchase:Date(2015,10,2), Tags: ["Peru"]},
      {Supplier:"Contoso",  Fruit:"Grapes",  Price:210, Purchase:Date(2015,10,2), Tags: ["Green","Seedless"]},
      {Supplier:"Fabrikam", Fruit:"Lemons",  Price:30,  Purchase:Date(2015,10,3), Tags: ["Mexico","Seedless"]},
      {Supplier:"Contoso",  Fruit:"Bananas", Price:12,  Purchase:Date(2015,10,3), Tags: ["Mexico"]}
   )
)
```

2. Evaluate the following formula:

```powerapps-dot
Summarize( Inventory, Supplier, Fruit, Average( ThisGroup, Price ) As 'Average Price' )
```

| Fruit   | Supplier  | Average Price |
|---------|-----------|---------------|
| Grapes  | Contoso   | 215           |
| Lemons  | Fabrikam  | 30.5          |
| Lemons  | Contoso   | 29            |
| Bananas | Contoso   | 12            |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































