---
title: Back up and restore environments
description: Provides information on how to back up and restore Power Platform environments
ms.topic: conceptual
ms.date: 04/02/2024
ms.subservice: admin
author: matapg007 
ms.author: matgupta
ms.reviewer: sericks
contributors:
- Funken1766
- Daniel2327 
- elijohnson-ms 


---
# Back up and restore environments

It's important to protect your data on Microsoft Power Platform and Dataverse and provide continuous availability of service using system or manual backups. System backups are automatically performed for environments that have a database. 

You should make sure that your data in Power Platform and Dataverse is secure and accessible using system or manual backups. System backups are created automatically for environments that have a database. System backups of production environments with a database and Dynamics 365 applications are kept for up to 28 days. By default, backups of production environments that don't have Dynamics 365 applications and other non-production environments are kept for seven days, but you have an option to increase the retention period beyond seven days for managed production environments without Dynamics 365 applications. 

Manual backups, on the other hand, are backups that are user-initiated backups. You should make manual backups before making major customizations or applying a version update. You can create these backups for production and sandbox environments, but not for the default environment. Manual backups for production environments with Dynamics 365 applications are kept for up to 28 days, while those without Dynamics 365 applications are kept for seven days.

### Supported retention period 

| Environment types                          | System backup      |Manual backup       |
|--------------------------------------------|--------------------|--------------------|
| Production with Dynamics 365 apps          | 28                 | 28                 |
| Production without Dynamics 365 apps\*      | 7                  | 7                  |
| Sandbox                                    | 7                  | 7                  |
| Developer                                  | 7                  | Not supported      |
| Teams                                      | 7                  | Not supported      |
| Default                                    | 7                  | Not supported      |
| Trial                                      | 7                  | Not supported      |
| Trial subscription                         | 7                  | Not supported      |

\* We allow extending the retention period beyond seven days for managed, production environments without Dynamics 365 applications up to 28 days through PowerShell. For more information, see [Change the backup retention period for production environments without Dynamics 365 applications](#change-the-backup-retention-period-for-production-environments-without-dynamics-365-applications).

## System backups

Environments that have a database are automatically backed up and can be restored. All your environments, except trial environments (standard and subscription-based), have system backups. System backups are continuous. The underlying technology is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

1.	Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with administrator credentials.
2.	Go to **Environments** > [**_select an environment_**] > **Backup & Restore** > **Restore or manage**.
3.	Look for system backups available by selecting a date and time.
4.	Select **Continue**.
5.	The **Restore backup to a target environment** pane shows backup details that are available.

### About system backups

-	System backups aren't counted toward storage capacity. To restore an environment, you need **1 GB** of free capacity. If you are over capactiy, see [Is there a database size restriction for backing-up or restoring an organization through user interface (UI) or API?](#is-there-a-database-size-restriction-for-backing-up-or-restoring-an-organization-through-user-interface-(UI)-or-API)
- Copying and restoring data may take more than one day, depending on the size of the data, especially if you need to copy [audit data](backup-restore-environments.md#restore-audit-logs).
- Only Power Apps and Power Automate flows in a Dataverse solution are included in backup and restore operations.
- Downloading a copy of a database backup for offline use isn't supported.

### Change the backup retention period for production environments without Dynamics 365 applications

The default backup retention period is seven days for environments without Dynamics 365 applications. Admins who run such production [Managed Environments](managed-environment-overview.md) can change this period to 7, 14, 21, or 28 days using PowerShell. To change these settings, you must have an admin role, such as Global admin, Power Platform admin, or Dynamics 365 admin within Microsoft Entra ID.

Keep the following points in mind:

- If you adjust the backup retention period, the new setting applies to all existing and future backups. Because it might take up to 24 hours for the change to affect the existing backups, some backups might be removed earlier than expected.

- For all other non-production environments, the backup retention period is seven days, by default, including default type environment.

  For example, suppose you create an environment on January 1. On that day, the system starts to make backups of your environment and stores the backups for a default period of seven days. This means that on January 8, backups from January 1 to January 8 are available for restoration. If you change the retention period to 14 days on January 8, the system starts to keep the backups for a longer time. Therefore, on January 16, backups from January 3 to January 16 are available for restoration. In this way, you can have more flexibility and control over your backup data.

#### Prepare your environment for PowerShell

The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

> [!Note]
> You can extend the backup duration only for production environments that don't have Dynamics 365 applications enabled. For production environments that do have Dynamics 365 applications, 28 days is used. For all other nonproduction environments, the default, backup retention period of seven days is used, regardless of this setting's value.

#### Set the retention period

```powershell
Set-AdminPowerAppEnvironmentBackupRetentionPeriod
```

Supply values for the following parameters:

- Set the **EnvironmentName** parameter to your environment ID.

-  The **NewBackupRetentionPeriodInDays** parameter should be set to 7, 14, 21, or 28.

#### Verify the retention period

```powershell
Get-AdminPowerAppEnvironment -EnvironmentName "Environment ID"
```
Set the **EnvironmentName** parameter to your environment ID.

## Restore system backups
You can't restore backups to production environments. To restore a system backup to a production environment, you must [change the environment type](switch-environment.md)  to a sandbox environment first, and then you can switch the environment type back to production after restoring. See [Check Restore production environment FAQ](#can-i-restore-to-a-production-environment) for more details.

You must restore an environment in the same region where it was backed up. Target and source environments should be in the same region. When an environment is restored onto itself, audit logs aren't deleted. For example, when an environment is restored onto itself to a past time (t1), full audit data for the environment is available, including any audit logs that were generated after t1.

1. Browse to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using administrator credentials. Consider using the less-privileged, service admin role instead of the global admin role. Learn more: [Use the service admin role to manage your tenant](use-service-admin-role-manage-tenant.md).

1. Go to **Environments** > [**_select an environment_**\] > **Backup & Restore** > **Restore or manage**.
1.  Select the **System** tab.
1.	Look for system backups available by selecting a date and time.
1.	Select **Continue**.
1.	The **Restore backup to a target environment** pane shows backup details that are available.
1.  Select a target environment to overwrite, and then select **Restore**.
    
    > [!Note]
    > - Only sandbox environments can be restored to. See [Restore production environment FAQ](#can-i-restore-to-a-production-environment) for more details about the effects of changing environment type.
    > - Under **Edit details**, you can change the environment name.

1.  Confirm overwrite of the environment.

##  Don't see your environment to restore to?
The following restrictions apply to both restoring from system or manual backups.

- You must restore an environment in the same region where it was backed up. Target and source environment should be in the same region.
- The source environment can be production, sandbox, or developer. Other types of environments aren't supported.
- The target environment can be sandbox or developer. If the target is a developer environment, the source must also be a developer environment.
- A Managed Environment can only be restored to another Managed Environment. A non-Managed Environment can't be restored to a Managed Environment.
- If the source environment has a customer-managed encryption key applied, the target environment must also have a customer-managed encryption key applied.
- Backup and restore operations only work with source and target environments that have Dataverse.
- Sandbox, Teams, and developer environemnts support self-restore backups.

|Source | Target production | Target sandbox | Target developer | Target Teams | Target default |
|---------|----------------|-----------------|-------------------|------------|-----------------|
|Production| No             |   Yes           | No                | No           | No              |
|Sandbox    | No             |   Yes           | No                | No           | No              |
|Developer| No             |   Yes           | Yes                | No           | No              |
|Teams| No                 |   No           | No                | Yes\*           | No             |
|Default| No               |   No            | No                | No           | No              |

## Manual backups

Automated system backups are great, but you should make your own backups before making significant customizations or applying a version update. Manual backups may take up to 10 minutes to be ready for restoration. Please wait for at least 10 - 15 minutes before attempting to restore your data from a manual backup.

### About manual backups

- You can create backups of production and sandbox environments.
- You can't create backups of the default environment.
- Manual backups for production environments that have both a database and Dynamics 365 applications are kept for up to 28 days. Manual backups for production environments that don't have Dynamics 365 applications are kept for seven days.
- Sandbox backups are kept for up to seven days.
- Check your expiration date.

  :::image type="content" source="media/expires-on-date.png" alt-text="Check your expiration date.":::

- The label of the created backup file reflects the restore-point timestamp. The restore-point timestamp is the closest available time to the time when the manual backup was created. The timestamp label can't be edited.
- There is no limit on how many manual backups you can make.
- Manual backups don't count against your storage limits.
- You must restore an environment to the same region in which it was backed up.
- Don’t see your target environment please refer to this section in system back. 

### Create a manual backup

1.  Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with administrator credentials.
   
1.  Go to **Environments** > [**_select an environment_**\] > **Backups & Restore** > **Create manual backup**.

     :::image type="content" source="media/create-backup.png" alt-text="Select Create.":::

1.  Fill in the information, and then select **Create**.

There's no status as the backup is processing. When the backup is completed, the following message is displayed: "*The \[backup name\] backup was successfully created.*"

### Restore a manual backup

You can only restore to sandbox environments. To restore it to a production environment, first switch the environment to a sandbox environment and then you can switch back to production after restoration.
You can't restore to production environments.

> [!Important]
> Note that changing an environment type to sandbox affects database retention. See [Restore production environment FAQ](#can-i-restore-to-a-production-environment) for more details about the effects of changing the environment type.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with administrator credentials.

1. Go to **Environments** > [**_select an environmen_t**\] > **Backups & Restore** > **Restore or manage**.

1. Select the **Manual** tab.

1. Select a manual backup to restore, and then select **Restore**.

1. Select whether to include audit logs. Including audit logs can significantly add to the time it takes to restore an environment and, by default, isn't done. For more information, see [Restore audit logs](#restore-audit-logs).

1. Select an environment to overwrite, and then select **Restore**.

1. Confirm overwrite of the environment.

### Restore audit logs

Restoring audit logs can significantly add to the time it takes to restore an environment, and by default, isn't done. Complete the following steps to include audit logs when restoring a manual backup.

1.  Complete steps 1-5 above.

1.  Under **Audit logs**, select **Click here**.

    :::image type="content" source="media/restore-backup-audit-logs-click-here.png" alt-text="Select click here to include audit logs.":::
    
1.  Enable copying audit logs.

    :::image type="content" source="media/copy-environment-audit-logs-enable.png" alt-text="Enable copying audit logs.":::

Continue with step 5 in [Restore a manual backup](#restore-a-manual-backup).

### Delete a manual backup

You can delete manual backups. You can't delete system backups.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with administrator credentials.

1. Go to **Environments** > [**_select an environment_**\] > **Backups & Restore** > **Restore or manage**.

1. Select the **Manual** tab.

1. Select **Delete**.

1. Confirm deletion of the environment.

## Apps-specific backs ups

For information about backup and restore of certain apps, see the respective app's documentation:

-   [Dynamics 365 Marketing](/dynamics365/marketing/manage-marketing-environments#create-and-restore-backups)
-   [Dynamics 365 Finance<](/dynamics365/fin-ops-core/dev-itpro/database/dbmovement-operations)
-   [Dynamics 365 Customer service](/dynamics365/customer-service/export-import-omnichannel-data)
-   [Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/azure-synapse-link-olc#backup-and-restore-an-environment)
-   [Power Apps portals](/power-apps/maker/portals/admin/migrate-portal-configuration?tabs=CLI)

## FAQ

### How are system backups taken?

In the current version of the product, system backups occur continuously. The underlying technology used is Azure SQL Database. For more information, see [Automated backups]/azure/sql-database/sql-database-automated-backups) for details.

### How are manual, on-demand backups taken?

In the current version of the product, system backups occur continuously. The underlying technology used is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

Because Azure SQL Database takes backups continuously, there's no need to take other backups. Your on-demand backup is just a timestamp and a label that reflects the timestamp that we store in our system and use during restore requests. This behavior is different from previous versions that took a full backup during an on-demand backup.

### Why can't I see a status of the manual backup?

There's no status as the backup is processing. When the backup is completed, the following message is displayed: "*The \[backup name\] backup was successfully created.*"

### Should I open a support ticket for taking a full backup?

No. In the current version of the product, system backups occur continuously; this is different from previous versions where backups were once a day. Because the underlying technology used is Azure SQL Database, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

Because Azure SQL Database takes backups continuously and there's no specific way to take other on-demand backups, we recommend that you use the Power Platform admin center on-demand backup capabilities for labeled backups.

### How long are my manual, on-demand backups and system backups retained?

System and manual backups for certain production-type environments are retained up to 28 days. Other environment type backups are retained up to seven days only. More information: [How do I determine if backups of a production environment are retained for 28 days?](#how-do-i-determine-if-backups-of-a-production-environment-are-retained-for-28-days)

### How do I determine if backups of a production environment are retained for 28 days?

Production environments that have been created with a database give you the option to enable one or more Dynamics 365 applications if you have purchased licenses that entitle you to deploy such applications (for example, Dynamics 365 Sales or Dynamics 365 Customer Service). Backups of production environments with a database and Dynamics 365 applications are retained for up to 28 days. By default, backups of production environments that don't have Dynamics 365 applications are retained for seven days, but there's an option to extend the retention period beyond seven days for Managed Environments.

### Can I move my data from an online environment to an on-premises version?

Obtaining a copy of your database backup isn't available. If you want to move your online data to Dynamics 365 Customer Engagement (on-premises), this requires data migration. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).

### How can I download a copy of my backup?

Obtaining a copy of your database backup isn't available. Moving your online data requires data migration. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).

### Is there a database size restriction for backing-up or restoring an organization through user interface (UI) or API?

We don't have any restrictions on database size (or storage capacity/entitlement) to take a backup through UI or API. However, when an organization's storage capacity usage is greater than the entitled capacity, the following admin operations are blocked:

-   Restore an environment (requires minimum 1-GB capacity available)

-   Create new environment (requires minimum 1-GB capacity available)

-   Copy an environment (requires minimum 1-GB capacity available)

To be compliant with storage usage requirements, customers can always [free up storage](free-storage-space.md), [archive data](recover-database-space-deleting-audit-logs.md), [delete unwanted environments](delete-environment.md), or buy more capacity. To learn more about capacity add-ons, see the Add-ons section in the Dynamics 365 Licensing Guide or the Power Platform Licensing Guide. You can work through your organization's standard procurement process to purchase capacity add-ons.

### Can I restore to a production environment?

In order to prevent accidental overwrites, you can't directly restore to a production environment.

To restore to a production environment, you must first switch the environment to a sandbox environment. See [Switch an environment](switch-environment.md) for more information.

If you want to restore a system backup or a restore-point from the past seven days, then you can safely switch the type. If you think you may need to restore to a backup older than seven days, we strongly recommend that you keep the environment as production and consider restoring to a different environment of type sandbox.

If you do switch a production environment to a sandbox environment for a manual restore, you can only choose a backup from the past seven days. Make sure that after the restore is completed, you change the environment back to a production environment **as soon as possible** to prevent the loss of any backups older than seven days.

### Why is my organization in administration mode after a restore, and how do I disable it?

The newly restored environment is placed in administration mode. To turn off administration mode, see [Set administration mode]admin-mode.md#set-administration-mode). You can set administration mode in sandbox or production environments.

### What steps are needed after a restore to ensure flows are working as expected?

- **Flows** - In the target environment, existing solution flows are deleted but existing, non-solution flows remain. Review the flows in the target environment to ensure that triggers and actions are pointing at the correct locations. Solution flows are turned off, so enable flows as needed. Solution flows need to be enabled or turned on for the PowerShell and API commands to work with these flows.

- **Connection references** - Connection references require new connections. Create and set connections on Connection references.

- **Custom connectors** - Custom connectors should be reviewed and, if needed, deleted and reinstalled.

### Do apps that are shared with Everyone continue to be shared with Everyone in a restored environment?

No. Apps shared with Everyone in an environment that's backed up aren't shared with Everyone in the restored environment. Alternatively, a canvas app can be shared with a security group and the app in the restored environment is shared with that security group.

### Are app identifiers the same after backup and restore operations?

No for canvas apps. The app ID for a canvas app is different in a restored environment than the ID value when an environment was backed up.

### If I restore my environment, will previous backups remain available?

Yes, all backups within the organization's retention period will remain available.

### How can I restore records after a bulk deletion without restoring over an organization?

In order to restore records after a bulk deletion, without restoring over an organization, complete the following steps:

1.  Create a new, empty organization.

2.  Restore the backup from the current organization to the new organization.

This keeps the original organization with all of the records that've been added since the backup, while also creating a new organization with the records that were deleted.

### How can I restore a deleted environment?

You can recover a recently deleted environment (within seven days of deletion), by using the Power Platform admin center or the Power Apps cmdlet Recover-AdminPowerAppEnvironment. Production environments with Dynamics 365 applications will be available for up to 28 days.

See [Recover environment](recover-environment.md) to learn more about the recovery environment.

## Troubleshooting

### Don't see your environment to restore to?

-   The supported, source environment can be production, sandbox, or developer. Other types aren't supported.
-   Target environment can be sandbox or developer. If the target is a developer environment, then the source needs to be developer.
-   Target and source environment should be in the same region.
-   A Managed Environment can only be restored to another Managed Environment. Learn more: [Managed Environments overview](managed-environment-overview.md)
-   If the source environment has a customer-managed encryption key applied, then the target environment must have a customer-managed encryption key applied. Learn more: [Manage your customer-managed encryption key](customer-managed-key.md)
-   Restoring an environment requires **1 GB capacity** available. Learn more: [Do we have any database size restriction to take a backup or restore an organization through user interface (UI) or API?](#do-we-have-any-database-size-restriction-to-take-a-backup-or-restore-an-organization-through-user-interface-ui-or-api).
-   Backup and restore operations only work with source and target environments that have Dataverse. Learn more: [Add a Microsoft Dataverse database](create-database.md)
-   If you don't have sufficient storage, see [Add Microsoft Dataverse storage capacity](add-storage.md) to request more storage.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
