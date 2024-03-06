---
title: AI functions in Power Apps
description: Reference information including syntax and examples for the AISummarize, AISentiment, AIReply, AITranslate, AIClassify, and AIExtract functions.
author: paulliew
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/1/2024
ms.subservice: power-fx
ms.author: paulliew
search.audienceType:
  - maker
contributors:
  - paulliew
  - mduelae
---

# AIClassify, AIExtract, AIReply, AISentiment, AISummarize, and AITranslate

Applies to: :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps 

## Description

Dataverse provides a variety of ready-to-use AI functions that are preconfigured and don't require any data collection, building, or training. You can use these prebuilt AI functions in your app and workflows to improve functionality and streamline processes. The AI functions work with Canvas apps, AI Builder, and low-code plugins so can easily integrate them into your solutions.

- **AIClassify** classifies text into one or more from the provided category. For example, the following list of categories can be used to classify issues submitted by your customers:

    - Problem
    - Billing
    - How To
    - Licensing

- **AIExtract** extracts specified entities such as registration numbers, phone numbers, or names of people.
- **AIReply** drafts a reply to the message that you provide. For example, this function drafts a reply to a customer's review of a product.
- **AISentiment** detects the sentiment of the text that you provide. For example, this function detects whether the sentiment of a customer review is positive, negative, or neutral.
- **AISummarize** summarizes the text that you provide. For example, this function summarizes an email message or text from a document.
- **AITranslate** translates text from another language. For example, this function translates a customer email or product review. The source language doesn't need to be specified, and is automatically detected.

    For more information about languages supported for the source and target language, see [Translator language support—Translation](/azure/ai-services/translator/language-support) and review the list of supported languages under the **Auto Language Detection** column. 

Learn more about how to use AI functions in the following video.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RW1iGPI]

## Use in Canvas apps

You can call these functions from canvas apps. However, it is a little more complicated than described for other Power Fx hosts:
1. You will need to add the **Environment** data source.
1. The functions will be methods in the **Environment** namespace.  Where this documentation will describe calling **AISummarize( ... )**, you will need to use **Environment.AISummarize( ... )**.
1. Arguments to the function must be named columns in a record, passed as the only argument.  The names of the columns are given in the Syntax section matching the names of the parameters.
1. The return value from the function will always be a record, even if it only contains one column.  The name of the column is listed in the Syntax section.
1. These functions are behavior functions and cannot be used in Canvas data flow, for example as the input to the **Text** property of a **Text** control.  Use a **Set** function to place the result in a global variable, and then use that value elsewhere in your app.

Here's an example:

1. Open a canvas app for editing in [Power Apps Studio](/power-apps/maker/canvas-apps/power-apps-studio).
1. From the Data pane, select **Add data** and then add the **Enviroment** data source.
1. From the Insert pane, add a **Button** control.
1. In the formula bar, select the **OnSelect** property and enter the following formula:
   ```powerapps-dot
   Set( Summary, Environment.AISummarize( {Text: "2, 4, 6, 8, 10, 12, 14, 16, 18, 20"} ).SummarizedText )
   ```
1. From the Insert pane, add a **Text** control.
1. In the formula bar, select the **Text** property and enter the following formula:
   ```powerapps-dot
   Summary
   ```
1. The text box will display an AI generated summary similar to:
   ```
   The given text is a sequence of even numbers from 2 to 20, increasing by 2 each time.
   ```

> [!NOTE]
> In time we will add the same function signatures that other Power Fx hosts enjoy to Canvas. Even when added, it will augment and not replace the current mechanism; apps using the current mechanism will continue to work without modification.

## Syntax

**AIClassify**( _Text_, _Categories_ )
- _Text_ - Required. A text sentences. The text to classify.
- _Categories_ - Required. Table of categories.
- For Canvas apps, the return value is in the _Classification_ column.

**AIExtract**( _Text_, _Entity_ )
- _Text_ - Required. A text sentences. The text from which to extract the data.
- _Entity_ - Required. The entity to extract. The name of entity to extract.<br>
- For Canvas apps, the return value is in the _ExtractedData_ column, a table of zero or more rows of data matching the provided entity.

**AIReply**( _Text_ )
- _Text_ - Required. A text sentence. The text to respond to.<br>
- For Canvas apps, the return value is in the _PreparedResponse_ column. 

**AISentiment**( _Text_ )
- _Text_ - Required. The text to analyze for sentiment.<br>
- For Canvas apps, the return value is in the _AnalyzedSentiment_ column and is "Positive", "Neutral", or "Negative". 

**AISummarize**( _Text_ )
- _Text_ - Required. The text to summarize.<br>
- For Canvas apps, the return value is in the _SummarizedText_ column.

**AITranslate**(_Text_, _TargetLanguage_)
- _Text_ - Required. The text to translate.<br>
- _TargetLanguage_ - The language code to which you want to translate, such as "en" for English.  See the [**Language** function](./function-language.md) for more details.<br>
- For Canvas apps, the return value is in the _TranslatedText_ column.

## Examples

### AIClassify

```powerapps-dot
AIClassify( "Insert text here", ["Category1", "Category2"] )
```

Canavs apps:
```powerapps-dot
Environment.AIClassify( {Text:"Insert text here", Categories:["Category1", "Category2"]} ).Classification
```

### AIExtract

```powerapps-dot
AIExtract( "Insert text here", ... )
```

Canavs apps:
```powerapps-dot
Environment.AIExtract({Text:"Insert text here", Entity:"Insert entity here"}).ExtractedData
```

### AIReply

```powerapps-dot
Environment.AIReply({Text:"Insert text here"}).PreparedResponse
```

### AISummarize

```powerapps-dot
Environment.AISummarize({Text:"Insert text here"}).SummarizedText
```

### AISentiment
```powerapps-dot
Environment.AISentiment({Text:"Insert text here"}).AnalyzedSentiment
```

### AITranslate
```powerapps-dot
Environment.AITranslate({Text:TextInput1.Text}).TranslatedText
```
