---
title: Replace and Substitute functions
description: Reference information including syntax and examples for the Replace and Substitute functions.
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
---

# Replace and Substitute functions
[!INCLUDE[function-replace-substitute-applies-to](includes/function-replace-substitute-applies-to.md)]



Replace a portion of a string of text with another string.

## Description

The **Replace** function identifies the text to replace by starting position and length.

The **Substitute** function identifies the text to replace by matching a string. If more than one match is found, you can replace all of them or specify one to replace.

If you pass a single string, the return value is the modified string. If you pass a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains strings, the return value is a single-column table with a **Value** column of modified strings. If you have a multi-column table, you can shape it into a single-column table, as [working with tables](/power-apps/maker/canvas-apps/working-with-tables) describes.

## Syntax

**Replace**( _String_, _StartingPosition_, _NumberOfCharacters_, _NewString_ )

- _String_ - Required. The string to operate on.
- _StartingPosition_ - Required. Character position to start the replacement. The first character of _String_ is at position 1.
- _NumberOfCharacters_ - Required. The number of characters to replace in _String_.
- _NewString_ - Required. The replacement string. The number of characters in this argument can differ from the _NumberOfCharacters_ argument.

**Substitute**( _String_, _OldString_, _NewString_ [, *InstanceNumber* ] )

- _String_ - Required. The string to operate on.
- _OldString_ - Required. The string to replace.
- _NewString_ - Required. The replacement string. _OldString_ and _NewString_ can have different lengths.
- _InstanceNumber_ - Optional. Use this argument to specify which instance of _OldString_ to replace if _String_ contains more than one instance. If you don't specify this argument, all instances will be replaced.

**Replace**( _SingleColumnTable_, _StartingPosition_, _NumberOfCharacters_, _NewString_ )

- _SingleColumnTable_ - Required. A single-column table of strings to operate on.
- _StartingPosition_ - Required. Character position to start the replacement. The first character of each string in the table is at position 1.
- _NumberOfCharacters_ - Required. The number of characters to replace in each string.
- _NewString_ - Required. The replacement string. The number of characters in this argument can differ from the _NumberOfCharacters_ argument.

**Substitute**( _SingleColumnTable_, _OldString_, _NewString_ [, *InstanceNumber* ] )

- _SingleColumnTable_ - Required. A single-column table of strings to operate on.
- _OldString_ - Required. The string to replace.
- _NewString_ - Required. The replacement string. _OldString_ and _NewString_ can have different lengths.
- _InstanceNumber_ - Optional. Use this argument to specify which instance of _OldString_ to replace if _String_ contains more than one instance. If you don't specify this argument, all instances will be replaced.

## Examples

| Formula | Description | Result |
| --- | --- | --- |
| **Replace( "abcdefghijk",&nbsp;6,&nbsp;5,&nbsp;"\*" )** | Replaces five characters in "abcdefghijk" with a single "\*" character, starting with the sixth character ("f"). | "abcde\*k" |
| **Replace(&nbsp;"2019",&nbsp;3,&nbsp;2,&nbsp;"20"&nbsp;)** | Replaces the last two characters of "2019" with "20". | "2020" |
| **Replace(&nbsp;"123456",&nbsp;1,&nbsp;3,&nbsp;"\_"&nbsp;)** | Replaces the first three characters of "123456" with a single "\_" character. | "\_456" |
| **Substitute(&nbsp;"Sales&nbsp;Data",&nbsp;"Sales",&nbsp;"Cost"&nbsp;)** | Substitutes the string "Cost" for "Sales". | "Cost Data" |
| **Substitute( "Quarter&nbsp;1,&nbsp;2018", "1", "2", 1 )** | Substitutes only the first instance of "1" with "2" because the fourth argument (_InstanceNumber_) is provided with a 1. | "Quarter 2, 2018" |
| **Substitute( "Quarter&nbsp;1,&nbsp;2011", "1", "2", 3 )** | Substitutes only the third instance of "1" with "2" because the fourth argument (_InstanceNumber_) is provided with a 3. | "Quarter 1, 2012" |
| **Substitute( "Quarter&nbsp;1,&nbsp;2011", "1", "2" )** | Substitutes all instances of "1" with "2" because the fourth argument (_InstanceNumber_) isn't provided. | "Quarter 2, 2022" |
| **Replace(<br>[&nbsp;"Quarter&nbsp;1,&nbsp;2018",<br>"Quarter&nbsp;2,&nbsp;2011",<br>"Quarter&nbsp;4,&nbsp;2019" ],<br>9, 1, "3" )** | Replaces the ninth character in each record of the single-column table with "3". | A single-column table with a `Value` column containing the following values: [&nbsp;"Quarter&nbsp;3,&nbsp;2018",<br>"Quarter&nbsp;3,&nbsp;2011",<br>"Quarter&nbsp;3,&nbsp;2019"&nbsp;] |
| **Substitute( <br>[&nbsp;"Qtr&nbsp;1,&nbsp;2018",<br>"Quarter&nbsp;1,&nbsp;2011",<br>"Q1,&nbsp;2019"&nbsp;],<br>"1", "3", 1 )** | Because the fourth argument (_InstanceNumber_) is provided with a value of 1, substitutes only the first instance of "1" in each record of the single-column table with "3". | A single-column table with a `Value` column containing the following values: [&nbsp;"Qtr&nbsp;3,&nbsp;2018",<br>"Quarter&nbsp;3,&nbsp;2011",<br>"Q3,&nbsp;2019"&nbsp;] |
| **Substitute( <br>[&nbsp;"Qtr&nbsp;1,&nbsp;2018",<br>"Quarter&nbsp;1,&nbsp;2011",<br>"Q1,&nbsp;2019"&nbsp;],<br>"1", "3" )** | Because the fourth argument (_InstanceNumber_) isn't provided, substitutes all instances of "1" in each record of the single-column table with "3". | A single-column table with a `Value` column containing the following values: [&nbsp;"Qtr&nbsp;3,&nbsp;2038",<br>"Quarter&nbsp;3,&nbsp;2033",<br>"Q3,&nbsp;2039"&nbsp;] |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































