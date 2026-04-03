---
title: Manage Dataverse auditing
description: Configure Dataverse auditing to log changes to customer records, user access, operations on records, and security roles. This feature meets external and internal auditing, compliance, security, and governance policies.
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/03/2026
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
ms.custom: sfi-image-nochange
---

# Manage Dataverse auditing

The Dataverse auditing feature helps you meet external and internal auditing, compliance, security, and governance policies that are common to many enterprises. Dataverse auditing logs changes that you make to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment.

Dataverse auditing is supported on all custom and most customizable tables and columns. Dataverse stores audit logs and they consume log storage capacity. You can view audit logs in the **Audit History** tab for a single record and in the **Audit Summary** view for all audited operations in a single environment. You can also retrieve audit logs by using the web API or the SDK for Microsoft .NET. Audit logs are created when you change the record on a table where auditing is turned on. Audit logs for updates are created when a new value is different from the old value of a column.  

> [!NOTE]
> The use of entity-related terminology depends on the protocol or class library used. See [Terminology use depending on protocol or technology](/power-apps/developer/data-platform/understand-terminology#terminology-use-depending-on-protocol-or-technology).
>
> Audit logs might show up with a delay in the **Audit History** tab of a record and in the **Audit Summary** view. This delay happens because audit logs are stored in the Dataverse log storage and no longer in the database storage.

**Audit History for a single record**

:::image type="content" source="media/dataverse-audit-log-single-record.png" alt-text="Audit History for a single record ":::

**Audit Summary view (all audit logs)**

:::image type="content" source="media/dataverse-audit-log-summary.png" alt-text="Audit Summary view (all audit logs) ":::

Audit logs help administrators and other users with the required privileges answer questions like:

- Who created or updated a record and when?
- Which fields in a record were updated?
- What was the previous field value before the update?
- Who was accessing the system and when?
- Who deleted a record?

You can audit the following operations:

- Audit changes at the table, column, and organization level. For example, turn on audit for an environment or a table.
- Create, update, and delete operations on records.
- Changes to the sharing privileges of a record.
- The N:N association or disassociation of records.
- Changes to security roles.
- Deletion of audit logs.
- For changes made to entity fields that you can localize, such as the product entity name or description fields, the locale ID (LCID) appears in the audit record.

Auditing isn't supported on table or column definition changes or during authentication. Furthermore, auditing doesn't support retrieve operations or export operations. In addition to Dataverse auditing, you can turn on [Dataverse and model-driven apps activity logging](enable-use-comprehensive-auditing.md) to log data retrieve operations and export operations.

The following list enumerates the noncustomizable tables that you can't audit. This list was obtained by testing for a `CanModifyAuditSettings` column value of *false* on each table's definition:

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

You can configure auditing at three levels: environment, table, and column. First, turn on auditing at the environment level. To log data changes in a table, turn on auditing for the table and for the column. 

To turn on user access auditing (log access) or activity logging (Read logs), turn on auditing at the environment level. The option to turn on activity logging is only visible when the minimum Office licensing requirements are met.

> [!NOTE]
> User access or activity logging is sent to Purview for production environments only.

You must have a system administrator or system customizer role or equivalent permissions to turn auditing on or off.

You can configure auditing manually through the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and the [Power Apps portal](https://make.powerapps.com/). You can also configure auditing programmatically. For more information, see [Auditing overview](/power-apps/developer/data-platform/auditing/overview).

To meet your external and internal auditing, compliance, security, and governance policies that are common to many enterprises, the system automatically turns on auditing for the following tables when you turn on auditing through the [Compliance page](security/compliance.md). You must be assigned to the Power Platform or Dynamics 365 admin role to turn auditing on or off through the **Compliance** page.

You can audit other tables, where applicable, but note that auditing is turned on by default for some core tables. 

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

### Turn on auditing

The following steps describe how to turn on auditing for an environment. This task requires the system administrator or system customizer role or equivalent permissions.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. From the left-side menu, select **Security** > **Compliance**.
1. Select the **Auditing** tile.
1. Select the environment that you want to turn on auditing.
1. Select **Set up auditing**. In the **Auditing** dialog, select **Turn on auditing**.
1. Review the list of Dataverse data and Dynamics 365 apps entities.
1. Review and update the **Event log retention** by selecting the dropdown menu.
1. Select the period that meets your data retention policy.

> [!NOTE]
> When you set the audit retention period to **Forever**, the system doesn't delete logs. When you set the audit retention period to any other value, the system continuously deletes logs starting at the time an audit record exceeds the time defined in the retention policy.
>
> For example, assume the retention policy is set to 30 days. The system starts to delete audit records that were created 30 days and one second ago.
>
> Each audit log is stamped with the currently active retention period. **Changing the retention period here doesn't change the retention period for already existing records.** The new retention period applies to all new records created after the retention policy change. For example, assume the retention period is changed from 30 days to 90 days. The system deletes audit records that were created prior to the change in the background after 30 days. The system deletes audit records that were created after the change in the background after 90 days.

The following table describes the retention policy settings available when you turn on auditing for an environment:

   |      Setting |     Description    |
   |--------------------|---------------------|
   | Set the retention policy for these logs   | Default: Forever   |
   | Set a custom retention policy | Maximum: 24,855 days. Visible if you select **Custom** in the previous setting.   |  

> [!IMPORTANT]
> The audit retention period isn't available for Dynamics 365 Customer Engagement (on-premises) or for environments encrypted with a customer's own encryption key.

## Start or stop auditing for an environment and set retention policy 

You need the system administrator or system customizer role, or equivalent permissions, to complete this task. The following table describes the settings available for auditing for an environment:

   |   Setting |     Description    |
   |--------------------|---------------------|
   | Start Auditing   | Start or stop auditing.    |
   | Log access | Log whenever the system is accessed, generally by signing in.  |
   | Read logs  | Logs are sent to the [Microsoft Purview compliance portal](https://compliance.microsoft.com/auditlogsearch).|

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** > **Audit and logs** > **Audit settings**.
1. Set a retention period for how long audit logs are kept in an environment. Under **Retain these logs for**, choose the period of time to retain the logs. 
1. Select **Save**.

> [!NOTE]
> Use the Security page auditing option to set the retention policy. This option provides the flexibility to apply the retention policy to existing logs. 

Learn more in the [Configure organization settings](/power-apps/developer/data-platform/auditing/configure#configure-organization-settings).

## Turn on auditing for a specific app in a web app

You need the system administrator or system customizer role, or equivalent permissions, to complete this task.

This feature enables you to quickly turn on auditing for multiple tables (entities) at the same time. The grouping of tables corresponds to a Dynamics 365 application. For example, Sales tables correspond to the Sales Hub app.

1. In the web app, go to **Settings** > **Advanced Settings**.
1. Select **System** > **Administration**.
1. Select the **Auditing** tab.
1. Select the tables (entities) you want to track. To start or stop auditing on specific tables, select or clear the following checkboxes:
  
   - **Common Entities**. Tracks common entities like Account, Contact, Goal, Product, and User.
   - **Sales Entities**. Tracks sales-related entities like Competitor, Opportunity, Invoice, Order, and Quote. 
   - **Marketing Entities**. Tracks Campaign table activity.
   - **Customer Service Entities**. Tracks Case, Contract, Queue, and Service table activity. 
  
1. Select **OK**.

## Configure auditing for one or more tables and columns in Power Apps

You need the system administrator or system customizer role, or equivalent permissions, to complete this task.

1. Sign in to [Power Apps](https://make.powerapps.com) by using your system administrator or system customizer credentials.
1. Select the environment for which you want to configure auditing.

   > [!NOTE]
   > Manage the audit configuration as part of a solution. This approach makes it easy to find your customizations, apply your own solution published prefix, and export your solution for distribution to other environments. For more information about solutions, see [Use a solution to customize](../alm/use-solutions-for-your-customizations.md). When using a solution, add all tables you want to configure for auditing to your solution, and then perform steps 3-8 before saving and publishing your solution.

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
1. Repeat steps 3–10 for all tables and columns you want to edit.

## Turn on or off auditing for tables and columns

<!-- this content copied from audit-data-user-activity -->

System administrators or customizers can change the default audit settings for tables and for specific columns of a table. 

### Turn on or off auditing for a table

1. Sign in to [Power Apps](https://make.powerapps.com) by using your system administrator or system customizer credentials.
1. Select the environment for which you want to configure auditing.

   > [!NOTE]
   > Manage the audit configuration as part of a solution. This approach makes it easy to find your customizations, apply your own solution published prefix, and export your solution for distribution to other environments. For more information, see [Use a solution to customize](../alm/use-solutions-for-your-customizations.md). When using a solution, add all tables you want to configure for auditing to your solution, then perform steps 3–8 before saving and publishing your solution.

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

   If you turn on the **Read Logs** in the environment's audit settings, you need to turn on the **Single record auditing. Log a record when opened** and **Multiple record auditing. Log all records displayed on an opened page** auditing settings to see the read audit logs from this table.

1. Publish the customization. To publish for a single table, choose the table, such as Account, and then select **Publish** on the toolbar. 

### Turn on or off auditing for a specific column on a table

1. Under the table for which you want to turn on auditing with specific columns, select **Columns**. 
1. To turn auditing on or off for a single column, open the column, expand the **Advanced options** in the **General** section, and then select or clear the **Enable auditing** option. 
1. Select **Save**.
1. Publish the customization. To publish for a single table, choose the table, such as Account, and then select **Publish** on the toolbar. 

Learn more in [Dataverse developer guide: Configure auditing > Configure tables and columns](/power-apps/developer/data-platform/auditing/configure#configure-tables-and-columns).

> [!NOTE]
> When you turn off auditing for a column, the before-and-after values are sent as an "*" to [Purview activity logging](enable-use-comprehensive-auditing.md).

### Turn on or off auditing for Choice data type's original label

By default, the current label description of the **Choice** data type appears in the audit logs. For example, suppose you have a choice column for **color** and the label description can be _red_, _white_, and _blue_. When a user selects _red_ and updates the record, the audit record shows that _red_ was selected. If you later change the label description to _pink_ in the choice data type, the audit record displays _pink_.

If you want to show the original label that the user selected in the audit logs, set this :::no-loc text="auditsetting":::, **{\"StoreLabelNameforPicklistAudits\":true}**, to true. Learn how to [enable :::no-loc text="auditsetting":::](/power-apps/developer/data-platform/auditing/configure?tabs=webapi#change-auditsettings).

> [!NOTE]
> When you set `StoreLabelNameforPicklistAudits` to true, the new audit user experience on viewing the audit records can be found in the [Audit Summary view](#use-the-audit-summary-view). The [audit history in model-driven app](#use-the-audit-history-in-a-model-driven-app) continues to show the _by default_ behavior.

## Use the Audit History in a model-driven app

Audit History helps users understand the update history of a single record. It answers questions such as "When was this record created and by whom?", "Who changed a particular field and what was the previous value?", or "Who shared the record with another user?"

Users need the **View Audit History** privilege to see the Audit History of a record.

1. Select a record in a model-driven app.
1. Select the **Related** tab and select **Audit History**.

   :::image type="content" source="media/dataverse-audit-select-audit-history.png" alt-text="Select Audit History":::

1. Choose a field in **Filter on** to filter results by a field in which you want to see the change history.

   :::image type="content" source="media/dataverse-audit-select-filter.png" alt-text="Use the filter to select what to see history for":::

## Use the Audit Summary view

The **Audit Summary** view is a comprehensive list of all audit logs in an environment. By filtering on various columns, users of the **Audit Summary** view can understand what happened in the environment over time. It helps answer questions such as "What actions did a user perform and when?", "Who deleted a particular record?", or "Who changed a user's role?"

Users need the **View Audit Summary** privilege to see the **Audit Summary** view.

Two ways lead to the **Audit Summary** page:

- From the environment's **Apps** menu, select the **Power Platform Environment Settings** app.
- From the app, select the **Settings** icon on the banner, select **Advanced Settings**, and then select **System** > **Auditing** > **Audit Summary view**.

  > [!NOTE]
  > The **Record** column filter doesn't work and will be removed in the future. The filter options **Equals** and **Does not equal** of the **Entity** column filter don't show any table values. To filter by entity, use the **Contains** option and enter the table name.

## Delete audit logs

1. In the **Auditing** card, select **Delete Logs**.
1. Select **View Audit Logs**.

   :::image type="content" source="media/dataverse-audit-select-view-audit-logs.png" alt-text="Select Delete logs":::

1. Use the **Enable/Disable Filters** option to narrow down the list of audit records. You can apply several filters at once.

   :::image type="content" source="media/dataverse-audit-select-enable-disable-filters.png" alt-text="Select Enable/Disable Filters":::

   > [!NOTE]
   > You can only sort by the **Changed Date** column.
   >
   > Exporting audit logs isn't currently supported. Use the Web API or SDK for .NET to retrieve audit data from your environment. For more information, see [Retrieve and delete the history of audited data changes](/power-apps/developer/data-platform/retrieve-and-delete-the-history-of-audited-data-changes).
   >
   > Large attribute values, such as [Email.description](/powerapps/developer/common-data-service/reference/entities/email) or [Annotation](/powerapps/developer/common-data-service/reference/entities/annotation), are limited to 5 KB or about 5,000 characters. A capped attribute value is recognized by three dots at the end of the text, such as "lorem ipsum, lorem ip… ".

For more information, see [Dataverse developer guide: Retrieve the history of audited data changes](/power-apps/developer/data-platform/auditing/retrieve-audit-data).

## Delete the change history for a record

Dataverse auditing supports the deletion of a single record's entire audit history. This feature is useful when responding to a customer's request to delete their data.

Users must have the **Delete Audit Record Change History** privilege to perform this action.

You can delete a record's audit history in a model-driven application's **Audit History** and in the environment's **Audit Summary** view.

### Delete the change history for a record in the Audit History tab of a record 

1. Select a record in a model-driven app.
1. Select the **Related** tab, and then select **Audit History**.

   :::image type="content" source="media/dataverse-audit-select-audit-history.png" alt-text="Select Audit History":::

1. In **Filter on**, choose **All fields**, and then select **Delete Change History** to delete all logs for the selected record.

   :::image type="content" source="media/dataverse-audit-select-delete-change-history.png" alt-text="Select Delete change history to delete all logs pertaining to the selected record.":::

1. Select **Delete** to confirm.

### Delete the change history for a record in the Audit Summary view

1. In the Auditing card, select **Delete logs**.
1. Select **View Audit Logs**.

   :::image type="content" source="media/dataverse-audit-select-view-audit-logs.png" alt-text="Select Delete logs":::

1. Select a row in the audit history, and then select **Delete Change History** to delete all logs for the selected record.

   :::image type="content" source="media/dataverse-audit-select-delete-change-history-environment.png" alt-text="Select Delete Change History to delete all logs for the selected record.":::

1. Select **Delete** to confirm.

## Reduce log storage: Delete audit logs – legacy process

When you turn on Dataverse auditing, your apps create audit logs to store changes to the records and user access. You can delete audit logs when they're no longer needed to free up log capacity space.

> [!WARNING]
> When you delete audit logs, you can't view the audit history for the period covered by that audit log.

1. In the upper-right corner of an app, select **Settings** > **Advanced Settings** > **Settings** > **Auditing**.
1. Select **Audit Log Management** and then select **View Audit Logs**.
1. Select the oldest audit log and then select **Delete Logs**.
1. Select **OK** to confirm.

> [!NOTE]
> You can only delete the oldest audit log in the system. To delete more than one audit log, repeat the deletion of the oldest available audit log until you delete enough logs.

## Reduce log storage: Delete audit logs – new process

When you turn on Dataverse auditing, your apps create audit logs to store changes to the records and user access. You can delete audit logs when they're no longer needed to free up log capacity space.

The following table describes the options available to delete audit logs. 

   |Delete logs  |Description  |System job name   |
   |---------|---------|---------|
   |By table      | Select one or more tables for which you want to delete audit logs. By default, all tables in the environment are shown, whether or not they contain audit data.         | Delete logs for [number of] tables.         |
   |Access logs, by people and systems      | Delete all access logs. This action deletes all logs for all users and systems.         | Delete access logs.         |
   |All logs up to and including the selected date      | Delete logs including the date selected.             | Delete all logs before and including [timestamp].         |

> [!WARNING]
> When you delete audit logs, you can no longer view the audit history for the tables, user access, or period covered by that audit log.

For Unified Interface, in the upper-right corner, select **Settings** > **Advanced Settings** > **Settings**.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and then select an environment.
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Under Auditing, select **Delete audit logs**.
1. Choose how to select logs to delete. 
1. Select **Delete** and then confirm.

   > [!NOTE]
   > Audit logs are deleted in an asynchronous background system job. The duration of the deletion depends on the number of audit records to be deleted. The current rate is approximately 100 million records per day, or approximately 4 million records per hour.
   >
   > To monitor the status of audit delete jobs, see the next section.

## Monitor system jobs 

For information about how to monitor system jobs, go to [Monitor system jobs](monitor-system-jobs.md).

## Monitor the status of audit delete jobs

To monitor the status of audit delete jobs, use the **Bulk deletion** view in the Power Platform admin center. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** > **Data management** > **Bulk deletion**.
1. Select the system job name to open details about your delete job.

## Access audit data using Azure Synapse Link for Dataverse

Use Azure Synapse Link for Dataverse to link the audit table and create reports by using Power BI to meet your external and internal auditing, compliance, and governance needs. For more information, go to [Access audit data using Azure Synapse Link for Dataverse and Power BI](audit-data-azure-synapse-link.md).

## Access Power Platform activity log data in Microsoft Purview

Access Power Platform activity log data in Microsoft Purview to analyze and report on user and system activities within your Power Platform environments. This integration allows you to leverage Purview's data governance and compliance capabilities to meet your organization's auditing requirements. For more information, see [Overview of Power Platform activity logging and auditing in Microsoft Purview](activity-logging-auditing/activity-logs-overview.md).

### Related content

[Auditing overview](/power-apps/developer/data-platform/auditing-overview)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
