---
title: What is Power Platform role-based access control (RBAC)?
description: Overview of RBAC in Microsoft Power Platform admin center. Learn how to use role assignments to control access to Power Platform resources with Security Hub in the Power Platform Admin Center (PPAC), APIs, and SDK.
author: laneswenka
manager: zoraz
ms.service: powerplatform-admin
ms.topic: overview
ms.date: 02/10/2026
ms.author: laswenka
---

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
# What is Power Platform Role-Based Access Control (RBAC)?

Role-Based Access Control (RBAC) in Microsoft Power Platform admin center (PPAC) is a security model designed to help organizations manage "who can do what" across their Power Platform resources with confidence and flexibility. RBAC provides a modern approach to access management, making it easier to assign and enforce permissions for users, groups, and software automation.

With Power Platform RBAC, administrators can:
- Specify who has access to specific resources
- Decide which actions users can perform (such as create, manage, or view)
- Assign permissions at various levels: organization (tenant), environment groups, and individual environments

RBAC operates at the Power Platform API layer, representing administrative control over resources, while Dataverse continues to provide its own foundational RBAC for business data within environments.

> [!NOTE]
> Currently, RBAC is focused on broadening service principal and managed identity support across Power Platform API and the various management SDKs.  Read-only, as well as read and write permissions assigned at scopes lower then the whole tenant for the PPAC UX are on the roadmap but not yet finished.



## Benefits of Power Platform RBAC
- **Granular Access:** Assign roles at the tenant, environment group, or environment levels for precise control
- **Built-in Roles:** Use default roles (such as Environment Admin and Maker) to align with your organization’s access policies
- **Flexible Scoping:** Roles can be applied at broad or narrow levels to match operational needs
- **Inheritance:** Assignments at a higher scope (e.g., tenant) are inherited by lower scopes (e.g., environment groups and environments)

## Key Concepts

### Security Principals
A security principal is an entity in Microsoft Entra ID that can be granted access via RBAC role assignments. Supported security principals include:
- **User Principals:** Human users in Microsoft Entra ID, using their email address.
- **Groups:** Security enabled groups in Microsoft Entra ID, using their group ID.
- **Service principals / managed identities:** App registrations in Microsoft Entra ID as well as both system and user-defined managed identities.  Assigned using their respective Enterprise object IDs.

### Scope
This is the level of the hierarchy at which an assignment is made.  
- **Tenant:** Broad permissions across all environment groups and environments.
- **Environment Group:** A logical grouping of environments for collective management.  Permissions apply to all environments in the group.  
- **Environment:** Individual workspace for apps, agents, data, and automations.  Permissions apply to all resources in this particular environment.

Assignments at broader scope levels provide inherited permissions at lower levels unless specifically overridden.

### Role Assignment
Role assignments are links between a security principal, a built-in role definition, and a scope. Example assignments include delegating management of an entire environment group to another person or managed identity, freeing up time for central IT to manage the rest of the tenant.

## Managing RBAC in Power Platform
RBAC assignments can be managed via:
- **Power Platform APIs and SDKs:** Programmatic options for managing roles, suitable for automation and integration in larger organizations.  

## Data Storage & Reliability
Role definitions and assignments are stored securely and centrally for your tenant and synchronized regionally to ensure reliable enforcement and global access.

## Role Definitions
Role definitions are collections of permissions that describe what actions are allowed. Assignable scopes are determined by each built-in role. Roles cannot be customized or modified by customers.

## Built-In Power Platform Roles
The following built-in roles are available to assign to users, groups, and service principals in Power Platform RBAC:

| Role Name                                         | Role ID                                   | Assignable Scope                             | Permissions (Exact Syntax)                                            |
|---------------------------------------------------|-------------------------------------------|----------------------------------------------|-----------------------------------------------------------------------|
| Power Platform Role Based Access Control Administrator | 95e94555-018c-447b-8691-bdac8e12211e      | /tenants/{0}                                 | *.Read, Authorization.RoleAssignments.Write, Authorization.RoleAssignments.Delete |
| Power Platform Reader                             | c886ad2e-27f7-4874-8381-5849b8d8a090      | /tenants/{0}                                 | *.Read                                                        |
| Power Platform Contributor                        | ff954d61-a89a-4fbe-ace9-01c367b89f87      | /tenants/{0}                                 | *, Cannot change role assignments                                                           |
| Power Platform Owner                              | 0cb07c69-1631-4725-ab35-e59e001c51ea      | /tenants/{0}                                 | *                                                           |

For detailed reference on permissions, roles, and integration:
- [Power Platform API reference](https://learn.microsoft.com/en-us/rest/api/power-platform/)

