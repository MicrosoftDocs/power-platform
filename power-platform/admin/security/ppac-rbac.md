---
title: What is Power Platform role-based access control (RBAC)?
description: Overview of RBAC in Microsoft Power Platform. Learn how to use role assignments to control access to Power Platform resources, and how this works with Security Hub in the Power Platform Admin Center (PPAC), APIs, and SDK.
author: laneswenka
manager: zoraz
ms.service: powerplatform-admin
ms.topic: overview
ms.date: 01/09/2026
ms.author: laswenka
---

# What is Power Platform role-based access control (RBAC) (preview)?

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Role-based access control (RBAC) in Microsoft Power Platform is a system that helps organizations securely manage "who can do what" across Power Platform resources. With RBAC, you control:
- Who has access to Power Platform resources
- What actions they can perform
- Which scopes (tenants, environment groups, specific environments) they have access to

RBAC for Power Platform is integrated at the Power Platform API layer, which represents the customer management plane.  The data plane, also known as Dataverse, comes with its own rich and customizable RBAC framework for accessing business critical data inside of a given Power Platform environment.

## What can I do with Power Platform RBAC?

Here are common scenarios for Power Platform RBAC:

- Assign a user to manage all environments in a business unit (environment group)
- Allow certain admins to create or manage environments but not environment groups
- Grant an external person or team with read-only access to licensing and storage reporting
- Allow automation tools to operate on certain resources using service principals

## How Power Platform RBAC works

Access is controlled by assigning Power Platform roles. A role assignment includes:
- **Security principal**: User, group, or service principal
- **Role definition**: Built-in roles describing allowed actions
- **Scope**: Tenant, environment group, or individual environment

### Security principal

A *security principal* in Power Platform can be:
- A user (individual)
- A group (such as those synchronized from Microsoft Entra ID)
- A service principal (for automation via API/SDK)

> Role assignments to groups are transitive; members inherit permissions of their group assignments.

### Role definition

A *role definition* is a collection of permissions for Power Platform actions. Examples:
- Environment Admin: Full manage access at environment scope
- Maker: Can create/edit resources (apps, flows)
- Read-only Auditor: Can view but not edit
- Environment Group Admin: Manage groups of environments

Power Platform provides a range of built-in roles, custom roles are not possible at this time.

### Scope

*Scope* limits where a role applies. Power Platform RBAC supports these scope levels:
- **Tenant**: Top-most scope (whole organization)
- **Environment group**: Logical grouping of environments
- **Environment**: Single instance of a Power Platform environment (dev, test, prod, etc.)

Role assignments at a higher scope (e.g., tenant) are inherited by lower scopes (e.g., all environments in all groups, unless overridden).

### Role assignments

A *role assignment* links a security principal (user/group/service principal), a role definition, and a scope (tenant, group, or environment).

Example: Assigning the "Environment Admin" role to a user for a specific environment group. That user can manage all environments in that group but has no permissions elsewhere.

Role assignments can be managed using:
- The Security Hub in the Power Platform Admin Center (PPAC)
- Power Platform APIs (e.g., /providers/Microsoft.PowerPlatform/roleAssignments)
- Power Platform SDKs

## Multiple role assignments and inheritance

RBAC permissions are additive. Having multiple assignments (e.g., Environment Admin for one environment, Maker for another) gives the union of all permissions.

Group assignments are inherited by all group/environment members. Assigning roles at the tenant level cascades down to groups/environments
unless overridden by a more specific (lower-scope) assignment.

## How access is evaluated

When a user or service principal attempts an action in PPAC, Power Platform evaluates role assignments to determine access:
1. Collect all role assignments for the principal (including group memberships)
2. Check for matching assignments at the most specific scope
3. Sum the effective permissions
4. If conditions on role assignments are present (e.g., if time- or resource-limited), ensure they're met
5. Allow or deny the action accordingly

## Managing RBAC assignments in Power Platform

You can assign and manage Power Platform RBAC via:
### Security Hub in PPAC
- Use the graphical UI in PPAC > Security Hub > RBAC to create, modify, remove assignments
- Filter by principal, role, or scope
- Audit changes and view effective permissions

### API and SDK
- Use administrative APIs for automated/declarative RBAC management
- Assign roles to security principals via scripting (PowerShell, CLI, REST, or supported SDKs)
- Integrate RBAC checks/updates into CI/CD processes

## Where is Power Platform RBAC data stored?

Role definitions and assignments are stored centrally for the tenant and replicated as needed across Power Platform regions, ensuring global, reliable access and enforcement.

## License requirements

A Power Platform tenant license (with appropriate administrative SKUs) is generally required to manage RBAC. Availability of certain role types or scopes may depend on license tier.

## Next steps

- Visit Power Platform Admin Center, try Security Hub role assignments
- Explore the Power Platform administration API documentation
- Review built-in roles and define your organization's custom RBAC policy for environments, groups, and tenants
