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

Most operations, support, and troubleshooting performed by Microsoft personnel (including sub-processors) do not require access to customer data. With Power Platform Customer Lockbox, we provide an interface for the customers to review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed It is used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft.

The Finance and Operations storage capacity reporting provides administrators a way to visualize and understand storage usage vs. entitlement at both the tenant and environment level. This feature is in preview stage. Current scope covers Finance and Operations database storage capacity only. Finance and Operations file storage capacity will be available at a later date. 

> [!IMPORTANT]
> - This is a preview feature and won't impact the service and performance you will receive from Microsoft Dynamics products cloud services in the short term.
> - You will be notified in advance before Microsoft starts enforcement.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Licenses for Finance and Operations storage 

The following licenses / product categories are entitled to Finance and Operations storage capacity: 

- Dynamics 365 Commerce / Finance / Human resource / Project operations / Supply chain management 
- Dynamics 365 Unified Operations plan 
- Dynamics 365 Operations – Activity / Device 
- Dynamics 365 Operations - Database capacity / File add-on storage capacity 
- Dynamics 365 Operations– Sandbox 

To see whether you have any of these licenses, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/), and then go to **Billing** > **Licenses**.  

> [!NOTE]
> Due to technical limitations, certain licenses are eligible for entitlements but are not represented in the current reporting, including Dynamics AX Online and Dynamics 365 Finance and Operations China specific licenses, as well as Sandbox Tier 4 and 5 accrued. If you have these licenses, reach out to your account team to get a full view of your entitlement.

## Capacity page details 

### Summary tab 

This page provides a tenant-level view of where your organization is using Finance and Operation storage capacity. 

To view the **Summary** page, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and then select **Resources** > **Capacity** > **Summary** tab. 

image