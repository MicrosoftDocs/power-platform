---
title: Dataverse capacity-based storage overview
description: Learn about enhancements for Dataverse capacity-based storage that affect administrators.
author: rijoshi1
ms.component: pa-admin
ms.topic: overview
ms.date: 09/29/2026
ms.subservice: admin
ms.author: rijoshi
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
- ianceicys-msft
- dasussMS
ms.contributors:
- ceian
- dasuss
- swatim 
- ellenwehrle
---

# Dataverse capacity-based storage overview

Key enhancements to the admin experience for the Microsoft Power Platform admin center include:

- Reporting based on customer licenses and capacity add-ons.
- New changes for exceeding storage capacity entitlements.

These features are rolling out now, so check back if your user experience varies from the following content.

## Storage reporting optimization

Since 2019, Microsoft Dataverse capacity storage is optimized for relational data (database), attachments (file), and audit logs (log). You receive a tenant-wide default entitlement for each of these three storage types as a customer of Power Apps, Power Automate, and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). You also receive more per-user subscription license entitlements. You can purchase more storage in 1-GB increments. Existing customers aren't affected until the end of their current Power Apps or Dynamics 365 subscription, when renewal is required.

:::image type="content" source="media/storage-model-evolution.png" alt-text="Evolution of data management":::

Some of the benefits of this optimization include:

- Scalability with purpose-built storage management solutions.
- The ability to enable new business scenarios.
- Reduced need to [free up storage space](free-storage-space.md).
- Support for various data types.
- More default and full user entitlements.
- Flexibility to create new environments.

> [!NOTE]
> If you're still on the legacy licensing storage model, you can't see the newer, optimized capacity report.

### Two versions of storage reporting

Two versions of storage capacity reporting are available:

- **Legacy capacity model**: Organizations that use the [previous licensing model](legacy-capacity-storage.md#licenses-for-the-legacy-storage-model) for storage. Users with these licenses see a single capacity for entitlement. For more information, see [Legacy storage capacity](legacy-capacity-storage.md).
- **New capacity model**: Organizations that use the [new licensing model](capacity-storage.md#licenses-for-microsoft-dataverse-capacity-based-storage-model) for storage. Users with these licenses see the storage capacity entitlement and usage by database, file, and log. For more information, see [Dataverse storage capacity](capacity-storage.md).

## What happens when my organization exceeds storage entitlements?

If your organization approaches or exceeds its storage capacity, you receive banner and email notifications that alert you about your capacity usage. For details about the new model for email notification, see [Changes for exceeding storage capacity entitlements](capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). For details about the legacy model for email notification, see [Changes for exceeding storage capacity entitlements](legacy-capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). A notification banner appears in the Power Platform admin center, Power Apps maker portal, Power Automate maker portal, Power Pages maker portal, and model-driven apps when your organization's database, file, or log storage is below 15% remaining or over its entitled capacity, after [cross-capacity type borrowing](capacity-storage.md#how-storage-overages-are-calculated) has been applied. 

Environment lifecycle operations, such as creating, copying, restoring, recovering, or converting environments, are evaluated differently than storage notifications and overage status. While notifications and overage status are based on the tenant's effective capacity position after cross-capacity type borrowing, these operations require sufficient available capacity in the underlying database, file, or log capacity types. As a result, some environment lifecycle operations might be unavailable when the required capacity type doesn't have sufficient available capacity, even if the tenant's overall capacity position remains within entitlement limits after borrowing. 

The following administrative environment lifecycle operations aren't available when the required storage capacity isn't available to support the operation:

- Create new environment (requires minimum 1-GB capacity available)
- Copy an environment (requires minimum 1-GB capacity available)
- Restore an environment (requires minimum 1-GB capacity available)
- Convert a trial environment to paid (requires minimum 1-GB capacity available)
- Recover an environment (requires minimum 1-GB capacity available)
- Add Dataverse database to an environment


More information:

- [Alerts and notification for storage use](capacity-storage.md#dataverse-capacity-banner-and-email-notifications) on Power platform admin center, power portals, and Dynamics 365 apps
- [How storage overages are calculated](capacity-storage.md#how-storage-overages-are-calculated)
- [Storage overage lifecycle](capacity-storage.md#storage-overage-lifecycle)
- [Scope and exclusions](capacity-storage.md#scope-and-exclusions)
- To review legacy capacity storage model, go to [Example storage capacity scenario](legacy-capacity-storage.md#example-storage-capacity-scenario).
- To review new capacity storage model, go to [Example storage capacity scenarios and impact](capacity-storage.md#example-storage-capacity-scenarios-and-impact).

The [Universal License Terms for Online Services](https://www.microsoft.com/licensing/terms/product/ForOnlineServices/EAEAS) apply to your organization's use of the online service, including consumption that exceeds the online service's documented entitlements or usage limits.

Your organization must have the right licenses for the storage you use:

- If you use more than your documented entitlements or usage limits, you must buy more licenses.
- If your storage consumption exceeds the documented entitlements or usage limits, we might suspend use of the online service. Microsoft provides reasonable notice before suspending your online service.

If the storage consumption goes over the entitled limit, manage the excess consumption by deleting unused data or purchasing extra operations storage capacity.

## Manage storage overages

Start by determining whether the overage is at the tenant level or the environment level. These conditions require different actions.

|Storage condition |    What it means    | What to do |
|---------|---------|---------|
|Tenant-level storage overage    | The organization's effective consumption exceeds its storage entitlement after eligible cross capacity-type borrowing.    | Reduce storage, archive eligible inactive data, remove unneeded environments, purchase capacity, use eligible pay-as-you-go billing, or request a temporary capacity extension. |
| Environment-level capacity overage    | An environment consumes more than the capacity allocated to it, but the tenant might still have available capacity.     | Allocate available capacity from the tenant pool or link the environment to a pay-as-you-go billing plan. |

> [!IMPORTANT]
> Reallocating capacity between environments doesn't increase the tenant's storage entitlement or resolve a tenant-level storage deficit.

### Manage a tenant-level storage overage
Use the tenant's capacity report to identify the effective database, file, or log deficit. You can then use one or more of the following options:

- Delete data that no longer has business, legal, regulatory, audit, or recovery value.
- Use Dataverse long-term retention for eligible inactive data that you must keep.
- Delete environments that you no longer need after reviewing their dependencies, ownership, backup, and retention requirements.
- Purchase the database, file, or log capacity needed to cover the remaining deficit and expected growth.
- Configure pay-as-you-go for eligible environment-specific consumption.
- Request a temporary capacity extension while completing cleanup or purchasing permanent capacity.

A capacity extension provides temporary tenant-level capacity. It doesn't permanently change the organization's entitlement and isn't a replacement for a durable remediation plan. For current eligibility, capacity, duration, and request limits, see [Extend Dataverse capacity](extend-capacity.md#extend-dataverse-capacity).

For detailed remediation guidance, see [Manage a tenant-level storage overage](capacity-storage.md#manage-a-tenant-level-capacity-overage).

### Manage an environment-level capacity overage

When an environment consumes more than its allocated capacity, an administrator can:

- Allocate available database, file, or log capacity from the tenant pool.
- Link the environment to an eligible pay-as-you-go billing plan.
- Configure an environment-level alert to monitor future consumption.

Allocating tenant capacity changes how existing prepaid capacity is distributed between environments. It doesn't add capacity to the tenant.

For detailed steps, see [Manage an environment-level capacity overage](capacity-storage.md#manage-an-environment-level-capacity-overage).

## Change log for major updates in storage

| Date | Description |
|------|-------------|
| September 2026 | Added guidance for the Dataverse storage overage lifecycle. Clarified storage notifications, immediately restricted environment operations, tenant-level and environment-level remediation, sandbox access stages, scope and exclusions, and steps to restore access after resolving an overage.|
| April 2026 |We made internal adjustments to how solution-aware tables and metadata are reported in Dataverse. This content now resides in file storage rather than the database tier. You might notice corresponding shifts between database and file storage as the classification updates internally. Overall storage usage remains unchanged, and the transition required no downtime or action from administrators or makers.|
| April 2025 | We made internal adjustments to how Web Resources are stored in a Dataverse organization. Web Resources continue to be reported as file store, but you might see the size of *WebResourceBase* fluctuate as storage transitions internally. Dataverse doesn't expect storage to significantly increase for *WebResourceBase*, but it might temporarily drop as files transition. |
| June 2022 | The new finance and operations storage capacity report gives you a way to visualize your organization's storage usage versus your entitlement. |
| September 2021 | We provide included initial storage capacity for the default environment: 3-GB Dataverse database capacity, 3-GB Dataverse file capacity, and 1-GB Dataverse log capacity. Go to [The default environment](environments-overview.md#default-environment). |
| June 2021 | Storage capacity notification emails are introduced and rolled out in phases. Tenant admins now receive emails when their tenant's entitled storage capacity is running out of, or exceeding, available capacity. For details for new model storage, go to [Changes for exceeding storage capacity entitlements](capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). For legacy model details, go to [Changes for exceeding storage capacity entitlements](legacy-capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). |
| January 2021 | We added database, log, and file storage capacity that's included with the Project for the Web licenses. Go to [Project for the web and Microsoft Dataverse](/office365/servicedescriptions/project-online-service-description/project-online-service-description#project-roadmap-and-power-automate). |
| January 2021 | The amount of default Dataverse database capacity entitled per tenant for both the per-app and per-flow licenses increased from **1 GB** to **5 GB**. The corresponding update to the ["Subscription Capacity" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130) is in progress and should be published soon. |
| December 2020 | As part of our storage optimization efforts, we continue to make improvements. In December 2020, we included most of the *WebResourceBase* table and *RibbonClientMetadataBase* table as part of file storage. You see file storage consumption increase and database consumption decrease based on the amount of data in these tables. This effort will continue for other tables in the future. Check back here to see when more tables go through a similar transition. |

### Related information

[Legacy storage capacity](legacy-capacity-storage.md)<br>
[Dataverse storage capacity](capacity-storage.md)<br>
[Free up storage space](free-storage-space.md)<br>
[Delete and recover environments](delete-environment.md)
