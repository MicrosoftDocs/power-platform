---
title: Finance and operations storage capacity
description: Learn to use the finance and operations storage capacity report to understand your storage usage vs. your entitlement and get answers to frequently asked questions.
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/22/2023
ms.subservice: admin
ms.author: sericks 
ms.reviewer: 
search.audienceType: 
  - admin
---

# Finance and operations storage capacity

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The finance and operations storage capacity report shows how much finance and operations storage your organization is using compared with how much its license entitles it to.

> [!IMPORTANT]
>
> - This report is in preview. You may use it to manage your storage efficiently. If the storage consumption goes over the entitled limit, we encourage you to manage the excess consumption by deleting unused data or purchasing additional operations storage capacity. There is no functional or performance impact to your service if storage consumption exceeds your entitlement.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Licenses for finance and operations storage

The following product and capacity licenses include storage for finance and operations data:

- Dynamics 365 Commerce, Finance, Human Resources, Project Operations, and Supply Chain Management
- Dynamics 365 Unified Operations plan
- Dynamics 365 Operations – Activity/Device
- Dynamics 365 Operations database capacity/file capacity
- Dynamics 365 Operations Sandbox

To determine whether you have any of these licenses, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/), and then select **Billing** > **Licenses**.  

> [!NOTE]
> The following licenses are eligible for entitlements but aren't represented in the current reporting:
>
> - Dynamics AX (Online) licenses
> - China-specific licenses for finance and operations apps
> - Operations Sandbox Tier 4 and Tier 5 per-user subscription license incremental capacity  
>
> If you have these licenses, reach out to your account team to get a full view of your entitlement.  

## Summary page

The **Summary** page of the report provides a tenant-level view of where your organization is using finance and operations storage capacity.

To view the **Summary** page, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and then select **Resources** > **Capacity** > **Summary** tab.

:::image type="content" source="media/finance-operations-storage-summary-tab.png" alt-text="Screenshot of the Capacity Summary page including finance and operations data.":::

If you're using the [legacy Dataverse storage capacity model](legacy-capacity-storage.md), your **Summary** page will look like this:  

:::image type="content" source="media/finance-operations-storage-summary-tab-legacy.png" alt-text="Screenshot of the legacy Summary page including finance and operations data.":::

## Finance and Operations page

The **Finance and Operations** page provides an environment-level view of where your organization is using finance and operations storage capacity.

To view the **Finance and Operations** page, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and then select **Resources** > **Capacity** > **Finance and Operations** tab.

:::image type="content" source="media/finance-operations-storage-finops-tab.png" alt-text="Screenshot of the Finance and Operations page with capacity data by environment.":::

## Address a storage capacity deficit

The **Summary** tab shows whether your organization is using more finance and operations storage than it's entitled to.

New storage model:

:::image type="content" source="media/finance-operations-overage-new-model.png" alt-text="Screenshot of the Summary page in the new storage model, with a capacity deficit shown.":::

Legacy storage model:

:::image type="content" source="media/finance-operations-overage-legacy-model.png" alt-text="Screenshot of the Summary page in the legacy storage model, with a capacity deficit shown.":::

If your organization has a storage capacity deficit, you can delete unneeded environments and data or buy more capacity. Learn more about finance and operations capacity add-ons in the [Dynamics 365 Licensing Guide](https://www.microsoft.com/licensing/product-licensing/dynamics365). Work through your organization’s standard procurement process to purchase finance and operations capacity add-ons.

Learn how to clean up your finance and operations data:

- [Cleanup routines in Dynamics 365 Finance and Dynamics 365 Supply Chain Management](/dynamics365/fin-ops-core/dev-itpro/sysadmin/cleanuproutines)
- [Archive credit card transaction data - Commerce](/dynamics365/commerce/dev-itpro/archive-cc-data)

## FAQ

### Why is finance and operations storage reporting separate from Microsoft Dataverse?

Microsoft business applications work across multiple underlying technologies. Dataverse powers many experiences across Power Platform and Dynamics 365 apps. Dataverse reporting is tracked across database, log, and file storage categories. Finance and operations products are currently managed on separate database and file platform layers. [Dual-write technologies](/dynamics365/fin-ops-core/dev-itpro/data-entities/dual-write/dual-write-overview) allow certain finance and operations actions to be stored in Dataverse.

### How are my usage and entitlement calculated?

Finance and operations entitlement includes default capacity entitlement plus accrued capacity entitlement based on each operations base enterprise and activity license. For more information, go to the Capacity Licenses section of the [Dynamics 365 License Guide](https://www.microsoft.com/licensing/product-licensing/dynamics365).

### Why did the Finance Operations Database Base User Subscription License (USL) Entitlement calculation change?
This is due to a change in December 2023, where the Operations Database Capacity (Accrued/USL) was increased from 1.5GB to 4 GB. For more details on how base entitlement calculation works, go to the Capacity Licenses section of the [Dynamics 365 License Guide](https://www.microsoft.com/licensing/product-licensing/dynamics365).

### Why don’t I see which tables are causing the overage?  

Details at the table level aren't available in the initial launch of reporting. Table analytics will be available in a future release.

### Is there any reporting for file capacity?

File capacity reporting is in public preview. Capacity reports for Finance and operations File is not generally available. 

:::image type="content" source="media/finance-operations-storage-capacity/finance-operations-database.png" alt-text="Screenshot of the Finance and operations File.":::

A new report will provide Log and File consumption analytics for Finance and Operations and is expected to be available during the calendar year 2023. The new report will provide enhanced precision for file consumption analytics.

### What happens if my consumption is over the entitled limit?

The runtime experience isn't affected. However, we strongly recommend that you review your database storage consumption and delete old data that you don't need to maintain. Reach out to your account team to purchase more capacity if needed.

For File and Log capacity analytics for Finance and Operations, you're not expected to take any action currently in the public preview phase. This article will be updated with the steps to stay within the storage limit when File capacity analytics for Finance and Operations will be generally available.

### How is Microsoft helping customers stay within their storage entitlement limits?

For now, your account team will work with you to stay within your entitlement limit.  

### We have multiple Lifecycle Services projects in our tenant with each having its own production and sandbox environment. How does storage reporting work in this case?

Storage reporting covers usage at the tenant and environment level. All environments in all Lifecycle Services projects on the tenant will be included in storage reporting.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
