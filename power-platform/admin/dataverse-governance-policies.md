---
title: Manage data with governance policies in Dataverse
description: Learn how to manage Dataverse data growth with bulk deletion and long-term retention policies.
ms.date: 09/29/2026
ms.topic: how-to
author: rijoshi1
ms.component: pa-admin
ms.subservice: admin
ms.author: rijoshi
ms.reviewer: ellenwehrle
search.audienceType:
  - admin
ai-usage: ai-assisted
---

# Manage data with governance policies in Dataverse

Use the Power Platform admin center to review Dataverse storage consumption and decide whether to delete data you no longer need or retain data you must keep. Use bulk deletion jobs to remove unneeded data and long-term retention policies to keep inactive data in a read-only state.

## Prerequisites

To view tenant-level Dataverse storage information, you need one of the following roles:

- Global administrator
- Power Platform administrator
- Dynamics 365 administrator

> [!NOTE]
> For security, limit the number of users who have the Global Administrator role.

You also need:

- The System Administrator security role, or an equivalent custom security role, in the target environment. You need this role to create and manage bulk deletion jobs or retention policies, and to restore deleted records.
- A [Managed Environment](managed-environment-overview.md) to run a long-term retention policy. You can create a retention policy in an environment that isn't managed, but the policy remains disabled.

## Review storage and choose an action

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Manage** > **Dataverse**, or open the [Dataverse management page](https://admin.powerplatform.microsoft.com/manage/dataverse).
3. Review database, file, and log consumption. Identify the environments and tables that consume the most storage.
4. If a cleanup recommendation is available, review the **Cleanable data** and preview the records that match the recommendation. For more information, see [Dataverse storage advisor](capacity-storage.md#dataverse-storage-advisor-preview).
5. Choose the action that matches your data requirements:
   - Create a bulk deletion job for stale, duplicate, test, or other data that your organization no longer needs.
   - Create a long-term retention policy for inactive data that you must keep for business, legal, audit, or regulatory reasons.
   - Use another cleanup method to remove unneeded files, audit data, plug-in trace logs, or environments.
6. Monitor the action and its effect on storage. Bulk deletion changes can take up to 72 hours to appear in storage reports. Long-term retention processing and reporting can take longer.

> [!NOTE]
> Dataverse storage advisor is a preview feature that is rolling out gradually. If recommendations aren't available in your environment, use [bulk deletion](delete-bulk-records.md) or [long-term retention](/power-apps/maker/data-platform/data-retention-overview) directly.

## Choose bulk deletion or long-term retention

| Data requirement | Action | Result |
|---|---|---|
| The data has no remaining business, legal, audit, regulatory, or recovery value. | Create a [bulk deletion job](delete-bulk-records.md). | Dataverse deletes the matching records. Whether you can restore them depends on the deleted-record settings and deletion options. |
| You must keep inactive data but don't need it in active application workflows. | Create a [long-term retention policy](/power-apps/maker/data-platform/data-retention-overview). | Dataverse moves the data to long-term retention, where it remains read-only. Retained data can't return to the active application state. |

> [!CAUTION]
> Review your organization's retention, legal hold, backup, and recovery requirements before you delete data. Records deleted with the **Permanent deletion** option can't be restored.

## Recommended practices

- Start with the environments and tables that consume the most storage.
- Use recurring bulk deletion jobs for predictable data growth instead of relying only on one-time cleanup.
- Develop and test bulk deletion jobs and retention policies in a sandbox environment before you use them in production.
- Preview the records that match your criteria before you run a deletion or retention policy.
- Review policy run results and resolve failures regularly.
- Add storage capacity when required data can't be deleted or moved to long-term retention.

## Frequently asked questions

### Does deleting data reduce storage immediately?

No. Storage reporting isn't immediate and can take up to 72 hours to show the effect of deleted data.

### When does long-term retention reduce reported storage?

A long-term retention policy run typically takes 72 to 96 hours to complete. Allow at least another 24 hours for the database capacity report to update. In production environments, the report can take a few days to a week to show the full reduction. For more information, see [Storage capacity reports](/power-apps/maker/data-platform/data-retention-overview#storage-capacity-reports).

### Should I delete or retain inactive data?

Delete data only when it has no remaining business, legal, or regulatory value. Use Dataverse long-term retention when you must keep inactive data but don't need it in active operations.

### Can I recover data deleted by a bulk deletion job?

You can restore supported records during the configured retention period when all the following conditions are met:

- You successfully enabled the **Keep deleted Dataverse records** setting before deleting the records.
- The bulk deletion job didn't use the **Permanent deletion** option.
- The records are from a table that supports deleted-record keeping. See [Tables not supported](restore-deleted-table-records.md#tables-not-supported).
- The records are still within the configured retention period of 1 to 90 days.

For setup instructions and limitations, see [Restore deleted Microsoft Dataverse table records](restore-deleted-table-records.md).

### Why do some environments show 0 GB or not count toward tenant capacity?

Microsoft Teams environment usage appears separately on the **Microsoft Teams** tab and doesn't count toward your organization's Dataverse usage. Trial, preview, support, and developer environments also don't count toward tenant capacity. These environments can still contain data and might show 0 GB in the tenant capacity report.

### What should I do if cleanup doesn't resolve the storage overage?

Review the remaining database, file, or log storage deficit. Purchase the capacity type you need, or contact your Microsoft partner if your subscription is partner-managed. For more options, see [Manage a tenant-level capacity overage](capacity-storage.md#manage-a-tenant-level-capacity-overage).

## Related content

- [Dataverse capacity-based storage details](capacity-storage.md)
- [Free up storage space](free-storage-space.md)
- [Delete bulk records](delete-bulk-records.md)
- [Dataverse long-term data retention overview](/power-apps/maker/data-platform/data-retention-overview)
- [Add more Microsoft Dataverse capacity](add-storage.md)
