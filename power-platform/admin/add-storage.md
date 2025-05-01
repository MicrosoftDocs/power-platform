---
title: Add more Microsoft Dataverse capacity for your tenant
description: Learn about adding Microsoft Dataverse storage capacity.
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/01/2024
search.audienceType: 
  - admin
contributors:
- ianceicys-msft
---

# Add more Microsoft Dataverse capacity for your tenant

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You have options when you're running low on storage capacity. You can [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more storage capacity to be compliant with storage usage requirements. Learn more about storage capacity add-ons in [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). You can work through your organization's standard procurement process to purchase [capacity add-ons](capacity-add-on.md).

If your tenant is running low on available storage capacity, you can add storage to your subscription.  

> [!NOTE]
> The process described in this topic applies to direct purchases using a credit card or invoice.
>
>If you bought your subscription through [Volume Licensing](/licensing/) or a Cloud Solution Provider (CSP), contact your representative or [partner](/microsoft-365/commerce/manage-partners?view=o365-worldwide) for assistance. Customers with an Enterprise Agreement can [make a license reservation](/licensing/license-faq).

## Prerequisites

- You must be a Microsoft 365 Billing admin to complete the tasks in this article. Learn more in [About admin roles](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide).
- You must determine your [current capacity storage usage](capacity-storage.md#verifying-your-microsoft-dataverse-capacity-based-storage-model) to make sure you know how much more storage capacity is needed. Non-admins can also [view self-service storage capacity](view-self-service-capacity.md).

## Purchase Dataverse Capacity add-on

After you determine how much storage you're using, you can add or remove storage space for your subscription. Use the following steps to review pricing and purchase more storage capacity.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/Adminportal/Home#/catalog).

   > [!TIP]
   > Be sure to select the correct tenant to add the storage capacity add-on.

2. In the left pane, select **Marketplace**.

3. Choose a **billing account** to buy products or manage products you own.

4. Search for *Dataverse*.
   
   :::image type="content" source="media/storage-search-capacity.png" alt-text="Search for capacity to list Dynamics 365 apps for capacity add-on storage to purchase." lightbox="media/storage-search-capacity.png":::

5. Select your products as required: Dataverse Database Capacity add-on, Dataverse File Capacity add-on, or Dataverse Log Capacity add-on. Then, select **Details**.

6. From the **Select license quantity** box, enter the number of licenses to purchase.

7. From the **Subscription length**, choose a period from 1 month to 3 years.

8. Select your billing frequency, and then select **Buy** to complete the purchase process.

   :::image type="content" source="media/storage-file-capacity-purchase.png" alt-text="Buy Dataverse File capacity storage add-on." lightbox="media/storage-file-capacity-purchase.png"::::::

After completing the purchase process, the extra storage capacity will appear in the Power Platform admin center **Capacity** page (**Resources** > **Capacity** > **Summary**).
