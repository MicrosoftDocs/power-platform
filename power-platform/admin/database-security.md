---
title: Role-based security roles for Dataverse
description: Learn about how security roles control access to databases and resources in Microsoft Power Platform environments, including tenant-level, environment-level, and Dataverse roles.
ms.subservice: admin
ms.author: paulliew
author: paulliew
ms.reviewer: sericks
contributors:
  - hamenon-ms
  - shahzorkhan123
ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/23/2026
search.audienceType: 
  - admin
ms.collection:
  - ai-assisted
ms.custom:
  - "admin-security"
  - bap-template
  - sfi-image-nochange
  - sfi-ga-nochange
---

# Role-based security roles for Dataverse

Microsoft Dataverse uses a role-based security model to control access to a database and its resources in an environment. Use security roles to configure access to all resources in an environment or to specific apps and data in the environment. A combination of access levels and permissions in a security role determines which apps and data users can view and how they can interact with those apps and data.

An environment can have no or one Dataverse database. You assign security roles differently for [environments that have no Dataverse database](database-security-configure.md#assign-security-roles-to-users-in-an-environment-that-has-no-dataverse-database) and [environments that have a Dataverse database](database-security-configure.md#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database).

## Understand role types

Microsoft Power Platform uses different types of roles at different scopes. Understanding the distinction helps you identify which role to assign for a given scenario.

| Role type | Examples | Scope | Typical use |
|-----------|---------|-------|-------------|
| **Tenant-level admin roles** | Power Platform administrator, Dynamics 365 administrator, Global Administrator | Entire tenant (all environments) | Manage environments, policies, and platform settings across the organization. Assigned in the Microsoft 365 admin center. |
| **Environment-level roles** | Environment Admin, Environment Maker | Single environment (without Dataverse) | Create and manage resources such as apps, flows, and connections in an environment that doesn't have a Dataverse database. |
| **Dataverse security roles** | System Administrator, System Customizer, Basic User | Single environment (with Dataverse) | Control access to Dataverse tables, apps, and data within an environment that has a Dataverse database. |
| **App-specific roles** | Dynamics 365 Sales roles, Customer Service roles | Single environment (with Dataverse) | Provide access to features in specific Dynamics 365 or Power Platform apps. |

> [!IMPORTANT]
> Tenant-level admin roles such as **Power Platform administrator** and **Dynamics 365 administrator** are assigned in the Microsoft 365 admin center and grant administrative access across environments. However, these roles don't automatically grant Dataverse data access. To work with data in a Dataverse environment, a tenant admin must also be assigned the **System Administrator** Dataverse security role in that specific environment. Learn more in [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

Use this article to understand built-in roles and how they apply to different environment types. To assign roles, see [Configure user security in an environment](database-security-configure.md). If users encounter access errors, see [Troubleshoot user access problems](troubleshooting-user-needs-read-write-access-organization.md).

## Predefined security roles

Environments include predefined security roles that reflect common user tasks. The predefined security roles follow the security best practice of "minimum required access": provide the least access to the minimum business data that a user needs to use an app. These security roles can be assigned to a user, [owner team](manage-teams.md#types-of-teams), and [group team](manage-group-teams.md). The predefined security roles that are available in an environment depend on the environment type and the apps installed in it.

Another set of security roles is assigned to [application users](system-application-users.md). Those security roles are installed by our services and can't be updated.

### Environments without a Dataverse database

Environment Maker and Environment Admin are the only predefined roles for environments that have no Dataverse database. To learn more about what these roles, see the following table.

| Security role |  Description |
|---------|---------|
| Environment Admin | The Environment Admin role can perform all administrative actions on an environment, including:<br/><ul><li>Add or remove a user from either the Environment Admin or Environment Maker role.</li><li>Provision a Dataverse database for the environment. After a database is provisioned, assign the System Customizer role to an Environment Admin to give them access to the environment's data.</li><li>View and manage all resources created in an environment.</li><li>Create [data loss prevention policies](prevent-data-loss.md).</li></ul> |
| Environment Maker |Can create new resources associated with an environment, including apps, connections, custom APIs, and flows using Microsoft Power Automate. However, this role doesn't have privileges to access data in an environment.<br/><br/>Environment makers can also [distribute the apps they build](/powerapps/maker/canvas-apps/share-app) in an environment to other users in your organization. They can share the app with individual users, security groups, or all users in the organization. |

### Environments with a Dataverse database

If the environment has a Dataverse database, a user must be assigned the System Administrator role instead of the Environment Admin role to have full admin privileges.

> [!NOTE]
> The **Environment Admin** role applies only to environments without a Dataverse database. In environments with a Dataverse database, use the **System Administrator** role for full administrative access. Tenant-level roles such as **Power Platform administrator** grant environment management capabilities, but a separate **System Administrator** role assignment is needed to access Dataverse data directly. Learn more in [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

Users who make apps that connect to the database and need to create or update entities must have the System Customizer role in addition to the Environment Maker role. The Environment Maker role doesn't have privileges on the environment's data. These security roles do not have the privileges to create or update security roles. 

The following list provides the predefined security roles in an environment that has a Dataverse database. You can't edit these roles.

- App Opener 
- Basic User 
- Delegate 
- Dynamics 365 Administrator 
- Environment Maker 
- Global Administrator
- Global Reader
- Office Collaborator 
- Power Platform administrator
- Service Deleted 
- Service Reader 
- Service Writer 
- Support User
- System Administrator
- System Customizer 
- Website App Owner
- Website Owner

To learn more about these roles, including their descriptions, who they apply to, and a summary of the table privileges to which they have access, see [Role name and description of a security role](security-roles-privileges.md#role-name-and-description-of-a-security-role).

In addition to the predefined security roles described for Dataverse, other security roles might be available in your environment depending on the Power Platform components&mdash;Power Apps, Power Automate, Microsoft Copilot Studio&mdash;you have. The following table provides links to more information.

| Power Platform component | Information |
|---------|---------|
| Power Apps | [Predefined security roles for environments with a Dataverse database](#environments-with-a-dataverse-database) |
| Power Automate | [Security and privacy ](/power-automate/process-advisor-security) |
| Power Pages | [Roles required for website administration](/power-pages/admin/admin-roles) |
| Microsoft Copilot Studio | [Assign environment security roles](/power-virtual-agents/admin-share-bots#assign-environment-security-roles) |

### Dataverse for Teams environments

Learn more about [predefined security roles in Dataverse for Teams environments](about-teams-environment.md#user-access-to-dataverse-for-teams-environments).

## App-specific security roles

If you deploy Dynamics 365 apps in your environment, other security roles are added. Each app installs its own set of roles that are documented in app-specific articles. The following table provides links to more information.

| Dynamics 365 app | Security role docs  |
|---------|---------|
| Dynamics 365 Sales | [Predefined security roles for Sales](/dynamics365/sales/security-roles-for-sales) |
| Dynamics 365 Marketing | [Security roles added by Dynamics 365 Marketing](/dynamics365/marketing/admin-users-licenses-roles#security-roles-added-by-dynamics-365-marketing) |
| Dynamics 365 Field Service | [Dynamics 365 Field Service roles + definitions](/dynamics365/field-service/view-user-accounts-security-roles#dynamics-365-field-service-roles--definitions) |
| Dynamics 365 Customer Service | [Roles in Omnichannel for Customer Service](/dynamics365/customer-service/add-users-assign-roles#roles-in-omnichannel-for-customer-service) |
| Dynamics 365 Customer Insights | [Customer Insights roles](/dynamics365/customer-insights/permissions) |
| App profile manager | [Roles and privileges associated with app profile manager](/dynamics365/app-profile-manager/security-roles) |
| Dynamics 365 Finance | [Security roles in the public sector](/dynamics365/finance/public-sector/security-roles-public-sector) |
| Finance and operations apps | [Security roles in Microsoft Power Platform](/dynamics365/fin-ops-core/dev-itpro/power-platform/authentication-and-authorization) |

## Summary of resources available to predefined security roles

The following table describes which resources each security role can author.

| Resource | Environment Maker | Environment Admin | System Customizer | System Admin |
|----------|-------------------|-------------------|-------------------|--------------|
| Canvas app | X | X | X | X |
| Cloud flow | X (non&ndash;solution-aware) | X | X | X |
| Connector | X (non&ndash;solution-aware) | X | X | X |
| Connection<sup>*</sup> | X | X | X | X |
| Data gateway | - | X | - | X |
| Dataflow | X | X | X | X |
| Dataverse tables | - | - | X | X |
| Model-driven app | X | - | X | X |
| Solution framework | X | - | X | X |
| Desktop flow<sup>**</sup> | - | - | X | X |
| AI Builder | - | - | X | X |

\*Connections are used in [canvas apps](/power-apps/maker/canvas-apps/add-manage-connections) and [Power Automate](/power-automate/add-manage-connections).

\**Dataverse for Teams users don't get access to desktop flows by default. You need to upgrade your environment to full Dataverse capabilities and acquire [desktop flow license plans](https://powerautomate.microsoft.com/pricing/) to use desktop flows.

## Common issues

The following table describes common security role issues and how to resolve them.

| Symptom | Cause | Resolution |
|---------|-------|------------|
| "One or more commands are unavailable due to your current privileges for this environment" | Your security role doesn't include the privileges required for the action you're trying to perform. | Ask your System Administrator to assign a security role with the required privileges. For solution-related actions, you might need the System Customizer or Environment Maker role. Learn more in [Security roles and privileges](security-roles-privileges.md). |
| Can't access an environment | Your user account doesn't have a security role assigned in that environment, or the environment requires a Dataverse license. | Ask your environment admin or System Administrator to [assign you a security role](assign-security-roles.md). Verify that you have the required [license](../admin/pricing-billing-skus.md). |
| Can't assign or modify security roles | Only users with the System Administrator role or a tenant-level admin role can manage security role assignments. | Contact your organization's System Administrator or Microsoft 365 admin to request role changes. Learn more in [Configure user security in an environment](database-security-configure.md). |
| Can't copy a security role | The security role is a predefined role that can't be edited or copied, or you don't have sufficient privileges. | Verify that you have the System Administrator role. Some predefined roles can't be copied. Try [creating a custom security role](security-roles-privileges.md) instead. |

If these steps don't resolve your issue, see [Troubleshoot user access problems](troubleshooting-user-needs-read-write-access-organization.md) for more scenarios. If you need access changes, contact the appropriate admin:

- **Environment access**: Contact the environment admin or a user with the System Administrator role in that environment.
- **Dataverse table or app access**: Contact a System Administrator in that environment to assign or update your security role.
- **Tenant-wide admin access**: Contact your Microsoft 365 administrator or Global Administrator.

### Related content

- [Assign a security role to a user](assign-security-roles.md)  
- [Security roles and privileges](security-roles-privileges.md)  
- [How access to a record is determined](how-record-access-determined.md)
- [Configure user security in an environment](database-security-configure.md)
- [Troubleshoot user access problems](troubleshooting-user-needs-read-write-access-organization.md)
- [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md)
- [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds)

[!INCLUDE [footer-include](../includes/footer-banner.md)]
