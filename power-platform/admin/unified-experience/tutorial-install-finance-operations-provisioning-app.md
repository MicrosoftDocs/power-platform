---
title: "Tutorial: Install the Finance and Operations Provisioning app"
description: Learn how to install the Finance and Operations Provisioning app onto an existing Power Platform environment.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 06/19/2025
ms.subservice: admin
ms.author: laswenka
ms.contributors:
  - lsuresh
contributors:
  - lavanyapg
search.audienceType: 
  - admin
---

# Tutorial: Install the Finance and Operations Provisioning app 

Finance and operations apps are reimagined as an application hosted by Microsoft Dataverse. Customers don't need to provision their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 platform applications. Most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this tutorial, learn how to:

- Locate an existing environment in the Power Platform admin center with other Dynamics 365 apps installed.
- Install the Finance and Operations Provisioning app to see finance and operations apps capabilities.

For example, a customer who already purchased other Dynamics 365 apps wants to add finance and operations apps capabilities to one of their existing environments.

## Prerequisites
    
> [!IMPORTANT]
> If a user tries to install the **Dynamics 365 Finance and Operations Provisioning app** on a Dataverse organization that is already linked to a Lifecycle Services (LCS) managed environment, the app installation fails. This application should only be used while provisioning a new unified environment.

- You must have a license to install finance and operations apps in Power Platform.

    Example licenses:

    - Dynamics 365 Finance
    - Dynamics 365 Supply Chain Management for customers
    - Dynamics 365 Operations Application Partner Sandbox for partners and ISVs

- Your license administrator must assign the license to your user account in Microsoft Entra. You can review the licenses currently assigned to you from the [Subscriptions](https://portal.office.com/account/?ref=MeControl#subscriptions) page.
- Have at least 1 GB of available Operations and Dataverse database capacities. For more information, see [Manage storage and capacity](../finance-operations-storage-capacity.md).
- You must use an environment of type **Sandbox** or **Trial (subscription-based)** where the **Enable Dynamics 365 apps** option was turned on when the environment was created. This option is a prerequisite for all Dynamics 365 apps, including Sales, Customer Service, Field Service, and all finance and operations apps.

    > [!IMPORTANT]
    > If you try to install without turning on the **Enable Dynamics 365 apps** option, you receive an error message that says, _Dynamics 365 Finance and Operations Provisioning App isn't supported on SchemaType: Standard_. The schema isn't a visible property in the Power Platform admin center and can't be changed after the environment is created. You can try to install finance and operations apps in another environment, or you can [create an environment by using an ERP template](./tutorial-deploy-new-environment-with-ERP-template.md).
    > Support for environments of type **Production** isn't available. However, support is planned for the future.
    

- You must install the platform tools app before you install the provisioning app. Detailed steps are given in the [Install on an environment](#install-on-an-environment) section.

    > [!IMPORTANT]
    > If you don't install the platform tools app first, you receive an error such as "Please install the Dynamics 365 Finance and Operations Platform Tools application before installing the Dynamics 365 Finance and Operations Provisioning app." You can install the missing app and then retry the installation of the provisioning app.

## Known limitations

Installation of the provisioning app has the following known limitations:

- **Reusing the domain of a deleted environment**: The environment, domain name for a unified environment isn't reusable for up to seven days from when the environment was deleted.
- **Environment URL length**: The hostname of your Dataverse environment URL must be less than or equal to 19 characters in length. Otherwise, installation of the Finance and Operations Provisioning app fails. To bypass this limitation, edit the URL of your environment so that it's the required length.
- **Finance and operations URL missing**: After the installation is successful, the finance and operations URL might not be shown on the environment details page in the Power Platform admin center. To bypass this limitation, edit the environment, and change a field such as **Description** to a new value. This edit operation synchronizes the new URL value and shows it on the screen.

## Step-by-step installation guide

### Install on an environment

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. 
1. Select an environment that meets the prerequisite criteria.
1. On the environment details page, on the **Resources** card, select **Dynamics 365 apps**.
1. Select **Install app**.
1. Select **Dynamics 365 Finance and Operations Platform Tools**. This app provides platform support for installing ERP-based applications. It must be installed before you move on to the next step. If you have more than one license that provides access to this app, there might be multiple entries for the same app. In this case, select any entry that has a status of **Enabled**. Then select **Next**.

    :::image type="content" source="media/tutorial-install-app-platformTools.png" alt-text="Screenshot where an entry for Dynamics 365 Finance and Operations Platform Tools that has a status of Enabled is selected for installation.":::

1. Agree to the terms and conditions, and then select **Install** to start the installation. Wait for the installation to be completed before you move on to the next step. When the installation is completed, the value in the **Status** column changes from **Installing** to **Installed**.
1. Select **Install app**.
1. Select **Dynamics 365 Finance and Operations Provisioning App**. This app provides the finance and operations apps capabilities for Dynamics 365 Finance, Supply Chain Management, Project Operations, Human Resources, and Commerce workloads. If you have more than one license that provides access to this app, there might be multiple entries for the same app. In this case, select any entry that has a status of **Configured**. Then select **Next**.

    :::image type="content" source="media/tutorial-install-app1.png" alt-text="Screenshot where an entry for Dynamics 365 Finance and Operations Provisioning App that has a status of Configured is selected for installation.":::

1. Select **OK** to open the installation configuration page for the provisioning app.
1. On the **Dynamics 365 Finance and Operations Provisioning App** page, set the following fields to configure the app:

    - **Enable Developer Tools for Finance and Operations**: Select this checkbox to get a developer-enabled sandbox environment where you can connect Visual Studio and make X++ changes. If you leave this checkbox cleared, you get a standard sandbox or production environment.
    - **Enable Demo Data for Finance and Operations**: Select this checkbox to deploy the standard Contoso demo data with your app.
    - **Select the version of the product to be installed**: You can select any of the available supported versions for installation.

    :::image type="content" source="media/tutorial-install-app2.png" alt-text="Screenshot of the installation configuration page for the provisioning app.":::

1. Agree to the terms and conditions, and then select **Install** to start the installation. 

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. On the navigation pane, select **Environments**. The **Environments** list page is shown.
1. Select an environment that meets the prerequisite criteria.
1. On the environment details page, on the **Resources** card, select **Dynamics 365 apps**.
1. Select **Install app**.
1. Select **Dynamics 365 Finance and Operations Platform Tools**. This app provides platform support for installing ERP-based applications. It must be installed before you move on to the next step. If you have more than one license that provides access to this app, there might be multiple entries for the same app. In this case, select any entry that has a status of **Enabled**. Then select **Next**.

    :::image type="content" source="media/tutorial-install-app-platformTools.png" alt-text="Screenshot where an entry for Dynamics 365 Finance and Operations Platform Tools that has a status of Enabled is selected for installation.":::

1. Agree to the terms and conditions, and then select **Install** to start the installation. Wait for the installation to be completed before you move on to the next step. When the installation is completed, the value in the **Status** column changes from **Installing** to **Installed**.
1. Select **Install app**.
1. Select **Dynamics 365 Finance and Operations Provisioning App**. This app provides the finance and operations apps capabilities for Dynamics 365 Finance, Supply Chain Management, Project Operations, Human Resources, and Commerce workloads. If you have more than one license that provides access to this app, there might be multiple entries for the same app. In this case, select any entry that has a status of **Configured**. Then select **Next**.

    :::image type="content" source="media/tutorial-install-app1.png" alt-text="Screenshot where an entry for Dynamics 365 Finance and Operations Provisioning App that has a status of Configured is selected for installation.":::

1. Select **OK** to open the installation configuration page for the provisioning app.
1. On the **Dynamics 365 Finance and Operations Provisioning App** page, set the following fields to configure the app:

    - **Enable Developer Tools for Finance and Operations**: Select this checkbox to get a developer-enabled sandbox environment where you can connect Visual Studio and make X++ changes. If you leave this checkbox cleared, you get a standard sandbox or production environment.
    - **Enable Demo Data for Finance and Operations**: Select this checkbox to deploy the standard Contoso demo data with your app.
    - **Select the version of the product to be installed**: You can select any of the available supported versions for installation.

    :::image type="content" source="media/tutorial-install-app2.png" alt-text="Screenshot of the installation configuration page for the provisioning app.":::

1. Agree to the terms and conditions, and then select **Install** to start the installation. 

---

The installation takes about an hour to be completed. While the installation is still in progress, the status of the Finance and Operations Provisioning app is shown as **Installing**.

## Application versions

As was mentioned in the previous section, you can now install any available version of finance and operations apps. The following table represents some example versions that you might encounter.

| Application version | Details | Available in |
|---------------------|---------|--------------|
| 10.0.40.2 (Preview) | Version 10.0.40, with three proactive quality updates (PQUs) installed. This version is also a preview build. | [Early release cycle environments](/power-platform/admin/early-release) only. |
| 10.0.39.4           | Version 10.0.39, with five PQUs installed. | All geos. |
| 10.0.38.9           | Version 10.0.38, with 10 PQUs installed. | All geos. |

Each application version includes its latest PQU. There's no way to get an earlier build of an application version. Preview builds are available only to [early release cycle environments](/power-platform/admin/early-release).
