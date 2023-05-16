---
title: Configure user security in an environment | Microsoft Docs
description: This article explains how to create the security artifacts that you must have to help secure resources in an environment.
ms.subservice: admin
ms.author: paulliew
author: paulliew
ms.reviewer: sericks
contributors:
  - hamenon-ms 
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/16/2023
search.audienceType: 
  - admin
---

# Configure user security to resources in an environment

Microsoft Dataverse uses a role-based security model to help secure access to the database. This article explains how to create the security artifacts that you must have to help secure resources in an environment. Security roles can be used to configure environment-wide access to all resources in the environment, or to configure access to specific apps and data in the environment. Security roles control a user's access to an environment's resources through a set of access levels and permissions. The combination of access levels and permissions that are included in a specific security role governs the limitations on the user's view of apps and data, and on the user's interactions with that data. 

An environment can have zero or one Dataverse database. The process for assigning security roles for environments that have no Dataverse database differs from that for an environment that does have a Dataverse database. 

## Predefined security roles 

Environments include predefined security roles that reflect common user tasks with access levels defined to match the security best-practice goal of providing access to the minimum amount of business data required to use the app. 

These security roles can be assigned to the user, [owner team](manage-teams.md#types-of-teams) and [group team](manage-group-teams.md). 

There is another set of security roles that is assigned to [application users](system-application-users.md). Those security roles are installed by our services and cannot be updated.

> [!IMPORTANT]
> The predefined security roles that are available in your environment depend on the environment type and the apps you have installed in your environment. Read on to know about all the predefined security roles available in an environment.

### Environments without a Dataverse database

Environment Maker and Environment Admin are the only predefined roles for environments that have no Dataverse database. These roles are defined in the following table.

| Security role  | Database privileges*  | Description |
|---------|---------|---------|
| Environment Admin     |  Create, Read, Write, Delete, Customizations, Security Roles       | The Environment Admin role can perform all administrative actions on an environment, including the following: <br /><ul><li>Add or remove a user from either the Environment Admin or Environment Maker role.</li><li>Provision a Dataverse database for the environment. After a database is provisioned, the System Customizer role should also be assigned to an Environment Admin to give them access to the environment's data.</li><li>View and manage all resources created within an environment.</li><li>Set data loss prevention policies. More information: [Data loss prevention policies](prevent-data-loss.md)</li></ul>    |
| Environment Maker     |  Customizations       | Can create new resources associated with an environment, including apps, connections, custom APIs, gateways, and flows using Microsoft Power Automate. However, this role doesn't have any privileges to access data within an environment. More information: [Environments overview](./environments-overview.md) <br /><br />Environment makers can also distribute the apps they build in an environment to other users in your organization. They can share the app with individual users, security groups, or all users in the organization. More information: [Share an app in Power Apps](/powerapps/maker/canvas-apps/share-app)        |

*The scope of these privileges is global, unless specified otherwise.

### Environments with a Dataverse database

If the environment has a Dataverse database, a user must be assigned the System Administrator role instead of the Environment Admin role for full admin privileges, as described in the following table. 

For users who make apps that connect to the database and need to create or update entities and security roles, you need to assign the System Customizer role in addition to the Environment Maker role. This is necessary because the Environment Maker role doesn't have privileges on the environment's data. 

| Security role  | Database privileges*  | Description |
|---------|---------|---------|
| App Opener | Create (self), Read, Write (self), Delete (self)  | Has [minimum privileges for common tasks](create-edit-security-role.md#minimum-privileges-for-common-tasks). This is primarily used when creating a new security role for model-driven apps, where a copy of the role is created before applying data access to your tables. It doesn't have any privileges to the core business tables, such as Account, Contact, and Activity. This role is protected and cannot be updated.    |
| Basic User   |  Read (self), Create (self), Write (self), Delete (self)       | Can run an app within the environment and perform common tasks for the records that they own. Note that this only applies to non-custom entities. It has privileges to the core business tables, such as Account, Contact, and Activity.  More information: [Create or configure a custom security role](#create-or-configure-a-custom-security-role) <br /><br />  **Note**: The Common Data Service User security role was renamed to Basic User. There is no action required - this is just a name change, and it doesn't impact the user privileges or role assignment.  If you have a solution with the Common Data Service User security role, you can inadvertently update the security role name back to Common Data Service User when you import the solution. Please update the solution before re-importing.|
| Delegate     | Act on behalf of another user        | Allows code to *impersonate*, or run as another user.  Typically used with another security role to allow access to records. More information: [Impersonate another user](/powerapps/developer/common-data-service/impersonate-another-user)        |
| Environment Maker     |  Customizations       | Can create new resources associated with an environment, including apps, connections, custom APIs, gateways, and flows using Microsoft Power Automate. However, this role doesn't have any privileges to access data within an environment. More information: [Environments overview](./environments-overview.md) <br /> <br />Environment makers can also distribute the apps they build in an environment to other users in your organization. They can share the app with individual users, security groups, or all users in the organization. More information: [Share an app in Power Apps](/powerapps/maker/canvas-apps/share-app)       |
| Global Reader  |   | The [Global Reader](/azure/active-directory/roles/permissions-reference) role is not yet supported in the Power Platform admin center.  |
| Office Collaborator | Read (self) | Has Read permission to tables where a record from these tables was shared with the organization. Does not have access to any other core and custom table records. This role is assigned to the Office Collaborators owner team and not to an individual user.   |
| Service Reader | Read | Has full Read permission to all entities including custom entities. This is primarily used by backend service that requires reading all entities.    |
| Service Writer | Create, Read, Write | Has full Create, Read, and Write permission to all entities including custom entities. This is primarily used by backend service that requires creating and updating records.    |
| Support User | Read Customizations, Read Business Management settings      | Has full Read permission to customization and business management settings to allow Support staff to troubleshoot environment configuration issues. Does not have access to core records.      |
| System Administrator     |  Create, Read, Write, Delete, Customizations, Security Roles       | Has full permission to customize or administer the environment, including creating, modifying, and assigning security roles. Can view all data in the environment. More information: [Privileges required for customization](/power-apps/maker/model-driven-apps/privileges-required-customization)        |
| System Customizer     | Create, Read, Write, Delete, Customizations         | Has full permission to customize the environment. Can view all custom table data in the environment. However, users with this role can only view rows (records) that they create in Account, Contact, Activity tables. More information: [Privileges required for customization](/power-apps/maker/model-driven-apps/privileges-required-customization)        |

*The scope of these privileges is global, unless specified otherwise.

In addition to the predefined security roles listed above for Dataverse, there might be other security roles available in your environment depending on the Power Platform components (Power Apps, Power Automate, Power Virtual Agents) you have. 

|Power Platform component  | Information  |
|---------|---------|
|Power Apps     |    [Predefined security roles for environments with a Dataverse database](#environments-with-a-dataverse-database)    |
|Power Automate     |  [Security and privacy ](/power-automate/process-advisor-security)   |
|Power Pages  | [Roles required for website administration](/power-pages/admin/admin-roles)  |
|Power Virtual Agents     |   [Assign environment security roles](/power-virtual-agents/admin-share-bots#assign-environment-security-roles) |

### Dataverse for Teams environments 

For information on Dataverse for Teams environment security roles, see [User access to Dataverse for Teams environments](about-teams-environment.md#user-access-to-dataverse-for-teams-environments).

## App-specific security roles 

If you deploy Dynamics 365 apps in your environment, such as Dynamics 365 Sales or Dynamics 365 Field Service,  additional security roles get added as a result of deploying these apps. For information about these additional security roles, see the respective apps’ documentation:

|Dynamics 365 app  |Security role docs  |
|---------|---------|
| Dynamics 365 Sales     | [Predefined security roles for Sales](/dynamics365/sales/security-roles-for-sales)        |
| Dynamics 365 Marketing  |  [Security roles added by Dynamics 365 Marketing](/dynamics365/marketing/admin-users-licenses-roles#security-roles-added-by-dynamics-365-marketing)   |
| Dynamics 365 Field Service     | [Dynamics 365 Field Service roles + definitions ](/dynamics365/field-service/view-user-accounts-security-roles#dynamics-365-field-service-roles--definitions)  |
| Dynamics 365 Customer Service    | [Roles in Omnichannel for Customer Service](/dynamics365/customer-service/add-users-assign-roles#roles-in-omnichannel-for-customer-service)  |
| Dynamics 365 Customer Insights        | [Customer Insights roles](/dynamics365/customer-insights/permissions)        |
| App profile manager        | [Roles and privileges associated with app profile manager](/dynamics365/app-profile-manager/security-roles)        |
| Dynamics 365 Finance | [Security roles in the public sector](/dynamics365/finance/public-sector/security-roles-public-sector)   |
| Finance and operations apps | [Security roles in Microsoft Power Platform](/dynamics365/fin-ops-core/dev-itpro/power-platform/authentication-and-authorization)  |

## Summary of resources available for predefined security roles 
The following table describes which resources can be authored by each security role.

|Resource  |Environment Maker  |Environment Admin  |System Customizer  |System Admin  |
|---------|---------|---------|---------|---------|
|Canvas app     |X         |X         |X        |X         |
|Cloud flow     |X (non-solution aware)         |X         |X (solution aware)         |X         |
|Connector     |X (non-solution aware)         |X         |X         |X         |
|Connection     |X         |X         |X         |X         |
|Data gateway     |X         |X         |-         |X         |
|Dataflow     |X         |X         |-         |X         |
|Dataverse tables     |-         |-         |X         |X         |
|Model-driven app     |X        |-         |X         |X         |
|Solution framework     |X         |-         |X         |X         |
|<sup>*</sup>Desktop flow     |X         |X         |X         |X         |
|AI Builder     |-         |-         |X         |X         |

<sup>*</sup>Dataverse for Teams users don’t get access to desktop flows by default. You need to upgrade your environment to full Dataverse capabilities and acquire [Desktop flow license plans](https://powerautomate.microsoft.com/pricing/) in order to use desktop flows.

## Assign security roles to users in an environment that has no Dataverse database 

For environments with no Dataverse database, security roles can be assigned to individual users or groups from Azure AD. A user who has the Environment Admin role in the environment can take these steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments** > [select an environment].

3. In the **Access** tile, select **See all** for **Environment admin** or **Environment maker** to add or remove people for either role.

   > [!div class="mx-imgBorder"] 
   > ![Choose a role.](media/assign-security-role-nodb.png "Choose a role")

4. Select **Add people**, and then specify the name or email address of one or more users or groups from Azure AD to assign this role to.

   > [!div class="mx-imgBorder"] 
   > ![Select an action.](media/assign-security-role-nodb-action.png "Select an action")

## Assign security roles to users in an environment that has a Dataverse database 

Security roles can be assigned to [owner teams](manage-teams.md#types-of-teams) and [Azure AD group teams](manage-group-teams.md), in addition to individual users. Before assigning a role to a user, [verify that the user is present in the environment in Enabled status](troubleshooting-user-needs-read-write-access-organization.md). [Add the user to the environment](add-users-to-environment.md) or [fix their status to become Enabled](troubleshooting-user-needs-read-write-access-organization.md) before assigning a role to them. You'll be able to assign a role as part of the process of adding the user. 

In general, a security role can only be assigned to users who have Enabled status. But if you need to assign a security role to users in the Disabled state, you can do so by enabling **allowRoleAssignmentOnDisabledUsers** in OrgDBOrgSettings. 

To add a security role to an owner team, group team, or a user who has Enabled status in an environment: 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments** > [select an environment]. 

3. In the **Access** tile, select **See all** under Security roles.

   > [!div class="mx-imgBorder"] 
   > ![See all security roles.](media/see-all-security-roles.png "See all security roles")

4. Make sure the right Business unit is selected from the dropdown, and select a role from the list of roles in the environment.

   > [!div class="mx-imgBorder"] 
   > ![Select Business unit.](media/security-role-business-unit.png "Select Business unit")

5. Select **Add people** to add a user, owner team, or group team to the role. If you do not find a user or team to assign the role to, make sure the user or team is present in the environment and the user has Enabled status before assigning a role to them. 

   > [!div class="mx-imgBorder"] 
   > ![Add people.](media/security-role-add-people.png "Add people")

## Create, edit, or copy a security role using the new, modern UI (preview)
You can easily create, edit, or copy a security role and customize it to meet your needs.

> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]
> 
> This capability is in process of rolling out, and may not be available in your region yet.

1.  Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2.  Select **Environments** in the navigation pane.
3.  Select the check mark next to the environment you want to use.
4.  Select **Settings**.
5.  Expand **Users + Permissions**.
6.  Select **Security roles (Preview)**. A list of the existing security roles in your environment is displayed.
7.  Complete the appropriate task:
    - [Create a new security role](#create-a-new-security-role)
    - [Edit an existing security role](#edit-an-existing-security-role)
    - [Copy a security role](#copy-a-security-role)

#### Create a new security role

1. Select **New role** from the command bar. The **Create New Role** pane appears.
2. In the **Role Name** field, enter a name for the new role.
3. In the **Business unit** field, select the corresponding business unit the role will belong to.
4. Indicate if team members should inherit the role. If enabled and the role is assigned to a team, all team members will inherit all the privileges associated with this role.
5. Select **Save** to save the role.
6. [Define the privileges and properties of the security role](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).

#### Edit an existing security role

To edit an existing security role, either select the role name, or select the row and choose **Edit.** Then [define the privileges and properties of the security role](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).

#### Copy a security role

Select the security role and choose copy. You will need to give the role a new name. Note that only the privileges will be copied, the assigned members and teams will not be assigned to the copied role. [Edit the security role](#edit-an-existing-security-role), as needed.

#### Audit security roles
[Audit security roles](audit-security-roles.md) to better understand changes made to security in your Power Platform environment.

## Create or configure a custom security role 

If your app uses a custom entity, its privileges must be explicitly granted in a security role before your app can be used. You can either add these privileges in an existing security role or create a custom security role.

> [!NOTE]
> Every security role must include a minimum set of privileges before it can be used. These are described [later in this article](#minimum-privileges-to-run-an-app). 

> [!TIP]
> The environment might maintain the records that can be used by multiple apps; therefore, you might need multiple security roles to access the data by using different privileges. For example: 
> - Some users (call them Type A) might only need to read, update, and attach other records, so their security role will have read, write, and append privileges. 
> - Other users might need all the privileges that Type A users have, plus the ability to create, append to, delete, and share. The security role for these users will have create, read, write, append, delete, assign, append to, and share privileges. 

For more information about access and scope privileges, see [Security roles and privileges](security-roles-privileges.md). 

### Create a custom security role with minimum privileges to run an app
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and select **Environments** in the navigation pane.
2. Select the environment for which you want to create a security role.
3. Select **Settings** in the action bar.
4. Select **Users + permissions** > **Security roles**.
5. Select the check mark next to the **App Opener** role.
6. Select **Copy** on the action bar.
7. Enter a role name for your custom role, and then select **Copy**.
8. From the list of security roles, locate your newly created custom role.
9. Select the check mark next to your custom role.
10. Select the **More actions** (**...**) icon, and then select **Edit**.
11. In the role editor, select the **Custom Entities** tab to set permissions on your custom table.
12. Find your custom table in the list, and select the **Read**, **Write**, and **Append** privileges.
13. Select **Save and Close**.

### Create a customer security role from scratch

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and select **Environments** in the navigation pane.
2. Select the environment for which you want to create a security role.
3. Select **Settings** in the action bar.
4. Select **Users + permissions** > **Security roles**.
5. Select **New role** on the action bar.
6. From the security role designer, enter a role name on the **Details** tab. From the other tabs, you'll select the actions and the scope for performing that action.
7. Select a tab, and search for your entity. For example, select the **Custom Entities** tab to set permissions on a custom entity.
8. Select the privileges **Read**, **Write**, **Append**.
9. Select **Save and Close**.

## Minimum privileges to run an app
When you create a custom security role, the role must have a set of minimum privileges in order for a user to run an app. We've created a solution you can import that provides a security role that includes the [required minimum privileges.](create-edit-security-role.md#minimum-privileges-for-common-tasks) 


### See also
[Grant users access](grant-users-access.md) <br />
[Control user access to environments: security groups and licenses](control-user-access.md) <br />
[How access to a record is determined](how-record-access-determined.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
