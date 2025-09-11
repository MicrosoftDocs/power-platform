---
title: Enable and Disable functions
description: Reference information including syntax and examples for the Enable and Disable functions.
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
no-loc: ["Enable","Disable"]
---

# Enable and Disable functions
[!INCLUDE[function-enable-disable-applies-to](includes/function-enable-disable-applies-to.md)]



Turns a [signal](signals.md) on or off.

## Overview

Some signals can change often, requiring the app to recalculate as they do. Rapid changes over a long period of time can drain a device's battery. You can use these functions to manually turn a signal on or off.

When a signal isn't being used, it's automatically turned off.

## Description

The **Enable** and **Disable** functions turn a signal on and off, respectively.

These functions currently only work for the **[Location](signals.md)** signal.

These functions have no return value. You can use them only in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

## Syntax

**Enable**( _Signal_ )<br>**Disable**( _Signal_ )

- _Signal_ - Required. The signal to turn on or off.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































