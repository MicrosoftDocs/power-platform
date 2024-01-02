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

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

You can upload your own documents for your copilot to [generate answers with generative AI](nlu-boost-conversations.md). The documents are used across your copilot, but you can [specify individual nodes that shouldn't use uploaded documents](#disable-documents-as-a-data-source-for-a-generative-answers-node).

When a copilot user asks a question, and the copilot doesn't have a defined topic to use, the copilot generates an answer from your uploaded documents. The copilot uses generative AI to answer the user's question and provides an answer in a conversational style.

Uploaded documents are stored securely in Dataverse. The number of documents you can upload is only limited by the available file storage for your Dataverse environment.

Image, audio, video, and executable files are not supported. See [Supported document types](#supported-document-types) for a full list.

> [!IMPORTANT]
>  
> This is a preview feature.
> Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Uploading a document

> [!WARNING]
> Contents of the files you upload will be available to all users.
>
> Uploaded file content is available to anyone chatting with the copilot, regardless of file permissions or access controls.

To upload a document:

1. With a copilot open, expand **Settings** on the side navigation pane, and select **Generative AI**.

1. Under **Upload a document (preview)**, upload your documents in one of two ways:

    - Drag and drop files and folders onto the field that says **Drag and drop files here or click to browse**.
    - Select **click to browse** to open a file window where you can select the files you want.

    :::image type="content" source="media/nlu-gpt/nlu-document-upload.png" alt-text="Screenshot of the Copilot Studio interface to upload a document":::

1. Select **Save** at the top of the **Generative AI** page.

### After uploading your documents

- Once uploaded, your content in the document might take a few minutes to be ready for use by the copilot.

- Uploaded documents create new copies and don't overwrite existing documents, even if they have the same name.

   > [!TIP]
   > Uploading documents with the same name can result in duplicate files.
   >
   > Therefore, when updating an existing file, you might want to add a version number to the file name before uploading it to distinguish it from the previous version.

- The uploaded document becomes part of the copilot solution, therefore exporting and importing a copilot solution includes the documents.

## Downloading or deleting a document

To download or delete an uploaded document, hover over the document name and select the download or delete icon.

:::image type="content" source="media/nlu-gpt/nlu-document-download.png" alt-text="Screenshot of interface to download a document":::

## Disable documents as a data source for a generative answers node

Documents used as a data source for the copilot are used as a data source by default for all generative answers nodes.

To exclude a specific generative answers node from using documents as a data source:

1. Open the topic with the generative answers node you want to exclude.  
1. On the top menu bar, select **More options** > **Open code editor**.
1. Insert the following lines of code immediately after the line `variable: Topic.   Answer`:

    ```yml
    fileSearchDataSource:
        searchFilesMode: 
           kind: DoNotSearchFiles
    ```

1. Select **Save** at the top of the page.

## Supported document types

- Word (doc, docx)
- Excel (xls, xlsx)
- PowerPoint (ppt, pptx)
- PDF (pdf)
- Text (.txt, .md, .log)
- HTML (html, htm)
- CSV (csv)
- XML (xml)
- OpenDocument (odt, ods, odp)
- EPUB (epub)
- Rich Text Format (rtf)
- Apple iWork (pages, key, numbers)
- JSON (json)
- YAML (yml, yaml)
- LaTeX (tex)

File types, such as images, video, executable files, and audio, can't be used as an uploaded document.
