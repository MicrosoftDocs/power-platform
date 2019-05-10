---
title: Provision an environment | Microsoft Docs
description: Add an environment to your tenant.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/10/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Provision an environment

How you provision an environment depends on the platform you're working in.

> [!IMPORTANT]
> We are working to enable provisioning environments within the Power Platform Admin center. Check back for updated information.
>
> If you purchased the new capacity-based license, until provisioning environments is available through the Power Platform Admin center, you can provision environments through the PowerApps/Flow/Dynamics 365 Admin center. If you still need more environments, you can contact [Support](get-help-support.md).

## Provision an environment for PowerApps

See [Create an environment](create-environment.md).

## Provision an environment for Microsoft Flow

See [Create an environment](https://docs.microsoft.com/flow/environments-overview-admin#create-an-environment).

## Provision an environment for Dynamics 365 for Customer Engagement

Until provisioning is enabled in the Power Platform Admin center, you provision environments (instances) in the Dynamics 365 Administration Center.

You can get to this center in multiple ways.

- **Sign in directly**: See [Direct sign in to the Dynamics 365 Administration Center](https://docs.microsoft.com/dynamics365/customer-engagement/admin/sign-in-office-365-apps#direct-sign-in-to-the-dynamics-365-administration-center)
- **Select Dynamics 365 (Power Platform)**: In the [Power Platform Admin center](https://admin.powerplatform.microsoft.com/), in the left-side menu, expand **Admin centers** and select **Dynamics 365**.
- **Select Dynamics 365 (Microsoft 365)**: In the [Microsoft 365 admin center](https://admin.microsoft.com), in the left-side menu, expand **Admin centers** and select **Dynamics 365**. You might need to select **All admin centers** to display the **Dynamics 365** tile. 

For information on how to provision an environment (instance) in the Dynamics 365 Administration Center, see [Add an instance to your subscription](https://docs.microsoft.com/dynamics365/customer-engagement/admin/add-instance-subscription).

## FAQ

### I’m a Customer Engagement customer and recently bought/renewed to the new Capacity offers. Am I eligible to provision an environment using the 1GB database capacity?
Yes. However, the feature to provision using the 1GB rules is coming soon. Please stay tuned for more updates

### I’m a PowerApps/Flow customer. Am I eligible to provision an environment using the 1GB database capacity?
Yes. However, the feature to provision using the 1GB rules is coming soon. Please stay tuned for more updates.

### I’m an existing Customer Engagement customer and I have not transitioned to the new Capacity offers yet. Can I provision using the 1GB available database capacity rules?
No. You should continue using the [Dynamics 365 Admin center](https://docs.microsoft.com/dynamics365/customer-engagement/admin/sign-in-office-365-apps#direct-sign-in-to-the-dynamics-365-administration-center) for provisioning. 

### In the new capacity-based offers, is there any limit on how many environments I can provision?
Provisioning environments is based on available capacity. At least 1GB available database capacity is required to provision. Check your storage capacity [here](https://admin.powerplatform.microsoft.com/analytics/capacity).

### There are multiple admin centers to manage environments. Which should I use?
We are working to consolidate the centers. Until this is completed, please use the admin center where your environment resides. See [Use the various admin centers](admin-centers.md)

<!-- 
### What is the licensing/role requirement to provision and administer Environments?
You can find more details here. 
-->

### See also 
[Preview: Common Data Service storage capacity](capacity-storage.md)