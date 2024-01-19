---
title: Configure user security in an environment
description: Learn how to configure user access to resources in a Microsoft Dataverse environment.
ms.subservice: admin
ms.author: paulliew
author: paulliew
ms.reviewer: sericks
contributors:
  - hamenon-ms 
ms.custom:
  - "admin-security"
  - bap-template
ms.component: pa-admin
ms.topic: how-to
ms.date: 01/02/2024
search.audienceType: 
  - admin
---

# Configure user security in an environment

Microsoft Dataverse uses a role-based security model to control access to a database and its resources in an environment. Use security roles to configure access to all resources in an environment or to specific apps and data in the environment. A combination of access levels and permissions in a security role determines which apps and data users can view and how they can interact with those apps and data.

An environment can have no or one Dataverse database. You assign security roles differently for [environments that have no Dataverse database](#assign-security-roles-to-users-in-an-environment-that-has-no-dataverse-database) and [environments that have a Dataverse database](#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database).

[Learn more about environments in Power Platform](./environments-overview.md).

## Predefined security roles

Environments include predefined security roles that reflect common user tasks. The predefined security roles follow the security best practice of "minimum required access": provide the least access to the minimum business data that a user needs to use an app. These security roles can be assigned to a user, [owner team](manage-teams.md#types-of-teams), and [group team](manage-group-teams.md). The predefined security roles that are available in an environment depend on the environment type and the apps you have installed in it.

Another set of security roles is assigned to [application users](system-application-users.md). Those security roles are installed by our services and can't be updated.

### Environments without a Dataverse database

Environment Maker and Environment Admin are the only predefined roles for environments that have no Dataverse database. These roles are described in the following table.

| Security role |  Description |
|---------|---------|
| Environment Admin | The Environment Admin role can perform all administrative actions on an environment, including:<br/><ul><li>Add or remove a user from either the Environment Admin or Environment Maker role.</li><li>Provision a Dataverse database for the environment. After a database is provisioned, assign the System Customizer role to an Environment Admin to give them access to the environment's data.</li><li>View and manage all resources created in an environment.</li><li>Create [data loss prevention policies](prevent-data-loss.md).</li></ul> |
| Environment Maker |Can create new resources associated with an environment, including apps, connections, custom APIs, gateways, and flows using Microsoft Power Automate. However, this role doesn't have privileges to access data in an environment.<br/><br/>Environment makers can also [distribute the apps they build](/powerapps/maker/canvas-apps/share-app) in an environment to other users in your organization. They can share the app with individual users, security groups, or all users in the organization. |

### Environments with a Dataverse database

If the environment has a Dataverse database, a user must be assigned the System Administrator role instead of the Environment Admin role to have full admin privileges.

Users who make apps that connect to the database and need to create or update entities and security roles must have the System Customizer role in addition to the Environment Maker role. The Environment Maker role doesn't have privileges on the environment's data.

The following table describes the predefined security roles in an environment that has a Dataverse database. You can't edit these roles.

| Security role | Description |
|---------|--------|
| App Opener | Has [minimum privileges for common tasks](create-edit-security-role.md#minimum-privileges-for-common-tasks). This role is primarily used as a template to [create a custom security role](#create-or-configure-a-custom-security-role) for model-driven apps. It doesn't have any privileges to the core business tables, such as Account, Contact, and Activity. However, it has **Organization**-level read access to system tables, such as **Process**, to support reading system-supplied workflows. Note that this security role is used when a [new, custom security role is created](create-edit-security-role.md#create-a-security-role).  |
| Basic User |  For out-of-the-box entities only, can run an app in the environment and perform common tasks on the records they own. It has privileges to the core business tables, such as Account, Contact, and Activity.<br/><br/>**Note**: The Common Data Service **User** security role was renamed **Basic User**. Only the name was changed; user privileges and role assignment are the same. If you have a solution with the Common Data Service **User** security role, you should update the solution before you import it again. Otherwise, you might inadvertently change the security role name back to **User** when you import the solution. |
| Delegate | Allows code to [*impersonate*, or run as, another user](/powerapps/developer/common-data-service/impersonate-another-user). Typically used with another security role to allow access to records. |
| Dynamics 365 Administrator | *Dynamics 365 administrator* is a Microsoft Power Platform service admin role. This role can do admin functions on Microsoft Power Platform because they have the system administrator role.  |
| Environment Maker | Can create new resources associated with an environment, including apps, connections, custom APIs, gateways, and flows using Microsoft Power Automate. However, this role doesn't have any privileges to access data in an environment.<br/> <br/>Environment makers can also [distribute the apps they build](/powerapps/maker/canvas-apps/share-app) in an environment to other users in your organization. They can share the app with individual users, security groups, or all users in the organization. |
| Global Administrator | *Global administrator* is a Microsoft 365 administrator role. A person who purchases the Microsoft business subscription is a global administrator and has unlimited control over products in the subscription and access to most data. |
| Global Reader | The [Global Reader](/azure/active-directory/roles/permissions-reference) role isn't supported yet in the Power Platform admin center. |
| Office Collaborator |Has Read permission to tables in which a record was shared with the organization. Doesn't have access to any other core and custom table records. This role is assigned to the Office Collaborators owner team and not to an individual user. |
| Power Platform administrator | *Power Platform administrator* is a Microsoft Power Platform service administrator role. This role can perform admin functions on Microsoft Power Platform because they have the system administrator role. |
| Service Deleted | Has full Delete permission to all entities, including custom entities. This role is primarily used by the service and requires deleting records in all entities. **This role can't be assigned to a user or team.** |
| Service Reader | Has full Read permission to all entities, including custom entities. This role is primarily used by the service and requires reading all entities. **This role can't be assigned to a user or team.** |
| Service Writer |  Has full Create, Read, and Write permission to all entities, including custom entities. This role is primarily used by the service and requires creating and updating records. **This role can't be assigned to a user or team.** |
| Support User |  Has full Read permission to customization and business management settings, which allow support staff to troubleshoot environment configuration issues. This role doesn't have access to core records. **This role can't be assigned to a user or team.** |
| System Administrator |Has full [permission to customize](/power-apps/maker/model-driven-apps/privileges-required-customization) or administer the environment, including creating, modifying, and assigning security roles. Can view all data in the environment. |
| System Customizer | Has full [permission to customize the environment](/power-apps/maker/model-driven-apps/privileges-required-customization). Can view all custom table data in the environment. However, users with this role can only view records that they create in Account, Contact, Activity tables. |
| Website App Owner | A user who owns the [website application registration](/azure/active-directory/develop/quickstart-register-app) in the [Azure portal](https://ms.portal.azure.com/). |
|Website Owner  | The user who created the Power Pages website. **This role is managed and can't be changed.** |

In addition to the predefined security roles described for Dataverse, other security roles might be available in your environment depending on the Power Platform components&mdash;Power Apps, Power Automate, Power Virtual Agents&mdash;you have. The following table provides links to more information.

| Power Platform component | Information |
|---------|---------|
| Power Apps | [Predefined security roles for environments with a Dataverse database](#environments-with-a-dataverse-database) |
| Power Automate | [Security and privacy ](/power-automate/process-advisor-security) |
| Power Pages | [Roles required for website administration](/power-pages/admin/admin-roles) |
| Power Virtual Agents | [Assign environment security roles](/power-virtual-agents/admin-share-bots#assign-environment-security-roles) |

### Dataverse for Teams environments

[Learn more about predefined security roles in Dataverse for Teams environments](about-teams-environment.md#user-access-to-dataverse-for-teams-environments).

## App-specific security roles

If you deploy Dynamics 365 apps in your environment, other security roles are added. The following table provides links to more information.

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

|Resource  |Environment Maker  |Environment Admin  |System Customizer  |System Admin  |
|---------|---------|---------|---------|---------|
|Canvas app     |X         |X         |X        |X         |
|Cloud flow     |X (non&ndash;solution-aware)         |X         |X         |X         |
|Connector     |X (non&ndash;solution-aware)         |X         |X         |X         |
|Connection<sup>*</sup>     |X         |X         |X         |X         |
|Data gateway     |X         |X         |-         |X         |
|Dataflow     |X         |X         |-         |X         |
|Dataverse tables     |-         |-         |X         |X         |
|Model-driven app     |X        |-         |X         |X         |
|Solution framework     |X         |-         |X         |X         |
|Desktop flow<sup>**</sup>     |-         |-         |X         |X         |
|AI Builder     |-         |-         |X         |X         |

\*Connections are used in [canvas apps](/power-apps/maker/canvas-apps/add-manage-connections) and [Power Automate](/power-automate/add-manage-connections).

\**Dataverse for Teams users don't get access to desktop flows by default. You need to upgrade your environment to full Dataverse capabilities and acquire [desktop flow license plans](https://powerautomate.microsoft.com/pricing/) to use desktop flows.

## Assign security roles to users in an environment that has no Dataverse database

For environments with no Dataverse database, a user who has the Environment Admin role in the environment can assign security roles to individual users or groups from Microsoft Entra ID.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** > [select an environment].

1. In the **Access** tile, select **See all** for **Environment admin** or **Environment maker** to add or remove people for either role.

    :::image type="content" source="media/assign-security-role-nodb.png" alt-text="Screenshot of selecting a security role in the Power Platform admin center.":::

1. Select **Add people**, and then specify the name or email address of one or more users or groups from Microsoft Entra ID.

    :::image type="content" source="media/assign-security-role-nodb-action.png" alt-text="Screenshot of adding users to the Environment Maker role in the Power Platform admin center.":::

1. Select **Add**.

## Assign security roles to users in an environment that has a Dataverse database

Security roles can be assigned to individual users, [owner teams](manage-teams.md#types-of-teams), and [Microsoft Entra group teams](manage-group-teams.md). Before you assign a role to a user, [verify the user's account has been added to and is enabled in the environment](troubleshooting-user-needs-read-write-access-organization.md).

In general, a security role can only be assigned to users whose accounts are enabled in the environment. To assign a security role to a user account that's disabled in the environment, turn on **allowRoleAssignmentOnDisabledUsers** in OrgDBOrgSettings.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** > [select an environment].

1. In the **Access** tile, select **See all** under **Security roles**.

    :::image type="content" source="media/see-all-security-roles.png" alt-text="Screenshot of the option to view all security roles in the Power Platform admin center.":::

1. Make sure the correct business unit is selected in the list, and then select a role from the list of roles in the environment.

1. Select **Add people**, and then specify the name or email address of one or more users or groups from Microsoft Entra ID.

1. Select **Add**.

## Create, edit, or copy a security role using the new, modern UI

You can easily create, edit, or copy a security role and customize it to meet your needs.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Environments** in the navigation pane, and then select an environment.

1. Select **Settings**.

1. Expand **Users + Permissions**.

1. Select **Security roles**.

1. Complete the appropriate task:

    - [Create a security role](#create-a-security-role)
    - [Edit a security role](#edit-a-security-role)
    - [Copy a security role](#copy-a-security-role)

### Create a security role

1. Select **New role** from the command bar.

1. In the **Role Name** field, enter a name for the new role.

1. In the **Business unit** field, select the business unit the role belongs to.

1. Select whether team members should inherit the role.

    If this setting is enabled and the role is assigned to a team, all team members inherit all the privileges associated with the role.

1. Select **Save**.

1. [Define the privileges and properties of the security role](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).

### Edit a security role

Either select the role name or select the row and then select **Edit.** Then [define the privileges and properties of the security role](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).

Some predefined [security roles can't be edited](database-security.md#environments-with-a-dataverse-database). If you try to edit these roles, the **Save** and **Save + Close** buttons aren't available.

### Copy a security role

Select the security role and then select **Copy**. Give the role a new name. [Edit the security role](#edit-a-security-role) as needed.

Only the privileges are copied, not any assigned members and teams.

### Audit security roles

[Audit security roles](audit-security-roles.md) to better understand changes made to security in your Power Platform environment.

## Create or configure a custom security role

If your app uses a custom entity, its privileges must be explicitly granted in a security role before your app can be used. You can either add these privileges in an existing security role or create a custom security role.

Every security role must include a [minimum set of privileges](#minimum-privileges-to-run-an-app). [Learn more about security roles and privileges](security-roles-privileges.md).

> [!TIP]
> The environment might maintain records that can be used by multiple apps. You might need multiple security roles that grant different privileges. For example:
>
> - Some users (call them Editors) might only need to read, update, and attach other records, so their security role will have read, write, and append privileges.
> - Other users might need all the privileges that Editors have plus the ability to create, append to, delete, and share. The security role for these users will have create, read, write, append, delete, assign, append to, and share privileges.

### Create a custom security role with minimum privileges to run an app

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Environments** in the navigation pane, and then select an environment.

1. Select **Settings** > **Users + permissions** > **Security roles**.

1. Select the **App Opener** role, and then select **Copy**.

1. Enter the name of the custom role, and then select **Copy**.

1. In the list of security roles, select the new role, and then select **More actions** (**&hellip;**) > **Edit**.

1. In the role editor, select the **Custom Entities** tab.

1. Find your custom table in the list, and select the **Read**, **Write**, and **Append** privileges.

1. Select **Save and Close**.

### Create a custom security role from scratch

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Environments** in the navigation pane, and then select an environment.

1. Select **Settings** > **Users + permissions** > **Security roles**.

1. Select **New role**.

1. Enter the name of the new role on the **Details** tab.

1. On the other tabs, find your entity and then select actions and the scope for performing them.

1. Select a tab, and search for your entity. For example, select the **Custom Entities** tab to set permissions on a custom entity.

1. Select the privileges **Read**, **Write**, **Append**.

1. Select **Save and Close**.

## Minimum privileges to run an app

When you create a custom security role, the role must have a set of minimum privileges for a user to run an app. [Learn more about required minimum privileges](create-edit-security-role.md#minimum-privileges-for-common-tasks).

### See also

[Grant users access](grant-users-access.md)  
[Control user access to environments: security groups and licenses](control-user-access.md)  
[How access to a record is determined](how-record-access-determined.md)

[!INCLUDE [footer-include](../includes/footer-banner.md)]
