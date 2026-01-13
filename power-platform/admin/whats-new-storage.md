---
title: Dataverse capacity-based storage overview
description: Learn about enhancements for Dataverse capacity-based storage that affect administrators.
author: ianceicys-msft
ms.component: pa-admin
ms.topic: overview
ms.date: 11/20/2025
ms.subservice: admin
ms.author: ashi
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

## Updates to storage reporting

In April 2019, we introduced Microsoft Dataverse capacity storage that's optimized for relational data (database), attachments (file), and audit logs (log). New customers of Power Apps, Power Automate, and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) receive a tenant-wide default entitlement for each of these three storage types. They also receive more per-user subscription license entitlements. You can purchase more storage in 1-GB increments. Existing customers aren't affected until the end of their current Power Apps or Dynamics 365 subscription, when renewal is required.

:::image type="content" source="media/storage-model-evolution.png" alt-text="Evolution of data management":::

Some of the benefits of this change include:

- Scalability with purpose-built storage management solutions.
- The ability to enable new business scenarios.
- Reduced need to [free up storage space](free-storage-space.md).
- Support for various data types.
- More default and full user entitlements.
- Flexibility to create new environments.

Following the introduction of Dataverse capacity, we updated our capacity report to show database, file, and log entitlement for all our customers. This change in reporting isn't visible to those who are still on the legacy licensing storage model.

### Two versions of storage reporting

Two versions of storage capacity reporting are available:

- **Legacy capacity model**: Organizations that use the [previous licensing model](legacy-capacity-storage.md#licenses-for-the-legacy-storage-model) for storage. Users with these licenses see a single capacity for entitlement. For more information, see [Legacy storage capacity](legacy-capacity-storage.md).
- **New capacity model**: Organizations that use the [new licensing model](capacity-storage.md#licenses-for-microsoft-dataverse-capacity-based-storage-model) for storage. Users with these licenses see the storage capacity entitlement and usage by database, file, and log. For more information, see [Dataverse storage capacity](capacity-storage.md).

## What happens when my organization exceeds storage entitlements?

If your organization exceeds its storage capacity, you receive email notifications that alert you to the over-capacity usage. For details about the new model for email notification, see [Changes for exceeding storage capacity entitlements](capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). For details about the legacy model for email notification, see [Changes for exceeding storage capacity entitlements](legacy-capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). A notification banner also appears in the Power Platform admin center when a tenant exceeds storage capacity. Currently, exceeding storage entitlements doesn't affect the availability of the service. Data stored in the service remains durable even if you go over your storage limit.

The following admin operations aren't available when a tenant exceeds storage capacity entitlements:

- Create new environment (requires minimum 1-GB capacity available)
- Copy an environment (requires minimum 1-GB capacity available)
- Restore an environment (requires minimum 1-GB capacity available)
- Convert a trial environment to paid (requires minimum 1-GB capacity available)
- Recover an environment (requires minimum 1-GB capacity available)
- Add Dataverse database to an environment

More information:

- [Is there a database size restriction for backing-up or restoring an organization through the user interface or API?](backup-restore-environments.md#is-there-a-database-size-restriction-for-backing-up-or-restoring-an-organization-through-the-user-interface-or-api)
- [Actions to take for a storage capacity deficit](capacity-storage.md#actions-to-take-for-a-storage-capacity-deficit).
- For the legacy capacity storage model, go to [Example storage capacity scenario](legacy-capacity-storage.md#example-storage-capacity-scenario).
- For the new capacity storage model, go to [Example storage capacity scenarios, overage enforcement](capacity-storage.md#example-storage-capacity-scenarios-and-overage-enforcement).

The [Universal License Terms for Online Services](https://www.microsoft.com/licensing/terms/product/ForOnlineServices/EAEAS) apply to your organization's use of the online service, including consumption that exceeds the online service's documented entitlements or usage limits.

Your organization must have the right licenses for the storage you use:

- If you use more than your documented entitlements or usage limits, you must buy more licenses.
- If your storage consumption exceeds the documented entitlements or usage limits, we might suspend use of the online service. Microsoft provides reasonable notice before suspending your online service.

If the storage consumption goes over the entitled limit, manage the excess consumption by deleting unused data or purchasing extra operations storage capacity.

## Manage overages

You can manage capacity overages for environments by opting for pay-as-you-go, reallocating capacity from within your tenant, or increasing entitled capacity. You can also request a capacity extension after 80% overall consumption, up to three times in the last 365 days and after the expiry of an existing extension to manage overages. By enabling a tenant capacity extension, you have 45 days to reduce capacity usage and purchase more capacity.

### Manage capacity

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com) as a system admin.
1. On the navigation pane, select **Licensing**.
1. Select **Dataverse**.
1. Select **Manage capacity**.
1. On the *Manage capacity* pane, select an environment to see capacity management options for that environment. You can draw from available capacity within the tenant or bill to your pay-as-you-go billing plan. You can also select the option to receive an overage notification when the environment nears reaching any amount between 50-100%.
1. Select **Save**.

   :::image type="content" source="media/storage-manage-capacity.png" alt-text="Manage Dataverse storage capacity in Power Platform admin center." lightbox="media/storage-extend-capacity-banner.png":::

### Enable capacity extension

1. Go to the Dataverse *Licenses* page in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/billing/licenses/dataverse/overview).
1. If you're running low on storage capacity, the **Enable capacity extension** tab is highlighted.

   :::image type="content" source="media/storage-extend-capacity-banner.png" alt-text="Extend capacity in Power Platform admin center." lightbox="media/storage-extend-capacity-banner.png":::

1. Review the details of the capacity overage. The 25% capacity is calculated based on capacity used and applies to each capacity type (database, file, and log). Select **Enable capacity extension**.

   :::image type="content" source="media/storage-extend-capacity-details.png" alt-text="Extend capacity details." lightbox="media/storage-extend-capacity-details.png":::

1. Select **Confirm**.

#### About extensions

- An extension is at the tenant level.
- An extension applies to both the legacy and new storage capacity models.
- An extension allows you to create an environment.
- An extension allows admins to copy and restore environments for a maximum of 45 days while over the capacity limit.
- Your organization can request an extension a maximum of three times in the last 365 days.
- After extension, copying and restoring environments is blocked again if the tenant doesn't have available storage capacity. To avoid this situation, admins should reduce storage usage and/or purchase more storage capacity.

## Change log for major updates in storage

| Date | Description |
|------|-------------|
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

[!INCLUDE[footer-include](../includes/footer-banner.md)]
