---
title: Dataverse capacity-based storage details  
description: Learn about the Microsoft Dataverse capacity-based storage model.
ms.date: 05/29/2025
ms.topic: concept-article
author: marianaraujo 
ms.subservice: admin
ms.author: maaraujo
ms.custom: NewPPAC
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- olegovanesyan
- ianceicys-msft 
- amiyapatr-zz
- pnghub
- marianaraujo
ms.contributors:
- ceian
- ampatra
- maraujo
---

# Dataverse capacity-based storage details

If you purchased storage in or after April 2019, or you have a mix of storage purchases made before and after April 2019, you see your storage capacity entitlement and usage by database, file, and log as it appears in the Microsoft Power Platform admin center today. 

Data volume continues to grow exponentially, as businesses advance their digital transformation journey and bring data together across their organization. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today's organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs.

We're rolling out this feature now so check back if your user experience varies from the following content.

> [!NOTE]
> For licensing information, go to the [Power Apps and Power Automate licensing guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).
>
> If you purchased your Dynamics 365 subscription through a Microsoft partner, contact them to manage storage capacity. The following steps don't apply to partner-based subscriptions.

## Licenses for Microsoft Dataverse capacity-based storage model

The following licenses provide capacity by using the new storage model. If you have any of these licenses, you see the new model report: 

- Dataverse for Apps Database Capacity 
- Dataverse for Apps File Capacity 
- Dataverse for Apps Log Capacity 

To check whether you have any of these licenses, sign in to the Microsoft 365 admin center and then go to **Billing** > **Licenses**.

> [!NOTE]
> If you have a mix of [legacy model licenses](legacy-capacity-storage.md#licenses-for-the-legacy-storage-model) and new model licenses, a new model report is displayed.
> 
> If you have none of the [legacy model licenses](legacy-capacity-storage.md#licenses-for-the-legacy-storage-model) nor the new model licenses, a new model report is displayed.

## Verifying your Microsoft Dataverse capacity-based storage model

1. Sign in to the Power Platform admin center and then select an environment. 

1. Select **Resources** > **Capacity** > **Summary** tab.

1. View the data on the **Summary** page.

   For the **Summary** page to display, the user needs to have one of the following roles: 
    - Tenant administrator
    - Power Platform administrator
    - Dynamics 365 administrator 

    Alternatively, a user with any of the above-mentioned roles can grant permissions to the environment administrator to view the **Capacity summary** tab within the **Tenant setting** page. 

    The new licensing storage model looks like the following image. 

    :::image type="content" source="media/capacity-new-license-model.png" alt-text="Screenshot of the new licensing storage model.":::

## Capacity page details

### Summary tab

This page provides a tenant-level view of where your organization is using storage capacity.

To view the **Summary** page, select **Resources** > **Capacity** > **Summary** tab.

:::image type="content" source="media/storage-data-capacity-page-review.png" alt-text="Screenshot of the Capacity page Summary tab.":::

All tables of Dataverse, including system tables, are included in the storage capacity reports.

|Number  |Description |
|---------|---------|
|(1)   |**Storage capacity usage**  <ul><li>**File and database**: The following tables store data in file and database storage: <ul><li>Attachment</li><li>AnnotationBase</li><li>Any custom or out-of-the-box table that has columns of datatype file or image (full size)</li><li>Any table that is used by one or more installed Insights applications and [ends in *- Analytics*](#what-are-tables-ending-in---analytics-in-my-capacity-report) </li> </ul></li><ul><li>WebResourceBase</li></ul><ul><li>RibbonClientMetadataBase</li></ul><li>**Log**: The following tables are used: <ul><li>AuditBase</li><li>PlugInTraceLogBase</li><li>Elastic tables</li></ul><li>**Database only**: All other tables are counted for your database</li></ul>  |
|(2)    |**Storage capacity, by source** <ul><li>**Org (tenant) default**: The default capacity given at the time of sign-up </li><li>**User licenses**: More capacity added for every user license purchased</li><li>**Additional storage**: Any extra storage you bought </li><li>**Total**: Total storage available </li><li>**View self-service sources**: Learn more at [View self-service license amounts and storage capacity](view-self-service-capacity.md)</li></ul>      |
|(3)     |**Top storage usage, by environment**: The environments that consume the most capacity        |
|(4)  |  **Add-ons**:  Your organization's add-on usage details. Learn more at [View capacity add-ons in Power Platform admin center](capacity-add-on.md#view-capacity-add-ons-in-power-platform-admin-center). |

The actual files such as .pdf (or any other file attachment type) are stored in file storage. However, certain attributes needed to access the files are stored in the database as well. 

### Dataverse tab

This page provides similar information as the **Summary** tab, but with an environment-level view of where your organization is using capacity.

> [!NOTE]
> There's no technical limit on the size of a Dataverse environment. Limits mentioned on this page are entitlement limits based on product licenses purchased.

To view the **Storage capacity** page, select **Resources** > **Capacity** > **Dataverse** tab. 

Note the following features:

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |
|Details  | Go to the next section for using the **Details** button (![Storage data details button.](media/storage-data-details-button.png "Storage data details button")) to view environment capacity analytics.   |
| Default environment tip | The calculated storage usage in this view only displays what is **above** the default environment’s included capacity. Tool tips indicate how to view actual usage in the **Details** section. |

:::image type="content" source="media/storage-data-per-environment2.png" alt-text="Screenshot of storage data per environment details button.":::

> [!NOTE]
> - The following environments don't count against capacity and are shown as 0 GB:
>   - Microsoft Teams
>   - Trial
>   - Preview
>   - Support
>   - Developer
> - The default environment has the following included storage capacity: 3 GB Dataverse database capacity, 3 GB Dataverse file capacity, and 1 GB Dataverse log capacity.
> - You can select an environment that's showing 0 GB and then go to its environment capacity analytics page to see the actual consumption.
> - For the default environment, the list view shows the amount of capacity consumed beyond the included quota. Select the **Details** button (![Storage data details button.](media/storage-data-details-button.png "Storage data details button")) to see usage.
> - The capacity check&mdash;conducted before creating new environments&mdash;excludes the default environment's included storage capacity when calculating whether you have sufficient capacity to create a new environment.


#### Environment storage capacity details

Select the **Details** button (![Storage data details button.](media/storage-data-details-button.png "Storage data details button")) on the **Summary** tab view to see  an environment-level detailed view of where your organization is using capacity, in addition to the three types of capacity consumption. 

:::image type="content" source="media/storage-data-capacity-details.png" alt-text="Screenshot of an environment's capacity analytics":::

The following details are provided:

- Actual database usage
- Top database tables and their growth over time
- Actual file usage
- Top files tables and their growth over time
- Actual log usage
- Top tables and their growth over time

> [!NOTE]
> Refer to the [storage capacity reports](/power-apps/maker/data-platform/data-retention-overview#storage-capacity-reports) under [Dataverse long term retention](/power-apps/maker/data-platform/data-retention-overview) to understand details on storage capacity with the retention feature.

### Microsoft Teams tab

This page provides a view of the capacity storage used by your Microsoft Teams environments. Teams environment capacity usage doesn't count towards your organization's Dataverse usage.

To view this page, select **Resources** > **Capacity** > **Microsoft Teams** tab. 

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |

### Add-ons tab

Use this page to view your organization's add-on usage details and to assign add-ons to environments. Learn more at [View capacity add-ons in Power Platform admin center](capacity-add-on.md#view-capacity-add-ons-in-power-platform-admin-center).

> [!NOTE]
> This tab only appears if you have add-ons included in your tenant.

### Trial tab

This page provides a view of the capacity storage used by your trial environments. Trial environment capacity usage doesn't count towards your organization's Dataverse usage.

To view this page, select **Resources** > **Capacity** > **Trials** tab. 

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |


## Dataverse page in Licenses (preview)

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and might have restricted functionality. These features are subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520), and are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available in your region yet.

### Track tenant usage

You can track and manage Dataverse capacity in the **Licenses** section of Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Billing** > **Licenses** > **Dataverse**.

#### Usage per storage type

In the **Usage per storage type** tile, you can view the consumption of your database, log, and file storage. This section displays your prepaid entitled capacity along with the corresponding usage. Additionally, it indicates if any part of your Dataverse usage is billed under a pay-as-you-go plan.

#### Top environment consuming storage 

The **Top environment consuming storage** tile displays the environments using the most capacity. It also indicates whether any of these top-consuming environments are in overage and provides a breakdown of prepaid versus pay-as-you-go usage. You can select **Database**, **File**, or **Log** to view the corresponding consumption details.

#### Dataverse environment usage  

In the **Top environments consuming storage** tile, select **See all environments** to view capacity consumption across all your Dataverse environments. The following details are provided:

- Name of the environment
- Overage status if capacity is allocated to the environment
- Whether capacity is preallocated to the environment
- Environment type
- Managed Environment status
- Pay-as-you-go plan linkage status
- Ability to draw capacity from available tenant pool 
- Database, file, and log consumption

### Track environment usage

1. In the **Dataverse** page, select **Environment** and choose an environment from the list. 
1. Alternatively in the **Top environment consuming storage** tile, select **See all environments** and select an environment name.

#### Usage per storage type

In the **Usage per storage type** tile, you can view the consumption of your database, log, and file storage. This section displays your prepaid allocated capacity, if any, along with the corresponding usage. Additionally, it indicates if any part of your Dataverse usage is billed under a pay-as-you-go plan.

#### Consumption per table

In the **Consumption per table** section, you can view the amount of storage consumed by each Dataverse table. To see table consumption for a specific storage type, select **Database**, **File**, or **Log** in the **Usage per storage type tile**. Select the  table name for the consumption trend, with the option to track daily usage trends for up to the past three months. 

### Allocate capacity for an environment 

In the **Dataverse** tab, you can allocate capacity to a specific environment. Once capacity is allocated, you can view the status of your environments to determine whether they are within capacity or in an overage state.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. On the navigation pane, select **Billing** > **Licenses**.
1. On the **Summary** page, select the **Dataverse** tab and then select **Manage Capacity**. The **Manage capacity** pane is displayed on the right side of the page.
1. Select the environment for which you want to allocate capacity.
1. In the **Manage capacity** pane, view the currently allocated and consumed capacity for the environment.
1. Allocate capacity by entering the desired value in the **Database**, **File**, and **Log** fields. Ensure the capacity values are positive integers and don't exceed the available capacity displayed at the top of the panel.
1. Opt in to receive daily email alerts sent to tenant and environment admins when the consumed capacity (database, log, or file) reaches a set percentage of the allocated capacity.
1. Select **Save** to apply the changes.

### Managing capacity overage

When an environment's capacity consumption exceeds the preallocated capacity, you have two options to manage the overage:

1. In the **Manage capacity** pane you can utilize capacity available from the tenant's overall capacity pool.
1. Alternatively, in the **Manage capacity** pane you can link the environment to a pay-as-you-go billing plan, where any overage is charged to the associated Azure subscription. 

## Changes for exceeding storage capacity entitlements

We're making changes for what happens when an organization's storage capacity is close to or exceeds the capacity entitled or purchased via add-ons.

Notifications for capacity approaching storage limits are triggered when any of the three storage capacities (database, file, or log) have less than 15% of space available. Another warning notification that admin operations could be impacted is sent when any of the three storage capacities have less than 5% of space available. The final tier of notification triggers when the tenant is "in overage" (storage usage exceeds capacity entitlements), which alerts the admin that the following operations are no longer available until the overage is resolved:

- Create a new environment (requires minimum 1-GB capacity available)
- Copy an environment
- Restore an environment
- Convert a trial environment to paid (requires minimum 1-GB capacity available)
- Recover an environment (requires minimum 1-GB capacity available)
- Add Dataverse database to an environment

> [!NOTE]
> The storage driven capacity model calculation of these thresholds also considers the overflow usage allowed in the storage driven model. For example, extra database capacity can be used to cover log and file overuse and extra log capacity can be used to cover file overuse. Therefore, overflow usage is taken into consideration to reduce the number of emails a tenant admin receives.

These notifications are sent out to tenant admins, Power Platform admins, and Dynamics 365 admins on a weekly basis. At this time, there's no option for a customer to opt out of these notifications or delegate these notifications to someone else. All admin types listed earlier automatically receive these notifications.

Additionally, there's a notification banner in the Power Platform admin center when a tenant exceeds storage capacity. 

The [Universal License Terms for Online Services](https://www.microsoft.com/licensing/terms/product/ForOnlineServices/EAEAS) apply to your organization’s use of the online service, including consumption that exceeds the online service’s documented entitlements or usage limits.

Your organization must have the right licenses for the storage you use: 

- If you use more than your documented entitlements or usage limits, you must buy more licenses.
- If your storage consumption exceeds the documented entitlements or usage limits, we might suspend use of the online service. Microsoft provides reasonable notice before suspending your online service.

## Example storage capacity scenarios, overage enforcement

You should be within limits for your entitled capacity for database, log, and file. If you used more capacity than you're entitled to, you should buy more capacity or free up capacity. However, if you have overused database, log, or file capacity, review the following scenarios to understand when enforcement is applied.

### Scenario 1: Database storage is over capacity, overage enforcement

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100 GB        | 110 GB        |
|**Log**     |  10 GB       | 5 GB        |
|**File**     | 400 GB        | 200 GB        |

This tenant is 10 GB over in database usage. Despite having 200-GB excess file storage, the tenant is considered to be in deficit. This tenant should free up storage or purchase more capacity.

### Scenario 2: Log storage is over capacity, overage enforcement

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100 GB        | 95 GB        |
|**Log**     |  10 GB       | 20 GB        |
|**File**     | 400 GB        | 200 GB        |

This tenant is 10 GB over in log usage and has only 5 GB available in database capacity. Therefore, the tenant is in deficit and should free up storage or purchase more capacity.

### Scenario 3: File storage is over capacity, overage enforcement

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100 GB        | 20 GB        |
|**Log**     |  10 GB       | 5 GB        |
|**File**     | 200 GB        | 290 GB        |

This tenant is 90 GB over in file usage. Despite having 85 GB available (80-GB database + 5-GB log) in storage capacity, the tenant is considered to be in deficit. This tenant should free up storage or purchase more capacity.

## Example storage capacity scenario, no overage

### Scenario 4: Log storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100 GB        | 80 GB        |
|**Log**     |  10 GB       | 20 GB        |
|**File**     | 400 GB        | 200 GB        |

This tenant is 10 GB over in log usage but has 20 GB available in database capacity. Therefore, the tenant isn't in deficit. File storage excess entitlement can't be used to compensate deficits in log or database storage.

## Actions to take for a storage capacity deficit

You can always [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more capacity to be compliant with storage usage. To learn more about capacity add-ons, go to the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). You can work through your organization's standard procurement process to purchase [capacity add-ons](capacity-add-on.md).

## FAQ

### Why is my storage consumption decreasing in database and growing in file?

We're constantly optimizing Dataverse for ease of use, performance, and efficiency. Part of this ongoing effort is to move data to the best possible storage with the lowest cost for customers. File-type data such as “Annotation” and “Attachment” is moving from database to file storage. This leads to decreased usage of database capacity and an increase in file capacity.

### Why could my database table size decrease while my table and file data sizes remain the same?

As part of moving file-type data such as “Annotation” and “Attachment” out from database and into file storage, we periodically reclaim the freed database space. This leads to decreased usage of database capacity, while the table and file data size computations remain unchanged.


### Do indexes affect database storage usage?

Database storage includes both the database rows and index files used to improve search performance. Indexes are created and optimized for peak performance and are updated frequently by the system by analyzing data use patterns. No user action is needed to optimize the indexes, as all Dataverse stores have tuning enabled by default. A fluctuation in database storage can be represented by an increased or decreased number of indexes on the database. Dataverse is continually being tuned to increase efficiency and incorporate new technologies that improve user experience and optimize storage capacity.  Common causes for an increase in index size are:

- An organization making use of new functionality (this can be custom, out-of-the-box, or part of an update or solution installation).
- Data volume or complexity changes.
- A change in usage patterns that indicate new indexes are in need of reevaluation.

If Quick Find lookups are configured for data frequently used, this also creates more indexes in the database. Admin-configured Quick Find values can increase the size of the indexes based on:

- The number of columns chosen and the data type of those columns.
- The volume of rows for the tables and columns.
- The complexity of the database structure.

Because custom Quick Find lookups are created by an admin in the org, these can be user-controlled. Admins can reduce some of the storage used by these custom indexes by doing the following: 

- Removing unneeded columns or tables.
- Eliminating multiline text columns from inclusion.

### What is the RelevanceSearch table and how can I reduce it?

The **RelevanceSearch** table is the cumulative storage used by the global search. It includes the data from all searchable, retrievable, and filterable fields of the tables you indexed for your environment. Learn more in [Configure Dataverse search to improve search results and performance](configure-relevance-search-organization.md). You can reduce the table size by removing find columns, view columns, and filter conditions for one or more tables.

### I just bought the new capacity-based licenses. How do I provision an environment by using this model?

You can provision environments through the Power Platform admin center. Learn more in [Create and manage environments in the Power Platform admin center](create-environment.md).

### I'm a new customer and I recently purchased the new offers. My usage of database/log/file is showing red. What should I do?

Consider buying more capacity by using the [Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544). Alternatively, you can [free up storage](free-storage-space.md).

### I'm an existing customer, and my renewal is coming up. Will I be affected?

Customers who renew existing subscriptions can choose to continue to transact by using the existing offers for a certain period of time. Contact your Microsoft partner or Microsoft sales team for details.

### I'm a Power Apps/Power Automate customer and have environments with and without database. Will they consume storage capacity?

Yes. All environments consume 1 GB, regardless of whether they have an associated database.

### Do I get notified through email when my organization is over capacity?

Yes, tenant admins are notified through email on a weekly basis if their organization is at or over capacity. Additionally, tenant admins are notified when their organization reaches 15% of available capacity, and when their organization reaches 5% of available capacity.

### Why am I no longer getting storage notifications?

Capacity email notifications are sent weekly to tenant admins based on three different thresholds. If you're no longer getting storage notifications, check your admin role. It could also be the case that your organization is over the three predefined capacity thresholds. In that case, you don't receive an email notification.

### I'm an existing customer. Should I expect my file and log usage to change?

Log and files data usage isn't expected to be exactly the same size as when the same data is stored by using database, due to different storage and indexing technologies. The current set of out-of-the-box tables stored in file and log storage might change in the future.

### The capacity report shows the entitlement breakdown per license, but I have more licenses in my tenant and not all of them are listed in the breakdown. Why?

Not all licenses give per-user entitlement. For example, the Team Member license doesn't give any per-user database, file, or log entitlement. So in this case, the license isn't listed in the breakdown.

### Which environments are counted in the capacity report?

Default, production, and sandbox environments are counted for consumption. Trial, preview, support, and developer environments aren't counted.

### What are tables ending in “- analytics" in my capacity report?

Tables ending in “– Analytics” are tables used by one or more Insights applications, for example Sales Insights, Customer Service Hub, or Field Service and resource scheduling and optimization analytics dashboard to generate predictive insights or analytics dashboards. The data is synched from Dataverse tables. Go to the section **More information** for documentation covering the installed Insights applications and the tables used to create insights and dashboards.

### Why can I no longer see the Summary tab in my capacity report? 

This is due to a change that occurred in April 2023, after which only users with the tenant admin, Power Platform admin, or Dynamics 365 admin roles can see the **Summary** tab in the capacity report. Users, such as environment admins, no longer see this tab and are redirected to the **Dataverse** tab when accessing the report. If you have a user that requires access to the **Summary** tab, assign one of the required roles. 

**More information:**

- [Sales Insights ](/dynamics365/ai/sales/help-hub#get-started)
- [Field Service and resource scheduling optimization (RSO)](/dynamics365/field-service/scheduling-analytics-reports)
- [Customer Service Insights](/dynamics365/customer-service/customer-service-analytics-insights-csh) 
- [Field Service](/dynamics365/field-service/reports)

### Who can allocate capacity?

Users with global admin, Power Platform admin, and Dynamics 365 admin roles can allocate Dataverse capacity.

### Does this impact my total available capacity in my tenant?

There's no impact on the overall capacity available at the tenant level. Admins can optionally preallocate capacity from the tenant pool to an environment. Preallocated capacity is reduced from the tenant level's total available capacity for use by other environments.

### What happens if capacity consumption goes beyond the allocated capacity?

Currently, only _soft enforcement_ through email notification is turned on. Admins (Power Platform admins and environment admins) start receiving notifications when capacity usage exceeds 85% of the allocated capacity.

### What types of Dataverse capacity can be allocated?

Database, file, and log capacity can be allocated.

### Do I need to allocate capacity to every environment like other supported currencies?

No, admins can select specific environments to allocate capacity.

### Related information

[Add Microsoft Dataverse storage capacity](add-storage.md) <br />
[Capacity add-ons](capacity-add-on.md)<br />
[Automatic tuning in Azure SQL Database](/azure/sql-database/sql-database-automatic-tuning) <br />
[What's new in storage](whats-new-storage.md) <br />
[Free up storage space](free-storage-space.md) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
