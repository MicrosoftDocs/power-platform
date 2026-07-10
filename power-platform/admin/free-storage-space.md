---
title: Free up storage space
description: Reduce storage space usage by deleting notes, attachments, import history, and other data with one-time or recurring jobs.
author: ianceicys-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/26/2026
ms.subservice: admin
ms.author: ceian 
ms.reviewer: ellenwehrle
contributors:
  - DanaMartens
  - IanCeicys
  - meesposi
  - sericks007
  - syalandur24
ms.contributors:
  - ceian
  - dmartens
  - sericks
  - syalandur 
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---

# Free up storage space

You can reduce storage space used by removing or deleting data from Dynamics 365 apps, such as:

- **Dynamics 365 Sales**
- **Dynamics 365 Customer Service**
- **Dynamics 365 Field Service**
- **Dynamics 365 Marketing**
- **Dynamics 365 Project Service Automation**
- **Dynamics 365 Finance and Operations**

This article describes 15 methods to help you manage storage more effectively.

Use one or more of these methods to control total data storage usage. You can delete categories of data as needed or set up bulk deletion jobs that recur at scheduled intervals. For example, you can delete notes, attachments, import history, and other data.
  
> [!WARNING]
> You can't restore your data once you delete it. You might want to increase the amount of storage space in your [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)] instead of reducing your storage space used through deletion.  

## Prerequisites

You need an administrator security role. All methods except methods 3 and 5 require this role, such as **System Administrator**. An admin role gives you permission to delete records in bulk and delete system jobs.

### Understand how storage works

- Storage consumption doesn't directly match the size reported in Microsoft Dataverse for apps. Consumption includes additional storage for metadata and encryption. For example, removing 10 MB of data doesn't necessarily reduce storage usage by 10 MB.
- Some platform operations require you to wait 24-36 hours to confirm data size changes. These operations include upgrades to newer versions and the creation of new workflows. During this time, report storage usage might temporarily increase.

## Free up storage for Dataverse

> [!NOTE]
> The system can take up to 72 hours to update storage information. We recommend that you wait up to 72 hours and monitor your storage.

Use the following methods to free up storage for each capacity type.

| Storage | Affected table(s) |  Method |
|---------|-------------------|---------|
|**Database**     |         | |
|     | **WorkflowLogBase** | **[Method 1: Delete bulk email and workflow instances by using a bulk deletion job](#method-1-delete-bulk-email-and-workflow-instances-using-a-bulk-deletion-job)**        | 
|     | **AsyncOperationBase** | **[Method 2: Evaluate and delete suspended workflows](#method-2-evaluate-and-delete-suspended-workflows)**        | 
|     | **DuplicateRecordBase**| **[Method 3: Remove bulk duplicate detection jobs and associated copies of duplicate records](#method-3-remove-bulk-duplicate-detection-jobs-and-associated-copies-of-duplicate-records)**       |
|     | **ImportJobBase** | **[Method 4: Delete bulk import instances by using a bulk deletion job](#method-4-delete-bulk-import-instances-using-a-bulk-deletion-job)**        | 
|     | **BulkDeleteOperationBase**| **[Method 5: Delete bulk deletion job instances using a bulk deletion job](#method-5-delete-bulk-deletion-job-instances-using-a-bulk-deletion-job)**        | 
|     | Various | **[Method 6: Remove unrequired tables and columns from Dataverse search](#method-6-remove-unrequired-tables-and-columns-from-dataverse-search)**        | 
|     | **ActivityPointerBase**, **EmailBase**, **EmailHashBase**, **ActivityPartyBase**, and other activity tables | **[Method 7: Remove unrequired data from activity tables](#method-7-remove-unrequired-data-from-activity-tables)** |
|     | **Postbase**, **PostCommentBase**, **PostFollowBase**, **PostLikeBase**, **PostRegardingBase**, **PostRoleBase**  | **[Method 8: Remove unrequired Activity Feeds records](#method-8-remove-unrequired-activity-feeds-records)** |
|     | **ExchangeSyncIdMappingBase**  | **[Method 9: Modify Item Level Monitoring Settings](#method-9-modify-item-level-monitoring-settings)** |
|     | **TraceLogBase**  | **[Method 10: Remove unrequired Trace (Alert) records](#method-10-remove-unrequired-alerts-trace-logs)** |
|**File** |                   |         |
|         | **Attachment**        | **[Method 1: Remove email attachments using Advanced Find](#method-1-remove-email-attachments-using-advanced-find)** |
|     | **Attachment** | **[Method 2: Remove email messages with attachments using a bulk deletion job](#method-2-remove-email-messages-with-attachments-using-a-bulk-deletion-job)**       | 
|     | **Attachment**  | **[Method 3: Remove notes with attachments using Advanced Find](#method-3-remove-notes-with-attachments-using-advanced-find)**       | 
|     | **Attachment**  | **[Method 4: Remove notes with attachments using a bulk deletion job](#method-4-remove-notes-with-attachments-using-a-bulk-deletion-job)**        | 
|**Log**     |         | |
|     | **AuditBase** | **[Method 5: Delete audit logs](#method-5-delete-audit-logs-legacy-process)**        | 
|     | **PluginTraceLogBase** | Delete plug-in trace logs using a [bulk deletion job](delete-bulk-records.md) | 

## Reduce file storage

### Method 1: Remove email attachments using Advanced Find  
  
> [!WARNING]
> If you delete this data, attachments are no longer available in customer engagement apps. However, if you saved attachments in [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)], they're still there.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list, and then select **Open**.

5. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
6. In the **Look for** list, select **Email Messages**.  
  
7. In the search criteria area, add criteria. For example:  
  
   - **Attachments (Item)**  
  
   - **File Size (Bytes)** – **Is Greater Than** - In the text box, type a byte value, such as 1,048,576 (binary for 1 MB).  

   :::image type="content" source="media/free-storage-method3a.png" alt-text="Screenshot that shows where you can find attachments in an Advanced Find." lightbox="media/free-storage-method3a.png":::

8. Select **Results**.  
  
9. Review the list of email messages that contain attachments larger than the specified size and then delete the attachments as needed.  
  
   :::image type="content" source="media/free-storage-method3b.png" alt-text="Screenshot that shows the selected emails list based on a search criteria." lightbox="media/free-storage-method3b.png" :::

### Method 2: Remove email messages with attachments using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, attachments are no longer available in customer engagement apps. However, if you saved attachments in [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)], they're still there.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in an environment." lightbox="media/free-storage-method9a-1.png":::
  
5. Select **Next**.  
  
6. In the **Look for** list, select **Email Messages**.  
  
7. In the search criteria area, add criteria. For example:  
  
   - **Status Reason** – **Equals** – **Sent** or **Received**
  
   - **Actual End** – **Older Than X Months** – 1  
  
   - **Attachments (Item)**  
  
   - **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1,048,576 (binary for 1 MB).  
  
8. Group the first two criteria rows:  
  
   1. Select the arrow next to each row, and then select **Select Row**.  
  
   1. With both rows selected, choose **Group AND**.  
  
      :::image type="content" source="media/free-storage-method4a.png" alt-text="Screenshot that shows the `Group AND` and `Group OR` options in the Define Search Criteria window." lightbox="media/free-storage-method4a.png" :::

9. Select **Next**.  
  
10. In the **Name** text box, enter a name for the bulk deletion job.  
  
11. Select a start date and time; preferably when users aren't working in customer engagement apps.  
12. Select **Run this job after every**, and then in the **days** list, select the frequency you want the job to run.

   :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::
  
13. If you want to receive a notification, select **Send an email to me (myemail@domain.com) when this job is finished**.  

14. Select **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.

### Method 3: Remove notes with attachments using Advanced Find  
  
> [!WARNING]
> If you delete this data, notes and their associated attachments are no longer available in customer engagement apps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list, and then select **Open**.

5. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
6. In the **Look for** list, select **Notes**.  
  
7. In the search criteria area, add criteria. For example:  
  
   - **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  

   :::image type="content" source="media/free-storage-method5a.png" alt-text="Screenshot that shows the search criteria in the Advanced Find tab." lightbox="media/free-storage-method5a.png":::
  
8. Select **Results**.  
  
9. Review the list of attachments that exceed the specified size.  
  
   :::image type="content" source="media/free-storage-method5b.png" alt-text="Screenshot that shows the attachment list results of your search in the Advanced Find tab." lightbox="media/free-storage-method5b.png":::

10. Select individual or multiple attachments, then select **Delete** (X).  
  
   :::image type="content" source="media/free-storage-method5c.png" alt-text="Screenshot that shows where the X icon is located on the Advanced Find tab." lightbox="media/free-storage-method5c.png":::

### Method 4: Remove notes with attachments using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, notes and their associated attachments are no longer available in customer engagement apps.  

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in an environment." lightbox="media/free-storage-method9a-1.png":::
  
5. Choose **Next**.  
  
6. In the **Look for** list, select **Notes**.  
  
7. In the search criteria area, add criteria. For example:  
  
   - **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  
  
   - **Created On** – **Older Than X Months** – 1  
  
8. Group the two criteria rows:  
  
   1. Select the arrow next to each row, and then select **Select Row**.  
  
   2. With both rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method6a.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 6." lightbox="media/free-storage-method6a.png" :::
  
9. Select **Next**.  
  
10. In the **Name** box, enter a name for the bulk deletion job.  
  
11. Select a start date and time; preferably when users aren't working in customer engagement apps.  
12. Select **Run this job after every**, and then in the **days** list, select the frequency you want the job to run.  
  
    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

13. If you want a receive a notification e-mail, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  
  
14. Select **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.

### Method 5: Delete audit logs (legacy process)

When you enable auditing, customer engagement apps create audit logs to store the audit history of the records. You can delete audit logs to free space when they're no longer needed.  
  
> [!WARNING]
> When you delete an audit log, you can no longer view the audit history for the period covered by that audit log.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list, and then select **Open**.

5. In the upper-right corner of an app, select **Settings** (![Gear button.](media/selection-rule-gear.png "Gear button"))  > **Advanced Settings** > **Settings** > **Auditing**.

6. In the **Audit** area, select **Audit Log Management**.  
  
7. Select the oldest audit log, and then select **Delete Logs**.  

   :::image type="content" source="media/free-storage-method10a.png" alt-text="Screenshot that shows where the Delete logs button is located in the Audit Log management window." lightbox="media/free-storage-method10a.png":::

8. In the confirmation message, select **OK**.

> [!NOTE]
> You can only delete the oldest audit log in the system. To delete more than one audit log repeat deleting the oldest available audit log until you have deleted enough logs.  
  
### Method 6: Delete audit logs (new process)

> [!NOTE]
> The system can take up to 72 hours to update storage information for the deletion of audit logs. After choosing to delete audit logs, we recommend waiting up to 72 hours and monitoring your storage to see avialable log capacity.

Microsoft is migrating audit logs to a new storage location. Environments that complete the data migration can use the new audit log deletion experience.

When you enable auditing, customer engagement apps create audit logs to store the audit history of the records. You can delete the audit logs to free space when they're no longer needed.  

> [!WARNING]
> After you delete an audit log, you can no longer view the audit history for the period covered by that audit log.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. Under **Auditing**, **Free up capacity**, select **Delete audit logs**.

   :::image type="content" source="media/audit-log-delete-new.png" alt-text="Screenshot that shows where the Delete logs option is located on the Auditing card of an environment." lightbox="media/audit-log-delete-new.png":::

5. Choose how to delete logs either by table, access type, or date.

   :::image type="content" source="media/audit-log-delete-select-new.png" alt-text="Screenshot that shows the Select logs to delete window where you can specify the type of logs you want to delete." lightbox="media/audit-log-delete-select-new.png":::

   | Setting  | Description  | System job name |
   | -------- | ------------ | --------------- |
   |**Delete logs by table** | Deletes audit logs for selected tables. By default all tables in the environment are shown, whether or not they contain audit data. | Delete logs for [number of] tables. |
   |**Delete access logs by people and systems** | Deletes all access logs for users and systems. | Delete access logs. |
   |**Delete all logs up to and including the selected date** | Deletes all logs up to the selected date. | Delete all logs before and including [timestamp].    |

6. Select **Delete**, and then confirm the deletion.

All audit logs are deleted by an asynchronous system job that can take up to 72 hours to run.

To monitor the status of audit delete jobs, see the next section.

#### Monitor the status of audit delete jobs in the Power Platform admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4. Select **Settings** > **Data management** > **Bulk deletion**.

   :::image type="content" source="media/free-new-storage-method.png" alt-text="Screenshot that shows where the Bulk deletion option is located in an environment." lightbox="media/free-new-storage-method.png":::

6. Review the system job and the **Status Reason** column.

   :::image type="content" source="media/audit-log-delete-job-status.png" alt-text="Screenshot that shows the system job details for bulk delete of audit logs." lightbox="media/audit-log-delete-job-status.png":::

7.  Select the job to view details.

   :::image type="content" source="media/audit-log-delete-job-details.png" alt-text="Select the job to see more details about the results of the delete job." lightbox="media/audit-log-delete-job-details.png":::

## Reduce database storage

### Method 1: Delete bulk email and workflow instances using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, you can no longer determine whether an email was sent through bulk email or whether a workflow rule ran against a record. The emails that were sent and the actions that ran as part of the workflow remain.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in the All Bulk Deletion System Jobs window." lightbox="media/free-storage-method9a-1.png":::

5. Select **Next**.  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Bulk E-mail**; **Workflow**;  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
8. Group the three criteria rows:  
  
   1. Select the arrow next to each criteria row, and then select **Select Row**.  
  
   2. When all three rows are selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method1b.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 1." lightbox="media/free-storage-method1b.png":::
  
9. Select **Next**.  
  
10. In the **Name** text box, enter a name for the bulk deletion job.  
  
11. Select a start date and time for the job. Choose a time when users aren't working in customer engagement apps.  
  
12. Select the **Run this job after every** checkbox, and then in the **days** list, select the frequency you want the job to run.  

    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

13. To receive a notification, select the **Send an e-mail to me (myemail@domain.com) when this job is finished** checkbox.  

14. Select **Next**, review the bulk deletion job details, and then select **Submit** to create the recurring job.

### Method 2: Evaluate and delete suspended workflows  

Some workflows enter a suspended state because there's a condition that can't be met or some other reason that doesn't allow the workflow to continue.  
  
> [!WARNING]
> Some workflows are suspended intentionally because a condition to be met or another issue prevents the workflow from continuing.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list, and then select **Open**.

5. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Workflow**  
  
   **Status Reason** – **Equals** – **Waiting**  
  
8. Group the two criteria rows:  
  
   1. Select the arrow next to each criteria row, and then select **Select Row**.  
  
   2. When both rows are selected, choose **Group AND**.  
  
   :::image type="content" source="media/free-storage-method2b.png" alt-text="Screenshot that shows where the Group AND is located on the Advanced Find tab." lightbox="media/free-storage-method2b.png":::

9. Select **Results**.  
  
10. In the results list, open each item workflow to determine whether it can be safely deleted.

### Method 3: Remove bulk duplicate detection jobs and associated copies of duplicate records  

Each time a duplicate detection job runs, the system stores a copy of each detected duplicate record as part of that job.

For example, if 100 duplicate records, every a duplicate detection job identifies them, whether manual or reccurring, those 100 duplicate records are stored in the database under that instance of that duplicate job. These records remain until you merge or delete the duplicates or delete the duplicate detection job instance.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. Select **Settings** > **Data management** > **Duplicate detection jobs**.  

   :::image type="content" source="media/free-storage-method-new.png" alt-text="Screenshot that shows where the Duplicate detection jobs option is located in the Settings of an environment." lightbox="media/free-storage-method-new.png":::
  
5. Select the duplicate detection job instances that you want to delete and then select **Delete** (X).  
  
   To avoid unnecessary storage consumption, resolve duplicate records promptly so that they aren't reported in multiple duplicate detection jobs.  

   :::image type="content" source="media/free-storage-method7a.png" alt-text="Screenshot that shows where the X icon is located in the Duplicate Detection Jobs window of Dynamic 365." lightbox="media/free-storage-method7a.png":::

### Method 4: Delete bulk import instances using a bulk deletion job  

Each time you run a bulk import, the system creates a corresponding system job associated with that import. The system job details show which records were imported successfully and which records failed.  
  
> [!WARNING]
> After you delete bulk import jobs, you can't view the imported data and you can't roll back the import.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4.    Select **Settings** > **Data management** > **Bulk deletion**. On the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-new-storage-method.png" alt-text="Screenshot that shows where the Bulk deletion option is located in the Settings of an environment." lightbox="media/free-new-storage-method.png":::
  
5. Select **Next**.  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Import**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
8. Group the three criteria rows:  
  
   1. Select the arrow next to each criteria row, and then select **Select Row**.  
  
   1. With all three rows selected, select **Group AND**.  

      :::image type="content" source="media/free-storage-method8a.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 8." lightbox="media/free-storage-method8a.png":::

9. Select **Next**.  
  
10. In the **Name** text box, enter a name for the bulk deletion job.  
  
11. Select a start date and time for the job; preferably when users aren't working in customer engagement apps.  
  
12. Select the **Run this job after every** checkbox, and then in the **days** list, select the frequency you want the job to run.  
  
    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

13. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

14. Choose **Next**, review the job details, and then select **Submit** to create the recurring job.

### Method 5: Delete bulk deletion job instances using a bulk deletion job  

When you delete bulk data, the system creates a bulk deletion system job. You can delete these jobs when they're no longer required.  
  
> [!WARNING]
> After you delete these jobs, you lose the history of previously run bulk deletion jobs.

1. Sign in to the [Power Platform admin center (https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in the All Bulk Deletion System Jobs window.":::
  
5. Select **Next**.  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Bulk Delete**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
   > [!NOTE]
   > You can also delete jobs that failed or were canceled.  
  
8. Group the three criteria rows:  
  
   1. Select the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, select **Group AND**.  

      :::image type="content" source="media/free-storage-method9a.png" alt-text="Screenshot that shows where The Group AND option is located in the Define Search Criteria window." lightbox="media/free-storage-method9a.png":::
  
9. Select **Next**.  
  
10. In the **Name** text box, enter a name for the bulk deletion job.  
  
11. Select a start date and time for the job; preferably when users aren't working in customer engagement apps.  
  
12. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.

   :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::
  
13. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

14. Select **Next**, review the job details, and then select **Submit** to create the recurring job.

### Method 6: Remove unrequired tables and columns from Dataverse search

Tables and table fields enabled for Dataverse search affect database storage capacity.

- To update the list of tables selected for Dataverse search results, refer to [Select tables for Dataverse search's global search](configure-relevance-search-organization.md#select-tables-for-dataverse-searchs-global-search).
- To revise the list of fields selected for each table for Dataverse search results, refer to [Select searchable fields and filters for each table for global search](configure-relevance-search-organization.md#select-searchable-fields-and-filters-for-each-table-for-global-search).

### Method 7: Remove unrequired data from activity tables

Activity tables store records for [activities](/power-apps/developer/data-platform/activity-entities) such as emails, appointments, tasks, calls, etc. To learn more about what data these tables contain, refer to [Activities data model and storage](/power-apps/developer/data-platform/activities-data-model-storage).

### Method 8: Remove unrequired Activity Feeds records

These tables store post related records for [Activity Feeds](/dynamics365/customerengagement/on-premises/basics/stay-up-date-with-customer-news-with-activity-feed) functionality. To free storage space, you can delete any Post records that are no longer required.

### Method 9: Modify Item Level Monitoring Settings

The ExchangeSyncIdMappingBase table stores references between Dynamics 365 records and their corresponding records in Microsoft Exchange. Server-Side Synchronization feature uses this table to sync emails, appointments, contacts, and tasks between Dynamics 365 and Microsoft Exchange.

The system stores additional rows to help troubleshoot the synchronization of specific items. For more information, refer to [Troubleshoot item level Server-Side Synchronization issues with Microsoft Dynamics 365](/troubleshoot/dynamics-365/sales/troubleshoot-item-level-server-side-synchronization-issues). This article provides details regarding to reduce the default retention period (three days) for troubleshooting records or disable the feature entirely. Rows unrelated to this feature can't be deleted and are required for Appointment, Contact, and Task synchronization.

### Method 10: Remove unrequired Alerts (trace logs)

The [Server-Side Synchronization](server-side-synchronization.md) feature logs alerts when events occur, such as mailbox errors or warnings. The system also logs informational alerts when you enable a mailbox. You can view these alerts when you view a Mailbox or Email Server profile within the Email Configuration area of Advanced Settings. While these records appear in a tab called **Alerts**, they're actually Trace records. 

To free storage space, delete trace records that are no longer required. You can delete these records from the **Alerts** tab of an Email Server Profile or Mailbox record, or by using Advanced Find or a [Bulk Delete](delete-bulk-records.md) job.

You can also configure which levels the system logs. For more information, refer to [System Settings Email tab](system-settings-dialog-box-email-tab.md).

## Free up storage used by flow approvals

View [Delete approval history from Power Automate](/power-automate/gdpr-dsr-delete#delete-approval-history-from-power-automate).

## Free up storage used by the SubscriptionTrackingDeletedObject table

View [Subscription Tracking Deleted Object Table](subscription-tracking-deleted-object-retention.md).

### Related content

- [Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
