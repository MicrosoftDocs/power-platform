---
title: Regular expressions in Microsoft Power Fx | Microsoft Docs
description: Reference information about working with regular expressions in Microsoft Power Fx
author: gregli-msft
ms.topic: conceptual
ms.reviewer: jdaly
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType: 
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---
# Regular expressions

The [**IsMatch**, **Match**, and **MatchAll** functions](reference/function-ismatch.md) are used to extract and validate patterns in text. The pattern they use is a [regular expression](https://en.wikipedia.org/wiki/Regular_expression). 

Regular expressions have been around a long time, are very powerful, available in many programming languages, and used for a wide variety of purposes. They also often look like a random sequence of punctuation marks. This article doesn't describe all aspects of regular expressions, but a wealth of information, tutorials, and tools are available online.

Every programming language has its own dialect of regular expressions and there are few standards. As much as possible, we would like the same regular expression to give the same result across all Power Fx implementations. That isn't easy to accomplish as Power Fx runs on top fo JavaScript and .NET which have significant differences. To accommodate running on different platforms, Power Fx regular expressions are limited to a subset of features that are widely supported across the industry.

Power Fx will produce an authoring time error when unsupported features are encountered. This is one of the reasons that the regular expression and options must be a authoring time constant and not dynamic (for example stored in a variable).

## Supported features

Power Fx supports the following features. Notes also provide information on how Power Fx behavior may differ from other systems.

### Literal characters

| Feature | Description |
|---------|---------|
| Literal characters | Any character except `[ ] \ ^ $ . | ? * + ( )` can be inserted directly. |
| Escaped literal characters | `\` (backslash) followed by any character except a letter or underscore. Used to insert the exceptions to direct literal characters, such as `\?` to insert a question mark. | 

Escaped letters and underscore are used for character classes. Even if there is not a character class today for a given letter, by disallowing them we reserve these character classes letters for future use.

Unescaped `[`, `]`, `{`, or `}` as a literal character is disallowed, instead escape these characters with a backslash. This avoids ambiguity.


| Dot | `.`, matches everything except `[\r\n]` unless **MatchOptions.DotAll** is used. |
| Anchors | `^` and `$`, matches the beginning and end of the string, or of a line if **MatchOptions.Multiline** is used. |


### Character classes

Power Fx regular expressions support:

| Feature | Description |
|---------|---------|
| Character class | `[abc]` list of characters, `[a-fA-f0-9]` range of characters, `[^a-z]` everything but these characters. Character classes cannot be nested, subtracted, or intersected, and the same character cannot appear twice in the character class (except for a hyphen). |  
| Word characters and breaks | `\w`, `\W`, `\b`, `\B`, using the Unicode definition of letters `[\p{Ll}\p{Lu}\p{Lt}\p{Lo}\p{Nd}\p{Pc}\p{Lm}]`. |
| Digit characters | `\d` includes the digits 0-9 and `\p{Nd}`, `\D` matches everything except characters matched by `\d`. |
| Space characters | `\s` includes spacing characters `[ \r\n\t\f\x0B\x85\p{Z}]`, `\S` which matches everything except characters matched by `\s`, `\r` carriage return, `\n` newline, `\t` tab, `\f` form feed. |
| Control characters | `\cA`, where the control characters is `[A-Za-z]`. |
| Hexadecimal and Unicode character codes | `\x20` with two hexadecimal digits, `\u2028` with four hexadecimal digits. |
| Unicode character class and property | `\p{Ll}` matches all Unicode lowercase letters, while `\P{Ll}` matches everything that is not a Unicode lowercase letter. |

Power Fx treats both `\r` and `\n` as newline characters.

Octal codes for characters, such as `\044` or `\o{044}` are disallowed. Use `\x` or `\u` instead. Octal character codes can be ambiguous with numbered back references which is why Power Fx disallows them.

### Quantifiers

| Feature | Description |
|---------|---------|
| Greedy quantifiers | `?` matches 0 or 1 times, `+` matches 1 or more times, `*` matches 0 or more times, `{3}` matches exactly 3 times, `{1,}` matches at least 1 time, `{1,3}` matches between 1 and 3 times. By default, matching is "greedy" and the match will be as *large* as possible. |
| Lazy quantifiers | Same as the greedy quantifiers followed by `?`, for example `*?` or `{1,3}?`. With the lazy modifier, the match will be as *small* as possible. |
| Alternation | `a|b` matches "a" or "b". |

### Capture groups

| Feature | Description |
|---------|---------|
| Non capture group | `(?:a)`, group without capturing the result as a named or numbered sub-match. |
| Named group and back reference | `(?<name>chars)` captures a sub-match with the name `name`, referenced with `\k<name>`. Cannot be used if **MatchOptions.NumberedSubMatches** is enabled. |
| Numbered group and back reference | `(a|b)` captures a sub-match, referenced with `\1`. **MatchOptions.NumberedSubMatches** must be enabled. |

Named and numbered sub-matches cannot be used together. By default, named sub-matches are enabled and are preferred for clarity and maintainability, while standard capture groups become non capture groups with improved performance. This can be changed with **MatchOptions.NumberedSubMatches** which provides for traditional capture groups but disables named captures groups. Some implementations treat a mix of numbered and named capture groups differently, leading to ambiguity, which is why Power Fx disallows it.

### Lookahead and lookbehind

| Feature | Description |
|---------|---------|
| Lookahead and lookbehind | `(?=a)`, `(?!a)`, `(?<=b)`, `(?<!b)`. |

### Comments

| Feature | Description |
|---------|---------|
| Inline comments | `(?# comment here)`, which is ignored as a comment.  See **MatchOptions.FreeSpacing** for an alternative to formatting and commenting regular expressions. |


### Inline mode modifiers

| Feature | Description |
|---------|---------|
| Inline mode modifiers | `(?im)` is the same as using **MatchOptions.IgnoreCase** and **MatchOptions.Multiline**. Must be used at the beginning of the regular expression. Supported inline modes are `[imsx]`, corresponding to **MatchOptions.IgnoreCase**, **MatchOptions.Multiline**, **MatchOptions.DotAll**, and **MatchOptions.FreeSpacing**, respectively. |

Other regular expression systems may allow the mode to change in the middle of a regular expression or apply a mode to a subexpression.

## Mode modifiers

### DotAll

Enabled with **MatchOptions.DotAll** or `(?s)` at the start of a regular expression.

### FreeSpacing

Enabled with **MatchOptions.FreeSpacing** or `(?x)` at the start of a regular expression.

Free spacing makes it easier to read and maintain a complex regular expression. The rules are simple:
- Space characters are ignored in the regular expression, including tabs and newline characters. If matching a space is desired, use `\s`, `\ `, `\t`, `\r`, or `\n`.
- `#` begins a comment which runs until the end of the line. It and all characters that follow up to the next newline character are ignored.
- Characters classes are not included in these changes. Space characters and `#` act as they normally do. For example, `IsMatch( "a#b c", "(?x)a[ #]b[ #]c" )` returns *true*. Some regular expression languages include character classes in free spacing, or provide an option to include them, but Power Fx does not at this time.

For example, here is a complex regular expression for matching an ISO [8601 date time](https://en.wikipedia.org/wiki/ISO_8601):

```powerapps-dot
IsMatch( 
    "2025-01-17T19:38:49+0000",
    "^\d{4}-(0\d|1[012])-([012]\d|3[01])(T([01]\d|2[0123]):[0-5]\d(:[0-5]\d(\.\d{3})?)?(Z|[\-+]\d{4}))?$"
)
// returns true
```

And here is the identical regular expression with free spacing utilizing multiple lines, indentation for groups, and regular expression comments, making this version much easier to understand, validate, and debug.

```powerapps-dot
IsMatch( "2025-01-17T19:38:49+0000", 
    "(?x)                 # enables free spacing, must be very first
    ^                     # matches from beginning of text
    \d{4}                 # year (0000-9999)
    -(0\d|1[012])         # month (00-12)
    -([012]\d|3[01])      # day (00-31, range not checked against month)
    (T([01]\d|2[0123])    # optional time, starting with hours (00-23)
      :[0-5]\d            # minutes (00-59)
      (:[0-5]\d           # optional seconds (00-59)
        (\.\d{3})?        # optional milliseconds (000-999)
      )?
      (Z|[\-+]\d{4})      # time zone
    )?
    $                     # matches to end of text
    "
)
// returns true
```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]

### IgnoreCase

Enabled with **MatchOptions.IgnoreCase** or `(?i)` at the start of a regular expression.

### Multiline

Enabled with **MatchOptions.Multiline** or `(?m)` at the start of a regular expression.








![Inline table.](media/tables/inline-table.png "Inline table")

