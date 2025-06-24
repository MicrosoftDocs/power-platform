---
title: Free up storage space
description: Reduce storage space usage by deleting notes, attachments, import history, and other data with one-time or recurring jobs.
author: ianceicys-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/29/2025
ms.subservice: admin
ms.author: ceian 
ms.reviewer: sericks
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
---

# Free up storage space

You can reduce the amount of storage space used by removing or deleting information from Dynamics 365 apps, such as:

- **Dynamics 365 Sales**
- **Dynamics 365 Customer Service**
- **Dynamics 365 Field Service**
- **Dynamics 365 Marketing**
- **Dynamics 365 Project Service Automation**
- **Dynamics 365 Finance and Operations**

This article gives you 15 methods to better manage storage.

Use one or more of these methods to control your total data storage usage. You can delete categories of data as the need arises or set up bulk deletion jobs to reoccur at set intervals. For example, you can delete notes, attachments, import history, and other data.
  
> [!WARNING]
> You can't restore your data once it's deleted. You might want to increase the amount of storage space in your [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)] instead of reducing your storage space used through deletion.  

## Prerequisites

An administrator security role is required. All methods (except three and five) require this role, such as System Administrator. An admin role gives you permission to delete records in bulk and delete system jobs.

### Understand how storage works

- Storage consumed doesn't directly correspond to the size reported in Microsoft Dataverse for Apps. Consumption includes extra storage for metadata and encryption. For example, removing 10 MB of storage from a file doesn't mean the file size is reduced by 10 MB.
- Some platform operations require you to wait 24-36 hours to confirm data size changes. These operations include upgrades to new versions and introduction of new workflows. Such operations require system adjustments that might result in a momentary size increase report.

## Freeing storage for Dataverse

> [!NOTE]
> The system can take up to 72 hours to update storage information. We recommend waiting up to 72 hours and monitoring your storage.

Use the following methods to free up storage for each of the capacity types.

| Storage | Affected Table(s) |  Method |
|---------|-------------------|---------|
|**Database**     |         | |
|     | **WorkflowLogBase** | **[Method 1](#method-1-delete-bulk-email-and-workflow-instances-using-a-bulk-deletion-job)**: Delete bulk email and workflow instances using a bulk deletion job        | 
|     | **AsyncOperationBase** | **[Method 2](#method-2-evaluate-and-delete-suspended-workflows)**: Evaluate and delete suspended workflows        | 
|     | **DuplicateRecordBase**| **[Method 7](#method-7-remove-bulk-duplicate-detection-jobs-and-associated-copies-of-duplicate-records)**: Remove bulk duplicate detection jobs and associated copies of duplicate records        |
|     | **ImportJobBase** | **[Method 8](#method-8-delete-bulk-import-instances-using-a-bulk-deletion-job)**: Delete bulk import instances using a bulk deletion job        | 
|     | **BulkDeleteOperationBase**| **[Method 9](#method-9-delete-bulk-deletion-job-instances-using-a-bulk-deletion-job)**: Delete bulk deletion job instances using a bulk deletion job        | 
|     | various | **[Method 11](#method-11-remove-unrequired-tables-and-columns-from-dataverse-search)**: Remove unrequired tables and columns from Dataverse search        | 
|     | **ActivityPointerBase**, **EmailBase**, **EmailHashBase**, **ActivityPartyBase**, and other activity tables | **[Method 12](#method-12-remove-unrequired-data-from-activity-tables)**: Remove unrequired data from activity tables |
|     | **Postbase**, **PostCommentBase**, **PostFollowBase**, **PostLikeBase**, **PostRegardingBase**, **PostRoleBase**  | **[Method 13](#method-13-remove-unrequired-activity-feeds-records)**: Remove unrequired Activity Feeds records |
|     | **ExchangeSyncIdMappingBase**  | **[Method 14](#method-14-modify-item-level-monitoring-settings)**: Modify Item Level Monitoring Settings |
|     | **TraceLogBase**  | **[Method 15](#method-15-remove-unrequired-alerts-trace-logs)**: Remove unrequired Trace (Alert) records |
|**File** |                   |         |
|         | **Attachment**        | **[Method 3](#method-3-remove-email-attachments-using-advanced-find)**: Remove email attachments using Advanced Find |
|     | **Attachment** | **[Method 4](#method-4-remove-email-messages-with-attachments-using-a-bulk-deletion-job)**: Remove email messages with attachments using a bulk deletion job        | 
|     | **Attachment**  | **[Method 5](#method-5-remove-notes-with-attachments-using-advanced-find)**: Remove notes with attachments using Advanced Find        | 
|     | **Attachment**  | **[Method 6](#method-6-remove-notes-with-attachments-using-a-bulk-deletion-job)**: Remove notes with attachments using a bulk deletion job        | 
|**Log**     |         | |
|     | **AuditBase** | **[Method 10](#method-10-delete-audit-logs---legacy-process)**: Delete audit logs        | 
|     | **PluginTraceLogBase** | Delete plug-in trace logs using a [bulk deletion job](delete-bulk-records.md) | 

## Reduce file storage

### Method 3: Remove email attachments using Advanced Find  
  
> [!WARNING]
> If you delete this data, attachments are no longer available in customer engagement apps. However, if you saved attachments in [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)], they're still there.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list and then select **Open**.

5. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
6. In the **Look for** list, select **Email Messages**.  
  
7. In the search criteria area, add criteria, for example:  
  
   **Attachments (Item)**  
  
   **File Size (Bytes)** – **Is Greater Than** - In the text box, type a byte value, such as 1,048,576 (binary for 1 MB).  

   :::image type="content" source="media/free-storage-method3a.png" alt-text="Screenshot that shows where you can find attachments in an Advanced Find." lightbox="media/free-storage-method3a.png":::

8. Choose **Results**.  
  
9. You now have a list of email messages that have attachments that are larger than 'X' bytes. Review the emails and delete the attachments as needed.  
  
   :::image type="content" source="media/free-storage-method3b.png" alt-text="Screenshot that shows the selected emails list based on a search criteria." lightbox="media/free-storage-method3b.png" :::

##### [Classic admin center](#tab/classic) 

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments**, select an environment from the list, and then select **Open**.

1. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
1. In the **Look for** list, select **Email Messages**.  
  
1. In the search criteria area, add criteria, for example:  
  
   **Attachments (Item)**  
  
   **File Size (Bytes)** – **Is Greater Than** - In the text box, type a byte value, such as 1,048,576 (binary for 1 MB).  

   :::image type="content" source="media/free-storage-method3a.png" alt-text="Screenshot that shows where you can find attachments in an Advanced Find." lightbox="media/free-storage-method3a.png":::

1. Choose **Results**.  
  
1. You now have a list of email messages that have attachments that are larger than 'X' bytes. Review the emails and delete the attachments as needed.  
  
   :::image type="content" source="media/free-storage-method3b.png" alt-text="Screenshot that shows the selected emails list based on a search criteria." lightbox="media/free-storage-method3b.png" :::

---

### Method 4: Remove email messages with attachments using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, attachments are no longer available in customer engagement apps. However, if you saved attachments in [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)], they're still there.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in an environment." lightbox="media/free-storage-method9a-1.png":::
  
5. Choose **Next**.  
  
6. In the **Look for** list, select **Email Messages**.  
  
7. In the search criteria area, add similar criteria, for example:  
  
   **Status Reason** – **Equals** – **Sent** or **Received**
  
   **Actual End** – **Older Than X Months** – 1  
  
   **Attachments (Item)**  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1,048,576 (binary for 1 MB).  
  
8. Group the first two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   1. With both rows selected, choose **Group AND**.  
  
      :::image type="content" source="media/free-storage-method4a.png" alt-text="Screenshot that shows the `Group AND` and `Group OR` options in the Define Search Criteria window." lightbox="media/free-storage-method4a.png" :::

9. Choose **Next**.  
  
10. In the **Name** text box, type a name for the bulk deletion job.  
  
11. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
12. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.

   :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::
  
13. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

14. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  

##### [Classic admin center](#tab/classic) 
  
1. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select an environment.

1. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in an environment." lightbox="media/free-storage-method9a-1.png":::
  
1. Choose **Next**.  
  
1. In the **Look for** list, select **Email Messages**.  
  
1. In the search criteria area, add similar criteria, for example:  
  
   **Status Reason** – **Equals** – **Sent** or **Received**
  
   **Actual End** – **Older Than X Months** – 1  
  
   **Attachments (Item)**  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1,048,576 (binary for 1 MB).  
  
1. Group the first two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   1. With both rows selected, choose **Group AND**.  
  
      :::image type="content" source="media/free-storage-method4a.png" alt-text="Screenshot that shows the `Group AND` and `Group OR` options in the Define Search Criteria window." lightbox="media/free-storage-method4a.png" :::

1. Choose **Next**.  
  
1. In the **Name** text box, type a name for the bulk deletion job.  
  
1. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
1. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.

   :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::
  
1. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

1. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.

---
  
### Method 5: Remove notes with attachments using Advanced Find  
  
> [!WARNING]
> If you delete this data, notes and their associated attachments are no longer available in customer engagement apps.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list and select **Open**.

5. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
6. In the **Look for** list, select **Notes**.  
  
7. In the search criteria area, add similar criteria, for example:  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  

   :::image type="content" source="media/free-storage-method5a.png" alt-text="Screenshot that shows the search criteria in the Advanced Find tab." lightbox="media/free-storage-method5a.png":::
  
8. Choose **Results**.  
  
9. You now have a list of attachments that are larger than the size you specified.  
  
   :::image type="content" source="media/free-storage-method5b.png" alt-text="Screenshot that shows the attachment list results of your search in the Advanced Find tab." lightbox="media/free-storage-method5b.png":::

10. Select individual or multiple attachments, then choose **Delete** (X).  
  
   :::image type="content" source="media/free-storage-method5c.png" alt-text="Screenshot that shows where the X icon is located on the Advanced Find tab." lightbox="media/free-storage-method5c.png":::

##### [Classic admin center](#tab/classic)
  
1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments**, select an environment from the list, and then select **Open**.

1. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
1. In the **Look for** list, select **Notes**.  
  
1. In the search criteria area, add similar criteria, for example:  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  

   :::image type="content" source="media/free-storage-method5a.png" alt-text="Screenshot that shows the search criteria in the Advanced Find tab." lightbox="media/free-storage-method5a.png":::
  
1. Choose **Results**.  
  
1. You now have a list of attachments that are larger than the size you specified.  
  
   :::image type="content" source="media/free-storage-method5b.png" alt-text="Screenshot that shows the attachment list results of your search in the Advanced Find tab." lightbox="media/free-storage-method5b.png":::

1. Select individual or multiple attachments, then choose **Delete** (X).  
  
   :::image type="content" source="media/free-storage-method5c.png" alt-text="Screenshot that shows where the X icon is located on the Advanced Find tab." lightbox="media/free-storage-method5c.png":::

---

### Method 6: Remove notes with attachments using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, notes and their associated attachments are no longer available in customer engagement apps.  

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and select an environment.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in an environment." lightbox="media/free-storage-method9a-1.png":::
  
5. Choose **Next**.  
  
6. In the **Look for** list, select **Notes**.  
  
7. In the search criteria area, add similar criteria, for example:  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  
  
   **Created On** – **Older Than X Months** – 1  
  
8. Group the two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method6a.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 6." lightbox="media/free-storage-method6a.png" :::
  
9. Choose **Next**.  
  
10. In the **Name** text box, type a name for the bulk deletion job.  
  
11. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
12. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

13. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  
  
14. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job. 

##### [Classic admin center](#tab/classic)
  
1. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select an environment.

1. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in an environment." lightbox="media/free-storage-method9a-1.png":::
  
1. Choose **Next**.  
  
1. In the **Look for** list, select **Notes**.  
  
1. In the search criteria area, add similar criteria, for example:  
  
   **File Size (Bytes)** – **Is Greater Than** – In the text box, type a byte value, such as 1048576.  
  
   **Created On** – **Older Than X Months** – 1  
  
1. Group the two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method6a.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 6." lightbox="media/free-storage-method6a.png" :::
  
1. Choose **Next**.  
  
1. In the **Name** text box, type a name for the bulk deletion job.  
  
1. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
1. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

1. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  
  
1. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  

---

## Reduce log storage

Microsoft is migrating audit logs to a new storage location. Environments whose data migration is complete can use the new audit delete method. You can identify an environment with completed migration with the Auditing card near the environment details.

:::image type="content" source="media/audit-log-new-storage-sign.png" alt-text="Screenshot that shows where an Auditing tile appears for new storage." lightbox="media/audit-log-new-storage-sign.png":::

In the new Power Platform Admin Center, the Auditing card for an environment looks as shown in the following image:

:::image type="content" source="media/audit-log-new-storage-sign-new.png" alt-text="Screenshot that shows where an Auditing tile appears for new storage in the new admin center." lightbox="media/audit-log-new-storage-sign-new.png":::

### Method 10: Delete audit logs - legacy process

 When you enable auditing, customer engagement apps create audit logs to store the audit history of the records. You can delete audit logs to free space when they're no longer needed.  
  
> [!WARNING]
> When you delete an audit log, you can no longer view the audit history for the period covered by that audit log.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list, and then select **Open**.

5. In the upper-right corner of an app, select **Settings** (![Gear button.](media/selection-rule-gear.png "Gear button"))  > **Advanced Settings** > **Settings** > **Auditing**.

6. In the **Audit** area, choose **Audit Log Management**.  
  
7. Select the oldest audit log, then choose **Delete Logs**.  

   :::image type="content" source="media/free-storage-method10a.png" alt-text="Screenshot that shows where the Delete logs button is located in the Audit Log management window." lightbox="media/free-storage-method10a.png":::

8. In the confirmation message, choose **OK**.

##### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments**, select an environment from the list, and then select **Open**.
  
1. In the upper-right corner of an app, select **Settings** (![Gear button.](media/selection-rule-gear.png "Gear button"))  > **Advanced Settings** > **Settings** > **Auditing**.

1. In the **Audit** area, choose **Audit Log Management**.  
  
1. Select the oldest audit log, then choose **Delete Logs**.  

   :::image type="content" source="media/free-storage-method10a.png" alt-text="Screenshot that shows where the Delete logs button is located in the Audit Log management window." lightbox="media/free-storage-method10a.png":::

1. In the confirmation message, choose **OK**.  

---
  
> [!NOTE]
> You can only delete the oldest audit log in the system. To delete more than one audit log repeat deleting the oldest available audit log until you have deleted enough logs.  
  
### Method 10: Delete audit logs - new process

> [!NOTE]
> The system can take up to 72 hours to update storage information for the deletion of audit logs. After choosing to delete audit logs, we recommend waiting up to 72 hours and monitoring your storage to see avialable log capacity.

Microsoft is migrating audit logs to a new storage location. Environments whose data migration is complete can use the new audit delete experience.

When you enable auditing, customer engagement apps create audit logs to store the audit history of the records. You can delete the audit logs to free space when they're no longer needed.  

> [!WARNING]
> When you delete an audit log, you can no longer view the audit history for the period covered by that audit log.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. Under **Auditing**, **Free up capacity**, select **Delete audit logs**.

   :::image type="content" source="media/audit-log-delete-new.png" alt-text="Screenshot that shows where the Delete logs option is located on the Auditing card of an environment." lightbox="media/audit-log-delete-new.png":::

5. Select to delete logs either by table, access type, or by date.

   :::image type="content" source="media/audit-log-delete-select-new.png" alt-text="Screenshot that shows the Select logs to delete window where you can specify the type of logs you want to delete." lightbox="media/audit-log-delete-select-new.png":::

   | Setting  | Description  | System job name |
   | -------- | ------------ | --------------- |
   |**Delete logs by table** | Select one or more tables for which you want to delete audit logs. By default all tables in the environment are shown, whether or not they contain audit data. | Delete logs for [number of] tables. |
   |**Delete access logs by people and systems** | Delete all access logs for all users and systems. | Delete access logs. |
   |**Delete all logs up to and including the selected date** | Delete logs including the date selected. | Delete all logs before and including [timestamp].    |

6. Select **Delete**, and then confirm the deletions.

##### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), and then select an environment.

1. Under **Auditing**, **Free up capacity**, select **Delete audit logs**.

   :::image type="content" source="media/audit-log-delete.png" alt-text="Screenshot that shows where the Delete logs option is located on the Auditing card of an environment." lightbox="media/audit-log-delete.png":::

1. Select to delete logs either by table, access type, or by date.

   :::image type="content" source="media/audit-log-delete-select.png" alt-text="Screenshot that shows the Select logs to delete window where you can specify the type of logs you want to delete." lightbox="media/audit-log-delete-select.png":::

   | Setting  | Description  | System job name |
   | -------- | ------------ | --------------- |
   |**Delete logs by table** | Select one or more tables for which you want to delete audit logs. By default all tables in the environment are shown, whether or not they contain audit data. | Delete logs for [number of] tables. |
   |**Delete access logs by people and systems** | Delete all access logs for all users and systems. | Delete access logs. |
   |**Delete all logs up to and including the selected date** | Delete logs including the date selected. | Delete all logs before and including [timestamp].    |

1. Select **Delete**, and then confirm the deletions.

---

All data is deleted in an asynchronous background system job that may take up to 72 hours to be scheduled to run.

To monitor the status of audit delete jobs, see the next section.

#### Monitor the status of audit delete jobs in the Power Platform Admin center

###### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4. Select **Settings** > **Data management** > **Bulk deletion**.

   :::image type="content" source="media/free-new-storage-method.png" alt-text="Screenshot that shows where the Bulk deletion option is located in an environment." lightbox="media/free-new-storage-method.png":::

6. Review the system job and the **Status Reason** column for details about the status of your job.

   :::image type="content" source="media/audit-log-delete-job-status.png" alt-text="Screenshot that shows the system job details for bulk delete of audit logs." lightbox="media/audit-log-delete-job-status.png":::

   Select the job to see more details about the results of the delete job.

   :::image type="content" source="media/audit-log-delete-job-details.png" alt-text="Select the job to see more details about the results of the delete job." lightbox="media/audit-log-delete-job-details.png":::

###### [Classic admin center](#tab/classic)

1. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select an environment.

1. Select **Settings** > **Data management** > **Bulk deletion**.

   :::image type="content" source="media/free-storage-method8a-1.png" alt-text="Screenshot that shows where the Bulk deletion option is located in an environment." lightbox="media/free-storage-method8a-1.png":::

1. Review the system job and the **Status Reason** column for details about the status of your job.

   :::image type="content" source="media/audit-log-delete-job-status.png" alt-text="Screenshot that shows the system job details for bulk delete of audit logs." lightbox="media/audit-log-delete-job-status.png":::

   Select the job to see more details about the results of the delete job.

   :::image type="content" source="media/audit-log-delete-job-details.png" alt-text="Select the job to see more details about the results of the delete job." lightbox="media/audit-log-delete-job-details.png":::

---

## Reduce database storage

### Method 1: Delete bulk email and workflow instances using a bulk deletion job  
  
> [!WARNING]
> If you delete this data, you will no longer be able to tell if an email was sent through bulk email or if a workflow rule ran against a record. The emails that were sent and the actions that ran against the record in the workflow will remain.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in the All Bulk Deletion System Jobs window." lightbox="media/free-storage-method9a-1.png":::

5. Select **Next**.  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add similar criteria similar, for example:  
  
   **System Job Type** – **Equals** – **Bulk E-mail**; **Workflow**;  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
8. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method1b.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 1." lightbox="media/free-storage-method1b.png":::
  
9. Select **Next**.  
  
10. In the **Name** text box, type a name for the bulk deletion job.  
  
11. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
12. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  

    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

13. If you want a notification e-mail sent, select the **Send an e-mail to me (myemail@domain.com) when this job is finished** check box.  

14. Select **Next**, review the bulk deletion job, and then select **Submit** to create the recurring job.  

##### [Classic admin center](#tab/classic)
  
1. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select an environment.

1. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in the All Bulk Deletion System Jobs window." lightbox="media/free-storage-method9a-1.png":::
  
1. Select **Next**.  
  
1. In the **Look for** list, select **System Jobs**.  
  
1. In the search criteria area, add similar criteria similar, for example:  
  
   **System Job Type** – **Equals** – **Bulk E-mail**; **Workflow**;  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
1. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method1b.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 1." lightbox="media/free-storage-method1b.png":::
  
1. Select **Next**.  
  
1. In the **Name** text box, type a name for the bulk deletion job.  
  
1. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
1. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  

    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

1. If you want a notification e-mail sent, select the **Send an e-mail to me (myemail@domain.com) when this job is finished** check box.  

1. Select **Next**, review the bulk deletion job, and then select **Submit** to create the recurring job.  

---
  
### Method 2: Evaluate and delete suspended workflows  

 Sometimes workflows enter a suspended state because there's a condition that can't be met or some other reason that doesn't allow the workflow to continue.  
  
> [!WARNING]
> Some workflows are in a suspended state because they're waiting for a condition that has not yet been met, which is expected. For example, a workflow may be waiting for a task to be completed.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**.

4. Select an environment from the list, and then select **Open**.

5. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add similar criteria similar, for example:  
  
   **System Job Type** – **Equals** – **Workflow**  
  
   **Status Reason** – **Equals** – **Waiting**  
  
8. Group the two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With both rows selected, choose **Group AND**.  
  
   :::image type="content" source="media/free-storage-method2b.png" alt-text="Screenshot that shows where the Group AND is located on the Advanced Find tab." lightbox="media/free-storage-method2b.png":::

9. Choose **Results**.  
  
10. In the results window, you can open each item to determine whether the workflow can be deleted.

##### [Classic admin center](#tab/classic) 
  
1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments**, select an environment from the list, and then select **Open**.

1. In the upper-right corner, select **Advanced Find** (![Advanced find button.](media/advanced-find-button2.png)).  
  
1. In the **Look for** list, select **System Jobs**.  
  
1. In the search criteria area, add similar criteria similar, for example:  
  
   **System Job Type** – **Equals** – **Workflow**  
  
   **Status Reason** – **Equals** – **Waiting**  
  
1. Group the two criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With both rows selected, choose **Group AND**.  
  
   :::image type="content" source="media/free-storage-method2b.png" alt-text="Screenshot that shows where the Group AND is located on the Advanced Find tab." lightbox="media/free-storage-method2b.png":::

1. Choose **Results**.  
  
1. In the results window, you can open each item to determine whether the workflow can be deleted.

---
  
### Method 7: Remove bulk duplicate detection jobs and associated copies of duplicate records  

 Every time that a duplicate detection job runs, a copy of each duplicate record is stored in the database as part of the duplicate detection job.

For example, if you have 100 duplicate records, every time that you run a duplicate detection job that finds these duplicates, whether it's manual or reoccurring, those 100 duplicate records are stored in the database under that instance of that duplicate job until the duplicates are merged or deleted, or until the instance of that duplicate detection job is deleted.

##### [New admin center](#tab/new)

1. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. Select **Settings** > **Data management** > **Duplicate Detection Jobs**.  

   :::image type="content" source="media/free-storage-method-new.png" alt-text="Screenshot that shows where the Duplicate detection jobs option is located in the Settings of an environment." lightbox="media/free-storage-method-new.png":::
  
5. Select the duplicate detection job instances you want to delete and then choose **Delete** (X).  
  
   To avoid wasting storage space, make sure duplicates are resolved promptly so that they aren't reported in multiple duplicate detection jobs.  

   :::image type="content" source="media/free-storage-method7a.png" alt-text="Screenshot that shows where the X icon is located in the Duplicate Detection Jobs window of Dynamic 365." lightbox="media/free-storage-method7a.png":::

##### [Classic admin center](#tab/classic)
  
1. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select an environment.

1. Select **Settings** > **Data management** > **Duplicate Detection Jobs**.  

   :::image type="content" source="media/free-storage-method7a-1.png" alt-text="Screenshot that shows where the Duplicate detection jobs option is located in the Settings of an environment." lightbox="media/free-storage-method7a-1.png":::
  
1. Select the duplicate detection job instances you want to delete and then choose **Delete** (X).  
  
   To avoid wasting storage space, make sure duplicates are resolved promptly so that they aren't reported in multiple duplicate detection jobs.  

   :::image type="content" source="media/free-storage-method7a.png" alt-text="Screenshot that shows where the X icon is located in the Duplicate Detection Jobs window of Dynamic 365." lightbox="media/free-storage-method7a.png":::

---
  
### Method 8: Delete bulk import instances using a bulk deletion job  

 Every time you perform a bulk import, there's a system job associated with that import. The system job details show, which records imported successfully and which records failed.  
  
> [!WARNING]
> After you delete these bulk import jobs, you will not be able to see what data was imported and you cannot roll back the import.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4.	Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-new-storage-method.png" alt-text="Screenshot that shows where the Bulk deletion option is located in the Settings of an environment." lightbox="media/free-new-storage-method.png":::
  
5. Choose **Next**.  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add similar criteria, for example:  
  
   **System Job Type** – **Equals** – **Import**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
8. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   1. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method8a.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 8." lightbox="media/free-storage-method8a.png":::

9. Choose **Next**.  
  
10. In the **Name** text box, type a name for the bulk deletion job.  
  
11. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
12. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

13. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

14. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.

##### [Classic admin center](#tab/classic)
  
1.	In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select an environment.

1.	Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method8a-1.png" alt-text="Screenshot that shows where the Bulk deletion option is located in the Settings of an environment." lightbox="media/free-storage-method8a-1.png":::
  
1. Choose **Next**.  
  
1. In the **Look for** list, select **System Jobs**.  
  
1. In the search criteria area, add similar criteria, for example:  
  
   **System Job Type** – **Equals** – **Import**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
1. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   1. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method8a.png" alt-text="Screenshot that shows where the Group AND option is located in the Define Search Criteria window. Method 8." lightbox="media/free-storage-method8a.png":::

1. Choose **Next**.  
  
1. In the **Name** text box, type a name for the bulk deletion job.  
  
1. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
1. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.  
  
    :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::

1. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

1. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  

---
  
### Method 9: Delete bulk deletion job instances using a bulk deletion job  

 When you're deleting bulk data, a bulk deletion system job is created and can be deleted.  
  
> [!WARNING]
> After you delete these jobs, you will lose the history of the prior bulk deletion jobs that you've run.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment from the list.

4. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in the All Bulk Deletion System Jobs window.":::
  
5. Select **Next**.  
  
6. In the **Look for** list, select **System Jobs**.  
  
7. In the search criteria area, add similar criteria, for example:  
  
   **System Job Type** – **Equals** – **Bulk Delete**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
   > [!NOTE]
   > You could also delete jobs that have failed or been canceled.  
  
8. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method9a.png" alt-text="Screenshot that shows where The Group AND option is located in the Define Search Criteria window." lightbox="media/free-storage-method9a.png":::
  
9. Select **Next**.  
  
10. In the **Name** text box, type a name for the bulk deletion job.  
  
11. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
12. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.

   :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::
  
13. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

14. Select **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.

##### [Classic admin center](#tab/classic)
  
1. In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com), select an environment.

1. Select **Settings** > **Data management** > **Bulk deletion**. In the menu bar, select **New**. The Bulk Deletion Wizard opens.  

   :::image type="content" source="media/free-storage-method9a-1.png" alt-text="Screenshot that shows where the New button is located in the All Bulk Deletion System Jobs window.":::
  
1. Choose **Next**.  
  
1. In the **Look for** list, select **System Jobs**.  
  
1. In the search criteria area, add similar criteria, for example:  
  
   **System Job Type** – **Equals** – **Bulk Delete**  
  
   **Status Reason** – **Equals** – **Succeeded**  
  
   **Completed On** – **Older Than X Months** – 1  
  
   > [!NOTE]
   > You could also delete jobs that have failed or been canceled.  
  
1. Group the three criteria rows:  
  
   1. Choose the arrow next to each criteria row, and then choose **Select Row**.  
  
   2. With all three rows selected, choose **Group AND**.  

      :::image type="content" source="media/free-storage-method9a.png" alt-text="Screenshot that shows where The Group AND option is located in the Define Search Criteria window." lightbox="media/free-storage-method9a.png":::
  
1. Choose **Next**.  
  
1. In the **Name** text box, type a name for the bulk deletion job.  
  
1. Select a date and time for the job start time; preferably a time when users aren't in customer engagement apps.  
  
1. Select the **Run this job after every** check box, and then in the **days** list, select the frequency you want the job to run.

   :::image type="content" source="media/free-storage-method6b.png" alt-text="Screenshot that shows where the Run this job every check box is located." lightbox="media/free-storage-method6b.png":::
  
1. If you want a notification e-mail sent, select the **Send an email to me (myemail@domain.com) when this job is finished** check box.  

1. Choose **Next**, review the bulk deletion job, and then choose **Submit** to create the recurring job.  

---

### Method 11: Remove unrequired tables and columns from Dataverse search

Tables and tables fields enabled for Dataverse search affect the database storage capacity.

- To revise the list of tables selected for Dataverse search results, see [Select entities for Dataverse search](configure-relevance-search-organization.md#select-tables-for-dataverse-search).
- To revise the list of fields selected for each table for Dataverse search results, see [Select searchable fields and filters for each table](configure-relevance-search-organization.md#select-searchable-fields-and-filters-for-each-table).

### Method 12: Remove unrequired data from activity tables

These tables store records for [activities](/power-apps/developer/data-platform/activity-entities) such as emails, appointments, tasks, calls, etc. To learn more about what data these tables contain, see [Activities data model and storage](/power-apps/developer/data-platform/activities-data-model-storage).

### Method 13: Remove unrequired Activity Feeds records

These tables store post related records for [Activity Feeds](/dynamics365/customerengagement/on-premises/basics/stay-up-date-with-customer-news-with-activity-feed) functionality. To free space, you can delete any Post records, which are no longer required.

### Method 14: Modify Item Level Monitoring Settings

The ExchangeSyncIdMappingBase table contains references between Dynamics 365 records and the corresponding records in Microsoft Exchange. This table is used by the Server-Side Synchronization feature, which enables synchronization of emails, appointments, contacts, and tasks between Dynamics 365 and Microsoft Exchange.

Extra rows are stored in this table to help with troubleshooting the synchronization of specific items. For more information, see [Troubleshoot item level Server-Side Synchronization issues with Microsoft Dynamics 365](/troubleshoot/dynamics-365/sales/troubleshoot-item-level-server-side-synchronization-issues). This article provides details regarding how you can reduce the default duration (three days) of how long these troubleshooting records exist. This troubleshooting feature can also be disabled. Rows unrelated to this feature can't be deleted and are required for Appointment, Contact, and Task synchronization.

### Method 15: Remove unrequired Alerts (trace logs)

The [Server-Side Synchronization](server-side-synchronization.md) feature logs alerts when different events occur such as a mailbox encountering an error or warning. There are also informational alerts logged when you enable a mailbox. You can view these Alerts when you view a Mailbox or Email Server profile within the Email Configuration area of Advanced Settings. While these records appear in a tab called Alerts, they're actually Trace records. To free space consumed by these Alerts, you can delete any Trace records, which are no longer required. Trace records can be deleted within the Alerts tab of an Email Server Profile or Mailbox record. They can also be deleted using Advanced Find or a [Bulk Delete](delete-bulk-records.md) job.

You can also configure which levels of alerts are logged. See [System Settings Email tab](system-settings-dialog-box-email-tab.md).

## Free up storage used by flow approvals

See [Delete approval history from Power Automate](/power-automate/gdpr-dsr-delete#delete-approval-history-from-power-automate).

## Free up storage used by the SubscriptionTrackingDeletedObject table

See [Subscription Tracking Deleted Object Table](subscription-tracking-deleted-object-retention.md).

### See also

[Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
