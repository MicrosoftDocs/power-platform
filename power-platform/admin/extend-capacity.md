---
title: Extend Dataverse capacity for 30 days
description: Learn about extending Microsoft Dataverse storage capacity.
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/23/2024
search.audienceType: 
  - admin
contributors:
- ianceicys-msft
---

# Extend Dataverse Capacity for 30 Days

You have options when you're running low on storage capacity. You can [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or extend an additional 25% amount of capacity to your tenant for 30 days. 

Learn more about storage capacity add-ons in [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

If your tenant is running low on available storage capacity, and you need immediate capacity while you work through your organization's standard procurement process to purchase [capacity add-ons](capacity-add-on.md), you can temporarily extend an additional 25% of storage to your tenant for 30 days.

> [!NOTE]
> The Universal License Terms for Online Services apply to your organization’s use of the online service, including consumption that exceeds the online service’s documented entitlements or usage limits.
>
> Your organization must have the right licenses for the storage you use:
>
> - If you use more than your documented entitlements or usage limits, you must buy additional licenses.
>
> - If your storage consumption exceeds the documented entitlements or usage limits, we may suspend use of the online service. 
>
> - Microsoft provides reasonable notice before suspending your online service.

## Prerequisites

An administrator security role is required and you must have at least 1 active license.

Review your [current capacity storage usage](capacity-storage.md#verifying-your-microsoft-dataverse-capacity-based-storage-model) to make sure you're aware of know how much more storage capacity is needed to be extended. Non-admins can also [view self-service storage capacity](view-self-service-capacity.md).

## Extend Dataverse Capacity 

   > [!Note]
   > - Be sure to select the correct tenant to extend the storage capacity for 30 days. 
   >
   > - You can extend capacity on your account a maximum of 3 times.

After you determine how much storage you're using, use the following steps to enable an a capacity extension.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/resources/capacity).

2. In the left pane, select **Resources**.

3. Select **capacity**.

4. If you're running low on storage capacity, you'll see the following banner. In the banner at the top of the page, select **Enable capacity extension**.
   
   :::image type="content" source="media/storage-extend-capacity-banner.png" alt-text="Extend capacity in Power Platform admin center." lightbox="media/storage-extend-capacity-banner.png":::

5. Review the details of the capacity overage. The 25% capacity is calculated based on capacity used and applies to each capacity type (database, file, and log). Select **Enable Capacity Extension**.

   :::image type="content" source="media/storage-extend-capacity-details.png" alt-text="Extend capacity details." lightbox="media/storage-extend-capacity-details.png":::

6. Select **Confirm**.

7. A banner displays the temporary capacity extension has is enabled. 

   :::image type="content" source="media/storage-extend-capacity-success.png" alt-text="Successfully tenant capacity extension." lightbox="media/storage-extend-capacity-success.png"::::::

After enabling the extension, for the next 30 days the additional capacity will appear in the Power Platform admin center **Capacity** page (**Resources** > **Capacity** > **Summary**).

   :::image type="content" source="media/storage-extend-capacity-banner-30-days.png" alt-text="Tenant capacity extension in admin center." lightbox="media/storage-extend-capacity-banner-30-days.png":::

## FAQ

### What will happen after a capacity extension expires in 30 days?

If you exceed your storage capacity, you receive email notifications that alert you to the over-capacity usage. For details about the new model for email notification, see [Changes for exceeding storage capacity entitlements](capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). For details about the legacy model for email notification, see [Changes for exceeding storage capacity entitlements](legacy-capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements). A notification banner also appears in the Power Platform admin center when a tenant exceeds storage capacity. Currently, exceeding storage entitlements doesn't affect the availability of the service. Data stored in the service remains durable even if you go over your storage limit.

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
- For the legacy capacity storage model, see [Example storage capacity scenario](legacy-capacity-storage.md#example-storage-capacity-scenario). 
- For the new capacity storage model, see [Example storage capacity scenarios, overage enforcement](capacity-storage.md#example-storage-capacity-scenarios-overage-enforcement).

The [Universal License Terms for Online Services](https://www.microsoft.com/licensing/terms/product/ForOnlineServices/EAEAS) apply to your organization’s use of the online service, including consumption that exceeds the online service’s documented entitlements or usage limits.

Your organization must have the right licenses for the storage you use: 
- If you use more than your documented entitlements or usage limits, you must buy more licenses.
- If your storage consumption exceeds the documented entitlements or usage limits, we may suspend use of the online service. Microsoft will provide reasonable notice before suspending your online service.

If the storage consumption goes over the entitled limit, we encourage you to manage the excess consumption by deleting unused data or purchasing extra operations storage capacity.