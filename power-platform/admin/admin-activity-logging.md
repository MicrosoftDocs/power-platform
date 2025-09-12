---
title: View Power Platform administrative logs using auditing solutions in Microsoft Purview
description: In this article, you learn how to view Power Platform administrative logs using auditing solutions in Microsoft Purview.
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/06/2025
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
ms.contributors:
 - modhawan1 
 - drkestel
 - miferlan
 - laswenka
 - wifun

---

# View Power Platform administrative logs using auditing solutions in Microsoft Purview

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Administration of Power Platform products and services can affect various capabilities such as environment settings and operations, data policies, and integration-related settings. It's important to audit such actions that help mitigate failures, help contain systems of security constraints, adhere to compliance requirements, and act on security threats.

In this article, you learn about activities that are performed on Power Platform environments by those having administrative access across user experiences and programmable interfaces using Microsoft Purview compliance portal. The activities fall within the following categories:

- [Environment lifecycle operations](#activity-category-environment-lifecycle-operations)
- [Environment property and setting change activities](#activity-category-environment-property-and-setting-change-activities)

> [!IMPORTANT]
>
> - Administrative activities for Power Platform environments are enabled by default on all tenants. You can't disable activity collection.
> - At least one user with an assigned Microsoft 365 E5 or greater license, as required by Microsoft Purview. More information: [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)

The audit activities include actions made by Power Platform administrators, Dynamics 365 administrators, members of the System Administrator role (for Power Platform environments with Dataverse), the environment creator or owner (for Power Platform environments without Dataverse), and impersonated users that map to any of these roles.

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
| CMK-Reverted environment   | Environment was removed from enterprise policy and encryption was returned to Microsoft-managed key.                                              |

## Activity category: Environment property and setting change activities

Each activity event contains a payload of metadata that is specific to the individual event. The following _environment property and setting_ activities are delivered to Microsoft Purview.

| **Event** | **Description** |
|-------------------------|-------------------------|
| Changed property on environment | Communicates when a property on an environment has changed. In general, properties are metadata (names) that is associated with an environment. Includes changes to:<ul><li>Display name</li><li>Domain name</li><li>Security group ID</li><li>Admin mode</li><li>Background operations state</li></ul> |

## Activity category: Environment groups & rules

All activities for environment groups and rules are recorded under the _PowerPlatformAdministratorActivity_ record type.

Each activity event contains a payload of metadata that is specific to the individual event. The following environment group activities are delivered to Microsoft Purview.

| **Event** | **Description** |
|-------------------------|-------------------------|
| NewEnvironmentGroup | Emitted when a new environment group is created. |
| DeleteEnvironmentGroup | Emitted when an environment group is deleted. |
| UpdateEnvironmentGroup | Emitted when an environment group's name and/or description are updated. |
| EnvironmentAddedToEnvironmentGroup | Emitted when an environment is added to an environment group. |
| EnvironmentRemovedFromEnvironmentGroup | Emitted when an environment is removed from an environment group. |

The following rules activities are delivered to Microsoft Purview for these 9 rules:

- AI-generated descriptions (preview)
- Backup retention
- Generative AI settings
- Sharing agents with Editor
- Sharing agents with Viewer
- Sharing controls for canvas apps
- Sharing controls for solution-aware cloud flows
- Solution checker enforcement
- Usage insights

| **Event** | **Description** |
|-------------------------|-------------------------|
| CreateRuleSetOperation | Emitted when a rule is added to an environment group for the first time. |
| UpdateRuleSetOperation | Emitted whenever a rule is edited in an environment group. |
| DeleteRuleSetOperation | Emitted when an environment group is deleted. |

The following rules activities are delivered to Microsoft Purview for the remaining rules.

| **Event** | **Description** |
|-------------------------|-------------------------|
| CreateRuleBasedPolicyOperation   | Emitted when any rule is added to an environment group for the first time. |
| CreateRuleBasedPolicyAssignmentOperation | Emitted when any rule is added to an environment group for the first time. |
| UpdateRuleBasedPolicyOperation  | Emitted whenever any rule is added, edited, or removed from an environment group. |
| DeleteRuleBasedPolicyOperation  | Emitted when an environment group is deleted. |
| DeleteRuleBasedPolicyAssignmentOperation  | Emitted when an environment group is deleted. |

## Activity category: Business model and licensing

Each activity event contains a payload of metadata that is specific to the individual event. The following business model and licensing activities are delivered to Microsoft Purview.

| **Category** | **Event** | **Description** |
|-------------------------|-------------------------|-------------------------|
| Billing Policy | BillingPolicyCreate | Emitted when a new billing policy is created. |
| Billing Policy | BillingPolicyDelete | Emitted when a billing policy is deleted. |
| Billing Policy | BillingPolicyUpdate | Emitted when the environments linked to a billing policy change (added, removed). |
| ISV | IsvContractConsent | Emitted when a tenant admin consents to an ISV contract. |
| License Auto-claim | AssignLicenseAutoClaim | Emitted when a license is assigned to a user automatically via an auto-claim policy. |
| License Auto-claim | AssignLicenseAutoClaimPolicyCreate | Emitted when a new auto-claim policy is created. |
| Currency | CurrencyEnvironmentAllocate | Emitted when currency (add-on) is allocated or deallocated to an environment. |
| Trials | TrialConvertToProduction | Emitted when a trial plan is converted to a production plan. |
| Trials | TrialEnforce | Emitted when a customer attempts to provision environments beyond the trial limit. |
| Trials | TrialProvision | Emitted when a new trial plan is provisioned. |
| Trials | TrialSignUpEligibilityCheck | Emitted prior to trial provisioning when a check occurs to determine trial eligibility. |
| Trials | TrialViralConsent | Emitted when a tenant changes their consented plan types, and reflects the new state. |
| Trials | AssignLicenseToUser | Emitted when a trial license is assigned to a user. |
| Environment Lifecycle | EnvironmentDisabledByMiser | Emitted when an environment is automatically disabled due to insufficient database capacity. |

## Activity category: Admin actions

Each activity event contains a payload of metadata that is specific to the individual event. The following admin activities are delivered to Microsoft Purview.

| **Event** | **Description** |
|-------------------------|-------------------------|
| Apply Admin Role | Emitted when a tenant admin requested the System administrator role in Dataverse in the environment. |

## Activity category: Lockbox operations

All the lockbox activities are under the activity **LockboxRequestOperation**. Each activity event contains a payload of metadata with the following properties when the lockbox request is created or updated: <ul><li>Lockbox request ID</li><li>Lockbox request state</li><li>Lockbox support ticket ID</li><li>Lockbox request expiration time.</li><li>Lockbox data access duration</li><li>Environment ID</li><li>User who performed the operation(when the lockbox request is created)</li></ul>
The following events are delivered to Microsoft Purview.

| **Category** | **Event** | **Description** |
|-------------------------------------------------------------|--------------|-----------------------------------------|
| Create lockbox request | LockboxRequestOperation | Emitted when a new lockbox request is created.
| Update Lockbox request | LockboxRequestOperation | Emitted when a lockbox request is approved or denied.
| Lockbox request access ended | LockboxRequestOperation | Emitted when a lockbox request expired or access ended.

Here's an example of the payload of metadata that can be expected from one of the events listed in the table.

```
[
    {
        "Name": "powerplatform.analytics.resource.tenant.lockbox.data_access.duration",
        "Value": "8"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.lockbox.support_ticket.id",
        "Value": "MSFT initiated"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.lockbox.request.state",
        "Value": "Created"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.lockbox.request.expiration_time",
        "Value": "6/1/2024 11:59:15 PM +00:00"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.lockbox.request.id",
        "Value": "dfdead68-3263-4c05-9e8a-5b61ddb5878c"
    },
    {
        "Name": "version",
        "Value": "1.0"
    },
    {
        "Name": "type",
        "Value": "PowerPlatformAdministratorActivityRecord"
    },
    {
        "Name": "powerplatform.analytics.activity.name",
        "Value": "LockboxRequestOperation"
    },
    {
        "Name": "powerplatform.analytics.activity.id",
        "Value": "cb18351c-fa1c-4f34-a6d9-f8cb91636009"
    },
    {
        "Name": "powerplatform.analytics.resource.environment.id",
        "Value": "ed92c80e-89ef-e0c8-a9eb-98559ca07809"
    },
    {
        "Name": "enduser.id",
        "Value": ""
    },
    {
        "Name": "enduser.principal_name",
        "Value": "Test user"
    },
    {
        "Name": "enduser.role",
        "Value": "Admin"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.id",
        "Value": "3a568f62-11ff-4e89-bee8-4d47041b0003"
    }
]
```

## Activity category: Data policy events

> [!NOTE]
> Activity logging for data policies is not currently available in sovereign clouds.

> [!NOTE]
> Currently users with an E5 license can view these audit events.

All the data policy events show up under **GovernanceApiPolicyOperation** activity. Each activity event contains a property collection, which emits the following properties: <ul><li>Operation Name</li><li>Policy ID</li><li>Policy display name</li><li>Additional Resources(if applicable)</li></ul>
The following data policy events are delivered to Microsoft Purview.

| **Category** | **Description** |
|-------------------------------------------------------------|-----------------------------------------|
| Create Data Policy | Emitted when a new data policy is created.
| Update Data Policy | Emitted when a data policy is updated.
| Delete Data Policy | Emitted when a data policy is deleted.
| Create Custom Connector Patterns | Emitted when a new custom connector URL pattern is created.
| Update Custom Connector Patterns | Emitted when a custom connector URL pattern is updated.
| Delete Custom Connector Patterns | Emitted when a custom connector URL pattern is deleted.
| Create Connector Configurations | Emitted when a connector configuration is created for the data policy.
| Update Connector Configurations | Emitted when a connector configuration is updated for the data policy.
| Delete Connector Configurations | Emitted when a connector configuration is deleted for the data policy.
| Create Policy Scope | Emitted when a new policy scope is created.
| Update Policy Scope | Emitted when a policy scope is updated.
| Delete Policy Scope | Emitted when a policy scope is deleted.
| Create Exempt Resources | Emitted when an exempt resources list is created for the data policy.
| Update Exempt Resources | Emitted when an exempt resources list is updated for the data policy.
| Delete Exempt Resources | Emitted when an exempt resources list is deleted for the data policy.
| Create connector blocking policy | Emitted when a new connector blocking policy is created.
| Update connector blocking policy | Emitted when connector blocking policy is updated.
| Delete connector blocking policy | Emitted when connector blocking policy is deleted.

Here's an example payload of metadata that can be expected from one of the events in the table.

```
[
    {
        "Name": "powerplatform.analytics.resource.tenant.governance.api_policy.additional_resources",
        "Value": "<<json>>"
    },
    {
        "Name": "powerplatform.analytics.resource.display_name",
        "Value": "ConnectorBlockingPolicy"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.governance.api_policy.operation_result",
        "Value": "True"
    },
    {
        "Name": "powerplatform.analytics.resource.id",
        "Value": "ConnectorBlockingPolicy"
    },
    {
        "Name": "powerplatform.analytics.resource.type",
        "Value": "ApiPolicy"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.governance.api_policy.operation_name",
        "Value": "DeleteDlpPolicy"
    },
    {
        "Name": "version",
        "Value": "1.0"
    },
    {
        "Name": "type",
        "Value": "PowerPlatformAdministratorActivityRecord"
    },
    {
        "Name": "powerplatform.analytics.activity.name",
        "Value": "GovernanceApiPolicyOperation"
    },
    {
        "Name": "powerplatform.analytics.activity.id",
        "Value": "99ac5d50-a0f4-4878-8ff4-e02b7da3a510"
    },
    {
        "Name": "enduser.id",
        "Value": "888c1bf5-3127-4c8c-84ee-b6a9c684e315"
    },
    {
        "Name": "enduser.principal_name",
        "Value": admin@contosotest.onmicrosoft.com
    },
    {
        "Name": "enduser.role",
        "Value": "Admin"
    },
    {
        "Name": "powerplatform.analytics.resource.tenant.id",
        "Value": "ce65293a-e07d-4638-9dfa-79483fcd5136"
    }
]

```

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
- [Data policy activity logging](dlp-activity-logging.md)
- [Manage Dataverse auditing](manage-dataverse-auditing.md)
- [Dataverse and model-driven apps](enable-use-comprehensive-auditing.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
