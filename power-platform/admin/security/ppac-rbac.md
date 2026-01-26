---
title: What is Power Platform role-based access control (RBAC)?
description: Overview of RBAC in Microsoft Power Platform. Learn how to use role assignments to control access to Power Platform resources with Security Hub in the Power Platform Admin Center (PPAC), APIs, and SDK.
author: laneswenka
manager: zoraz
ms.service: powerplatform-admin
ms.topic: overview
ms.date: 01/09/2026
ms.author: laswenka
---

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
# What is Power Platform Role-Based Access Control (RBAC)?

Role-Based Access Control (RBAC) in Microsoft Power Platform is a security model designed to help organizations manage "who can do what" across their Power Platform resources with confidence and flexibility. RBAC provides a modern approach to access management, making it easier to assign and enforce permissions for users, groups, and automation.

With Power Platform RBAC, administrators can:
- Specify who has access to specific resources
- Decide which actions users can perform (such as create, manage, or view)
- Assign permissions at various levels: organization (tenant), environment groups, and individual environments

RBAC operates at the Power Platform API layer, representing administrative control over resources, while Dataverse continues to provide its own foundational RBAC for business data within environments.

## Security Principals
A security principal is an entity in Microsoft Entra ID that can be granted access via role assignments. Supported security principals include:
- **User Principal Name (UPN) users:** Human users in Microsoft Entra ID
- **Security groups:** Groups synchronized from Microsoft Entra ID
- **Service principals / managed identities:** Used for automation and integration purposes

These principals can be assigned built-in Power Platform roles at the appropriate scope.

## Benefits of Power Platform RBAC
- **Granular Access:** Assign roles at the tenant, environment group, or environment levels for precise control
- **Built-in Roles:** Use default roles (such as Environment Admin and Maker) to align with your organization’s access policies
- **Flexible Scoping:** Roles can be applied at broad or narrow levels to match operational needs
- **Inheritance:** Assignments at a higher scope (e.g., tenant) are inherited by lower scopes (e.g., environment groups and environments)

## Key Concepts

### Role Definitions
Role definitions are collections of permissions that describe what actions are allowed. Assignable scopes are determined by each built-in role. Roles cannot be customized or modified by customers.

### Scope
- **Tenant:** Organization-wide permissions
- **Environment Group:** Logical groups of environments for collective management
- **Environment:** Individual workspace for apps, data, and automations

Assignments at broader scope levels provide inherited permissions at lower levels unless specifically overridden.

### Role Assignment
Role assignments are links between a security principal, a built-in role definition, and a scope. Example assignments include granting an admin rights for all environments in a group, or assigning read-only access for a single environment.

## Managing RBAC in Power Platform
RBAC assignments can be managed via:
- **Security Hub in Power Platform Admin Center (PPAC):** A graphical interface for creating, modifying, and reviewing role assignments
- **Power Platform APIs and SDKs:** Programmatic options for managing roles, suitable for automation and integration in larger organizations

Audit and review capabilities are available to help track changes and understand effective permissions.

## Data Storage & Reliability
Role definitions and assignments are stored securely and centrally for your tenant and synchronized regionally to ensure reliable enforcement and global access.

## License Requirements
To use Power Platform RBAC management features, your tenant must have the appropriate Power Platform licenses for administrators. The availability of advanced role types or scoping options may depend on your licensing tier.

## Built-In Power Platform Roles
The following built-in roles are available to assign to users, groups, and service principals in Power Platform RBAC:

| Role Name                                         | Role ID                                   | Assignable Scope                             | Permissions (Exact Syntax)                                            |
|---------------------------------------------------|-------------------------------------------|----------------------------------------------|-----------------------------------------------------------------------|
| Power Platform Role Based Access Control Administrator | 95e94555-018c-447b-8691-bdac8e12211e      | /tenants/{0}                                 | *.Read, Authorization.RoleAssignments.Write, Authorization.RoleAssignments.Delete |
| Power Platform Reader                             | c886ad2e-27f7-4874-8381-5849b8d8a090      | /tenants/{0}                                 | *.Read                                                        |
| Power Platform Contributor                        | ff954d61-a89a-4fbe-ace9-01c367b89f87      | /tenants/{0}                                 | *                                                           |
| Power Platform Owner                              | 0cb07c69-1631-4725-ab35-e59e001c51ea      | /tenants/{0}                                 | *                                                           |
| Copilot Studio Authors                            | 5835ab2b-77cf-48c6-9a37-4de77b1354ee      | /tenants/{0}                                 | CopilotStudio.Copilots.Read, CopilotStudio.Copilots.Write   |
| Vibe Resource Owner                               | 6ec9a887-3309-4d9c-bec1-c24e37ae617e      | /tenants/{0}/environments/{1}/vibepackages/{2} | Vibe.Packages.*                                                |
| Vibe Resource Contributor                         | 2d6b7db4-6751-456c-baa9-e708d8862c44      | /tenants/{0}/environments/{1}/vibepackages/{2} | Vibe.Packages.Read, Vibe.Packages.Write                    |
| Vibe Resource Viewer                              | 73117049-034a-421d-ac67-df2314308369      | /tenants/{0}/environments/{1}/vibepackages/{2} | Vibe.Packages.Read                                         |
| Subnet Diagnostics Operator                       | b4e9c1a2-6d3f-4a8b-9e7c-5f2d1b8a3c6e      | /tenants/{0}                                 | EnvironmentManagement.SubnetDiagnostics.Action, EnvironmentManagement.SubnetDiagnostics.Read |
| Subnet Diagnostics Reader                         | c5f0d2b3-8e4a-4c7d-a1b9-6e3f2d8c5a4b      | /tenants/{0}                                 | EnvironmentManagement.SubnetDiagnostics.Read                                |
| Subnet Diagnostics Administrator                  | d6a1e3c4-9f5b-4d8e-b2c7-7a4e3f1d9b8c      | /tenants/{0}                                 | EnvironmentManagement.SubnetDiagnostics.*                                  |
| PowerApp Owner                                    | e2f08f33-d8d1-4a25-9471-c6559e14f693      | /tenants/{0}/environments/{1}/powerapps/{2}   | PowerApps.*                                                      |
| PowerApp Editor                                   | 53879a32-5380-45b3-982f-bad3be5bffa7      | /tenants/{0}/environments/{1}/powerapps/{2}   | PowerApps.ViewApp.Read, PowerApps.EditApp.Write, PowerApps.Share.* |
| PowerApp Viewer                                   | b9229f00-a4d2-4fdd-a9a1-f40e07c0bb03      | /tenants/{0}/environments/{1}/powerapps/{2}   | PowerApps.ViewApp.Read, PowerApps.ShareApp.Read                 |
| Environment Management Administrator               | 38c9f647-07da-4e42-bfd7-4be26ee3110a      | /tenants/{0}                                 | EnvironmentManagement.*                                             |
| Environment Management Reader                      | d5b95a60-a291-4792-96d0-7b2fd086e7ad      | /tenants/{0}                                 | EnvironmentManagement.*.Read                                       |
| Environment Backup Operator                        | eda8bba2-3171-4ba0-9d62-bf4411cebd52      | /tenants/{0}                                 | EnvironmentManagement.Backup.Read, EnvironmentManagement.Backup.Write, EnvironmentManagement.Backup.Delete |
| Environment Backup Reader                          | 51a62123-6a4d-4565-8b5f-cd60172f3d62      | /tenants/{0}                                 | EnvironmentManagement.Backup.Read                                   |
| Environment Lifecycle Operations Reader            | 1284d1a1-2b8f-4b3d-a326-ad1068d1517c      | /tenants/{0}                                 | EnvironmentManagement.Operation.Read                                |
| Environment Provisioning Operator                  | 7c1ad5c2-e100-4676-8e6a-60f2940dc3f2      | /tenants/{0}                                 | EnvironmentManagement.Provisioning.Write                            |
| Environment State Operator                         | f0f6e417-300b-4c0e-ba36-7ce83dafc4e2      | /tenants/{0}                                 | EnvironmentManagement.State.Write                                   |
| Environment Sku Operator                           | 89c3557d-bdbd-4914-adc5-2a4ec80f0812      | /tenants/{0}                                 | EnvironmentManagement.Sku.Write                                     |
| Environment Encryption Operator                    | 232d0657-f718-44d6-9b57-4943df814703      | /tenants/{0}                                 | EnvironmentManagement.Encrypt.Write                                 |
| Environment Copy Operator                          | 3413a04c-ae68-46fb-af1b-d6601d00ca28      | /tenants/{0}                                 | EnvironmentManagement.Copy.Read, EnvironmentManagement.Copy.Write    |
| Environment Recover Operator                       | f9d7e723-713f-4c83-9a3c-7e9abb3ccbcf      | /tenants/{0}                                 | EnvironmentManagement.Recover.Write                                 |
| Environment Reset Operator                         | 0aa09a73-3a2d-4079-93a4-2de5ec7f8912      | /tenants/{0}                                 | EnvironmentManagement.Reset.Write                                   |
| Environment Restore Operator                       | 736b231a-28ad-4d15-955a-4c46299fdc40      | /tenants/{0}                                 | EnvironmentManagement.Restore.Read, EnvironmentManagement.Restore.Write |
| Environment Failover Operator                      | a67c6895-3e35-4a9c-9560-ed485dce9929      | /tenants/{0}                                 | EnvironmentManagement.Failover.Write, EnvironmentManagement.Failover.Read |
| Environment ManageGovernance Operator              | 8419cc69-3a16-442a-a707-1506d08fdfbd      | /tenants/{0}                                 | EnvironmentManagement.ManageGovernance.Write                        |
| Environment Group Admin                            | 8de5dda7-87b4-4103-ac71-26898486d024      | /tenants/{0}                                 | EnvironmentManagement.Groups.Read, EnvironmentManagement.Groups.Write, EnvironmentManagement.Groups.Delete, Governance.RuleBasedPolicies.Read, Governance.RuleBasedPolicies.Write, Governance.RuleBasedPolicies.Delete |

## Next Steps
- Explore Security Hub in the Power Platform Admin Center to assign and manage roles
- Review API documentation for automation and advanced scenarios
- Tailor your RBAC policy to support your organization’s security and operational needs

For detailed reference on permissions, roles, and integration:
- [Power Platform API reference](https://learn.microsoft.com/en-us/rest/api/power-platform/)
- [Comprehensive RBAC documentation](https://review.learn.microsoft.com/en-us/power-platform/admin/security/ppac-rbac)
