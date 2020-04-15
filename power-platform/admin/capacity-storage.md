---
title: "New Common Data Service storage capacity  | MicrosoftDocs"
description: Introducing a new storage model for Common Data Service.
ms.date: 01/29/2020
ms.reviewer: ""
ms.service: "power-platform"
ms.topic: "quickstart"
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# New Common Data Service storage capacity 

If you purchased storage in or after April 2019, or you have a mix of before and after April 2019 storage purchases, you will see your storage capacity entitlement and usage by database, file, and log as it appears in the Power Platform admin center today. 

Data volume continues to grow exponentially, as businesses advance their digital transformation journey and bring data across their organization together. Modern business applications need to support new business scenarios, manage new data types, and help organizations with the increasing complexity of compliance mandates. To support the growing needs of today's organizations, data storage solutions need to evolve continuously and provide the right solution to support expanding business needs.

> [!NOTE]
> For licensing information, see the [Power Apps and Power Automate licensing guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).
>
> Common Data Service storage capacity is not available for Dynamics 365 US Government – GCC and GCC High, DOD, and Microsoft Dynamics 365 online services operated by 21Vianet.

## Licenses for new storage model

The following licenses provide capacity using the new storage model. If you have any of these licenses, you will see the new model report. 

- Common Data Service for Apps Database Capacity 
- Common Data Service for Apps File Capacity 
- Common Data Service for Apps Log Capacity 

To see if you have any of these licenses, sign in to the Microsoft 365 admin center, and then go to **Billing** > **Products & Services**.

> [!NOTE]
> If you have a mix of the [legacy model licenses](legacy-capacity-storage.md#licenses-for-legacy-storage-model) and the above new model licenses, you will see the new model report.
> 
> If you have a none of the [legacy model licenses](legacy-capacity-storage.md#licenses-for-legacy-storage-model) or the new model licenses, you will see the new model report.

## Verifying your new storage model

1. Sign in to the Power Platform admin center, and then select an environment. 

2. Select **Analytics** > **Capacity**.

3. View the data on the **Summary** page.

The new licensing storage model looks like this: 

> [!div class="mx-imgBorder"] 
> ![](media/capacity-new-license-model.png "New licensing storage model")


## Capacity page details

### Summary tab

This page provides a tenant-level view of where your organization is using storage capacity.

To view the **Summary** page, select **Analytics** > **Capacity** > **Summary** tab.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-page-review.png "Capacity hub walkthrough")

|  |Description |
|---------|---------|
|(1)   |**Current usage**  <ul><li>**File**: The following entities are used: <ul><li>Attachment</li><li>AnnotationBase</li><li>Any custom or out-of-box (OOB) entity that has fields of datatype file or image (full size)</li></ul></li><li>**Log**: The following entities are used: <ul><li>AuditBase</li><li>PlugInTraceLogBase</li></ul><li>**Database**: All other entities are counted for your database</li></ul> |
|(2)    |**Capacity types and sources** <ul><li>**Organization base**: The default capacity given at the time of sign-up </li><li>**User licenses**: Additional capacity added for every User License purchased</li><li>**Additional storage**: Any additional storage you bought </li><li>**Total**: Total storage available </li><li>**View self-service sources**: See [View self-service license amounts and storage capacity](view-self-service-capacity.md)</li></ul>      |
|(3)     |**Top capacity usage, by environment**: Top environments that consume the most capacity        |

### Storage capacity tab

This page provides similar information as the **Summary** tab but with an environment-level view of where your organization is using capacity.

To view the **Storage capacity** page, select **Analytics** > **Capacity** > **Storage capacity** tab. See the next section for using the **Details** button (![Details button](media/storage-data-details-button.png "Details button")) to see environment capacity analytics.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-per-environment2.png "Capacity hub walkthrough")


> [!NOTE]
> - The following environments do not count against capacity and show as 0GB:
>   - Trial 
>   - Preview
>   - Support
>   - Developer
> - Admins can select environments showing 0GB to go to the **Environment Analytics** page and see the actual consumption.

### Environment capacity analytics

This page provides an environment-level detailed view of where your organization is using capacity as well as the three capacity types consumption. 

To view environment-level capacity analytics:

1. Select **Analytics** > **Capacity** > **Storage capacity** tab.
2. Select an environment.
3. Select the **Details** button (![Details button](media/storage-data-details-button.png "Details button"))

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-details.png "Environment capacity analytics")

Details provided:

-    Actual database usage
-    Top database tables and their growth over time
-    Actual file usage
-    Top files tables and their growth over time
-    Actual log usage
-    Top tables and their growth over time

<!--
Select **Applied filters** at the the top of the page to filter data for different time spans. 

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-cds2-prod-env2.png "CDS 2.0 Production environment")
-->



## Changes for exceeding storage capacity entitlements

We are making changes for what happens when an organization's storage capacity usage is greater than the capacity entitled or purchased via add-ons.

For now, if you exceed your storage capacity, you will receive notifications alerting you to the over capacity usage. These notifications will occur as alerts in the Power Platform admin center. In the future, certain admin  operations will no longer be available when a tenant exceeds storage capacity entitlements. Check back for updated information. For more information, see [Legacy storage capacity](legacy-capacity-storage.md) or [Common Data Service storage capacity](capacity-storage.md). 

## Example storage capacity scenarios

You should be within limits for your entitled capacity, for database log, and file. If capacity is over utilized, you should buy more capacity or free up capacity. However, if you are over utilizing the database, log, or file capacity, review the below scenarios to understand when enforcement will be applied.


### Scenario 1: Database storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 110GB        |
|**Log**     |  10GB       | 5GB        |
|**File**     | 400GB        | 200GB        |

This tenant is 10 GB over in database usage. Despite 200GB excess file storage, the tenant is considered in deficit.

### Scenario 2: Log storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 95GB        |
|**Log**     |  10GB       | 20GB        |
|**File**     | 400GB        | 200GB        |

This tenant is 10GB over in log usage and has only 5GB available in database capacity. Therefore, there is a deficit.

### Scenario 3: Log storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 80GB        |
|**Log**     |  10GB       | 20GB        |
|**File**     | 400GB        | 200GB        |

This tenant is 10GB over in log usage but has 20GB available in database capacity. Therefore, there is no deficit. Note, file storage excess entitlement cannot be used to compensate deficits in log or database storage.

### Scenario 4: File storage is over capacity

|Type  |Entitled  |Consumed  |
|---------|---------|---------|
|**Database**     | 100GB        | 20GB        |
|**Log**     |  10GB       | 5GB        |
|**File**     | 200GB        | 290GB        |

This tenant is 90GB over in log usage but has 85GB available (80GB database + 5GB log) in storage capacity. There is a deficit and this tenant should purchase more capacity but it will not receive over capacity alerts.

## Actions to take for a storage capacity deficit

You can always [free up storage](free-storage-space.md), [delete unwanted environments](delete-environment.md), or buy more capacity to be compliant with storage usage. To learn more about capacity add-ons, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) or the [Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130), the 'Add-ons' section. You can work through your organization's standard procurement process to purchase capacity add-ons.

## FAQ

### Indexes and database storage usage
Database storage includes both the database records as well as index files used to improve search performance. Indexes are created and optimized for peak performance and are updated frequently by the system by analyzing data use patterns. No user action is needed to optimize the indexes, as all Common Data Service stores have tuning enabled by default. Fluctuation in database size, represented by an increase or decrease in the size or number of indexes, affects storage consumption. Common Data Service is constantly working to compress the index which is displayed to users.  Common causes for an increase in index size are:

- An organization making use of new functionality (this can be custom, out-of-box, or part of an update or solution installation)
- Data volume or complexity changes
- A change in usage patterns that indicate new indexes are  in need of reevaluated

If Quick Find lookups are configured for data that is frequently used, this will also create additional indexes in the database. Admin configured "quick search" values can increase the size of the indexes based on:

- The number of fields chosen and the data type of those fields
- The volume of records for the entities and fields
- The complexity of the database structure

Since custom Quick Find lookups are created by an admin in the org, these can be user controlled. Admins can reduce some of the storage used by these custom indexes by doing the following: 

- Removing unneeded fields/entities 
- Eliminating multiline text fields from inclusion

### I see the new Capacity Report, but I have not purchased the new capacity offers. How do I interpret the report?
As an existing customer, we have added file and log capacity to your tenant automatically based on your existing licenses. Because you are currently in an agreement under the old offers, you are not impacted. Make sure your database consumption is per the entitlement. You are not expected to take any action for file and log. At renewal, you can use this report to get the right amount of capacity for database, file, and log.

### I have storage licenses from the legacy licensing model and I also purchased new model storage licenses. Which report will I see?  
You will see the report for the new licensing model. 

### I just bought the new capacity-based licenses. How do I provision an environment using this model?
You can provision environments through the Power Platform admin center. For details, see [Create and manage environments in the Power Platform admin center](create-environment.md).

### I'm a new customer and I recently purchased with the new offers. My usage of database/log/file is showing red. What should I do?  
Consider buying additional capacity using the [Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544). Alternatively, you can [free up storage](free-storage-space.md).

### Where can I read more about the new capacity offers?
Download the [Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) to learn more.

### I'm an existing customer and my renewal is coming up. Will I be impacted?
Customers who renew existing subscriptions can choose to continue to transact using the existing offers for a certain period of time. Please contact your Microsoft partner or Microsoft sales team for details.

### I'm a Power Apps/Power Automate customer and have environments with and without database. Will they consume storage capacity? 
Yes. All environments will consume 1GB, regardless of whether or not they have an associated database.

### Do I get notified through email when my org is over capacity?  
When you sign in to the Power Platform admin center, you will be notified if your capacity usage is more than the entitled capacity. 

### Why am I no longer getting storage notifications?
We have disabled email notifications with the move to the new storage model. Review the **[Capacity](https://admin.powerplatform.microsoft.com/analytics/capacity )** page to monitor usage.

### I'm an existing customer. Should I expect my file and log usage to change?
Log and files data usage is not expected to be exactly the same size as when the same data is stored using database due to different storage and indexing technologies. The current set of out-of-box (OOB) entities stored in file and log might change in the future.

### Capacity report shows the entitlement breakdown by per license, but I have more licenses in my tenant and not all of them are listed in the breakdown, why?
Not all licenses give per user entitlement. For example, the team member license does not give any per user database/file/log entitlement. So in this case, the licenses that do not give any per user entitlement will not be listed in the breakdown.

### Which environments are counted in the capacity report?
Default, production, and sandbox environments are counted for consumption. Trial, preview, support, and developer environments are not counted.

### See also
[Capacity add-ons](capacity-add-on.md)<br />
[Automatic tuning in Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-automatic-tuning) <br />
[What's new in storage](whats-new-storage.md) <br />
[Free up storage space](free-storage-space.md) <br />

