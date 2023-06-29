---
title: Back up and restore environments | Microsoft Docs
description: Provides information on how to back up and restore Power Platform environments
ms.topic: conceptual
ms.date: 05/22/2023
ms.subservice: admin
author: matapg007 
ms.author: matgupta
ms.reviewer: sericks
ms.contributors:


---
# Back up and restore environments

Protecting your data in Power Platform and Dataverse and providing continuous availability of service are important. If you use Power Platform to create production environments with a database and Dynamics 365 applications enabled, you can benefit from the system backups that are automatically performed for these environments. The system backups are stored for up to 28 days, so that you can restore your environment if there are any issues. 

For production environments that do not have Dynamics 365 applications enabled, the default backup retention period is only 7 days. However, admins can change this setting and extend the backup retention period for [Managed Environments](managed-environment-overview.md) using PowerShell. The possible options are 7, 14, 21, and 28 days.

Changing the backup retention period is a useful feature for Managed Environments that do not have Dynamics 365 applications enabled. It also gives you more flexibility and security for your data by extending back up to 28 days, and it helps in accidental data deletion scenarios. Consider the following information:

- This ability to extend the backup retention period beyond 7 days is only supported for [Managed Environments](managed-environment-overview.md).
- If you change the backup retention period, the new value applies to all existing and future backups. It may take up to 24 hours for the changes to take effect on the existing backups. This may result in some backups being deleted sooner than expected.

To change the backup retention period, you need to be an admin with one of these roles in Azure Active Directory: 
- Global admin
- Power Platform admin
- Dynamics 365 admin 

You also need to know that changing the backup retention period does not affect the existing backups that are already stored for 7 days. It only applies to the future backups that will be taken after you change the setting.

For example, suppose you create an environment on January 1. On that day, the system starts taking backups of your environment and stores them for a default period of 7 days. Therefore, on January 8, you will have backups from January 1 to January 8 available for restoration.

However, if you decide to change the retention period on January 8 to 14 days, the system will keep the backups for a longer time. On January 16, you will have backups from January 3 to January 16 available for restoration. This way, you can have more flexibility and control over your backup data.

## Prepare your environment for PowerShell
This section uses the PowerShell for Power Platform administrator module, which is the recommended PowerShell module for interacting with admin capabilities. To get started with the Power platform PowerShell module, see [Get started with PowerShell for Power Platform Administrators](/power-platform/admin/powershell-getting-started).

### Set retention period
```powershell
Set-AdminPowerAppEnvironmentBackupRetentionPeriod
```
Supply values for the following parameters:

- Set the **EnvironmentName** parameter to your Environment ID.
- The **NewBackupRetentionPeriodInDays** parameter should be set to 7, 14, 21, or 28.

### Verify retention period
```powershell
Get-AdminPowerAppEnvironment -EnvironmentName "Environment ID"
```
Set the **EnvironmentName** parameter to your environment ID.
 
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
- The target environment is listed in the **Select environment to overwrite** drop-down menu. If you don't see an environment, that means that the target environment is in the same geo (geographical region) as the source environment. 
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
   > - Only sandbox environments can be restored to.
   > - Under **Edit details**, you can change the environment name.

6. Confirm overwrite of the environment. 

## Manual backups
Automated system backups are great, but you want to make your own backups before making significant customizations or applying a version update. 
  
About **manual backups**:  

- A backup is created for you when we update your environment.  
- You can back up production and sandbox environments. 
- You can't back up the default environment.
- Sandbox backups are retained for up to 7 days. 
- Manual backups for production environments that have been created with a database and Dynamics 365 applications enabled are retained up to 28 days. Manual backups for production environments that don't have Dynamics 365 applications enabled are retained for 7 days.
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
You can only restore to sandbox environments. To restore to a production environment, first switch it to a sandbox environment. See [Switch an environment](switch-environment.md).

> [!IMPORTANT]
> Note that changing an environment type to sandbox will immediately reduce backup retention to 7 days. If you don't need backups (restore points) older than 7 days, then you can safely switch the type. If you think you may need restore points older than 7 days, we strongly recommend that you keep the environment as production and consider restoring to a different environment of type sandbox.

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
System and manual backups for certain production-type environments are retained up to 28 days. Other environment type backups are retained up to 7 days only. More information: [How do I determine if backups of a production environment are retained for 28 days?](#how-do-i-determine-if-backups-of-a-production-environment-are-retained-for-28-days)

### How do I determine if backups of a production environment are retained for 28 days? 

Production environments that have been created with a database give you the option to enable one or more Dynamics 365 applications if you have purchased licenses that entitle you to deploy such applications (for example, Dynamics 365 Sales, Dynamics 365 Customer Service). Backups of production environments with a database and Dynamics 365 applications enabled are retained for up to 28 days, and production environments that don't have Dynamics 365 applications enabled are retained for 7 days by default however there is option to extend beyond 7 days for managed environments. 

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
In order to prevent accidental overwrites, we don't allow users to directly restore to a production environment. To restore to a production environment, first switch it to a sandbox environment. See [Switch an environment](switch-environment.md) for more information. Changing an environment type to sandbox immediately reduces backup retention to 7 days. If you don't need backups (restore points) older than 7 days, then you can safely switch the type. If you think you may need restore points older than 7 days, we strongly recommend that you keep the environment as production and consider restoring to a different environment of type sandbox.

### Why is my organization in administration mode after a restore and how do I disable it?
The newly restored environment is placed in administration mode. To disable administration mode, see [Set administration mode](admin-mode.md#set-administration-mode). You can set administration mode in sandbox or production environments.  

### What steps are needed after a restore to ensure flows are working as expected?

- **Flows** - In the target environment, existing solution flows are deleted but existing non-solution flows remain. Review the flows in the target environment to ensure that triggers and actions are pointing at the correct locations. Solution flows are disabled so enable flows, as needed. Solution flows need to be enabled or turned on for the PowerShell and API commands to work with these flows.
- **Connection References** - Connection References require new connections. Create and set connections on Connection References.
- **Custom Connectors** - Custom connectors should be reviewed and, if needed, deleted and reinstalled.

### Are apps shared with Everyone still shared with Everyone in a restored environment? 
No. Apps shared with Everyone in an environment that's backed up aren't shared with Everyone in the restored environment. Alternatively, a canvas app can be shared with a security group and the app in the restored environment is shared with that security group. 

### Are app identifiers the same after backup and restore operations?
No for canvas apps. The app ID for a canvas app is different in a restored environment than the ID value when an environment was backed up. 

## Troubleshooting

### Don't see your environment to restore to? 
Only sandbox environments can be restored to.

### See also
[Automatic environment cleanup](automatic-environment-cleanup.md) <br />
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Licensing overview for Microsoft Power Platform](pricing-billing-skus.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
