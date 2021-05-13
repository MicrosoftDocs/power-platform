---
title: "Troubleshooting SharePoint document management issues"
description: "Learn how to troubleshoot document management issues based on error messages, including missing folders and documentation libraries."
keywords: encrypt
ms.date: 06/15/2020
ms.service: power-platform
ms.custom: 
ms.topic: article
applies_to: 
  - PowerApps
ms.assetid: 
author: Mattp123
ms.author: matp
ms.reviewer: v-iapr
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

# Troubleshooting document management issues

This section explains how to use information provided in error messages to fix issues with the document management feature.
Below is an [index](#index-of-errors) that will help you to reach the right solution. The link in each cell navigates to the reason and mitigation steps for the corresponding error message.

## Common errors

### Language mapping and localization of custom columns in SharePoint

You can create custom columns in SharePoint with support for multiple languages, but it must follow the correct rules for language mapping. The custom column in Dynamics must have the "name" field set to an exact match of the column name on Sharepoint.com. 

For example, if a custom column on Sharepoint.com is created with the name "new_language", then the "name" field of the column in Dynamics must also be named "new_language". The "display name" field in dynamics can be customized, but the "name" field must match the Sharepoint.com column name. 

### OneNote files don't open when launched from Dynamics

If OneNote files are failing to automatically open when launched from Dynamics, it may be due to the record name having more than 128 characters. If OneNote files are failing to automatically open when launched from Dynamics, you may need to shorten the record name and rename the file to match from the document associated grid. Once the record name and file name are shortened, the file should correctly open from OneNote. 

:::image type="content" source="media/doc-management-troubleshoot2.png" alt-text="Select OneNote to open a OneNote file from the timeline.":::

### Error message "Collaborate and share files easily–ask your admin to enable SharePoint"

This issue occurs when document management has not been enabled for this entity. This can be fixed by having the CRM administrator enable document management for that entity using the “Document Management Settings” wizard. 

:::image type="content" source="media/doc-management-troubleshoot3.png" alt-text="Error message displayed for Account entity.":::

The administrator will need to [enable document management](enable-sharepoint-document-management-specific-entities.md) for the Account entity.

:::image type="content" source="media/doc-management-troubleshoot4.png" alt-text="Enable document management of Account entity.":::

### Custom Sharepoint Grid Configuration

If you create a custom grid for use with Sharepoint, the grid must adhere to the requirements for FetchXML and LayoutXML or you will get an error. 

See [Troubleshoot SharePoint integration](troubleshoot-set-up-sharepoint-online.md#malformed-fetchxml-or-layoutxml---validate-and-fix).

## Error messages

The following are error messages that are possible with document management.

### Error Message 1

  Document library `<entity name>` has been renamed or deleted from SharePoint site `<SharePoint site>`. Rerun the document management wizard and try again.

### Error Message 2

  Folder `<folder name>` has been renamed or deleted from SharePoint. It was expected inside `<folder path>` path. Restore the folder on SharePoint and try again.

## Index of errors

|Error | [Error Message 1](#error-message-1) | [Error Message 2](#error-message-2) |
|----------------|-----------------|-----------------|
|Refresh the document grid for existing record    |  [Mitigation steps for missing document library](#reason-and-mitigation-steps-for-missing-document-library)      | [Mitigation steps for missing folder](#reason-and-mitigation-steps-for-missing-folder)        |
|Load the document grid after creating new record | [Mitigation steps for missing document library](#reason-and-mitigation-steps-for-missing-document-library)      | [Mitigation steps for missing folder](#reason-and-mitigation-steps-for-missing-folder) |
|Upload file   |[Mitigation steps for missing document library](#reason-and-mitigation-steps-for-missing-document-library)      | [Mitigation steps for missing folder](#reason-and-mitigation-steps-for-missing-folder) |
|Create new file/folder  |[Mitigation steps for missing document library](#reason-and-mitigation-steps-for-missing-document-library)      | [Mitigation steps for missing folder](#reason-and-mitigation-steps-for-missing-folder) |
|Add location   |[Mitigation steps for missing document library](#reason-and-mitigation-steps-for-missing-document-library)      | [Mitigation steps for missing folder](#reason-and-mitigation-steps-for-missing-folder) |
|Edit location  |[Mitigation steps for missing document library](#reason-and-mitigation-steps-for-missing-document-library)      | [Mitigation steps for missing folder](#reason-and-mitigation-steps-for-missing-folder) |

## Reason and mitigation steps for missing document library

Error message displayed for missing document library:

"Document library `<entity name>` has been renamed or deleted from SharePoint site `<SharePoint site>`. Rerun the document management wizard and try again."

- Error message in Unified Interface:

  > [!div class="mx-imgBorder"]
  > ![Error message in Unified Interface](media/error-in-unified-interface.png)

  *or*

  > [!div class="mx-imgBorder"]
  > ![Error message in Unified Interface dialog](media/error-in-unified-interface-dialog.png)

- Error message in the web client:

  > [!div class="mx-imgBorder"]
  > ![Error message in web client](media/error-in-web-client.png)

  *or*

  > [!div class="mx-imgBorder"]
  > ![Error message in web client dialog](media/error-in-web-client-dialog.png)

  Log file:

  > [!div class="mx-imgBorder"]
  > ![Error message in web client log file](media/error-in-web-client-logfile.png)

### Reason

This error typically occurs when the SharePoint document library was created for the record. Because of some changes in SharePoint, the document library doesn’t exist anymore. This can happen because the document library was deleted or moved to a different SharePoint site.

### Mitigation steps for missing document library

1.  The error message shows the name of the document library that is missing. It also shows the path where the document library is expected on the SharePoint site.

2.  Select **Settings**  -> **Document Management Settings**.

3.  Make sure the entity for the document library found from step 1 is selected and a valid SharePoint URL is specified.

4.  Complete the Document Management Settings wizard.

5.  The last step of wizard should have the status of document library as succeeded.

      > [!div class="mx-imgBorder"]
      > ![Error message in web client](media/doc-library-create-succeed.png)

6.  Once complete, verify that document library is now present on the SharePoint site in the path shown in the error message.

7.  Launch the application and repeat the operation that produced the error.


## Reason and mitigation steps for missing folder

Error message displayed for missing folder:

  "Folder "`<folder name>`" has been renamed or deleted from SharePoint. It was expected inside "`<folder path>`" path. Restore the folder on SharePoint and try again.

- Error message when the entity-based folder structure is not enabled.

  Folder path is `../<entity name>/<record name>`

  - Error message in Unified Interface:

    > [!div class="mx-imgBorder"]
    > ![Folder error in Unified Interface](media/folder-error1-in-unified-interface.png)

    *or*

    > [!div class="mx-imgBorder"]
    > ![Error message in Unified Interface dialog](media/folder-error1-in-unified-interface-dialog.png)

  - Error message in the web client:

    > [!div class="mx-imgBorder"]
    > ![Folder error in web client](media/folder-error1-in-web-client.png)

    *or*

    > [!div class="mx-imgBorder"]
    > ![Error message in Unified Interface dialog](media/missing-folder-error1-uic-dialog.png)

    Log file:

    > [!div class="mx-imgBorder"]
    > ![Error message in web client log file](media/folder-error1-in-web-client-logfile.png)

- Error message when the entity-based folder structure is enabled.

  Folder path is `../<account or contact>/<account or contact name>/<entity name>/<record name>`

  - Error message in Unified Interface:

    > [!div class="mx-imgBorder"]
    > ![Error message in Unified Interface](media/folder-error2-in-unified-interface.png)

    *or*

    > [!div class="mx-imgBorder"]
    > ![Error message in Unified Interface](media/folder-error2-in-unified-interface-dialog.png)

  - Error message in the web client:

    > [!div class="mx-imgBorder"]
    > ![Error message in web client](media/folder-error2-in-web-client.png)

    *or*

    > [!div class="mx-imgBorder"]
    > ![Error message in web client](media/missing-folder-error1-uic-dialog.png)

    Log file:

    > [!div class="mx-imgBorder"]
    > ![Error message in web client log file](media/folder-error2-in-web-client-dialog-logfile.png)

### Reason

This error typically occurs when the SharePoint folder was created for the record. Because of a change in SharePoint, the folder doesn’t exist anymore. This can happen because the folder for this record was either renamed, deleted, or moved to different location.

### Mitigation steps for missing folder

1.  The error message shows the name of the folder which is missing. It also shows the path where the folder was expected on the SharePoint site. Navigate to this path in SharePoint.

2.	Create a new folder on SharePoint with the name the same as the folder name provided in error message.

3.	Once complete, verify that folder is now present on the SharePoint site in the path shown in the error message.

4.	Launch the application and repeat the operation that produced the error.


### See also
[Known issues with document management](doc-management-known-issues.md) 


[!INCLUDE[footer-include](../includes/footer-banner.md)]
