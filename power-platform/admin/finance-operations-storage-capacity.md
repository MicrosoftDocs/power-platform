---
title: "Finance and Operations storage capacity  | MicrosoftDocs"
description: About Finance and Operations storage capacity reporting that provides administrators way to visualize and understand storage usage vs. entitlement.
author: jimholtz
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/24/2022
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
# Finance and Operations storage capacity 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Finance and Operations storage capacity reporting provides administrators a way to visualize and understand storage usage versus entitlement. The current release scope covers Finance and Operations database storage capacity at both the tenant and environment level. Table-level database storage analytics and Finance and Operations file storage capacity will be available at a later date.

> [!IMPORTANT]
> - This is a preview feature and won't impact the service and performance you will receive from Microsoft Dynamics products cloud services in the short term.
> - You will be notified in advance before Microsoft starts enforcement.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Licenses for Finance and Operations storage 

The following licenses / product categories are entitled to Finance and Operations storage capacity: 

- Dynamics 365 Commerce / Finance / Human Resource / Project Operations / Supply Chain Management 
- Dynamics 365 Unified Operations plan 
- Dynamics 365 Operations – Activity / Device 
- Dynamics 365 Operations - Database capacity / File add-on storage capacity 
- Dynamics 365 Operations– Sandbox 

To see whether you have any of these licenses, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/), and then select **Billing** > **Licenses**.  

> [!NOTE]
> Due to technical limitations, certain licenses are eligible for entitlements but aren't represented in the current reporting. These limitations include:
> - Dynamics AX Online licenses 
> - D365 Finance and Operations China specific licenses 
> - Operations Sandbox Tier 4 and 5 per User Subscription License incremental capacity  
> 
> If you have these licenses, reach out to your account team to get a full view of your entitlement.  

## Capacity page details 

### Summary page 

This page provides a tenant-level view of where your organization is using Finance and Operations storage capacity. 

To view the **Summary** page, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and then select **Resources** > **Capacity** > **Summary** tab. 

image
finance-operations-storage-summary-tab.png

If you are on the [legacy Dataverse storage capacity model](legacy-capacity-storage.md), your **Summary** page will look like this:  

image

### Finance and Operations page 

The Finance and Operations page provides similar information to the **Summary** page, but with an environment-level view of where your organization is using capacity. 

To view this page, select **Resources** > **Capacity** > **Finance and Operations** tab.

image
finance-operations-storage-finops-tab.png

## Actions to take for a Finance and Operations capacity deficit 

This feature is currently in preview and for information only. It will not impact the service and performance you'll receive from Microsoft Dynamics cloud services in the short term. Customers will be notified in advance before Microsoft starts enforcement. 

You can always free up storage, delete unwanted environments/data, or buy more capacity to be compliant with Finance and Operations storage usage. To learn more about Finance and Operations capacity add-ons, see the [Dynamics 365 Licensing Guide](https://www.microsoft.com/licensing/product-licensing/dynamics365). You can work through your organization’s standard procurement process to purchase Finance and Operations capacity add-ons. 

## FAQ 

### Why is Finance and Operations storage reporting separate from Dataverse? 

Microsoft Business Application products work across multiple underlying platform technologies. Dataverse storage powers many experiences across Power Platform and Dynamics 365 apps.  Dataverse reporting is tracked across database, log, and file storage categories.  Finance and Operations products are currently managed on separate database and file platform layers.  Dual-write technologies allow certain Finance and Operations actions to be stored on the Dataverse platform. 

### How is my usage and entitlement calculated? 

Reach out to your account team who will be able to help you understand how your entitlement is calculated. 

### Why don’t I see which tables are causing the overage?  

In the initial launch of reporting, details for specific usage at the table level won't be available.  It will be available in a future release.  

### Is there any reporting for Finance and Operations File capacity? 

In the initial launch of reporting, there won't be any file capacity reporting. It will be available in a future release. 

### What happens if my consumption is over the entitled limit? 

Although there's no impact to runtime experience, we strongly recommend customers to review their data consumption and delete old data that isn't required to be maintained in the platform. Reach out to your account team to purchase additional capacity entitlement to match your needs. 

### How is Microsoft helping customers to stay within their storage entitlement limits? 

For now, your account team will work with you to stay within your entitlement limit.  

### Our storage usage is over, do we owe a true-up for past months we've been over? 

No, there won't be billing in arrears for past overage because usage versus entitlements reporting wasn't available in the past. 


