---
title: "Environment capacity management & alerting | MicrosoftDocs"
description: "This article describes a sample process for managing environment capacity and receiving alerts for overages."
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 11/18/2020
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---
# Environment capacity management & alerting

[Power Platform capacity](/power-platform/admin/capacity-storage) is measured at the tenant level and is made up of three types: database, log, and file capacity. When you are over your tenant's allocated capacity, [certain environment operations](/power-platform/admin/capacity-storage#changes-for-exceeding-storage-capacity-entitlements) are impacted and you'll no longer be able to create new environments within the tenant. It's therefore important to monitor your capacity and ensure enough capacity is available in the tenant. In addition to monitoring capacity, you may also have a need to cross-charge usage to other departments internally.

This article describes how part of the [Core components](core-components.md) of the CoE Starter Kit can be used to manage capacity at tenant level.

## Process description

**Problem statement:** Central IT wants to monitor capacity consumption in the tenant to see which environments consume the most capacity. Central IT wants to cross-charge capacity consumption to business units.

**Solution:** Central IT configures approved capacity per environment and adds more meta-data to store business unit and cost code for cross-charging purposes. Central IT receives notifications when environments are close to or over their approved capacity.

## Add approved capacity and business unit information to an environment

First, an admin will have to configure the approved capacity at the granular environment level:

1. Open the [Power Platform Admin View](core-components.md#power-platform-admin-view) app and select **Environments**
1. Select the environment you want to configure approved capacity for.
    ![Select environment.](media\capacity-1.png "Select environment.")
1. Configure approved capacity and view current consumption in the **Capacity and Add-On** section. Configure approved capacity inline by selecting a row and adding the **Approved Capacity** inline. You can configure approved capacity for one or all types of capacity (database, file, log). Capacity is configured in MB.
    ![Configure capacity](media\capacity-2.png "Configure capacity.")
1. Configure the business area that owns this environment and their cost code in the **Additional Details** section. Either select an existing business area from the drop-down, or select **+ New Environment Business Area** to add a new business area.
    ![Configure an environment business area](media\capacity-3.png "Configure an environment business area.")
1. Add a new environment business area by adding the name, business area lead (owner) and cost code, which can be used for reporting purposes.
    ![Add a new environment business area](media\capacity-4.png "Add a new environment business area.")

## Receive capacity alerts

Power Platform Admins will receive notifications if environments are over or 80% close to their approved capacity.

![eMail notification for environments close to their approved capacity](media\capacity-5.png "eMail notification for environments close to their approved capacity.")

## Monitor capacity

Power Platform Admins can also use the Environment Capacity tab of the [Power BI dashboard](power-bi.md) to view how capacity is used across their tenant.

![View how capacity is used across the tenant ](media\capacity-6.png "View how capacity is used across the tenant")

## Frequently Asked Questions

**Does the capacity alerting process in the CoE Starter Kit stop an environment from consuming any more capacity once they reach the approved amount?**
No, the approved capacity is a soft limit for reporting and alerting only. The environment can still consume more capacity. The goal of the capacity alerting process is to allow you to have a better insight into which environments are consuming the tenant’s capacity and place a soft limit on the environment. If you exceed storage at your organization's tenant level, [certain operations](/power-platform/admin/capacity-storage#changes-for-exceeding-storage-capacity-entitlements) - such as creating, copying, restoring or recovering an environment - will no longer be possible. Learn more: [About Microsoft Dataverse storage capacity](/power-platform/admin/capacity-storage#changes-for-exceeding-storage-capacity-entitlements)

**How is the capacity for Dataverse for Teams environments managed?**
Dataverse for Teams environments capacity is capped at two (2) GB of combined database and file storage and is separate from this process.

**I’ve received an email saying an environment is at 80% of the capacity, what actions do I take?**
Once you're alerted of an environment approaching or exceeding their approved capacity amount, you should reach out to the environment admin to discuss a strategy for capacity management. For example, you could either increase the approved capacity, [free up space](/power-platform/admin/free-storage-space) to reduce the storage needed, or [purchase more Microsoft Dataverse storage](/power-platform/admin/add-storage).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
