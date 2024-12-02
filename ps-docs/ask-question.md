---
title: Ask Project "Sophia" a question
description: Use the exploratory option to explore a question or topic. Write questions in natural language to reason over your data with AI-generated analysis and charts.
author: mikkelsen2000
ms.topic: overview
ms.custom: 
ms.reviewer: mkaur
ms.date: 06/10/2024
ms.service: power-platform
ms.author: pemikkel
search.audienceType:
  - maker
contributors:
  - mduelae
  - mikkelsen2000
---

# Explore a topic (preview)

[This article is prerelease documentation and is subject to change.]

When you ask Project "Sophia" a question or add data and ask questions about the data, it generates a AI-powered blueprint. 

It's also beneficial to select **Domains** when you use Project “Sophia”. Choosing a domain provides a better understanding of the context of your question. For instance, in the context of sales and marketing, the terms "hunters" and "farmers" hold distinct meanings that might not be apparent without that context. Similarly, there are common acronyms that can mean something different based on context.

Follow these steps to ask a question:

1. Go to [https://projectsophia.microsoft.com](https://projectsophia.microsoft.com).
1. From the Home screen, select **New workspace**.
1. To get relevant results, select **Domains** located at the top right and choose a specific domain.
1. Enter your question in the text box and then select **Generate**.

You'll get an AI-powered blueprint in response to your question including an overview and suggested next steps.

## Ask questions about your data

One of the many benefits of Project Sophia is that you can connect to your business data; currently Dynamics 365 Sales. Additionally, you can further enrich the analysis by uploading data files. The [supported file formats](data-connections.md#supported-data-files) are .csv, .xlsx, and .pdf.

Use one of the following options to ask questions about your data:

   - On the Home screen, on the **Onboarding** tile, select **Go** > **Add data** > upload data or use the sample data. You can also use the sample sales data provided to familiarize yourself with Project "Sophia".
   - On the Home screen, select **New workspace** > **Add data** > use data from **Dataverse**, **Dynamics 365 Sales**, or other available connection types.
   - On the Home screen, select **New workspace** > **Add data** > **Upload files**.
    > [!IMPORTANT]
    > You need to have account at the data source to establish a connection to it. For more information, see [Connect to your data](data-connections.md).
    
Your data is analyzed to create a blueprint that provides valuable insights, charts, and actionable steps.

For more info about uploading files and supported data files, go to [Uploading files](data-connections.md#uploading-files)

For more info about data sources that you can connect to, go to [Connecting to a data source](data-connections.md#connecting-to-a-data-source)

### Work with content

 You can take the following actions when content is generated:

> [!div class="mx-imgBorder"]
> ![Actions.](media/content-actions.png)

Legend:

1. **Home**: Go to the Home screen.
1. **New workspace**: Opens a blank canvas where you can explore and [ask questions](ask-question.md) related to your business. Or you can add business data and [ask questions about the data](ask-question.md#ask-questions-about-your-data). When you ask a question, a workspace is created which can be accessed from the Home screen.
1. **Workspace name**: To rename a workspace, select the default name **Untitled** and rename it. 
1. **Keep it**: Saves the generated content. Select the **Untitled** text box and enter a name for the generated workspace. If you don’t save the generated information, the system automatically saves it as, **Untitled**. You can access all workspaces from the Home screen.
1. **Regenerate**: Regenerates the results or select **Regenerate with new data** to replace with another data set instead of starting over. The **Regenerate** option can generate different results, but the level of difference depends on the specificity of the question asked. For example, a general question such as "tell me something interesting about my data," generates different results, whereas as question such as "show me my top 10 accounts based on last years sales numbers" generate similar results.
1. **Discard**: Deletes the generated content.
1. **Show work and discard**: Option to view more information about the generated content or discard it. **Show work** provides clarity on how the content was generated and what skills were used to produce the content. **Discard** Removes the block of research. 
1. **Select tool**: Use the **Select tool** to select a template or a block. 
1. **AI cursor**: Use the [AI cursor](ai-cursor.md) to ask questions about the content on a blueprint or a block of content in the blueprint.
1. **Zoom and pan**: Use the zoom and pan options to quickly navigate content. The pan button provides an overview of the entire workspace, which lets you navigate and zoom in and out on a blueprint.
