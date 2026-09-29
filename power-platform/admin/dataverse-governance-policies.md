---
title: Manage data with governance policies in Dataverse
description: Learn how to manage data with governance policies in Dataverse.
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

Use the Power Platform admin center to review Dataverse storage consumption and decide whether to delete data you no longer need or retain data you must keep. Governance policies combine storage insights and data lifecycle tools so that you can manage growth consistently across your environments.

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
4. Choose the action that matches your data requirements:
    - Use a bulk deletion job for stale, duplicate, test, or other data that you no longer need.
    - Use long-term retention for inactive data that you must keep for business, legal, or regulatory reasons.
    - Remove unneeded files, audit data, plug-in trace logs, or environments when appropriate.
5. Monitor storage usage after the action runs. Storage reports can take up to 72 hours to reflect data changes.

> [!CAUTION]
> Review your organization's retention, legal hold, backup, and recovery requirements before you delete data. Records deleted with the **Permanent deletion** option can't be restored.

## Choose bulk deletion or long-term retention

| Data requirement | Action | Result |
|---|---|---|
| The data has no remaining business, legal, audit, regulatory, or recovery value. | Create a [bulk deletion job](delete-bulk-records.md). | Dataverse deletes the matching records. Whether you can restore them depends on the deleted-record settings and deletion options. |
| You must keep inactive data but don't need it in active application workflows. | Create a [long-term retention policy](/power-apps/maker/data-platform/data-retention-overview). | Dataverse moves the data to long-term retention, where it remains read-only. Retained data can't return to the active application state. |

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

### Can I recover data deleted by a governance policy?

You can restore supported records during the configured retention period when all the following conditions are met:

- You successfully enabled the **Keep deleted Dataverse records** setting before deleting the records.
- The bulk deletion job didn't use the **Permanent deletion** option.
- The records are from a table that supports deleted-record keeping. See [Tables not supported](restore-deleted-table-records.md#tables-not-supported).
- The records are still within the configured retention period.

For setup instructions and limitations, see [Restore deleted Microsoft Dataverse table records](restore-deleted-table-records.md).

Because deletion actions might be irreversible, review your backup, compliance, and recovery requirements before running a governance policy that deletes data.

### Why do some environments show 0 GB?

Microsoft Teams, Trial, Preview, Support, and Developer environments don't count against tenant Dataverse capacity and can show 0 GB. These environments can still contain data.

### What should I do if cleanup doesn't resolve the storage overage?

Review the remaining database, file, or log storage deficit. Purchase the capacity type you need, or contact your Microsoft partner if your subscription is partner-managed. For more options, see [Manage a tenant-level capacity overage](capacity-storage.md#manage-a-tenant-level-capacity-overage).

## Related content

- [Dataverse capacity-based storage details](capacity-storage.md)
- [Free up storage space](free-storage-space.md)
- [Delete bulk records](delete-bulk-records.md)
- [Dataverse long-term data retention overview](/power-apps/maker/data-platform/data-retention-overview)
- [Add more Microsoft Dataverse capacity](add-storage.md)
