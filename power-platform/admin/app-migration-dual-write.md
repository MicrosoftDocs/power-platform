---
title: App migration for Dual write F&O to DV communications
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

# App migration for Dual write F&O to DV communications

## Upcoming Change to Dual Write System Configuration
As part of ongoing efforts to enhance communication security between Finance and Operations (F&O) and Dataverse (DV), the platform team will be updating the AppID used by Dual Write.

1. Current Configuration: Dual Write currently uses the AppID 00000015-0000-0000-c000-000000000000 for communication from F&O to DV.
1. New Configuration: Starting September 1, 2025, this will be replaced with a new AppID: f1752846-f0df-4766-96f5-c109adf67d7f.
1. Provisioning Status: The new AppID is already included in most provisioned DV environments.
1. Release Timeline: The change is scheduled to go live on September 1, 2025.
1. Impact: This update may affect integration configurations, authentication flows, and environment-specific customizations.

## Why this change
The new application (f1752846-f0df-4766-96f5-c109adf67d7f) was introduced in the Finance and Operations (F&O) platform as part of the PU 43 release. It provides a more secure and robust framework for communication with Dataverse, including abstraction for token exchange between F&O and Dataverse.
Dual Write now leverages this abstraction, which is currently flighted. The rollout of this change was delayed ensuring it was included in all customer platform updates. It has now been confirmed that all recent quality updates contain this enhancement.

## Expected changes
1. Changes in APPId will change the modifiedby/createdby for records edited or created as part of Dual write runtime. The changes can be perceived from audit logs or updates on records. Typical default users assigned are FinanceAndOperationsServiceUser@dynamics.com (for 00000015-0000-0000-c000-000000000000) will change to FinanceandOperationsRuntimeIntegrationUser@onmicrosoft.com ( for f1752846-f0df-4766-96f5-c109adf67d7f).

    An observed difference can be seen on audit logs for Dataverse records

    (image)

1. As part of Dual write, Microsoft provided standard solutions dependencies will also get migrated to the new app. The packages are available on app source for proactive uptake till Sept 1st, 2025. MSFT will be making force updates on these packages so that there are no breaking changes on Dual write live sync. Following are packages that will be force updated to the latest available version as of publish date.
  
    - Dual-write Application Core Solutions
    - Dual-write core solution
    - Dual-write Party and Global Address Book Solutions
    - Dual Write Supply Chain Extended Solution

## Impact for Dual write Customers

1. Dependency with Microsoft provided solutions:
    Customers using older versions of Microsoft-provided Dual Write solutions should validate upgrade paths before the September 1, 2025, deadline. While these solutions are designed to be backward compatible, customizations or applications built on older versions may require evaluation.
For support or questions, please contact:

    - Dual-write Application Core Solutions:didev@microsoft.com
    - Dual-write Core Solution:didev@microsoft.com
    - Dual-write Party and Global Address Book Solutions:Contact TBD
    - Dual Write Supply Chain Extended Solution:Contact TBD

1. Custom solution dependency on application “00000015-0000-0000-c000-000000000000”.

    External solutions and processes that rely on the legacy AppID (00000015-0000-0000-c000-000000000000)—especially those modifying system fields like CreatedBy or ModifiedBy in Dataverse—may experience unexpected behavior. These fields are not recommended for logical operations. If such dependencies exist, remap them to the new AppID or a designated user to ensure continuity.

## Call for Action 
Customers are advised to upgrade their Dual Write environments to the latest available versions of the Dataverse App Core solutions if their current solution version is at or below the specified thresholds. This ensures compatibility with upcoming platform changes and continued support.

| Solution name | Minimum required version|
|----------|------------------------|
| Dual-write Party and Global Address Book Solutions | 3.5.1.135 |
| Dual Write Supply Chain Extended Solution| 2.3.4.265 |

If your current solution version is above the specified threshold, there is no immediate need to upgrade. However, upgrading to the latest version is still recommended to ensure optimal compatibility and support.

Customers with custom solutions that depend on the legacy AppID (00000015-0000-0000-c000-000000000000), or the associated user reflected in the ModifiedBy field in Dataverse should reconfigure their solutions to use the new AppID or user.

For backward compatibility, filters can be applied to support both legacy and new AppIDs/users. This approach helps ensure a smoother transition and minimizes disruption to business processes.

To validate which emails/users would get updated on the new appid use following fetchxml to evaluate. 

``fetch xml
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
``

In rare cases if the application ID is not available reach out to Microsoft with urgent case.

If there are compliance requirements related to the ModifiedBy and CreatedBy fields in Dataverse audit logs, please note that changes associated with the new AppID will apply to all records created or modified on or after September 1, 2025.



