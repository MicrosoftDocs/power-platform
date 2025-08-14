---
title: Help function
description: Reference information including syntax and examples for the Help function.
author: gregli-msft
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Help function
[!INCLUDE[function-help-applies-to](includes/function-help-applies-to.md)]



Displays help information for command line Power Fx hosts.

## Description

The **Help** function displays helpful information when working with command line Power Fx hosts, such as the [Power Platform CLI](../../developer/cli/introduction.md).  

The output information includes the list of functions available and any details specific to the host. This output is updated as more guidance and new functions are added.

> [!NOTE]
> Most Power Fx hosts do not provide a **Help** function, relying on the formula bar and Power Fx documentation.

## Syntax

**Help**()

## Examples

1. Install [Power Platform CLI](../../developer/cli/introduction.md).
1. From the command line, start the [Power Fx repl](../../developer/cli/reference/power-fx.md) (interactive Power Fx Read-Eval-Print Loop) using `pac power-fx repl`.
1. Run the function `Help()`.  

```
C:\>pac power-fx repl
Power Fx REPL: x.x.x

>> Help()
Available functions (case sensitive):
  Abs             Acos            Acot            AddColumns      And
  Asin            AsType          Atan            Atan2           Average
  Blank           Boolean         Char            Clear           ClearCollect
  ...
  Text            Time            TimeValue       TimeZoneOffset  Today
  Trim            TrimEnds        Trunc           Upper           Value
  VarP            Weekday         With            Year

Formula reference: https://aka.ms/Power-Fx-Formula-Reference

true

>>
```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































