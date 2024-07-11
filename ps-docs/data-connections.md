---
title: Connect to your data in Project "Sophia"
description: Connect Project "Sophia" to your data, and proceed to ask questions and reason over strategic decisions.
author: marrabi-msft
ms.topic: overview
ms.custom: 
ms.reviewer: mkaur
ms.date: 07/10/2024
ms.service: power-platform
ms.author: marrabi
search.audienceType:
  - maker
contributors:
  - marrabi
---

# Connect Project "Sophia" to your data

[This article is prerelease documentation and is subject to change.]

One of the many benefits of Project Sophia is that you can connect to your business data. Project Sophia supports multiple ways: you can upload files, or connect to an enterprise data source like Dynamics 365 and Dataverse.

Follow these steps to ask a question:

1. Go to [https://projectsophia.microsoft.com](https://projectsophia.microsoft.com).
1. From the Home screen, select **New workspace** 
1. Click on **Add data**, and choose an option
1. Enter your question in the text box and then select **Generate**.


## Uploading files

1. If you're uploading a file, select the file name and then select **Open**. 
1. From the top right, select **Domains** to optimize  responses your specific area of interest. 
1. Select **Generate** or enter your question in the text box and then select **Generate**.

Your data is analyzed to create a blueprint that provides valuable insights, charts, and actionable steps.

### Supported data files

You can upload a PDF (.pdf), CSV (.csv), and Excel (.xls) file. The following limitations apply to file uploads:

- The maximum supported file size is 10 mb.
- For .csv (comma-separated values) files, the data within the file needs to be separated by commas. 
- Excel:
  - Column header in the first row only.
  - No more than 10 tables and max 50 columns for each table.
  - Can’t contain merged cells.
  - Elements such as images, charts, and macros can't be processed.
- PDF:
  - The file must contain selectable text. You can test it by trying to highlight text within the PDF. If you can’t select or highlight the text, then it can't be processed.
  - Use original digital documents or PDF that are converted directly from word processors or other digital sources. A scanned PDF doesn't work.
-	Encrypted or password-protected files aren’t supported.
- If a PDF contains tables make sure the borders are clearly outlined. Avoid using any contrasting colors to differentiate between rows and columns.


## Connecting to a data source

Project "Sophia" allows you to connect to Enterprise data sources. Currently it supports connecting to **Dynamics 365 Sales**, **Dynamics 365 Customer Service**, and **Dataverse** data sources. With more to come in the future.

> [!IMPORTANT]
> You need to have an account at the data source to establish a connection with it.

1. If you're connecting to a data source, follow the instructions in the authentication dialog box.
1. From the top right, select **Domains** to optimize  responses your specific area of interest. 
1. Select **Generate** or enter your question in the text box and then select **Generate**.

### Use data from Dynamics 365 Sales

> [!IMPORTANT]
> You need to have account to establish a connection with Dynamics 365 Sales.

You can connect to your business data from Dynamics 365 Sales, which enables you to do rich analysis across your business data estate.

For Dynamics 365 Sales connection:
- Your sign in information for Project "Sophia" is used to connect to Dynamics 365 Sales.
- If you have access to multiple instances, you're prompted to choose one.
- If an instance isn't found, then the option to connect to **Dynamics 365 Sales** won't be available.
- If Project "Sophia" isn't able to access the data in the instance, it shows an error message.

Based on the question you ask, Project "Sophia" looks through the data source for the most relevant data to answer the question. Project "Sophia" depends on the metadata available (for example, table and column descriptions) to help identify the relevant data. Hint: make sure that custom tables added to Dynamics 365 Sales have proper descriptions. The blueprint generated depends on the data found. If no data is found, then Project "Sophia" shows an error and might ask if you can rephrase the question. If you use the AI Cursor to ask more questions, Project "Sophia" will consider the data-source again to answer it.

If the user doesn't enter any question, by default, Project "Sophia" answers the question based on core tables in Dynamics 365 Sales, like (accounts, opportunities, leads, etc.). You can establish one connection in a workspace. You can upload files for additional context in addition to connecting to a data source. Project "Sophia" supports both custom fields and custom tables in Dynamics 365 Sales instances. It's advisable to have proper descriptions to these custom items.

### Use data from Dynamics 365 Customer Service

> [!IMPORTANT]
> You need to have account to establish a connection with Dynamics 365 Customer Service.

You can connect to your business data from Dynamics 365 Customer Service, which enables you to do rich analysis across your business data estate.

For Dynamics 365 Customer Service connection:
- Your sign in information for Project "Sophia" is used to connect to Dynamics 365 Customer Service.
- If you have access to multiple instances, you're prompted to choose one.
- If an instance isn't found, then the option to connect to **Dynamics 365 Customer Service** won't be available.
- If Project "Sophia" isn't able to access the data in the instance, it shows an error message.

Similar to Dynamics 365 Sales connection, based on the question you ask, Project "Sophia" looks through the data source for the most relevant data to answer the question. Project "Sophia" depends on the metadata available (for example, table and column descriptions) to help identify the relevant data. Hint: make sure that custom tables added to Dynamics 365 Customer Service have proper descriptions. The blueprint generated depends on the data found. If no data is found, then Project "Sophia" shows an error and might ask if you can rephrase the question. If you use the AI Cursor to ask more questions, Project "Sophia" will consider the data-source again to answer it.

If the user doesn't enter any question, by default, Project "Sophia" answers the question based on core tables in Dynamics 365 Customer Service, like (accounts, queue, etc.). You can establish one connection in a workspace. You can upload files for additional context in addition to connecting to a data source. Project "Sophia" supports both custom fields and custom tables in Dynamics 365 Customer Service instances. It's advisable to have proper descriptions to these custom items.

### Use data from Dataverse

> [!IMPORTANT]
> You need to have account to establish a connection with Dataverse.

You can connect to your business data in Dataverse, which enables you to do rich analysis across your business data estate. This includes any custom apps or data tables or fields included there.

For Dataverse connection:
- Your sign in information for Project "Sophia" is used to connect to Dataverse.
- If you have access to multiple instances, you're prompted to choose one.
- If an instance isn't found, then the option to connect to **Dataverse** won't be available.
- If Project "Sophia" isn't able to access the data in the instance, it shows an error message.

Similar to other connections, based on the question you ask, Project "Sophia" looks through the data source for the most relevant data to answer the question. Project "Sophia" depends on the metadata available (for example, table and column descriptions) to help identify the relevant data. Hint: make sure that custom tables have proper descriptions. The blueprint generated depends on the data found. If no data is found, then Project "Sophia" shows an error and might ask if you can rephrase the question. If you use the AI Cursor to ask more questions, Project "Sophia" will consider the data-source again to answer it.

You can establish one connection in a workspace. You can upload files for additional context in addition to connecting to a data source.


