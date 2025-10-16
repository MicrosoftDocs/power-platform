---
title: Exit function
description: Reference information including syntax and examples for the Exit function.
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
no-loc: ["Exit"]
---

# Exit function
[!INCLUDE[function-exit-applies-to](includes/function-exit-applies-to.md)]



Exits the currently running app and optionally signs out the current user.

## Description

The **Exit** function exits the currently running app. The user is returned to the list of apps. The user can then select another app to open.

**Exit** stops any further formula evaluation. Any function calls chained with a [semicolon operator](operators.md) after the **Exit** aren't carried out.

Use the optional _Signout_ argument to sign the current user out of Power Apps. _Signout_ is useful when devices are shared to ensure user security.

While authoring the app, calling **Exit** doesn't exit or sign out the user. However, it stops the evaluation of the rest of the formula.

**Exit** can only be used in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

## Syntax

**Exit**( [*Signout*] )

- _Signout_ – Optional. A Boolean value that if _true_ signs the current user out of Power Apps. The default is _false_ and the user remains signed in.

## Examples

| Formula                    | Description                                                                                                                        |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **Exit()**                 | Exits the current app and leaves the user signed in. The user is returned to the list of apps.                                     |
| **Exit(&nbsp;true&nbsp;)** | Exits the current app and the user is signed out. The user needs to sign back in with their credentials before running an app. |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































