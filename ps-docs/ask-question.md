---
title: Ask Project “Sophia” a question
description: Use the exploratory option to explore a question or topic.
author: mikkelsen2000
ms.topic: Overview
ms.custom: 
ms.reviewer: mkaur
ms.date: 10/31/2023
ms.subservice: 
ms.author: pemikkel
search.audienceType:
  - maker
contributors:
  - mduelae
  - mikkelsen2000
---

# Explore a topic (preview)

[This article is prerelease documentation and is subject to change.]

When you can ask Project "Sophia" a question or upload data and ask questions about your business data it generates a AI-powered blueprint.

## Ask a question

1. Go to [https://projectsophia.preview.microsoft.com](https://projectsophia.preview.microsoft.com).
2. From the Home screen select **New workspace**.
3. Enter your question in the text box and then select **Generate**.

## Ask questions about your data

You can upload a data file and ask questions about the data. The supported file formats are .csv, .xlsx, and .pdf. For preview, the **connect to data** option isn’t available.

1. Use one of the following methods to ask questions about your data:
   - From the Home screen, on the **Onboarding** section, select **Go** > **Exploratory** > **upload data or use sample data**. You can also use the sample sales data provided to familiarize yourself with Project "Sophia".
   - From the Home screen select, **New workspace** > **Upload or connect to data** > **Upload a file**.
2. Select the file name and then select **Open**.
3. Select **Generate** or enter your question in the text box and then select **Generate**.


### Supported data files

You can upload a PDF (.pdf), CSV (.csv), and Excel (.xls) file.

The following limitations apply to file uploads:

- The maximum supported file size is 10mb.
- For .csv (comma-separated values) files, the data within the file must be separated by commas. 
- Excel:
  - Column header in the first row only
  - No more than 10 tables and max 50 columns for each table
  - Can’t contain merged cells
  - Elements such as images, charts and macros will not be processed
- PDF:
  - The file must contain selectable text. You can test this by trying to highlight text within the PDF. If you can’t select or highlight the text, then it won’t be processed.
  - Use original digital documents or PDF that is converted directly from word processors or other digital sources. A scanned PDF won’t work.
-	Encrypted or password-protected files aren’t supported 


