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

Dataverse provides variety a of ready-to-use AI functions that are preconfigured and don't require any data collection, building, or training. You can use these prebuilt AI functions in your app and workflows to improve functionality and streamline processes. The AI functions work with canvas apps, AI Builder, Power Automate, and low-code plugins so can easily integrate them into your solutions.

Learn more about how to use AI functions in the following video.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RW1iGPI]


## AISummarize

Summarizes the text that you provide. For example, this function summarizes an email message or text from a document.

#### Input for AISummarize

| **Name** | **Required** | **Type** | **Description**   | **Values**     |
|----------|--------------|----------|-------------------|----------------|
| Text     | Yes          | string   | Text to summarize | Text sentences |

#### Output for AISummarize

| **Name**       | **Description**                      | **Values**     |
|----------------|--------------------------------------|----------------|
| SummarizedText | Summarized version of the input text | Text sentences |

## AISentiment

Detects the sentiment of the text that you provide. For example, this function detects whether the sentiment of a customer review is positive, negative, or neutral.

#### Input for AISentiment

| **Name** | **Required** | **Type** | **Description** | **Values**     |
|----------|--------------|----------|-----------------|----------------|
| Text     | Yes          | string   | Text to analyze | Text sentences |

#### Output for AISentiment

| **Name**          | **Description**                        | **Values**                     |
|-------------------|----------------------------------------|--------------------------------|
| AnalyzedSentiment | Overall sentiment of the analyzed text | Positive, neutral, or negative |

## AIReply

Drafts a reply to the message that you provide. For example, this function drafts a reply to a customer's review of a product.

#### Input for AIReply

| **Name** | **Required** | **Type** | **Description** | **Values**     |
|----------|--------------|----------|-----------------|----------------|
| Text     | Yes          | string   | Text to respond | Text sentences |

#### Output for AIReply

| **Name**         | **Description**                                        | **Values**     |
|------------------|--------------------------------------------------------|----------------|
| PreparedResponse | A draft message in response to the provided input text | Text sentences |

## AITranslate

Translates text from another language. For example, this function translates a customer email or product review. The source language doesn't need to be specified, and is automatically detected.

For more information about languages supported for the source and target language, see [Translator language support—Translation](/azure/ai-services/translator/language-support) and review the list of supported languages under the **Auto Language Detection** column.

#### Input for AITranslate

| **Name**       | **Required** | **Type** | **Description**                              | **Values**                                       |
|----------------|--------------|----------|----------------------------------------------|--------------------------------------------------|
| Text           | Yes          | string   | Text to translate                            | Text sentences                                   |
| TargetLanguage | No           | string   | Language code to which you want to translate | A valid language code such as **en** for English |

#### Output for AITranslate

| **Name**       | **Description** | **Values**     |
|----------------|-----------------|----------------|
| TranslatedText | Translated text | Text sentences |

## AIClassify

Classifies text into one or more from the provided category. For example, the following list of categories can be used to classify issues submitted by your customers:

- Problem
- Billing
- How To
- Licensing

#### Input for AIClassify

| **Name**   | **Required** | **Type**             | **Description**  | **Values**          |
|------------|--------------|----------------------|------------------|---------------------|
| Text       | Yes          | string               | Text to classify | Text sentences      |
| Categories | Yes          | table (string array) | Categories       | Table of categories |

#### Output for AIClassify

| **Name**       | **Description** | **Values**                |
|----------------|-----------------|---------------------------|
| Classification | Category        | Name of selected category |

## AIExtract

Extracts specified entities such as registration numbers, phone numbers, or names of people.

#### Input for AIExtract

| **Name** | **Required** | **Type** | **Description**                 | **Values**                |
|----------|--------------|----------|---------------------------------|---------------------------|
| Text     | Yes          | string   | Text from which to extract data | Text sentences            |
| Entity   | Yes          | string   | Entity to extract               | Name of entity to extract |

#### Output for AIExtract

| **Name**      | **Type** | **Description**                                         | **Values**                                                    |
|---------------|----------|---------------------------------------------------------|---------------------------------------------------------------|
| ExtractedData | table    | Extracted data that matched the type of entity provided | Table of zero or more rows of data matching the provided entity. |

## Examples

| Function     | Example                                                                                                   |
|--------------|-----------------------------------------------------------------------------------------------------------|
| AISummarize  |    ```Environment.AISummarize({Text:"Insert text here"}).SummarizedText ```                                      |
| AISentiment: |  ```Environment.AISentiment({Text:"Insert text here"}).AnalyzedSentiment ```                                      |
| AIReply      |  ```Environment.AIReply({Text:"Insert text here"}).PreparedResponse ```                                           |
| AIClassify   |  ```Environment.AIClassify({Text:"Insert text here", Categories:\["Category1", "Category2"\]}).Classification ``` |
| AIExtract    |  ```Environment.AIExtract({Text:"Insert text here", Entity:"Insert entity here"}).ExtractedData ```               |
