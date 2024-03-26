---
title: Back up and restore environments
description: Provides information on how to back up and restore Power Platform environments
ms.topic: conceptual
ms.date: 03/26/2024
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

It's important that you protect your data on Microsoft Power Platform and Dataverse, and provide continuous availability of service. If you use Power Platform to create production environments that have a database, you can benefit from the system backups that are automatically performed for those environments. 

## System backups

Some backups take place without you having to do anything. Backups of production environments with a database and Dynamics 365 applications enabled are retained for up to 28 days. By default, backups of production environments that don't have Dynamics 365 applications enabled and other non-production environments are retained for 7 days, but there is an option to extend the retention period beyond 7 days for managed, production environments without Dynamics 365 applications.

### Supported backup duration 

| Environment Types                          | Supported Duration |
|--------------------------------------------|--------------------|
| Production with Dynamics 365 apps          | 28                 |
| Production without Dynamics 365 apps or nonproduction\*      | 7                  |
| Sandbox                                    | 7                  |
| Developer                                  | 7                  |
| Teams                                      | 7                  |
| Default                                    | 7                  |

\* We allow extending the retention period beyond 7 days for managed, production environments without Dynamics 365 applications up to 28 days via PowerShell. For more information, see [Change the backup retention period](#change-the-backup-retention-period).

### About system backups

-   System backups aren't counted toward capacity. Restoring an environment requires **1 GB capacity** available. You might be over, see [Do we have any database size restriction to take a backup or restore an organization through user interface (UI) or API?](#do-we-have-any-database-size-restriction-to-take-a-backup-or-restore-an-organization-through-user-interface-ui-or-api)

-   Depending on the size of data, copy and restore operations may take more than 24 hours, especially if you need to copy audit data.

-   All your environments, except Trial environments (standard and subscription-based), are backed up.

-   System backups occur continuously. The underlying technology used is Azure SQL Database. Learn more: [Automated backups in Azure SQL Database](/azure/sql-database/sql-database-automated-backups)

-   You must restore an environment to the same region in which it was backed up. Target and source environment should be in the same region.

-   When an environment is restored onto itself, audit logs aren't deleted. For example, when an environment is restored onto itself to a past time (t1), full audit data for the environment are available, including any audit logs that were generated after t1.

-   Supported source environment can be production, sandbox, or developer and other types not supported.

-   Target environment can be sandbox or developer. If the target is a developer type environment, then source needs to be developer.

-   A Managed Environment can only be restored to another Managed Environment. Learn more: [Managed Environments overview](managed-environment-overview.md).

-   If a source environment has a customer-managed encryption key applied, then target environment must have a customer-managed encryption key applied. Learn more: [Manage your customer-managed encryption key](customer-managed-key.md)

-   Backup and restore operations only work with source and target environments must have Dataverse. Learn more: [Add a Microsoft Dataverse database](create-database.md)
  
-   Only Power Apps and Power Automate flows in a Dataverse solution participate in backup and restore operations.

### Change the backup retention period

In environments without Dynamics 365 applications, the default backup retention is 7 days. For [Managed Environments](managed-environment-overview.md), admins can extend this period to 7, 14, 21, or 28 days using PowerShell. To modify these settings, one must have an admin role, such as Global admin, Power Platform admin, or Dynamics 365 admin, within Microsoft Entra ID.

Keep the folliwng points in mind:

- If you change the backup retention period, the new setting applies to all existing and future backups. Because the change might take up to 24 hours to go into effect on the existing backups, some backups might be deleted sooner than expected.

- For all other non-production environments, the default, backup retention period is 7 days including default type environment.

    For example, suppose you create an environment on January 1. On that day, the system starts to make backups of your environment and stores them for a default period of 7 days. Therefore, on January 8, backups from January 1 to January 8 are available for restoration. If you change the retention period to 14 days on January 8, the system starts to keep the backups for a longer time. Therefore, on January 16, backups from January 3 to January 16 are available for restoration. In this way, you can have more flexibility and control over your backup data.

#### Prepare your environment for PowerShell

The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

> [!Note]
> You can extend the backup duration only for production environments that don't have Dynamics 365 applications enabled. For production environments that do have Dynamics 365 applications, 28 days is used. For all other non-production environments, the default, backup retention period of 7 days is used, regardless of this setting's value.

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

## Manual backups

Automated system backups are great, but you should make your own backups before making significant customizations or applying a version update.

### About manual backups

-   A backup is created for you when we update your environment.

-   You can back up production and sandbox environments.

-   You can't back up the default environment.

-   Sandbox backups are retained for up to 7 days.

-   Manual backups for production environments that have been created with a database and Dynamics 365 applications enabled are retained up to 28 days. Manual backups for production environments that don't have Dynamics 365 applications enabled are retained for 7 days.

-   Check your expiration date.

    ![Backup expiration date ](media/image2.png)

-   The label of the created backup reflects the restore point timestamp. The restore point timestamp is the closest available time to the time when the manual backup was created. The timestamp label can't be edited.

-   You aren't limited in the number of manual backups you can make.

-   Manual backups don't count against your storage limits.

-   You must restore an environment to the same region in which it was backed up.

**Create a manual backup**

1.  Browse to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using administrator credentials.

2.  Go to **Environments** > [select an environment\] > **Backups** > **Create**.

    ![Select Create ](media/image3.png)

3.  Fill in the information, and then select **Create**.

There's no status as the backup is processing. When the backup is completed, the following message is displayed: "*The \[backup name\] backup was successfully created.*"

### Delete a manual backup

You can delete manual backups. You can't delete system backups.

1.  Browse to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using administrator credentials.

2.  Go to **Environments** > [select an environment\] > **Backups** > **Restore or manage**.

3.  Select the **Manual** tab.

4.  Select **Delete**.

5.  Confirm deletion of the environment.

## Restoring a backup

### System backup

1.  Browse to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using administrator credentials. Consider using the less privileged service admin role instead of the global admin role. Learn more: [Use the service admin role to manage your tenant](use-service-admin-role-manage-tenant.md).

2.  Go to **Environments** > [select an environment\] > **Backups** > **Restore or manage**.

    ![Select Restore or manage ](media/image4.png)

3.  Select the **System** tab.

4.  Under **Select a backup to restore**, choose a date and time to select a system backup to restore, and then select **Continue**.

    ![Select available backup ](media/image5.png)

5.  Select an environment to restore to (overwrite), enter other settings as desired, and then select **Restore**.

    ![Enter backup details ](media/image6.png)

    > [!Note]
    > Only sandbox environments can be restored to. See [Restore production environment FAQ](#can-i-restore-to-a-production-environment) for more details about the effects of changing environment type.

    Under **Edit details**, you can change the environment name.

6.  Confirm overwrite of the environment.

### Restore a manual backup

You can only restore to sandbox environments. To restore to a production environment, first switch it to a sandbox environment.

> [!Important]
> Note that changing an environment type to sandbox affects database retention. See [Restore production environment FAQ](#can-i-restore-to-a-production-environment) for more details about the effects of changing the environment type.

1.  Browse to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using administrator credentials.

2.  Go to **Environments** > [select an environment\] > **Backups** > **Restore or manage**.

3.  Select the **Manual** tab.

4.  Select a manual backup to restore, and then select **Restore**.

5.  Select whether to include audit logs. Including audit logs can significantly add to the time it takes to restore an environment and by default isn't done. For more information, see [Restore audit logs](#restore-audit-logs).

6.  Select an environment to restore to (overwrite), and then select **Restore**.

    > [!Note]
    > Only sandbox environments can be restored to.

-   Teams environments only support self-restore.

7.  Confirm overwrite of the environment.

### Restore audit logs

Restoring audit logs can significantly add to the time it takes to restore an environment, and by default, isn't done. Complete the following steps to include audit logs when restoring a manual backup.

1.  Complete steps 1-5 above.

2.  Under **Audit logs**, select **Click here**.

    ![Select click here to include audit logs ](media/image7.png)

3.  Enable copying audit logs.

    ![Enable copying audit logs ](media/image8.png)

Continue with steps 6 and 7 in [Restore a manual backup](#restore-a-manual-backup)

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

### How are manual/on-demand backups taken?

In the current version of the product, system backups occur continuously. The underlying technology used is Azure SQL Database. For more information, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

Because Azure SQL Database takes backups continuously, there's no need to take other backups. Your on-demand backup is just a timestamp and a label that reflects the timestamp that we store in our system and use during restore requests. This behavior is different from previous versions that took a full backup during an on-demand backup.

### Why can't I see a status of the manual backup?

There's no status as the backup is processing. When the backup is completed, the following message is displayed: "*The \[backup name\] backup was successfully created.*"

### Should I open a support ticket for taking a full backup?

No. In the current version of the product, system backups occur continuously; this is different from previous versions where backups were once a day. Because the underlying technology used is Azure SQL Database, see [Automated backups](/azure/sql-database/sql-database-automated-backups) for details.

Because Azure SQL Database takes backups continuously and there's no specific way to take other on-demand backups, we recommend that you use the Power Platform admin center on-demand backup capabilities for labeled backups.

### How long are my manual/on-demand backups and system backups retained?

System and manual backups for certain production-type environments are retained up to 28 days. Other environment type backups are retained up to 7 days only. More information: [How do I determine if backups of a production environment are retained for 28 days?](#how-do-i-determine-if-backups-of-a-production-environment-are-retained-for-28-days)

### How do I determine if backups of a production environment are retained for 28 days?

Production environments that have been created with a database give you the option to enable one or more Dynamics 365 applications if you have purchased licenses that entitle you to deploy such applications (for example, Dynamics 365 Sales, Dynamics 365 Customer Service). Backups of production environments with a database and Dynamics 365 applications enabled are retained for up to 28 days. By default, backups of production environments that don't have Dynamics 365 applications enabled are retained for 7 days, but there is an option to extend the retention period beyond 7 days for managed environments.

### Can I move my data from an online environment to an on-premises version?

Obtaining a copy of your database backup isn't available. If you want to move your online data to Dynamics 365 Customer Engagement (on-premises), this requires data migration. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).

### How can I download a copy of my backup?

Obtaining a copy of your database backup isn't available. Moving your online data requires data migration. For smaller data sets, consider [exporting data to Excel](/powerapps/user/export-data-excel). For larger data sets, find a third-party data migration solution on [Microsoft AppSource](https://appsource.microsoft.com/).

### Do we have any database size restriction to take a backup or restore an organization through user interface (UI) or API?

We don't have any restriction on database size (or storage capacity/entitlement) to take a backup through UI or API. However, when an organization's storage capacity usage is greater than the entitled capacity, the following admin operations are blocked:

-   Restore an environment (requires minimum 1 GB capacity available)

-   Create new environment (requires minimum 1 GB capacity available)

-   Copy an environment (requires minimum 1 GB capacity available)

To be compliant with storage usage requirements, customers can always [free up storage](free-storage-space.md), [archive data](recover-database-space-deleting-audit-logs.md), [delete unwanted environments](delete-environment.md), or buy more capacity. To learn more about capacity add-ons, see the Add-ons section in the Dynamics 365 Licensing Guide or the Power Apps and Power Automate Licensing Guide. You can work through your organization's standard procurement process to purchase capacity add-ons.

### Can I restore to a production environment?

In order to prevent accidental overwrites, you can't directly restore to a production environment.

To restore to a production environment, you must first switch it to a sandbox environment. See [Switch an environment](switch-environment.md) for more information.

If you want to restore a system backup or restore point from the past 7 days, then you can safely switch the type. If you think you may need to restore to a backup older than 7 days, we strongly recommend that you keep the environment as production and consider restoring to a different environment of type sandbox.

If you do switch a production environment to a sandbox environment for a manual restore, you can only choose a backup from the past 7 days. Make sure that after the restore is completed, you change the environment back to a production environment **as soon as possible** to prevent the loss of any backups older than 7 days.

### Why is my organization in administration mode after a restore and how do I disable it?

The newly restored environment is placed in administration mode. To disable administration mode, see [Set administration mode]admin-mode.md#set-administration-mode). You can set administration mode in sandbox or production environments.

### What steps are needed after a restore to ensure flows are working as expected?

- **Flows** - In the target environment, existing solution flows are deleted but existing non-solution flows remain. Review the flows in the target environment to ensure that triggers and actions are pointing at the correct locations. Solution flows are disabled, so enable flows as needed. Solution flows need to be enabled or turned on for the PowerShell and API commands to work with these flows.

- **Connection References** - Connection References require new connections. Create and set connections on Connection References.

- **Custom Connectors** - Custom connectors should be reviewed and, if needed, deleted and reinstalled.

### Are apps shared with Everyone still shared with Everyone in a restored environment?

No. Apps shared with Everyone in an environment that's backed up aren't shared with Everyone in the restored environment. Alternatively, a canvas app can be shared with a security group and the app in the restored environment is shared with that security group.

### Are app identifiers the same after backup and restore operations?

No for canvas apps. The app ID for a canvas app is different in a restored environment than the ID value when an environment was backed up.

### If I restore my environment, will previous backups remain available?

Yes, all backups within the organization's retention period will remain available.

### How can I restore records after a bulk deletion without restoring over an organization?

In order to restore records after a bulk deletion, without restoring over an organization, there are two steps that have to be followed:

1.  Create a new, empty organization.

2.  Restore the backup from the current organization to the new organization.

This will keep the original organization with all of the records that have been added since the backup, while also creating a new organization with the records that were deleted.

### How can I restore deleted environment?

## Troubleshooting

### Don't see your environment to restore to?

-   Supported source environment can be production, sandbox or developer and other types not supported.

-   Target environment can be sandbox or developer. If the target is developer type environment, then source needs to be developer.

-   Target and source environment should be in the same region.

-   A **Managed Environment** can only be restored to another Managed Environment. Learn more: [Managed Environments overview](managed-environment-overview.md)

-   Source env has CMK applied then target environment must have CMK applied. Learn more: [Manage your customer-managed encryption key](customer-managed-key.md)

-   Restoring an environment requires **1 GB capacity** available. See [Do we have any database size restriction to take a backup or restore an organization through user interface (UI) or API?](#do-we-have-any-database-size-restriction-to-take-a-backup-or-restore-an-organization-through-user-interface-ui-or-api).

-   Backup and Restore operations only work with source and target environments must have Dataverse. Learn more: [Add a Microsoft Dataverse database](create-database.md)

-   If you do not have sufficient storage, see [Add Microsoft Dataverse storage capacity](add-storage.md) how to request more storage here.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
