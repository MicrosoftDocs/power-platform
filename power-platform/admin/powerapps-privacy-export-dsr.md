---
title: Responding to Data Subject Rights (DSR) requests to export Power Apps customer data 
description: Walkthrough of how to respond to Data Subject Rights (DSR) requests to export Power Apps customer data.
author: sericks007
ms.reviewer: paulliew
ms.component: pa-admin
ms.topic: how-to
ms.date: 9/24/2025
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
ms.custom: sfi-image-nochange
---

# Responding to Data Subject Rights (DSR) requests to export Power Apps customer data

The "right of data portability" allows a data subject to request a copy of their personal data in an electronic format (that is, a structured, commonly used, machine readable and interoperable format) that may be transmitted to another data controller:

* Website access: [Power Apps portal](https://make.powerapps.com), [Microsoft Power Platform admin center](https://admin.powerplatform.microsoft.com/), and [Microsoft 365 Service Trust Portal](https://servicetrust.microsoft.com/)

* PowerShell access: Power Apps [App creator cmdlets](./powerapps-powershell.md), [Admin cmdlets](./powerapps-powershell.md) and [On-premises gateway cmdlets](/data-integration/gateway/service-gateway-high-availability-clusters)

Below is a summary of the types of personal data that Power Apps can store for a specific user and which experiences you can use to find and export it.

Resources containing personal data | Website access |    PowerShell access
--- | --- | --
Environment    | Power Platform admin center |     Power Apps cmdlets
Environment permissions**    | Power Platform admin center     | Power Apps cmdlets
Canvas App / Custom page   | Power Apps Portal |     Power Apps cmdlets
Canvas App permissions    | Power Apps Portal    | Power Apps cmdlets
Gateway | Power Apps Portal***    | On-premises gateway cmdlets
Gateway permissions    | Power Apps Portal***    |
Custom connector | |    App creator: Available <br> Admin: Available
Custom connector permissions | |     App creator: Available <br> Admin: Available
Connection | | App creator: Available <br> Admin: Available
Connection permissions    | | App creator: Available <br> Admin: Available
Power Apps user settings, user-app settings, and notifications | | App creator: Available <br> Admin: Available

> ** With the introduction of Microsoft Dataverse, if a database is created within the environment, environment permissions and model-driven app permissions are stored as records within the Dataverse database environment. For guidance on how to respond to DSR requests for users that use Dataverse, see [Responding to Data Subject Rights (DSR) requests for Dataverse customer data](dataverse-privacy-dsr-guide.md).

> *** An administrator can access these resources from the [Power Apps portal](https://make.powerapps.com) only if the owner of the resource has explicitly granted them access. If the administrator has not been granted access, they need to leverage the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md).

## Prerequisites

### For users

Any user with a valid Power Apps license can perform the user operations outlined in this document using the [Power Apps portal](https://make.powerapps.com) or [App creator cmdlets](./powerapps-powershell.md).

### For admins

To perform the administration operations outlined in this document using the Power Platform admin center, Power Automate admin center, or [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md), you'll need the following:

* A paid Power Apps plan or a Power Apps trial. You can sign-up for a 30-day trial at [https://make.powerapps.com/trial](https://make.powerapps.com/trial). Trial licenses can be renewed if they've expired.

* [Microsoft Entra Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) or [Microsoft Entra Dynamics 365 Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator) role if you need to search through another user's resources. (Note that environment administrators only have access to those environments and environment resources for which they have permissions.)

## Step 1: Export personal data contained within environments created by the user

### Power Platform admin center

Administrators can export all environments created by a specific user from the Power Platform admin center by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select each environment in your organization.

4. If the environment was created by the user from the DSR request, select **See all**, copy the details, and then paste them into a document editor, such as Microsoft Word.

### PowerShell cmdlets for app creators

Users can export the environments they have access to in Power Apps by using the **Get-PowerAppEnvironment** function in the [App creator PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
Get-PowerAppEnvironment | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

### PowerShell cmdlets for admins

Administrators can export all of the environments that have been created by a user by using the **Get-AdminPowerAppEnvironment** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
Get-AdminPowerAppEnvironment -CreatedBy $userId | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

## Step 2: Export the user's environment permissions

Users can be assigned permissions (such as Environment Admin, Environment Maker, etc.) in an environment, which are stored in Power Apps as a *role assignment*. With the introduction of Dataverse, if a database is created within the environment, the role assignments are stored as records within the Dataverse database environment. For more information, see [Administer environments within Power Apps](environments-overview.md).

### For environments without a Dataverse database

#### Power platform admin center

An administrator can export a user's environment permissions from the Power Platform admin center by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select each environment in your organization.

4. Select both **Environment Admin** and **Environment Maker** separately, and then using the search bar, search for the user's name.

    :::image type="content" source="media/admin-environment-roles.png" alt-text="Environment roles.":::

5. If the user has access to either role, go to the **Users** page, copy the details, and then paste them into a document editor, such as Microsoft Word.

#### PowerShell cmdlets for admins

Administrators can export all environment role assignments for a user across all environments without a Dataverse database by using the **Get-AdminPowerAppEnvironmentRoleAssignment** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "11bb11bb-cc22-dd33-ee44-55ff55ff55ff"
Get-AdminPowerAppEnvironmentRoleAssignment -UserId $userId | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

> [!IMPORTANT]
>  This function only works for environments that do not have a Dataverse database environment.

### For environments with a Dataverse database

With the introduction of the Dataverse, if a database is created within the environment, role assignments are stored as records within the Dataverse database environment. For information on how to remove personal data from a Dataverse database environment, see [Common Data Service User personal data removal](./dataverse-privacy-dsr-guide.md).
 
## Step 3: Export personal data contained within canvas apps created by the user

### Power Apps portal

A user can export an app from the [Power Apps portal](https://make.powerapps.com). For step-by-step instructions on how to export a canvas app, see [Exporting a canvas app](/powerapps/maker/data-platform/export-solutions#exporting-a-canvas-app).

### Power Platform admin center

An administrator can export apps created by a user starting from the Power Platform admin center by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com) as a [Microsoft Entra Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) or a [Microsoft Entra Dynamics 365 Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select each environment in your organization.

4. Select **Resources**, and then select **Power Apps**.

5. Using the search bar, search for the user's name, which brings up any apps that user created within this environment:

6. Select **Share** for each of the apps created by that user and give yourself **Co-owner** access to the app:

    :::image type="content" source="media/share-canvas-app-new.png" alt-text="Select app share.":::

5. After you have access to each of the user's apps, you can export a canvas app from the [Power Apps portal](https://make.powerapps.com). For step-by-step instructions on how to export an app, see [Exporting a canvas app](/powerapps/maker/data-platform/export-solutions#exporting-a-canvas-app).

## Step 4: Export the user's permissions to canvas apps

Whenever an app is shared with a user, Power Apps stores a record called a *role assignment* that describes the user's permissions (CanEdit or CanUser) to the application. For more information, see [Share an app](/powerapps/maker/canvas-apps/share-app#share-an-app).

### PowerShell cmdlets for app creators

Users can export the app role assignments for all apps that they have access to by using the **Get-PowerAppRoleAssignment** function in the [App creator PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
Get-PowerAppRoleAssignment | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

### Power Platform admin center
 
An administrator can export apps created by a user starting from the Power Platform admin center by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com) as a [Microsoft Entra Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) or a [Microsoft Entra Dynamics 365 Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select each environment in your organization.

4. Select **Resources**, and then select **Power Apps**.

5. Select **Share** for each of the apps in the environment.

    :::image type="content" source="media/share-canvas-app-new.png" alt-text="Select app share."::: 

6. If the user has access to the app, go to the app's **Share** page, copy the details, and then paste them into a document editor, such as Microsoft Word.

### PowerShell cmdlets for admins

Administrators can export all app role assignments for a user across all apps in their tenant by using the **Get-AdminPowerAppRoleAssignment** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "11bb11bb-cc22-dd33-ee44-55ff55ff55ff"
Get-AdminPowerAppRoleAssignment -UserId $userId | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

## Step 5: Export personal data contained within connections created by the user

Connections are used in conjunction with connectors when establishing connectivity with other APIs and SaaS systems. Connections include references to the user who created them and, as a result, can be deleted to remove any references to the user.

### PowerShell cmdlets for app creators

Users can export all of the connections they have access to by using the **Get-AdminPowerAppConnection** function in the [App creator PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
Get-AdminPowerAppConnection | ConvertTo-Json | out-file -FilePath "UserDetails.json"
```

### PowerShell cmdlets for admins

Administrators can export all connections created by the user using the  **Get-AdminPowerAppConnection** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "11bb11bb-cc22-dd33-ee44-55ff55ff55ff"
Get-AdminPowerAppConnection -CreatedBy $userId | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```
 
## Step 6: Export the user's permissions to shared connections

### PowerShell cmdlets for app creators

Users can export the connection role assignments for all connections that they have access to by using the **Get-AdminPowerAppConnectionRoleAssignment** function in the [App creator PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
Get-AdminPowerAppConnectionRoleAssignment | ConvertTo-Json | Out-file -FilePath "UserDetails.json"
```

### PowerShell cmdlets for admins

Administrators can export all connection role assignments for a user using the  **Get-AdminPowerAppConnectionRoleAssignment** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "11bb11bb-cc22-dd33-ee44-55ff55ff55ff"
Get-AdminPowerAppConnectionRoleAssignment -PrincipalObjectId $userId | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

## Step 7: Export personal data contained within custom connectors created by the user

Custom Connectors supplement the existing out-of-box connectors and allow for connectivity to other APIs, SaaS, and custom-developed systems.

### App creator PowerShell cmdlets

Users can export all custom connectors they've created by using the **Get-AdminPowerAppConnector** function in the [App creator PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount  
Get-AdminPowerAppConnector | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

### PowerShell cmdlets for admins

Administrators can export all custom connectors created by a user using the  **Get-AdminPowerAppConnector** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "11bb11bb-cc22-dd33-ee44-55ff55ff55ff"
Get-AdminPowerAppConnector -CreatedBy $userId | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

## Step 8: Export the user's permissions to custom connectors

### PowerShell cmdlets for app creators

Users can export all connector role assignments for the custom connectors to which they have access by using the **Get-AdminPowerAppConnectorRoleAssignment** function in the [App creator PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount  
Get-AdminPowerAppConnectorRoleAssignment | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```

### PowerShell cmdlets for admins

Administrators can export all custom connector role assignments for a user using the  **Get-AdminPowerAppConnectorRoleAssignment** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "11bb11bb-cc22-dd33-ee44-55ff55ff55ff"
Get-AdminPowerAppConnectorRoleAssignment -PrincipalObjectId $userId | ConvertTo-Json | Out-File -FilePath "UserDetails.json"
```
 
## Step 9: Export Power Apps Notifications, User Settings, and User-App Settings

Power Apps sends several types of notifications to users, including when an app is shared with them and when a Dataverse export operation has completed. A user's notification history is visible to them within the [Power Apps portal](https://make.powerapps.com).

Power Apps also stores several different user preferences and settings that are used to deliver the Power Apps runtime and portal experiences, including when a user last opened an application, pinned an app, etc.

### PowerShell cmdlets for app creators

Users can export their own Power Apps notifications, user settings, and user-app settings using the **Get-AdminPowerAppsUserDetails** function in the [App creator PowerShell cmdlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount  
Get-AdminPowerAppsUserDetails -OutputFilePath "UserDetails.json"
```

### PowerShell cmdlets for admins

Administrators can export the Power Apps notifications, user settings, and user-app settings for a user using the  **Get-AdminPowerAppsUserDetails** function in the [Power Apps Admin PowerShell cdmlets](./powerapps-powershell.md):

```powershell
Add-PowerAppsAccount
$userId = "11bb11bb-cc22-dd33-ee44-55ff55ff55ff"
Get-AdminPowerAppsUserDetails -OutputFilePath "UserDetails.json" -UserPrincipalName name@microsoft.com
```

## Step 10: Export personal data contained for a user-stored gateway or in the user's gateway permissions

### Power Apps Portal

Users can export the personal data stored within the gateway service from the [Power Apps portal](https://make.powerapps.com) by following these steps:

1. From the [Power Apps portal](https://make.powerapps.com), within the default environment for your tenant, select **Gateways**, and then select **Details** for each gateway to which you have access.

    :::image type="content" source="./media/powerapps-gdpr-export-dsr/gateway-select-details.png" alt-text="Gateway landing page.":::

2. On the **Details** page, if the gateway details contain any personal data, copy the details, and then paste them into a document editor, such as Microsoft Word.

    :::image type="content" source="./media/powerapps-gdpr-export-dsr/gateway-details-drillin.png" alt-text="Gateway details.":::

3. Select **Share**, copy the contents of the page, and then paste it into a document editor, such as Microsoft Word.

    :::image type="content" source="./media/powerapps-gdpr-export-dsr/gateway-details-share.png" alt-text="Select Share.":::

### Gateway PowerShell cmdlets

There are also PowerShell cmdlets that allow you to retrieve, manage, and delete your personal gateways. For more information, see [On-premises gateway cmdlets](/data-integration/gateway/service-gateway-high-availability-clusters).

### Administrators

See [What is an on-premises data gateway?](/powerapps/maker/canvas-apps/gateway-reference) for guidance around managing gateways for your organization.

## Step 11: Export the user's personal data in Power Automate

Power Apps licenses always include Power Automate capabilities. In addition to being included in Power Apps licenses, Power Automate is also available as a standalone service. For guidance on how to respond to DSR requests for users that use the Power Automate service, see [Responding to GDPR Data Subject Requests for Power Automate](/power-automate/gdpr-dsr-summary).

> [!IMPORTANT]
>  We recommend that administrators complete this step for Power Apps users.

## Step 12: Find personal data for the user in Microsoft Copilot Studio

Power Apps capabilities build upon Microsoft Copilot Studio.  Microsoft Copilot Studio is also available as a standalone service. For guidance on how to respond to DSR requests for Microsoft Copilot Studio service data, see [Responding to Data Subject Requests for Microsoft Copilot Studio](/power-virtual-agents/personal-data-summary).

> [!IMPORTANT]
>  We recommend that administrators complete this step for Power Apps users.

## Step 13: Find personal data for the user in the Microsoft 365 admin center

Some feedback mechanisms in Power Apps are integrated with the Microsoft 365 admin center. For guidance on how to export feedback data stored by the Microsoft 365 admin center, see [How can I see my user's feedback?](/microsoft-365/admin/misc/feedback-user-control#how-can-i-see-my-users-feedback). A [Microsoft Entra Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) or [Microsoft Entra Dynamics 365 Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator) is able to manage this data within the Microsoft 365 admin center without the need for Microsoft 365 or Office licenses.

> [!IMPORTANT]
>  We recommend that administrators complete this step for Power Apps users.

## Step 14: Export the user's personal data in environments

Anyone with a Power Apps license, provided there is 1GB available database capacity, can create environments and create and build apps on Dataverse; this includes the Power Apps Developer Plan, which is a free license that allows users to try out Dataverse in an individual environment. To see which Dataverse capabilities are included in each Power Apps license, see the [Power Apps Pricing page](https://powerapps.microsoft.com/pricing).

For guidance on how to respond to DSR requests for users that use Dataverse, see [Responding to Data Subject Rights (DSR) requests for Dataverse customer data](dataverse-privacy-dsr-guide.md).

> [!IMPORTANT]
>  We recommend that administrators complete this step for Power Apps users.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
