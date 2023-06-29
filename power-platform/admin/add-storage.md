---
title: "Add Microsoft Dataverse storage capacity"
description: "Learn about adding Microsoft Dataverse storage capacity." 
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: jimholtz
ms.custom: "admin-security"

ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/24/2021
search.audienceType: 
  - admin
---
# Add Microsoft Dataverse storage capacity

You have options when you're running low on storage capacity. You can [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more storage capacity to be compliant with storage usage requirements. To learn more about storage capacity add-ons, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). You can work through your organization's standard procurement process to purchase [capacity add-ons](capacity-add-on.md).

## Add storage capacity for your tenant

If your tenant is running low on available storage capacity, you can add storage to your subscription.  

> [!NOTE]
> The process described in this topic applies to direct purchases using a credit card or invoice.
>
>If you bought your subscription through [Volume Licensing](/licensing/) or a Cloud Solution Provider (CSP), contact your representative or [partner](/microsoft-365/commerce/manage-partners?view=o365-worldwide) for assistance. Customers with an Enterprise Agreement can [make a license reservation](/licensing/license-faq).

## Preliminary steps

1. You must be a Microsoft 365 Global or Billing admin to do the tasks in this article. For more information, see [About admin roles](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide).
2. Determine your [current capacity storage usage](capacity-storage.md#verifying-your-new-storage-model) to make sure you know how much additional storage capacity is needed. Non-admins can also [view self-service storage capacity](view-self-service-capacity.md).

## Purchase add-on storage capacity

After you determine how much storage you're using, you can add or remove storage space for your subscription. Follow the steps below to review pricing and purchase more storage capacity.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).

   > [!TIP]
   > Be sure to select the correct tenant to add the storage capacity add-on.

2. In the left pane, select **Billing** > **Purchase services**.

3. Search for "capacity".
   
   :::image type="content" source="media/storage-search-capacity.png" alt-text="Search for capacity to list Dynamics 365 apps for capacity add-on storage to purchase.":::

   > [!NOTE]
   > Common Data Service capacity refers to Microsoft Dataverse capacity. The name will be changed in the Microsoft 365 Purchase Services page in the future.

4. Select your products as required: Common Data Service File Capacity, Common Data Service Log Capacity, or Common Data Service Database capacity. Then, select **Details**.

5. From the **Select license quantity** box, enter the number of licenses to purchase.

6. Select your billing frequency, and then select **Buy** to complete the purchase process.

   :::image type="content" source="media/storage-file-capacity-purchase.png" alt-text="Buy Dataverse File capacity storage add-on.":::

After completing the purchase process, the additional storage capacity will appear in the Power Platform admin center **Capacity** page (**Resources** > **Capacity** > **Summary**).
