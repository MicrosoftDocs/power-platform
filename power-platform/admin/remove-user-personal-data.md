---
title: "Remove user personal data  | MicrosoftDocs"
description: Remove user personal data
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/05/2018
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Remove user personal data

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

After a user is deleted by the global admin from the Microsoft 365 admin center, the user's personal data can be removed from all tenant instances. A user is deleted from the Microsoft 365 admin center when:

1. The user leaves the company. In this scenario, the user record remains in the tenant’s Active Directory for 30 days before the record is deleted.

   -Or-

2. The user requests their personal data be deleted. The user record is deleted immediately.

Once the user record is deleted from Active Directory, Dynamics 365 for Customer Engagement apps system admins can remove the user's personal data from all instances.

## Remove user personal data via User form

When the user record is deleted from Active Directory, the following message is displayed on the User form:

"This user’s information is no longer managed by Office 365. You can update this record to comply with the GDPR by removing or replacing all personal data."

To remove personal data:

1. Click **Settings** > **Security** > **Users**.
2. Select **Disabled Users** view.
3. Select a user.
5. Remove personal data, and then click **Save**.

## Remove user personal data via Excel Import/Export

1. Click **Settings** > **Security** > **Users**.
2. Select **Disabled Users** view.
3. Create an [Excel template](analyze-your-data-with-excel-templates.md#create-a-new-excel-template) with all the user personal data columns that you want to update.  
4. Click on **Download File**.
5. Open the downloaded Excel file, make your updates, and then save the file.
6. Return to the **Disabled Users** view window and click **Import Data**.
7. Choose your updated Excel in the Upload data file dialog box.
8. Make all the necessary changes on the **Map Fields** window.
9. Click **Next** and **Submit**.

## Remove user personal data using Web services

You can also update the data for a disabled user using the Web API or Organization service. The user information is stored in the [SystemUser](https://docs.microsoft.com/powerapps/developer/common-data-service/reference/entities/systemuser) entity, and you can update data in any of the [writeable attributes](https://docs.microsoft.com/powerapps/developer/common-data-service/reference/entities/systemuser#writable-attributes) in the SystemUser entity. For examples about updating data in a record, see: 

- [Update and delete entities using the Web API](../developer/webapi/update-delete-entities-using-web-api.md)
- [Use the Entity class for create, update and delete](../developer/org-service/use-entity-class-create-update-delete.md)

### See also
[Analyze and share your data with Excel templates](analyze-your-data-with-excel-templates.md)<br/>
