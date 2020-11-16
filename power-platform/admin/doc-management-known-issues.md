---
title: "Known issues with document management | MicrosoftDocs"
description: "Learn about known issues with document management"
keywords: encrypt
ms.date: 09/04/2020
ms.service: powerapps
ms.custom: 
ms.topic: article
applies_to: 
  - PowerApps
ms.assetid: 
author: Mattp123
ms.author: matp
ms.reviewer: 
ms.suite: 
ms.tgt_pltfrm: 
topic-status: Drafting
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Known issues with document management

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

The customizations and configurations described here can cause issues with the document management feature. 

## Components from an Iframe
Opening a component from an Iframe in an entity form from a Unified Interface app will not succeed. For example, loading the Document Associated Grid for an entity form in an Iframe loads the grid in the Iframe but users will not be able to interact with the document records from the grid. 

## Third-party solutions that modify Document Management folders 
Deploying third-party solutions that modify the folders used with the Document Management feature can cause unexpected behavior. 
Examples include the following: 
- Creation of entity record level SharePoint folders. 
- Renaming of previously auto-created entity record level SharePoint folders.
- Moving previously auto-created entity record level SharePoint folders to another location.

If you experience unexpected behavior with the document management feature caused by a third-party solution, contact the third-party solution vendor. 
 
## "File not found" error when adding a file from a SharePoint site
If you receive a **File not found** error or encounter a problem while adding a file from a SharePoint site or SharePoint subsite in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), the likely cause is that you have not created the document location records in the model-driven app to point to these SharePoint document libraries and folders.

SharePoint document locations are records in model-driven apps, such as Dynamics 365 Sales and Customer Service, that point to a SharePoint document library or folder. To use any SharePoint site or subsite in SharePoint integration, you must run the Document Management Settings wizard once with the corresponding site URL, so that the document libraries are created in the site.

To store documents for records, the document libraries or folders must be in place. If model-driven apps are unable to create the document libraries and folders automatically, you can manually create these in SharePoint. After you create the document libraries and folders in SharePoint, you must create document location records in model-driven apps to point to these SharePoint document libraries and folders.

For more information, see [Create or edit document location records](https://docs.microsoft.com/power-platform/admin/create-edit-document-location-records).

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

For more information, see [Create or edit document location records](https://docs.microsoft.com/power-platform/admin/create-edit-document-location-records).

## SharePoint enforces resource throttling with 5000 or more documents
A document library with 5000 or more documents might experience resource throttling.
Users may experience the following behavior with document management and OneNote integration:

- A sort on columns other than the default sorted column, may return the error message "The throttling limit has been exceeded by this operation."
- Microsoft OneNote integration will not work when the document library has 5000 or more documents.

If you have more than 5000 documents in your document library, you can view the documents in the default grid view. For more details, see [Manage large lists and libraries in SharePoint](https://support.office.microsoft.com/article/manage-large-lists-and-libraries-in-sharepoint-b8588dae-9387-48c2-9248-c24122f07c59?ui=en-US&rs=en-US&ad=US).

## Relationship must be one-to-many (1:N) between an entity and a SharePoint document entity 
Users cannot see documents when many entities are pointing to a SharePoint document location, a many-to-many relationship (N:N). The relationship must be one-to-many (1:N) between any entity and a SharePoint document entity.

In Microsoft Dataverse you can create an entity and enable the Document management property for the entity. This allows for the entity to participate in integration with SharePoint. Power Apps and Dataverse support only a one-to-many relationship (1:N) between any entity and a SharePoint document related entity. A many-to-one or a many-to-many relationship between an entity and a SharePoint document entity results in the app not listing the documents that exist in the SharePoint document library.

## Document location for child entities
Documents of a child entity only appear in the parent documents folder when the parent document location has been created. To create the location, navigate to the Documents tab of the parent record. If no such location is created, child documents will not appear in the parent entity folder. Once the location is created, child documents will begin to appear in the parent entity folder.

## Document folder location for multiple lookups
If the entity selected for the Based on entity folder structure has two lookups, documents will not be stored inside the entity folder, but will be stored in the root folder. For example, if the Based on entity folder structure is set to Account, and you have an entity with two lookup accounts, such as Work Order, the documents related to Work Orders will not be stored inside any account document location, but will be stored in the root folder.

### See also
[Troubleshooting server-based authentication](troubleshooting-server-based-authentication.md) <br />
[Troubleshoot SharePoint integration](troubleshoot-set-up-sharepoint-online.md)
