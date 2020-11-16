---
title: "Audit data and user activity for security and compliance  | MicrosoftDocs"
description: Audit data and user activity for security and compliance
author: pnghub
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/13/2020
ms.author: gned
ms.reviewer: jimholtz 

search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Audit data and user activity for security and compliance

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

The auditing feature logs changes that are made to customer records and user access so you can review the activity later. The auditing feature is designed to meet the auditing, compliance, security, and governance policies of many regulated enterprises.  
<!-- 
> [!NOTE]
> This topic describes the process for enabling and viewing activities for a specific set of entities and attributes. For a auditing at a broader entity level with multiple records, consider using Activity Logging. See [Enable and use Activity Logging](enable-use-comprehensive-auditing.md).
-->
 The audit logs help the administrator answer questions such as:  
  
- Which user was accessing the system and when?  
- Who updated this field value on this record and when?  
- What was the previous field value before it was updated?  
- What actions has this user taken recently?  
- Who deleted this record?  
- What locale was used to make the update?  
  
The following operations can be audited:  
  
- Create, update, deactivate, and delete operations on records.  
- Changes to the sharing privileges of a record.  
- The N:N association or disassociation of records.  
- Changes to security roles.  
- Audit changes at the entity, attribute, and organization level. For example, enabling audit on an entity.   
- Deletion of audit logs.  
- For changes made to entity fields that can be localized, such as the Product entity name or description fields, the locale ID (LCID) appears in the audit record.  
  
System administrators and customizers can start or stop auditing for an organization.  
  
> [!IMPORTANT]
> For Customer Engagement (on-premises), you may notice that auditing can significantly increase the size of the organization database over time. You can delete audit logs by going to **Settings** > **Auditing** > **Audit Log Management**. Additionally, you may want to stop auditing for maintenance purposes. Stopping auditing stops tracking for the organization during the period until auditing is started again. When you start auditing again, the same auditing selection is maintained that was previously used.  
  
## Start/stop auditing and set retention policy  
This task requires the system administrator or customizer security role or equivalent permissions.  
  
1. Browse to the Power Platform admin center and sign in using administrator credentials. 
  
2. Go to **Environments** > [select an environment] > **Settings** > expand **Audit and logs** > **Audit settings**.
  
   |      Setting |     Description    |
   |--------------------|---------------------|
   | Start Auditing   | Start or stop auditing.    |
   | Log access | Log whenever the system is accessed, generally by signing in  |  
   | Read logs | Logs will be sent to the [Microsoft 365 Security and Compliance Center](https://protection.office.com/homepage) |

3. You can set a retention period for how long audit logs are kept in a Microsoft Dataverse environment. Under **Retain these logs for**, choose the period of time you wish to retain the logs.

   |      Setting |     Description    |
   |--------------------|---------------------|
   | Set the retention policy for these logs   | Default: 30 days.   |
   | Set a custom retention policy | Maximum: 100,000 days  |  

   When new features are deployed, the audit retention period is set to **Forever** for all Dataverse environments with existing audit data. The default audit retention period is 30 days for new environments and existing environments without any audit data. You can also change the audit retention value using the [Dataverse Web API](https://docs.microsoft.com/powerapps/developer/common-data-service/webapi/overview). 

   Each audit log is stamped with the currently active retention period. Changing the retention period will not change already existing audit logs and is only applied to newly created audit logs. 

4. Select **Save**.
  
## Set specific areas of the product to audit

1. Browse to the Power Platform admin center and sign in using administrator credentials. 
  
2. Go to **Environments** > [select an environment] > **Settings** > expand **Audit and logs** > **Legacy audit settings**.

3. Select the entities you want to track. To start or stop auditing on specific entities, select or clear the following check boxes:  
  
  <!--  **Audit user access**. Tracks when a user accesses customer engagement apps (such as Dynamics 365 Sales and Customer Service), including the user name and time.  -->
   - **Common Entities**. Tracks common entities like Account, Contact, Goal, Product, and User.  
   - **Sales Entities**. Tracks sales-related entities like Competitor, Opportunity, Invoice, Order, and Quote.  
   - **Marketing Entities**. Tracks Campaign entity activity.  
   - **Customer Service Entities**. Tracks Case, Contract, Queue, and Service entity activity.  
  
4. Select **OK**.  

## View audit logging details  
System administrators can see activity for the entities that are enabled for audit logging.  
  
1. Browse to the Power Platform admin center and sign in using administrator credentials. 
  
2. Go to **Environments** > [select an environment] > **Settings** > expand **Audit and logs** > **Audit Summary View**.
  
3. In the **Audit Summary View**, you can do the following:  
  
   - Select **Enable/Disable Filters** to turn on filtering. Then, you can filter on a specific event, such as **Delete** actions.  
   - Choose an event to view specific details about the activity, such as field changes that were made during an update to a record and who performed the update.  
   - Select the **Refresh** button  ![Refresh button](media/html-viewer-grid-refresh.png "Refresh button") to view the most recent activity. 

> [!IMPORTANT]
> Large attribute values, such as [Email.description](https://docs.microsoft.com/powerapps/developer/common-data-service/reference/entities/email) or [Annotation](https://docs.microsoft.com/powerapps/developer/common-data-service/reference/entities/annotation), are limited (capped) at 5KB or ~5,000 characters. A capped attribute value can be recognized by three dots at the end of the text, for example, “lorem ipsum, lorem ip…”.

## Enable or disable entities and fields for auditing  
System administrators or customizers can change the default audit settings for entities and for specific fields for an entity.  
  
### Enable or disable auditing for an entity  
  
1. Browse to the Power Platform admin center and sign in using administrator credentials. 
  
2. Go to **Environments** > [select an environment] > **Settings** > expand **Audit and logs** > **Entity and Field Audit Settings**.

3. Under **Components**, expand **Entities**.  
  
4. Select the entity for which you want to enable or disable auditing.  
  
5. To start auditing, on the **General** tab, in the **Data Services** section, select the **Auditing** check box to enable auditing, or clear the **Auditing** check box to disable it.  
  
   By default, when you start or stop auditing for an entity, you also start or stop auditing for all the fields of this entity.  
  
6. Select **Save**.  
  
7. Publish the customization. To publish for a single entity, choose the entity, such as Account, and then select **Publish** on the toolbar.  
  
### Enable or disable auditing for specific fields on an entity 
  
1. Under the entity for which you want to enable or disable auditing with specific fields, select **Fields**.  
  
2. To enable or disable a single field, open the field and in the Auditing section, select **Enable** or **Disable**.  
  
   To enable or disable more than one field, select the fields you want, and then on the toolbar select **Edit**. In the **Edit Multiple Fields** dialog box, in the Auditing area, select **Enabled** or **Disabled**.  
  
3. Select **Save**.  
  
4. Publish the customization. To publish for a single entity, choose the entity, such as Account, and then select **Publish** on the Actions toolbar.  



