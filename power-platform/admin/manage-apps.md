---
title: "Manage Dynamics 365 apps that run on Microsoft Dataverse"
description: "Learn how to install, configure, and manage Dynamics 365 apps in Power Platform admin center. Manage apps from either the tenant or environment level."
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/30/2021
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
search.audienceType: 
  - admin
---

# Manage Dynamics 365 apps

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can use the Microsoft Power Platform admin center to install, configure, and manage Dynamics 365 apps that run on [Microsoft Dataverse](/powerapps/maker/common-data-service/data-platform-intro). Apps in this topic refer to Dynamics 365 apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, and Dynamics 365 Marketing as well as apps purchased from Microsoft AppSource requiring any of these Dynamics 365 licenses.

> [!NOTE]
> You can install and manage Dynamics 365 apps only in an environment that was created with a database and with Dynamics 365 apps enabled during the environment creation. A valid Dynamics 365 license is required to enable Dynamics 365 apps during the environment creation. More information: [Create an environment with a database](./create-environment.md#create-an-environment-with-a-database)

You can manage apps from either the [tenant level](#tenant-level-view-of-apps) or the [environment level](#environment-level-view-of-apps).

## Tenant-level view of apps

App management is done from the tenant-level view of apps in the Power Platform admin center. Follow these steps to see a list of all licensed Dynamics 365 apps for your tenant.

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Dynamics 365 Apps**.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Resources**, then choose **Dynamics 365 Apps**.
---

   You'll see a list of installed or available to install or configure Dynamics 365 apps for the signed-in user. System administrator will see all installed or available to install apps. 
   
   Duplicate items will appear under **Name** if you have the same app license applied to multiple environments.

   Note the following under **Status**:

   - **Enabled**: This app is ready to be installed in your environments. 
   - **Configured**: This app has been configured to an environment. It can be reconfigured to a different environment or configuration to current environment can be updated.
   - **Not configured**: This app is ready to be configured to an environment.

1. From the top command bar, depending on the status of the app, you can do the following:

    - **Manage**: Select to go to a page where you can manage your app. 
    - **Details**: See information about the app such as the publisher.
    - **Install app**: Install certain applications to the selected environment for which you have permissions. Once an environment is selected, you'll see a list of packages to be installed.

2. If your tenant is multigeo, you can change the locale with the region selector in the top command bar.

## Environment-level view of apps

App management can also be done from the environment-level view of apps in the Power Platform admin center. Follow these steps to see a list of all the licensed Dynamics 365 apps you installed for your environment.

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the top command bar, select **Resources**, then choose **Dynamics 365 Apps**.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the top command bar, select **Resources**, then choose **Dynamics 365 Apps**.
---

   You'll see a list of Dynamics 365 apps installed **by you** in the selected environment. System administrator will see all installed apps in the selected environment.

1. Select an app. From the top menu bar, depending on the status of the app, you can do the following:

    - **Install app**: Admins can install certain applications to the selected environment for which they have permission. Once an environment is selected, you'll see a list of packages to be installed.
    - **Open AppSource**: Select to install an app from AppSource.
    - **Update**: Appears if an update is available. Select to update the package.
    - **Details**: See information about the app such as the publisher.

If you have failed installations, see [Troubleshooting failed installations](#troubleshooting-a-failed-installation).

## Install an app
The process to install an app depends on your view.

### Install an app in the tenant view

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Dynamics 365 Apps**.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Resources**, then choose **Dynamics 365 Apps**.
---

   You'll see a list of apps that are available to install and configure in the tenant. 

   **To install an app:**
  1. Select an **Enabled** app, then choose **Install** from the top command bar. 
  1. In the side pane, select an **environment**, review the packages to be installed, then agree to the terms of service by selecting **Agree**, followed by **Install**.
  1. You'll navigate to the environment-level view where you can see the installation status.

### Install an app in the environment view

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the top command bar, select **Resources**, then choose **Dynamics 365 Apps**.

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the top command bar, select **Resources**, then choose **Dynamics 365 Apps**. 
---

  You'll see the list of apps that are available to install and manage in the environment.
  
   **To install an app:**:
1. In the top command bar, select **Install app**.
1. In the side pane, select an **Enabled** app, then select **Next**.
1. Agree to the terms of service by selecting **Agree**, then choose **Install**.
   
## Troubleshooting installation error
<!-- fwlink  2182141 -->
If you see the following error:

"Installing Dynamics 365 apps such as Dynamics 365 Sales and Dynamics 365 Customer Service is only supported on environments that have been created with a database with the option to **Enable Dynamics 365 apps** set to **Yes**. Try installing this application in an environment with a database and **Enable Dynamics 365 apps** enabled on it."

You'll need to create a new environment as directed in [Create an environment with a database](create-environment.md#create-an-environment-with-a-database). In step **Enable Dynamics 365 apps**, be sure to set **Yes**.

## Troubleshooting a failed installation

If the app installation has failed, its status will be marked **Installation failed**. Select **Details** from the command bar to view the error details page. 

If it's necessary to [contact Support](support-overview.md), be sure to provide the details listed on the error details page.

## Delete an app
For information on how to delete an app, see [Delete a model-driven app](/powerapps/maker/model-driven-apps/delete-model-driven-app). 

## FAQ

### Don't see your environment?

The number of environments admins see in the **Select an environment** drop-down list will be less than or equal to the number of environments displayed on the **Environments** page in the Power Platform admin center. Check that no filter is applied on the **Environments** page.    

Filters are applied to the **Select an environment** drop-down list as follows:
1. Displays environments based on the [geographic region](regions-overview.md); selected by the admin in the tenant-level view.
2. Displays environments that only have a database.
3. Displays environments that are only in a ready state. 

<!-- 
### Error: Installing this app is only supported in environments that’ve been created with a database with the option to enable one or more Dynamics 365 apps  

Installing Dynamics 365 applications, such as Dynamics 365 Sales, Dynamics 365 Customer Service etc., is only supported on environments that have been created with a database with the option to enable one or more D365 Applications. Try installing this application in an environment with a database and Dynamics Applications enabled on it. 

> [!div class="mx-imgBorder"] 
> ![Select Enable Dynamics 365 apps.](media/new-environment-page2-enable-apps-callout.png "Select Enable Dynamics 365 apps.")
-->

[!INCLUDE[footer-include](../includes/footer-banner.md)]
