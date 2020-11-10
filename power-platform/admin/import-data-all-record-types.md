---
title: "Import data (all record types)  | MicrosoftDocs"
description: Import data (all record types) 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Import data (all record types) from multiple sources

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Importing data is often the first important task that you need to perform after you have installed customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). You can import data from various systems and data sources into standard and customized fields of most business and custom entities. You can include related data, such as notes and attachments. To assure data integrity, you can enable duplicate detection that prevents importing duplicate records. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Detect duplicate data](detect-duplicate-data.md). For more complex data import scenarios, you can write code using the data import web service. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Import data](https://docs.microsoft.com/powerapps/developer/common-data-service/import-data).

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Data management** > **Data import wizard**.
  
 Preliminary steps before you import the data include:  
  
1. Preparing source data files in one of the following formats: comma-separated values (.csv), XML Spreadsheet 2003 (.xml), Compressed (.zip) or text files. You can import data from one source file or several source files. A source file can contain data for one entity type or multiple entity types.  
  
2. Preparing data maps for mapping data contained in the source file to the record fields. You must map every column in the source file to an appropriate field. Unmapped data isn’t imported. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Select a data map](select-data-map.md)  
  
There are several ways to import data:  

> [!NOTE]
> We recommend limiting your import to 20K rows or fewer.
  
1. To import large volumes of data, we recommend a programmatic way, as most efficient. When you import data programmatically, you gain additional capabilities that are not available when you use other methods of importing data. These advanced capabilities include viewing stored source data, accessing error logs and creating data maps that include complex transformation mapping, such as concatenation, split, and replace. See [Import data](https://docs.microsoft.com/powerapps/developer/common-data-service/import-data).
  
2. For smaller import jobs, you can use the Import Data Wizard tool included in the web application. 
  
   > [!NOTE]
   >  For the Import Data Wizard, the maximum file size for .zip files is 32 MB; for the other file formats, it’s 8 MB.  
   > 
   >  With the Import Data Wizard, you can specify the “Map Automatically” option. The wizard automatically maps all the files and the column headings with record types and fields if:  
   > 
   > - The file names exactly match the display name of the record type.  
   > -   The column headings of the file you are importing exactly match the display names of the fields in the record.  
  
3. To add data for an individual record, the quickest way is to use **Quick Create** from the nav bar or **New** from the entity form.  
  
### See also  
 [Detect duplicate data](detect-duplicate-data.md)
