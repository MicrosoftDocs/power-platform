---
title: Boolean function
description: Reference information including syntax and examples for the Boolean function.
author: gregli
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/10/2024
ms.subservice: power-fx
ms.author: jorisde
contributors:
  - gregli-msft
  - mduelae
  - gregli
---
# Boolean function
[!INCLUDE[function-boolean-applies-to](includes/function-boolean-applies-to.md)]



Converts a text, number, or dynamic value to a Boolean value.

## Description

Use the **Boolean** function to convert other types to a Boolean value.  A Boolean value is *true*, *false*, or *blank*.

In most cases, type coercion happens automatically and the **Boolean** function need not be used explicitly.  For example, `If( "true", 1, 0 )` will return 1 as the text string `"true"` is automatically converted to a Boolean.  The **Boolean** function is useful when an explicit conversion is desired or when using a dynamic value.

## Syntax

**Boolean**( *Text* )<br>
**Boolean**( *STextSingleColumnTable* )

* *Text* - Required. The string(s) to convert.  Must be a case insensitive version of `"true"` or `"false"`.  These text strings aren't localized.  *blank* and empty text is also accepted and converted to a *blank*.  All other text strings return an error.

**Boolean**( *Number* )<br>
**Boolean**( *NumberSingleColumnTable* )

* *Number* - Required.  The number(s) to convert.  `0` is converted to *false* and all other numbers are converted to *true*.  *blank* values are accepted and converted to a *blank*.

**Boolean**( *Dynamic* )

* *Dynamic* - Required. The dynamic value to convert.  Acceptable values are dependent on the dynamic provider.  For [**JSON**](function-parsejson.md), JSON boolean values `true`, `false`, and `null` are accepted, corresponding to *true*, *false*, and *blank* values in Power Fx. String or number values are accepted as outlined for the *String* and *Number* overloads described earlier.

## Examples

#### Basic usage

| Formula | Description | Result |
| --- | --- | --- |
| **Boolean(&nbsp;"true"&nbsp;)** | Converts the text string `"true"` to a boolean value. | *true* |
| **Boolean(&nbsp;"false"&nbsp;)** | Converts the text string `"false"` to a boolean value. | *false* |
| **Boolean(&nbsp;"TRUE"&nbsp;)** | Converts the text string `"TRUE"` to a boolean value. | *true* |
| **Boolean(&nbsp;"TrUe"&nbsp;)** | Converts the text string `"TrUe"` to a boolean value. | *true* |
| **Boolean(&nbsp;"Truthful"&nbsp;)** | Attempts to convert the text string `"Truthful"` to a boolean value, but since it isn't a case insensitive variation of `true` and `false`, an error is returned. | *error (invalid argument)* |
| **Boolean(&nbsp;Blank()&nbsp;)** | Convert the *blank* value to a boolean value. | *blank* |
| **Boolean(&nbsp;0&nbsp;)** | Convert the number `0` to a boolean value. | *false* |
| **Boolean(&nbsp;1&nbsp;)** | Convert the number `1` to a boolean value. | *true* |
| **Boolean(&nbsp;-1234&nbsp;)** | Convert the number `-1234` to a boolean value. | *true* |

### Dynamic usage

| Formula | Description | Result |
| --- | --- | --- |
| **Boolean( ParseJSON( "{&nbsp;""bool"":&nbsp;true&nbsp;}" ).bool )** | Converts the dynamic value `true` (a JSON Boolean) to a boolean value. | *true* |
| **Boolean( ParseJSON( "{&nbsp;""bool"":&nbsp;null&nbsp;}" ).bool )** | Converts the dynamic value `null` (a JSON null) to a boolean value. | *blank* |
| **Boolean( ParseJSON( "{&nbsp;""bool"":&nbsp;"true"&nbsp;}" ).bool )** | Attempts to convert the dynamic value `"true"` (a JSON string) to a boolean value, but since it isn't a valid boolean value in JSON, an error is returned. | *error (invalid argument)* |
| **Boolean( ParseJSON( "[&nbsp;true,&nbsp;false,&nbsp;null&nbsp;]" ).bool )** | Attempts to convert an array of boolean values to a single column table.  Single column tables aren't supported with dynamic values, and instead the formula `ForAll( Table(ParseJSON( "[true, false, null]" )), Boolean( ThisRecord.Value ) )` or `ForAll( ParseJSON( "[true, false, null]" ), Boolean( ThisRecord ) )` should be used. | *error (invalid argument)* |

#### Single column tables

| Formula | Description | Result |
| --- | --- | --- |
| **Boolean( [&nbsp;"true",&nbsp;"false",&nbsp;Blank()&nbsp;] )** | Converts the single column table of text strings to a single column table of boolean values. | [ *true*, *false*, *blank* ] |
| **Boolean( [&nbsp;"true",&nbsp;"falsified"&nbsp;] )** | Converts the single column table of text strings to a single column table of boolean values.  Since the second record in this table isn't a case insensitive variation of `true` and `false`, an error is returned for this record. | [ *true*, *error (invalid argument)* ] |
| **Boolean( [&nbsp;1,&nbsp;2,&nbsp;0 &nbsp;] )** | Converts the single column table of numbers to a single column table of boolean value. | [ *true*, *true*, *false* ] |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]









































































































































