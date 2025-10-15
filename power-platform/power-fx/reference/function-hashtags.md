---
title: HashTags function
description: Reference information including syntax and examples for the HashTags function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/10/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["HashTags"]
---

# HashTags function
[!INCLUDE[function-hashtags-applies-to](includes/function-hashtags-applies-to.md)]



Extracts the hashtags (#strings) from a string of text.

## Description

The **HashTags** function scans a string for hashtags. Hashtags start with a pound character (#), which is followed by any combination of:

- uppercase and lowercase letters
- numerals
- underscores
- currency symbols (such as $)

**HashTags** returns a one-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains the hashtags in the string. If the string contains no hashtags, the function returns a one-column table that's [empty](function-isblank-isempty.md).

## Syntax

**HashTags**( _String_ )

- _String_ - Required. String to scan for hashtags.

## Examples

### Step by step

1. Add a **[Text input](/power-apps/maker/canvas-apps/controls/control-text-input)** control, name it **Tweet**, and type this sentence into it:

   **This #app is #AMAZING and can #coUnt123 or #123abc but not #1-23 or #$\*(#\@")**

2. Add a vertical custom gallery, and set its **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property to this function:

   **HashTags(Tweet.Text)**

3. Add a **[Label](/power-apps/maker/canvas-apps/controls/control-text-box)** control to the gallery template.

   The gallery shows these hashtags:

   - **\#app**
   - **\#AMAZING**
   - **\#coUnt123**
   - **\#123abc**
   - **\#1**

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































