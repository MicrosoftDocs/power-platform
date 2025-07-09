---
title: IsMatch, Match, and MatchAll functions
description: Reference information including syntax and examples for the IsMatch, Match, and MatchAll functions.
author: gregli-msft
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/20/2025
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# IsMatch, Match, and MatchAll functions
[!INCLUDE[function-ismatch-applies-to](includes/function-ismatch-applies-to.md)]



Tests for a match or extracts parts of a text string based on a pattern.

## Description

The **IsMatch** function tests whether a text string matches a pattern that can comprise ordinary characters, predefined patterns, or a [regular expression](#regular-expressions). The **Match** and **MatchAll** functions return what was matched, including submatches.

Use **IsMatch** to validate what a user typed in a **[Text input](/power-apps/maker/canvas-apps/controls/control-text-input)** control. For example, confirm whether the user entered a valid email address before the result is saved to your data source. If the entry doesn't match your criteria, add other controls that prompt the user to fix the entry.

Use **Match** to extract the first text string that matches a pattern and **MatchAll** to extract all text strings that match. Extract submatches to parse complex strings.

**Match** returns a record of information for the first match found, and **MatchAll** returns a table of records for every match found. The record or records contain:

| Column                                       | Type                                           | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------------------------------------------- | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| _named sub&#8209;match or sub&#8209;matches_ | Text                                           | Each named submatch has its own column. Create a named submatch by using **(?&lt;_name_&gt;**...**)** in the regular expression. If a named submatch has the same name as one of the predefined columns, the submatch takes precedence, and a warning is generated. Rename the submatch to avoid this warning.                                                                                                                                         |
| **FullMatch**                                | Text                                           | All of the text string that was matched.                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **StartMatch**                               | Number                                         | The starting position of the match within the input text string. The first character of the string returns 1.                                                                                                                                                                                                                                                                                                                                                             |
| **SubMatches**, only if **MatchOptions.NumberedSubMatches** is used.                               | Single-column table of Text (column **Value**) | The table of numbered submatches in the order in which they appear in the regular expression. Generally, named submatches are easier to work with and are encouraged. Use the [**ForAll**](function-forall.md) function or [**Index**](function-first-last.md) function to work with an individual sub-match. If no submatches are defined in the regular expression, this table will be present but empty. |

These functions support [**MatchOptions**](#match-options). By default:

- These functions perform a case-sensitive match. Use **MatchOptions.IgnoreCase** to perform case-insensitive matches.
- **IsMatch** matches the entire text string (**Complete** MatchOption), while **Match** and **MatchAll** search for a match anywhere in the text string (**Contains** MatchOption). Use **Complete**, **Contains**, **BeginsWith**, or **EndsWith** as appropriate for your scenario.

**IsMatch** returns _true_ if the text string matches the pattern or _false_ if it doesn't. **Match** returns _blank_ if no match is found that can be tested with the [**IsBlank**](function-isblank-isempty.md) function. **MatchAll** returns an empty table if no match is found that can be tested with the [**IsEmpty**](function-isblank-isempty.md) function.

If you use **MatchAll** to split a text string, consider using the **[Split](function-split.md)** function, which is simpler and faster.

## Patterns

The key to using these functions is in describing the pattern to match. You describe the pattern in a text string as a combination of:

- Ordinary characters, such as **"abc"** or **"123"**.
- Predefined patterns, such as **Letter**, **MultipleDigits**, or **Email**. (The **Match** enum defines these patterns.)
- Regular-expression codes, such as **"\d+\s+\d+"** or **"[a-z]+"**.

Combine these elements using the [string-concatenation operator **&**](operators.md). For example, **"abc" & Digit & "\s+"** is a valid pattern that matches the characters "a", "b", and "c", followed by a digit from 0 to 9, followed by at least one whitespace character.

### Ordinary characters

The simplest pattern is a sequence of ordinary characters that match exactly.

For example, when used with the **IsMatch** function, the string "Hello" matches the pattern **"Hello"** exactly. No more and no less. The string `"hello!"` doesn't match the pattern because of the exclamation point on the end and because the case is wrong for the letter "h". (See [Match options](#match-options) for ways to modify this behavior.)

In the pattern language, the characters `. ? * + ( ) [ ] ^ $ | \` are reserved for special purposes. To use these characters, either prefix the character with a **\\** (backslash) to indicate that the character should be taken literally, or use one of the predefined patterns. For example, you can match the string `"Hello?"` by using the pattern `"Hello\\?"` with a backslash before the question mark.

### Predefined patterns

Predefined patterns provide a simple way to match either one of a set of characters or a sequence of multiple characters. Use the [string-concatenation operator **&**](operators.md) to combine your own text strings with members of the **Match** enum:

| Match enum            | Description                                                                                              | Regular expression    |
| --------------------- | -------------------------------------------------------------------------------------------------------- | --------------------- |
| **Any**               | Matches any character.                                                                                   | `.`                   |
| **Comma**             | Matches a comma `,`.                                                                                         | `,`                   |
| **Digit**             | Matches a single digit ("0" through "9").                                                                | `\d`                  |
| **Email**             | Matches an email address that contains an "at" symbol ("\@") and a domain name that contains a dot (".") | *See note* |
| **Hyphen**            | Matches a hyphen.                                                                                        | `-` *See note*               |
| **LeftParen**         | Matches a left parenthesis `(`.                                                                          | `\(`                  |
| **Letter**            | Matches a letter.                                                                                        | `\p{L}`               |
| **MultipleDigits**    | Matches one or more digits.                                                                              | `\d+`                 |
| **MultipleLetters**   | Matches one or more letters.                                                                             | `\p{L}+`              |
| **MultipleNonSpaces** | Matches one or more characters that don't add whitespace (not space, tab, or newline).                          | `\S+`                 |
| **MultipleSpaces**    | Matches one or more characters that add whitespace (space, tab, or newline).                             | `\s+`                 |
| **NonSpace**          | Matches a single character that doesn't add whitespace.                                                  | `\S`                  |
| **OptionalDigits**    | Matches zero, one, or more digits.                                                                       | `\d*`                 |
| **OptionalLetters**   | Matches zero, one, or more letters.                                                                      | `\p{L}*`              |
| **OptionalNonSpaces** | Matches zero, one, or more characters that don't add whitespace.                                         | `\S*`                 |
| **OptionalSpaces**    | Matches zero, one, or more characters that add whitespace.                                               | `\s*`                 |
| **Period**            | Matches a period or dot `.`.                                                                           | `\.`                  |
| **RightParen**        | Matches a right parenthesis `)`.                                                                         | `\)`                  |
| **Space**             | Matches a character that adds whitespace.                                                                | `\s`                  |
| **Tab**               | Matches a tab character.                                                                                 | `\t`                  |

For example, the pattern **"A" & MultipleDigits** matches the letter "A" followed by one or more digits.

Power Apps uses a different definition for **Match.EMail** and **Match.Hyphen**. Evaluate `Text( Match.Email )` to see the regular expression used by your host.

### Regular expressions

The pattern they these functions use is called a [regular expression](https://en.wikipedia.org/wiki/Regular_expression). Power Fx's specific dialect of regular expressions is detailed in [Regular expressions in Power Fx](../regular-expressions.md).

Regular expressions are powerful and serve a wide variety of purposes. They can also look like a random sequence of punctuation marks. This article doesn't describe all aspects of regular expressions, but a wealth of information, tutorials, and tools are available online.

Regular expressions have a long history and are available in many programming languages. Every programming language has its own dialect of regular expressions, and there are few standards. We strive to ensure the same regular expression gives the same result across all Power Fx implementations. Compatibility isn't easy to accomplish as Power Fx runs on top of JavaScript and .NET which have significant differences. To accommodate running on different platforms, Power Fx regular expressions are limited to a subset of features that are widely supported across the industry.

As a result, some regular expressions that may work in other environments may be blocked or require a tweak in Power Fx. Authoring time errors are reported as unsupported features are encountered. This is one of the reasons that the regular expression and options must be an authoring time constant and not dynamic (for example, provided in a variable).

> [!NOTE]
> Power Apps uses an earlier version of Power Fx regular expressions that has fewer limitations but also fewer features. **MatchOptions.DotAll** and **MatchOptions.FreeSpacing** aren't available and the definitions of **Match.Email** and **Match.Hyphen** are different. Unicode surrogate pairs aren't treated as a single character. **MatchOptions.NumberedSubMatches** is the default. The version of regular expressions described here will be available in Power Apps soon, under a "Power Fx V1.0 compatibility" switch.

Here are some basic elements of regular expressions that build up complexity in parsing a number.

| Feature | Example | Description |
|---------|---------|-------------|
| Predfined character class | `\d` | This regular expression matches a single number, such as `1`. A character class matches a set of characters and `\d` matches the standard digits `0` to `9` and also digits defined in the Unicode character category "Nd". There are character classes for letters and numbers with `\w` and spaces including newlines with `\s`. There are also inverse character classes that are capitalized: `\D` matches everything that `\d` does not. |
| One or More | `\d+` | This regular expression matches one or more numbers, such as `123`. A `+` after an element says "one or more" of the last element. |
| Zero or One | `\+?\d` | This regular expression matches an optional `+` sign followed by one ore more numbers, such as `+123` as well as just `123`. A `?` after an element says "this is optional, it can occur zero or one time". The `+` has a backslash before it to distinguish it as a literal character rather than the "one or more" usage. |
| Grouping and alternation | `(-|\+)?\d+` | This regular expression matches either an `+` sign or a `-`, optionally, and then a series of numbers, such as `-123`, `+123`, and `123`. We are introducing two concepts here that are often used together. First, we have the parenthesis that group as set of elements together, for the `?` to act upon. Second, we have `|` which says "either this or that".  |
| Custom character class | `(-|\+)?\d+[eE][\-\+]?\d+` | This regular expression adds an exponent to the mix with two character classes, matching `+123e-12`. A character class is like `|` alternation providing a "match one of these things" in a more compact form. As with the `+`, `-` has special meaning in regular expression character classes so we need to escape it. |
| Zero or More  | `(-|\+)?\d+\.?\d*[eE][\-\+]?\d+` | This regular expression adds the decimal after the integer portion of the number, such as `-123.456e-89` or `-123.E+32`. The `\d` after the decimal point has a `*` quantifier that says "zero or more times" for decimal digits after the `.` |
| Capture groups  | `(?&lt;number&gt;(-|\+)?\d+\.?\d*)[eE](?&lt;exponent&gt;[\-\+]?\d+)` | Finally, we add capture groups for `number` and `exponent`. Not only can a regular expression match the entire string, it can also extract portions for use in your formulas, in this case the part before the `e` (or `E`) and the part after. |

These examples only give a small taste of what regular expressions can do. They are commonly used to validate ID numbers, email addresses, phone numbers, dates and times, and to extract information from all kinds of text files. Continue your journey by reading [Regular expressions in Power Fx](../regular-expressions.md), experiment, and use the web to learn more.

## Match options

Modify the behavior of these functions by specifying one or more options, which you combine using the string- concatenation operator (**&amp;**).

| MatchOptions enum | Description                                                                                                                | Impact on a regular expression                                                                                             |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **MatchOptions.BeginsWith**    | The pattern must match from the beginning of the text.                                                                     | Adds a **^** to the start of the regular expression.                                                                       |
| **MatchOptions.Complete**      | Default for **IsMatch** on Power Apps. The pattern matches the entire string of text, from beginning to end.                          | Adds a **^** to the start and a **$** to the end of the regular expression.                                                |
| **MatchOptions.Contains**      | Default for **Match** and **MatchAll**, and **IsMatch** outside of Power Apps. The pattern must appear somewhere in the text but doesn't need to begin or end it. | Doesn't modify the regular expression.                                                                                     |
| **MatchOptions.DotAll**      | Changes the behavior of the `.` (dot) operator to match all characters, including newline characters. Not available in Power Apps. | Doesn't modify the regular expression. This option is the equivalent of the standard "s" modifier for regular expressions.                                                                        |
| **MatchOptions.EndsWith**      | The pattern must match the end of the string of text.                                                                      | Adds a **$** to the end of the regular expression.                                                                         |
| **MatchOptions.FreeSpacing**    | Whitespace characters, including newlines, are ignored in the regular expression. End-of-line comments beginning with a `#` are ignored. Not available in Power Apps. | Only changes how the regular expression syntax. This option is the equivalent of the standard "x" modifier for regular expressions. |
| **MatchOptions.IgnoreCase**    | Treats uppercase and lowercase letters as identical. By default, matching is case sensitive.                               | Doesn't modify the regular expression. This option is the equivalent of the standard "i" modifier for regular expressions. |
| **MatchOptions.Multiline**     | Changes the behavior of `^` and `$` to match at the end of aline.                                                                                             | Doesn't modify the regular expression. This option is the equivalent of the standard "m" modifier for regular expressions. |
| **MatchOptions.NumberedSubMatches**     | Named captures are preferred because they are easier to understand and maintain. Performance also improves as unneeded captures aren't retained.  But for older regular expressions, treats each set of parenthesis as a numbered capture that is included with the **SubMatches** table in the result. Default in Power Apps. | Doesn't modify the regular expression. Named captures are disabled and `\1` style back references are enabled. |

Using **MatchAll** is the same as using the standard "g" modifier for regular expressions.

## Syntax

**IsMatch**( _Text_, _Pattern_ [, *Options* ] )

- _Text_ – Required. The text string to test.
- _Pattern_ – Required. The pattern to test as a text string. Concatenate predefined patterns that the **Match** enum defines or provide a regular expression. _Pattern_ must be a constant formula without variables, data sources, or other dynamic references that change as the app runs. Note, that the formula must be expressed as "Match.PredefinedPattern" e.g. Match.Email
- _Options_ – Optional. A text-string combination of **MatchOptions** enum values. By default, **MatchOptions.Complete** is used. _Options_ must be a constant formula without variables, data sources, or other dynamic references that change as the app runs.

**Match**( _Text_, _Pattern_ [, *Options* ] )

- _Text_ – Required. The text string to match.
- _Pattern_ – Required. The pattern to match as a text string. Concatenate predefined patterns that the **Match** enum defines, or provide a regular expression. _Pattern_ must be a constant formula without any variables, data sources, or other dynamic references that change as the app runs.
- _Options_ – Optional. A text-string combination of **MatchOptions** enum values. By default, **MatchOptions.Contains** is used. _Options_ must be a constant formula without any variables, data sources, or other dynamic references that change as the app runs.

**MatchAll**( _Text_, _Pattern_ [, *Options* ] )

- _Text_ – Required. The text string to match.
- _Pattern_ – Required. The pattern to match as a text string. Concatenate predefined patterns that the **Match** enum defines or provide a regular expression. _Pattern_ must be a constant formula without variables, data sources, or other dynamic references that change as the app runs.
- _Options_ – Optional. A text-string combination of **MatchOptions** enum values. By default, **MatchOptions.Contains** is used. _Options_ must be a constant formula without variables, data sources, or other dynamic references that change as the app runs.

## IsMatch examples

### Ordinary characters

Imagine your app has a **Text input** control named **TextInput1**. Users enter values into this control to store them in a database.

Users type **Hello world** into **TextInput1**.

| Formula                                                      | Description                                                                  | Result    |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------- | --------- |
| `IsMatch( TextInput1.Text, "Hello world" )`                  | Tests whether the user's input matches, exactly, the string "Hello world".   | **true**  |
| `IsMatch( TextInput1.Text, "Good bye" )`                     | Tests whether the user's input matches, exactly, the string "Good bye".      | **false** |
| `IsMatch( TextInput1.Text, "hello", Contains )`              | Tests whether the user's input contains the word "hello" (case sensitive).   | **false** |
| `IsMatch( TextInput1.Text, "hello", Contains & IgnoreCase )` | Tests whether the user's input contains the word "hello" (case insensitive). | **true**  |

### Predefined patterns

| Formula                                                                                                             | Description                                                                                                                                        | Result    |
| ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `IsMatch( "123-45-7890", Match.Digit & Match.Digit & Match.Digit & Match.Digit & Match.Digit & Match.Digit & Match.Digit & Match.Digit & Match.Digit & Match.Digit & Match.Digit )` | Matches a United States Social Security Number                                                                                                     | **true**  |
| `IsMatch( "joan@contoso.com", Match.Email )`                                                                              | Matches an email address                                                                                                                           | **true**  |
| `IsMatch( "123.456", Match.MultipleDigits & Match.Period & Match.OptionalDigits )`                                                    | Matches a sequence of digits, a period, and then zero or more digits.                                                                              | **true**  |
| `IsMatch( "123", Match.MultipleDigits & Match.Period & Match.OptionalDigits )`                                                        | Matches a sequence of digits, a period, and then zero or more digits. A period doesn't appear in the text to match, so this pattern isn't matched. | **false** |

### Regular expressions

| Formula                                                                               | Description                                                                                                                                                                                                                                                                            | Result    |
| ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `IsMatch( "986", "\d+" )`                                                             | Matches an integer greater than zero.                                                                                                                                                                                                                                                  | **true**  |
| `IsMatch( "1.02", "\d+(\.\d\d)?" )`                                                   | Matches a positive currency amount. If the input contains a decimal point, the input must also contain two numeric characters after the decimal point. For example, 3.00 is valid, but 3.1 isn't.                                                                                      | **true**  |
| `IsMatch( "-4.95", "(-)?\d+(\.\d\d)?" )`                                              | Matches a positive or negative currency amount. If the input contains a decimal point, the input must also contain two numeric characters after the decimal point.                                                                                                                     | **true**  |
| `IsMatch( "111-11-1111", "\d{3}-\d{2}-\d{4}" )`                                       | Matches a United States Social Security number. Validates the format, type, and length of the supplied input field. The string to match must consist of three numeric characters followed by a dash, then two numeric characters followed by a dash, and then four numeric characters. | **true**  |
| `IsMatch( "111-111-111", "\d{3}-\d{2}-\d{4}" )`                                       | Same as the previous example, but one of the hyphens is out of place in the input.                                                                                                                                                                                                     | **false** |
| `IsMatch( "AStrongPasswordNot", "(?!^[0-9]\*$)(?!^[a-zA-Z]\*$)([a-zA-Z0-9]{8,10})" )` | Validates a strong password that must contain eight, nine, or 10 characters, at least one digit, and at least one alphabetic character. The string can't contain special characters.                                                                                | **false** |

## Match and MatchAll examples

| Formula                                                                                 | Description                                                                                                                                                                                                                                                                                                                                       | Result                                                                                                                                                                       |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Match( "Bob Jones <bob.jones@contoso.com>", "<(?<email>" & Match.Email & ")>")`         | Extracts only the email portion of the contact information.                                                                                                                                                                                                                                                                                       | {<br>email:&nbsp;"bob.jones@contoso.com",<br>FullMatch:&nbsp;"&lt;bob.jones@contoso.com>",<br>StartMatch: 11<br>} |
| `Match( "Bob Jones <InvalidEmailAddress>", "<(?<email>" & Match.Email & ")>"`           | Extracts only the email portion of the contact information. No legal address is found (there is no @ sign), so the function returns _blank_.                                                                                                                                                                                                      | _blank_                                                                                                                                                                      |
| `Match( Language(), "(<language>\w{2})(?:-(?<script>\w{4}))?(?:-(?<region>\w{2}))?" )`  | Extracts the language, script, and region portions of the language tag that the **[Language](function-language.md)** function returns. These results reflect the United States; see the [**Language** function documentation](function-language.md) for more examples. The **(?:** operator groups characters without creating another sub-match. | {<br>language: "en",<br>script: _blank_, <br>region: "US",<br>FullMatch: "en-US", <br>StartMatch: 1<br>}                                 |
| `Match( "PT2H1M39S", "PT(?:(?<hours>\d+)H)?(?:(?<minutes>\d+)M)?(?:(?<seconds>\d+)S)?" )` | Extracts the hours, minutes, and seconds from an ISO 8601 duration value. The extracted numbers are still in a text string; use the [**Value**](function-value.md) function to convert it to a number before mathematical operations are performed on it.                                                                                         | {<br> hours: "2",<br>minutes: "1",<br>seconds: "39",<br>FullMatch: "PT2H1M39S",<br>StartMatch: 1<br>}            |

Let's drill into that last example. If you wanted to convert this string to a date/time value using the **[Time](function-date-time.md)** function, you must pass in the named submatches individually. To do this, use the **[With](function-with.md)** function operating on the record that **Match** returns:

```power-fx
With(
    Match( "PT2H1M39S", "PT(?:(?<hours>\d+)H)?(?:(?<minutes>\d+)M)?(?:(?<seconds>\d+)S)?" ),
   Time( Value( hours ), Value( minutes ), Value( seconds ) )
)
```

For these examples, add a [Button](/power-apps/maker/canvas-apps/controls/control-button) control, set its **OnSelect** property to this formula, and then select the button:

```power-fx
Set( pangram, "The quick brown fox jumps over the lazy dog." )
```

| Formula                                                            | Description                                                                                                                                                                                                                                                                   | Result                                                                                                                                                                                                |
| ------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Match( pangram, "THE", IgnoreCase )`                              | Find all matches of "THE" in the text string that the **pangram** variable contains. The string contains two matches, but only the first is returned because you're using **Match** and not **MatchAll**. | {<br>FullMatch: "The",<br>StartMatch: 32<br>}                                                                                                                                |
| `MatchAll( pangram, "the" )`                                       | Find all matches of "the" in the text string that the **pangram** variable contains. The test is case sensitive, so only the second instance of "the" is found.                                          | ![MatchAll for pangram.](media/function-ismatch/pangram-the-one.png)                                                                                                                                  |
| `MatchAll( pangram, "the", IgnoreCase )`                           | Find all matches of "the" in the text string that the **pangram** variable contains. In this case, the test is case insensitive, so both instances of the word are found.                                  | ![MatchAll with IgnoreCase.](media/function-ismatch/pangram-the-two.png)                                                                                                                              |
| `MatchAll( pangram, "\b\wo\w\b" )`                                 | Finds all three-letter words with an "o" in the middle. "brown" is excluded because it's not a three-letter word and, therefore, fails to match "\b" (word boundary).                                                                                               | ![MatchAll for pangram with b, wo, w and b.](media/function-ismatch/pangram-fox-dog.png)                                                                                                              |
| `Match( pangram, "\b\wo\w\b\s\*(?<between>\w.+\w)\s\*\b\wo\w\b" )` | Matches all the characters between "fox" and "dog".                                                                                                                                                                                                                           | {<br>between:&nbsp;"jumps&nbsp;over&nbsp;the&nbsp;lazy",<br>FullMatch:&nbsp;"fox&nbsp;jumps&nbsp;over&nbsp;the&nbsp;lazy&nbsp;dog",<br>StartMatch: 17<br> } |

To see the results of **MatchAll** in a gallery:

1. In an empty screen, insert a blank vertical **[gallery](/power-apps/maker/canvas-apps/controls/control-gallery)** control.

2. Set the gallery's **Items** property to **MatchAll( pangram, "\w+" )** or **MatchAll( pangram, MultipleLetters )**.

   ![Items gallery.](media/function-ismatch/pangram-gallery1.png)

3. Select "Add an item from the Insert tab" in the middle of the gallery control to select the template of the gallery.

4. Add a **[Label](/power-apps/maker/canvas-apps/controls/control-text-box)** control to the gallery's template.

5. Set the label's **Text** property to **ThisItem.FullMatch**.

   The gallery is filled with each word in our example text. To see all the words on one screen, resize the gallery's template and the label control.

   ![Text property.](media/function-ismatch/pangram-gallery2.png)



[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































