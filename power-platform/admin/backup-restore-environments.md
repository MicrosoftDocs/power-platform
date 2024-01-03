---
title: Back up and restore environments
description: Provides information on how to back up and restore Power Platform environments
ms.topic: conceptual
ms.date: 01/03/2024
ms.subservice: admin
author: matapg007 
ms.author: matgupta
ms.reviewer: sericks
contributors:
- Funken1766
- Daniel2327 


---
# Back up and restore environments

It's important that you protect your data in Microsoft Power Platform and Dataverse, and that you provide continuous availability of service. If you use Microsoft Power Platform to create production environments that have a database and Dynamics 365 applications enabled, you can benefit from the system backups that are automatically performed for those environments. The system backups are stored for up to 28 days. Therefore, you can restore your environment if there are any issues. 

For production environments that don't have Dynamics 365 applications enabled, the default backup retention period is only seven days. However, for [managed environments](managed-environment-overview.md), admins can use PowerShell to change the setting and extend the backup retention period. The available options are 7, 14, 21, and 28 days.

The ability to change the backup retention period is useful for managed environments that don't have Dynamics 365 applications enabled. By enabling you to extend the backup retention period to 28 days, it gives you more flexibility and security for your data. It also helps in accidental data deletion scenarios. Consider the following information:

- This ability to extend the backup retention period beyond seven days is supported only for [managed environments](managed-environment-overview.md).
- If you change the backup retention period, the new setting applies to all existing and future backups. Because the change might take up to 24 hours to go into effect on the existing backups, some backups might be deleted sooner than expected.

To change the backup retention period, you must be an admin who has one of these roles in Microsoft Entra ID:

- Global admin
- Power Platform admin
- Dynamics 365 admin 

Be aware that changes to the backup retention period don't affect existing backups that are already stored for seven days. They apply only to future backups that are made after you change the setting.

For example, you create an environment on January 1. On that day, the system starts to make backups of your environment and stores them for a default period of seven days. Therefore, on January 8, backups from January 1 to January 8 are available for restoration. If you change the retention period to 14 days on January 8, the system starts to keep the backups for a longer time. Therefore, on January 16, backups from January 3 to January 16 are available for restoration. In this way, you can have more flexibility and control over your backup data.

## Prepare your environment for PowerShell

This section uses the PowerShell for Power Platform Administrators module, which is the recommended PowerShell module for interacting with admin capabilities. For information that will help you get started with the PowerShell for Power Platform Administrators module, go to [Get started with PowerShell for Power Platform Administrators](/power-platform/admin/powershell-getting-started).

> [!NOTE]
> This setting applies to production environments that don't have Dynamics 365 applications enabled. For production environments that do have Dynamics 365 applications, 28 days is used. For all other non-production environments, the default, backup retention period of seven days is used, regardless of this setting's value.

### Set the retention period

```powershell
Set-AdminPowerAppEnvironmentBackupRetentionPeriod
```

Supply values for the following parameters:

- Set the `EnvironmentName` parameter to your environment ID.
- The `NewBackupRetentionPeriodInDays` parameter should be set to *7*, *14*, *21*, or *28*.

### Verify the retention period

```powershell
Get-AdminPowerAppEnvironment -EnvironmentName "Environment ID"
```

Set the `EnvironmentName` parameter to your environment ID.
 
## System backups 
Some backups take place without you having to do anything.  

> [!div class="mx-imgBorder"] 
> ![System backups.](media/system-backup.png "System backups")

About **system backups**:  

- System backups are not counted toward capacity.  
- Depending on the size of data, copy and restore operations may take more than 24 hours, especially if you need to copy audit data.
- All your environments, except Trial environments (standard and subscription-based), are backed up.  
- System backups occur continuously. The underlying technology used is Azure SQL Database. See SQL Database documentation [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.
- You must restore an environment to the same region in which it was backed up.
- When an environment is restored onto itself, audit logs aren't deleted. For example, when an environment is restored onto itself to a past time t1, full audit data for the environment will be available, including any audit logs that were generated after t1.
- The target environment is listed on the **Select environment to overwrite** dropdown menu. If you don't see an environment, the target environment is in the same geo (geographical region) as the source environment. 
- Only Power Apps and Power Automate flows in a Dataverse solution participate in backup and restore operations.  

### Restore a system backup  
  
1. Browse to the Microsoft Power Platform admin center and sign in using administrator credentials. Consider using the less privileged service admin role instead of the global admin role. See [Use the service admin role to manage your tenant](use-service-admin-role-manage-tenant.md).
  
2. Go to **Environments** > [select an environment] > **Backups** > **Restore or manage**.
  
   > [!div class="mx-imgBorder"] 
   > ![Select Restore or manage.](media/restore-backup-menu.png "Select Restore or manage")

3. Select the **System** tab.  
  
4. Under **Select a backup to restore**, choose a date and time to select a system backup to restore, and then select **Continue**. 

   > [!div class="mx-imgBorder"] 
   > ![Select available backup.](media/select-available-backup.png "Select available backup")

5. Select an environment to restore to (overwrite), enter other settings as desired, and then select **Restore**.

   > [!div class="mx-imgBorder"] 
   > ![Enter backup details.](media/restore-backup.png "Enter backup details")

   > [!NOTE]
   > - Only sandbox environments can be restored to. Check [Restore production environment FAQ](#can-i-restore-to-a-production-environment) for more details about the effects of changing environment type.
   > - Under **Edit details**, you can change the environment name.

6. Confirm overwrite of the environment. 

## Manual backups
Automated system backups are great, but you should make your own backups before making significant customizations or applying a version update. 
  
About **manual backups**:  

- A backup is created for you when we update your environment.  
- You can back up production and sandbox environments. 
- You can't back up the default environment.
- Sandbox backups are retained for up to seven days. 
- Manual backups for production environments that have been created with a database and Dynamics 365 applications enabled are retained up to 28 days. Manual backups for production environments that don't have Dynamics 365 applications enabled are retained for seven days.
- Check your expiration date.  
  
  > [!div class="mx-imgBorder"] 
  > ![Backup expiration date.](media/restore-backup-manual-expiration.png "Backup expiration date")
  
- The label of the created backup reflects the restore point timestamp. The restore point timestamp is the closest available time to the time when the manual backup was created. The timestamp label can't be edited.
- You aren't limited in the number of manual backups you can make.
- Manual backups don't count against your storage limits.  
- You must restore an environment to the same region in which it was backed up.

### Create a manual backup
  
1. Browse to the Power Platform admin center and sign in using administrator credentials.
  
2. Go to **Environments** > [select an environment] > **Backups** > **Create**.
  
   :::image type="content" source="media/create-backup.png" alt-text="Select Create.":::

3. Fill in the information, and then select **Create**.

There's no status as the backup is processing. When the backup is completed, the following message is displayed: "*The [backup name] backup was successfully created.*" 

### Restore a manual backup  
You can only restore to sandbox environments. To restore to a production environment, first switch it to a sandbox environment. 

> [!IMPORTANT]
> Note that changing an environment type to sandbox affects database retention. See [Restore production environment FAQ](#can-i-restore-to-a-production-environment) for more details about the effects of changing the environment type.

1. Browse to the Power Platform admin center and sign in using administrator credentials.
  
2. Go to **Environments** > [select an environment] > **Backups** > **Restore or manage**.
  
3. Select the **Manual** tab.  
  
4. Select a manual backup to restore, and then select **Restore**. 

5. Select whether to include audit logs. Including audit logs can significantly add to the time it takes to restore an environment and by default isn't done. See the [Restoring audit logs](#restoring-audit-logs) section.

   :::image type="content" source="media/restore-backup-audit-logs.png" alt-text="Include audit logs when restoring a backup.":::

6. Select an environment to restore to (overwrite), and then select **Restore**.

   > [!NOTE]
   > Only sandbox environments can be restored to.

7. Confirm overwrite of the environment. 

### Restoring audit logs

Restoring audit logs can significantly add to the time it takes to restore an environment and by default isn't done. Do the following steps to include audit logs when restoring a manual backup.

1. Complete steps 1-5 above.

2. Under **Audit logs**, select **Click here**.

   :::image type="content" source="media/restore-backup-audit-logs-click-here.png" alt-text="Select click here to include audit logs.":::

3. Enable copying audit logs.

   :::image type="content" source="media/copy-environment-audit-logs-enable.png" alt-text="Enable copying audit logs.":::

4. Continue with steps 6 and 7 in [Restore a manual backup](#restore-a-manual-backup).

### Delete a manual backup  
 You can  delete manual backups. You can't delete system backups.  
  
1. Browse to the Power Platform admin center and sign in using administrator credentials.
  
2. Go to **Environments** > [select an environment] > **Backups** > **Restore or manage**.
  
3. Select the **Manual** tab.

4. Select **Delete**.

5. Confirm deletion of the environment. 
 
## App-specific backups

For information about backup and restore of certain apps, see the respective app's documentation:

- [Dynamics 365 Marketing](/dynamics365/marketing/manage-marketing-environments#create-and-restore-backups)
- [Dynamics 365 Finance](/dynamics365/fin-ops-core/dev-itpro/database/dbmovement-operations)
- [Dynamics 365 Customer service](/dynamics365/customer-service/export-import-omnichannel-data)
- [Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/azure-synapse-link-olc#backup-and-restore-an-environment)
- [Power Apps portals](/power-apps/maker/portals/admin/migrate-portal-configuration?tabs=CLI)

## FAQ

### How are system backups taken?

In the current version of the product, system backups occur continuously. The underlying technology used is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

### How are manual/on-demand backups taken?
In the current version of the product, system backups occur continuously. The underlying technology used is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

Because Azure SQL Database takes backups continuously, there's no need to take other backups. Your on-demand backup is just a timestamp and a label that reflects the timestamp that we store in our system and use during restore requests. This behavior is different from previous versions that took a full backup during an on-demand backup. 

### Why can't I see a status of the manual backup?
There's no status as the backup is processing. When the backup is completed, the following message is displayed: "*The [backup name] backup was successfully created.*" 

### Should I open a support ticket for taking a full backup?
No. In the current version of the product, system backups occur continuously; this is different from previous versions where backups were once a day. Because the underlying technology used is Azure SQL Database, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

Because Azure SQL Database takes backups continuously and there's no specific way to take additional on-demand backups, we recommend that you use the Power Platform admin center on-demand backup capabilities for labeled backups. 

### How long are my manual/on-demand backups and system backups retained?
System and manual backups for certain production-type environments are retained up to 28 days. Other environment type backups are retained up to seven days only. More information: [How do I determine if backups of a production environment are retained for 28 days?](#how-do-i-determine-if-backups-of-a-production-environment-are-retained-for-28-days)

### How do I determine if backups of a production environment are retained for 28 days? 

Production environments that have been created with a database give you the option to enable one or more Dynamics 365 applications if you have purchased licenses that entitle you to deploy such applications (for example, Dynamics 365 Sales, Dynamics 365 Customer Service). Backups of production environments with a database and Dynamics 365 applications enabled are retained for up to 28 days. By default, backups of production environments that don't have Dynamics 365 applications enabled are retained for seven days, but there is an option to extend the retention period beyond seven days for managed environments. 

### Can I move my data from an online environment to an on-premises version?
Obtaining a copy of your database backup isn't available. If you want to move your online data to Dynamics 365 Customer Engagement (on-premises), this requires data migration. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).  

### How can I download a copy of my backup?
Obtaining a copy of your database backup isn't available. Moving your online data requires data migration. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).  

### Do we have any database size restriction to take a backup or restore an organization through user interface (UI) or API?
We don't have any restriction on database size (or storage capacity/entitlement) to take a backup through UI or API. However, when an organization’s storage capacity usage is greater than the entitled capacity, the following admin operations are blocked:

- Restore an environment (requires minimum 1 GB capacity available)
- Create new environment (requires minimum 1 GB capacity available)
- Copy an environment (requires minimum 1 GB capacity available)
 
To be compliant with storage usage requirements, customers can always [free up storage](free-storage-space.md), [archive data](recover-database-space-deleting-audit-logs.md), [delete unwanted environments](delete-environment.md), or buy more capacity. To learn more about capacity add-ons, see the Add-ons section in the Dynamics 365 Licensing Guide or the Power Apps and Power Automate Licensing Guide. You can work through your organization’s standard procurement process to purchase capacity add-ons.
 
### Can I restore to a production environment?
In order to prevent accidental overwrites, you can't directly restore to a production environment. 

To restore to a production environment, you must first switch it to a sandbox environment. See [Switch an environment](switch-environment.md) for more information. 

If you want to restore a system backup or restore point from the past seven days, then you can safely switch the type. If you think you may need to restore to a backup older than seven days, we strongly recommend that you keep the environment as production and consider restoring to a different environment of type sandbox. 

If you do switch a production environment to a sandbox environment for a manual restore, you can only choose a backup from the past seven days. Make sure that after the restore is completed, you change the environment back to a production environment **as soon as possible** to prevent the loss of any backups older than seven days.

### Why is my organization in administration mode after a restore and how do I disable it?
The newly restored environment is placed in administration mode. To disable administration mode, see [Set administration mode](admin-mode.md#set-administration-mode). You can set administration mode in sandbox or production environments.  

### What steps are needed after a restore to ensure flows are working as expected?

- **Flows** - In the target environment, existing solution flows are deleted but existing non-solution flows remain. Review the flows in the target environment to ensure that triggers and actions are pointing at the correct locations. Solution flows are disabled, so enable flows as needed. Solution flows need to be enabled or turned on for the PowerShell and API commands to work with these flows.
- **Connection References** - Connection References require new connections. Create and set connections on Connection References.
- **Custom Connectors** - Custom connectors should be reviewed and, if needed, deleted and reinstalled.

### Are apps shared with Everyone still shared with Everyone in a restored environment? 
No. Apps shared with Everyone in an environment that's backed up aren't shared with Everyone in the restored environment. Alternatively, a canvas app can be shared with a security group and the app in the restored environment is shared with that security group. 

### Are app identifiers the same after backup and restore operations?
No for canvas apps. The app ID for a canvas app is different in a restored environment than the ID value when an environment was backed up. 

### If I restore my environment, will previous backups remain available? 
Yes, all backups within the organization's retention period will remain available. 

## Troubleshooting

### Don't see your environment to restore to? 
Only sandbox environments can be restored to.

A [Managed Environment](managed-environment-overview.md) can only be restored to a Managed Environment.

### See also
[Automatic environment cleanup](automatic-environment-cleanup.md) <br />
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Licensing overview for Microsoft Power Platform](pricing-billing-skus.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
