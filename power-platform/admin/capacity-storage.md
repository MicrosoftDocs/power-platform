---
title: "Preview: Capacity and storage  | MicrosoftDocs"
description: Introducing a new storage model for Common Data Service for Apps.
ms.custom: ""
ms.date: 03/15/2019
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Preview: Capacity and storage

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

To align with the new business model changes announced here, we have updated our current storage analytics to provide further clarity to our customers. Here is a summary of changes in storage analytics.

- A brand new Capacity Analytics is launched in Power Platform Admin center Analytics.
-	Admins can visualize the data stored in Database, Files, and Logs. 
-	Entitlement information is added to clearly understand what is your tenant available capacity.  
-	Existing customers get new types of capacity (File and Log) but are not impacted by the change until renewal. 

The new storage model provides a single place to view your capacity data.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-page.png "Capacity hub")

In the current storage model, you view information in multiple places.

|  |  |
|---------|---------|
|Dynamics 365 Administration Center     | ![](media/storage-data-365-admin-center500.png "storage data")       |
|Common Data Service for Apps analytics     | ![](media/storage-data-ppac-analytics500.png "storage data")       |
|Organization Insights Dashboard |![](media/storage-data-org-insights500.png "storage data") |

## About the new storage model

We're optimizing data management for database storage, attachments, and audit Logs. There will now be three types of storage: Database, File, and Log.

![](media/storage-model-evolution.png "Evolution of data management")

Some of the benefits of this change: 

- Scalability with purpose-built storage management solutions
- Ability to enable new business scenarios
- Reduced need to free up storage
- Support for variety of data types
- Additional default and full user entitlements
- Flexibility to create new environments/instances 

## Timeline

On April 1, 2019:

- Capacity reporting introduced
- Existing customers get new types of storage but are not impacted by the change until renewal
- Data stored in the organization databases is split and counted in three storage types
- 1GB (minimum) per environment is reflected in reporting

<!-- 
|  | April 1, 2019 | After April 1, 2019  |
|---------|---------|---------|
|Communication     | A bLog will be posted and Admins will receive emails about how to start planning for File and Log storage. | You can purchase File and Log storage. |
|Reporting     | <ul><li>Capacity reporting introduced</li><br /><li>Existing customers get new types of storage but are not impacted by the change until renewal</li><br /><li>Data stored in the organization databases is split and counted in three storage types</li><br /><li>1GB (minimum) per environment reflected in reporting</li></ul> |<ul><li>Reporting to include data from organization databases and new services</li><br /><li>Recommendations provided for managing storage</li></ul> |
|Notification     |<ul><li>First four weeks email sent to Admins for awareness </li><br /><li>Email notifications sent at 80% and 100% database limits</li><br /><li>No email notifications sent on Log and File storage over limits</li></ul> |<ul><li>Customized notifications sent with Microsoft Flow integration</li><br /><li>Email notifications sent at 80% and 100% database limits on Log and File storage</li></ul>  |
|Provisioning     |No change – still based on current model   |Provisioning changes, minimum 1GB available capacity required to provision |
|Hosting + Application Lifecycle Management    |Relational database  |Relational database, File, and Log storage |

-->

## Capacity page details

This page provides a tenant-level view of where your organization is using storage capacity.

Let's do a walkthrough of what's on the **Capacity** page. To see this page, select **Capacity** > **Overall** tab in the left-side menu.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-page-review.png "Capacity hub walkthrough")

|  |Description |
|---------|---------|
|(1)   |**Current usage**<br /><ul><li>**Database**: How much Database, File, and Log space your tenant is consuming</li><br /><li>**File**: How much your tenant is entitled to Expand the User Licenses to further drill down</li><br /><li>**Log**: text needed</li></ul>         |
|(2)    |**Capacity types and sources**<br /><li>**Organization base**: The default capacity given at the time of sign-up </li><br /><li>**User licenses**: Additional capacity added for every User License purchased</li><br /><li>**Additional storage**: Any additional storage you bought </li><br /><li>**Total**: Total storage available </li></ul>      |
|(3)    |**What's new**<br />Announcing the new storage model         |
|(4)     |**Top capacity usage, by environment**<br />Top environments that consume the most capacity        |

### Capacity from licenses

This is a further drill down. Refer to point#2 above.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-from-licenses2.png "Capacity hub walkthrough")

### Per environment tab

This page lists all environments in the tenant and how much capacity they are consuming. 

- Environments that do not count against capacity show as 0GB
  - Trial 
  - Preview
  - Support
  - Developer
- Admins can select environments showing 0GB to go to the **Environment Analytics** page and see the actual consumption.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-per-environment2.png "Capacity hub walkthrough")

### CDS 2.0 Production environment

This page provides an environment-level detailed view of where your organization is using storage capacity.

-	Actual Database usage
-	Top Database tables and their growth over time
-	Actual File usage
-	Top Files tables and their growth over time
-	Actual Log usage
-	Top tables and their growth over time

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-cds2-prod-env2.png "CDS 2.0 Production environment")

The following describes the items on this page.

|Item  |Description  |
|---------|---------|
|**Database usage**     | Text        |
|**File usage**    | Text         |
|**Log usage**     | Text        |
|**Top database capacity use, by table** | Text |
|**Top File capacity by use, by table** | The following tables are used: <br /><ul><li>AuditBase</li><br /><li>PlugInTraceLogBase</li></ul> |
|**Top Log capacity use, by table** | The following tables are used: <br /><ul><li>Attachment</li><br /><li>AttachmentBase</li><br /><li>AttachmentMIMEAttachement</li></ul>  |

Select **Applied filters** at the the top of the page to filter data for different time spans.

## FAQ

### I'm an existing customer with an EA agreement. Should I go buy Log and File capacity?
If you have an existing agreement, you are not impacted with the current change. We have added Log and File capacity to your current entitlement which reduces your Database capacity. Until renewal, you can continue with the current plan.

### I'm an existing customer and my renewal is coming up. Will I be impacted?
At renewal, you are expected to move to the new model and purchase the Database, File, and Log capacity as appropriate. You can use the current report to determine how much you should buy.

### Will the Storage tab in Common Data Service continue to work?
The **Storage** tab will be deprecated as we move to the new updated Capacity Analytics.

### I have a PowerApps environment with Database, will this environment count against capacity?
Yes. All Common Data Service environments are counted.

### How do I buy more capacity?
A) ??

### How can I reduce consumed storage space?
See the following: [Free storage space](free-storage-space.md).





