---
title: Char and UniChar functions
description: Reference information including syntax and examples for the Char and UniChar functions.
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
  - carlosff
---

# Char and UniChar functions
[!INCLUDE[function-char-applies-to](includes/function-char-applies-to.md)]

Translates a character code into a string.

## Description

The **Char** function translates a number into a string with the corresponding ASCII character.

The **UniChar** function translates a number into a string with the corresponding Unicode character.

If you pass a single number, the return value is the translated string version of that number. If you pass a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains numbers, the return value is a single-column table of strings in a **Value** column. If you have a multi-column table, you can shape it into a single-column table, as [working with tables](/power-apps/maker/canvas-apps/working-with-tables) describes.

## Syntax

**Char**( _CharacterCode_ )

- _CharacterCode_ - Required. ASCII character code to translate.

**Char**( _CharacterCodeTable_ )

- _CharacterCodeTable_ - Required. Table of ASCII character codes to translate.

**UniChar**( _UnicodeCode_ )

- _UnicodeCode_ - Required. Unicode character code to translate.

**UniChar**( _UnicodeCodeTable_ )

- _UnicodeCodeTable_ - Required. Table of Unicode character codes to translate.

## Examples

### Single number

| Formula | Description | Result |
| --- | --- | --- |
| **Char( 65 )** | Returns the character that corresponds to ASCII code 65. | "A" |
| **Char( 105 )** | Returns the character that corresponds to ASCII code 105. | "i" |
| **Char( 35 )** | Returns the character that corresponds to ASCII code 35. | "#" |
| **UniChar( 35 )** | Returns the character that corresponds to Unicode code 35. | "#" |
| **UniChar( 233 )** | Returns the character that corresponds to Unicode code 233. | "á" |
| **UniChar( 9829 )** | Returns the character that corresponds to Unicode code 9829. | "♥" |

### Single-column table

The example in this section converts numbers from a single-column table.

| Formula | Result |
| --- | --- |
| `Char( [ 65, 105 ] )` | A single-column table with a `Value` column containing the following values: "A", "i" |
| `Char( [ 35, 52 ] )` | A single-column table with a `Value` column containing the following values: "#", "4" |
| `UniChar( [ 71, 97, 114, 231, 111, 110 ] )` | A single-column table with a `Value` column containing the following values: "G", "a", "r", "ç", "o", "n" |

### Display a character map

1. On an empty screen in a tablet app, add a [**Gallery**](/power-apps/maker/canvas-apps/controls/control-gallery) control with a **Blank Horizontal** layout, and then set these properties:

   - **Items**: `Sequence( 8, 0, 16 ) As HighNibble`
   - **Width**: `Parent.Width`
   - **Height**: `Parent.Height`
   - **TemplateSize**: `Parent.Width / 8`
   - **TemplatePadding**: 0
   - **X**: 0
   - **Y**: 0

1. Inside that gallery, add a **Gallery** control with a **Blank Vertical** layout, and then set these properties:

   - **Items**: `Sequence( 16, HighNibble.Value ) As FullCode`
   - **Width**: `Parent.Width / 8`
   - **Height**: `Parent.Height`
   - **TemplateSize**: `Parent.Height / 16`
   - **TemplatePadding**: 0
   - **X**: 0
   - **Y**: 0

1. Inside the second (vertical) gallery, add a **Label** control, and set these properties:

   - **Text**: `FullCode.Value`
   - **Width**: `Parent.Width / 2`
   - **X**: 0
   - **Y**: 0
   - **Align**: `Center`
   - **FontWeight**: `Bold`
   - **Size**: 24

1. Inside the second (vertical) gallery, add another **Label** control, and set these properties:

   - **Text**: `Char( FullCode.Value )`
   - **Width**: `Parent.Width / 2`
   - **X**: `Parent.Width / 2`
   - **Y**: 0
   - **FontWeight**: `Bold`
   - **Size**: 24

You've created a chart of the first 128 ASCII characters. Characters that appear as a small square can't be printed.

![First 128 ASCII characters.](media/function-char/chart-lower.png)

If you want to see how **FullCode.Value** gets its values. Let's begin with the outer horizontal gallery. Its **Items** property uses the **Sequence** function to create 8 columns, starting with 0 with increments of 16:

![Outer gallery illustrated.](media/function-char/chart-lower-outer.png)

Nested within this gallery is another vertical gallery. Its **Items** property fills in the gap left by the increment of 16 from the outer gallery:

![Inner gallery illustrated.](media/function-char/chart-lower-inner.png)

To show the extended ASCII characters, it is a simple matter of changing the starting point for the chart, set in the Sequence function for the outer gallery:

`Sequence( 8, 128, 16 ) As HighNibble`

![Extended ASCII characters.](media/function-char/chart-higher.png)

Finally, to show the characters in a different font, set the **Font** property of the second label to a value such as **'Dancing Script'**.

![Dancing Script.](media/function-char/chart-higher-dancing-script.png)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]





























































































































































