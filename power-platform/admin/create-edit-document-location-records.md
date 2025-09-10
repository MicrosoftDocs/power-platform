---
title: "Create or edit records for document locations to use SharePoint"
description: "Learn how to create document location records that let Power Apps apps use SharePoint document libraries and folders in Power Platform."
author: Mattp123
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/10/2025
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
---
# Create or edit document location records

[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document locations are records in Power Apps and Dynamics 365 apps that point to a [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document library or folder.  
  
To store documents for records, the document libraries or folders must be in place. If apps are unable to create the document libraries and folders automatically, you can manually create these in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. After you create the document libraries and folders in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], you must create document location records to point to these [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document libraries and folders.  

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** on the left navigation pane, select **Environments**, and then open the environment you want.
1. Select **Settings** on the command bar.
1. Select **Integration** > **Document management settings**.
1. Select **SharePoint Document Locations**, and then open an existing document location record. You must have SharePoint integration enabled for any document location records to exist.
1. On the document location record command bar, select **New**.
1. Specify the following information as required:  

   - **Name**. Enter a name for the document location. This name displays in the location list in the table record.
   - **Owner**. By default, you are added as the owner of this location record, but you can change this.  
   - **Description**. Enter an optional a description for the document location.  
   - **URL Type**. Select whether you want to create the location with an absolute URL or relative URL.  
     - Select **Absolute URL**, and in the **Absolute URL** box, specify the fully qualified URL of the location of the folder in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
        \-  OR -  
  
     - Select **Relative URL**. In **Relative URL**, to create a relative document location to the existing site or document location record, select the existing [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site or document location record. In the second box, enter the name of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] folder.  
  
   - **Regarding**. Optionally, select the **Lookup** button ![Lookup button.](../admin/media/lookup-button-4.png "Lookup button"). In the **Look Up Record** dialog box, select the type of records you want to find. Search and select the record for which you want to create the location record and choose **OK**.  

1. Select **Save and Close**.
<!--
## Classic experience

1. [!INCLUDE[proc_settings_doc_mgmt](../includes/proc-settings-doc-mgmt.md)]  
  
2. Choose **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Locations**.  
  
3. Choose **New**.  
  
4. Specify the following information as required:  
  
   - **Name**. Type a name for the document location. This name displays in the location list in the table record.  
  
   - **Owner**. By default, you are added as the owner of this location record.  
  
   - **Description**. Type a description for the document location.  
  
   - **URL Type**. Select whether you want to create the location with an absolute URL or relative URL.  
  
     - Select **Absolute URL**, and in the **Absolute URL** box, specify the fully qualified URL of the location of the folder in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
        \-  OR -  
  
     - Select **Relative URL**. In **Relative URL**, to create a relative document location to the existing site or document location record, select the existing [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site or document location record. In the second box, enter the name of the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] folder.  
  
   - **Regarding**. Choose the **Lookup** button ![Lookup button.](../admin/media/lookup-button-4.png "Lookup button"). In the **Look Up Record** dialog box, in the **Look for** list, select the type of records you want to find. search and select the record for which you want to create the location record and choose **OK**.  
  
5. Choose **Save and Close**.  -->
  
> [!NOTE]
>  To activate or deactivate a document location, on the **Document Locations** page, select the document location record, and choose **Activate** or **Deactivate**.  
  



[!INCLUDE[footer-include](../includes/footer-banner.md)]
