---
title: "Add Microsoft Dataverse storage capacity"
description: "Learn about adding Microsoft Dataverse storage capacity." 
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/17/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Add Microsoft Dataverse storage capacity

You have options when you're running low on storage capacity. You can [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more capacity to be compliant with storage usage requirements. To learn more about capacity add-ons, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). You can work through your organization's standard procurement process to purchase [capacity add-ons](capacity-add-on.md).

## Add storage space for your tenant

If you start to run out of storage, you can add storage to your subscription if your plan is eligible. If you don't see **Add On Extra Storage Capacity** in the list of available add-ons, it means your plan is not eligible. 

> [!NOTE]
> If you bought your subscription through [Volume Licensing](/licensing/) or a Cloud Solution Provider (CSP), you can't buy additional storage capacity for your organization directly from Microsoft. Contact your representative or [partner](/microsoft-365/commerce/manage-partners?view=o365-worldwide) for help. 

## Preliminary steps

1. You must be an admin to do the tasks in this article. For more information, see [About admin roles](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide).
2. Review your tenant properties: (**portal.azure.com** > under **Azure services** > **Tenant properties**).
3. Determine your [current capacity storage usage](capacity-storage.md#verifying-your-new-storage-model). 

## Purchase add-on storage capacity

After you determine how much storage you're using, you can add or remove storage space for your subscription. Follow the steps below to review pricing and purchase more capacity.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).

2. In the left pane, select **Billing** > **Purchase services**.

3. In the search box, search for "capacity".
   
   :::image type="content" source="media/storage-search-capacity-add-on-purchase.png" alt-text="Search for capacity add-on storage to purchase.":::

4. Select your product, and then select **Details**.

5. From the **Select license quantity** box, enter the number of licenses to purchase.

6. Select your billing frequency, and then select **Buy** to complete the purchase process.

:::image type="content" source="media/storage-file-capacity-purchase.png" alt-text="Buy Dataverse File capacity storage add-on.":::
