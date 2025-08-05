---
title: Legacy storage capacity
description: Learn more about the legacy storage model details.
ms.date: 6/23/2025
ms.reviewer: sericks
ms.topic: concept-article
author: sericks007
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
- ianceicys-msft 
- sericks007
ms.contributors:
- ceian
- sericks
---

# Legacy storage capacity

In April 2019, we introduced Microsoft Dataverse capacity storage that is optimized for relational data, attachments, and audit logs. If you purchased storage before April 2019, you're using the legacy licensing model for storage discussed in this article.

For information on the new storage model, see [New Microsoft Dataverse storage capacity](capacity-storage.md).

## Licenses for the legacy storage model 

The following licenses provide capacity using the legacy storage model. If you have any of the following licenses and none of the Dataverse capacity-based storage licenses, the legacy model report is displayed: 

- Microsoft Dynamics 365 Additional Non-production Instance 
- Microsoft Dynamics 365 Additional Test Instance 
- Microsoft Dynamics 365 Instance 
- Microsoft Dynamics 365 Storage Add-On 

To see whether you have any of these licenses, sign in to the Microsoft 365 admin center, and then go to **Billing** > **Licenses**.

> [!NOTE]
> If you have a mix of the abovementioned legacy model licenses and [new model licenses](capacity-storage.md#licenses-for-microsoft-dataverse-capacity-based-storage-model), you'll see the [new model report](capacity-storage.md).
> If you have none of the abovementioned legacy model licenses nor the [new model licenses](capacity-storage.md#licenses-for-microsoft-dataverse-capacity-based-storage-model), you'll see the [new model report](capacity-storage.md).

## Verifying your legacy storage model

Follow these steps to view the legacy licensing storage model:

###### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the **Licensing** pane, select **Capacity add-ons**.

3. View the data on the **Summary** page.

The legacy licensing storage model looks like the following image.

**Request:** Require the legacy licensing storage model image in green PPAC.

###### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. Select **Resources** > **Capacity**.

3. View the data on the **Summary** page.

The legacy licensing storage model looks like the following image.

:::image type="content" source="media/capacity-old-license-model.png" alt-text="Legacy licensing storage model":::

---

The report displays available storage capacity by source in addition to overall storage capacity usage. To help customers transition to the new licensing model, current usage is also shown by database, file, and log capacity.

## Capacity page details

> [!NOTE]
> The calculation of storage capacity usage in the legacy licensing model consists of all three storage types&mdash;database, file, and log&mdash;however, it's displayed as one overall storage number.

### Summary tab

This page provides a tenant-level view of where your organization is using storage capacity.

Follow these steps to view the **Summary** tab:

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Licensing**.

3. In the **Licensing** pane, select **Capacity add-ons**, and then select **Summary**.

**Request:** Require the image of the Summary tab in green PPAC.

##### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. Select **Resources** > **Capacity** > **Summary**.

:::image type="content" source="media/capacity-old-license-model-explained.png" alt-text="Capacity storage details":::

---

All tables of Dataverse, including system tables, are included in the storage capacity reports.

|Number  |Description |
|---------|---------|
|(1)   |**Storage capacity usage**  <ul><li>**File and database**: The following tables store data in file and database storage: <ul><li>Attachment</li><li>AnnotationBase</li><li>Any custom or out-of-the-box table that has columns of datatype file or image (full size)</li><li>Any table that is used by one or more installed Insights applications and [ends in *- Analytics*](#what-are-tables-ending-in---analytics-in-my-capacity-report) </li> </ul><ul><li>WebResourceBase</li></ul><ul><li>RibbonClientMetadataBase</li></ul></li><li>**Log**: The following tables are used: <ul><li>AuditBase</li><li>PlugInTraceLogBase</li></ul><li>**Database only**: All other tables are counted for your database</li></ul>  |
|(2)    |**Storage capacity, by source** <ul><li>**Org (tenant) default**: The default capacity provided at account creation </li><li>**User licenses**: Extra capacity added for every user license purchased</li><li>**Additional storage**: Any extra storage you bought </li><li>**Total**: Total storage available </li><li>**View self-service sources**: See [View self-service license amounts and storage capacity](view-self-service-capacity.md)</li></ul>      |
|(3)     |**Top storage usage, by environment**: The environments that consume the most capacity        |
|(4)  |  **Add-ons**:  Your organization's add-on usage details. See [View capacity add-ons in Power Platform admin center](capacity-add-on.md#view-capacity-add-ons-in-power-platform-admin-center) |

### Dataverse tab

This page provides similar information as the **Summary** tab, but with an environment-level view of where your organization is using capacity.

Follow these steps to view the page:

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Licensing**.

3. In the **Licensing** pane, select **Capacity add-ons**, and then select **Dataverse**.

**Request:** Require the image of the Dataverse tab in green PPAC.

##### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. Select **Resources** > **Capacity** > **Dataverse**.

:::image type="content" source="media/capacity-old-license-model-explained.png" alt-text="Capacity storage details":::

---

Note the following features:

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |
|Details  | See the next section for using the **Details** button (![Storage data details button.](media/storage-data-details-button.png "Storage data details button")) to see environment capacity analytics.   |

:::image type="content" source="media/capacity-old-license-model-storage-tab.png" alt-text="Dataverse capacity tab":::

> [!NOTE]
>
> - The following environments don't count against capacity and are shown as 0 GB:
>   - Microsoft Teams
>   - Trial
>   - Preview
>   - Support
>   - Developer
> - You can select an environment that's showing 0 GB, and then go to its storage capacity details page to see the actual consumption.

#### Environment storage capacity details

Select the **Details** button (![Storage data details button.](media/storage-data-details-button.png "Storage data details button")) on the **Summary** tab view to see  an environment-level detailed view of where your organization is using capacity, in addition to the three types of capacity consumption.

:::image type="content" source="media/capacity-old-license-model-storage-details.png" alt-text="Environment capacity analytics":::

The following details are provided:

- Actual database usage
- Top database tables and their growth over time
- Actual file usage
- Top files tables and their growth over time
- Actual log usage
- Top tables and their growth over time

### Microsoft Teams tab

This page provides a view of the capacity storage used by your Microsoft Teams environments. Teams environment capacity usage doesn't count towards your organization's Dataverse usage.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Licensing**.

3. In the **Licensing** pane, select **Capacity add-ons**, and then select **Microsoft Teams**.

##### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. Select **Resources** > **Capacity** > **Microsoft Teams** tab.

---

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |

### Add-ons tab

Use this page to view your organization's add-on usage details and to assign add-ons to environments. See [View capacity add-ons in Power Platform admin center](capacity-add-on.md#view-capacity-add-ons-in-power-platform-admin-center)

> [!NOTE]
> This tab only appears if you have add-ons included in your tenant.

### Trial tab

This page provides a view of the capacity storage used by your trial environments. Trial environment capacity usage doesn't count towards your organization's Dataverse usage.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Licensing**.

3. In the **Licensing** pane, select **Capacity add-ons**, and then select **Trial**.

##### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. select **Resources** > **Capacity** > **Trial**.

---

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |

## Example storage capacity scenario

### Scenario: Total storage is over capacity, overage enforcement

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Total storage**     | 100 GB        | 110 GB        |

The 110 GB of storage is used by the three types of storage: database, log, and file. This tenant is 10 GB over in storage usage. Therefore, there's a deficit. This tenant should free up storage or purchase more capacity.

## Changes for exceeding storage capacity entitlements

We're making changes for what happens when an organization's storage capacity is close to, or exceeds the capacity entitled or purchased via add-ons.

Notifications for capacity approaching storage limits are triggered when any of total legacy model storage has less than 15% of space available.  Another warning notification that admin operations could be impacted is sent when total legacy model capacity has less than 5% of space available.  The final tier of notification is sent when the tenant is ‘in overage’ (storage usage exceeds capacity entitlements). This alerts the admin that the following operations aren't available until there's available capacity present on the tenant.

- Create a new environment (requires minimum 1 GB capacity available)
- Copy an environment
- Restore an environment
- Convert a trial environment to paid (requires minimum 1 GB capacity available)
- Recover an environment (requires minimum 1 GB capacity available)
- Add Dataverse database to an environment

These notifications are sent out to tenant admins on a weekly basis. 

At this time, there's no option for the tenants to opt-out of these notifications or delegate these notifications to someone else.

All tenant admins for a tenant automatically receive these notifications.

A notification banner is displayed in the Power Platform admin center when a tenant has exceeded storage capacity.

## Actions to take for a storage capacity deficit

You can always [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more capacity to be compliant with storage usage. To learn more about capacity add-ons, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).
</br>You can work through your organization's standard procurement process to purchase capacity add-ons.

## FAQ

### Why is my storage consumption decreasing in database and growing in file?

We're constantly optimizing the Dataverse for ease of use, performance, and efficiency. Part of this ongoing effort is to move data to the best possible storage with the lowest cost for customers. File-type data such as _Annotation_ and _Attachment_ is moving from database to file storage, leading to decreased usage of database capacity and an increase in file capacity.

### Why could my database table size decrease while my table and file data sizes remain the same?

As part of moving file-type data such as _Annotation_ and _Attachment_ out from database and into file storage, we periodically reclaim the freed database space leading to decreased usage of database capacity, while the table and file data size computations remain unchanged.

### I have available instances (production and sandbox), but my capacity usage is more than my capacity entitlement. Will I be able to provision new environments? 

Provisioning a new environment requires that you not be delinquent in storage capacity. If you have at least 1 GB of available storage capacity, you can provision environments to align with your available instances.

### I have storage licenses from the legacy licensing model, and I also purchased new model storage licenses. Which report will I see?

You see the [Microsoft Dataverse capacity-based storage](capacity-storage.md) report.

### Do I get notified through email when my organization is over capacity?

Yes, tenant admins are notified through email on a weekly basis if their organization is at or over capacity. 

Tenant admins are also notified when their organization reaches 15% of available capacity, and when their organization reaches 5% of available capacity.

### What are tables ending in “- Analytics” in my capacity report?

Tables ending in "– Analytics" are tables used by one or more Insights applications, for example Sales Insights, Customer Service Hub, or Field Service. 

Resource scheduling and optimization analytics dashboards generate predictive insights and require data that is synched from Dataverse tables. 

For more documentation covering the installed Insights applications and the "– Analytics" tables used to create insights and dashboards learn more in:

- [Sales Insights ](/dynamics365/ai/sales/help-hub#get-started)
- [Field Service and resource scheduling optimization (RSO)](/dynamics365/field-service/scheduling-analytics-reports)
- [Customer Service Hub](/dynamics365/customer-service/customer-service-analytics-insights-csh) 
- [Field Service](/dynamics365/field-service/reports) 

### Related information

[Dataverse storage capacity](capacity-storage.md) <br />
[What's new in storage](whats-new-storage.md) <br />
[Free up storage space](free-storage-space.md) <br />
[Capacity add-ons](capacity-add-on.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
