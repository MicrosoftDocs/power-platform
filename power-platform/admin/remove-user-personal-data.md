---
title: "Remove user personal data  | MicrosoftDocs"
description: Remove user personal data
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/30/2020
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Remove user personal data

After a user is deleted by the global admin from the Microsoft 365 admin center, the user's personal data can be removed from all tenant environments. A user is deleted from the Microsoft 365 admin center when:

1. The user leaves the company. In this scenario, the user record remains in the tenant's Active Directory for 30 days before the record is deleted.

   -Or-

2. The user requests their personal data be deleted. The user record is deleted immediately.

Once the user record is deleted from Active Directory, system admins can remove the user's personal data from all environments.

## Remove user personal data via User form

When the user record is deleted from Active Directory, the following message is displayed on the User form:

"This user's information is no longer managed by Microsoft 365. You can update this record to comply with the GDPR by removing or replacing all personal data."

To remove personal data:

1. In the Power Platform admin center, select an environment. 
2. Select **Settings** > **Users + permissions** > **Users**.  
3. Select a user.
4. Remove personal data, and then select **Save**.

## Remove user personal data via Excel Import/Export

1. From a customer engagement app, select **Settings** (![Gear button.](media/selection-rule-gear-button.png "Gear button")) on the navigation bar. 
2. Select **Advanced Settings**.
3. Select **Settings** > **Security** > **Users**.
4. Create an [Excel template](analyze-your-data-with-excel-templates.md#create-a-new-excel-template) with all the user personal data columns that you want to update.  
5. Select on **Download File**.
6. Open the downloaded Excel file, make your updates, and then save the file.
7. Return to the **Disabled Users** view window and select **Import Data**.
8. Choose your updated Excel in the Upload data file dialog box.
9. Make all the necessary changes on the **Map Fields** window.
10. Select **Next** and **Submit**.

## Remove user personal data using Web services

You can also update the data for a disabled user using the Web API or Organization service. The user information is stored in the [SystemUser](/powerapps/developer/common-data-service/reference/entities/systemuser) table, and you can update data in any of the [writeable attributes](/powerapps/developer/common-data-service/reference/entities/systemuser#writable-attributes) in the SystemUser table. For examples about updating data in a record, see: 

- [Update and delete entities using the Web API](/powerapps/developer/common-data-service/webapi/update-delete-entities-using-web-api)
- [Use the Entity class for create, update and delete](/powerapps/developer/common-data-service/org-service/entity-operations-update-delete)

### See also
[Analyze and share your data with Excel templates](analyze-your-data-with-excel-templates.md)<br/>


[!INCLUDE[footer-include](../includes/footer-banner.md)]
