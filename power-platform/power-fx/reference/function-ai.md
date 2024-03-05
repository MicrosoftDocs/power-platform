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

# AI functions - AIClassify, AIExtract, AIReply, AISentiment, AISummarize, and AITranslate

Applies to: :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Dataverse formula columns :::image type="icon" source="media/yes-icon.svg" border="false"::: Desktop flows 


## Description

Dataverse provides variety a of ready-to-use AI functions that are preconfigured and don't require any data collection, building, or training. You can use these prebuilt AI functions in your app and workflows to improve functionality and streamline processes. The AI functions work with canvas apps, AI Builder, Power Automate, and low-code plugins so can easily integrate them into your solutions.

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

## Syntax

**AIClassify input**

**AIClassify**(_Text_, _Categories_)

- _Text_ - Required. A text sentences. The text to classify.
- _Categories_ - Required. Table of categories.

**AIClassify output**

(_Classification_)

- _Classification_ - Name of selected category.

**AIExtract input**

**AIExtract**(_Text_,_Entity_)

- _Text_ - Required. A text sentences. The text from which to extract data.
-  _Entity_ - Required. The entity to extract. The name of entity to extract.

**AIExtract Output**

(_ExtractedData_)

- _ExtractedData_ - Table of zero or more rows of data matching the provided entity. The extracted data that matched the type of entity provided.

**AIReply input**

**AIReply**(_Text_)

- _Text_ - Required. A text sentence. The text to respond.

**AIReply output**

(_PreparedResponse_)

- _PreparedResponse_ - A text sentence. The draft message in response to the provided input text.

**AISentiment input**

**AISentiment**(_Text_)

- _Text_ - Required. A text sentence. The text to analyze.

**AISentiment output**

(_AnalyzedSentiment_)

- _AnalyzedSentiment_ - Positive, neutral, or negatived. The overall sentiment of the analyzed text. 

**AISummarize input**

**AISummarize**(_Text_)

- _Text_ - Required. A text sentence. The text to summarize.

**AISummarize output**

(_SummarizedText_)

- _SummarizedText_ - Required. A text sentence. The summarized version of the input text

**AITranslate input**

**AITranslate**(_Text_,_TargetLanguage_)

- _Text_ - Required. A text sentence. The text to translate.
- _TargetLanguage_ - The language code to which you want to translate, such as **en** for English.
**AITranslate output**

(_TranslatedText_)

- _TranslatedText_ - The translated text.


## Examples


**AIClassify**: ```Environment.AIClassify({Text:"Insert text here", Categories:\["Category1", "Category2"\]}).Classification```

**AIExtract**: ```Environment.AIExtract({Text:"Insert text here", Entity:"Insert entity here"}).ExtractedData```

**AIReply**: ```Environment.AIReply({Text:"Insert text here"}).PreparedResponse```

**AISummarize**: ```Environment.AISummarize({Text:"Insert text here"}).SummarizedText```

**AISentiment**: ```Environment.AISentiment({Text:"Insert text here"}).AnalyzedSentiment```

