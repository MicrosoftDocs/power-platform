---
title: Frequently asked questions Project “Sophia” 
description: Frequently asked questions about Project “Sophia.”
author: mikkelsen2000
ms.topic: Overview
ms.custom: 
ms.reviewer: mkaur
ms.date: 11/13/2023
ms.service: power-platform
ms.author: pemikkel
search.audienceType:
  - maker
contributors:
  - mduelae
  - mikkelsen2000
---

# Frequently asked questions about Project “Sophia” (preview)

[This article is prerelease documentation and is subject to change.]

## Why can I not access Project Sophia?
Project Sophia is only available in North America. In case you are trying to access while in North America and still get a notification telling you that **Project Sophia is not yet available your region**, then is it because the data residency of the tenant you are trying to access from, is based outside of North America. You can sign up to product news and be notified when Project Sophia becomes available in new regions through https://aka.ms/projectsophianews 

## How can provide feedback to the product team?
We welcome all feedback on Project Sophia. Please get in touch through https://aka.ms/projectsophiafeedback  

## Why do I get an error when trying to upload a file?
The following limitations applies to file upload:
You can upload a PDF (.pdf), CSV (.csv), and Excel (.xls) file. The following limitations apply to file uploads:

- The maximum supported file size is 10 mb.
- For .csv (comma-separated values) files, the data within the file needs to be separated by commas. 
- For Excel files:
  - Column header in the first row only.
  - No more than 10 tables and max 50 columns for each table.
  - Can’t contain merged cells.
  - Elements such as images, charts and macros can't be processed.
- For PDF files:
  - The file must contain selectable text. You can test it by trying to highlight text within the PDF. If you can’t select or highlight the text, then it can't be processed.
  - Use original digital documents or PDF that are converted directly from word processors or other digital sources. A scanned PDF will not work.
-	Encrypted or password-protected files are not supported.
- If a PDF contains tables make sure the borders are clearly outlined. Avoid using any contrasting colors to differentiate between rows and columns.

## The page never loads when I chose next actions:
This may occur if you are choosing multiple **next actions** while a previous next action is loading. We are aware of this issue and will address in an upcoming release. 

## How can I refine a single block instead of the entire blueprint?
If you are using the AI cursor and press enter after entering your prompt, your prompt will automatically create a new blueprint. You can chose to update only a single block on a blueprint by clicking Generate and then select Generate in place of existing block. This will replace or update the content of an existing block based on the content you enter.

## Can I connect to data instead of uploading files? 
Not yet, but we will support connecting to your enterprise data in future releases

## What are the preview terms? Is microsoft using my data to train their models? How do I know my data is safe?

The use of Project Sophia is subject to the terms outlined in https://aka.ms/projectsophiapreviewterms
