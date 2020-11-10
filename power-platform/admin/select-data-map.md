---
title: "Select a data map | MicrosoftDocs"
description: Select a data map
author: jimholtz
ms.author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/19/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Select a data map

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

1. Select a data map to tell the Import Data wizard how to organize your imported data into the right columns and fields in customer engagement apps.  
  
   Select the default data map to let the wizard automatically map your data, or select a data map to match the type of information you're importing.  

   These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Data management** > **Data import wizard**.
  
2. Select **Next**.  
   
The following tables help you decide which data map to use.  

|          |          |
|-------------|------|
|  **System Data Maps**   | **When to Use**    |
|     Default (Automatic Mapping)      | Recommended. Use when you want the wizard to map the imported data to the columns and fields in customer engagement apps automatically.<br /><br /> If the wizard can't determine how to map your data, you'll have an opportunity to map it manually later. **Important:**  Import files can only contain one type of data, such as contacts, leads, accounts, or cases. Also, the column headings in the source file must match exactly with the field names in customer engagement apps. |
| For Generic Contact and Account Data |  Use when the import file contains contacts or accounts.   |
| **Data Maps for Salesforce** | **When to Use**      |
|  For Contact and Account Report Export  |   Use this map when your import file contains contacts or accounts from Salesforce.    |
|  For Full Data Export  | Use this map when your import file is exported from Salesforce using Full Data Export. |
| For Report Export  |  Use this map when your import file is exported from Salesforce using Report Export.   |
| **Data Maps for Microsoft Outlook Business Contact Manager**  | **When to Use**    |
| For Microsoft Outlook 2010 with Business Contact Manager | Use this map when your import file contains data from Microsoft Outlook 2010 with Business Contact Manager. |
|  **Custom Maps** (optional)   | **When to Use**    |  
|  Custom maps   |   If available, custom data maps created for your organization are listed here.   |  
  
