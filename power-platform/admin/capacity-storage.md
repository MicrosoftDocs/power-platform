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

We're introducing a new business model for Common Data Service storage - an evolution of the Common Data Service storage.

The new storage model provides a single place to view your capacity data.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-page.png "Capacity hub")

The current storage model had you view information in multiple places.

|  |  |
|---------|---------|
|Dynamics 365 Administration Center     | ![](media/storage-data-365-admin-center500.png "storage data")       |
|Common Data Service for Apps analytics     | ![](media/storage-data-ppac-analytics500.png "storage data")       |
|Organization Insights Dashboard |![](media/storage-data-org-insights500.png "storage data") |

## About the new storage model

We're optimizing data management for database storage, attachments, and audit logs. There will now be three types of storage: database, file, and log.

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
- 1GB (minimum) per environment reflected in reporting

<!-- 
|  | April 1, 2019 | After April 1, 2019  |
|---------|---------|---------|
|Communication     | A blog will be posted and Admins will receive emails about how to start planning for file and log storage. | You can purchase file and log storage. |
|Reporting     | <ul><li>Capacity reporting introduced</li><br /><li>Existing customers get new types of storage but are not impacted by the change until renewal</li><br /><li>Data stored in the organization databases is split and counted in three storage types</li><br /><li>1GB (minimum) per environment reflected in reporting</li></ul> |<ul><li>Reporting to include data from organization databases and new services</li><br /><li>Recommendations provided for managing storage</li></ul> |
|Notification     |<ul><li>First four weeks email sent to Admins for awareness </li><br /><li>Email notifications sent at 80% and 100% database limits</li><br /><li>No email notifications sent on log and file storage over limits</li></ul> |<ul><li>Customized notifications sent with Microsoft Flow integration</li><br /><li>Email notifications sent at 80% and 100% database limits on log and file storage</li></ul>  |
|Provisioning     |No change – still based on current model   |Provisioning changes, minimum 1GB available capacity required to provision |
|Hosting + Application Lifecycle Management    |Relational database  |Relational database, file, and log storage |

-->

## Capacity page details

This page provides a tenant-level view of where your organization is using storage capacity.

Let's do a walkthrough of what's on the **Capacity** page. To see this page, select **Capacity** > **Overall** tab in the left-side menu.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-page-review.png "Capacity hub walkthrough")

|  |Description |
|---------|---------|
|(1)   |**Current usage**<br />**Database**: text<br />**File**: text<br />**Log**: text<br />         |
|(2)    |**Capacity types and sources**<br />**Organization base**: text<br />**User licenses**: text<br />**Additional off-the-shelf**: text<br />**Total**: text         |
|(3)    |**What's new**<br />Text         |
|(4)     |**Top capacity usage, by environment**<br />Text         |

### Capacity from licenses

This panel... text 

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-from-licenses2.png "Capacity hub walkthrough")

### Per environment tab

This page provides an environment-level view of where your organization is using storage capacity.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-per-environment2.png "Capacity hub walkthrough")

### CDS 2.0 Production environment

Text

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-cds2-prod-env2.png "CDS 2.0 Production environment")

The following describes the items on this page.

|Item  |Description  |
|---------|---------|
|**Database usage**     | Text        |
|**File usage**    | Text         |
|**Log usage**     | Text        |
|**Top database capacity use, by table** | Text |
|**Top file capacity by use, by table** | Text |
|**Log usage** | Text    |
|**Top log capacity use, by table** | Text  |

Select **Applied filters** at the the top of the page to filter data for different time spans.

## FAQ

Here are some important considerations about the new storage model.

- Pricing changes: link to marketing doc?
- Additional instances: When 1GB of relational database storage is available, no separate license is needed when creating Production and Sandbox instances.
- Increased storage: file and log capacity frees up database capacity. The 4TB size limit does not apply to file and log storage.
- Transition to new platform capacity: No action is required. There is no change to existing forms, views, and other user interface elements. Existing APIs are backwards compatible.
- Anything from Guiding Principles?




