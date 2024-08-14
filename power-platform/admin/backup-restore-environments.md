---
title: Back up and restore environments
description: Learn how to back up and restore Power Platform environments.
ms.topic: conceptual
ms.date: 07/25/2024
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

It's important to protect your data on Microsoft Power Platform and in Dataverse, and to provide continuous availability of service through system or manual backups.

System backups are automatically created for environments that have a database. System backups of production environments that have a database and Dynamics 365 applications are kept for up to 28 days. By default, backups of production environments that don't have Dynamics 365 applications and backups of other nonproduction environments are kept for seven days. However, for managed production environments that don't have Dynamics 365 applications, you have the option to extend the retention period beyond seven days.

Manual backups are backups that the user initiates. You should create manual backups before you do major customization or apply a version update. You can create these backups for production and sandbox environments, but not for the default environment. Manual backups of production environments that have Dynamics 365 applications are kept for up to 28 days. Backups of environments that don't have Dynamics 365 applications are kept for seven days.

## Supported retention period

| Environment types                      | System backup | Manual backup |
|----------------------------------------|---------------|---------------|
| Production with Dynamics 365 apps      | 28 days       | 28 days       |
| Production without Dynamics 365 apps\* | 7 days        | 7 days        |
| Sandbox                                | 7 days        | 7 days        |
| Developer                              | 7 days        | 7 days        |
| Teams                                  | 7 days        | 7 days        |
| Default\*\*                            | 7 days        | Not supported |
| Trial                                  | Not backed up | Not supported |
| Trial (subscription-based)             | Not backed up | Not supported |

\* For managed production environments that don't have Dynamics 365 applications, we allow you to extend the retention period beyond seven days, to a maximum of 28 days, through PowerShell. For more information, see the [Change the backup retention period for production environments without Dynamics 365 applications](#change-the-backup-retention-period-for-production-environments-without-dynamics-365-applications) section.

\*\* We don't support restoring a system backup of the default environment through the Power Platform admin center. For more information, see [Backup and restoration of the default environment](../guidance/adoption/manage-default-environment.md#backup-and-restoration-of-the-default-environment).

System backup and restore operations aren't supported for trial-type environments. To use the full set of features, including system backup and restore options, see [Convert either type of trial environment to a production environment](trial-environments.md#convert-either-type-of-trial-environment-to-a-production-environment).

## System backups

Environments that have a database are automatically backed up and can be restored. All your environments, except trial environments (both standard and subscription-based), have system backups. System backups are continuous. The underlying technology is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups).

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) by using administrator credentials.
1. Go to **Environments**, select an environment, and then select **Backup & Restore** \> **Restore or manage**.
1. On the **System** tab, look for available system backups by selecting a date and time.
1. Select **Continue**.

The **Restore backup to a target environment** pane shows backup details that are available.

### About system backups

- System backups aren't counted toward storage capacity. To restore an environment, you need **1 gigabyte (GB)** of free capacity. If you're over capacity, see the [Is there a database size restriction for backing up or restoring an organization through the user interface or API?](#is-there-a-database-size-restriction-for-backing-up-or-restoring-an-organization-through-the-user-interface-or-api) section.
- Copying and restoring data might take more than one day, depending on the size of the data, especially if you must copy [audit data](backup-restore-environments.md#restore-audit-logs).
- Backup and restore operations include only apps (created by using Power Apps) and flows (created by using Power Automate) in a Dataverse solution.
- Downloading a copy of a database backup for offline use isn't supported.

### Change the backup retention period for production environments without Dynamics 365 applications

For environments that don't have Dynamics 365 applications, the default backup retention period is seven days. Admins who run production [Managed Environments](managed-environment-overview.md) of this type can use PowerShell to change the retention period to 7, 14, 21, or 28 days. To change this setting, you must have an admin role, such as Power Platform admin or Dynamics 365 admin in Microsoft Entra ID.

Keep the following points in mind:

- If you adjust the backup retention period, the new setting applies to all existing and future backups. Because the change might take up to 24 hours to affect existing backups, some backups might be removed earlier than you expect.
- For all other nonproduction environments, including default-type environments, the backup retention period is seven days by default.

    For example, you create an environment on January 1. On that day, the system starts to make backups of your environment, and it stores those backups for a default period of seven days. Therefore, on January 8, backups from January 1 to January 8 are available for restoration. If you change the retention period to 14 days on January 8, the system starts to keep the backups for a longer time. Therefore, on January 16, backups from January 3 to January 16 are available for restoration. In this way, you have more flexibility and control over your backup data.

#### Prepare your environment for PowerShell

The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

> [!NOTE]
> You can extend the backup retention period only for production environments where Dynamics 365 applications aren't enabled. For production environments where Dynamics 365 applications are enabled, a retention period of 28 days is used. For all other nonproduction environments, the default backup retention period of seven days is used, regardless of the setting's value.

#### Set the retention period

```powershell
Set-AdminPowerAppEnvironmentBackupRetentionPeriod
```

Supply values for the following parameters:

- Set the **EnvironmentName** parameter to the environment ID of your environment.
- Set the **NewBackupRetentionPeriodInDays** parameter to **7**, **14**, **21**, or **28**.

#### Verify the retention period

```powershell
Get-AdminPowerAppEnvironment -EnvironmentName "Environment ID"
```

Set the **EnvironmentName** parameter to the environment ID of your environment.

## Restore system backups

You can't restore backups to production environments. If you want to restore a system backup to a production environment, you must first [change the environment type](switch-environment.md) to sandbox. Then, after the restore is completed, you can then switch the environment type back to production. For more information, see the [Can I restore to a production environment?](#can-i-restore-to-a-production-environment) section.

You must restore an environment in the same region where it was backed up. The target and source environments should be in the same region. When an environment is restored onto itself, audit logs aren't deleted. For example, when an environment is restored onto itself to a past time (t1), full audit data for the environment is available. This data includes any audit logs that were generated after t1.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) by using administrator credentials. For more information, see [Use the service admin role to manage your tenant](use-service-admin-role-manage-tenant.md).
1. Go to **Environments**, select an environment, and then select **Backup & Restore** \> **Restore or manage**.
1. On the **System** tab, look for available system backups by selecting a date and time.
1. Select **Continue**.

    The **Restore backup to a target environment** pane shows backup details that are available.

1. Select a target environment to overwrite, and then select **Restore**.

    > [!NOTE]
    > - Only sandbox environments can be restored to. For information about the effects of changing the environment type, see the [Can I restore to a production environment?](#can-i-restore-to-a-production-environment) section.
    > - Under **Edit details**, you can change the environment name.

1. Confirm that you want to overwrite the environment.

## If you don't see the environment that you want to restore to

The following restrictions apply to restoration from both system backups and manual backups:

- You must restore an environment in the same region where it was backed up. The target and source environments should be in the same region.
- The source environment can be a production, sandbox, or developer environment. No other types of environments are supported.
- The target environment can be a sandbox or developer environment. If the target is a developer environment, the source must also be a developer environment.
- A Managed Environment can be restored only to another Managed Environment. A non-Managed Environment can't be restored to a Managed Environment.
- If the source environment has a customer-managed encryption key applied, the target environment must also have a customer-managed encryption key applied.
- Backup and restore operations work only with source and target environments that have Dataverse.
- Sandbox, Teams, and developer environments support self-restore backups.

| Source type | Target type               |
|-------------|---------------------------|
| Production  | Sandbox                   |
| Sandbox     | Sandbox                   |
| Developer   | Sandbox, Developer        |
| Teams       | Teams (self-restore only) |
| Default     | Not supported             |

For more information about how to restore to a production environment, see the [Can I restore to a production environment?](#can-i-restore-to-a-production-environment) section.

## Manual backups

Although automated system backups are great, you should create your own backups before you do major customization or apply a version update. Manual backups might take up to 10 minutes before they are ready for restoration. Therefore, wait at least 10 to 15 minutes before you try to restore your data from a manual backup.

### About manual backups

- You can create backups of production, sandbox, Teams, and developer environments.
- You can't create backups of the default environment.
- Manual backups of production environments that have a database and Dynamics 365 applications are kept for up to 28 days. Manual backups for production environments that don't have Dynamics 365 applications are kept for seven days.
- Sandbox backups are kept for up to seven days.
- Check your expiration date.

    :::image type="content" source="media/expires-on-date.png" alt-text="Check your expiration date.":::

- The label of the backup file that is created reflects the restore point timestamp. The restore point timestamp is the closest available time to the time when the manual backup was created. The timestamp label can't be edited.
- There's no limit on the number of manual backups that you can create.
- Manual backups don't count against your storage limits.
- You must restore an environment in the same region where it was backed up.
- If you don't see your target environment, see the [If you don't see the environment that you want to restore to](#if-you-dont-see-the-environment-that-you-want-to-restore-to) section.

### Create a manual backup

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) by using administrator credentials.
1. Go to **Environments**, select an environment, and then select **Backups & Restore** \> **Create manual backup**.
1. Fill in the information, and then select **Create**.

There's no status as the backup is being processed. When the backup is completed, you receive the following message: "The \<*backup name*\> backup was successfully created."

## Restore a manual backup

You can restore backups only to sandbox environments. You can't restore them to production environments. If you want to restore a manual backup to a production environment, you must first change the environment type to sandbox. Then, after the restore is completed, you can switch the environment type back to production.

> [!IMPORTANT]
> Changing the environment type to sandbox affects database retention. For more information about the effects of changing the environment type, see the [Can I restore to a production environment?](#can-i-restore-to-a-production-environment) section.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) by using administrator credentials.
1. Go to **Environments**, select an environment, and then select **Backups & Restore** \> **Restore or manage**.
1. On the **Manual** tab, select a manual backup to restore, and then select **Restore**.
1. Select whether you want to include audit logs. The inclusion of audit logs can significantly increase the time that is required to restore an environment. Therefore, audit logs are excluded by default. For more information, see the [Restore audit logs](#restore-audit-logs) section.
1. Select an environment to overwrite, and then select **Restore**.
1. Confirm that you want to overwrite the environment.

### Restore audit logs

Restoration of audit logs can significantly increase the time that is required to restore an environment. Therefore, audit logs are excluded by default. Follow these steps to include audit logs when you restore a manual backup.

1. Complete steps 1 through 4 of the previous procedure.
1. Under **Audit logs**, select **Click here**.

    :::image type="content" source="media/restore-backup-audit-logs-click-here.png" alt-text="Select Click here to include audit logs.":::

1. Enable copying of audit logs.

    :::image type="content" source="media/copy-environment-audit-logs-enable.png" alt-text="Enable copying of audit logs.":::

1. Continue with step 5 of the previous procedure.

### Delete a manual backup

You can delete manual backups. You can't delete system backups.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) by using administrator credentials.
1. Go to **Environments**, select an environment, and then select **Backups & Restore** \> **Restore or manage**.
1. On the **Manual** tab, select **Delete**.
1. Confirm that you want to delete the environment.

## App-specific backups

For information about backup and restore for specific apps, see the documentation for the appropriate app:

- [Dynamics 365 Marketing](/dynamics365/marketing/manage-marketing-environments#create-and-restore-backups)
- [Dynamics 365 Finance](/dynamics365/fin-ops-core/dev-itpro/database/dbmovement-operations)
- [Dynamics 365 Customer Service](/dynamics365/customer-service/export-import-omnichannel-data)
- [Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/azure-synapse-link-olc#backup-and-restore-an-environment)
- [Power Apps portals](/power-apps/maker/portals/admin/migrate-portal-configuration?tabs=CLI)

## FAQ

### How are system backups made?

In the current version of the product, system backups occur continuously. The underlying technology is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups).

### How are manual, on-demand backups made?

In the current version of the product, system backups occur continuously. The underlying technology is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups).

Because Azure SQL Database continuously makes backups, there's no need to make other backups. Your on-demand backup is just a timestamp and a label that reflects that timestamp. We store this information in our system and use it during restore requests. This behavior differs from the behavior in previous versions that took a full backup during an on-demand backup.

### Why can't I see the status of the manual backup?

There's no status as the backup is being processed. When the backup is completed, you receive the following message: "The \<*backup name*\> backup was successfully created."

### Should I open a support ticket to make a full backup?

No. In the current version of the product, system backups occur continuously. This behavior differs from the behavior in previous versions, where backups were made once a day. The underlying technology is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups).

Because Azure SQL Database continuously makes backups, and there's no specific way to make other, on-demand backups, we recommend that you use the on-demand backup capabilities for labeled backups in Power Platform admin center.

### How long are my manual, on-demand backups and system backups retained?

System and manual backups for some production-type environments are retained for up to 28 days. Backups for other environment types are retained for only up to seven days. For more information, see [How do I determine if backups of a production environment are retained for 28 days?](#how-do-i-determine-if-backups-of-a-production-environment-are-retained-for-28-days)

### How do I determine if backups of a production environment are retained for 28 days?

Production environments that have been created with a database give you the option to enable one or more Dynamics 365 applications (for example, Dynamics 365 Sales or Dynamics 365 Customer Service). However, you must purchase licenses that entitle you to deploy those applications. Backups of production environments that have a database and Dynamics 365 applications are retained for up to 28 days. By default, backups of production environments that don't have Dynamics 365 applications are retained for seven days. However, for Managed Environments, there's an option to extend the retention period beyond seven days.

### Can I move my data from an online environment to an on-premises version?

It isn't possible to obtain a copy of your database backup. If you want to move your online data to Dynamics 365 Customer Engagement (on-premises), data migration is required. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).

### How can I download a copy of my backup?

It isn't possible to obtain a copy of your database backup. Moving your online data requires data migration. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).

### Is there a database size restriction for backing up or restoring an organization through the user interface or API?

There are no restrictions on database size (or storage capacity/entitlement) for backups that are made through the user interface (UI) or API. However, if an organization's storage capacity usage exceeds the entitled capacity, the following admin operations are blocked:

- Restore an environment (requires minimum 1-GB capacity available)
- Create new environment (requires minimum 1-GB capacity available)
- Copy an environment (requires minimum 1-GB capacity available)

To comply with storage usage requirements, customers can always [free up storage](free-storage-space.md), [archive data](recover-database-space-deleting-audit-logs.md), [delete unwanted environments](delete-environment.md), or buy more capacity. To learn more about capacity add-ons, see the add-ons section in the [Microsoft Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?linkid=866544) or the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). You can work through your organization's standard procurement process to purchase capacity add-ons.

### Can I restore to a production environment?

You can't directly restore to a production environment. This restriction helps prevent accidental overwrites.

If you want to restore to a production environment, you must first change the environment type to sandbox. For more information, see [Switch an environment](switch-environment.md).

If you want to restore a system backup or a restore point from the past seven days, you can safely switch the environment type. If you think you might have to restore to a backup that is older than seven days, we strongly recommend that you keep the environment a production environment and consider restoring to a different environment of the sandbox type.

If you do switch a production environment to a sandbox environment for a manual restore, you can choose a backup only from the past seven days. After the restore is completed, be sure to change the environment back to a production environment **as soon as possible**, to help prevent the loss of any backups that are older than seven days.

### Why is my organization in administration mode after a restore, and how do I disable it?

The newly restored environment is put in administration mode. To turn off administration mode, see [Set administration mode](admin-mode.md#set-administration-mode). You can set administration mode in sandbox or production environments.

### After a restore, what steps are needed to ensure that flows work as expected?

- **Flows** – In the target environment, existing solution flows are deleted, but existing nonsolution flows remain. Review the flows in the target environment to ensure that triggers and actions point to the correct locations. Solution flows are turned off. Therefore, enable flows as required. Solution flows must be enabled or turned on for the PowerShell and API commands to work with them.
- **Connection references** – Connection references require new connections. Create and set connections on connection references.
- **Custom connectors** – Custom connectors should be reviewed and, as required, deleted and reinstalled.

### Do apps that are shared with Everyone continue to be shared with Everyone in a restored environment?

No. Apps that are shared with Everyone in an environment that is backed up aren't shared with Everyone in the restored environment. Alternatively, a canvas app can be shared with a security group. In this case, the app in the restored environment is shared with that security group.

### Are app identifiers the same after backup and restore operations?

Not for canvas apps. The app ID for a canvas app in a restored environment differs from the app ID when an environment was backed up.

### If I restore my environment, do previous backups remain available?

Yes, all backups within the organization's retention period remain available.

### How can I restore records after a bulk deletion without restoring over an organization?

To restore records after a bulk deletion without restoring over an organization, follow these steps.

1. Create a new, empty organization.
1. Restore the backup from the current organization to the new organization.

This approach keeps the original organization together with all the records that were added since the backup. At the same time, it creates a new organization that has the records that were deleted.

### How can I restore a deleted environment?

You can recover a recently deleted environment (within seven days of deletion) by using the Power Platform admin center or the Recover-AdminPowerAppEnvironment Power Apps cmdlet. Production environments that have Dynamics 365 applications are available for up to 28 days.

For more information about the recovery environment, see [Recover environment](recover-environment.md).

## Troubleshooting

### You don't see the environment that you want to restore to

- The source environment can be a production, sandbox, or developer environment. No other types of environments are supported.
- The target environment can be a sandbox or developer environment. If the target is a developer environment, the source must also be a developer environment.
- The target and source environments should be in the same region.
- A Managed Environment can be restored only to another Managed Environment. For more information, see [Managed Environments overview](managed-environment-overview.md).
- If the source environment has a customer-managed encryption key applied, the target environment must also have a customer-managed encryption key applied. For more information, see [Manage your customer-managed encryption key](customer-managed-key.md).
- Restoration of an environment requires **1 GB of available capacity**. For more information, see the [Is there a database size restriction for backing up or restoring an organization through the user interface or API?](#is-there-a-database-size-restriction-for-backing-up-or-restoring-an-organization-through-the-user-interface-or-api) section.
- Backup and restore operations work only with source and target environments that have Dataverse. For more information, see [Add a Microsoft Dataverse database](create-database.md).
- If you don't have enough storage, see [Add Microsoft Dataverse storage capacity](add-storage.md) to request more storage.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
