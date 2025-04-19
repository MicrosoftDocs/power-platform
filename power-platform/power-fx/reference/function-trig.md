---
title: Acos, Acot, Asin, Atan, Atan2, Cos, Cot, Degrees, Pi, Radians, Sin, and Tan functions
description: Reference information including syntax and examples for the Acos, Acot, Asin, Atan, Atan2, Cos, Cot, Degrees, Pi, Radians, Sin, and Tan functions.
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

# Acos, Acot, Asin, Atan, Atan2, Cos, Cot, Degrees, Pi, Radians, Sin, and Tan functions
[!INCLUDE[function-trig-applies-to](includes/function-trig-applies-to.md)]



Calculates trigonometric values.

## Description

### Primary functions

The **Cos** function returns the cosine of its argument, an angle specified in radians.

The **Cot** function returns the cotangent of its argument, an angle specified in radians.

The **Sin** function returns the sine of its argument, an angle specified in radians.

The **Tan** function returns the tangent of its argument, an angle specified in radians.

### Inverse functions

The **Acos** function returns the arccosine, or inverse cosine, of its argument. The arccosine is the angle whose cosine is the argument. The returned angle is given in radians in the range 0 (zero) to &pi;.

The **Acot** function returns the principal value of the arccotangent, or inverse cotangent, of its argument. The returned angle is given in radians in the range 0 (zero) to &pi;.

The **Asin** function returns the arcsine, or inverse sine, of its argument. The arcsine is the angle whose sine is the argument. The returned angle is given in radians in the range -&pi;/2 to &pi;/2.

The **Atan** function returns the arctangent, or inverse tangent, of its argument. The arctangent is the angle whose tangent is the argument. The returned angle is given in radians in the range -&pi;/2 to &pi;/2.

The **Atan2** function returns the arctangent, or inverse tangent, of the specified _x_ and _y_ coordinates as arguments. The arctangent is the angle from the _x_-axis to a line that contains the origin (0, 0) and a point with coordinates (_x_, _y_). The angle is given in radians between -&pi; and &pi;, excluding -&pi;. A positive result represents a counterclockwise angle from the _x_-axis; a negative result represents a clockwise angle. **Atan2(&nbsp;_a_,&nbsp;_b_&nbsp;)** equals **Atan(&nbsp;_b_/_a_&nbsp;)**, except that **_a_** can equal 0 (zero) with the **Atan2** function.

### Helper functions

The **Degrees** function converts radians to degrees. &pi; radians equals 180 degrees.

The **Pi** function returns the transcendental number &pi;, which begins 3.141592...

The **Radians** function converts degrees to radians.

### Notes

If you pass a single number to these functions, the return value is a single result. If you pass a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains numbers, the return value is a single-column table of results with a **Value** column, one result for each record in the argument's table. If you have a multi-column table, you can shape it into a single-column table, as [working with tables](/power-apps/maker/canvas-apps/working-with-tables) describes.

If an argument would result in an undefined value, the result is _blank_. This can happen, for example, when using inverse functions with arguments that are out of range.

## Syntax

### Primary Functions

**Cos**( _Radians_ )<br>**Cot**( _Radians_ )<br>**Sin**( _Radians_ )<br>**Tan**( _Radians_ )

- _Radians_ - Required. Angle to operate on.

**Cos**( _SingleColumnTable_ )<br>**Cot**( _SingleColumnTable_ )<br>**Sin**( _SingleColumnTable_ )<br>**Tan**( _SingleColumnTable_ )

- _SingleColumnTable_ - Required. A single-column table of angles to operate on.

### Inverse Functions

**Acos**( _Number_ )<br>**Acot**( _Number_ )<br>**Asin**( _Number_ )<br>**Atan**( _Number_ )

- _Number_ - Required. Number to operate on.

**Acos**( _SingleColumnTable_ )<br>**Acot**( _SingleColumnTable_ )<br>**Asin**( _SingleColumnTable_ )<br>**Atan**( _SingleColumnTable_ )

- _SingleColumnTable_ - Required. A single-column table of numbers to operate on.

**Atan2**( _X_, _Y_ )

- _X_ - Required. _X_-axis coordinate.
- _Y_ - Required. _Y_-axis coordinate.

### Helper Functions

**Degrees**( _Radians_ )

- _Radians_ - Required. Angle in radians to convert to degrees.

**Pi**()

**Radians**( _Degrees_ )

- _Degrees_ - Required. Angle in degrees to convert to radians.

## Examples

### Single number

| Formula | Description | Result |
| --- | --- | --- |
| **Cos(&nbsp;1.047197&nbsp;)** | Returns the cosine of 1.047197 radians or 60 degrees. | 0.5 |
| **Cot(&nbsp;Pi()/4&nbsp;)** | Returns the cotangent of 0.785398... radians or 45 degrees. | 1 |
| **Sin(&nbsp;Pi()/2&nbsp;)** | Returns the sine of 1.570796... radians or 90 degrees. | 1 |
| **Tan(&nbsp;Radians(60)&nbsp;)** | Returns the tangent of 1.047197... radians or 60 degrees. | 1.732050... |
| **Acos(&nbsp;0.5&nbsp;)** | Returns the arccosine of 0.5, in radians. | 1.047197... |
| **Acot(&nbsp;1&nbsp;)** | Returns the arccotangent of 1, in radians. | 0.785398... |
| **Asin(&nbsp;1&nbsp;)** | Returns the arcsine of 1, in radians. | 1.570796... |
| **Atan(&nbsp;1.732050&nbsp;)** | Returns the arctangent of 1.732050, in radians. | 1.047197... |
| **Atan2(&nbsp;5,&nbsp;3&nbsp;)** | Returns the arctangent of the angle from the _x_-axis of the line that contains the origin (0,0) and the coordinate (5,3), which is approximately 31 degrees. | 0.540419... |
| **Atan2(&nbsp;4,&nbsp;4&nbsp;)** | Returns the arctangent of the angle from the _x_-axis of the line that contains the origin (0,0) and the coordinate (4,4), which is exactly &pi;/4 radians or 45 degrees. | 0.785398... |
| **Degrees(&nbsp;1.047197&nbsp;)** | Returns the equivalent number of degrees for 1.047197 radians. | 60 |
| **Pi()** | Returns the transcendental number &pi;. | 3.141592... |
| **Radians(&nbsp;15&nbsp;)** | Returns the equivalent number of radians for 15 degrees. | 0.261799... |

### Single-column table

The examples in this section use a [data source](/power-apps/maker/canvas-apps/working-with-data-sources) that's named **ValueTable** and that contains the following data. The last record in the table is &pi;/2 radians or 90 degrees.

| Value |
| --- |
| 0.5 |
| -2 |
| 1.570796... |

| Formula | Description | Result |
| --- | --- | --- |
| **Cos(&nbsp;ValueTable&nbsp;)** | Returns the cosine of each number in the table. | A single-column table with a `Value` column containing the following values: 0.877582..., -0.416146..., 0 |
| **Cot(&nbsp;ValueTable&nbsp;)** | Returns the cotangent of each number in the table. | A single-column table with a `Value` column containing the following values: 1.830487..., 0.457657..., 0 |
| **Sin(&nbsp;ValueTable&nbsp;)** | Returns the sine of each number in the table. | A single-column table with a `Value` column containing the following values: 0.479425, -0.909297..., 1 |
| **Tan(&nbsp;ValueTable&nbsp;)** | Returns the tangent of each number in the table. | A single-column table with a `Value` column containing the following values: 0.546302..., 2.185039..., 3060023.306952... |
| **Acos(&nbsp;ValueTable&nbsp;)** | Returns the arccosine of each number in the table. | A single-column table with a `Value` column containing the following values: 1.047197..., Blank(), Blank() |
| **Acot(&nbsp;ValueTable&nbsp;)** | Returns the arccotangent of each number in the table. | A single-column table with a `Value` column containing the following values: 1.107138..., 2.677945..., 0.566911... |
| **Asin(&nbsp;ValueTable&nbsp;)** | Returns the arcsine of each number in the table. | A single-column table with a `Value` column containing the following values: 0.523598..., Blank(), Blank() |
| **Atan(&nbsp;ValueTable&nbsp;)** | Returns the arctangent of each number in the table. | A single-column table with a `Value` column containing the following values: 0.463647..., -1.107148..., 1.00388... |
| **Degrees(&nbsp;ValueTable&nbsp;)** | Returns the equivalent number of degrees for each number in the table, assumed to be angles in radians. | A single-column table with a `Value` column containing the following values: 28.647889..., -114.591559..., 90 |
| **Radians(&nbsp;ValueTable&nbsp;)** | Returns the equivalent number of radians for each number in the table, assumed to be angles in degrees. | A single-column table with a `Value` column containing the following values: 0.008726..., -0.034906..., 0.027415... |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]






































































































































