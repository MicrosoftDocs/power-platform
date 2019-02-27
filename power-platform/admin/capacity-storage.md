---
title: "Capacity and storage  | MicrosoftDocs"
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
# Capacity and storage

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

We're introducing a new business model for Common Data Service storage - an evolution of the Common Data Service storage capacity.

While storage was once viewed in multiple places...

|  |  |
|---------|---------|
|Dynamics 365 Administration Center     | ![](media/storage-data-365-admin-center500.png "storage data")       |
|Common Data Service for Apps analytics     | ![](media/storage-data-ppac-analytics500.png "storage data")       |
|Organization Insights Dashboard |![](media/storage-data-org-insights500.png "storage data") |

...the new storage model provides a single place to view your data.

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-page.png "Capacity hub")

## About the new storage model

We're optimizing data management for database storage, attachments, and audit logs.

![](media/storage-model-evolution.png "Evolution of data management")

Some of the benefits of this change: 

- Scalability with purpose-built storage management solutions
- Ability to enable new business scenarios
- Reduced need to free up storage
- Support for variety of data types
- Additional default and full user entitlements
- Flexibility to create new environments/instances 

## Timeline

Communication and feature deployment are planned as follows.

|  | April 1, 2019 | After April 1, 2019  |
|---------|---------|---------|
|Communication     | A blog will be posted and Admins will receive emails about how to start planning for File and Log storage. | You can purchase File and Log storage. |
|Reporting     | <ul><li>Capacity reporting introduced</li><br /><li>Existing customers get new types of storage but are not impacted by the change until renewal</li><br /><li>Data stored in the organization databases is split and counted in three storage types</li><br /><li>1GB (minimum) per environment reflected in reporting</li></ul> |<ul><li>Reporting to include data from organization databases and new services</li><br /><li>Recommendations provided for managing storage</li></ul> |
|Notification     |<ul><li>First four weeks email sent to Admins for awareness </li><br /><li>Email notifications sent at 80% and 100% database limits</li><br /><li>No email notifications sent on Log and File storage over limits</li></ul> |<ul><li>Customized notifications sent with Microsoft Flow integration</li><br /><li>Email notifications sent at 80% and 100% database limits on Log and File storage</li></ul>  |
|Provisioning     |No change – still based on current model   |Provisioning changes, minimum 1GB available capacity required to provision |
|Hosting + Application Lifecycle Management    |Relational database  |Relational database, File, and Log storage |

## Capacity page details

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

Text

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-capacity-from-licenses2.png "Capacity hub walkthrough")

### Per environment tab

Text

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-per-environment2.png "Capacity hub walkthrough")

### CDS 2.0 Production environment

Text

> [!div class="mx-imgBorder"] 
> ![](media/storage-data-cds2-prod-env2.png "CDS 2.0 Production environment")

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

## Things to know about the new storage model

