---
title: Finance and operations storage capacity
description: Use the finance and operations storage capacity report to visualize and understand storage usage vs. entitlement.
author: jimholtz
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/30/2022
ms.subservice: admin
ms.author: jimholtz 
ms.reviewer: 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Finance and operations storage capacity

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The finance and operations storage capacity report gives you a way to visualize your organization's storage usage versus your entitlement.

Currently, the report covers finance and operations database storage capacity at both the tenant and environment level. Table-level analytics and file storage capacity reporting will be available later. For some environments, the **Last updated** field isn't available.

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

To see whether you have any of these licenses, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/), and then select **Billing** > **Licenses**.  

> [!NOTE]
> Due to technical limitations, the following licenses are eligible for entitlements but aren't represented in the current reporting:
>
> - Dynamics AX (Online) licenses
> - China-specific licenses for Dynamics 365 finance and operations apps
> - Operations Sandbox Tier 4 and Tier 5 per user subscription license incremental capacity  
>
> If you have these licenses, reach out to your account team to get a full view of your entitlement.  

## Summary page

The **Summary** page provides a tenant-level view of where your organization is using finance and operations storage capacity.

To view the **Summary** page, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and then select **Resources** > **Capacity** > **Summary** tab.

:::image type="content" source="media/finance-operations-storage-summary-tab.png" alt-text="Screenshot of the Capacity Summary page including finance and operations data.":::

If you're using the [legacy Dataverse storage capacity model](legacy-capacity-storage.md), your **Summary** page will look like this:  

:::image type="content" source="media/finance-operations-storage-summary-tab-legacy.png" alt-text="Screenshot of the legacy Summary page including finance and operations data.":::

## Finance and Operations page

The **Finance and Operations** page provides an environment-level view of where your organization is using finance and operations storage capacity.

To view the **Finance and Operations** page, select **Resources** > **Capacity** > **Finance and Operations** tab.

:::image type="content" source="media/finance-operations-storage-finops-tab.png" alt-text="Screenshot of the Finance and Operations page with capacity data by environment.":::

## Actions to take for a finance and operations capacity deficit

Use the **Summary** tab to determine if you have a capacity deficit.

New storage model:

:::image type="content" source="media/finance-operations-overage-new-model.png" alt-text="Screenshot of the Summary page in the new storage model, with a capacity deficit shown.":::

Legacy storage model:

:::image type="content" source="media/finance-operations-overage-legacy-model.png" alt-text="Screenshot of the Summary page in the legacy storage model, with a capacity deficit shown.":::

If your organization has used more storage than you're entitled to, you can delete unneeded environments and data or buy more capacity. Learn more about finance and operations capacity add-ons in the [Dynamics 365 Licensing Guide](https://www.microsoft.com/licensing/product-licensing/dynamics365). Work through your organization’s standard procurement process to purchase finance and operations capacity add-ons.

Learn how to clean up your finance and operations data:

- [Cleanup routines in Dynamics 365 Finance and Dynamics 365 Supply Chain Management](/dynamics365/fin-ops-core/dev-itpro/sysadmin/cleanuproutines)
- [Archive inventory transactions - Supply Chain Management](/dynamics365/supply-chain/inventory/archive-inventory-transactions)
- [Archive credit card transaction data - Commerce](/dynamics365/commerce/dev-itpro/archive-cc-data)

## FAQ

### Why is finance and operations storage reporting separate from Dataverse?

Microsoft business applications work across multiple underlying technologies. Dataverse powers many experiences across Power Platform and Dynamics 365 apps. Dataverse reporting is tracked across database, log, and file storage categories. Finance and operations products are currently managed on separate database and file platform layers. [Dual-write technologies](/dynamics365/fin-ops-core/dev-itpro/data-entities/dual-write/dual-write-overview) allow certain finance and operations actions to be stored in Dataverse.

### How are my usage and entitlement calculated?

Reach out to your account team for help with understanding how your entitlement is calculated.

### Why don’t I see which tables are causing the overage?  

Details at the table level aren't available in the initial launch of reporting. Table analytics will be available in a future release.

### Is there any reporting for file capacity?

File capacity reporting isn't available in the initial launch of reporting. File capacity analytics will be available in a future release.

### What happens if my consumption is over the entitled limit?

The runtime experience isn't affected. However, we strongly recommend that you review your data consumption and delete old data that you don't need to maintain. Reach out to your account team to purchase more capacity if needed.

### How is Microsoft helping customers to stay within their storage entitlement limits?

For now, your account team will work with you to stay within your entitlement limit.  

### Our storage usage is over, do we owe a true-up for past months we've been over?

You won't be billed in arrears for past overage because usage versus entitlements reporting wasn't available in the past.

### Is the “multiple Lifecycle Services (LCS) projects (multiple production) in one tenant” scenario considered in all the aspects of storage calculation and reporting? Sometimes we have many projects with multiple LCS in one tenant. 

The storage reporting reports usage at tenant level and environment level. If the tenant has multiple production environments, we will report all of them. 




[!INCLUDE[footer-include](../includes/footer-banner.md)]
