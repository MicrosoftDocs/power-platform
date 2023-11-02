---
title: Decimal, Float, and Value functions
description: Reference information including syntax and examples for the Decimal, Float, and Value functions.
author: gregli-msft
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 11/01/2023
ms.subservice: power-fx
ms.author: gregli
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# Decimal, Float, and Value functions

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps   :::image type="icon" source="media/yes-icon.svg" border="false"::: Dataverse formula columns :::image type="icon" source="media/yes-icon.svg" border="false"::: [PAC CLI](/power-platform/developer/cli/reference/power-fx)

Converts a string of text or other types to a number.

## Description

> [!NOTE]
> Power Apps only supports the **Value** function and it returns a **Float** value. Support for the **Decimal** and **Float** functions will be added soon. 

Use the **Decimal**, **Float**, and **Value** functions to convert a string of text that contains number characters to a numeric value. Use these function when you need to perform calculations on numbers that were entered as text by a user. These functions can also be used to convert other types to a number, such as date/time and Boolean.

The **Value** function will return the default numeric data type for the Power Fx host you are using, which is usually **Decimal** and the best choice for most situations. Use the **Decimal** and **Float** functions when you need a specific data type for a particular scenario, such as a scientific calculation with a very large number. For more details on working with these data types, see [the Numbers section of Data types](../data-types.md#numbers).

Different languages interpret **,** and **.** differently. By default, the text is interpreted in the language of the current user. You can specify the language to use with a language tag, using the same language tags that are returned by the **[Language](function-language.md)** function.

Notes on the format of the string:

- The string may be prefixed with the currency symbol for the current language. The currency symbol is ignored. Currency symbols for other languages aren't ignored.
- The string may be include a percent sign (**%**) at the end, indicating that it's a percentage. The number will be divided by 100 before being returned. Percentages and currency symbols can't be mixed.
- The string may be in scientific notation, with 12 x 10<sup>3</sup> expressed as "12e3".

If the number isn't in a proper format, these functions will return an error.

To convert date and time values, use the [**DateValue**](function-datevalue-timevalue.md), [**TimeValue**](function-datevalue-timevalue.md), or [**DateTimeValue**](function-datevalue-timevalue.md) functions.

## Syntax

**Decimal**( _String_ [, _LanguageTag_ ] )<br>
**Float**( _String_ [, _LanguageTag_ ] )<br>
**Value**( _String_ [, _LanguageTag_ ] )

- _String_ - Required. String to convert to a numeric value.
- _LanguageTag_ - Optional. The language tag in which to parse the string. If not specified, the language of the current user is used.

**Decimal**( _Untyped_ )<br>
**Float**( _Untyped_ )<br>
**Value**( _Untyped_ )

- _Untyped_ - Required. [**Untyped object**](../untyped-object.md) that represents a number. Acceptable values are dependent on the untyped provider.  For [**JSON**](function-parsejson.md), the untyped object is expected to be a JSON number, boolean, or text that can be converted to a number. Keep in mind that locale-related formats are important considerations when communicating with external systems.

## Examples

The user running these formulas is located in the United States and has selected English as their language. The **Language** function is returning "en-US". The Power Fx host uses **Decimal** by default.

### Value and Decimal

Since we are using a host that has **Decimal** as the default, **Value** and **Decimal** will return the same results.

| Formula                         | Description                                                                                    | Result  |
| ------------------------------- | ---------------------------------------------------------------------------------------------- | ------- |
| **Value( "123.456" )**<br>**Decimal( "123.456" )**          | The default language of "en-US" will be used, which uses a period as the decimal separator.    | 123.456 **Decimal** |
| **Value( "123.456", "es-ES" )**<br>**Decimal( "123.456", "es-ES" )** | "es-ES" is the language tag for Spanish in Spain. In Spain, a period is a thousands separator. | 123456 **Decimal** |
| **Value( "123,456" )**<br>**Decimal( "123,456" )**        | The default language of "en-US" will be used, which uses a comma as a thousands separator.     | 123456 **Decimal** |
| **Value( "123,456", "es-ES" )**<br>**Decimal( "123,456", "es-ES" )** | "es-ES" is the language tag for Spanish in Spain. In Spain, a comma is the decimal separator.  | 123.456 **Decimal** |
| **Value( "12.34%" )**<br>**Decimal( "12.34%" )**           | The percentage sign at the end of the string indicates that this is a percentage.              | 0.1234 **Decimal** |
| **Value( "$ 12.34" )**<br>**Decimal( "$ 12.34" )**          | The currency symbol for the current language is ignored.                                       | 12.34 **Decimal**  |
| **Value( "24e3" )**<br>**Decimal( "24e3" )**             | Scientific notation for 24 x 10<sup>3</sup>.                                                   | 24000 **Decimal**  |
| **Value( true )**<br>**Decimal( true )**               | Converts a Boolean to a number, 0 for *false* and 1 for *true* | 1 **Decimal** |

### Float

The **Float** function will have very close to the same results as above. Since 123.456 cannot be precisely represented in **Float**, the result is an approximation that is very close (123.456000000000003069544618484E2) and compounding rounding errors calculations could result in an unexpected result. The resulting type will be **Float** instead.

Where things diverge is if larger or smaller numbers are used.

| Formula | Description | Result |
|---------|-------------|--------|
| **Float( 1e100 )** | Because the literal number `1e100` is beyond the range of a **Decimal**, this results in an error before ever calling the **Float** function.  | *error (overflow)* | 
| **Decimal( 1e100 )** | Same problem as with the **Float** function.  | *error (overflow)* |
| **Float( "1e100" )** | The number in the text string is within the range of **Float** numbers.  | 1e100 **Float** |
| **Decimal( "1e100" )** |  The number in the text string is beyond the range of **Decimal** numbers. | *error (overflow)* |
| **Float( "10000000000.0000000001" )** | The number in the text string is within the range of **Float** numbers.  However, the number requires more precision than a **Float** can provide and will be truncated. | 1 **Float** |
| **Decimal( "10000000000.0000000001" )** |  The number in the text string is within both the range and precision of a **Decimal** numbers. | 10000000000.0000000001 **Decimal** |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
