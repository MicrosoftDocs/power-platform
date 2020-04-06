---
title: "Manage Dynamics 365 apps  | MicrosoftDocs"
description: Manage Dynamics 365 apps
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/03/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Manage Dynamics 365 apps

You can now install, configure, and manage Dynamics 365 apps in the Power Platform admin center.

Apps in this topic refer to model-driven applications in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service) as well as apps purchased from Microsoft AppSource.

You can manage apps from either the tenant level or the environment level.

## Tenant-level view of apps

App management in the Dynamics 365 admin center **Application** tab is now done from the tenant-level view of apps in the Power Platform admin center.

|Legacy  | New  |
|---------|---------|
| ![Legacy tenant view](media/app-management-legacy-application.png "Legacy tenant view")    | ![New tenant view](media/app-management-environment-view-sm.png "New tenant view")        |

Follow these steps to see a list of all licensed applications for your tenant.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. Select **Resources** > **Dynamics 365 apps** from the left-side menu.

   You'll see a list of installed or available to install or configure Dynamics 365 apps for the signed-in user and their tenant. An admin will see all installed or available to install apps.

   Duplicate items will appear under **Name** if you have the same app license applied to multiple environments.

   > [!div class="mx-imgBorder"] 
   > ![Manage apps tenant view](media/app-management-install-app4.png "Manage apps tenant view")

   Note the following under **Status**:

   - **Enabled**: This app is ready to be installed to your environments. 
   - **Configured**: This app has been configured to an environment. It can be reconfigured to a different environment.
   - **Not configured**: This app is ready to be configured to an environment.

3. From the top menu bar, depending on the status of the app, you can do the following:

    - **Manage**: Select to go to a page where you can manage your app. 
    - **Details**: See information about the app such as the publisher.
    - **Install app**: Admins can install certain applications to the selected environment for which they have permission. Once an environment is selected, you'll see a list of packages to be installed.

4. If your tenant is multigeo, you can change the locale with the region selector.

   > [!div class="mx-imgBorder"] 
   > ![Select region](media/app-management-region-select.png "Select region")

## Environment-level view of apps

Solution management in the Dynamics 365 admin center is now done from the environment-level view of apps in the Power Platform admin center.

|Legacy  | New  |
|---------|---------|
| ![Legacy solution view](media/select-solution-upgrade2.png "Legacy solution view")  | ![New tenant view](media/app-management-tenant-view-sm.png "New tenant view")        |

Follow these steps to see a list of all the licensed applications you installed for your environment.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments** and then select an environment.

3. Under **Resources**, select **Dynamics 365 apps**.

   You'll see a list of Dynamics 365 apps installed in the selected environment.

   > [!div class="mx-imgBorder"] 
   > ![Environment view](media/app-management-environment-view.png "Environment view")

4. Select an app. From the top menu bar, depending on the status of the app, you can do the following:

    - **Install app**: Admins can install certain applications to the selected environment for which they have permission. Once an environment is selected, you'll see a list of packages to be installed.
    - **Open AppSource**: Select to install an app from AppSource.
    - **Update**: Appears if an update is available. Select to update the package.
    - **Details**: See information about the app such as the publisher.

If you have failed installations, see [Troubleshooting failed installations](#troubleshooting-a-failed-installation).

## Install an app
The process to install an app depends on your view.

### Install an app in the tenant view

1. From the [tenant-level view of apps](#tenant-level-view-of-apps), select an **Enabled** app, and then select **Install** from the top menu bar. 

2. Select an environment, review the packages to be installed, agree to the terms of service, and then select **Install**.

   > [!div class="mx-imgBorder"] 
   > ![Install app](media/app-management-install-app2.png "Install app")

   You'll navigate to the environment-level view where you can see the installation status.

   > [!div class="mx-imgBorder"] 
   > ![Environment view](media/app-management-environment-view3.png "Environment view")

### Install an app in the environment view

1. From the [environment-level view of apps](#environment-level-view-of-apps), select an environment, under **Resources** select **Dynamics 365 apps**, and then select **Install app**. 

2. Select an **Enabled** app, and then select **Next**.

   > [!div class="mx-imgBorder"] 
   > ![Install app](media/app-management-install-app-env-view.png "Install app")

3. Agree to the terms of service, and then select **Install**.

## Troubleshooting a failed installation
If the app installation has failed, select **Installation failed** from the environment-level view and review the troubleshooting details. 

If it's necessary to [contact Support](support-overview.md), be sure to provide the details listed on the **Error details** page.

> [!div class="mx-imgBorder"] 
> ![Error details](media/app-management-error-details.png "Error details")

## FAQ

### Don't see your environment?

The number of environments admins see in the **Select an environment** drop-down list will be less than or equal to the number of environments displayed on the **Environments** page in the Power Platform admin center. Note that no filter is applied on the **Environments** page.    

Filters are applied to the **Select an environment** drop-down list as follows:
1. Filtered based on the geographic region (Geo picker); selected by the admin in the tenant-level view.
2. Filtered with environments that only have a database.
3. Filtered with environments that are only in a ready state. 

### See also
[Portal administration with Power Platform admin center](https://docs.microsoft.com/powerapps/maker/portals/admin/power-platform-admin-center) 