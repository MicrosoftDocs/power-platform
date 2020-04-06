---
title: What's new | Microsoft Docs
description: Learn about what's new with administering the Power Platform admin center
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/03/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# What's new 

We've made some key enhancements to admin experiences for the Power Platform admin center and the Dynamics 365 admin center:

- Storage reporting is based on customer licenses and capacity add-on's.
- Provisioning new environments is only done in the Power Platform admin center.
- Changes for exceeding storage capacity entitlements.

## Updates to storage reporting

In April 2019, we introduced Common Data Service capacity storage that is optimized for relational data (database), attachments (file), and audit logs (log). New customers of Power Apps, Power Automate, and model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service) receive a tenant-wide default entitlement for each of these three storage types and additional per user subscription license entitlements. Additional storage can be purchased in 1 GB increments. Existing customers are not impacted by this change until the end of their current Power Apps or Dynamics 365 subscription, when renewal is required. 

Following the introduction of Common Data Service capacity, we updated our capacity reporting to show database, file, and log entitlement for all our customers. This change in reporting is not visible to those still on the legacy licensing storage model.

- If you are on the previous licensing model for storage, you will see a single capacity for entitlement. See [Legacy storage capacity](legacy-capacity-storage.md).
- If you have transitioned to the new licensing model or have a mix of old and new license models, you will see the storage capacity entitlement and usage by database, file, and log. See [Common Data Service storage capacity](capacity-storage.md).
- To determine which licensing model you're using, see [Determining your storage model](legacy-capacity-storage.md#determining-your-storage-model).

## Provisioning new environments will only be handled in the Power Platform admin center

Today, there are two admin centers for provisioning new environments – Dynamics 365 admin center and Power Platform admin center. We are working to move to a single provisioning experience in the Power Platform admin center. Look for notifications in the Dynamics 365 admin center and updated information in this topic for when this work is completed.

## Changes for exceeding storage capacity entitlements

We are making changes for what happens when an organization's storage capacity usage is greater than the capacity entitled or purchased via add-ons.

For now, if you exceed your storage capacity, you will receive notifications alerting you to the overage. In the future, certain admin  operations will no longer be available when a tenant exceeds storage capacity entitlements. Check back for updated information.

Consider the following scenarios.

### Example storage capacity scenarios

#### Scenario 1: Database storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 110GB        |
|**Log**     |  10GB       | 5GB        |
|**File**     | 400GB        | 200GB        |

This tenant is considered over capacity for entitlement storage.

#### Scenario 2: Log storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 95GB        |
|**Log**     |  10GB       | 20GB        |
|**File**     | 400GB        | 200GB        |

This tenant is 10GB over in log usage and has only 5GB available in database capacity. Therefore, there is a deficit.

#### Scenario 3: Log storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 80GB        |
|**Log**     |  10GB       | 20GB        |
|**File**     | 400GB        | 200GB        |

This tenant is 10GB over in log usage but has 20GB available in database capacity. Therefore, there is no deficit.

#### Scenario 4: File storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 20GB        |
|**Log**     |  10GB       | 2GB        |
|**File**     | 200GB        | 285GB        |

This tenant is 85GB over in log usage but has 88GB available (80GB database + 8GB log) in storage capacity. Therefore, there is no deficit.

### Actions to take for a storage capacity deficit

You can always [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more capacity to be compliant with storage usage. To learn more about capacity add-ons, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the [Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130), the 'Add-ons' section. You can work through your organization's standard procurement process to purchase capacity add-ons.

### FAQ

#### I have available instances (Production and Sandbox), but my capacity usage is more than capacity entitled. Will I be able to provision new environments? 
No. You can only provision a new environment if you have at least 1GB available database capacity. 

#### I have storage licenses from the legacy licensing model and I also purchased new model storage licenses. Which report will I see?  
You will see the report for the new licensing model. 

#### What are my options if I'm overusing capacity?  
You can buy more capacity to be compliant, and [free up](free-storage-space.md) or [delete](delete-environment.md) unused environments. 

#### Do I get notified through email when my org is over capacity?  
When you sign in to the Power Platform admin center, you will be notified if your capacity usage is more than the entitled capacity. We are also planning to send email notifications and will publish an update once this is available. 

### See also
[Common Data Service storage capacity](capacity-storage.md) <br />
[Legacy storage capacity](legacy-capacity-storage.md) <br />
[Free storage space](free-storage-space.md) <br />
[Delete and recover environments](delete-environment.md)