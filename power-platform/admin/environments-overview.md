---
title: Power Platform environments overview
description: Learn about Power Platform environments and how to use them.
author: sericks007
ms.topic: conceptual
ms.date: 04/24/2025
ms.reviewer: sericks
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
contributors:
  - marcelbf
ms.contributors:
- iyanni
---
# Power Platform environments overview

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

A *Power Platform environment* is a space to store, manage, and share your organization's business data, apps, chatbots, and flows. It also serves as a container to separate apps that might have different roles, security requirements, or target audiences. How you choose to use environments depends on your organization and the apps you're trying to build. For example:

- You can choose to only build your apps or chatbots in a single environment.
- You might create separate environments that group the test and production versions of your apps or chatbots.
- You might create separate environments that correspond to specific teams or departments in your company, each containing the relevant data and apps for each audience.
- You might also create separate environments for different global branches of your company.  

## Scope of environments

Each environment is created under a Microsoft Entra tenant, and its resources can only be accessed by users within that tenant. An environment is also bound to a geographic location, like the United States. When you create an app in an environment, that app is routed only to datacenters in that geographic location. Any items that you create in that environment (including chatbots, connections, gateways, flows using Microsoft Power Automate, and more) are also bound to their environment's location.

Every environment can have zero or one Microsoft Dataverse database, which provides storage for your apps and chatbots. Whether you can create a database for your environment depends on the license you purchase for Power Apps and your permissions within that environment. More information: [Pricing info](pricing-billing-skus.md)

When you create an app in an environment, that app is only permitted to connect to the data sources that are also deployed in that same environment, including connections, gateways, flows, and Dataverse databases. For example, consider a scenario where you've created two environments named Test and Dev, and created a Dataverse database in each of the environments. If you create an app in the Test environment, it only is permitted to connect to the Test database; it isn't able to connect to the 'Dev' database.

You can also move resources between environments. More information: [Migrate resources](/powerapps/maker/data-platform/export-solutions)

![The Contoso Corporation tenant encompasses three environments, each of which has its own apps, flows, and Dataverse database.](./media/environments-overview/Environments.png "The Contoso Corporation tenant encompasses three environments, each of which has its own apps, flows, and Dataverse database")

## Environment roles

Environments have two built-in roles that provide access to permissions within an environment:

- The *Environment Admin* role can perform all administrative actions on an environment, including the following:
  - Add or remove a user or group from either the Environment Admin or Environment Maker role.
  - Provision a Dataverse database for the environment.
  - View and manage all resources created within the environment.
  - Set data loss prevention policies. More information: [Manage data loss prevention policies](prevent-data-loss.md)<br />
  After creating the database in the environment, you can use the System Administrator role instead of the Environment Admin role.
- The *Environment Maker* role can create resources within an environment including apps, connections, custom connectors, and flows using Power Automate.

Environment makers can also distribute the apps they build in an environment to other users in your organization by sharing the app with individual users, security groups, or all users in the organization. More information: [Share an app in Power Apps](/powerapps/maker/canvas-apps/share-app)

Users or groups assigned to these environment roles aren't automatically given access to the environment's database (if it exists) and must be given access separately.

Users or security groups can be assigned to either of these two roles by an environment admin by following the steps described in [Configure user security to resources in an environment](database-security.md).

## Early release cycle environments

You can create environments in a subset of regions that get features early, that is, before any standard release environments get them. 

The ability to validate your scenarios before business-critical environments are updated is a great way to discover new capabilities and catch any updates that may impact your scenarios. See [Create and manage environments in the Power Platform admin center](create-environment.md) to learn how to create early release environments.

## Environment types

There are multiple types of environments. The type indicates the purpose of the environment and determines its characteristics. The following table summarizes the current types of environments that you might encounter.

|Type  |Description  |Security  |
|---------|---------|---------|
|Production  |  This is intended to be used for permanent work in an organization. It can be created and owned by an administrator or anyone with a Power Apps license, provided there's 1&nbsp;GB available database capacity. These environments are also created for each existing Dataverse database when it's upgraded to version 9.0 or later. Production environments are what you should use for any environments on which you depend.     | Full control.     |
|Default   | These are a special type of production environment. Each tenant has a default environment that's created automatically. Its characteristics are discussed in the following section, [The default environment](#default-environment)   |  Limited control. All licensed users<sup>1</sup> have the environment maker role.     |
|Sandbox  | These are nonproduction environments, which offer features like copy and reset. Sandbox environments are used for development and testing, separate from production. Provisioning sandbox environments can be restricted to admins (because production environment creation can be blocked), but converting from a production to a sandbox environment can't be blocked.     | Full control. If used for testing, only user access is needed. Developers require environment maker access to create resources.    |
|Trial    | Trial environments are intended to support short-term testing needs and are automatically cleaned up after a short period of time. They expire after 30 days and are limited to one per user. Provisioning trial environments can be restricted to admins.    |  Full control.    |
| Developer | Developer environments are created by users who have the Developer Plan license. They're special environments intended only for use by the owner. Provisioning developer environments can be restricted to admins. More information: [Control environment creation](control-environment-creation.md#developer-environments). The developer environment is available as long as you actively use the Power Apps Developer Plan. More information: [Power Apps Developer Plan](/powerapps/maker/developer-plan)     |  Limited control.  Security groups can't be assigned to developer environments. |
| Microsoft Dataverse for Teams |  Dataverse for Teams environments are automatically created for the selected team when you create an app in Teams using the app for the first time or install an app from the app catalog. More information: [About the Dataverse for Teams environment](about-teams-environment.md)</a>.     |  Limited control. Admins have limited settings available for Teams environments. No customizations of security role or assignments are available. Teams members are automatically mapped to their Teams membership type - owners, members, and guests - with a corresponding security role assigned by the system.    |

<sup>1</sup>Users licensed for Power Apps, Power Automate, Microsoft 365, and Dynamics 365, standalone licenses, and free and trial licenses.

## Default environment

A single default environment is automatically created by Power Apps for each tenant and shared by all users in that tenant. Whenever a new user signs up for Power Apps, they're automatically added to the Maker role of the default environment. No users are automatically added to the Environment Admin role of the default environment. The default environment is created in the region closest to the default region of the Microsoft Entra tenant, and is named as follows: "{Microsoft Entra tenant name} (default)".

You can't delete the default environment. You can't manually back up the default environment; system backups are done continuously.

The default environment is limited to 1 TB of storage capacity. To store more data, you can create a production environment. The default environment has the following included storage capacity:

- 3 GB Dataverse Database Capacity
- 3 GB Dataverse File Capacity
- 1 GB Dataverse Log Capacity

The capacity check conducted prior to creating new environments exclude the default environment's included storage capacity when calculating whether you have  sufficient capacity to create a new environment.

### Assign administrators to the default environment

Microsoft 365 Power Platform administrators are no longer automatically assigned the Dataverse system administrator security role in the default environment. For more information on how to gain access to the system administrator role, see [Manage admin roles with Microsoft Entra Privileged Identity Management](manage-high-privileged-admin-roles.md). No other users are automatically added to the default environment as an administrator. To avoid the possibility of an administrative lockout to the default environment, we recommend that you assign the system administrator security role to a few trusted users without assigning those users the Power Platform administrator role. More information: [Environments with a Dataverse database](database-security.md#environments-with-a-dataverse-database)

### Rename the default environment

The default environment is created using the naming convention {Microsoft Entra tenant name} (default).  Power Platform administrators should consider renaming the default environment to something more descriptive, such as *Personal Productivity Environment* that clearly calls out the intent of the environment.

> [!NOTE]
> After you change the name of the default environment, you can still identify it from the Power Platform admin center as the only environment with the environment **Type** of **Default**.

More information: [Edit properties of an environment](edit-properties-environment.md)

### Default environment best practices

For more guidance information with the default environment, go to [Manage the default environment](../guidance/adoption/manage-default-environment.md) and [Secure the default environment](../guidance/adoption/secure-default-environment.md).

## Production and trial environments

You can create environments for different purposes. A trial environment is for trying out the environment and the experience of using a database with Dataverse. It expires after a certain period.

## Manage environments in the Power Platform admin center

You can view and manage your environments in the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. Use the **Sort** or **Filter** options to organize the list of environments. These options are helpful when managing a large number of environments.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. Use the **Sort** or **Filter** options to organize the list of environments. These options are helpful when managing a large number of environments.

---

### Environment details

Select an environment to view the details of that environment, including the URL, type, current state, region it's hosted in.

In the Details pane:

- Select **See all** to see the environment details.
- Select **Edit** to review and edit the environment details.

## Environment location

Depending on the environment type, the environment location varies.

|Type  |Location information  |
|---------|---------|
|Production  |Set by user at creation time. |
|Default   |Set to the tenant home location. To modify this, see [Preferred environment location](#preferred-environment-location).|
|Sandbox  |Set by user at creation time. |
|Trial    |Set by user at creation time. |
|Developer |If created through the admin portal, the location can be specified during creation. If created during [sign-up](/powerapps/maker/developer-plan), it's set to tenant home location. To modify, see [Preferred environment location](#preferred-environment-location).  |
|Microsoft Dataverse for Teams |Set to the tenant home location. To modify this, see [Preferred environment location](#preferred-environment-location). |

### Preferred environment location

If you want Teams environments and developer environments (created on sign-up) to be created in a location different from the tenant location, you can set the **Preferred environment location** for your tenant using the [Power Platform PowerShell commandlets](powerapps-powershell.md). This change doesn't update existing environments and applies to new environments created after the change only. These settings can be found under **Settings > PowerPlatform > Environments**.

```PowerShell
$requestBody = [pscustomobject]@{
powerPlatform = [pscustomobject]@{
environments = [pscustomobject]@{
preferredEnvironmentLocation = "unitedstates"
}
}
}
Set-TenantSettings -RequestBody $requestBody
```
If you have an [Office 365 multi-geo tenant ](/microsoft-365/enterprise/microsoft-365-multi-geo?view=o365-worldwide&preserve-view=true), you must set **settings.powerPlatform.powerApps.environments.disablePreferredDataLocationForTeamsEnvironment** to **true** for the **Preferred environment location** value to be used.

```PowerShell
$settings = Get-TenantSettings 
$settings.powerPlatform.environments.disablePreferredDataLocationForTeamsEnvironment = $true
Set-TenantSettings -RequestBody $settings
```
Updating this value updates the default location that is populated in the Power Platform admin center create environment experience.

### Environment history

Environment history gives admins a timeline of the full environment lifecycle from the moment it's created until it's deleted with all the actions performed on the environment in between, such as Edit, Copy, Reset, etc. Actions on the timeline format are:

- Action name: for example, create
- Start time
- End time: if applicable
- Initiated by: the user
- Status: for example, succeeded or failed

To see the environment history:

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. In the **Environments** page, select an environment.
1. Select **History** in the command bar.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, **Environments**.
1. In the **Environments** page, select an environment.
1. Select **History** in the command bar.
---

> [!NOTE]
>
> - Some actions such as Edit shows the edit as an action but not details of the action.
> - Once an environment is deleted, environment history is also deleted. So, it might not be possible to know who deleted an environment after it's been hard deleted.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
