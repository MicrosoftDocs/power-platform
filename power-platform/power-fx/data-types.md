---
title: Data types
description: Discover the different data types in Power Fx, how they work, and how to use them effectively in your apps. Learn more and get started today.
author: gregli-msft
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/18/2025
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---
# Data types

Information flows through Power Fx in small, discrete values, like the cells of a spreadsheet. For example, data in a **Birthday** field and an **Anniversary** field both flow through as a **Date** value that includes the year, month, and day. Power Fx formats these values, constrains input to what's appropriate for each, and shares the values with a database. Birthdays and anniversaries might differ to people, but the system handles them in the same way. In this case, **Date** is an example of a [data type](https://en.wikipedia.org/wiki/Data_type).

This article explains each data type in Power Fx, how they work, and how they map to external data sources.


| Data type            | Description                                                                                                                                                                                                                                                                                                                                    | Examples                                                                                                                      |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **Boolean**          | A _true_ or _false_ value. You can use it directly in **If**, **Filter**, and other functions without a comparison.                                                                                                                                                                                                                                 | _true_                                                                                                                        |
| **Choice**           | A choice from a set of options, backed by a number. This data type combines a localizable text label with a numeric value. The label appears in the app, and the numeric value is stored and used for comparisons. The **Type** function supports this data type if you use an instance of a **Choice** field by name.                                                                                                                           | **ThisItem.OrderStatus**                                                                                                      |
| **Color**            | A color specification that includes an alpha channel.                                                                                                                                                                                                                                                                                              | **Color.Red**<br>**ColorValue( "#102030" )**<br>**RGBA( 255, 128, 0, 0.5 )**                                                  |
| **Currency**         | A currency value stored in a floating-point number. Currency values are the same as number values with currency-formatting options. The **Type** function doesn't support the **Currency** data type.                                                                                                                                                                                                      | **123**<br>**4.56**                                                                                                           |
| **Date**             | A date without a time, in the app user's time zone.                                                                                                                                                                                                                                                                                      | **Date( 2019, 5, 16 )**                                                                                                       |
| **DateTime**         | A date with a time, in the app user's time zone.                                                                                                                                                                                                                                                                                         | **DateTimeValue( "May 16, 2019 1:23:09 PM" )**                                                                                |
| **Decimal**         | A number with high precision, base 10 operations, and a limited range.                                                                                                                                                                                                                                                                                         | **123**<br>**Decimal( "1.2345" )**                                                                                |
| **Dynamic** (formerly **UntypedObject**) | The value's type is dynamic and can vary at runtime. A Dynamic value could be any existing type, and can be converted into compatible types using functions such as [Boolean()](reference/function-boolean.md), [Value()](reference/function-value.md), [Table()](reference/function-table.md), etc. For more information, see [Dynamic values](untyped-object.md) and [Working with JSON](working-with-json.md). | **ParseJSON("{ ""Field"" : 1234 }").Field** |
| **Float**          | A number with standard precision, base 2 operations, and a wide range.                                                                                                                                                                                                                                                                                                                        | **123**<br>**8.903e121**<br>**1.234e-200**                                                                                        |
| **GUID**             | A [globally unique identifier](https://wikipedia.org/wiki/Universally_unique_identifier).                                                                                                                                                                                                                                                    | **GUID()**<br>**GUID( "123e4567-e89b-12d3-a456-426655440000" )**                                                              |
| **Hyperlink**        | A text string that contains a hyperlink.                                                                                                                                                                                                                                                                                                           | **"https://powerapps.microsoft.com"**                                                                                         |
| **Image**            | A [universal resource identifier (URI)](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) text string to an image in .jpeg, .png, .svg, .gif, or another common web-image format. The **Type** function doesn't support the **Image** data type.                                                                                                                                                     | **MyImage** added as an app resource<br>**"https://northwindtraders.com/logo.jpg"**<br>**"appres://blobmanager/7b12ffa2..."** |
| **Media**            | A URI text string to a video or audio recording. The **Type** function doesn't support the **Media** data type.                                                                                                                                                                                                                                                                                               | **MyVideo** added as an app resource<br>**"https://northwindtraders.com/intro.mp4"**<br>**"appres://blobmanager/3ba411c..."** |
| **Number** | An alias for **Decimal** (most Power Fx hosts) or **Float** (Canvas apps). If you can use either variety of number for a situation, use **Number** for maximum compatibility.    | **123**<br>**0.0123**<br>**1e4**   |
| **Record**           | A record of data values. This compound data type contains instances of other data types listed in this article. For more information, see [Working with tables](/power-apps/maker/canvas-apps/working-with-tables). The **Type** function supports this data type if you use an instance of a **Record**.                                                                                                                          | **{ Company: "Northwind Traders",<br>Staff: 35, <br>NonProfit: false }**                                                      |
| **Record reference** | A reference to a record in a table. These references are often used with polymorphic lookups. For more information, see [Working with references](/power-apps/maker/canvas-apps/working-with-references). The **Type** function doesn't support this data type.                                                                                                                                               | **First(Accounts).Owner**                                                                                                     |
| **Table**            | A table of records. All records must have the same field names and data types, and omitted fields are treated as _blank_. This compound data type contains instances of other data types listed in this article. For more information, see [Working with tables](/power-apps/maker/canvas-apps/working-with-tables). The **Type** function supports this data type if you use an instance of a **Table**.    | **Table( { FirstName: "Sidney",<br>LastName: "Higa" }, <br>{ FirstName: "Nancy",<br>LastName: "Anderson" } )**                |
| **Text**             | A Unicode text string.                                                                                                                                                                                                                                                                                                                          | **"Hello, World"**                                                                                                            |
| **Time**             | A time without a date, in the app user's time zone.                                                                                                                                                                                                                                                                                      | **Time( 11, 23, 45 )**                                                                                                        |
| **Void** | Used only by behavior user defined functions, it indicates that a function doesn't have a return type. The **Type** function doesn't support this data type. Even though a function doesn't have a return type or value, it can always return an error. | **Hi(): Void = { Notify( "Hello!"  ) }**
| **Yes/No**       | A choice from a set of two options, backed by a boolean value. This data type combines a localizable text label with a boolean value. The label appears in the app, and the boolean value is stored and used for comparisons. The **Type** function supports this data type if you use an instance of a **Yes/No** field by name.                                                                                                                   | **ThisItem.Taxable**                                                                                                          |

Many of these data types are similar and have the same underlying representation, like a **Hyperlink** field being treated as **Text**. The extra data types give better default experiences in forms and other controls.

## Blank

All data types can have a value of _blank_ (no value). The term "null" is often used in databases for this concept.

Use the **Blank** function with the **Set** or **Patch** function to set a variable or field to _blank_. For example, **Set( x, Blank() )** removes the value in the global variable **x**.

Test for a _blank_ value with the [**IsBlank**](reference/function-isblank-isempty.md) function. Replace possible _blank_ values with non-_blank_ values by using the [**Coalesce**](reference/function-isblank-isempty.md) function.

Because all data types support _blank_, the **Boolean** and **Two option** data types have three possible values.

## Text, Hyperlink, Image, and Media

All four of these data types are based on a [Unicode](https://en.wikipedia.org/wiki/Unicode) text string.

### Embedded text

Embedded text strings in a formula are enclosed in double quotation marks. Use two double quotes together to represent a single double quote in the text string. For example, using the following formula in the **OnSelect** property of a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control:

```power-fx
Notify( "Jane said ""Hello, World!""" )
```

Results in a banner when the button is pressed, where the first and last double quotes are omitted (as they delimit the text string) and the repeated double quotes around **Hello, World!** are replaced with a single double quote:

![pop up notification with the message Jane said "Hello, World."](media/data-types/literal-string.png)

Single quotation marks are used for [identifier names](operators.md#identifier-names) that contain special characters and have no special significance within a text string.

### String interpolation

Use string interpolation to embed formulas within a text string. This approach is often easier to work with and visualize the output than using the [**Concatenate**](reference/function-concatenate.md) function or [**&**](operators.md) operator.

Prefix the text string with a dollar sign **$** and enclose the formula to be embedded with curly braces **{ }**. To include a curly brace in the text string, use repeated curly braces: **{{** or **}}**. String interpolation can be used anywhere a standard text string can be used.

For example, consider this formula with global variables **Apples** set to 3 and **Bananas** set to 4:

```power-fx
$"We have {Apples} apples, {Bananas} bananas, yielding {Apples+Bananas} fruit total."
```

This formula returns the text string **We have 3 apples, 4 bananas, yielding 7 fruit total.** The variables **Apples** and **Bananas** are inserted in the text replacing the curly braces, along with the result of the mathematical formula **Apples+Bananas**. Spaces and other characters around the curly braces are preserved as they are.

Embedded formulas can include any functions or operators. All that is required is that the result of the formula can be coerced to a text string. For example, this formula inserts **NickName** if it's supplied, or the **FirstName** if not, in a greeting:

```power-fx
$"Welcome {Coalesce( NickName, FirstName )}, it's great to meet you!"
```

If **NickName** is set to "Joe", then this formula produces the text string **Welcome Joe, it's great to meet you!**. But if **NickName** is _blank_ and **FirstName** is "Joseph", then this formula produces **Dear Joseph, great to meet you!** instead.

String interpolation can include standard text strings in the embedded formula. For example, if neither **NickName** nor **FirstName** were supplied, we could still provide **"Friend"** as a substitute:

```power-fx
$"Welcome {Coalesce( NickName, FirstName, "Friend" )}!"
```

String interpolations can even be nested. Consider this example where **First**, **Middle**, and **Last** names are combined into a greeting. Even if one or two of these values are _blank_, the correct number of spaces are maintained between the name parts. If none of the parts are provided, the inner string interpolation will collapse to an empty string, and be replaced by the [**Coalesce**](reference/function-isblank-isempty.md) function by "Friend".

```power-fx
$"Welcome {Coalesce( Trim( $"{First} {Middle} {Last}"}), "Friend" )}!"
```

| First   | Middle  | Last    | Result                     |
| ------- | ------- | ------- | -------------------------- |
| John    | Qunicy  | Doe     | `Welcome John Quincy Doe!` |
| John    | _blank_ | Doe     | `Welcome John Doe!`        |
| _blank_ | _blank_ | Doe     | `Welcome Doe!`             |
| _blank_ | _blank_ | _blank_ | `Welcome Friend!`          |

### Newlines

Embedded text strings can contain newlines. For example, consider setting the **Text** property of a [**Label**](/power-apps/maker/canvas-apps/controls/control-text-box) control to the following:

```power-fx
"Line 1
Line 2
Line 3"
```

This formula results in three lines shown in the label control:

:::image type="content" source="media/data-types/text-string-literal-newlines.png" alt-text="Embedded text string and label control showing three lines with Line 1, Line 2, and Line 3.":::

Newlines are also supported with string interpolation:

```power-fx
$"Line {1}
Line {1+1}
Line {1+1+1}"
```

Which results in the same output:

:::image type="content" source="media/data-types/string-interpolation-newlines.png" alt-text="String interpolation formula and label control showing three lines with Line 1, Line 2, and Line 3.":::

### Image and Media resources

Through the **File** menu, you can add image, video, and audio files as app resources. The name of the imported file becomes the resource name in the app. In this graphic, the Northwind Traders logo, which is named **nwindlogo**, has been added to the app:

![Northwind resource.](media/data-types/nwind-resource.png "Northwind resource")

To use this resource in an app, specify it in the **Image** property of an [**Image**](/power-apps/maker/canvas-apps/controls/control-image) control:

![Northwind image.](media/data-types/nwind-image.png "Northwind image")

### URIs for images and other media

You can dig a little deeper into that last example by setting the **Text** property of a [**Label**](/power-apps/maker/canvas-apps/controls/control-text-box) control to **nwindlogo**. The label shows a text string:

![Northwind text.](media/data-types/nwind-text.png "Northwind text")

Canvas apps reference each image or other media file, whether it's in the cloud or added as an app resource, by a URI text string.

For example, the **Image** property of an image control accepts not only app resources but also links to images on the web, such as "https://northwindtraders.com/logo.jpg". The property also accepts inline images that use the [data URI scheme](https://en.wikipedia.org/wiki/Data_URI_scheme), as in this example:

```power-fx
"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAFAQMAAACtnVQoAAAABlBMVEUAAAB0J3UMNU6VAAAAAXRSTlMAQObYZgAAABRJREFUCNdjUGJgCGVg6GgAkkA2AA8/AffqCEBsAAAAAElFTkSuQmCC"
```

That URI displays a scaled-up version of two purple diamonds:

![Double diamonds.](media/data-types/double-diamonds.png "Double diamonds")

You can show the most recent image captured in a [**Camera**](/power-apps/maker/canvas-apps/controls/control-camera) control if you set the **Image** property of an image control to the **Photo** property of the camera control. The app holds the image in memory, and the **Photo** property of the camera control returns a URI reference to the image. For example, you might take a picture, and the camera's **Photo** property could return **"appres://blobmanager/7b12ffa2ea4547e5b3812cb1c7b0a2a0/1"**.

You use a URI to reference an image or another media file stored in a database. That way, the app doesn't retrieve the actual data until it's needed. For example, an attachment in a Microsoft Dataverse table might return **"appres://datasources/Contacts/table/..."** As in the camera example, you can display this image by setting the **Image** property of an image control to this reference, which retrieves the binary data.

When you save a media data type, such as an image, to a database, the app sends the actual image or media data, not the URI reference.

### Size limits

As text strings and URIs, these data types have no preset limit on their length.

The binary data that these data types reference also has no preset limit on size. For example, an image captured through the camera control that's referenced as **"appres://..."** can be as large and high resolution as the device's camera can muster. The resolution, frame rate, and other attributes of media files aren't limited by the data type, but specific controls for playing and capturing media may have their own limitations.

However, all data sizes are subject to the amount of available memory in the app. Browsers running on a desktop computer typically support more than 100 megabytes of data. However, the amount of available memory on a device such as a phone might be far lower, typically in the range 30-70 megabytes. To determine whether your app runs within these limits, test common scenarios on all devices on which it should run.

As a best practice, hold data in memory only as long as necessary. Upload images to a database as soon as you can; download images only when the app's user requests them.

## Numbers

> [!NOTE]
> Power Apps only supports **Float** today and it's the type of all numbers. **Decimal** support will be added soon.

Power Fx supports two kinds of numbers: **Decimal** and **Float** (with synonyms **Number** and **Currency**).

**Decimal** is best for most business calculations. It can accurately represent numbers in base 10 meaning that `0.1` can be exactly represented and will avoid rounding errors during calculations. It has a large enough range for any business need, up to 10<sup>28</sup> with up to 28 digits of precision. **Decimal** is the default numeric data type for most Power Fx hosts, used if one simply writes `2*2`.

**Float** is best for scientific calculations. It can represent numbers in a larger range, up to 10<sup>308</sup>. Precision is limited to 15 decimal places and math is based on base 2 so it can't represent some common decimal values precisely. **Float** also has higher performance and is favored if that is a factor and precision isn't critical.

### Decimal numbers

The **Decimal** data type most often uses the [.NET decimal data type](xref:System.Decimal). Some hosts, such as Dataverse formula columns that are run in SQL Server, use the SQL Server decimal data type. 

**Decimal** does math the way you learned in school, using base 10 digits, important to avoid rounding errors from very small differences that can accumulate when using base 2 math (as used by **Float**).

The range is from positive 79,228,162,514,264,337,593,543,950,335 to negative 79,228,162,514,264,337,593,543,950,335. The decimal separator can be placed anywhere within these numbers, providing up to 28 digits of precision, and still be precisely represented. For example, 79,228,162,514,264.337593543950335 can be exactly represented, as can 7.9228162514264337593543950335.

### Floating point numbers

The **Float** data type, also known as **Number** or **Currency**, uses the [IEEE 754 double-precision floating-point standard](https://en.wikipedia.org/wiki/IEEE_754). This standard provides a very large range of numbers in which to work, from –1.79769 x 10<sup>308</sup> to 1.79769 x 10<sup>308</sup>. The smallest value that can be represented is 5 x 10<sup>–324</sup>.

**Float** can exactly represent whole numbers (or integers) between –9,007,199,254,740,991 (–(2<sup>53</sup> – 1)) and 9,007,199,254,740,991 (2<sup>53</sup> – 1), inclusive. This range is larger than the 32-bit (or 4-byte) integer data types that databases commonly use. However, canvas apps can't represent 64-bit (or 8-byte) integer data types. You might want to store the number in a text field or use a calculated column to make a copy of the number in a text field, so that it maps into a **Text** data type in the canvas app. In this manner, you can hold, display, and enter these values, and comparing them to determine whether they're equal; however, you can't perform numerical calculations on them in this form.

Floating-point arithmetic is approximate, so it can sometimes give unexpected results with many documented examples. You might expect the formula **55 / 100 \* 100** to return exactly 55 and **(55 / 100 \* 100) - 55** to return exactly zero. However, the latter formula returns 7.1054 x 10<sup>–15</sup>, which is very small but not zero. That tiny difference doesn't normally cause a problem, and the app rounds it away when showing the result. However, small differences can compound in subsequent calculations and appear to give the wrong answer.

Database systems often store currencies and perform calculations by using decimal math, which offers a smaller range but greater control over the precision. By default, canvas apps map currencies in and out of floating-point values; therefore, the result might differ from calculations that are done in a native decimal data type. Depending on the precision needs of your app, you might want to work with these values as **Text**, as described for large integers earlier.

### Defaults and conversions

> [!NOTE]
> Power Apps only supports **Float** today and it's the type of all numbers. **Decimal** support will be added soon.

Most Power Fx hosts use **Decimal** by default. Having this default means:
- Literal numbers in formulas. The number `1.234` is interpreted as a **Decimal** value. For example, the formula `1.234 * 2` interprets the `1.234` and `2` as **Decimal** and return a **Decimal** result.
- Value function. `Value( "1.234" )` returns a **Decimal** value. For example, in the formula `Value( "1.234" ) * 2`, the **Value** function interprets the contents of the text string `"1.234"` as a **Decimal**.

To work with **Float** values, the **Float** function is used. Extending our example, `Float( 1.234 )` converts the **Decimal** `1.234` to **Float**. **Float** can also be used as a replacement for **Value** to convert a string containing a floating point number such as `Float( "1.234" )` to a **Float** value, which is required if the number can't be represented as a **Decimal**.

In summary:

| Usage                            | **Decimal** | **Float** |
|----------------------------------|-------------|-----------|
| Literal numbers in formulas      | `1.234` | `Float( 1.234 )`<br>`Float( "1.234" )` |
| Conversion from text string      | `Value( "1.234" )`<br>`Decimal( "1.234" )` | `Float( "1.234" )` |
| Conversion between numeric types | `Decimal( float )` | `Float( decimal )` |
| Conversion to text string        | `Text( decimal )` | `Text( float )` |
 
### Mixing numeric types

**Float** and **Decimal** values can be freely mixed. When mixed, **Decimal** values are converted to **Float** values due to the larger range. As this conversion can result in a loss of precision, it's important to not mix the two needlessly. Since **Decimal** is the default literal data type and most numeric functions preserve the type, it's relatively easy to avoid moving to **Float** without desiring it.

For example, consider the following calculation using `pac power-fx repl` after installing the [Power Platform CLI](../developer/cli/introduction.md). Since both numbers are **Decimal**, the calculation is done in **Decimal**, and the result retains full precision:

```power-fx
>> 1.0000000000000000000000000001 * 2
2.0000000000000000000000000002
```

If instead, the second operand was changed to **Float** then the entire calculation would be done in **Float**, and the tiny fractional part would be lost:

```power-fx
>> 1.0000000000000000000000000001 * Float(2)
2
```

## Date, Time, and DateTime

### Time zones

Date/time values fall in these categories:

- **User local**: These values are stored in [UTC (Coordinated Universal Time)](https://en.wikipedia.org/wiki/Coordinated_Universal_Time), but the app user's time zone affects how the app shows these values and how the app user specifies them. As an example, the same moment appears differently to a user in Canada than it does to a user in Japan.
- **Time zone independent**: The app shows these values the same way and the app user specifies them the same way, regardless of time zone. The same moment appears the same way to a user in Canada as it does to a user in Japan. App authors who don't expect their apps to run in different time zones use these values because they're simpler overall.

This table shows some examples:

| Date/time type            | Value stored in the database                   | Value displayed and entered 7 hours west of UTC  | Value displayed and entered 4 hours east of UTC |
| ------------------------- | ---------------------------------------------- | ------------------------------------------------ | ----------------------------------------------- |
| **User local**            | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM | Saturday,&nbsp;May&nbsp;18,&nbsp;2019<br>9:00 PM | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>8:00 AM  |
| **Time zone independent** | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM   | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM  |

For **User local** date/times, canvas apps use the time zone of the browser or device, but model-driven apps use the user's setting in Dataverse. These settings typically match, but results differ if these settings differ.

Use the [**DateAdd**](reference/function-dateadd-datediff.md) and [**TimeZoneInformation**](reference/function-dateadd-datediff.md) functions to convert local time to UTC and back again. See the examples at the end of the documentation for these functions.

### Numeric equivalents

Canvas apps hold and calculate all date/time values, whether **User local** or **Time zone independent** in UTC. The app translates the values based on the app user's time zone when showing them and when the app user specifies them.

When a canvas app reads a **Time zone independent** value from a data source or writes such a value to a data source, the app automatically adjusts the value to compensate for the time zone of the app's user. The app then treats the value as a UTC value, consistent with all other date/time values in the app. Because of this compensation, the original **Time zone independent** value appears when the app adjusts the UTC value for the app user's time zone.

You can observe this behavior more closely by using the [**Value**](reference/function-value.md) function to access the underlying numerical value for a date/time value. This function returns the date/time value as the number of milliseconds since January 1, 1970 00:00:00.000 UTC.

Because every date/time value is held in UTC, the formula **Value( Date( 1970, 1, 1 ) )** won't return zero in most parts of the world because the **Date** function returns a date in UTC. For example, the formula would return 28,800,000 in a time zone that's offset from UTC by eight hours. That number reflects the number of milliseconds in eight hours.

Returning to our example:

| Date/time type            | Value stored in the database                   | Value displayed and entered 7 hours west of UTC  | **Value** function returns                                                  |
| ------------------------- | ---------------------------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------- |
| **User local**            | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM | Saturday,&nbsp;May&nbsp;18,&nbsp;2019<br>9:00 PM | 1,558,238,400,000<br> (Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM UTC)  |
| **Time zone independent** | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM | Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>4:00 AM   | 1,558,263,600,000<br> (Sunday,&nbsp;May&nbsp;19,&nbsp;2019<br>11:00 AM UTC) |

### Converting Unix times

Unix times reflect the number of seconds since January 1, 1970 00:00:00 UTC. Because canvas apps use milliseconds instead of seconds, you can convert between the two by multiplying or dividing by 1,000.

For example, Unix time shows September 9, 2001, at 01:46:40 UTC as 1,000,000,000. To show that date/time value in a canvas app, multiply that number by 1,000 to convert it to milliseconds, and then use it in a [**Text**](reference/function-text.md) function. The formula **Text( 1000000000 \* 1000, DateTimeFormat.UTC )** returns the string **2001-09-09T01:46:40.000Z**.

However, that function returns **Saturday, September 8, 2001 18:46:40** if you use the **DateTimeFormat.LongDateTime24** format in a time zone that's -7 hours offset from UTC (7 hours west of UTC). This result shows the **DateTime** value correctly based on the local time zone.

To convert to a Unix time, divide the result from **Value** by 1,000:
<br>**RoundDown( Value( UnixTime ) / 1000, 0 )**

If you need the Unix time in a **Date** value for further calculations or display within Power Apps, use this formula:
<br>**DateAdd( Date( 1970,1,1 ), UnixTime, Seconds )**

### SQL Server

SQL Server has [**Datetime**, **Datetime2**, and other date/time data types](/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql) that don't include a time-zone offset and don't indicate which time zone they're in. Canvas apps assume these values are stored in UTC and treat them as **User local**. If the values are meant to be time-zone independent, correct for the UTC translations by using the [**TimeZoneOffset**](reference/function-dateadd-datediff.md#converting-to-utc) function.

Canvas apps use the included time-zone information in **Datetimeoffset** fields when converting a value to the app's internal UTC representation. The apps always use UTC as the time zone (zero time zone offset) when they write data.

Canvas apps read and write values of the [**Time**](/sql/t-sql/data-types/time-transact-sql) data type in SQL Server as text strings in the [ISO 8601 duration format](https://en.wikipedia.org/wiki/ISO_8601#Durations). For example, you must parse this string format and use the [**Time**](reference/function-date-time.md) function to convert the text string **"PT2H1M39S"** to a **Time** value:

```power-fx
With(
    Match( "PT2H1M39S", "PT(?:(?<hours>\d+)H)?(?:(?<minutes>\d+)M)?(?:(?<seconds>\d+)S)?" ),
    Time( Value( hours ), Value( minutes ), Value( seconds ) )
)
// Result: 2:01 AM (as shown in a label control, use the Text function to see the seconds)

```

### Mixing date and time information

**Date**, **Time**, and **DateTime** have different names, but they all hold the same information about dates and times.

A **Date** value can include time information with it, which is usually midnight. A **Time** value can carry date information, which is usually January 1, 1970. Dataverse also stores time information with a **Date Only** field but shows only the date information by default. Similarly, canvas apps sometimes distinguish between these data types to determine default formats and controls.

Adding and subtracting date and time values directly isn't recommended because time-zone and other conversions could cause confusing results. Either use the **Value** function to convert date/time values to milliseconds first and take into account the app user's time zone, or use the [**DateAdd**](reference/function-dateadd-datediff.md) and [**DateDiff**](reference/function-dateadd-datediff.md) functions to add or subtract from one of these values.

## Choices and Yes/No

Choices and two-option data types give two or more choices for an app user to select. For example, an **Order Status** choice might offer the choices **New**, **Shipped**, **Invoiced**, and **Closed**. The two-option data type gives only two choices.

Both of these data types show their labels as text. For example, a label control shows one of the order-status options if the control's **Text** property is set to a formula that references that choice. Option labels can be localized for app users in different locations.

When an app user selects an option and saves the change, the app sends the data to the database, which stores it in a way that's independent of language. An option in a choice is sent and stored as a number, and an option in a two-option data type is sent and stored as a boolean value.

The labels are for display only. You can't compare the labels directly because they're specific to a language. Instead, each choice has an enumeration that works with the underlying number or boolean value. For example, you can't use this formula:

`If( ThisItem.OrderStatus = "Active", ...`

But you can use this formula:

`If( ThisItem.OrderStatus = OrderStatus.Active, ...`

For global choices (which tables share), the name of the option-set enumeration matches the name of the global choice. For local choices (which are scoped to a table), the name can include the table name. This behavior avoids conflicts if multiple tables have choices with the same name. For example, the **Accounts** table might have an **OrderStatus** choice, and its name might be **OrderStatus (Accounts)**. That name has spaces and parentheses, so you need to surround it with single quotation marks if you reference it in a formula.

Two-option values also behave as boolean values. For example, a two-option value named **TaxStatus** might have the labels **Taxable** and **Non-Taxable**, which correspond to _true_ and _false_. To show this, use this formula:

`If( ThisItem.Taxable = TaxStatus.Taxable, ...`

You can also use this formula:

`If( ThisItem.Taxable, ...`

[!INCLUDE[footer-include](../includes/footer-banner.md)]
