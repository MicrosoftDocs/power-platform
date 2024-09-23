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

# Extend Microsoft Dataverse Capacity for 30 Days to your tenant

You have options when you're running low on storage capacity. You can [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or extend an additional 25% amount of capacity to your tenant for 30 days. Learn more about storage capacity add-ons in [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

If your tenant is running low on available storage capacity, and you need immediate capacity while you work through your organization's standard procurement process to purchase [capacity add-ons](capacity-add-on.md), you can temporarily extend an additional 25% of storage to your tenant for 30 days.

> [!NOTE]
> The Universal License Terms for Online Services apply to your organization’s use of the online service, including consumption that exceeds the online service’s documented entitlements or usage limits.

> Your organization must have the right licenses for the storage you use:

> If you use more than your documented entitlements or usage limits, you must buy additional licenses.

> If your storage consumption exceeds the documented entitlements or usage limits, we may suspend use of the online service. 

> Microsoft provides reasonable notice before suspending your online service.

## Prerequisites

- Review your [current capacity storage usage](capacity-storage.md#verifying-your-microsoft-dataverse-capacity-based-storage-model) to make sure you're aware of know how much more storage capacity is needed to be extended. Non-admins can also [view self-service storage capacity](view-self-service-capacity.md).

## Extend Dataverse Capacity 

After you determine how much storage you're using, use the following steps to enable an additional 25% of capacity to your tenant.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/resources/capacity).

   > [!Note]
   > Be sure to select the correct tenant to extend the storage capacity for 30 days. 

   > You may extend an additional 25% of capacity on your account a maximum of 3 times.

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

Currently, exceeding storage entitlements doesn't affect the availability of the service. Data stored in the service remains durable even if you go over your storage limit.

The [Universal License Terms for Online Services](https://www.microsoft.com/licensing/terms/product/ForOnlineServices/EAEAS) apply to your organization’s use of the online service, including consumption that exceeds the online service’s documented entitlements or usage limits.

Your organization must have the right licenses for the storage you use: 
- If you use more than your documented entitlements or usage limits, you must buy additional licenses. 
- If your storage consumption exceeds the documented entitlements or usage limits, we may suspend use of the online service. Microsoft will provide reasonable notice before suspending your online service.