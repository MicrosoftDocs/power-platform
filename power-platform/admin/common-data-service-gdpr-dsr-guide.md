---
title: Responding to DSR requests for Microsoft Dataverse customer data | Microsoft Docs
description: Walkthrough of how to respond to DSR requests for Microsoft Dataverse customer data
author: jimholtz
ms.reviewer: paulliew
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/03/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Responding to Data Subject Rights (DSR) requests for Microsoft Dataverse customer data

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

## Introduction to DSR requests
The European Union (EU) General Data Protection Regulation (GDPR) gives rights to people (known in the regulation as *data subjects*) to manage the personal data that's been collected by an employer or other type of agency or organization (known as the *data controller* or just *controller*). Personal data is defined very broadly under the GDPR as any data that relates to an identified or identifiable natural person. The GDPR gives data subjects the right to do the following, as it pertains to their personal data:

* Obtain copies
* Request corrections
* Restrict processing
* Delete it
* Receive it in electronic format so it can be moved to another controller

A formal request by a data subject to a controller to take an action on his or her personal data is called a Data Subject Rights (DSR) request.

This article describes how Microsoft is preparing for the GDPR, and also provides examples of steps you can take to support GDPR compliance when using Power Apps, Power Automate, and Dataverse. You'll learn how to use Microsoft products, services, and administrative tools to help controller customers find, access, and act on personal data in the Microsoft cloud in response to DSR requests.

The following actions are covered in this article:

* **Discover** — Use search and discovery tools to more easily find customer data that may be the subject of a DSR request. Once potentially responsive documents are collected, you can perform one or more of the following DSR actions to respond to the request. Alternatively, you may determine that the request doesn't meet your organization's guidelines for responding to DSR requests.

* **Access** — Retrieve personal data that resides in the Microsoft cloud and, if requested, make a copy of that data available to the data subject.

* **Rectify** — Make changes or implement other requested actions on the personal data, where applicable.

* **Restrict** — Restrict the processing of personal data, either by removing licenses for various online services or turning off the desired services where possible. You can also remove data from the Microsoft cloud and retain it on-premises or at another location.

* **Delete** — Permanently remove personal data that resides in the Microsoft cloud.

* **Export** — Provide an electronic copy (in a machine-readable format) of personal data to the data subject.

## Dataverse customer data

> [!IMPORTANT]
> Applies to both Dataverse and the previous version of Dataverse.

Dataverse and the previous version of Dataverse have separate processes for interacting with personal data.

You can identify which type of Dataverse environment you have by logging into [Power Apps](https://make.powerapps.com) and following these steps:

1. In the **Environment** drop-down list, select your environment.
2. In the navigation pane, select **Data**, and then select **Entities**.

    Your environment is Dataverse if you see the following entities listed:

    ![Power Apps Entities list](./media/common-data-service-gdpr-dsr-guide/powerapps-entities-list.png)

    Your environment is the previous version of Dataverse if you see the following entities listed:

    ![Power Apps Legacy Entities list](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-list.png)

After you determine which type of Dataverse environment you have, follow the steps in the following sections to identify personal data.

> [!NOTE]
> You may have some environments in Dataverse and others in the previous version of Dataverse, so you'll need to repeat the processes outlined below for each environment in your organization.

## User personal data in Dataverse

### Prerequisites

You must create users in the Microsoft 365 admin center and assign them an appropriate user license and security role before they can access and use Dataverse.

Standard user personal data (for example, UserName, UserID, Phone, Email, and Address) is kept and maintained in the Microsoft 365 admin center. System administrators can update this personal data only in the Microsoft 365 admin center, and the data is then automatically synced to the Dataverse system User entity in all environments. System administrators can also create custom attributes to capture additional user personal data within the Dataverse system User entity, and then manually maintain and manage these attributes.

To avoid interruption to business applications that may be critical to your organization's operations, a user's records are not automatically removed from the Dataverse system User entity when that user is deleted from within the Microsoft 365 admin center. The user's status is set to Disabled in Dataverse, but a Dataverse System Administrator must locate and remove the user's personal data from Dataverse within the application.

Only Global admin and Dataverse System Administrators can perform the discover, rectify, export, and delete actions listed below.

### Discover
System Administrators can create multiple Dataverse environments. These environments can be used for trial, development, or production purposes. Each of these environments has a copy of the system User entity with any custom attributes that may have been added by the system administrator, as well as the user personal data synced from the Microsoft 365 admin center.

System administrators can find a list of all the Dataverse environments by navigating to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

You can find personal data from Dataverse users within the following resources:

|Resource | Purpose | Website access | Programmatic access  |
| --- | --- | --- | ---  |
| Entity record | Known as the system User entity, it stores a user's personal data. | [Power Platform admin center](https://admin.powerplatform.microsoft.com/) | Through the [Web API](https://docs.microsoft.com/powerapps/developer/common-data-service/webapi/update-delete-entities-using-web-api#basic-update)  |
| Audit history | Allows customers to identify resources that users created, accessed, changed, or deleted at an entity level. | [Power Platform admin center](https://admin.powerplatform.microsoft.com/) | Through the [Web API](https://docs.microsoft.com/powerapps/developer/common-data-service/webapi/update-delete-entities-using-web-api#basic-update)  |

#### User
User personal data is stored in the Azure Active Directory and is automatically synced to all Dataverse environments. System administrators cannot update this personal data directly in Dataverse while the user is active&mdash;they must update the data from within the Microsoft 365 admin center. System administrators can add personal data (for example, custom attributes) directly to Dataverse, but they must manually manage this data.

To find a user and his or her personal data, go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Go to **Settings** > **Security** > **Users**.

4. Enter the name of the user in the **Search** box, and then select **Search**.

5. To view the user's personal data, double-click or double-tap the user's name.

    ![Power Apps User Form](./media/common-data-service-gdpr-dsr-guide/powerapps-user-form.png)

#### Audit history
When [audit tracking](audit-data-user-activity.md) is enabled for an entity in Dataverse, a user's personal data is logged in the audit history along with the actions that the user performs.

### Rectify
If a data subject asks you to rectify the personal data that resides in your organization's data, you and your organization must determine whether it's appropriate to honor the request. Rectifying data may include editing, redacting, or removing personal data from a document or other type of item.

You can use Azure Active Directory to manage the identities (personal data) of your users within Dataverse. Enterprise customers can manage DSR rectify requests by using the limited editing features within a given Microsoft service. As a data processor, Microsoft does not offer the ability to correct system-generated logs, because they reflect factual activities and constitute a historical record of events within Microsoft services. See [GDPR: Data Subject Requests (DSRs)](https://servicetrust.microsoft.com/ViewPage/GDPRDSR) for details.

Once a user record is deleted from Azure Active Directory, System Administrators can then remove any remaining personal data related to that user (such as custom attributes) from all the environments.  

### Export

#### System user
You can export a user's personal data stored in the system User entity to Excel from the user list within the administration center.

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

    ![Power Apps Audit History Menu](./media/common-data-service-gdpr-dsr-guide/powerapps-audit-history-menu.png)

4. Locate the user audit record, and then press Alt+PrtScn to take the screenshot.

    ![Power Apps Audit History Details](./media/common-data-service-gdpr-dsr-guide/powerapps-audit-history-details.png)

5. Save the screenshot to a file, which you can then send to the DSR requestor.

### Delete

#### User
To avoid interruption to business applications that may be critical to your organization's operations, a user's records are not automatically removed from the Dataverse system User entity when that user is deleted from within the Microsoft 365 admin center. The user's status is set to Disabled in Dataverse, but a Dataverse System Administrator must locate and remove the user's personal data from Dataverse within the application.

#### Remove a user's personal data from the user's Summary page
When a user record is deleted from the Azure Active Directory, the following message is displayed on the user's Summary page:

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

#### Remove audit history from the Audit Summary View page

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Go to **Settings** > **Audit and logs**, and then select **Audit Summary View**.

4. Locate the user's change history, select the check box next to the row(s), and then select **Delete Change History**.

## Personal data stored in databases of Dataverse

### Prerequisites
You may be storing personal data from individuals (such as your own customers) within your Dataverse entities.  

Dataverse System Administrators are responsible for maintaining an inventory of where personal data is being stored within various entities for each individual so that he or she can locate that data in response to any DSR requests.  

Personal data can then be exported, rectified, or deleted in an entity using the in-product functionality.  

### Discover
When Dataverse System Administrators receive a DSR request from an individual, they must identify which environments/Dataverse environments contain personal data for that individual. Personal data is typically stored in key entities (for example, Account, Contact, Lead, Opportunity, etc.), but it's your responsibility to develop policies and procedures for maintaining an inventory of where you store each individual's personal data so you're prepared to respond to DSR requests.

Using an inventory, Dataverse System Administrators can configure the search entities and fields and then access the Dataverse environment to discover personal data. For more information, see [Configure Relevance Search](https://go.microsoft.com/fwlink/?linkid=872506).

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Select **Relevance Search**.

    ![Power Apps Relevance Search Menu](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-menu.png)

4. Enter the individual's personal data in the search box, and then select **Search**.

    ![Power Apps Relevance Search Results](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-results.png)

### Rectify
Dataverse System Administrators can update an individual's personal data by using the list of results from the  Relevance Search. However, an individual's personal data may also be stored in other custom entities. Dataverse System Administrators are responsible for maintaining an inventory of these other custom entities and making the appropriate updates to an individual's personal data.

From the Relevance Search results, do the following:

1. Select an item that contains the individual's personal data.

2. Update the individual's personal data where appropriate, and then select **Save**.

    ![Power Apps Account details](./media/common-data-service-gdpr-dsr-guide/powerapps-account-details.png)

### Export

You can take a screenshot of the data and share it with your DSR requestor.

From the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), do the following:

1. Select **Environments**, and then select an environment from the list.

2. Select **Open environment**.

3. Select **Relevance Search**.

    ![Power Apps Relevance Search Menu](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-menu.png)

4. Enter the individual's personal data in the search box, and then select **Search**.

    ![Power Apps Relevance Search Results](./media/common-data-service-gdpr-dsr-guide/powerapps-relevance-search-results.png)

5. Double-click the item in the search results list.

6. Press Alt+PrtScn to take the screenshot.

7. Save the screenshot to a file, which you can then send to the DSR requestor.

### Delete

Dataverse System Administrators can delete an individual's personal data from records where that data is stored.  The Dataverse System Administrator can choose to either delete the record where the personal data is stored, or remove the contents of the personal data from the record.  

> [!NOTE]
> Dataverse administrators can customize an environment to prevent a record from being deleted from an entity. If configured in this way, you'll have to remove the contents of the personal data from the record rather than delete the record itself.

From the Relevance Search results, to the following:

1. Select an item that contains the individual's personal data.

2. In the ribbon, select **Delete**. (Note that **Delete** is disabled if the record cannot be deleted).

    ![Power Apps Account delete](./media/common-data-service-gdpr-dsr-guide/powerapps-account-delete.png)

## Personal data stored in databases of the previous version of Dataverse

### Prerequisites
You may be storing personal data from individuals (such as your own customers) within your Dataverse entities.  

Dataverse System Administrators are responsible for maintaining an inventory of where personal data is being stored within various entities for each individual so that he or she can locate that data in response to any DSR requests.  

Personal data can then be exported, rectified, or deleted in an entity using the in-product functionality.  

### Discover
When Dataverse System Administrators receives a DSR request from an individual, they must identify which environments/Dataverse environments contain personal data from that individual. Personal data is typically stored in key entities (for example, Account, Contact, Lead, Opportunity, etc.), but it's your responsibility to develop policies and procedures for maintaining an inventory of where you store each individual's personal data so you're prepared to respond to DSR requests.

You can find personal data from users of the previous version of Dataverse within the following resources:

|Resource | Purpose | Website access | Programmatic access |
| --- | --- | --- | --- |
|Entity records    | Captures business transactions in the respective business entity. | [Power Apps](https://make.powerapps.com) |  No |

#### Entity records
An individual's personal data can be stored in any business entity.

This version of the Dataverse contains its own database schema and infrastructure. It has its own entities, and you manage these entities in [Power Apps](https://make.powerapps.com).

To see a list of your entities, do the following:

1. In the **Environment** drop-down list, select your environment.

2. In the navigation pane, select **Data**, and then select **Entities**.

    ![Power Apps Legacy Entities](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities.png)

3. From the list of entities, select an entity (for example, the Account entity), as shown below.

    ![Power Apps Legacy Entities details list](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

4. Select the **Data** tab. A list of records for the entity displays.

    ![Power Apps Legacy Account data](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-account-data.png)

5. Select **Export data**.

6. When the export is complete, select **Open in Excel**, and then select **Enable editing**.

7. Select the search button, enter the individual's personal data in the search box, and then select **Search**.

8. Using your inventory list, repeat the above steps for each of the business entities to discover all of the individual's personal data.

### Rectify
If a data subject asks you to rectify the personal data that resides in your organization's data, you and your organization must determine whether it's appropriate to honor the request. Rectifying data may include editing, redacting, or removing personal data from a document or other type of item.

You can use Azure Active Directory to manage the identities (personal data) of your users within the previous version of Dataverse. Enterprise customers can manage DSR rectify requests by using the limited editing features within a given Microsoft service. As a data processor, Microsoft does not offer the ability to correct system-generated logs, because they reflect factual activities and constitute a historical record of events within Microsoft services. See [GDPR: Data Subject Requests (DSRs)](https://servicetrust.microsoft.com/ViewPage/GDPRDSR) for details.

To rectify personal data that resides in the Dataverse environment, you can export the entity data into an Excel spreadsheet, update it, and then import the updates back to the database.

Dataverse System Administrators are responsible for identifying all entities that contain personal data for an individual and repeating the following steps for each of those entities.

From [Power Apps](https://make.powerapps.com), do the following:

1. In the navigation pane, select **Data**, and then select **Entities**.

    ![Power Apps Legacy Entities](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities.png)

2. From the list of entities, select an entity (for example, the Account entity), as shown below.

    ![Power Apps Legacy Entities details list](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

3. Select the **Data** tab. A list of records for the entity displays.

    ![Power Apps Legacy Account data](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-account-data.png)

4. Select **Export data**.

5. When the export is complete, select **Open in Excel**, and then select **Enable editing**.

6. In the menu bar, select **File**, select **Save As**, and then select a location in which to save the file.

7. Make the necessary personal data updates and save the spreadsheet.

10. In Power Apps, go back to the **Data** tab of the entity, and then select **Import data**.

11. Select **Search**, and then select and open the Excel spreadsheet that you just updated.

12. Select **Import**.

### Export
You can export personal data from each entity into an Excel spreadsheet and view it.

From [Power Apps](https://make.powerapps.com), do the following:

1. In the navigation pane, select **Data**, and then select **Entities**.

    ![Power Apps Legacy Entities](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities.png)

2. From the list of entities, select the entity that you want to export and view (for example, the Account entity), as shown below.

    ![Power Apps Legacy Entities details list](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

3. Select the **Data** tab. A list of records for the entity displays.

    ![Power Apps Legacy Account data](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-account-data.png)

4. Select **Export data**.

    The export operation runs in the background and you'll be notified when it's complete.

5. To view the exported data, select **Open in Excel**.

### Delete
You can delete personal data that's stored in entities by using the Export/Import data feature.

Dataverse System Administrators are responsible for identifying all entities that contain personal data for an individual and repeating the following steps for each of those entities.

From [Power Apps](https://make.powerapps.com), do the following:

1. In the navigation pane, select **Data**, and then select **Entities**.

    ![Power Apps Legacy Entities](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities.png)

2. From the list of entities, select the entity from which you want to remove personal data (for example, the Account entity), as shown below.

    ![Power Apps Legacy Entities details list](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-entities-details-list.png)

3. Select the **Data** tab. A list of records for the entity displays.

    ![Power Apps Legacy Account data](./media/common-data-service-gdpr-dsr-guide/powerapps-legacy-account-data.png)

4. Select **Export data**.

5. When the export is complete, select **Open in Excel**, and then select **Enable editing**.

6. In the menu bar, select **File**, select **Save As**, and then select a location in which to save the file.

7. Delete the rows containing the personal data that you want to remove from the entity and save the spreadsheet.

10. In Power Apps, go back to the **Data** tab of the entity, and then select **Import data**.

11. Select **Search**, and then select and open the Excel spreadsheet that you just updated.

12. Select **Import**.
