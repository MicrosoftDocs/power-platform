---
title: "Troubleshooting Document Management Issues | MicrosoftDocs"
description: "Learn how to troubleshoot issues with document management"
keywords: encrypt
ms.date: 05/15/2020
ms.service: powerapps
ms.custom: 
ms.topic: article
applies_to: 
  - PowerApps
ms.assetid: 
author: Mattp123
ms.author: Mansi Garg
ms.reviewer: v-iapr
ms.suite: 
ms.tgt_pltfrm: 
topic-status: Drafting
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---

# Troubleshooting Document Management Issues

This topic explains how to use information provided in error messages to fix issues with the Document Management feature.
Below is an [index](#index-of-errors) that will help you to reach the right solution. The link in each cell navigates to the reason and mitigation steps for the corresponding error message.

## Error messages

The following are error messages that are possible with Document Management.

### Error Message 1

  Document library `<entity name>` has been renamed or deleted from SharePoint site `<SharePoint site>`. Rerun the document management wizard and try again.

### Error Message 2

  Folder `<folder name>` has been renamed or deleted from SharePoint. It was expected inside `<folder path>` path. Restore the folder on SharePoint and try again.

## Index of errors

|Error | [Error Message 1](#error-message-1) | [Error Message 2](#error-message-2) |
|----------------|-----------------|-----------------|
|Error while loading the document management grid for an existing record     |  [Mitigation steps for missing document library](#mitigation-steps-for-missing-document-library)      | [Mitigation steps for missing folder](#mitigation-steps-for-missing-folder)        |

## Reason and mitigation steps for missing document library

Error message displayed for missing document library:

"Document library `<entity name>` has been renamed or deleted from SharePoint site `<SharePoint site>`. Rerun the document management wizard and try again."

- Error message in Unified Interface:

  > [!div class="mx-imgBorder"]
  > ![Error message in Unified Interface](media/error-in-unified-interface.png)

- Error message in web client:

  > [!div class="mx-imgBorder"]
  > ![Error message in web client](media/error-in-web-client.png)

### Reason

This error typically occurs when the SharePoint document library was created for the record. Because of some change on SharePoint side, the document library doesn’t exist anymore. This can happen because the document library was deleted or moved to different SharePoint site.

### Mitigation steps for missing document library

1.  The error message shows the name of the document library that is missing. It also shows the path where the document library is expected on the SharePoint site.

2.  Select **Settings**  -> **Document Management Settings**.

3.  Make sure the entity for the document library found from step 1 is selected and a valid SharePoint URL is specified.

4.  Complete the Document Management Settings wizard.

5.  The last step of wizard should have the status of document library as succeeded.

      > [!div class="mx-imgBorder"]
      > ![Error message in web client](media/doc-library-create-succeed.png)

6.  Once complete, verify that document library is now present on the SharePoint site in the path shown in the error message.

7.  Launch Dynamics 365 and repeat the operation that produced the error.


## Reason and mitigation steps for missing folder

### Error message displayed

Error message displayed for missing document library:

  "Folder `<folder name>` has been renamed or deleted from SharePoint site `<SharePoint site>`. Restore the folder on SharePoint and try again."

- Error message when the entity-based folder structure is not enabled.

  Folder path is `../<entity name>/<record name>`

  - Error message in Unified Interface:

    > [!div class="mx-imgBorder"]
    > ![Error message in Unified Interface](media/folder-error1-in-unified-interface.png)

  - Error message in web client:

    > [!div class="mx-imgBorder"]
    > ![Error message in web client](media/folder-error1-in-web-client.png)

- Error message when the entity-based folder structure is enabled.

  Folder path is `../account/<account name>/<entity name>/<record name>`

  - Error message in Unified Interface:

    > [!div class="mx-imgBorder"]
    > ![Error message in Unified Interface](media/folder-error2-in-unified-interface.png)

  - Error message in web client:

    > [!div class="mx-imgBorder"]
    > ![Error message in web client](media/folder-error2-in-web-client.png)

### Reason

This error typically occurs when the SharePoint Folder was created for the record. Because of a change on SharePoint the folder doesn’t exist anymore. This can happen because the folder for this record was either renamed, deleted, or moved to different location.

### Mitigation steps for missing folder

1.  The error message shows the name of the folder which is missing. It also shows the path where the folder was expected on SharePoint site. Navigate to this path on SharePoint.

2.	Create a new folder on SharePoint with the name the same as the folder name provided in error message.

3.	Once complete, verify that folder library is now present on the SharePoint site in the path shown in the error message.

4.	Launch Dynamics 365 and repeat the operation that produced the error.


### See also
[Known issues with document management](doc-management-known-issues.md) 
