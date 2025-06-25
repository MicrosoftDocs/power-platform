---
title: AIClassify, AIExtract, AIReply,AISummarize, AISentiment, and AITranslate functions
description: Reference information including syntax and examples for the AIClassify, AIExtract, AIReply,AISummarize, AISentiment, and AITranslate functions.
author: paulliew
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/20/2025
ms.subservice: power-fx
ms.author: paulliew
search.audienceType:
  - maker
contributors:
  - paulliew
  - mduelae
---

# AIClassify, AIExtract, AIReply, AISentiment, AISummarize, AISummarizeRecord, and AITranslate
[!INCLUDE[function-ai-applies-to](includes/function-ai-applies-to.md)]



## Description

Dataverse provides a variety of ready-to-use AI functions that are preconfigured and don't require any data collection, building, or training. You can use these prebuilt AI functions in your app and workflows to improve functionality and streamline processes. The AI functions work with canvas apps, AI Builder, and low-code plugins so can easily integrate them into your solutions.

- **AIClassify** classifies text into one of the provided categories. For example, the following list of categories can be used to classify issues submitted by your customers:

    - Problem
    - Billing
    - How To
    - Licensing

- **AIExtract** extracts specified entities such as registration numbers, phone numbers, or names of people.
  > [!NOTE]
  > The AIExtract function is still in development and might not operate properly. We will remove this note when it is ready to use.
- **AIReply** drafts a reply to the message that you provide. For example, this function drafts a reply to a customer's review of a product.
- **AISentiment** detects the sentiment of the text that you provide. For example, this function detects whether the sentiment of a customer review is positive, negative, or neutral.
- **AISummarize** summarizes the text that you provide. For example, this function summarizes an email message or text from a document.
- - **AISummarizeRecord** summarizes the information in a record. For example, this function summarizes a customer's information based on a record in the Customers table.
- **AITranslate** translates text from another language. For example, this function translates a customer email or product review. The source language doesn't need to be specified, and is automatically detected.

    For more information about languages supported for the source and target language, see [Translator language support—Translation](/azure/ai-services/translator/language-support) and review the list of supported languages under the **Auto Language Detection** column. 

Learn more about how to use AI functions in the following video.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=f8308ee0-9bf6-45a4-a940-e0b49a41354f]

## Prerequisites
For more information on prerequisites, see [Requirements and licensing for prebuilt prompts](/ai-builder/prebuilt-prompts#prerequisites).

## Use in canvas apps

You can call these functions from canvas apps. However, it's a little more complicated than described for other Power Fx hosts:
1. You need to add the **Environment** data source.
1. The AI functions are functions in the **Environment** namespace. Where this documentation describes calling **AISummarize( ... )**, for example, you need to use **Environment.AISummarize( ... )**.
1. Arguments to the function must be named columns in a record, passed as the only argument. The names of the columns are given in the **Syntax** section matching the names of the parameters.
1. The return value from these functions is always a record containing one column. The name of the column is listed in the *Syntax* section.
1. These functions are [behavior functions](/power-apps/maker/canvas-apps/working-with-formulas-in-depth) and cannot be used in Canvas data flow, for example as the input to the **Text** property of a **Text** control. Use the [**Set**](function-set.md) function to place the result in a global variable, and then use that value elsewhere in your app.

Here's an example:

1. Open a canvas app for editing in [Power Apps Studio](/power-apps/maker/canvas-apps/power-apps-studio).
1. From the Data pane, select **Add data** and then add the **Environment** data source.
1. From the Insert pane, add a **Button** control.
1. In the formula bar, select the **OnSelect** property and enter the following formula:
   ```power-fx
   Set( Summary, Environment.AISummarize( {Text: "2, 4, 6, 8, 10, 12, 14, 16"} ).SummarizedText )
   ```
1. From the Insert pane, add a **Text** control.
1. In the formula bar, select the **Text** property and enter the following formula:
   ```power-fx
   Summary
   ```
1. The text box displays an AI generated summary similar to:
   ```
   The given text is a sequence of even numbers from 2 to 16, increasing by 2 each time.
   ```

> [!NOTE]
> We are in the process of adding the same function signatures that other Power Fx hosts enjoy to canvas. The new signatures will augment and not replace the current mechanism; apps using the current mechanism will continue to work without modification.

## Syntax

**AIClassify**( _Text_, _Categories_ )
- _Text_ - Required. A text sentences. The text to classify.
- _Categories_ - Required. Single column of table of text categories.
- For canvas apps, the return value is in the _Classification_ column.

**AIExtract**( _Text_, _Entity_ )
- _Text_ - Required. A text sentences. The text to extract the data from.
- _Entity_ - Required. The entity to extract. The name of entity to extract.
- For canvas apps, the return value is in the _ExtractedData_ column, a table of zero or more rows of data matching the provided entity.

**AIReply**( _Text_ )
- _Text_ - Required. A text sentence. The text to respond to.
- For canvas apps, the return value is in the _PreparedResponse_ column. 

**AISentiment**( _Text_ )
- _Text_ - Required. The text to analyze for sentiment.
- For canvas apps, the return value is in the _AnalyzedSentiment_ column and is "Positive", "Neutral", or "Negative". 

**AISummarize**( _Text_ )
- _Text_ - Required. The text to summarize.
- For canvas apps, the return value is in the _SummarizedText_ column.

**AISummarizeRecord**( _Entity_ )
- _Entity_ - Required. The Dataverse record to summarize.
- For canvas apps, the return value is in the _SummarizedText_ column.

**AITranslate**(_Text_, _TargetLanguage_)
- _Text_ - Required. The text to translate.
- _TargetLanguage_ - The language tag to translate into such as "fr" for French.  See the [**Language** function](./function-language.md) for more details.
- For canvas apps, the return value is in the _TranslatedText_ column.

## Examples

To setup the following examples:
1. In the Tree view, select the **App** object and add the following to the **Formulas** property:
   ```power-fx
   Subject = "Washington is a state that offers a variety of food experiences for locals and visitors alike. 
   Whether you are looking for fresh seafood, farm-to-table produce, ethnic specialties, or gourmet treats, 
   you will find something to satisfy your taste buds in Washington. Washington is famous for its seafood, 
   especially salmon, oysters, crab, and clams. The state has a long coastline and numerous rivers and lakes 
   that provide abundant and high-quality seafood.";
   ```
1. Create a **Button** control.
1. Create a **Text** control and set its **Text** property to:
   ```power-fx
   Result
   ```

### AIClassify

1. In Canvas apps, set the **OnSelect** property of the **Button** control to:
   ```power-fx
   Set( Result, Environment.AIClassify( {Text:Subject, Categories: ["Housing", "Food"]} ).Classification )
   ```
   For all other products, use this formula:
   ```power-fx
   Set( Result, AIClassify( Subject, ["Housing", "Food"] ) )
   ```
1. Press the button. The **Text** control displays the result:
   ```
   Food
   ```

### AIExtract

1. In canvas apps, set the **OnSelect** property of the **Button** control to:
   ```power-fx
   Set( Result, Environment.AIExtract( {Text:Subject, Entity: "State"} ).ExtractedText )
   ```
   For all other products, use this formula:
   ```power-fx
   Set( Result, AIExtract( Subject, "State" ) )
   ```
1. Press the button. The **Text** control displays the result.

### AIReply

1. In canvas apps, set the **OnSelect** property of the **Button** control to:
   ```power-fx
   Set( Result, Environment.AIReply( {Text:Subject} ).PreparedResponse )
   ```
   For all other products, use this formula:
   ```power-fx
   Set( Result, AIReply( Subject ) )
   ```
1. Press the button. The **Text** control displays a result similar to:
   ```
   Washington state is indeed a culinary delight, offering a diverse range of food experiences
   for both residents and tourists. From fresh seafood to farm-to-table produce, ethnic specialties
   to gourmet treats, there is something to please every palate in Washington. The state is
   particularly renowned for its seafood, with salmon, oysters, crab, and clams being local favorites.
   This is due to Washington's extensive coastline and numerous rivers and lakes, which provide an
   abundance of high-quality seafood. If you have any specific questions or need recommendations
   for dining in Washington, feel free to ask!
   ```

### AISummarize

1. In canvas apps, set the **OnSelect** property of the **Button** control to:
   ```power-fx
   Set( Result, Environment.AISummarize( {Text:Subject} ).SummarizedText )
   ```
   For all other products, use this formula:
   ```power-fx
   Set( Result, AISummarize( Subject ) )
   ```
1. Press the button. The **Text** control displays a result similar to:
   ```
   Washington state is known for its diverse food experiences, catering to both locals and visitors.
   From fresh seafood to farm-to-table produce, ethnic specialties, and gourmet treats, there is
   something to please everyone's taste buds. Seafood, particularly salmon, oysters, crab, and clams,
   is a highlight in Washington. With its extensive coastline, rivers, and lakes, the state offers
   an abundance of high-quality seafood options.
   ```

### AISummarizeRecord

1. In canvas apps, set the **OnSelect** property of the **Button** control to:
   ```power-fx
   Set( Result, Environment.AISummarizeRecord( First(Accounts) ).SummarizedText )
   ```
   For all other products, use this formula:
   ```power-fx
   Set( Result, AISummarizeRecord( First(Accounts) ) )
   ```
1. Press the button. The **Text** control displays a result similar to:
   ```
   The record provided was created on July 2, 2024, at 17:24:32 in the selected time zone. 
   The account number for this record is ACC0001, associated with the company
   [USMF](pagetype=entityrecord&etn=cdm_company&id=bdcdb6ff-7[204-4345](tel:2044345)-b46f-9545195385fd).
   The record was last modified on July 2, 2024, at 17:24:32 in the selected time zone.


### AISentiment

1. In canvas apps, set the **OnSelect** property of the **Button** control to:
   ```power-fx
   Set( Result, Environment.AISentiment( {Text:Subject} ).AnalyzedSentiment )
   ```
   For all other products, use this formula:
   ```power-fx
   Set( Result, AISentiment( Subject ) )
   ```
1. Press the button. The **Text** control displays the result:
   ```
   Positive
   ```

### AITranslate

1. In canvas apps, set the **OnSelect** property of the **Button** control to:
   ```power-fx
   Set( Result, Environment.AITranslate( {Text:Subject, TargetLanguage: "fr"} ).TranslatedText )
   ```
   For all other products, use this formula:
   ```power-fx
   Set( Result, AITranslate( Subject, "fr" ) )
   ```
1. Press the button. The **Text** control displays a result similar to:
   ```
   Washington est un État qui offre une variété d’expériences culinaires pour les habitants et les visiteurs. 
   Que vous soyez à la recherche de fruits de mer frais, de produits de la ferme à la table,
   de spécialités ethniques ou de friandises gastronomiques, vous trouverez de quoi satisfaire vos
   papilles à Washington. Washington est célèbre pour ses fruits de mer, en particulier le saumon, les huîtres,
   le crabe et les palourdes. L’État possède un long littoral et de nombreuses rivières et lacs 
   qui fournissent des fruits de mer abondants et de haute qualité.
   ```









































































































































