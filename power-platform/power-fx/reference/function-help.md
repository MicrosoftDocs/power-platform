---
title: Help function
description: Reference information including syntax and examples for the Help function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 11/01/2023
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# Help function

Displays help information for interactive Power Fx hosts.

## Description

The **Help** function displays help information when working with interactive Power Fx hosts, such as the [Power Platform CLI](../../developer/cli/introduction.md).  Information will include the list of functions available in this host and any details specific to this host.

> [!NOTE]
> Most Power Fx hosts do not provide a **Help** function, instead relying on the documentation.

## Syntax

**Help**()

## Examples

1. [Install the Power Platofrm CLI](../../developer/cli/introduction.md).
1. From the command line, start the Power Fx repl with `pac power-fx repl`.
1. Run the function `Help()`.  

You will see something similar to the below.  Help information will be updated with more details and as new functions are introduced.

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
