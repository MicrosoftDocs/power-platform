---
title: View Power Platform admin activity logs in Microsoft Purview
description: Learn how to access Power Platform admin activity logs in Microsoft Purview and explore what admin activities you can monitor.
ms.component: pa-admin
ms.topic: how-to
ms.date: 01/23/2026
author: grbarker
ms.subservice: admin
ms.author: grbarker
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

# View Power Platform admin logs in Microsoft Purview

Administration of Microsoft Power Platform products and services can affect various capabilities such as environment settings and operations, data policies, and integration-related settings. It's important to monitor such actions to:

- help mitigate failures
- help contain systems of security constraints
- adhere to compliance requirements
- act on security threats.

This article explains how you can monitor activities in Microsoft Purview that are performed on Power Platform environments by those who have admin access across user experiences and programmable interfaces. The activities fall within these categories:

- [Environment lifecycle operations](#activity-category-environment-lifecycle-operations)
- [Environment property and setting change activities](#activity-category-environment-property-and-setting-change-activities)

The activities include actions made by Power Platform administrators, Dynamics 365 administrators, members of the System Administrator role (for Power Platform environments with Dataverse), the environment creator or owner (for Power Platform environments without Dataverse), and impersonated users that map to any of these roles.

Each activity event consists of a common schema defined at [Office 365 Management Activity API schema](/office/office-365-management-api/office-365-management-activity-api-schema#auditlogrecordtype). The schema defines the payload of metadata that's unique for each activity.

## Prerequisites

To view Power Platform admin activity logs in Microsoft Purview, make sure you:

- Review and complete the [prerequisites](activity-logs-overview.md#prerequisites) in the overview article.
- Confirm either the *Audit Logs* or *View-Only Audit Logs* role is assigned to you in Microsoft Purview.

Learn more:

- [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)
- [Auditing overview](/power-apps/developer/data-platform/auditing/overview)
- [Learn about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

> [!NOTE]
> Admin activities for Power Platform environments are enabled by default on all tenants and you can't disable the activity collection.

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]


## Activity category: Environment lifecycle operations

Each activity event contains a payload of metadata that's specific to the individual event. Microsoft Purview receives the *environment lifecycle operation* activities listed in this table.

| Event                  | Description                                                                                                                        |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Provisioned environment    | The environment was created.                                                                                                           |
| Deleted environment        | The environment was deleted.                                                                                                           |
| Recovered environment      | An environment that was deleted was recovered within seven days.                                                                     |
| Hard-deleted environment   | The environment was hard deleted.                                                                                                    |
| Moved environment          | The environment was moved to a different tenant.                                                                                      |
| Copied environment         | The environment, including specific attributes such as application data, users, customizations, and schemas, were copied. |
| Backed up environment      | The environment that was backed up.                                                                                                   |
| Restored environment       | The environment was restored from a back up.                                                                                        |
| Converted environment type | The environment was converted to a different environment type, such as production or sandbox.                                          |
| Reset environment          | A sandbox environment was reset.                                                                                                  |
| Upgraded environment       | A component of an environment was upgraded to a new version.                                                                      |
| CMK-Renewed environment    | The customer-managed key (CMK) was renewed on the environment.                                                                         |
| CMK-Reverted environment   | The environment was removed from enterprise policy and encryption was returned to Microsoft-managed key.                               |

## Activity category: Environment property and setting change activities

Each activity event contains a payload of metadata that's specific to the individual event. Microsoft Purview receives the *environment property and setting* activities listed in this table.

| Event | Description |
|-------------------------|-------------------------|
| Changed property on environment | Communicates when a property on an environment changes. In general, properties are metadata (names) that are associated with an environment. This event includes changes to:<ul><li>Display name</li><li>Domain name</li><li>Security group ID</li><li>Admin mode</li><li>Background operations state</li></ul> |

## Activity category: Environment groups and rules

All activities for environment groups and rules are recorded under the `PowerPlatformAdministratorActivity` record type.
Each activity event contains a payload of metadata that's specific to the individual event. The environment group activities listed in this table are sent to Microsoft Purview.

| Event | Description |
|-------------------------|-------------------------|
| `NewEnvironmentGroup` | A new environment group is created. |
| `DeleteEnvironmentGroup` | An environment group is deleted. |
| `UpdateEnvironmentGroup` | An environment group's name or description is updated. |
| `EnvironmentAddedToEnvironmentGroup` | An environment is added to an environment group. |
| `EnvironmentRemovedFromEnvironmentGroup` | An environment is removed from an environment group. |

These nine rules activities are sent to Microsoft Purview:

- AI-generated descriptions (preview)
- Backup retention
- Generative AI settings
- Sharing agents with Editor
- Sharing agents with Viewer
- Sharing controls for canvas apps
- Sharing controls for solution-aware cloud flows
- Solution checker enforcement
- Usage insights

| Event | Description |
|-------------------------|-------------------------|
| `CreateRuleSetOperation` | A rule is added to an environment group for the first time. |
| `UpdateRuleSetOperation` | A rule is edited in an environment group. |
| `DeleteRuleSetOperation` | An environment group is deleted. |

The remaining rules activities listed in this table are sent to Microsoft Purview.

| Event | Description |
|-------------------------|-------------------------|
| `CreateRuleBasedPolicyOperation`   | A rule is added to an environment group for the first time. |
| `CreateRuleBasedPolicyAssignmentOperation` | A rule is added to an environment group for the first time. |
| `UpdateRuleBasedPolicyOperation`  | A rule is added, edited, or removed from an environment group. |
| `DeleteRuleBasedPolicyOperation`  | An environment group is deleted. |
| `DeleteRuleBasedPolicyAssignmentOperation`  | An environment group is deleted. |

## Activity category: Business model and licensing

Each activity event contains a payload of metadata that's specific to the individual event. The business model and licensing activities listed in this table are sent to Microsoft Purview.

| Category | Event | Description |
|-------------------------|-------------------------|-------------------------|
| Billing Policy | `BillingPolicyCreate` | A new billing policy is created. |
| Billing Policy | `BillingPolicyDelete` | A billing policy is deleted. |
| Billing Policy | `BillingPolicyUpdate` | The environments linked to a billing policy change (added, removed). |
| ISV | `IsvContractConsent` | A tenant admin consents to an ISV contract. |
| License Auto-claim | `AssignLicenseAutoClaim` | A license is assigned to a user automatically via an auto-claim policy. |
| License Auto-claim | `AssignLicenseAutoClaimPolicyCreate` | A new auto-claim policy is created. |
| Currency | `CurrencyEnvironmentAllocate` | Currency (add-on) is allocated or deallocated to an environment. |
| Trials | `TrialConvertToProduction` | A trial plan is converted to a production plan. |
| Trials | `TrialEnforce` | A customer attempts to provision environments beyond the trial limit. |
| Trials | `TrialProvision` | A new trial plan is provisioned. |
| Trials | `TrialSignUpEligibilityCheck` | Prior to trial provisioning, a check occurs to determine trial eligibility. |
| Trials | `TrialViralConsent` | A tenant changes their consented plan types, and reflects the new state. |
| Trials | `AssignLicenseToUser` | A trial license is assigned to a user. |
| Environment Lifecycle | `EnvironmentDisabledByMiser` | An environment is automatically disabled due to insufficient database capacity. |

## Activity category: Admin actions

Each activity event contains a payload of metadata that's specific to the individual event. The admin activities listed in this table are sent to Microsoft Purview.

| Event | Description |
|-------------------------|-------------------------|
| `ApplyAdminRole` | A tenant admin requests the system administrator role in Dataverse in the environment. |

## Activity category: Lockbox operations

All the lockbox activities fall under the `LockboxRequestOperation` activity. Each activity event contains a payload of metadata with these properties when you create or update the lockbox request:

- Lockbox request ID
- Lockbox request state
- Lockbox support ticket ID
- Lockbox request expiration time
- Lockbox data access duration
- Environment ID
- User who performed the operation (when the lockbox request is created)

You send the events listed in this table to Microsoft Purview.

| Category | Event | Description |
|-------------------------------------------------------------|--------------|-----------------------------------------|
| Create lockbox request | `LockboxRequestOperation` | A new lockbox request is created.|
| Update Lockbox request | `LockboxRequestOperation` | A lockbox request is approved or denied.|
| Lockbox request access ended | `LockboxRequestOperation` | A lockbox request expired or access ended.|

Here's an example of the payload of metadata you can expect from one of the events listed in the table.

```json
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
>
> - Activity logging for data policies isn't currently available in sovereign clouds.
> - To access data policy logs, you need the appropriate Microsoft licenses. Go to [Microsoft Purview service description](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-purview-service-description) and [Microsoft Purview licensing guidance](https://www.microsoft.com/licensing/guidance/Microsoft-Purview) to learn more.

All the data policy events appear under the `GovernanceApiPolicyOperation` activity. Each activity event contains a property collection with the following properties:

- Operation name
- Policy ID
- Policy display name
- Additional resources (if applicable)

The data policy events listed in this table are sent to Microsoft Purview.

| Category | Description |
|-------------------------------------------------------------|-----------------------------------------|
| Create Data Policy | A new data policy is created.|
| Update Data Policy | A data policy is updated.|
| Delete Data Policy | A data policy is deleted.|
| Create Custom Connector Patterns | A new custom connector URL pattern is created.|
| Update Custom Connector Patterns | A custom connector URL pattern is updated.|
| Delete Custom Connector Patterns | A custom connector URL pattern is deleted.|
| Create Connector Configurations | A connector configuration is created for the data policy.|
| Update Connector Configurations | A connector configuration is updated for the data policy.|
| Delete Connector Configurations | A connector configuration is deleted for the data policy.|
| Create Policy Scope | A new policy scope is created.|
| Update Policy Scope | A policy scope is updated.|
| Delete Policy Scope | A policy scope is deleted.|
| Create Exempt Resources | An exempt resources list is created for the data policy.|
| Update Exempt Resources | An exempt resources list is updated for the data policy.|
| Delete Exempt Resources | An exempt resources list is deleted for the data policy.|
| Create connector blocking policy | A new connector blocking policy is created.|
| Update connector blocking policy | A connector blocking policy is updated.|
| Delete connector blocking policy | A connector blocking policy is deleted.|

Here's an example payload of metadata that you can expect from one of the events in the table.

```json
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

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Office 365 Management Activity API schema](/en-us/office/office-365-management-api/office-365-management-activity-api-schema#auditlogrecordtype)
- [Detailed properties in the audit log](/purview/audit-log-detailed-properties)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
