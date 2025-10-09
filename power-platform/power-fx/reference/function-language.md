---
title: Language function
description: Reference information including syntax and examples for the Language function.
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
no-loc: ["Language"]
---

# Language function
[!INCLUDE[function-language-applies-to](includes/function-language-applies-to.md)]



Returns the language tag of the current user.

## Description

The **Language** function returns the language, script, and region of the current user as a language tag.

Use the language information to tailor your app across locales. For example, if you're creating an app that is used in Italy and France, you can use **Language** to automatically display Italian and French strings to your users in those different locations.

### Language tags

A _language tag_ can be in one of three formats:

| Return value                   | Description                                                                                                                                                                                                 |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **"_lg&#8209;RE_"**            | _lg_ is the two character abbreviation for the language and _RE_ is the two character abbreviation for the region. It's the most common return type. For example, "en-GB" is returned for United Kingdom. |
| **"_lg_"**                     | _lg_ is the two character abbreviation for the language. It's the format used when Power Apps has information about the language, but doesn't have information for the specific region.                 |
| **"_lg&#8209;scrp&#8209;RE_"** | _lg_ is the two character abbreviation for the language, _scrp_ is the four character abbreviation for the script, and _RE_ is the two character abbreviation for the region.                               |

Power Apps uses the [IETF BCP-47 language tag](https://tools.ietf.org/html/bcp47) format.

To see the list of supported language tags, type **Value("1",)** in the formula bar or advanced view and scroll through the list of locales suggested for the second argument.

The **[Text](function-text.md)** and **[Value](function-value.md)** functions also use language tags. Use these functions for translating to and from text strings in a globally aware manner. When passing a language tag to these functions and the region wouldn't make a difference, you can use just the language portion of the tag.

## Syntax

**Language**()

## Examples

### User's locale

It's assumed that the host operating system and/or browser are using the default locale for the location.

| Formula        | Location                  | Return Value                                                          |
| -------------- | ------------------------- | --------------------------------------------------------------------- |
| **Language()** | Lisbon, Portugal          | "pt-PT"                                                               |
| **Language()** | Rio de Janeiro, Brazil    | "pt-BR"                                                               |
| **Language()** | Atlanta, USA              | "en-US"                                                               |
| **Language()** | Manchester, United Kingdom (Great Britain)| "en-GB"                                                               |
| **Language()** | Paris, France             | "fr-FR"                                                               |
| **Language()** | Roseau, Dominica          | "en"                                                                  |
| **Language()** | Belgrade, Serbia          | "sr-cyrl-RS" or "sr-latn-RS," depending on the user's system settings |

### Localization table

A simple approach to localization is to create an Excel spreadsheet mapping an author defined **TextID** to a translated text for the user's language. Although you could use a collection or any other data source for this table, we chose Excel because it's easy to edit and manage outside of the app by translators.

1. Create the following table in Excel:

   ![Localization table.](media/function-language/loc-table.png)

   The entry with _blank_ for the **Language** column is used as the default if there's no specific text string found for a given language. This entry must appear after all other entries for a given **TextID**.

   For our purposes, we only need to look at the language of the locale and not the region. If regional considerations were important, we could included the full language tag value in the table above.

2. Use the **Insert** ribbon, **Table** command, to make this into a proper Excel table. By default, it's named **Table1** but you can name it whatever you like with the **Table Tools/Design** ribbon and the **Table Name:** text box on the far left hand side.
3. Save the Excel file to your local file system.
4. In Power Apps, in the right-hand pane, click, or tap the **Data Sources** tab, and then click or tap **Add data source**.
5. Click or tap **Add static data to your app**, click, or tap the Excel file that you saved, and then click or tap **Open**.
6. Select the table that you created, and then click, or tap **Connect**.

In your app, wherever you used the text **"Hello"** before, use this formula instead:

- **LookUp( Table1, TextID = "Hello" && (LanguageTag = Left( Language(), 2 ) || IsBlank( LanguageTag ))).LocalizedText**

This formula will lookup the appropriate **LocalizedText** value for the language of the user, and if that isn't found, will fall back on the default _blank_ version.

Translated strings in other languages could be longer than they're in your language. In many cases, the labels and other elements that display the strings in your user interface are needed to be wider to accommodate.

### Translation service

You can translate text on demand using a translation service, such as the Microsoft Translator service:

1. In Power Apps, in the right-hand pane, click or tap the **Data Sources** tab, and then click or tap **Add data source**.
2. Click or tap **Microsoft Translator**.

In your app, wherever you would have used the text **"Hello"** before, use this formula instead:

- **MicrosoftTranslator.Translate( "Hello", Language() )**

The Microsoft Translator service uses the same language tags that the **Language** function returns.

This approach comes with some drawbacks when compared to the previous example which utilized a pretranslated table of text strings:

- The translation takes time to complete, requiring a call to a service across the network. It results in a lag to see the translated text in your app.
- The translation is mechanical and may not be what you anticipate or be the best choice for the situation within your app.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































