---
title: "Create or edit document location records   | MicrosoftDocs"
description: Create or edit document location records
author: Mattp123
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: matp
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create or edit document location records

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document locations are records in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), that point to a [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document library or folder.  
  
 To store documents for records, the document libraries or folders must be in place. If customer engagement apps are unable to create the document libraries and folders automatically, you can manually create these in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. After you create the document libraries and folders in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], you must create document location records in customer engagement apps to point to these [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document libraries and folders.  
  
1. [!INCLUDE[proc_settings_doc_mgmt](../includes/proc-settings-doc-mgmt.md)]  
  
2. Choose **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Locations**.  
  
3. Choose **New**.  
  
4. Specify the following information as required:  
  
   - **Name**. Type a name for the document location. This name displays in the location list in the entity record.  
  
   - **Owner**. By default, you are added as the owner of this location record.  
  
   - **Description**. Type a description for the document location.  
  
   - **URL Type**. Select whether you want to create the location with an absolute URL or relative URL.  
  
     - Select **Absolute URL**, and in the **Absolute URL** box, specify the fully qualified URL of the location of the folder in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
        \-  OR -  
  
     - Select **Relative URL**. In **Relative URL**, to create a relative document location to the existing site or document location record, select the existing [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site or document location record. In the second box, enter the name of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] folder.  
  
   - **Regarding**. Choose the **Lookup** button ![Lookup button](../admin/media/lookup-button-4.png "Lookup button"). In the **Look Up Record** dialog box, in the **Look for** list, select the type of records you want to find. search and select the record for which you want to create the location record and choose **OK**.  
  
5. Choose **Save and Close**.  
  
> [!NOTE]
>  To activate or deactivate a document location, on the **Document Locations** page, select the document location record, and choose **Activate** or **Deactivate**.  
  

