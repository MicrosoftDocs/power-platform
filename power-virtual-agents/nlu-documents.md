---
title: "Use uploaded documents as a generative answers data source (preview)"
description: "You can upload documents that your chatbot can use as a source for generating conversational answers."
ms.reviewer: mboninco
ms.date: 09/29/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---

# Use uploaded documents for generative answers (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

You can upload your own documents that your chatbot can use to [generate answers with generative AI](nlu-boost-conversations.md). When you upload documents, they'll be used across your bot, but you can [specify individual nodes that shouldn't use uploaded documents](#disable-documents-as-a-data-source-for-a-generative-answers-node).

When a bot user asks a question, and the bot doesn't have a defined topic that it can use, it will generate an answer from the content within the documents that you uploaded. It uses generative AI to find information in the documents that best answers the user's question, and then provides that information in a conversational style.

Uploaded documents will be stored securely in Dataverse, and the number of documents that can be uploaded is only limited by the available file storage for your Dataverse environment. 

Image, audio, video, and executable files are not supported. See [Supported document types]() for a full list.

> [!IMPORTANT]
>  
> This is a preview feature.
> Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.



## Uploading a document 

> [!WARNING]
>  
> Contents of the files you upload will be available to all users. 
>
> This means uploaded file content is available to anyone chatting with the bot, regardless of file permissions or access controls.

To upload a document to be used to generate answers:

1. With a bot open, expand **Settings** on the side navigation pane, and select **AI Capabilities**.

1. Under **Upload a document (preview)**, upload your documents in one of two ways:

    - Drag and drop files and folders onto the field that says **Drag and drop files here or click to browse**.
    - Select **click to browse** to open a file window where you can select the files you want.

    :::image type="content" source="media/nlu-gpt/nlu-document-upload.png" alt-text="Screenshot of interface to upload a document":::

1. Select **Save** at the top of the **AI capabilities** page.


Once uploaded, it can take a few minutes for the content of the document to be ready for use by the bot.

Uploaded documents create new copies and don't overwrite existing documents, even if they have the same name. 

> [!TIP] 
>  
> Uploading documents with the same name can result in duplicate files.
>
> Therefore, when updating an existing file, you might want to add a version number to the file name before uploading it to distinguish it from the previous version.

The uploaded document becomes part of the bot solution. Exporting and importing a bot solution will include the documents. 

## Downloading or deleting a document

To download or delete an uploaded document, hover over the document name and select the download or delete icon.

:::image type="content" source="media/nlu-gpt/nlu-document-download.png" alt-text="Screenshot of interface to download a document":::

## Disable documents as a data source for a generative answers node

Documents used as a data source for the bot are used as a data source by default for all generative answers nodes. 

To exclude a specific generative answers node from using documents as a data source:

1.	Open the topic with the generative answers node you want to exclude.  
2.	On the top menu bar, select the **More options** icon, and then select **Open code editor**.
   
3.	Insert the following lines of code immediately after the line `variable: Topic.Answer`:
    ```yml
    fileSearchDataSource:
        searchFilesMode: 
           kind: DoNotSearchFiles
    ```

4.	Select **Save** on the top menu bar. You can now close the code editor and continue editing your bot's topics.

## Supported document types

The following file types are supported:

* Word documents (doc, docx)
* Excel spreadsheets (xls, xlsx)
* PowerPoint documents (ppt, pptx)
* PDF documents (pdf)
* Text documents (.txt, .md, .log)
* HTML files (html, htm)
* CSV files (csv)
* XML files (xml)
* OpenDocument files (odt, ods, odp)
* EPUB documents (epub)
* Rich Text Format documents (rtf)
* Apple iWork documents (pages, key, numbers)
* JSON files (json)
* YAML files (yml, yaml)
* LaTeX files (tex)

Certain file types, such as images, video, executable files, and audio, can't be used as an uploaded document.
