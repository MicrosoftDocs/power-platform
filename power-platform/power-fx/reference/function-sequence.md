---
title: Sequence function
description: Reference information including syntax and examples for the Sequence function.
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

# Sequence function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Desktop flows :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Power Platform CLI

Generate a table of sequential numbers.

## Description

The **Sequence** function generates a single column table of sequential numbers, such as 1, 2, 3. The name of the column is **Value**. `Sequence( 4 )` is equivalent to `[1,2,3,4]`.

Use **Sequence** with the **ForAll** function to iterate a specific number of times. For example, the following formula adds 10 random numbers to the collection **MyRandomNumbers**:

```powerapps-dot
ForAll( Sequence( 10 ), Collect( MyRandomNumbers, Rand() ) )
```

**ForAll** can also be used to transform the value into other data types and return a new table. For example, the following formula returns a table of the next 10 days:

```powerapps-dot
ForAll( Sequence( 10 ), DateAdd( Today(), Value, Days ) )
```

The number of records to generate is rounded down to the nearest whole number and must be in the range 0 to 50,000. Generating a table with zero records results in an _empty_ table.

> [!NOTE] 
> **Sequence** is limited to 50,000 records.

## Syntax

**Sequence**( _Records_ [, _Start_ [, *Step* ] ] )

- _Records_ – Required. The number of records to create. Must be in the range 0 to 50,000.
- _Start_ – Optional. The starting number for the sequence. Default is 1.
- _Step_ – Optional. The increment for each successive number in the sequence. _Step_ can be negative to count down from the _Start_. Default is 1.

## Examples

### Basic usage

| Formula                                             | Description                                                                                     | Result                                                                                                                                |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| **Sequence( 4 )**                                   | Generates a 4 record table starting at the default 1 and incrementing by the default 1.         | ![Sequence # 4.](media/function-sequence/sequence-4.png "Sequence # 4")                                                               |
| **Sequence( 4, 24 )**                               | Generates a 4 record table starting at 24 and incrementing by the default 1.                    | ![Sequence 4, 24.](media/function-sequence/sequence-4-24.png "Sequence 4, 24")                                                        |
| **Sequence( 4, 4, -1 )**                            | Generates a 4 record table starting at 4 and incrementing by -1, effectively counting backward. | ![Sequence 4, 4, -1.](media/function-sequence/sequence-4-4-n1.png "Sequence 4, 4, -1")                                                |
| **Sequence( 4, -100, 0.5 )**                        | Generates a 4 record table starting at -100 and incrementing by 0.5.                            | ![Sequence 4, -100, 0.5.](media/function-sequence/sequence-4-n100-p5.png "Sequence 4, -100, 0.5")                                     |
| **Sequence( 0.9 )**                                 | Generates an _empty_ table as the count rounds down to 0.                                       | ![Sequence 0.9.](media/function-sequence/sequence-empty.png "Sequence 0.9")                                                           |
| **ForAll( Sequence( 4 ), Rand() )**                 | Generates a 4 record table of random numbers.                                                   | ![Sequence # 4 with Random.](media/function-sequence/sequence-4-random.png "Sequence # 4 with Random")<br>_Actual numbers will vary._ |
| **Concat( Sequence( 5 ),<br>Text( Value ) & " " )** | Generates a string of numbers from 1 to 5.                                                      | **"1 2 3 4 5 "**                                                                                                                      |

### Character map

See the [**Char**](function-char.md#display-a-character-map) function reference for two **Sequence** functions working together to display a character map in a two-dimensional layout.

### Chessboard

See the [**As**](operators.md#as-operator) operator reference for two **Sequence** functions working together to create a chessboard in a text string and in two nested galleries.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
