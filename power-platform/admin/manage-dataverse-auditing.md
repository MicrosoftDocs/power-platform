---
title: Manage Dataverse auditing
description: Configure Dataverse auditing to log changes to customer records, user access, operations on records, and security roles. This feature meets external and internal auditing, compliance, security, and governance policies.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/20/2023
author: paulliew 
ms.subservice: admin
ms.author: paulliew 
ms.reviewer: matp 
contributors: 
    - ProfessorKendrick
search.audienceType: 
  - admin
---

# Manage Dataverse auditing

The Dataverse auditing feature is designed to meet the external and internal auditing, compliance, security, and governance policies that are common to many enterprises. Dataverse auditing logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment.

Dataverse auditing is supported on all custom and most customizable tables and columns. Audit logs are stored in Dataverse and consume log storage capacity. Audit logs can be viewed in the Audit History tab for a single record and in the Audit Summary view for all audited operations in a single environment. Audit logs can also be retrieved using the Web API or the SDK for .NET.

> [!NOTE]
> The use of entity-related terminology depends on the protocol or class library used. See [Terminology use depending on protocol or technology](/power-apps/developer/data-platform/understand-terminology).
>
> Audit logs may show up with a delay in the Audit History tab of a record and in the Audit Summary view. This is because audit logs are stored in the Dataverse log storage and no longer in the database storage.

**Audit History for a single record**

:::image type="content" source="media/dataverse-audit-log-single-record.png" alt-text="Audit History for a single record ":::

**Audit Summary view (all audit logs)**

:::image type="content" source="media/dataverse-audit-log-summary.png" alt-text="Audit Summary view (all audit logs) ":::

Audit logs help administrators and other privileged users to answer questions like:

- Who created or updated a record and when?
- Which fields in a record were updated?
- What was the previous field value before the update?
- Who was accessing the system and when?
- Who deleted a record?

The following operations can be audited:

- Audit changes at the entity, attribute, and organization level. For example, enabling audit for an environment or a table.
- Create, update, and delete operations on records.
- Changes to the sharing privileges of a record.
- The N:N association or disassociation of records.
- Changes to security roles.
- Deletion of audit logs.
- For changes made to entity fields that can be localized, such as the Product entity name or description fields, the locale ID (LCID) appears in the audit record.

Auditing is not supported on table or column definition changes or during authentication. Furthermore, auditing does not support retrieve operations or export operations. [Dataverse and model-driven apps activity logging](enable-use-comprehensive-auditing.md) can be enabled in addition to Dataverse auditing to log data retrieve operations and export operations.

The following list enumerates the non-customizable tables that cannot be audited. This list was obtained by testing for a CanModifyAuditSettings column value of false on each table's definition:

- ActivityPointer
- Annotation
- BulkOperation
- Calendar
- CalendarRule
- CustomerOpportunityRole
- Discount
- DiscountType
- IncidentResolution
- KbArticle
- KbArticleComment
- KbArticleTemplate
- Notification
- OpportunityClose
- OrderClose
- ProductPriceLevel
- QuoteClose
- RecurrenceRule
- Resource
- ResourceGroup
- ResourceGroupExpansion
- ResourceSpec
- SalesLiteratureItem
- SalesProcessInstance
- Service
- Subject
- Template
- UoM
- UoMSchedule
- Workflow
- WorkflowLog

## Configure auditing for an environment

There are three levels where auditing can be configured: an environment, table, and column. For table auditing to take place, auditing must be enabled at the environment level. For column auditing to take place, auditing must be enabled at the environment level and the table level.

To enable user access auditing (Log access) or activity logging (Read logs), auditing must be enabled at the environment level. The option to enable activity logging is only visible when the minimum Office licensing requirements are met.

You must have System Administrator or System Customizer role or equivalent permissions to enable or disable auditing.

Auditing can be configured manually via the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and the [Power Apps portal](https://make.powerapps.com/). Auditing can also be configured programmatically. See [Auditing overview](/power-apps/developer/data-platform/auditing/overview).

## Start/stop auditing for an environment and set retention policy

This task requires the System Administrator or System Customizer role or equivalent permissions.

> [!NOTE]
> The audit retention period is not available for Dynamics 365 Customer Engagement (on-premises) or for environments encrypted with a customer's own encryption key.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using administrator credentials.
  
2. Go to **Environments** > [select an environment] > **Settings** > expand **Audit and logs** > **Audit settings**.
  
   |      Setting |     Description    |
   |--------------------|---------------------|
   | Start Auditing   | Start or stop auditing.    |
   | Log access | Log whenever the system is accessed, generally by signing in.  |  
   | Read logs  | Logs will be sent to the [Microsoft Purview compliance portal](https://compliance.microsoft.com/auditlogsearch). |

3. You can set a retention period for how long audit logs are kept in an environment. Under **Retain these logs for**, choose the period of time you wish to retain the logs.

   |      Setting |     Description    |
   |--------------------|---------------------|
   | Set the retention policy for these logs   | Default: Forever   |
   | Set a custom retention policy | Maximum: 24,855 days. Visible if you select "Custom" in the above setting.   |  

   When the audit retention period is set to Forever, logs will never be deleted. When the audit retention period is set to any other value, logs will be deleted continuously starting at the time an audit record exceeds the time defined in the retention policy.

   Example: The retention policy is set to 30 days. Audit records that were created 30 days +1 second ago will start to be deleted in the background.

   Each audit log is stamped with the currently active retention period. Changing the retention period does not change the retention period for already existing records. The new retention period will be applied to all new records created after the retention policy was changed.

   Example: The retention period is changed from 30 days to 90 days. Audit records that were created prior to the change will be deleted in the background after 30 days. Audit records that were created after the change will be deleted in the background after 90 days.

4. Select **Save**.

More information: [Dataverse developer guide: Configure auditing > Configure organization settings](/power-apps/developer/data-platform/auditing/configure#configure-organization-settings)

## Enable auditing for a specific app in a web app

This task requires the System Administrator or System Customizer role or equivalent permissions.

This feature allows you to quickly enable auditing for multiple tables (entities) simultaneously. The grouping of tables corresponds to a Dynamics 365 application, for example Sales tables correspond to the Sales Hub app.

1. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

2. Select **Settings** > **Administration**.
  
3. Select **System Settings**, and then select the **Auditing** tab.  

4. Select the table (entities) you want to track. To start or stop auditing on specific tables, select or clear the following check boxes:
  
   - **Common Entities**. Tracks common entities like Account, Contact, Goal, Product, and User.  
   - **Sales Entities**. Tracks sales-related entities like Competitor, Opportunity, Invoice, Order, and Quote.  
   - **Marketing Entities**. Tracks Campaign entity activity.  
   - **Customer Service Entities**. Tracks Case, Contract, Queue, and Service entity activity.  
  
5. Select **OK**.  

## Configure auditing for one or more tables and columns in Power Apps

This task requires the System Administrator or System Customizer role or equivalent permissions.

1. Sign in to [Power Apps](https://make.powerapps.com) using your System Administrator or System Customizer credentials.

2. Select the environment for which you want to configure auditing.

   > [!NOTE]
   > We recommend that you manage the audit configuration as part of a solution. This enables you to easily find your customizations, apply your own solution published prefix, and export your solution for distribution to other environments. To learn more about solutions, see [Use a solution to customize](../alm/use-solutions-for-your-customizations.md). When using a solution, add all tables you want to configure for auditing to your solution, then perform steps 3-8 before saving and publishing your solution.

3. Select **Dataverse** > **Tables**.

4. Select a table.

   :::image type="content" source="media/field-security-tables-contact.png" alt-text="Select the Contact table.":::

5. On the command bar, select **Edit**.

6. On the command bar, select **Edit table properties**.

7. Expand **Advanced options**.

8. Select the **Audit changes to its data** checkbox.

   :::image type="content" source="media/dataverse-audit-changes-to-data.png" alt-text="Select Audit changes to its data":::

9. Select **Save**.

10. On the command bar, select **<- Back**.

11. Under **Schema**, select **Columns**.

    :::image type="content" source="media/field-security-schema-columns.png" alt-text="Under Schema, select Columns.":::

12. Select a column you want to enable for auditing, and then expand **Advanced options**.

    :::image type="content" source="media/field-security-mobile-phone.png" alt-text="Select the Mobile Phone column.":::

13. Select the **Enable auditing** checkbox.

    :::image type="content" source="media/dataverse-audit-enable-auditing.png" alt-text="Select Enable auditing":::

14. Select **Save**.

15. Repeat steps 3 – 10 for all tables and columns you want to edit.

## Enable or disable entities and fields for auditing  

<!-- this content copied from audit-data-user-activity -->

System administrators or customizers can change the default audit settings for entities and for specific fields for an entity.  
  
### Enable or disable auditing for an entity  
  
1. Browse to the Power Platform admin center and sign in using administrator credentials.
  
2. Go to **Environments** > [select an environment] > **Settings** > expand **Audit and logs** > **Entity and Field Audit Settings**.

3. Under **Components**, expand **Entities**.  
  
4. Select the entity for which you want to enable or disable auditing.  
  
5. To start auditing, on the **General** tab, in the **Data Services** section, select the **Auditing** check box to enable auditing, or clear the **Auditing** check box to disable it.  
  
   By default, when you start or stop auditing for an entity, you also start or stop auditing for all the fields of this entity.  

   If you have enabled the **Read Logs** in the environment's audit settings, you'll need to enable the **Single record auditing. Log a record when opened** and **Multiple record auditing. Log all records displayed on an opened page** auditing settings to see the read audit logs from this table. More information: [Activity logging](/power-platform/admin/enable-use-comprehensive-auditing).
  
6. Select **Save**.  
  
7. Publish the customization. To publish for a single entity, choose the entity, such as Account, and then select **Publish** on the toolbar.  
  
### Enable or disable auditing for specific fields on an entity
  
1. Under the entity for which you want to enable or disable auditing with specific fields, select **Fields**.  
  
2. To enable or disable a single field, open the field and in the Auditing section, select **Enable** or **Disable**.  
  
   To enable or disable more than one field, select the fields you want, and then on the toolbar select **Edit**. In the **Edit Multiple Fields** dialog box, in the Auditing area, select **Enabled** or **Disabled**.  
  
3. Select **Save**.  
  
4. Publish the customization. To publish for a single entity, choose the entity, such as Account, and then select **Publish** on the Actions toolbar.  

More information: [Dataverse developer guide: Configure auditing > Configure tables and columns](/power-apps/developer/data-platform/auditing/configure#configure-tables-and-columns)

## Use the Audit History in a model-driven app

Audit History is a valuable resource for users to understand the update history of a single record. It answers questions such as "When was this record created and by whom?", "Who changed a particular field and what was the previous value?", "Who shared the record with another user?".

Users must have the View Audit History privilege to see the Audit History of a record.

1. Select a record in a model-driven application.

2. Select the **Related** tab and select **Audit History**.

   :::image type="content" source="media/dataverse-audit-select-audit-history.png" alt-text="Select Audit History":::

3. Choose a field in **Filter on** to filter results by a field you want to see the change history.

   :::image type="content" source="media/dataverse-audit-select-filter.png" alt-text="Use the filter to select what to see history for":::

## Use the Audit Summary view

The Audit Summary view is a comprehensive list of all audit logs in an environment. By filtering on various columns, users of the Audit Summary view can understand what happened in the environment over time. It helps to answer questions such as "What actions did a user perform and when", "Who deleted a particular record?", or "Who changed a user's role?".

 Users must have the View Audit Summary privilege to see the Audit Summary view.

1. Sign in to the Power Platform admin center, and then select an environment.

2. In the Auditing card, select **Delete Logs**.

3. Select **View Audit Logs**.

   :::image type="content" source="media/dataverse-audit-select-view-audit-logs.png" alt-text="Select Delete logs":::

4. Use the **Enable/Disable** **Filters** option to narrow down the list of audit records needed to answer your question. You can apply several filters at once.

   :::image type="content" source="media/dataverse-audit-select-enable-disable-filters.png" alt-text="Select Enable/Disable Filters":::

   > [!NOTE]
   > Sorting is only possible on the **Changed Date** column.
   >
   > Exporting of Audit logs is currently not supported. Use the Web API or SDK for .NET to retrieve audit data from your environment. See [Retrieve and delete the history of audited data changes](/power-apps/developer/data-platform/retrieve-and-delete-the-history-of-audited-data-changes).
   >
   > Large attribute values, such as [Email.description](/powerapps/developer/common-data-service/reference/entities/email) or [Annotation](/powerapps/developer/common-data-service/reference/entities/annotation), are limited (capped) at 5KB or ~5,000 characters. A capped attribute value can be recognized by three dots at the end of the text, for example, "lorem ipsum, lorem ip…".

More information: [Dataverse developer guide: Retrieve the history of audited data changes](/power-apps/developer/data-platform/auditing/retrieve-audit-data)

## Delete the change history for a record

Dataverse auditing supports the deletion of a single record's entire audit history. This is useful when responding to a customer's request to delete their data.

Users must have the **Delete Audit Record Change History** privilege to perform this action.

The deletion of a record's audit history can be done in a model-driven application's Audit History and in the environment's **Audit Summary** view.

### Delete the change history for a record in the Audit History tab of a record  

1. Select a record in a model-driven application.

2. Select the **Related** tab, and then select **Audit History**.

   :::image type="content" source="media/dataverse-audit-select-audit-history.png" alt-text="Select Audit History":::

3. In **Filter on**, choose **All fields**, and then select **Delete Change History** to delete all logs pertaining to the selected record.

   :::image type="content" source="media/dataverse-audit-select-delete-change-history.png" alt-text="Select Delete change history to delete all logs pertaining to the selected record.":::

4. Select **Delete** to confirm.

### Delete the change history for a record in the Audit Summary view

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and then select an environment.

2. In the Auditing card, select **Delete logs**.

3. Select **View Audit Logs**.

   :::image type="content" source="media/dataverse-audit-select-view-audit-logs.png" alt-text="Select Delete logs":::

4. Select a row in the audit history, and then select **Delete Change History** to delete all logs pertaining to the selected record.

   :::image type="content" source="media/dataverse-audit-select-delete-change-history-environment.png" alt-text="Select Delete Change History to delete all logs for the selected record.":::

5. Select **Delete** to confirm.

## Reduce log storage: Delete audit logs – legacy process

When you enable Dataverse auditing, your apps create audit logs to store changes to the records and user access. You can delete audit logs when they are no longer needed to free up log capacity space.

> [!WARNING]
> When you delete audit logs, you can no longer view the audit history for the period covered by that audit log.

1. In the upper-right corner of an app, select **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings** > **Settings** > **Auditing**.

2. Select **Audit Log Management**, and then select **View Audit Logs**.

3. Select the oldest audit log, then select **Delete Logs**.

4. Select **OK** to confirm.

> [!NOTE]
> You can only delete the oldest audit log in the system. To delete more than one audit log repeat deleting the oldest available audit log until you have deleted enough logs.

## Reduce log storage: Delete audit logs – new process

When you enable Dataverse auditing, your apps create audit logs to store changes to the records and user access. You can delete audit logs when they are no longer needed to free up log capacity space.

> [!WARNING]
> When you delete audit logs, you can no longer view the audit history for the tables, user access, period covered by that audit log.

1. Sign in to the Power Platform admin center, and then select an environment.

2. Under Auditing, select **Delete logs**.

3. Choose how to select logs to delete.

   |Delete logs  |Description  |System job name   |
   |---------|---------|---------|
   |Logs by table      | Select one or more tables for which you want to delete audit logs. By default, all tables in the environment will be shown, whether they contain audit data or not.         | Delete logs for [number of] tables.         |
   |Access logs by people and systems      | Delete all access logs. This will delete all logs for all users and systems.         | Delete access logs.         |
   |All logs up to and including the selected date      | Delete logs including the date selected.             | Delete all logs before and including [timestamp].         |

   :::image type="content" source="media/dataverse-audit-select-delete-log-selection.png" alt-text="Select a method to select logs to delete.":::

4. Select **Delete**, and then confirm.

   > [!NOTE]
   > Audit logs will be deleted in an asynchronous background system job. The duration of the deletion depends on the amount of audit records to be deleted. The current rate is approximately 100 million records per day, or approximately 4 million records per hour.
   >
   > To monitor the status of audit delete jobs, see the next section.

## Monitoring system jobs  

<!-- this content is copied from monitor-manage-system-jobs topic -->

Several features use system jobs to perform tasks automatically, including workflows, import, and duplicate detection, running independently or in the background. You can monitor them to ensure that they run smoothly or have completed successfully.

1. In the Power Platform admin center, select an environment.

   For Unified Interface, in the upper-right corner, select **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings** > **Settings**.

2. Select **Settings** > **Audit and logs** > **System Jobs** to see a grid view of system jobs.

 If there is a problem with a system job, you can cancel, postpone, pause, or resume it. Select a job and then select the **Actions** menu.
  
- **Canceling system jobs**  
  
     You cannot resume a canceled system job.  
  
- **Postponing completion of system jobs**  
  
     Postponing an active system job stops any current and subsequent actions. You can specify a later time when you want the system job to restart.  
  
- **Pausing system jobs**  
  
     You can resume a paused system job.  
  
- **Resuming paused system jobs**  
  
     Resuming restarts a system job that was paused.  
  
  > [!TIP]
  >
  > 1. If a system job fails, you can view the details about what steps failed and what the problems may have been.  First, open the system job record.  To display details about system job failures, move your pointer over the warning symbols.  
  > 2. To view system job failures in a format that you can print or copy and paste, select the **Print** button.  
  
> [!NOTE]
> You cannot make changes to the status of a system job that has been completed or canceled.

## Monitor the status of audit delete jobs

1. In the Power Platform admin center, select an environment.

   For Unified Interface, in the upper-right corner, select **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings** > **Settings**.

2. Select **Settings** > **Data management** > **Bulk deletion**.

Select the system job name to open details about your delete job.

### See also

[Auditing overview](/power-apps/developer/data-platform/auditing-overview) <br />
[Audit user access](/power-apps/developer/data-platform/audit-user-access)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
