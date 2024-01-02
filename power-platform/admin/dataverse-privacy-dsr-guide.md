---
title: Responding to DSR requests for Microsoft Dataverse customer data | Microsoft Docs
description: Walkthrough of how to respond to DSR requests for Microsoft Dataverse customer data
author: sericks007
ms.reviewer: kvivek
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/19/2022
ms.subservice: admin
ms.author: paulliew
search.audienceType: 
  - admin
---

# Responding to Data Subject Rights (DSR) requests for Microsoft Dataverse customer data

[!INCLUDE [gdpr-intro](~/../shared-content/shared/privacy-includes/gdpr-intro.md)]

This article provides examples of steps you can take to support privacy compliance when using Power Apps, Power Automate, and Dataverse. You'll learn how to use Microsoft products, services, and administrative tools to help controller customers find, access, and act on personal data in the Microsoft cloud in response to Data Subject Rights (DSR) requests.

The following actions are covered in this article:

- **Discover** — Use search and discovery tools to more easily find customer data that may be the subject of a DSR request. Once potentially responsive documents are collected, you can perform one or more of the following DSR actions to respond to the request. Alternatively, you may determine that the request doesn't meet your organization's guidelines for responding to DSR requests.

- **Access** — Retrieve personal data that resides in the Microsoft cloud and, if requested, make a copy of that data available to the data subject.

- **Rectify** — Make changes or implement other requested actions on the personal data, where applicable.

- **Restrict** — Restrict the processing of personal data, either by removing licenses for various online services or turning off the desired services where possible. You can also remove data from the Microsoft cloud and retain it on-premises or at another location.

- **Delete** — Permanently remove personal data that resides in the Microsoft cloud.

- **Export** — Provide an electronic copy (in a machine-readable format) of personal data to the data subject.

## Dataverse customer data

> [!IMPORTANT]
> Applies to both Dataverse and the previous version of Dataverse.

Dataverse and the previous version of Dataverse have separate processes for interacting with personal data.

You can identify which type of environment you have by logging into [Power Apps](https://make.powerapps.com) and following these steps:

1. In the **Environment** drop-down list, select your environment.
2. In the navigation pane, select **Dataverse**, and then select **Tables**.

    Your environment is Dataverse if you see the following tables listed:

    ![Power Apps tables list.](./media/common-data-service-gdpr-dsr-guide/powerapps-entities-list.png)

After you determine which type of environment you have, follow the steps in the following sections to identify personal data.

> [!NOTE]
> You may have some environments in Dataverse and others in the previous version of Dataverse, so you'll need to repeat the processes outlined below for each environment in your organization.

## User personal data in Dataverse

### Prerequisites

You must create users in the Microsoft 365 admin center and assign them an appropriate user license and security role before they can access and use Dataverse.

Standard user personal data (for example, UserName, UserID, Phone, Email, and Address) is kept and maintained in the Microsoft 365 admin center. System administrators can update this personal data only in the Microsoft 365 admin center, and the data is then automatically synced to the Dataverse system User table in all environments. System administrators can also create custom attributes to capture additional user personal data within the Dataverse system User table, and then manually maintain and manage these attributes.

To avoid interruption to business applications that may be critical to your organization's operations, a user's rows are not automatically removed from the Dataverse system User table when that user is deleted from within the Microsoft 365 admin center. The user's status is set to Disabled in Dataverse, but a Dataverse System Administrator must locate and remove the user's personal data from Dataverse within the application.

Only Global admin and Dataverse System Administrators can perform the discover, rectify, export, and delete actions listed below.

### Discover
System Administrators can create multiple environments. These environments can be used for trial, development, or production purposes. Each of these environments has a copy of the system User table with any custom attributes that may have been added by the system administrator, as well as the user personal data synced from the Microsoft 365 admin center.

System administrators can find a list of all the environments by navigating to the Microsoft [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

You can find personal data from Dataverse users within the following resources:

|Resource | Purpose | Website access | Programmatic access  |
| --- | --- | --- | ---  |
| Table row | Known as the system User table, it stores a user's personal data. | [Power Platform admin center](https://admin.powerplatform.microsoft.com/) | Through the [Web API](/powerapps/developer/common-data-service/webapi/update-delete-entities-using-web-api#basic-update)  |
| Audit history | Allows customers to identify resources that users created, accessed, changed, or deleted at an table level. | [Power Platform admin center](https://admin.powerplatform.microsoft.com/) | Through the [Web API](/powerapps/developer/common-data-service/webapi/update-delete-entities-using-web-api#basic-update)  |

#### User
User personal data is stored in the Microsoft Entra and is automatically synced to all environments with a Dataverse database. System administrators cannot update this personal data directly in Dataverse while the user is active&mdash;they must update the data from within the Microsoft 365 admin center. System administrators can add personal data (for example, custom attributes) directly to Dataverse, but they must manually manage this data.

To find a user and their personal data, go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and do the following:

1. Select **Environments**, and then select an environment from the list.

2. Go to **Settings** > **Users + permissions** > **Users**.

3. Enter the name of the user in the **Search** box, and select **Enter**.

4. To view the user's personal data, select the user's name by clicking or double-tapping.

5. To make changes to the Contact Information, expand on the ellipse and click **Manage user in Dynamics 365**

    ![Power Apps User Form.](./media/common-data-service-gdpr-dsr-guide/powerapps-user-form.png)

#### Audit history
When [audit tracking](manage-dataverse-auditing.md) is enabled for a table in Dataverse, a user's personal data is logged in the audit history along with the actions that the user performs.

### Rectify
If a data subject asks you to rectify the personal data that resides in your organization's data, you and your organization must determine whether it's appropriate to honor the request. Rectifying data may include editing, redacting, or removing personal data from a document or other type of item.

You can use Microsoft Entra to manage the identities (personal data) of your users within Dataverse. Enterprise customers can manage DSR rectify requests by using the limited editing features within a given Microsoft service. As a data processor, Microsoft does not offer the ability to correct system-generated logs, because they reflect factual activities and constitute a historical record of events within Microsoft services.

Once a user row is deleted from Microsoft Entra ID, System Administrators can then remove any remaining personal data related to that user (such as custom attributes) from all the environments.  

### Export

#### System user
You can export a user's personal data stored in the system User table to Excel from the user list within the administration center.

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Go to **Settings** > **Security**, and then select **Enabled Users View**.

4. Select **Export to Excel**.

#### Audit history
You can take screenshots of the audit history from within the administration center.

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Go to **Settings** > **Audit and logs**, and then select **Audit Summary View**.

    ![Power Apps Audit History Menu.](./media/common-data-service-gdpr-dsr-guide/powerapps-audit-history-menu.png)

4. Locate the user audit record, and then press Alt+PrtScn to take the screenshot.

    ![Power Apps Audit History Details.](./media/common-data-service-gdpr-dsr-guide/powerapps-audit-history-details.png)

5. Save the screenshot to a file, which you can then send to the DSR requestor.

### Delete

#### User
To avoid interruption to business applications that may be critical to your organization's operations, a user's records are not automatically removed from the Dataverse system User table when that user is deleted from within the Microsoft 365 admin center. The user's status is set to Disabled in Dataverse, but a Dataverse System Administrator must locate and remove the user's personal data from Dataverse within the application or delete the user from each environment. You can remove the user's personal data or [permanently delete the user](/power-platform/admin/delete-users#permanently-delete-users-in-power-platform).

#### Remove a user's personal data from the user's Summary page
When a user record is deleted from the Microsoft Entra, the following message is displayed on the user's Summary page:

*This user's information is no longer managed by Office 365. You can update this record to respond to DSR requests by removing or replacing all personal data associated with this user.*

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Go to **Settings** > **Security** > **Users**, and then select **Disabled Users View**.

4. Enter the name of the user in the **Search** box, and then select **Search**.

9. Double-click the user's name in the search results list.

10. On the user's Summary page, remove all personal data, and then select **Save**.

#### Remove a user's personal data by using Excel

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Go to **Settings** > **Security** > **Users**, and then select **Disabled Users View**.

4. Create and download an Excel template file from the user's personal data. For step-by-step instructions, see [Create a new Excel template](analyze-your-data-with-excel-templates.md#create-a-new-excel-template).

8. Open the downloaded Excel template file, remove the user's personal data, and then save the file.

9. Return to the **Disabled Users View** page and select **Import Data**.

10. Select the Excel template file in the **Upload data file** dialog box and make all the necessary changes in the **Map Fields** window.

12. Select **Next**, and then select **Submit**.

#### Permanently delete user
You can either remove user's personal data or permanently delete the user record from the Datavese user table. More information: [Permanently delete users in Power Platform](/power-platform/admin/delete-users#permanently-delete-users-in-power-platform). 

When the user record is permanently deleted, the user's name in all records where the deleted user was the creator or last modified by and in the audit logs will show as **No Name**.

#### Remove audit history from the Audit Summary View page

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Go to **Settings** > **Audit and logs**, and then select **Audit Summary View**.

4. Locate the user's change history, select the check box next to the row(s), and then select **Delete Change History**.

## Personal data stored in databases of Dataverse

### Prerequisites
You may be storing personal data from individuals (such as your own customers) within your Dataverse tables.  

Dataverse System Administrators are responsible for maintaining an inventory of where personal data is being stored within various tables for each individual so that they can locate that data in response to any DSR requests.  

Personal data can then be exported, rectified, or deleted in a table using the in-product functionality.  

### Discover
When Dataverse System Administrators receive a DSR request from an individual, they must identify which environments/environments with a Dataverse database contain personal data for that individual. Personal data is typically stored in key tables (for example, Account, Contact, Lead, Opportunity, etc.), but it's your responsibility to develop policies and procedures for maintaining an inventory of where you store each individual's personal data so you're prepared to respond to DSR requests.

Using an inventory, Dataverse System Administrators can configure the search tables and fields and then access the environment to discover personal data. For more information, see [Configure Relevance Search](/previous-versions/dynamicscrm-2016/administering-dynamics-365/mt723654(v=crm.8)).

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Select **Dataverse search**.

    ![Power Apps Dataverse search Menu.](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-menu.png)

4. Enter the individual's personal data in the search box, and then select **Search**.

    ![Power Apps Dataverse search Results.](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-results.png)

### Rectify
Dataverse System Administrators can update an individual's personal data by using the list of results from the Dataverse search. However, an individual's personal data may also be stored in other custom tables. Dataverse System Administrators are responsible for maintaining an inventory of these other custom tables and making the appropriate updates to an individual's personal data.

From the Dataverse search results, do the following:

1. Select an item that contains the individual's personal data.

2. Update the individual's personal data where appropriate, and then select **Save**.

    ![Power Apps Account details.](./media/common-data-service-gdpr-dsr-guide/powerapps-account-details.png)

### Export

You can take a screenshot of the data and share it with your DSR requestor.

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Select **Dataverse search**.

    ![Power Apps Dataverse search Menu.](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-menu.png)

4. Enter the individual's personal data in the search box, and then select **Search**.

    ![Power Apps Dataverse search Results.](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-results.png)

5. Double-click the item in the search results list.

6. Press Alt+PrtScn to take the screenshot.

7. Save the screenshot to a file, which you can then send to the DSR requestor.

### Delete

Dataverse System Administrators can delete an individual's personal data from records where that data is stored.  The Dataverse System Administrator can choose to either delete the record where the personal data is stored, or remove the contents of the personal data from the record.  

> [!NOTE]
> Dataverse administrators can customize an environment to prevent a record from being deleted from an table. If configured in this way, you'll have to remove the contents of the personal data from the record rather than delete the record itself.

From the Dataverse search results, to the following:

1. Select an item that contains the individual's personal data.

2. In the ribbon, select **Delete**. (Note that **Delete** is disabled if the record cannot be deleted).

    ![Power Apps Account delete.](./media/common-data-service-gdpr-dsr-guide/powerapps-account-delete.png)

## Personal data stored in databases of the previous version of Dataverse

### Prerequisites
You may be storing personal data from individuals (such as your own customers) within your Dataverse tables.  

Dataverse System Administrators are responsible for maintaining an inventory of where personal data is being stored within various tables for each individual so that they can locate that data in response to any DSR requests.  

Personal data can then be exported, rectified, or deleted in an table using the in-product functionality.  

### Discover
When Dataverse System Administrators receives a DSR request from an individual, they must identify which environments/environments with a Dataverse database contain personal data from that individual. Personal data is typically stored in key tables (for example, Account, Contact, Lead, Opportunity, etc.), but it's your responsibility to develop policies and procedures for maintaining an inventory of where you store each individual's personal data so you're prepared to respond to DSR requests.

You can find personal data from users of the previous version of Dataverse within the following resources:

|Resource | Purpose | Website access | Programmatic access |
| --- | --- | --- | --- |
|Table rows    | Captures business transactions in the respective business table. | [Power Apps](https://make.powerapps.com) |  No |

#### Table rows
An individual's personal data can be stored in any business table.

This version of the Dataverse contains its own database schema and infrastructure. It has its own tables, and you manage these tables in [Power Apps](https://make.powerapps.com).

To see a list of your tables, do the following:

1. In the **Environment** drop-down list, select your environment.

2. In the navigation pane, select **Dataverse**, and then select **Tables**.

    ![Power Apps tables list.](./media/common-data-service-gdpr-dsr-guide/powerapps-entities-list.png)

3. From the list of tables, select a table (for example, the Account table), as shown below.

    ![Power Apps Legacy tables details list.](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

4. On the menu bar, select **Export** > **Export data**.

5. When the export is complete, select **Download exported data**. 

6. When the export is complete, select the .zip file in the **Downloads** folder and extract the file. Open the .csv file.

7. Select the search button, enter the individual's personal data in the search box, and then select **Search**.

8. Using your inventory list, repeat the above steps for each of the business tables to discover all of the individual's personal data.

### Rectify
If a data subject asks you to rectify the personal data that resides in your organization's data, you and your organization must determine whether it's appropriate to honor the request. Rectifying data may include editing, redacting, or removing personal data from a document or other type of item.

You can use Microsoft Entra to manage the identities (personal data) of your users within the previous version of Dataverse. Enterprise customers can manage DSR rectify requests by using the limited editing features within a given Microsoft service. As a data processor, Microsoft does not offer the ability to correct system-generated logs, because they reflect factual activities and constitute a historical record of events within Microsoft services.

To rectify personal data that resides in the environment, you can export the table data into an Excel spreadsheet, update it, and then import the updates back to the database.

Dataverse System Administrators are responsible for identifying all tables that contain personal data for an individual and repeating the following steps for each of those tables.

From [Power Apps](https://make.powerapps.com), do the following:

1. In the navigation pane, select **Dataverse**, and then select **Tables**.

    ![Power Apps tables list.](./media/common-data-service-gdpr-dsr-guide/powerapps-entities-list.png)

2. From the list of tables, select a table (for example, the Account table), as shown below.

    ![Power Apps Legacy tables details list.](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

3. On the menu bar, select **Export** > **Export data**.

4. When the export is complete, select **Download exported data**. 

5. When the export is complete, select the .zip file in the **Downloads** folder and extract the file. Open the .csv file.

6. In the menu bar, select **File**, select **Save As**, and then select a location in which to save the file.

7. Make the necessary personal data updates and save the spreadsheet.

8. In Power Apps, go back to the selected table, and then select **Import** > **Import data**.

9. Select **Search**, and then select and open the Excel spreadsheet that you just updated.

10. Select **Import**.

### Export
You can export personal data from each table into an Excel spreadsheet and view it.

From [Power Apps](https://make.powerapps.com), do the following:

1. In the navigation pane, select **Dataverse**, and then select **Tables**.

    ![Power Apps tables list.](./media/common-data-service-gdpr-dsr-guide/powerapps-entities-list.png)

2. From the list of tables, select a table (for example, the Account table), as shown below.

    ![Power Apps Legacy tables details list.](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

3. On the menu bar, select **Export** > **Export data**.

4. When the export is complete, select **Download exported data**. 

5. When the export is complete, select the .zip file in the **Downloads** folder and extract the file. Open the .csv file.

### Delete
You can delete personal data that's stored in tables by using the Export/Import data feature.

Dataverse System Administrators are responsible for identifying all tables that contain personal data for an individual and repeating the following steps for each of those tables.

From [Power Apps](https://make.powerapps.com), do the following:

1. In the navigation pane, select **Dataverse**, and then select **Tables**.

    ![Power Apps tables list.](./media/common-data-service-gdpr-dsr-guide/powerapps-entities-list.png)

2. From the list of tables, select a table (for example, the Account table), as shown below.

    ![Power Apps Legacy tables details list.](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

3. On the menu bar, select **Export** > **Export data**.

4. When the export is complete, select **Download exported data**. 

5. When the export is complete, select the .zip file in the **Downloads** folder and extract the file. Open the .csv file.

6. In the menu bar, select **File**, select **Save As**, and then select a location in which to save the file.

7. Delete the rows containing the personal data that you want to remove from the table and save the spreadsheet.

8. In Power Apps, go back to the selected table, and then select **Import** > **Import data**.

9. Select **Search**, and then select and open the Excel spreadsheet that you just updated.

10. Select **Import**.



[!INCLUDE[footer-include](../includes/footer-banner.md)]