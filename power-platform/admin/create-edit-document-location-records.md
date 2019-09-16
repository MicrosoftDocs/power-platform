---
title: "Create or edit document location records for Dynamics 365 for Customer Engagement apps | MicrosoftDocs"
ms.custom: 
ms.date: 09/30/2017
ms.reviewer: 
ms.service: crm-online
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: article
applies_to: 
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
ms.assetid: e0bacd7b-f84d-4856-a192-2bb564188160
caps.latest.revision: 5
author: Mattp123
ms.author: matp
manager: brycho
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# Create or edit document location records

*This content also applies to the on-premises version.*

[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document locations are records in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps that point to a [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document library or folder.  
  
 To store documents for [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps records, the document libraries or folders must be in place. If [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps is unable to create the document libraries and folders automatically, you can manually create these in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. After you create the document libraries and folders in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], you must create document location records in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps to point to these [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document libraries and folders.  
  
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
  
   - **Regarding**. Choose the **Lookup** button ![Lookup button](../admin/media/lookup-button-4.gif "Lookup button"). In the **Look Up Record** dialog box, in the **Look for** list, select the type of records you want to find. search and select the record for which you want to create the location record in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps, and choose **OK**.  
  
5. Choose **Save and Close**.  
  
> [!NOTE]
>  To activate or deactivate a document location, on the **Document Locations** page, select the document location record, and choose **Activate** or **Deactivate**.  
  

