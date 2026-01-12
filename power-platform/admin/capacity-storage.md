---
title: Dataverse capacity-based storage details  
description: Learn about the Microsoft Dataverse capacity-based storage model.
ms.date: 01/12/2026
ms.topic: concept-article
author: marianaraujo 
ms.subservice: admin
ms.author: ashi
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
- olegovanesyan
- ianceicys-msft 
- amiyapatr-zz
- pnghub
- marianaraujo
- EllenWehrle
ms.contributors:
- ceian
- ampatra
- maraujo
- swatim
ms.custom:
- NewPPAC
- sfi-ga-nochange
---

# Dataverse capacity-based storage details

If you purchased storage after April 2019, or if you have a mix of storage purchases made before and after April 2019, you see your storage capacity entitlement and usage by database, file, and log as it appears in the Microsoft Power Platform admin center today.

Data volume continues to grow exponentially as businesses advance their digital transformation journey and bring data together across their organization. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today's organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs.

> [!NOTE]
> For licensing information, see the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).
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

To view the Capacity add-ons summary page, you need one of the following roles:

- Tenant administrator
- Power Platform administrator
- Dynamics 365 administrator
Alternatively, a user with any of the preceding roles can grant permissions to the environment administrator to view the **Capacity summary** tab within the **Tenant setting** page.

Follow these steps to verify you have the Microsoft Dataverse capacity-based storage model:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Licensing**.
1. In the Licensing pane, select **Capacity add-ons** to go to the Capacity add-ons summary page where you can see your tenant's storage, add-ons, and Microsoft Power Platform requests.

Learn more in [Dataverse capacity-based storage overview](whats-new-storage.md).

## Capacity page details

The tabs **Summary**, **Dataverse**, **Microsoft Teams**, **Add-ons**, and **Trial** are available on the Capacity add-ons page.

### Summary tab

On the Capacity page, **Summary** is the default view where you see a tenant-level view of where your organization is using storage capacity. You can view:

- Storage capacity usage
- Storage capacity, by source
- Top storage usage, by environment

All Dataverse tables, including system tables, are included in the storage capacity reports. Files such as .pdf (or any other file attachment type) are stored in file storage. However, the database stores certain attributes needed to access the files.

#### Storage capacity usage

In the *storage capacity usage* section, you can see:

- **File and database**: The following tables store data in file and database storage:

  - Attachment
  - AnnotationBase
  - Any custom or out-of-the-box table that has columns of datatype file or image (full size)
  - Any table that is used by one or more install Insights applications and [ends in - *Analytics*](capacity-storage.md)
  - WebResourceBase
  - RibbonClientMetadataBase

- **Log**: The following tables are used:

  - AuditBase
  - PlugInTraceLogBase
  - Elastic tables

- **Database only**: All other tables count for your database

#### Storage capacity, by source

In the *storage capacity, by source* section, you can see:

- **Org (tenant) default**: The default capacity given at the time of sign up
- **User licenses**: More capacity added for every user license purchased
- **Additional storage**: Any extra storage you bought
- **Total**: Total storage available
- **View self-service sources**: Learn more at [View self-service license amounts and storage capacity](view-self-service-capacity.md)

#### Top storage usage, by environment

In the *top storage usage, by environment* section, you can see the environments that consume the most capacity.

#### Add-ons

In the *add-ons* section, you can see the details of add-ons that your organization purchased. Learn more at [View capacity add-ons in Power Platform admin center](capacity-add-on.md).
In the *add-ons* section, you can also select **Manage** to assign add-ons to environments or **Download reports** to view a downloaded report. Add-on reports expire after 30 days.

### Dataverse tab

On the Capacity page, select **Dataverse**. This page provides similar information as the summary tab, but with an environment-level view of where your organization is using capacity.

> [!NOTE]
> There's no technical limit on the size of a Dataverse environment. The limits mentioned on this page are entitlement limits based on product licenses you purchase.

This table highlights some of the features you can see on the Dataverse page.

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |
|Details  | Select the **Details** button (:::image type="icon" source="media/storage-data-details-button.png" border="false":::) to see  an environment-level detailed view of where your organization is using capacity, in addition to the three types of capacity consumption.   |
| Default environment tip | The calculated storage usage in this view only displays what is **above** the default environment's included capacity. Tool tips indicate how to view actual usage in the **Details** section. |

> [!NOTE]
>
> - The following environments don't count against capacity and show as 0 GB:
>   - Microsoft Teams
>   - Trial
>   - Preview
>   - Support
>   - Developer
> - The default environment has the following included storage capacity: 3 GB Dataverse database capacity, 3 GB Dataverse file capacity, and 1 GB Dataverse log capacity.
> - You can select an environment that's showing 0 GB and then go to its environment capacity analytics page to see the actual consumption.
> - For the default environment, the list view shows the amount of capacity consumed beyond the included quota. Select the **Details** button (:::image type="icon" source="media/storage-data-details-button.png" border="false":::) to see usage.
> - The capacity check - conducted before creating new environments - excludes the default environment's included storage capacity when calculating whether you have sufficient capacity to create a new environment.

#### Environment storage capacity details

Select the **Details** button (:::image type="icon" source="media/storage-data-details-button.png" border="false":::) associated with the environment you want to see more information about.

:::image type="content" source="media/environment-capacity-details.png" alt-text="Screenshot of the capacity storage data details view for an environment that includes database usage, file usage, and log usage.":::
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

On the Capacity page, select **Microsoft Teams**. This tab shows the capacity storage used by your Microsoft Teams environments. Teams environment capacity usage doesn't count towards your organization's Dataverse usage.

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |

### Add-ons tab

On the Capacity page, select **Add-ons**. This tab shows your organization's add-on usage details and lets you assign add-ons to environments. For more information, see [View capacity add-ons in Power Platform admin center](capacity-add-on.md#view-capacity-add-ons-in-power-platform-admin-center).

> [!NOTE]
> This tab only appears if your tenant includes add-ons.

### Trial tab

On the Capacity page, select **Trial**. This tab shows the capacity storage used by your trial environments. Trial environment capacity usage doesn't count towards your organization's Dataverse usage.

|Feature  |Description  |
|---------|---------|
|Download     | Select **Download** above the list of environments to download an Excel .CSV file with high-level storage information for each environment that the signed-in admin has permission to see in the Power Platform admin center.        |
|Search     | Use **Search** to search by the environment name and the environment type.         |

## Dataverse page in Licenses (preview)

> [!IMPORTANT]
>
> - This is a preview feature.
> - Don't use preview features in production environments. Preview features might have restricted functionality. They're subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520). Microsoft makes preview features available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available in your region yet.

### Track tenant usage

You can track and manage Dataverse capacity in the **Licenses** section of Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. On the Licensing pane, select **Dataverse** under **Products**.

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

1. On the **Dataverse** page, select **Environment** and choose an environment from the list.
1. Alternatively, in the **Top environment consuming storage** tile, select **See all environments** and select an environment name.

#### Usage per storage type tile

In the **Usage per storage type** tile, you can view the consumption of your database, log, and file storage. This section displays your prepaid allocated capacity, if any, along with the corresponding usage. Additionally, it indicates if any part of your Dataverse usage is billed under a pay-as-you-go plan.

#### Consumption per table

In the **Consumption per table** section, you can view the amount of storage consumed by each Dataverse table. To see table consumption for a specific storage type, select **Database**, **File**, or **Log** in the **Usage per storage type** tile. Select the table name for the consumption trend, with the option to track daily usage trends, for up to the past three months.

### Dataverse search consumption and reporting

In addition to database and file storage, Dataverse search includes the indexes that power different experiences. These indexes support search and generative AI across structured or tabular data and unstructured data stored in Dataverse, such as files.

Storage consumed by Dataverse search is reported at the environment-level as a table called **DataverseSearch**. It was previously named **RelevanceSearch**.

#### Dataverse search can also be monitored at the Dataverse Environment report in the Power Platform admin center

The Dataverse Environment report is located at **Licensing** > **Dataverse** > **Environments** tab (consumption per table reporting).

#### How much does the indexed Dataverse search data cost?

All Dataverse indexes are reported at the Dataverse database capacity rate. Turning on Dataverse search doesn't turn on any other experience automatically. For more information, see [What is Dataverse search?](/power-apps/user/relevance-search-benefits)

### Allocate capacity for an environment

When you select the **Dataverse** tab, you can allocate capacity to a specific environment. After you allocate capacity, you can view the status of your environments to see whether they're within capacity or in an overage state.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. On the navigation pane, select **Licensing**.
1. On the **Licensing** pane, select **Dataverse** in the **Products** section.
1. On the **Summary** page, select **Manage capacity**.
1. Select the environment for which you want to allocate capacity.
1. In the **Manage capacity** panel, view the currently allocated and consumed capacity for the environment.
1. Allocate capacity by entering the desired value in the **Database**, **File**, and **Log** fields. Make sure the capacity values are positive integers and don't exceed the available capacity displayed at the top of the panel.
1. Opt in to receive daily email alerts sent to tenant and environment admins when the consumed capacity (database, log, or file) reaches a set percentage of the allocated capacity.
1. Select **Save** to apply the changes.

### Manage capacity overage

When an environment's capacity consumption exceeds the preallocated capacity, you have two options to manage the overage:

1. In the **Manage capacity** pane, use capacity available from the tenant's overall capacity pool.
1. In the **Manage capacity** pane, link the environment to a pay-as-you-go billing plan, where any overage is charged to the associated Azure subscription.

## Changes for exceeding storage capacity entitlements

Microsoft is making changes for what happens when an organization's storage capacity is close to or exceeds the capacity entitled or purchased through add-ons.

Notifications for capacity approaching storage limits are triggered when any of the three storage capacities (database, file, or log) have less than 15% of space available. Another warning notification that admin operations could be impacted is sent when any of the three storage capacities have less than 5% of space available. The final tier of notification triggers when the tenant is "in overage" (storage usage exceeds capacity entitlements), which alerts the admin that the following operations aren't available until the overage is resolved:

- Create a new environment (requires minimum 1-GB capacity available)
- Copy an environment
- Restore an environment
- Convert a trial environment to paid (requires minimum 1-GB capacity available)
- Recover an environment (requires minimum 1-GB capacity available)
- Add Dataverse database to an environment

> [!NOTE]
> The storage driven capacity model calculation of these thresholds also considers the overflow usage allowed in the storage driven model. For example, extra database capacity can be used to cover log and file overuse and extra log capacity can be used to cover file overuse. Therefore, overflow usage is taken into consideration to reduce the number of emails a tenant admin receives.

Tenant admins, Power Platform admins, and Dynamics 365 admins receive these notifications on a weekly basis. At this time, there's no option for a customer to opt out of these notifications or delegate these notifications to someone else. All admin types listed earlier automatically receive these notifications.

Additionally, there's a notification banner in the Power Platform admin center when a tenant exceeds storage capacity.

The [Universal License Terms for Online Services](https://www.microsoft.com/licensing/terms/product/ForOnlineServices/EAEAS) apply to your organization's use of the online service, including consumption that exceeds the online service's documented entitlements or usage limits.

Your organization must have the right licenses for the storage you use:

- If you use more than your documented entitlements or usage limits, you must buy more licenses.
- If your storage consumption exceeds the documented entitlements or usage limits, Microsoft might suspend use of the online service. Microsoft provides reasonable notice before suspending your online service.

## Example storage capacity scenarios and overage enforcement

Stay within the limits for your entitled capacity for database, log, and file storage. If you use more capacity than you're entitled to, buy more capacity or free up some space. However, if you overuse database, log, or file capacity, review the following scenarios to understand when enforcement applies.

### Scenario 1: Database storage is over capacity, overage enforcement

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100 GB        | 110 GB        |
|**Log**     |  10 GB       | 5 GB        |
|**File**     | 400 GB        | 200 GB        |

This tenant uses 10 GB more than the database capacity. Even though the tenant has 200 GB of extra file storage, the tenant is in deficit. This tenant should free up storage or purchase more capacity.

### Scenario 2: Log storage is over capacity, overage enforcement

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100 GB        | 95 GB        |
|**Log**     |  10 GB       | 20 GB        |
|**File**     | 400 GB        | 200 GB        |

This tenant uses 10 GB more than the log capacity and has only 5 GB available in database capacity. Therefore, the tenant is in deficit and should free up storage or purchase more capacity.

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

You can always [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more capacity to be compliant with storage usage. To learn more about capacity add-ons, go to the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the ["Add-ons" section of the Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

</br>You can work through your organization's standard procurement process to purchase [capacity add-ons](capacity-add-on.md).

## Frequently asked questions (FAQ)

### Why does my storage consumption decrease in the database and grow in the file storage?

Microsoft constantly optimizes Dataverse for ease of use, performance, and efficiency. Part of this ongoing effort is moving data to the best possible storage with the lowest cost for customers. File-type data such as "Annotation" and "Attachment" is moving from database to file storage. This change leads to decreased usage of database capacity and an increase in file capacity.

### Why could my database table size decrease while my table and file data sizes remain the same?

As part of moving file-type data such as "Annotation" and "Attachment" out from database and into file storage, Microsoft periodically reclaims the freed database space. This change leads to decreased usage of database capacity, while the table and file data size computations remain unchanged.

### Do indexes affect database storage usage?

Database storage includes both the database rows and index files used to improve search performance. Indexes are created and optimized for peak performance. The system frequently updates them by analyzing data use patterns. No user action is needed to optimize the indexes, as all Dataverse stores have tuning enabled by default. A fluctuation in database storage can be represented by an increased or decreased number of indexes. Dataverse is continually being tuned to increase efficiency and incorporate new technologies that improve user experience and optimize storage capacity. Common causes for an increase in index size are:

- An organization makes use of new functionality. This functionality can be custom, out-of-the-box, or part of an update or solution installation.
- Data volume or complexity changes.
- A change in usage patterns that indicate new indexes need reevaluation.

If you configure Quick Find lookups for data that's frequently used, this configuration also creates more indexes in the database. Admin-configured Quick Find values can increase the size of the indexes based on:

- The number of columns chosen and the data type of those columns.
- The volume of rows for the tables and columns.
- The complexity of the database structure.

Because an admin creates custom Quick Find lookups in the org, these indexes can be user-controlled. Admins can reduce some of the storage used by these custom indexes by taking the following action:

- Remove unneeded columns or tables.
- Eliminate multiline text columns from inclusion.

> [!NOTE]
> The Dataverse search indexed data is the data that improves the search quality for the global search and generative AI experiences, as well as interpreting the content by using natural language. This index data accrues to the overall Dataverse search consumption.

### What is the DataverseSearch table and how can I reduce it?

The **DataverseSearch** table (previously known as **RelevanceSearch**) stores data for the global search and generative AI experiences. It includes data from all searchable, retrievable, and filterable fields of the tables you indexed for your environment and Copilot semantic indexes.

For more information, see [Managing Dataverse search](configure-relevance-search-organization.md#managing-dataverse-search).

### Can I manage Dataverse search?

An admin can manage Dataverse search through the three states associated with this setting: On, Default, and Off. Learn more in [Configure Dataverse search for your environment](configure-relevance-search-organization.md).

> [!NOTE]
>
> - Dataverse search is set to **On** for any new production, sandbox, or default environment type. It's set to **Default** for any new other type of environment.
> - If you turn on Dataverse search as **On** or **Default**, no other setting is turned on.

### What actions can makers take?
Depending on the experience that leverages Dataverse search and its usage, the consumption size might increase. Learn more in [What is Dataverse search?](/power-apps/user/relevance-search-benefits).
  
> [!IMPORTANT]
> Don't turn off Dataverse search. Turning off Dataverse search directly impacts all dependent generative AI experiences in your different applications and all users using them.

### Turning off Dataverse search

When you turn off Dataverse search, the system deletes its indexed Dataverse data. All experiences that depend on this data, including search and generative AI conversational capabilities, become limited or unusable for all users.

Environment admins have 12 hours to turn the feature back on without losing indexed data.

**During 12 hours:**

- You can turn Dataverse search back on without losing indexed data.

**After 12 hours:**

- The system permanently deletes all indexed Dataverse data.
- Turning Dataverse search back on re-triggers the indexing of Dataverse data.

> [!IMPORTANT]
> Turning off Dataverse search deprovisions and removes the index within a period of 12 hours. If you turn on Dataverse search after it's been off for 12 hours, it provisions a fresh index that needs to go through a full sync. Syncing might take up to an hour or more for average size organizations, and a couple of days for large organizations. Be sure to consider these implications when you turn off Dataverse search temporarily.
> Index removal (or provisioning) can take multiple days to complete, depending on the amount of Dataverse search consumption. For example, an organization with 10 GB of indexed data might take one day to clean up all indexes, while an organization with 500 GB might take multiple days to see it reflected in Dataverse search reporting. Please wait a few days or a week before submitting a support ticket, to ensure a complete removal of Dataverse search indexed data.

### What happens if I turn off Dataverse search?

All experiences that use Dataverse search become limited. For more information, see [Frequently asked questions about Dataverse search](/power-apps/user/relevance-faq).

### Turning on Dataverse search again

- **Selecting On**:
    When you set Dataverse search to **On** after setting it to **Off**, the system immediately re-triggers all indexes across all enabled experiences for them to work accordingly, and Dataverse search costs resume.

- **Selecting Default**:
    When you set Dataverse search to **Default** after setting it to **Off**, the system only regenerates the indexes when triggered. Examples include when a Copilot Studio agent uses a file&mdash;such as a local file, OneDrive file, or SharePoint file or Dataverse table&mdash;or if a prompt is submitted to an agent or Copilot. When the indexes are triggered, Dataverse search costs resume.

> [!NOTE]
> You can't turn Dataverse search **On** or **Off** for different applications in the same environment. The status of the setting applies to all applications in the environment.

### I just bought the new capacity-based licenses. How do I provision an environment by using this model?

You can provision environments through the Power Platform admin center. Learn more in [Create and manage environments in the Power Platform admin center](create-environment.md).

### I'm a new customer and I recently purchased the new offers. My usage of database, log, or file is showing red. What should I do?

Consider buying more capacity by using the [Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544). Alternatively, you can [free up storage](free-storage-space.md).

### I'm an existing customer, and my renewal is coming up. Will I be affected?

Customers who renew existing subscriptions can choose to continue to transact by using the existing offers for a certain period of time. Contact your Microsoft partner or Microsoft sales team for details.

### I'm a Power Apps or Power Automate customer and have environments with and without database. Do they consume storage capacity?

Yes. All environments consume 1 GB, regardless of whether they have an associated database.

### Do I get notified through email when my organization is over capacity?

Yes, tenant admins receive email notifications on a weekly basis if their organization is at or over capacity. Additionally, tenant admins get notified when their organization reaches 15% of available capacity, and when their organization reaches 5% of available capacity.

### Why am I no longer getting storage notifications?

Capacity email notifications are sent weekly to tenant admins based on three different thresholds. If you're no longer getting storage notifications, check your admin role. It could also be the case that your organization is over the three predefined capacity thresholds. In that case, you don't receive an email notification.

### I'm an existing customer. Should I expect my file and log usage to change?

Log and files data usage isn't expected to be exactly the same size as when the same data is stored by using database, due to different storage and indexing technologies. The current set of out-of-the-box tables stored in file and log storage might change in the future.

### The capacity report shows the entitlement breakdown per license, but I have more licenses in my tenant and not all of them are listed in the breakdown. Why?

Not all licenses give per-user entitlement. For example, the Team Member license doesn't give any per-user database, file, or log entitlement. So in this case, the license isn't listed in the breakdown.

### Which environments are counted in the capacity report?

Default, production, and sandbox environments count for consumption. Trial, preview, support, and developer environments don't count.

### What are tables ending in "- analytics" in my capacity report?

Tables ending in "– Analytics" are tables used by one or more Insights applications, for example Sales Insights, Customer Service Hub, or Field Service and resource scheduling and optimization analytics dashboard to generate predictive insights or analytics dashboards. The data is synched from Dataverse tables. Go to the section **More information** for documentation covering the installed Insights applications and the tables used to create insights and dashboards.

### Why can't I see the Summary tab in my capacity report?

In April 2023, Microsoft changed the roles that can see the **Summary** tab in the capacity report. Now, only users with the tenant admin, Power Platform admin, or Dynamics 365 admin roles can see the **Summary** tab. Users with other roles, such as environment admins, no longer see this tab and are redirected to the **Dataverse** tab when accessing the report. If you need access to the **Summary** tab, ask your admin to assign one of the required roles.

**More information:**

- [Sales Insights](/dynamics365/ai/sales/help-hub#get-started)
- [Field Service and resource scheduling optimization (RSO)](/dynamics365/field-service/scheduling-analytics-reports)
- [Customer Service Insights](/dynamics365/customer-service/customer-service-analytics-insights-csh)
- [Field Service](/dynamics365/field-service/reports)

### Who can allocate capacity?

Users with global admin, Power Platform admin, and Dynamics 365 admin roles can allocate Dataverse capacity.

### Does this change affect the total available capacity in my tenant?

This change doesn't affect the overall capacity available at the tenant level. Admins can choose to preallocate capacity from the tenant pool to an environment. When they preallocate capacity, it reduces the tenant level's total available capacity for use by other environments.

### What happens if capacity consumption goes beyond the allocated capacity?

Currently, only *soft enforcement* through email notification is turned on. Admins (Power Platform admins and environment admins) start receiving notifications when capacity usage exceeds 85% of the allocated capacity.

### What types of Dataverse capacity can be allocated?

You can allocate database, file, and log capacity.

### Do I need to allocate capacity to every environment like other supported currencies?

No, admins can select specific environments to allocate capacity.

### Related information

[Add Microsoft Dataverse storage capacity](add-storage.md)
[Capacity add-ons](capacity-add-on.md)
[Automatic tuning in Azure SQL Database](/azure/sql-database/sql-database-automatic-tuning)
[What's new in storage](whats-new-storage.md)
[Free up storage space](free-storage-space.md) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
