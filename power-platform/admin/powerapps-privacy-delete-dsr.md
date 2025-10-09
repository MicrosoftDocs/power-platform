---
title: Responding to Data Subject Rights (DSR) requests to delete customer data | Microsoft Docs
description: Walkthrough of how to respond to Data Subject Rights (DSR) requests to delete Power Apps customer data.
author: sericks007
ms.reviewer: paulliew
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/03/2025
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors: 
  - paulliew
  - royshea
  - sericks007
ms.contributors:
  - paulliew
  - royshea
  - sericks 
---

# Responding to Data Subject Rights (DSR) requests to delete Power Apps customer data

The "right to erasure" by the removal of personal data from an organization's customer data is a key protection in the European Union (EU) General Data Protection Regulation (GDPR). Removing personal data includes removing system-generated logs but not audit log information.

Power Apps allows users to build line-of-business applications that are a critical part of your organization's day-to-day operations. When a user leaves your organization, you need to manually review and determine whether to delete certain data and resources that the user created. Other personal data is automatically deleted whenever the user's account is deleted from Microsoft Entra.

Here's the breakdown between which personal data is automatically deleted and which data requires your manual review and deletion:

Requires manual review and deletion |    Automatically deleted when the user is deleted from Microsoft Entra
| --- | ---| 
| Environment\** | Gateway| 
| Environment permissions\*** | Gateway permissions| 
| Canvas app / Custom page\** | Power Apps notifications| 
| Canvas-app permissions | Power Apps user settings| 
| Connection\** | Power Apps user-app settings| 
| Connection permissions | | 
| Custom connector\** | | 
| Custom-connector permissions |  | 

\** Each of these resources contains *Created By* and *Modified By* records that include personal data. For security reasons, these records are retained until the resource is deleted.

\*** For environments that include a Microsoft Dataverse database, environment permissions (that is, which users are assigned to the Environment Maker and Admin roles) are stored as records in that database. For guidance on how to respond to DSRs for users of Dataverse, see [Responding to Data Subject Rights (DSR) requests for Dataverse customer data](dataverse-privacy-dsr-guide.md).

For the data and resources that require manual review, Power Apps offers the following experiences to reassign (if necessary) or delete personal data for a specific user:

* Website access: [Power Apps site](https://make.powerapps.com), [Power Platform admin center](https://admin.powerplatform.microsoft.com/), and [Microsoft 365 Service Trust Portal](https://servicetrust.microsoft.com/)

* PowerShell access: Power Apps cmdlets for [app creators](./powerapps-powershell.md) and [administrators](./powerapps-powershell.md) and cmdlets for [on-premises gateways](/data-integration/gateway/service-gateway-high-availability-clusters).

Here's the breakdown of which experiences are available to delete each type of resource that can contain personal data:

|Resources containing personal data | Website access    | PowerShell access|
|--- | --- | ---|
|Environment    | Power Platform admin center |     Power Apps cmdlets|
|Environment permissions**    | Power Platform admin center | Power Apps cmdlets|
|Canvas app / Custom page   | Power Platform admin center <br /> Power Apps| Power Apps cmdlets|
|Canvas-app permissions    | Power Platform admin center | Power Apps cmdlets|
|Connection | | App creator: Available <br> Admin: Available|
|Connection permissions | | App creator: Available <br> Admin: Available|
|Custom connector | | App creator: Available <br> Admin: Available|
|Custom-connector permissions | | App creator: Available <br> Admin: Available|

\** With the introduction of Dataverse, if a database is created within the environment, environment permissions and model-driven app permissions are stored as records within the environment of that database. For guidance on how to respond to DSRs for users of Dataverse, see [Responding to Data Subject Rights (DSR) requests for Dataverse customer data](dataverse-privacy-dsr-guide.md).

## Prerequisites

### For users

Any user with a valid Power Apps license can perform the user operations outlined in this document using the [Power Apps](https://make.powerapps.com) or [PowerShell cmdlets for app creators](./powerapps-powershell.md).

#### Unmanaged tenant

If you're a member of an [unmanaged tenant](/azure/active-directory/domains-admin-takeover), then you can follow the steps outlined in this part to remove your own personal data. You must follow the instructions outlined in [Step 13: Delete the user from Microsoft Entra](#step-13-delete-the-user-from-microsoft-entra) to delete your own account from the tenant.

To determine if you're a member of an unmanaged tenant, follow these steps:

1. Open the following URL in a browser, making sure to replace your email address in the URL: https://login.microsoftonline.com/common/userrealm/name@contoso.com?api-version=2.1

2. If you're a member of an unmanaged tenant,** then you can see an `"IsViral": true` in the response.

```powershell
{
  ...
  "Login": "name@unmanagedcontoso.com",
  "DomainName": "unmanagedcontoso.com",
  "IsViral": true,
  ...
}
```

   Otherwise, you belong to a **managed tenant**.

### For administrators

To perform the administrative operations outlined in this document using the Power Platform admin center, Power Automate admin center, or [PowerShell cmdlets for Power Apps administrators](./powerapps-powershell.md), you need the following plans and permissions:

* A paid Power Apps plan or a Power Apps plan trial. You can sign up for a 30-day trial at [https://make.powerapps.com/trial](https://make.powerapps.com/trial). You can renew the trial licenses after their expiration.

* [Microsoft 365 global admin](/microsoft-365/admin/add-users/about-admin-roles) or [Microsoft Entra global administrator](/entra/identity/role-based-access-control/permissions-reference) permissions if you need to search through another user's resources.

> [!NOTE]
> Environment admins only have access to those environments and environment resources for which they have permissions.

## Step 1: Delete or reassign all environments created by the user

As an administrator, you have two decisions to make when processing a DSR delete request for each environment that the user created:

1. If the environment isn't being used by anyone else in your organization, you can choose to delete the environment.

2. If the environment is still required, you can choose not to delete the environment and add yourself (or another user in your organization) as an Environment Admin.

> [!IMPORTANT]
> Deleting an environment permanently deletes all resources within the environment, including all apps, flows, and connections. So, you need to review the contents of an environment before deletion.

### Give access to a user's environments

An admin can grant administrative access to an environment by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment to give admin privileges to yourself or another user in your organization.

4. If the environment was created by the user from the DSR request, under **Access** > **Environment admin**, select **See all**.

    :::image type="content" source="media/admin-environment-roles.png" alt-text="Environment roles.":::

### Delete environments created by a user

An admin can review and delete environments created by a specific user by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment.

4. If the environment was created by the user from the DSR request, select **Delete** and then proceed with the steps to delete the environment.

### Give access to a user's environments using PowerShell

An administrator can assign themselves (or another user within their organization) access to all environments created by a user by using the **Set-AdminPowerAppEnvironmentRoleAssignment** function in the [PowerShell cmdlets for Power Apps administrators](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"
$myUserId = $global:currentSession.UserId

#Assign yourself as an admin to each environment created by the user
Get-AdminPowerAppEnvironment -CreatedBy $deleteDsrUserId | Set-AdminPowerAppEnvironmentRoleAssignment -RoleName EnvironmentAdmin -PrincipalType User -PrincipalObjectId $myUserId

#Retrieve the environment role assignments to confirm
Get-AdminPowerAppEnvironment -CreatedBy $deleteDsrUserId | Get-AdminPowerAppEnvironmentRoleAssignment
```

> [!IMPORTANT]
> This function works only in environments that don't have an environment of a database in Dataverse.

### Delete environments created by a user using PowerShell

 An administrator can delete all environments created by a user by using the **Remove-AdminPowerAppEnvironment** function in the [PowerShell cmdlets for Power Apps administrators](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

# Retrieve all environments created by the user and then delete them
Get-AdminPowerAppEnvironment -CreatedBy $deleteDsrUserId | Remove-AdminPowerAppEnvironment
```

## Step 2: Delete the user's permissions to all other environments

Users can be assigned permissions (such as Environment Admin and Environment Maker) in an environment, which are stored in the Power Apps service as a "role assignment."
With the introduction of Dataverse, if a database is created within the environment, these "role assignments" are stored as records within the environment of that database.

### For environments without a Dataverse database

#### Power Platform admin center

An administrator can delete a user's environment permissions starting from the Power Platform admin center by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com) as a [Microsoft Entra Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) or a [Microsoft Entra Dynamics 365 Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select each environment in your organization.

4. If your environment doesn't have a Dataverse database, you can see a section called **Access**. Under **Access**, select either **Environment admin** or **Environment maker**, and then select **See all**.

5. Select a user, select **Remove** to remove their permission, and then select **Continue**.

#### PowerShell

An administrator can delete all environment role assignments for a user across all environments without a Dataverse database by using the **Remove-AdminPowerAppEnvironmentRoleAssignment** function in the [PowerShell cmdlets for Power Apps administrators](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

#find all environment role assignments for the user for environments without a Dataverse database and delete them
Get-AdminPowerAppEnvironmentRoleAssignment -UserId $deleteDsrUserId | Remove-AdminPowerAppEnvironmentRoleAssignment
```

> [!IMPORTANT]
> This function works only for environments that don't have an environment of a Dataverse database.

### For environments WITH a Dataverse database

With the introduction of the Dataverse, if a database is created within the environment, these "role assignments" are stored as records within the environment of that database. Refer to the following documentation on how to remove personal data from an environment of a database in Dataverse: Common Data Service User personal data removal

## Step 3: Delete or reassign all canvas apps owned by a user

### Reassign a user's canvas apps using the Power Apps Admin PowerShell cmdlets

If an admin decides not to delete a user's canvas apps, they can reassign the apps owned by a user by using the **Set-AdminPowerAppOwner** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"
$newAppOwnerUserId = "72c272b8-14c3-4f7a-95f7-a76f65c9ccd8"

#find all apps owned by the DSR user and assigns them a new owner
Get-AdminPowerApp -Owner $deleteDsrUserId | Set-AdminPowerAppOwner -AppOwner $newAppOwnerUserId
```

### Delete a user's canvas app using the Power Apps site

A user can delete an app from [Power Apps](https://make.powerapps.com). For the full steps on how to delete an app, see [Delete a canvas app](/power-apps/maker/canvas-apps/delete-app).

### Delete a user's canvas app using the Power Platform admin center

An admin can delete apps created by a user by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com) as a [Microsoft Entra Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) or a [Microsoft Entra Dynamics 365 Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select an environment in your organization.

4. Under **Resources**, select **Power Apps**.

5. Select an app, and then select **Delete** > **Delete from cloud**.

### Delete a user's canvas app using the Power Apps Admin PowerShell cmdlets

If an admin decides to delete all canvas apps owned by a user, they can do so using the **Remove-AdminApp** function in the [Power Apps Admin PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

#find all apps owned by the DSR user and deletes them
Get-AdminPowerApp -Owner $deleteDsrUserId | Remove-AdminPowerApp
```

## Step 4: Delete the user's permissions to canvas apps

Whenever an app is shared with a user, Power Apps stores a record called a "role assignment" that describes the user's permissions (CanEdit or CanUse) to the application. Learn mre in [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app).

> [!NOTE]
> An app's role assignments are deleted when the app is deleted.
> The app owner's role assignment can only be deleted by assigning a new owner for the app.

To delete user permissions to a canvas app, see [Preview: Share a model-driven app](/powerapps/maker/model-driven-apps/share-model-driven-app). For step 5, remove rather than add a role from the list.

### PowerShell cmdlets for admins

An admin can delete all of a user's canvas-app role assignments by using the **Remove-AdminPowerAppRoleAssignment** function in the [Power Apps Admin PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

#find all app role assignments for the DSR user and deletes them
Get-AdminPowerAppRoleAssignment -UserId $deleteDsrUserId | Remove-AdminPowerAppRoleAssignment
```

## Step 5: Delete connections created by a user

Connections are used with connectors when establishing connectivity with other APIs and SaaS systems. Connections do include references to the user who created them and, as a result, can be deleted to remove any references to the user.

### PowerShell cmdlets for app creators

A user can delete all of their connections by using the **Remove-AdminPowerAppConnection** function in the [PowerShell cmdlets for app creators](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount

#Retrieves all connections for the calling user and deletes them
Get-AdminPowerAppConnection | Remove-AdminPowerAppConnection
```

### PowerShell cmdlets for Power Apps administrators

An admin can delete all of a user's connections by using the **Remove-AdminPowerAppConnection** function in the [Power Apps Admin PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

#Retrieves all connections for the DSR user and deletes them
Get-AdminPowerAppConnection -CreatedBy $deleteDsrUserId | Remove-AdminPowerAppConnection
```

## Step 6: Delete the user's permissions to shared connections

### PowerShell cmdlets for app creators

A user can delete all of their connection role assignments for shared connections by using the **Remove-AdminPowerAppConnectionRoleAssignment** function in the [PowerShell cmdlets for app creators](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount

#Retrieves all connection role assignments for the calling users and deletes them
Get-AdminPowerAppConnectionRoleAssignment | Remove-AdminPowerAppConnectionRoleAssignment
```

> [!NOTE]
> Owner role assignments can't be deleted without deleting the connection resource.

### PowerShell cmdlets for admins

An admin can delete all of a user's connection role assignments by using the **Remove-AdminPowerAppConnectionRoleAssignment** function in the [Power Apps Admin PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

#Retrieves all connection role assignments for the DSR user and deletes them
Get-AdminPowerAppConnectionRoleAssignment -PrincipalObjectId $deleteDsrUserId | Remove-AdminPowerAppConnectionRoleAssignment
```

## Step 7: Delete custom connectors created by the user

Custom Connectors supplement the existing out of box connectors and allow for connectivity to other APIs, SaaS, and custom-developed systems. You might want to transfer Custom Connector ownership to other users in the organization or delete the Custom Connector.

### PowerShell cmdlets for app creators

A user can delete all of their custom connectors by using the **Remove-AdminPowerAppConnector** function in the [PowerShell cmdlets for app creators](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount

#Retrieves all custom connectors for the calling user and deletes them
Get-AdminPowerAppConnector | Remove-AdminPowerAppConnector
```

### PowerShell cmdlets for admins

An admin can delete all custom connectors created by a user using the **Remove-AdminPowerAppConnector** function in the [Power Apps Admin PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

#Retrieves all custom connectors created by the DSR user and deletes them
Get-AdminPowerAppConnector -CreatedBy $deleteDsrUserId | Remove-AdminPowerAppConnector
```

## Step 8: Delete the user's permissions to shared custom connectors

### PowerShell cmdlets for app creators

A user can delete all of their connector role assignments for shared custom connectors with the **Remove-AdminPowerAppConnectorRoleAssignment** function in the [PowerShell cmdlets for app creators](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount

#Retrieves all connector role assignments for the calling users and deletes them
Get-AdminPowerAppConnectorRoleAssignment | Remove-AdminPowerAppConnectorRoleAssignment
```

> [!NOTE]
> Owner role assignments can't be deleted without deleting the connection resource.

### PowerShell cmdlets for admins

An admin can delete all custom connector role assignments for a user using the **Remove-AdminPowerAppConnectorRoleAssignment** function in the [Power Apps Admin PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$deleteDsrUserId = "0ecb1fcc-6782-4e46-a4c4-738c1d3accea"

#Retrieves all custom connector role assignments for the DSR user and deletes them
Get-AdminPowerAppConnectorRoleAssignment -PrincipalObjectId $deleteDsrUserId | Remove-AdminPowerAppConnectorRoleAssignment
```

## Step 9: Delete the user's personal data in Power Automate

Power Apps licenses always include Power Automate capabilities. In addition to being included in Power Apps licenses, Power Automate is also available as a standalone service. For guidance on how to respond to DSRs for users who use the Power Automate service, see [Responding to GDPR Data Subject Requests for Power Automate](/power-automate/gdpr-dsr-summary).

> [!IMPORTANT]
> We recommend that admins complete this step for a Power Apps user.

## Step 10: Delete the user's personal data in Microsoft Copilot Studio

Power Apps capabilities build upon Microsoft Copilot Studio, which is also available as a standalone service. For guidance on how to respond to DSR requests for Microsoft Copilot Studio service data, see [Responding to Data Subject Requests for Microsoft Copilot Studio](/power-virtual-agents/personal-data-summary).

> [!IMPORTANT]
> We recommend that admins complete this step for a Power Apps user.

## Step 11: Find personal data for the user in the Microsoft 365 admin center

Some feedback mechanisms in Power Apps are integrated with the Microsoft 365 admin center. For guidance on how to delete feedback data stored by the Microsoft 365 admin center, see [How can I see my user's feedback?](/microsoft-365/admin/misc/feedback-user-control#how-can-i-see-my-users-feedback). A [Microsoft Entra global administrator](/entra/identity/role-based-access-control/permissions-reference) is able to manage this data within the Microsoft 365 admin center without the need for Microsoft 365 or Office licenses.

> [!IMPORTANT]
> We recommend that admins complete this step for a Power Apps user.

## Step 12: Delete the user's personal data in environments of Dataverse

Certain Power Apps licenses, including the Power Apps Developer Plan, give the ability for users within your organization to create environments of Dataverse and to create and build apps on Dataverse. The Power Apps Developer Plan is a free license that allows users to try out Dataverse in an individual environment. See the Power Apps pricing page for which capabilities are included in each Power Apps license.

For guidance on how to respond to DSRs for users who use Dataverse, see [Responding to Data Subject Rights (DSR) requests for Dataverse customer data](dataverse-privacy-dsr-guide.md).

> [!IMPORTANT]
> We recommend that admins complete this step for a Power Apps user.

## Step 13: Delete the user from Microsoft Entra

After completing the specified steps, you can delete the user's account for Microsoft Entra.

### Managed tenant

As an admin of a managed Microsoft Entra tenant, you can delete the user's account by following the steps outlined in the Azure Data Subject Request GDPR documentation that can be found on the [Microsoft 365 Service Trust Portal](https://servicetrust.microsoft.com/ViewPage/GDPRDSR).

### Unmanaged tenant

If you're a member of an unmanaged tenant, then you need to follow these steps to delete your account from your Microsoft Entra tenant:

> [!NOTE]
> Read [Unmanaged tenant](#unmanaged-tenant) to learn how to detect if you're a member of an unmanaged or a managed tenant.

1. Sign in with your Microsoft Entra account.

2. Select **Close account** and follow the instructions to delete your account from your Microsoft Entra tenant.

    :::image type="content" source="./media/powerapps-gdpr-delete-dsr/close-account.png" alt-text="Select Close account.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
