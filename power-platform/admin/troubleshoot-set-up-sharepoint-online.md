---
title: "Troubleshoot SharePoint integration   | MicrosoftDocs"
description: Troubleshoot SharePoint integration
author: Mattp123
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/02/2019
ms.author: matp
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Troubleshoot SharePoint integration

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

This topic explains how to fix common issues that may occur with SharePoint document management.

## Missing Documents button - validate and fix 

If **Documents** is missing from entities such as account, use the following to restore.

![Documents](media/crm-itpro-crmo365tg-seldoc.png "Documents")

1. Make sure you have the System Administrator security role or equivalent permissions.
    Check your security role:
    a. Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
    b. Don’t have the correct permissions? Contact your system administrator.

2. Fix the missing **Documents** button. Follow these steps:

   1. Identity the entity for which the documents link should be visible (e.g. account, contact, opportunity...etc.).
   2. Go to **Settings** > **Document Management Settings**.
   3. Make sure the entity you wished to have documents link (selected in Step 1) are selected and a valid SharePoint URL is specified. 
   4. Complete the wizard.
   5. Verify the **Documents** button appears.

For more information, see [Enable SharePoint document management for specific entities](enable-sharepoint-document-management-specific-entities.md).

##  Missing Document associated grid - validate and fix

If the Documents associated grid is missing, use the following to restore.

![Documents associated grid](media/list-of-documents-in-onedrive.png "Documents associated grid")

The most common cause for the Documents associated grid not loading is the corrupted FetchXML and LayoutXML. These sections could be corrupted due to many reasons. The most common of them is through customizing the entity/grid view, adding/removing columns, and other similar customizations.

1. Make sure you have the System Administrator security role or equivalent permissions.
    Check your security role:
    a. Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
    b. Don’t have the correct permissions? Contact your system administrator.
2. Go to **Settings** > **Customizations** > **Solutions**. 
3. Create a solution (named SharePointDocumentSolution). For more information, see [Create a solution](/dynamics365/customer-engagement/customize/create-solution.md).
4. Choose **Entities** > **Add Existing** > **Entity** > find and add **SharePoint Document** entity  (select all fields, forms, views). 
5. Select **Save** and **Close**.
6. Publish all customizations.
7. Select the created (SharePointDocumentSolution) solution.
8. Export the solution and choose the Package type as "Unmanaged". SharePointDocumentSolution.zip will be downloaded. 
9. Extract the zip file (downloaded file from Step 8).
10. Browse the folder, locate and open customization.xml.
11. Search LayoutXml of Document associated grid (search for *Document Associated*).
    
    > [!div class="mx-imgBorder"] 
    > ![](media/sharepoint-document-associated-grid.png "Search for Document Associated")

12. Make the changes as below for the LayoutXML section:

    ```  
    <layoutxml>
      <grid name="sharepointdocument" jump="fullname" select="1" icon="0" preview="1">
        <row name="sharepointdocument" id="sharepointdocumentid">
          <cell name="fullname" width="300" imageproviderfunctionname="DocumentManagement.FileTypeIcon.loadSharePointFileTypeIcon" imageproviderwebresource="$webresource:SharePoint_main_system_library.js" />
          <cell name="relativelocation" width="200" />
          <cell name="modified" width="150" />
          <cell name="sharepointmodifiedby" width="150" />
          <cell name="sharepointcreatedon" width="300" />
          <cell name="title" ishidden="1" />
          <cell name="readurl" ishidden="1" />
          <cell name="editurl" ishidden="1" />
          <cell name="author" ishidden="1" />
          <cell name="absoluteurl" ishidden="1" />
          <cell name="filetype" ishidden="1" />
          <cell name="ischeckedout" ishidden="1" />
          <cell name="locationid" ishidden="1" />
          <cell name="iconclassname" ishidden="1" />
        </row>
      </grid>
    </layoutxml>
    ```  

13. Make the changes as below for the FetchXml section:

    ```  
    <fetch distinct="false" mapping="logical">
      <entity name="sharepointdocument">
        <attribute name="documentid" />
        <attribute name="fullname" />
        <attribute name="relativelocation" />
        <attribute name="sharepointcreatedon" />
        <attribute name="ischeckedout" />
        <attribute name="filetype" />
        <attribute name="modified" />
        <attribute name="sharepointmodifiedby" />
        <attribute name="servicetype" />
        <attribute name="absoluteurl" />
        <attribute name="title" />
        <attribute name="author" />
        <attribute name="sharepointdocumentid" />
        <attribute name="readurl" />
        <attribute name="editurl" />
        <attribute name="locationid" />
        <attribute name="iconclassname" />
        <order attribute="relativelocation" descending="false" />
        <filter>
          <condition attribute="isrecursivefetch" operator="eq" value="0" />
        </filter>
      </entity>
    </fetch>
     ```  

> [!IMPORTANT]
>  All the attributes configured in the layout xml require their corresponding respective attributes to be present in the Fetch XML. Grid will result in error when this configuration is incorrect.  

14. Save the file.
15. Zip the folder.
16. Open model-driven app in Dynamics 365.
17. Navigate to **Settings** > **Solutions**
18. Import the solution (zipped file in Step 8).
19. Publish all customizations.
20. Verify the Document associated grid is displaying in all the required SharePoint documents.

## Validate and fix SharePoint site URLs

In model-driven apps in Dynamics 365, [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site and document location records contain links to site collections, site, document libraries, and folders in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. These site and document location records are associated with records so that the documents for records can be stored in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
 When the links between model-driven apps in Dynamics 365 and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] break, you must validate and fix the links so that the records continue to point to the correct document libraries and folders for managing the documents.  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_check_your_security_role](../includes/proc-check-your-security-role.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. Find and fix the URLs. To do this, follow these steps.  
  
   1. [!INCLUDE[proc_settings_doc_mgmt](../includes/proc-settings-doc-mgmt.md)]  
  
   2. Click **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Sites**.  
  
   3. Select the site URLs that you want to validate, and then click or tap **Validate**.  
  
3. Model-driven apps in Dynamics 365 validate all the selected site URLs and their immediate subordinate site and document library URLs. It then displays the results in **Validating Sites**.  
  
4. To fix a URL, open the site record, and enter the correct URL. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create or edit site records](edit-existing-sharepoint-site-records.md).  
  
5. Click **Save & Close**.  


## Users receive "You don't have permissions to view files in this location" message
This error message can occur when the SharePoint site that is configured with document management has been renamed, but the SharePoint sites URL record has not been updated to reflect the change. 

1. Go to **Settings** > **Document Management** > **SharePoint Sites**.
2. Open the **SharePoint Site** record that has been renamed and enter the **Absolute URL** with new URL.

    > [!div class="mx-imgBorder"] 
    > ![](media/fix-renamed-sp-site.png "Enter SharePoint relative URL")

3. Select **Save & Close**.


### See also
[Troubleshooting server-based authentication](troubleshooting-server-based-authentication.md) 
