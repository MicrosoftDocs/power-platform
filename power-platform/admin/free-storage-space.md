---
title: "Free up storage space  | MicrosoftDocs"
description: Reduce storage space usage by deleting notes, attachments, import history, and other data with one-time or recurring jobs.
author: peakerbl 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 2/28/2023
ms.subservice: admin
ms.author: peakerbl  
ms.reviewer: jimholtz
contributors:
  - DanaMartens
  - ProfessorKendrick
search.audienceType: 
  - admin
---
# Free up storage space

These are ways to reduce the amount of storage space used by removing or deleting different types of information from customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). Use one or more of these methods to control your total data storage usage. You can delete certain categories of data as the need arises, or you can set up bulk deletion jobs to reoccur at set intervals.  
  
> [!WARNING]
> The suggestions in this topic include deleting notes, attachments, import history, and other data. Before you delete data, be sure that the data is no longer needed because you cannot retrieve deleted data. There is no "undo" to restore your data once it has been deleted. This means it may make more sense for you to increase the amount of storage space you have with your [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)] instead of reducing the amount of storage space used.  
> 
> [!NOTE]
> - Except for methods 3 and 5, all these methods require that you have an administrator security role, such as System Administrator. This gives you permission to delete records in bulk and to delete system jobs.  
> - After performing actions to free up storage, the system can take up to 24 hours to update storage information. We recommend waiting up to 24 hours and monitoring your storage.  
> - Storage consumed does not directly correspond to the size reported in Microsoft Dataverse for Apps; consumption includes additional storage for metadata and encryption. For example, removing 10MB of storage from a file does not mean the file size is reduced by 10MB.
> - Some platform operations require you to wait 24-36 hours to confirm data size changes. Such operations include but are not limited to upgrades to new versions and introduction of new workflows. Such operations require system adjustments that might result in a momentary size increase report.

## Freeing storage for Dataverse

Use the following methods to free up storage for each of the capacity types.

| Storage | Affected Table(s) |  Method |
|---------|---------|---------|
|**File**     |        | |
|     | Attachment | **[Method 3](#method-3-remove-email-attachments-using-advanced-find)**: Remove email attachments using Advanced Find         |
|     | Attachment | **[Method 4](#method-4-remove-email-messages-with-attachments-using-a-bulk-deletion-job)**: Remove email messages with attachments using a bulk deletion job        | 
|     | Attachment  | **[Method 5](#method-5-remove-notes-with-attachments-using-advanced-find)**: Remove notes with attachments using Advanced Find        | 
|     | Attachment  | **[Method 6](#method-6-remove-notes-with-attachments-using-a-bulk-deletion-job)**: Remove notes with attachments using a bulk deletion job        | 
|**Log**     |         | |
|     | AuditBase | **[Method 10](#method-10-delete-audit-logs---legacy-process)**: Delete audit logs        | 
|     | PluginTraceLogBase | Delete plug-in trace logs using a [bulk deletion job](delete-bulk-records.md) | 
|**Database**     |         | |
|     | WorkflowLogBase | **[Method 1](#method-1-delete-bulk-email-and-workflow-instances-using-a-bulk-deletion-job)**: Delete bulk email and workflow instances using a bulk deletion job        | 
|     | AsyncOperationBase | **[Method 2](#method-2-evaluate-and-delete-suspended-workflows)**: Evaluate and delete suspended workflows        | 
|     | DuplicateRecordBase| **[Method 7](#method-7-remove-bulk-duplicate-detection-jobs-and-associated-copies-of-duplicate-records)**: Remove bulk duplicate detection jobs and associated copies of duplicate records        |
|     | ImportJobBase | **[Method 8](#method-8-delete-bulk-import-instances-using-a-bulk-deletion-job)**: Delete bulk import instances using a bulk deletion job        | 
|     | BulkDeleteOperationBase| **[Method 9](#method-9-delete-bulk-deletion-job-instances-using-a-bulk-deletion-job)**: Delete bulk deletion job instances using a bulk deletion job        | 
|     | various | **[Method 11](#method-11-remove-unrequired-tables-and-columns-from-dataverse-search)**: Remove unrequired tables and columns from Dataverse search        | 
|     | ActivityPointerBase, EmailBase, ActivityPartyBase, and other activity tables | **[Method 12](#method-12-remove-unrequired-data-from-activity-tables)**: Remove unrequired data from activity tables |
|     | Postbase, PostCommentBase, PostFollowBase, PostLikeBase, PostRegardingBase, PostRoleBase  | **[Method 13](#method-13-remove-unrequired-activity-feeds-records)**: Remove unrequired Activity Feeds records |
|     | ExchangeSyncIdMappingBase  | **[Method 14](#method-14-modify-item-level-monitoring-settings)**: Modify Item Level Monitoring Settings |
|     | TraceLogBase  | **[Method 15](#method-15-remove-unrequired-alerts-trace-logs)**: Remove unrequired Trace (Alert) records |

## Reduce file storage

### Method 3: Remove email attachments using Advanced Find  
  
> [!WARNING]
> If you delete this data, the attachments will no longer be available in customer engagement apps. However, if you have them saved in [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)], they will still be there.  

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments**, select an environment from the list, and then select **Open**.

3. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
4. In the **Look for** list, select **Email Messages**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **Attachments (Item)**  
  
   **File Size (Bytes)** – **Is Greater Than** - In the text box, type a byte value, such as 1,048,576 (this is binary for 1MB).  
 
   > [!div class="mx-imgBorder"] 
   > ![Free up storage method 3.](media/free-storage-method3a.png "Free up storage method 3")  
 
6. Choose **Results**.  
  
7. You will now have a list of email messages that have attachments that are larger than 'X' bytes. Review the emails and delete the attachments as needed.  
  
   > [!div class="mx-imgBorder"] 
   > ![Free up storage method 3.](media/free-storage-method3b.png "Free up storage method 3")  

### Method 4: Remove email messages with attachments using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, the email messages and their associated attachments will no longer be available in customer engagement apps. However, if you have them saved in [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)], they will still be there.  
  
1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. This opens the Bulk Deletion Wizard.  
  
3. Choose **Next**.  
  
4. In the **Look for** list, select **Email Messages**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **Status Reason** – **Equals** – **Sent** or **Received**
  
   **Actual End** – **Older Than X Months** – 1  
  
   **Attachments (Item)**  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1,048,576 (this is binary for 1MB).  
  
6. Group the first two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With both rows selected, choose **Group AND**.  
  
      > [!div class="mx-imgBorder"] 
      > ![Free up storage method 4.](media/free-storage-method4a.png "Free up storage method 4")  

7. Choose **Next**.  
  
8. In the **Name** text box, type a name for the bulk deletion job.  
  
9. Select a date and time for the job start time; preferably a time when users are not in customer engagement apps.  
  
10. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
11. If you want a notification e-mail sent, select the **Send an email to me (email@domain.com) when this job is finished** check box.  
  
    > [!div class="mx-imgBorder"] 
    > ![Free up storage method 4.](media/free-storage-method6b.png "Free up storage method 4")  

12. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  
  
### Method 5: Remove notes with attachments using Advanced Find  
  
> [!WARNING]
> If you delete this data, notes and their associated attachments will no longer be available in customer engagement apps.  
  
1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments**, select an environment from the list, and then select **Open**.

3. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
4. In the **Look for** list, select **Notes**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  

   > [!div class="mx-imgBorder"] 
   > ![Free up storage method 5.](media/free-storage-method5a.png "Free up storage method 5")
  
6. Choose **Results**.  
  
7. You will now have a list of attachments that are larger than the size you specified.  
  
   > [!div class="mx-imgBorder"] 
   > ![Free up storage method 5.](media/free-storage-method5b.png "Free up storage method 5")

8. Select individual or a multiple attachments, and then choose **Delete** (X).  
  
   > [!div class="mx-imgBorder"] 
   > ![Free up storage method 5.](media/free-storage-method5c.png "Free up storage method 5")

### Method 6: Remove notes with attachments using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, notes and their associated attachments will no longer be available in customer engagement apps.  
  
1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. This opens the Bulk Deletion Wizard.  
  
3. Choose **Next**.  
  
4. In the **Look for** list, select **Notes**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  
  
   **Created On** – **Older Than X Months** – 1  
  
6. Group the two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      > [!div class="mx-imgBorder"] 
      > ![Free up storage method 6.](media/free-storage-method6a.png "Free up storage method 6")  
  
7. Choose **Next**.  
  
8. In the **Name** text box, type a name for the bulk deletion job.  
  
9. Select a date and time for the job start time; preferably a time when users are not in customer engagement apps.  
  
10. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
11. If you want a notification e-mail sent, select the **Send an email to me (email@domain.com) when this job is finished** check box.  
  
    > [!div class="mx-imgBorder"] 
    > ![Free up storage method 6.](media/free-storage-method6b.png "Free up storage method 6")  
  
12. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  

## Reduce log storage
Microsoft is migrating audit logs to a new storage location. Environments whose data migration is complete can use the new audit delete method. An environment with completed migration can be easily identified by the Auditing card visible below the Environment details.

:::image type="content" source="media/audit-log-new-storage-sign.png" alt-text="Audit tile appears for new storage":::

### Method 10: Delete audit logs - legacy process

 When you enable auditing, customer engagement apps create audit logs to store the audit history of the records. You can delete these audit logs to free space when they are no longer needed.  
  
> [!WARNING]
> When you delete an audit log, you can no longer view the audit history for the period covered by that audit log.  

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments**, select an environment from the list, and then select **Open**.
  
3. In the upper-right corner of an app, select **Settings** (![Gear button.](media/selection-rule-gear.png "Gear button"))  > **Advanced Settings** > **Settings** > **Auditing**.

4. In the **Audit** area choose **Audit Log Management**.  
  
5. Select the oldest audit log, then choose **Delete Logs**.  
 
   > [!div class="mx-imgBorder"] 
   > ![Free up storage method 10.](media/free-storage-method10a.png "Free up storage method 10")  
 
6. In the confirmation message choose **OK**.  
  
> [!NOTE]
> You can only delete the oldest audit log in the system. To delete more than one audit log repeat deleting the oldest available audit log until you have deleted enough logs.  
  
### Method 10: Delete audit logs - new process

Microsoft is migrating audit logs to a new storage location. Environments whose data migration is complete can use the new audit delete experience.

When you enable auditing, customer engagement apps create audit logs to store the audit history of the records. You can delete these audit logs to free space when they are no longer needed.  

> [!WARNING]
> When you delete an audit log, you can no longer view the audit history for the period covered by that audit log.  

1. Sign in to the Power Platform admin center, and then select an environment. 

2. Under **Auditing**, select **Delete logs**.

   :::image type="content" source="media/audit-log-delete.png" alt-text="Select Delete to delete audit logs.":::

3. Delete audit logs to free up log storage capacity for the selected environment.
 
   :::image type="content" source="media/audit-log-delete-select.png" alt-text="Select audit logs to delete.":::

   |Setting  |Description  | System job name |
   |---------|---------|
   |**Delete logs by table**     |Select one or more tables for which you want to delete audit logs. By default all tables in the environment will be shown, whether they contain audit data or not.         | Delete logs for [number of] tables.    |
   |**Delete access logs by people and systems**     | Delete all access logs. This will delete all logs for all users and systems.        | Delete access logs. |
   |**Delete all logs up to and including the selected date**     | Delete logs including the date selected.         | Delete all logs before and including [timestamp].    |

4. Select **Delete**, and then confirm the deletions.

All data will be deleted in an asynchronous background system job. 

To monitor the status of audit delete jobs, see the next section.

#### Monitor the status of audit delete jobs in the Power Platform admin center

1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Data management** > **Bulk deletion**.

3. Select the system job name to open details about your delete job.


## Reduce database storage

### Method 1: Delete bulk email and workflow instances using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, you will no longer be able to tell if an email was sent through bulk email or if a workflow rule ran against a record. The emails that were sent and the actions that ran against the record in the workflow will remain.  
  
1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. This opens the Bulk Deletion Wizard.  
  
3. Choose **Next**.  
  
4. In the **Look for** list, select **System Jobs**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Bulk E-mail**; **Workflow**;  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
6. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      > [!div class="mx-imgBorder"] 
      > ![Free up storage method 10.](media/free-storage-method1b.png "Free up storage method 10")  
  
7. Choose **Next**.  
  
8. In the **Name** text box, type a name for the bulk deletion job.  
  
9. Select a date and time for the job start time; preferably a time when users are not in customer engagement apps.  
  
10. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
11. If you want a notification e-mail sent, select the **Send an e-mail to me (email@domain.com) when this job is finished** check box.  
 
    > [!div class="mx-imgBorder"] 
    > ![Free up storage method 10.](media/free-storage-method6b.png "Free up storage method 10")  
 
12. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  
  
### Method 2: Evaluate and delete suspended workflows  

 Sometimes workflows will enter a suspended state because there is a condition that will never be met or some other reason that will not allow the workflow to continue.  
  
> [!WARNING]
> Some workflows will be in a suspended state because they are waiting for a condition that has not yet been met, which is expected. For example, a workflow may be waiting for a task to be completed.  
  
1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments**, select an environment from the list, and then select **Open**.

3. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
4. In the **Look for** list, select **System Jobs**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Workflow**  
  
   **Status Reason** – **Equals** – **Waiting**  
  
6. Group the two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With both rows selected, choose **Group AND**.  
  
      > [!div class="mx-imgBorder"] 
      > ![Free up storage method 2.](media/free-storage-method2b.png "Free up storage method 2")  

7. Choose **Results**.  
  
8. In the results window, you can open each item to determine whether the workflow can be deleted.  
  
### Method 7: Remove bulk duplicate detection jobs and associated copies of duplicate records  

 Every time that a duplicate detection job runs, a copy of each duplicate record is stored in the database as part of the duplicate detection job. For example, if you have 100 duplicate records, every time that you run a duplicate detection job that finds these duplicates, whether it is manual or reoccurring, those 100 duplicate records will be stored in the database under that instance of that duplicate job until the duplicates are merged or deleted, or until the instance of that duplicate detection job is deleted.  
  
1.	In the Power Platform admin center, select an environment.

2.	Select **Settings** > **Data management** > **Duplicate Detection Jobs**.  
  
3. Select the duplicate detection job instances you want to delete and then choose **Delete** (X).  
  
   To avoid wasting storage space, make sure duplicates are resolved promptly so that they are not reported in multiple duplicate detection jobs.  

> [!div class="mx-imgBorder"] 
> ![Free up storage method 7.](media/free-storage-method7a.png "Free up storage method 7")  
  
### Method 8: Delete bulk import instances using a bulk deletion job  

 Every time you perform a bulk import, there is a system job associated with that import. The system job details show which records imported successfully and which records failed.  
  
> [!WARNING]
> After you delete these bulk import jobs, you will not be able to see what data was imported and you cannot roll back the import.  
  
1.	In the Power Platform admin center, select an environment.

2.	Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. This opens the Bulk Deletion Wizard.  
  
3. Choose **Next**.  
  
4. In the **Look for** list, select **System Jobs**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Import**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
6. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  
 
      > [!div class="mx-imgBorder"] 
      > ![Free up storage method 8.](media/free-storage-method8a.png "Free up storage method 8")  
 
7. Choose **Next**.  
  
8. In the **Name** text box, type a name for the bulk deletion job.  
  
9. Select a date and time for the job start time; preferably a time when users are not in customer engagement apps.  
  
10. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
11. If you want a notification e-mail sent, select the **Send an email to me (email@domain.com) when this job is finished** check box.  
  
    > [!div class="mx-imgBorder"] 
    > ![Free up storage method 8.](media/free-storage-method6b.png "Free up storage method 8")  

12. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  
  
### Method 9: Delete bulk deletion job instances using a bulk deletion job  

 When you are bulk deleting data, such as in many of the methods described in this article, a bulk deletion system job is created and can be deleted.  
  
> [!WARNING]
> After you delete these jobs, you will lose the history of the prior bulk deletion jobs that you've run.  
  
1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. This opens the Bulk Deletion Wizard.  
  
3. Choose **Next**.  
  
4. In the **Look for** list, select **System Jobs**.  
  
5. In the search criteria area, add criteria similar to the following:  
  
   **System Job Type** – **Equals** – **Bulk Delete**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
   > [!NOTE]
   > You could also delete jobs that have failed or been canceled.  
  
6. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      > [!div class="mx-imgBorder"] 
      > ![Free up storage method 9.](media/free-storage-method9a.png "Free up storage method 9")  
  
7. Choose **Next**.  
  
8. In the **Name** text box, type a name for the bulk deletion job.  
  
9. Select a date and time for the job start time; preferably a time when users are not in customer engagement apps.  
  
10. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
11. If you want a notification e-mail sent, select the **Send an email to me (email@domain.com) when this job is finished** check box.  
  
    > [!div class="mx-imgBorder"] 
    > ![Free up storage method 9.](media/free-storage-method6b.png "Free up storage method 9")  

12. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  

### Method 11: Remove unrequired tables and columns from Dataverse search

Tables and tables fields enabled for Dataverse search have an impact on the database storage capacity. 

- To revise the list of tables selected for Dataverse search results, see [Select entities for Dataverse search](configure-relevance-search-organization.md#select-tables-for-dataverse-search).
- To revise the list of fields selected for each table for Dataverse search results, see [Select searchable fields and filters for each table](configure-relevance-search-organization.md#select-searchable-fields-and-filters-for-each-table).

### Method 12: Remove unrequired data from activity tables
These tables store records for [activities](/power-apps/developer/data-platform/activity-entities) such as emails, appointments, tasks, calls, etc. To learn more about what data these tables contain, see [Activities data model and storage](/power-apps/developer/data-platform/activities-data-model-storage).

### Method 13: Remove unrequired Activity Feeds records
These tables store post related records for [Activity Feeds](/dynamics365/customerengagement/on-premises/basics/stay-up-date-with-customer-news-with-activity-feed?view=op-9-1) functionality. To free space you can delete any Post records which are no longer required. 

### Method 14: Modify Item Level Monitoring Settings
The ExchangeSyncIdMappingBase table contains references between Dynamics 365 records and the corresponding records in Microsoft Exchange. This table is used by the Server-Side Synchronization feature which enables synchronization of emails, appointments, contacts, and tasks between Dynamics 365 and Microsoft Exchange. 

Additional rows are stored in this table to help with troubleshooting the synchronization of specific items. For additional information, see [Troubleshoot item level Server-Side Synchronization issues with Microsoft Dynamics 365](/troubleshoot/dynamics-365/sales/troubleshoot-item-level-server-side-synchronization-issues). This article provides details regarding how you can reduce the default duration (3 days) of how long these troubleshooting records exist. This troubleshooting feature can also be disabled. Rows unrelated to this feature cannot be deleted and are required for Appointment, Contact, and Task synchronization.

### Method 15: Remove unrequired Alerts (trace logs)
The [Server-Side Synchronization](server-side-synchronization.md) feature logs alerts when different events occur such as a mailbox encountering an error or warning. There are also informational alerts logged when you enable a mailbox. You can view these Alerts when you view a Mailbox or Email Server profile within the Email Configuration area of Advanced Settings. While these records appear in a tab called Alerts, these are actually Trace records. To free space consumed by these Alerts, you can delete any Trace records which are no longer required. Trace records can be deleted within the Alerts tab of an Email Server Profile or Mailbox record. They can also be deleted using Advanced Find or a [Bulk Delete](delete-bulk-records.md) job. 

You can also configure which levels of alerts are logged. See [System Settings Email tab](system-settings-dialog-box-email-tab.md).

## Free up storage used by flow approvals 

See [Delete approval history from Power Automate](/power-automate/gdpr-dsr-delete#delete-approval-history-from-power-automate).

### See also
[Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]


