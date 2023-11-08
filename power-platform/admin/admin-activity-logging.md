---
title: View Power Platform administrative logs using auditing solutions in Microsoft Purview (preview)
description: In this article, you learn how to view Power Platform administrative logs using auditing solutions in Microsoft Purview.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/01/2023
author: StephenRauchPM
ms.subservice: admin
ms.author: johnev
ms.reviewer: sericks 
search.audienceType: 
  - admin
---

# View Power Platform administrative logs using auditing solutions in Microsoft Purview (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Administration of Power Platform products and services can affect various capabilities such as environment settings and operations, data policies, and integration-related settings. It's important to audit such actions that help mitigate failures, help contain systems of security constraints, adhere to compliance requirements, and act on security threats.

In this article, you learn about activities that are performed on Power Platform environments by those having administrative access across user experiences and programmable interfaces using Microsoft Purview compliance portal. The activities fall within the following categories:

- [Environment lifecycle operations](#activity-category-environment-lifecycle-operations)
- [Environment property and setting change activities](#activity-category-environment-property-and-setting-change-activities)

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Administrative activities for Power Platform environments are enabled by default on all tenants. You can't disable activity collection.
> - At least one user with an assigned Microsoft 365 E5 or greater license, as required by Microsoft Purview. More information: [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)

The audit activities include actions made by global administrators, Power Platform administrators, Dynamics 365 administrators, members of the System Administrator role (for Power Platform environments with Dataverse), the environment creator or owner (for Power Platform environments without Dataverse), and impersonated users that map to any of these roles.

Each activity event consists of a common schema defined at [Office 365 Management Activity API schema](/en-us/office/office-365-management-api/office-365-management-activity-api-schema#auditlogrecordtype). The schema defines the payload of metadata that is unique for each activity.

## Activity category: Environment lifecycle operations

Each activity event contains a payload of metadata that is specific to the individual event. The following _environment lifecycle operation_ activities are delivered to Microsoft Purview.

| **Event**                  | **Description**                                                                                                                        |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Provisioned environment    | The environment was created.                                                                                                                   |
| Deleted environment        | The environment was deleted.                                                                                                                   |
| Recovered environment      | An environment that was deleted within seven days has been recovered.                                                                     |
| Hard-deleted environment   | The environment was hard deleted.                                                                                                    |
| Moved environment          | The environment was moved to a different tenant.                                                                                               |
| Copied environment         | The environment, including specific attributes such as application data, users, customizations, and schemas, were copied. |
| Backed up environment      | The environment that has been backed up.                                                                                                   |
| Restored environment       | The environment has been restored from a back up.                                                                                        |
| Converted environment type | The environment was converted to a different environment type, such as production or sandbox.                                          |
| Reset environment          | A sandbox environment has been reset.                                                                                                  |
| Upgraded environment       | A component of an environment has been upgraded to a new version.                                                                      |
| CMK-Renewed environment    | The customer-managed key (CMK) has been renewed on the environment.                                                                         |
| CMK-Reverted environment   | Environment was removed from enterprise policy and encryption was retured to Microsoft-managed key.                                              |

## Activity category: Environment property and setting change activities

Each activity event contains a payload of metadata that is specific to the individual event. The following _environment property and setting_ activities are delivered to Microsoft Purview.

| **Event** | **Description** |
|-------------------------|-------------------------|
| Changed property on environment | Communicates when a property on an environment has changed. In general, properties are metadata (names) that is associated with an environment. Includes changes to:<ul><li>Display name</li><li>Domain name</li><li>Security group ID</li><li>Admin mode</li><li>Background operations state</li></ul> |

## View activities in Microsoft Purview

When audit log search is turned on in the Microsoft Purview compliance portal, admin activity from your organization is recorded in the Microsoft Purview audit log.

You can use several methods to search events in Microsoft Purview.

:::image type="content" source="media/admin-activity-logging/audit-search.png" alt-text="Microsoft Purview search audit page":::

Use wild card search for contextual information in the Microsoft Purview user experience.

Narrow down search constructs that are specific to individual events.

:::image type="content" source="media/admin-activity-logging/filter-record-types.png" alt-text="Filter record types in Microsoft Purview audit search":::

As you search, individual activities are shown. A common schema is enforced to enable search constructs across activities. The value in the **PropertyCollection** field is specific to each activity type.

For more information about the Microsoft Purview audit log, data retention policies, and capabilities, see [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview).

### See also

- [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Office 365 Management Activity API schema](/en-us/office/office-365-management-api/office-365-management-activity-api-schema#auditlogrecordtype)
- [Detailed properties in the audit log](/purview/audit-log-detailed-properties)
- [Power Apps activity logging](logging-powerapps.md)
- [Power Automate activity logging](logging-power-automate.md)
- [Power Platform connector activity logging (preview)](connector-events-power-platform.md)
- [Data loss prevention activity logging](dlp-activity-logging.md)
- [Manage Dataverse auditing](manage-dataverse-auditing.md)
- [Dataverse and model-driven apps](enable-use-comprehensive-auditing.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
