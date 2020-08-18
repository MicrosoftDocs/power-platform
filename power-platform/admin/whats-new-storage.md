---
title: What's new for storage | Microsoft Docs
description: Learn what's new about storage for Power Platform
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/07/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# What's new about storage

We've made some key enhancements to admin experiences for the Power Platform admin center and the Dynamics 365 admin center:

- Storage reporting is based on customer licenses and capacity add-ons.
- Changes have been implemented for exceeding storage capacity entitlements.

We're rolling out these features now so check back if your user experience varies from the following content.

## Updates to storage reporting

In April 2019, we introduced Common Data Service capacity storage that's optimized for relational data (database), attachments (file), and audit logs (log). New customers of Power Apps, Power Automate, and model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service) receive a tenant-wide default entitlement for each of these three storage types and additional per user subscription license entitlements. Additional storage can be purchased in 1-GB increments. Existing customers won't be affected by this change until the end of their current Power Apps or Dynamics 365 subscription, when renewal is required.

![Evolution of data management](media/storage-model-evolution.png "Evolution of data management")

Some of the benefits of this change include:

- Scalability with purpose-built storage management solutions.
- The ability to enable new business scenarios.
- Reduced need to [free up storage space](free-storage-space.md).
- Support for a variety of data types.
- Additional default and full user entitlements.
- Flexibility to create new environments.

Following the introduction of Common Data Service capacity, we updated our capacity reporting to show database, file, and log entitlement for all our customers. This change in reporting isn't visible to those who are still on the legacy licensing storage model.

### Two versions of storage reporting

There are two versions for storage capacity reporting: 

- **Legacy capacity model**: Organizations with the [previous licensing model](legacy-capacity-storage.md#licenses-for-the-legacy-storage-model) for storage. Users with these licenses will see a single capacity for entitlement. More information: [Legacy storage capacity](legacy-capacity-storage.md)

- **New capacity model**: Organizations with the [new licensing model](capacity-storage.md#licenses-for-the-new-storage-model) for storage. Users with these licenses will see the storage capacity entitlement and usage by database, file, and log. More information: [Common Data Service storage capacity](capacity-storage.md)

## What happens when my organization exceeds storage entitlements?

If you exceed your storage capacity, you'll receive notifications alerting you to the over-capacity usage. These notifications occur as alerts in the Power Platform admin center. The following admin operations won't be available when a tenant exceeds storage capacity entitlements: 

1. Create environment (currently enforced)
2. Copy environment (starting August 10th)
3. Restore environment (starting August 10th)

Please review:
- [Actions to take for a storage capacity deficit](capacity-storage.md#actions-to-take-for-a-storage-capacity-deficit).
- For the legacy capacity model, see [Legacy storage capacity](legacy-capacity-storage.md).
- For the new capacity storage model, see [Common Data Service storage capacity](capacity-storage.md).

### See also
[Legacy storage capacity](legacy-capacity-storage.md) <br />
[Common Data Service storage capacity](capacity-storage.md) <br />
[Free up storage space](free-storage-space.md) <br />
[Delete and recover environments](delete-environment.md)
