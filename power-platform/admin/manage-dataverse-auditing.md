---
title: Manage Dataverse auditing
description: Configure Dataverse auditing to log changes to customer records, user access, operations on records, and security roles. This feature meets external and internal auditing, compliance, security, and governance policies.
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/04/2025
author: paulliew 
ms.subservice: admin
ms.author: paulliew 
ms.reviewer: sericks 
ms.contributors:
  - lsuresh
contributors:
  - lavanyapg
search.audienceType: 
  - admin
---

# Manage Dataverse auditing

The Dataverse auditing feature is designed to meet the external and internal auditing, compliance, security, and governance policies that are common to many enterprises. Dataverse auditing logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment.

Dataverse auditing is supported on all custom and most customizable tables and columns. Audit logs are stored in Dataverse and consume log storage capacity. Audit logs can be viewed in the **Audit History** tab for a single record and in the **Audit Summary** view for all audited operations in a single environment. Audit logs can also be retrieved using the web API or the SDK for .NET. Audit logs are created when there are changes to the record on a table where auditing is turned on. Audit logs for updates are created when a new value is different from the old value of a column. 

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

- Audit changes at the table, column, and organization level. For example, turn on audit for an environment or a table.
- Create, update, and delete operations on records.
- Changes to the sharing privileges of a record.
- The N:N association or disassociation of records.
- Changes to security roles.
- Deletion of audit logs.
- For changes made to entity fields that can be localized, such as the Product entity name or description fields, the locale ID (LCID) appears in the audit record.

Auditing isn't supported on table or column definition changes or during authentication. Furthermore, auditing doesn't support retrieve operations or export operations. [Dataverse and model-driven apps activity logging](enable-use-comprehensive-auditing.md) can be turned on, in addition to Dataverse auditing, to log data retrieve operations and export operations.

The following list enumerates the noncustomizable tables that can't be audited. This list was obtained by testing for a CanModifyAuditSettings column value of false on each table's definition:

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

There are three levels where auditing can be configured: an environment, table, and column. Auditing must be turned on at the environment-level first. To log data changes in a table, auditing must be turned on for the table, and for the column. 

To turn on user access auditing (log access) or activity logging (Read logs), auditing must be turned on at the environment-level. The option to turn on activity logging is only visible when the minimum Office licensing requirements are met.

You must have System Administrator or System Customizer role or equivalent permissions to turn on or off auditing.

Auditing can be configured manually through the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and the [Power Apps portal](https://make.powerapps.com/). Auditing can also be configured programmatically. Learn more at [Auditing overview](/power-apps/developer/data-platform/auditing/overview).

### Turn on auditing

You must be assigned to the Power Platform or Dynamics 365 admin role to turn on or off auditing through the [**Compliance** page](security/compliance.md).

To meet your external and internal auditing, compliance, security, and governance policies that are common to many enterprises, auditing for the following tables are turned on automatically when you turn on auditing through the **Compliance** page. You can audit other tables, where applicable, but note that there are some core tables that audit is turned on by default. 

|Category  |Table  |
|-----------|-----------|
|Common entities| systemuser|
|Common entities| role |
|Common entities|report|
|Common entities|goalrollupquery|
|Common entities| metric|
|Common entities| goal|
|Common entities|bulkoperation|
|Common entities|list|
|Common entities|salesliterature|
|Common entities | product|
|Common entities| lead|
|Common entities |contact|
|Common entities| account|
|Common entities | activitypointer|
|Sales| opportunitysalesprocess|
|Sales| leadtoopportunitysalesprocess|
|Sales|invoice|
|Sales| salesorder|
|Sales|quote|
|Sales| competitor|
|Sales| opportunity|
|Marketing | campaign|
|CustomerService |translationprocess|
|CustomerService|expiredprocess|
|CustomerService| newprocess|
|CustomerService| phonetocaseprocess|
|CustomerService| service|
|CustomerService| contract|
|CustomerService| kbarticle|
|CustomerService| knowledgearticle|
|CustomerService| queueitem|
|CustomerService| incident|
|CustomerService| socialprofile|
|Security|solution|
|Security|entity|
|Security|team|
|Security|position|
|Security|organization|
|Security|fieldsecurityprofile|
|Security|businessunit|

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. From the left-side menu, select **Security > Compliance**.
1. Select the **Auditing** tile.
1. Select the environment that you want to turn on auditing.
1. Select **Set up auditing**. In the **Auditing** dialog box, select **Turn on auditing**.
1. Review the list of Dataverse data and Dynamics 365 apps entities.
1. Review and update the **Event log retention** by selecting the dropdown.
1. Select the period that meets your data retention policy.


# [Classic admin center](#tab/classic)
 
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. From the left-side menu, select **Security > Compliance**.
1. Select the **Auditing** tile.
1. Select the environment that you want to turn on auditing.
1. Select **Set up auditing**. In the **Auditing** dialog box, select **Turn on auditing**.
1. Review the list of Dataverse data and Dynamics 365 apps entities.
1. Review and update the **Event log retention** by selecting the dropdown.
1. Select the period that meets your data retention policy.

---

> [!NOTE]
> When the audit retention period is set to **Forever**, logs aren't deleted. When the audit retention period is set to any other value, logs are deleted continuously starting at the time an audit record exceeds the time defined in the retention policy.
>
> For example, assume the retention policy is set to 30 days. Audit records that were created 30 days and one second ago, start to be deleted in the background.
>
> Each audit log is stamped with the currently active retention period. **Changing the retention period here doesn't change the retention period for already existing records.** The new retention period is applied to all new records created after the retention policy was changed. For example, assume the retention period is changed from 30 days to 90 days. Audit records that were created prior to the change are deleted in the background after 30 days. Audit records that were created after the change are deleted in the background after 90 days.

The following table describes the retention policy settings available when you turn on auditing for an environment:

   |      Setting |     Description    |
   |--------------------|---------------------|
   | Set the retention policy for these logs   | Default: Forever   |
   | Set a custom retention policy | Maximum: 24,855 days. Visible if you select "Custom" in the previous setting.   |  

> [!Important]
> The audit retention period isn't available for Dynamics 365 Customer Engagement (on-premises) or for environments encrypted with a customer's own encryption key.

## Start/stop auditing for an environment and set retention policy 

This task requires the System Administrator or System Customizer role or equivalent permissions. The following table describes the settings available for auditing for an environment:

   |   Setting |     Description    |
   |--------------------|---------------------|
   | Start Auditing   | Start or stop auditing.    |
   | Log access | Log whenever the system is accessed, generally by signing in.  |
   | Read logs  | Logs are sent to the [Microsoft Purview portal](https://compliance.microsoft.com/auditlogsearch). User access or activity logging is sent to Purview for production environments only.|


# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** > **Audit and logs** > **Audit settings**.
1. You can set a retention period for how long audit logs are kept in an environment. Under **Retain these logs for**, choose the period of time you wish to retain the logs. 
1. Select **Save**.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using administrator credentials.
1. Go to **Environments** > [select an environment] > **Settings** > expand **Audit and logs** > **Audit settings**.
1. You can set a retention period for how long audit logs are kept in an environment. Under **Retain these logs for**, choose the period of time you wish to retain the logs.
1. Select **Save**.

---

> [!NOTE]
> It's recommended that you use the Security page auditing option to set the retention policy. This provides the flexibility to apply the retention policy to existing logs. 

Learn more in the [Configure organization settings](/power-apps/developer/data-platform/auditing/configure#configure-organization-settings).

## Turn on auditing for a specific app in a web app

This task requires the System Administrator or System Customizer role or equivalent permissions.

This feature allows you to quickly turn on auditing for multiple tables (entities) simultaneously. The grouping of tables corresponds to a Dynamics 365 application, for example Sales tables correspond to the Sales Hub app.

1. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

1. Select **System** > **Administration**.

1. Select **Auditing** tab.

1. Select the table (entities) you want to track. To start or stop auditing on specific tables, select or clear the following check boxes:
  
   - **Common Entities**. Tracks common entities like Account, Contact, Goal, Product, and User.
   - **Sales Entities**. Tracks sales-related entities like Competitor, Opportunity, Invoice, Order, and Quote. 
   - **Marketing Entities**. Tracks Campaign table activity.
   - **Customer Service Entities**. Tracks Case, Contract, Queue, and Service table activity. 
  
1. Select **OK**. 

## Configure auditing for one or more tables and columns in Power Apps

This task requires the System Administrator or System Customizer role or equivalent permissions.

1. Sign in to [Power Apps](https://make.powerapps.com) using your System Administrator or System Customizer credentials.

1. Select the environment for which you want to configure auditing.

   > [!NOTE]
   > We recommend that you manage the audit configuration as part of a solution. This allows you to easily find your customizations, apply your own solution published prefix, and export your solution for distribution to other environments. To learn more about solutions, see [Use a solution to customize](../alm/use-solutions-for-your-customizations.md). When using a solution, add all tables you want to configure for auditing to your solution, then perform steps 3-8 before saving and publishing your solution.

1. Select **Dataverse** > **Tables**.

1. Select a table.

   :::image type="content" source="media/field-security-tables-contact.png" alt-text="Select the Contact table.":::

1. On the command bar, select **Edit**.

1. On the command bar, select **Edit table properties**.

1. Expand **Advanced options**.

1. Select the **Audit changes to its data** checkbox.

   :::image type="content" source="media/dataverse-audit-changes-to-data.png" alt-text="Select Audit changes to its data":::

1. Select **Save**.

1. On the command bar, select **<- Back**.

1. Under **Schema**, select **Columns**.

    :::image type="content" source="media/field-security-schema-columns.png" alt-text="Under Schema, select Columns.":::

1. Select a column you want to turn on for auditing, and then expand **Advanced options**.

    :::image type="content" source="media/field-security-mobile-phone.png" alt-text="Select the Mobile Phone column.":::

1. Select the **Enable auditing** checkbox.

    :::image type="content" source="media/dataverse-audit-enable-auditing.png" alt-text="Select Enable auditing":::

1. Select **Save**.

1. Repeat steps 3 – 10 for all tables and columns you want to edit.

## Turn on or off auditing for tables and columns

<!-- this content copied from audit-data-user-activity -->

System administrators or customizers can change the default audit settings for tables and for specific columns of a table. 

### Turn on or off auditing for a table 

1. Sign in to [Power Apps](https://make.powerapps.com) using your System Administrator or System Customizer credentials.

1. Select the environment for which you want to configure auditing.

   > [!NOTE]
   > We recommend that you manage the audit configuration as part of a solution. This allows you to easily find your customizations, apply your own solution published prefix, and export your solution for distribution to other environments. Learn more about solutions in [Use a solution to customize](../alm/use-solutions-for-your-customizations.md). When using a solution, add all tables you want to configure for auditing to your solution, then perform steps 3-8 before saving and publishing your solution.

1. Select **Dataverse** > **Tables**.

1. Select a table.

   :::image type="content" source="media/field-security-tables-contact.png" alt-text="Select the Contact table.":::

1. On the command bar, select **Edit**.

1. On the command bar, select **Edit table properties**.

1. Expand **Advanced options**.

1. Select the **Audit changes to its data** checkbox to turn on auditing for the table.

   :::image type="content" source="media/dataverse-audit-changes-to-data.png" alt-text="Select Audit changes to its data":::

    -or-
  
    Clear the **Audit changes to its data** checkbox to turn off auditing for the table.

1. Select **Save**.

    If you have turned on the **Read Logs** in the environment's audit settings, you need to turn on the **Single record auditing. Log a record when opened** and **Multiple record auditing. Log all records displayed on an opened page** auditing settings to see the read audit logs from this table. Learn more at [Activity logging](/power-platform/admin/enable-use-comprehensive-auditing).

1. Publish the customization. To publish for a single table, choose the table, such as Account, and then select **Publish** on the toolbar. 

### Turn on or off auditing for a specific column on a table

1. Under the table for which you want to turn on auditing with specific columns, select **Columns**. 

1. To turn on or off auditing for a single column, open the column and expand the **Advanced options** in the **General** section, and then select or clear the **Enable auditing** option. 

1. Select **Save**. 

1. Publish the customization. To publish for a single table, choose the table, such as Account, and then select **Publish** on the toolbar. 

Learn more in [Dataverse developer guide: Configure auditing > Configure tables and columns](/power-apps/developer/data-platform/auditing/configure#configure-tables-and-columns).

## Use the Audit History in a model-driven app

Audit History is a valuable resource for users to understand the update history of a single record. It answers questions such as "When was this record created and by whom?", "Who changed a particular field and what was the previous value?", "Who shared the record with another user?".

Users must have the View Audit History privilege to see the Audit History of a record.

1. Select a record in a model-driven application.

1. Select the **Related** tab and select **Audit History**.

   :::image type="content" source="media/dataverse-audit-select-audit-history.png" alt-text="Select Audit History":::

1. Choose a field in **Filter on** to filter results by a field you want to see the change history.

   :::image type="content" source="media/dataverse-audit-select-filter.png" alt-text="Use the filter to select what to see history for":::

## Use the Audit summary view

The Audit summary view is a comprehensive list of all audit logs in an environment. By filtering on various columns, users of the Audit summary view can understand what happened in the environment over time. It helps to answer questions such as "What actions did a user perform and when?", "Who deleted a particular record?", or "Who changed a user's role?".

Users must have the View Audit summary privilege to see the Audit summary view.

There are two ways to get to the **Audit summary** page:

- From the environment's **Apps** menu, select the **Power Platform Environment Settings** app
- From the app, select the **Settings** icon on the banner, select **Advanced Settings**, and select **System > Auditing > Audit summary view**.

  > [!NOTE]
  > The **Record** column filter doesn't work and will be removed in the future. The filter options **Equals** and **Does not equal** of the **Entity** column filter don't show any table values. To filter by entity, you can use the **Contains** option and enter the table name. 

### Delete audit logs 

1. In the Auditing card, select **Delete Logs**.

1. Select **View Audit Logs**.

   :::image type="content" source="media/dataverse-audit-select-view-audit-logs.png" alt-text="Select Delete logs":::

1. Use the **Enable/Disable** **Filters** option to narrow down the list of audit records needed to answer your question. You can apply several filters at once.

   :::image type="content" source="media/dataverse-audit-select-enable-disable-filters.png" alt-text="Select Enable/Disable Filters":::

   > [!NOTE]
   > Sorting is only possible on the **Changed Date** column.
   >
   > Exporting of Audit logs is currently not supported. Use the Web API or SDK for .NET to retrieve audit data from your environment. See [Retrieve and delete the history of audited data changes](/power-apps/developer/data-platform/retrieve-and-delete-the-history-of-audited-data-changes).
   >
   > Large attribute values, such as [Email.description](/powerapps/developer/common-data-service/reference/entities/email) or [Annotation](/powerapps/developer/common-data-service/reference/entities/annotation), are limited (capped) at 5 KB or about 5,000 characters. A capped attribute value is recognized by three dots at the end of the text, for example, "lorem ipsum, lorem ip…".

Learn more in [Dataverse developer guide: Retrieve the history of audited data changes](/power-apps/developer/data-platform/auditing/retrieve-audit-data).

### Delete the change history for a record

Dataverse auditing supports the deletion of a single record's entire audit history. This is useful when responding to a customer's request to delete their data.

Users must have the **Delete Audit Record Change History** privilege to perform this action.

The deletion of a record's audit history can be done in a model-driven application's Audit History and in the environment's **Audit summary** view.

### Delete the change history for a record in the Audit History tab of a record 

1. Select a record in a model-driven application.

1. Select the **Related** tab, and then select **Audit History**.

   :::image type="content" source="media/dataverse-audit-select-audit-history.png" alt-text="Select Audit History":::

1. In **Filter on**, choose **All fields**, and then select **Delete Change History** to delete all logs pertaining to the selected record.

   :::image type="content" source="media/dataverse-audit-select-delete-change-history.png" alt-text="Select Delete change history to delete all logs pertaining to the selected record.":::

1. Select **Delete** to confirm.

### Delete the change history for a record in the Audit Summary view

1. In the Auditing card, select **Delete logs**.

1. Select **View Audit Logs**.

   :::image type="content" source="media/dataverse-audit-select-view-audit-logs.png" alt-text="Select Delete logs":::

1. Select a row in the audit history, and then select **Delete Change History** to delete all logs pertaining to the selected record.

   :::image type="content" source="media/dataverse-audit-select-delete-change-history-environment.png" alt-text="Select Delete Change History to delete all logs for the selected record.":::

1. Select **Delete** to confirm.

### Reduce log storage: Delete audit logs – legacy process

When you turn on Dataverse auditing, your apps create audit logs to store changes to the records and user access. You can delete audit logs when they're no longer needed to free up log capacity space.

> [!WARNING]
> When you delete audit logs, you can no longer view the audit history for the period covered by that audit log.

1. In the upper-right corner of an app, select **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings** > **Settings** > **Auditing**.
1. Select **Audit Log Management**, and then select **View Audit Logs**.
1. Select the oldest audit log, then select **Delete Logs**.
1. Select **OK** to confirm.

> [!NOTE]
> You can only delete the oldest audit log in the system. To delete more than one audit log, repeat delete the oldest available audit log until you have deleted enough logs.

### Reduce log storage: Delete audit logs – new process

When you turn on Dataverse auditing, your apps create audit logs to store changes to the records and user access. You can delete audit logs when they're no longer needed to free up log capacity space.

The following table describes the options available to delete audit logs. 

   |Delete logs  |Description  |System job name   |
   |---------|---------|---------|
   |By table      | Select one or more tables for which you want to delete audit logs. By default, all tables in the environment will be shown, whether they contain audit data or not.         | Delete logs for [number of] tables.         |
   |Access logs, by people and systems      | Delete all access logs. This deletes all logs for all users and systems.         | Delete access logs.         |
   |All logs up to and including the selected date      | Delete logs including the date selected.             | Delete all logs before and including [timestamp].         |

> [!WARNING]
> When you delete audit logs, you can no longer view the audit history for the tables, user access, period covered by that audit log.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and then select an environment.
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Under Auditing, select **Delete audit logs**.
1. Choose how to select logs to delete. 
1. Select **Delete**, and then confirm.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and then select an environment.
1. Under Auditing, select **Delete audit logs**.
1. Choose how to select logs to delete.
1. Select **Delete**, and then confirm.

---

   > [!NOTE]
   > Audit logs are deleted in an asynchronous background system job. The duration of the deletion depends on the number of audit records to be deleted. The current rate is approximately 100 million records per day, or approximately 4 million records per hour.
   >
   > To monitor the status of audit delete jobs, see the next section.

## Monitoring system jobs 

<!-- this content is copied from monitor-manage-system-jobs topic -->

Several features use system jobs to perform tasks automatically, including workflows, import, and duplicate detection, running independently or in the background. You can monitor them to ensure that they run smoothly or complete successfully.

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** > **Audit and logs** > **System jobs** to see a grid view of system jobs.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and select an environment.
1. Select **Settings** > **Audit and logs** > **System jobs** to see a grid view of system jobs.

---

If there's a problem with a system job, you can cancel, postpone, pause, or resume it. Select a job and then select the **Actions** menu.
  
- **Canceling system jobs** 
  
     You can't resume a canceled system job. 
  
- **Postponing completion of system jobs** 
  
     Postponing an active system job stops any current and subsequent actions. You can specify a later time when you want the system job to restart. 
  
- **Pausing system jobs** 
  
     You can resume a paused system job. 
  
- **Resuming paused system jobs** 
  
     Resuming restarts a system job that was paused. 
  
> [!TIP]
>
> 1. If a system job fails, you can view the details about what steps failed and what the problems were.First, open the system job record. To display details about system job failures, move your pointer over the warning symbols.
> 2. To view system job failures in a format that you can print or copy and paste, select the **Print** button.

> [!NOTE]
> You can't make changes to the status of a system job that has been completed or canceled.

## Monitor the status of audit delete jobs

To monitor the status of audit delete jobs, you can use the **Bulk Record Deletion** view in the Power Platform admin center. 

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** > **Data management** > **Bulk deletion**.
1. Select the system job name to open details about your delete job.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and select an environment.
1. Select **Settings** > **Data management** > **Bulk deletion**.
1. Select the system job name to open details about your delete job.

---

## Access audit data using Azure Synapse Link for Dataverse

You can use Azure Synapse Link for Dataverse to link the audit table and create reports using Power BI to meet your external and internal auditing, compliance, and governance needs. More information: [Access audit data using Azure Synapse Link for Dataverse and Power BI](audit-data-azure-synapse-link.md)

### Related content

[Auditing overview](/power-apps/developer/data-platform/auditing-overview) <br />
[Audit user access](/power-apps/developer/data-platform/audit-user-access)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
