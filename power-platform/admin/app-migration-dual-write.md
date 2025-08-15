---
title: App migration from dual-write in finance and operations to Dataverse communications
description: Learn how to...
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 07/31/2025
author: sericks007
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# App migration from dual-write in finance and operations to Dataverse communications

## Upcoming change to dual-write system configuration
As part of ongoing efforts to enhance communication security between finance and operations apps and Dataverse, the platform team will be updating the AppID used by [dual-write](/dynamics365/fin-ops-core/dev-itpro/data-entities/dual-write/dual-write-home-page) functionality.

- **Current configuration**: Dual-write currently uses the AppID, **00000015-0000-0000-c000-000000000000**, for communication from finance and operations to Dataverse.
- **New configuration**: Starting September 1, 2025, a new AppID, **f1752846-f0df-4766-96f5-c109adf67d7f**, will be used.
- **Provisioning status**: The new AppID is already included in most provisioned Dataverse environments.
- **Release timeline**: The change is scheduled to go live on September 1, 2025.
- **Impact**: This update may affect integration configurations, authentication flows, and environment-specific customizations.

## Why this change
The new application ID, **f1752846-f0df-4766-96f5-c109adf67d7f**, was introduced in the finance and operations platform as part of the [Platform update 43 release](/dynamics365/fin-ops-core/fin-ops/get-started/whats-new-platform-updates-10-0-43). It provides a more secure and robust framework for communication with Dataverse, including abstraction for token exchange between finance and operations and Dataverse.

Dual-write now uses this abstraction. All recent quality updates contain this enhancement.

## Expected changes
1. Changes in AppID change the **ModifiedBy** and **CreatedBy** dates for records edited or created as part of the dual-write runtime. The changes can be viewed from audit logs or updates on records. Typical default users assigned are `FinanceAndOperationsServiceUser@dynamics.com` for the AppID of **00000015-0000-0000-c000-000000000000** change to `FinanceandOperationsRuntimeIntegrationUser@onmicrosoft.com` for the AppID of **f1752846-f0df-4766-96f5-c109adf67d7f**.

    An observed difference can be seen on audit logs for Dataverse records.

    (image)

1. As part of the dual-write functionality, Microsoft-provided, standard solution dependencies get migrated to the new app. The packages are available on app source for proactive uptake until Sept 1, 2025. Microsoft will be making updates on these packages so that there are no breaking changes on the dual-write live sync. The following packages will be updated to the latest available version.
  
    - Dual-write application core solutions
    - Dual-write core solution
    - Dual-write party and global address book solutions
    - Dual-write supply chain extended solution

## Impact for dual-write customers

1. **Dependency with Microsoft-provided solutions**
    Customers using older versions of Microsoft-provided dual-write solutions should validate upgrade paths before the September 1, 2025, deadline. While these solutions are designed to be backward compatible, customizations or applications built on older versions may require evaluation.
   
    For support or questions, you can contact the following resources:

    - **Dual-write Application Core Solutions**: didev@microsoft.com
    - **Dual-write Core Solution**: didev@microsoft.com
    - **Dual-write Party and Global Address Book Solutions**: Contact TBD
    - **Dual Write Supply Chain Extended Solution**: Contact TBD

1. **Custom solution dependency on application ID 00000015-0000-0000-c000-000000000000**

    External solutions and processes that rely on the legacy AppID of **00000015-0000-0000-c000-000000000000**&mdash;especially those modifying system fields like **CreatedBy** or **ModifiedBy** in Dataverse&mdash;may experience unexpected behavior. These fields aren't recommended for logical operations. If such dependencies exist, remap them to the new AppID or a designated user to ensure continuity.

## Call for action 
Customers are advised to upgrade their dual-write environments to the latest available versions of the Dataverse App Core solutions if their current solution version is at or below the specified thresholds. This ensures compatibility with upcoming platform changes and continued support.

| Solution name | Minimum required version|
|----------|------------------------|
| Dual-write party and global address book solutions | 3.5.1.135 |
| Dual-write supply chain extended solution| 2.3.4.265 |

If your current solution version is above the specified threshold, there's no immediate need to upgrade. However, upgrading to the latest version is still recommended to ensure optimal compatibility and support.

Customers with custom solutions that depend on the legacy AppID **00000015-0000-0000-c000-000000000000**, or the associated user reflected in the **ModifiedBy** field in Dataverse should reconfigure their solutions to use the new AppID or user.

For backward compatibility, filters can be applied to support both legacy and new AppIDs and users. This approach helps ensure a smoother transition and minimizes disruption to business processes.

To validate which users would get updated to the new AppID, use following FetchXML to evaluate. 

```FetchXML
<fetch>
  <entity name="applicationuser">
    <attribute name="applicationid" />
    <attribute name="applicationname" />
    <filter>
      <filter>
        <condition attribute="applicationid" operator="eq" value="f1752846-f0df-4766-96f5-c109adf67d7f" />
      </filter>
    </filter>
    <link-entity name="systemuser" from="applicationid" to="applicationid" link-type="inner" alias="appuser">
      <attribute name="fullname" />
      <attribute name="internalemailaddress" />
    </link-entity>
  </entity>
</fetch>
```

In rare cases if the application ID isn't available reach out to Microsoft with urgent case.

If there are compliance requirements related to the **ModifiedBy** and **CreatedBy** fields in Dataverse audit logs, note that changes associated with the new AppID applies to all records created or modified on or after September 1, 2025.



