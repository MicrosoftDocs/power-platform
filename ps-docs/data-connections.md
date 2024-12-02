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

# Connect Project "Sophia" to your data (preview)

[This article is prerelease documentation and is subject to change.]

One of the many benefits of Project Sophia is that you can connect to your business data. Project Sophia supports multiple ways: you can upload files, or connect to an enterprise data source like Dynamics 365 and Dataverse.

Follow these steps to ask a question:

1. Go to [https://projectsophia.microsoft.com](https://projectsophia.microsoft.com).
1. From the Home screen, select **New workspace**.
1. Select **Add data**, and choose an option.
1. From the top right, select **Domains** to optimize responses for your specific area of interest. 
1. Enter your question in the text box and then select **Generate**.

## Uploading files

1. If you're uploading a file, select the file name and then select **Open**.
1. Select **Generate** or enter your question in the text box and then select **Generate**.

Your data is analyzed to create a blueprint that provides valuable insights, charts, and actionable steps.

### Supported data files

You can upload a PDF (.pdf), CSV (.csv), or Excel (.xls) file. The following limitations apply to file uploads:

- The maximum supported file size is 10 mb.
- The maximum number of uploaded files is 5, and maximum total size for all is 30 mb.
- Encrypted, password-protected, or copyright-managed files aren’t supported.
- CSV:
  - Data within the file needs to be separated by commas. 
- Excel:
  - Column header in the first row only.
  - No more than 10 tables and maximum 50 columns for each table.
  - Can’t contain merged cells.
  - Elements such as images, charts, and macros can't be processed.
- PDF:
  - 150 maximum supported number of pages per file.
  - Must contain selectable text. You can test it by trying to highlight text within the PDF. If you can’t select or highlight the text, then it can't be processed.
  - Use original digital documents or PDFs that are converted directly from word processors or other digital sources. A scanned PDF doesn't work.
  - If the PDF contains tables, make sure the borders are clearly outlined. Avoid using any contrasting colors to differentiate between rows and columns.

## Connecting to a data source

Project "Sophia" allows you to connect to Enterprise data sources. Currently it supports connecting to Dataverse, Dynamics 365 Sales, and Dynamics 365 Customer Service data sources, with more to come in the future. You can establish one connection in a workspace. You can upload files for more context in addition to connecting to a data source.

> [!IMPORTANT]
> The connection options depend on the user account you use to log in to Project "Sophia". If that user account has access to those data sources, then the connection options will appear. If you don't see those options when connecting a data source, contact your administrator to give your account access.

1. If you're connecting to a data source, follow the instructions in the authentication dialog box.
1. Select **Generate** or enter your question in the text box and then select **Generate**.

### Use data from Dataverse

You can connect to your business data in Dataverse, which enables you to do rich analysis across your business data estate. This includes any custom apps, data tables, or fields included there.

For a Dataverse connection:

- Your sign in information for Project "Sophia" is used to connect to Dataverse.
- If you have access to multiple instances, choose one.
- If an instance isn't found, then the option to connect to **Dataverse** isn't available.
- If Project "Sophia" isn't able to access the data in the instance, it shows an error message.

Similar to other connections, based on the question you ask, Project "Sophia" looks through the data source for the most relevant data to answer the question. Project "Sophia" depends on the metadata available (for example, table and column descriptions) to help identify the relevant data. Currently, Dataverse connection can load up to 15 tables. It keeps adding more tables until hitting that limit. Data is aggregated before reading it, and limited to 10,000 rows.

> [!TIP]
> Make sure that custom tables have proper descriptions. The blueprint generated depends on the data found. If no data is found, then Project "Sophia" shows an error and might ask if you can rephrase the question. If you use the AI cursor to ask more questions, Project "Sophia" will consider the data source again to answer it.

### Use data from Dynamics 365 Sales

You can connect to your business data from Dynamics 365 Sales, which enables you to do rich analysis across your business data estate.

For a Dynamics 365 Sales connection:

- Your sign in information for Project "Sophia" is used to connect to Dynamics 365 Sales.
- If you have access to multiple instances, choose one.
- If an instance isn't found, then the option to connect to **Dynamics 365 Sales** isn't available.
- If Project "Sophia" isn't able to access the data in the instance, it shows an error message.

Based on the question you ask, Project "Sophia" looks through the data source for the most relevant data to answer the question. Project "Sophia" depends on the metadata available (for example, table and column descriptions) to help identify the relevant data. This connection has same limitations on number of tables and rows as the Dataverse connection. If the logged in user does not have read access to the Sales Hub app in Dynamics 365 Sales deployment, then Project "Sophia" might not show the option to connect to it. In this case, try connecting to it as a Dataverse connection.

> [!TIP]
> Make sure that custom tables added to Dynamics 365 Sales have proper descriptions. The blueprint generated depends on the data found. If no data is found, then Project "Sophia" shows an error and might ask if you can rephrase the question. If you use the AI cursor to ask more questions, Project "Sophia" will consider the data source again to answer it.

If the user doesn't enter any question, by default, Project "Sophia" answers the question based on core tables in Dynamics 365 Sales, like accounts, opportunities, leads, and more. You can establish one connection in a workspace. Project "Sophia" supports both custom fields and custom tables in Dynamics 365 Sales instances. It's advisable to have proper descriptions for these custom items.

### Use data from Dynamics 365 Customer Service

You can connect to your business data from Dynamics 365 Customer Service, which enables you to do rich analysis across your business data estate.

For a Dynamics 365 Customer Service connection:

- Your sign-in information for Project "Sophia" is used to connect to Dynamics 365 Customer Service.
- If you have access to multiple instances, choose one.
- If an instance isn't found, then the **Dynamics 365 Customer Service** connection option isn't available.
- If Project "Sophia" isn't able to access the data in the instance, it shows an error message.

Based on the question you ask, Project "Sophia" looks through the data source for the most relevant data to answer the question. Project "Sophia" depends on the metadata available (for example, table and column descriptions) to help identify the relevant data. This connection has same limitations on number of tables and rows as the Dataverse connection. If the logged in user doesn't have read access to the Customer Service Hub app in Dynamics 365 Customer Service deployment, then Project "Sophia" might not show the option to connect to it. In this case, try connecting to it as a Dataverse connection.

> [!TIP]
> Make sure that custom tables added to Dynamics 365 Customer Service have proper descriptions. The blueprint generated depends on the data found. If no data that fits the scenario is found, then Project "Sophia" shows an error and might ask if you can rephrase the question. If you use the AI cursor to ask more questions, Project "Sophia" will consider the data source again to provide answers.

If the user doesn't enter any question, then by default Project "Sophia" answers the question based on core tables in Dynamics 365 Customer Service like accounts, incidents, incident-resolutions, and more. You can establish one connection in a workspace. Project "Sophia" supports both custom fields and custom tables in Dynamics 365 Customer Service instances. It's advisable to have proper descriptions for these custom items.

