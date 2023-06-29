---
title: "Known issues with document management | MicrosoftDocs"
description: "Learn about known issues with document management"
keywords: encrypt
ms.date: 10/26/2022
ms.custom: 
ms.topic: article
applies_to: 
  - PowerApps
ms.assetid: 
author: Mattp123
ms.subservice: admin
ms.author: matp
ms.reviewer: 
ms.suite: 
ms.tgt_pltfrm: 
topic-status: Drafting
search.audienceType: 
  - admin
---
# Known issues with document management

The customizations and configurations described here can cause issues with the document management feature. 

## Components from an Iframe
Opening a component from an Iframe in an entity form from a Unified Interface app will not succeed. For example, loading the Document Associated Grid for an entity form in an Iframe loads the grid in the Iframe but users will not be able to interact with the document records from the grid. 

## Third-party solutions that modify Document Management folders 
Deploying third-party solutions that modify the folders used with the Document Management feature can cause unexpected behavior. 
Examples include the following: 
- Creation of entity record level SharePoint folders. 
- Renaming of previously autocreated entity record level SharePoint folders.
- Moving previously autocreated entity record level SharePoint folders to another location.

If you experience unexpected behavior with the document management feature caused by a third-party solution, contact the third-party solution vendor. 
 
## "File not found" error when adding a file from a SharePoint site
If you receive a **File not found** error or encounter a problem while adding a file from a SharePoint site or SharePoint subsite in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), the likely cause is that you have not created the document location records in the model-driven app to point to these SharePoint document libraries and folders.

SharePoint document locations are records in model-driven apps, such as Dynamics 365 Sales and Customer Service, that point to a SharePoint document library or folder. To use any SharePoint site or subsite in SharePoint integration, you must run the Document Management Settings wizard once with the corresponding site URL, so that the document libraries are created in the site.

To store documents for records, the document libraries or folders must be in place. If model-driven apps are unable to create the document libraries and folders automatically, you can manually create these in SharePoint. After you create the document libraries and folders in SharePoint, you must create document location records in model-driven apps to point to these SharePoint document libraries and folders.

For more information, see [Create or edit document location records](./create-edit-document-location-records.md).

## "File not found" error when using multiple SharePoint sites

If you receive a **File not found** error when using multiple SharePoint sites, the likely cause is that there are no document libraries for a new SharePoint site. You must run the Document Management Settings wizard for any newly added SharePoint sites.

The following describes the scenario that causes the error.

1. Run the Document Management Settings wizard for the default SharePoint site.

2. In the model-driven app in Dynamics 365, add a new SharePoint site (go to **Advanced Settings** > **Document Management** > **SharePoint Sites** > **Add SharePoint Site**). This creates a SharePoint site entry only in the application and does not create the document libraries in SharePoint that are required for document management.

3. Open any entity where document management is enabled, and create the document location for the new site that you added in step 2 as the parent site. 

4. You will encounter the "File Not Found" error. The cause of the error is that there are no document libraries for this new SharePoint site in SharePoint.

To mitigate this issue, run the Document Management Settings wizard for this newly added site as well.

Points to consider:

-  Document management works only for entities that are selected while running the Document Management Settings wizard.

-  The SharePoint site for which the Document Management Settings wizard is last run becomes the default site. You can reset the default site if required by running the Document Management Settings wizard again for that particular site.

For more information, see [Create or edit document location records](./create-edit-document-location-records.md).

## SharePoint enforces resource throttling with 5000 or more documents
A document library with 5000 or more documents might experience resource throttling.
Users may experience the following behavior with document management and OneNote integration:

- A sort on columns other than the default sorted column, may return the error message "The throttling limit has been exceeded by this operation."
- Microsoft OneNote integration will not work when the document library has 5000 or more documents.

If you have more than 5000 documents in your document library, you can view the documents in the default grid view. For more information, see [Manage large lists and libraries in SharePoint](https://support.office.microsoft.com/article/manage-large-lists-and-libraries-in-sharepoint-b8588dae-9387-48c2-9248-c24122f07c59?ui=en-US&rs=en-US&ad=US).

## Relationship must be one-to-many (1:N) between an entity and a SharePoint document entity 
Users cannot see documents when many entities are pointing to a SharePoint document location, a many-to-many relationship (N:N). The relationship must be one-to-many (1:N) between any entity and a SharePoint document entity.

In Microsoft Dataverse, you can create an entity and enable the Document management property for the entity. This allows for the entity to participate in integration with SharePoint. Power Apps and Dataverse support only a one-to-many relationship (1:N) between any entity and a SharePoint document-related entity. A many-to-one or a many-to-many relationship between an entity and a SharePoint document entity results in the app not listing the documents that exist in the SharePoint document library.

## Document location for child entities
Documents of a child entity only appear in the parent documents folder when the parent document location has been created. To create the location, navigate to the Documents tab of the parent record. If no such location is created, child documents will not appear in the parent entity folder. Once the location is created, child documents will begin to appear in the parent entity folder.

## Document folder location for multiple lookups
If the entity selected for the Based on entity folder structure has two lookups, documents will not be stored inside the entity folder, but will be stored in the root folder. For example, if the Based on entity folder structure is set to Account, and you have an entity with two lookup accounts, such as Work Order, the documents related to Work Orders will not be stored inside any account document location, but will be stored in the root folder.

## Entering a date for OneNote documents

In order to add a date to a OneNote document, you can open the OneNote document and double-click on the field under the title line. This allows you to enter the date field and save the document. 

:::image type="content" source="media/date_onenote_documents.png" alt-text="Double-click the date field.":::

## SharePoint Document table doesn’t display inputs when you create a flow

When you create a flow trigger in Power Automate that acts on the Dataverse SharePoint Documents table (named Documents in Power Automate), no data from the table is passed to the flow editor and the flow inputs appear as an empty array.

This behavior occurs because the SharePoint Documents table is a virtual table and the SharePoint and OneDrive document table data is not stored in Dataverse. Below is an example of a flow trigger using the SharePoint Documents table.

:::image type="content" source="media/flow-trigger-documents-table.png" alt-text="Low trigger using the SharePoint documents table from Dataverse":::

## "Record is unavailable" message when you attempt to open a file from the SharePoint documents grid

This message might appear when a certain customization is made to the ribbon bar. Ribbon customizations can be implemented by using a third-party tool called Ribbon Workbench. When hiding a button on the ribbon bar, the `Mscrm.OpenRecordItem` command might have also been hidden by using the tool, which can cause the error message.

To resolve this issue, follow these steps.

1. Go to [Power Apps](https://make.powerapps.com/) > **Advanced settings** > **Settings** > **Customizations**.
1. Select the third-party tool **Ribbon Workbench**, then select the solution that contains the SharePoint document table.
1. In the **Entity** dropdown list, select **sharepointdocument**.
1. Under the **Hide Actions** dropdown list, right-click the **Mscrm.OpenRecordItem.Hide** action, and then select **Un-Hide**. 

   :::image type="content" source="media/unhide-openrecorditem.png" alt-text="Select un-hide for the openrecirditem.hide action.":::
1. Publish the solution.

## Known issues

### Document Associated Grid in child entity quick view form

The Document Associated Grid is designed to show documents related to the entity context it's being rendered in. Embedding the Document Associated Grid in a related (child) entity quick view form and configuring the grid to show documents from its parent entity is unsupported.

### SharePoint integration does not support the Dynamics 365 editable grid

SharePoint integration does not work with the Dynamics 365 editable grid, due to known side effects that prevent SharePoint integration from working properly. Side effects include: the document failing to load in the grid, an inability to create or upload documents, and an inability to search in the grid.

### Maximum number of rows not honored in the document associated grid

Configuring the following in the **DocumentGrid** pane will be ignored.

- **Maximum number of rows**: a value
- **Use available space**: unchecked

For Unified Interface and backward compatibility, the row limit in the document associated grid is set to 5000 and **Use available space** is disabled. This is a known limitation.

### Error message when opening a record: "The record does not have a SharePoint location associated with it. Add a SharePoint location."

This issue can occur when you are using the legacy list component for document management. The list component isn't supported with the current versions of Power Apps or Dynamics 365 apps.

In 2015, [we announced the deprecation of the list component]( https://cloudblogs.microsoft.com/dynamics365/no-audience/2015/05/15/dynamics-crm-2015-update-1-list-component-deprecation/?source=crm). Notice that, a list component wasn’t released for Power Apps or the current versions of Dynamics 365 and previous versions of the list component aren’t supported with these versions.

If you are using the list component, you must move your document management to use server-based authentication.

-	For Power Apps and Dynamics 365 apps, see [Switch from the list component or change the SharePoint deployment](switching-list-component-changing-deployment.md).
-	For Dynamics 365 Customer Engagement (on-premises), see [Switching from the list component or changing the deployment](/dynamics365/customerengagement/on-premises/admin/switching-list-component-changing-deployment?view=op-9-0&preserve-view=true).

### Error message "An error has occurred while loading documents" when filtering by Name column

The  error "An error has occurred while loading documents. Please reload the document. If the problem persists, contact your Dynamics 365 administrator for help" occurs when you filter by the Name column in the document associated grid.

This error occurs with the following filter by options in the document associated grid:

- **Begins with**
- **Does not begin with**
- **Ends with**
- **Does not end with**

:::image type="content" source="media/filterby-unsupported-docmgt.png" alt-text="Filter by options not supported":::

This error occurs because these filter by options aren't currently supported with the document associated grid.

### See also

[Troubleshooting server-based authentication](troubleshooting-server-based-authentication.md) <br />
[Troubleshoot SharePoint integration](troubleshoot-set-up-sharepoint-online.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
