---
title: "Tutorial: Install the Finance and Operations Provisioning App  | Microsoft Docs"
description: Learn how to install the Finance and Operations Provisioning App onto an existing Power Platform environment.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 06/06/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Install the Finance and Operations Provisioning App 

Finance and operations apps are reimagined as an application hosted by Microsoft Dataverse. Customers don't need to provision their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 platform applications. Most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this tutorial, learn how to:

- Locate an existing environment in the Power Platform admin center with other Dynamics 365 apps installed.
- Install the Finance and Operations Provisioning app to see finance and operations apps capabilities.

For example, a customer who already purchased other Dynamics 365 apps wants to add finance and operations apps capabilities to one of their existing environments.

## Prerequisites

- You must have a license to install finance and operations apps in Power Platform.

  Example licenses:

  - Dynamics 365 Finance
  - Dynamics 365 Supply Chain Management for customers
  - Dynamics 365 Operations Application Partner Sandbox for partners and ISVs

- Your license administrator must assign the license to your user account in Microsoft Entra. You can review the licenses currently assigned to you from the [Subscriptions](https://portal.office.com/account/?ref=MeControl#subscriptions) page.

- Have at least 1 GB of available Operations and Dataverse database capacities. For more information, see [Manage storage and capacity](../finance-operations-storage-capacity.md).

- You must use an environment with the **Enable Dynamics 365 apps** option turned on when the environment is created. This option is a prerequisite for all Dynamics 365 apps, including Sales, Customer Service, Field Service, and all finance and operations apps.

   > [!IMPORTANT]
   > If you try to install without turning on the **Enable Dynamics 365 apps** option, you receive an error such as **Dynamics 365 Finance and Operations Provisioning App isn't supported on SchemaType: Standard**. The schema isn't a visible property in Power Platform admin center and can't be changed after the environment is created. You can try installing finance and operations apps in another environment, or [Create an environment with an ERP template](./tutorial-deploy-new-environment-with-ERP-template.md).

- You must first install the platform tools app before installing the provisioning app. The detailed steps are outlined in [Install on an environment](#install-on-an-environment).

   > [!IMPORTANT]
   > If you don't install the platform tools app first, you get an error, such as **Please install the Dynamics 365 Finance and Operations Platform Tools application before installing the Dynamics 365 Finance and Operations Provisioning app**. You can install the missing app, and then retry the installation of the provisioning app.

## Known limitations

Limitations for an installation of the provisioning app:  

- **Environment URL length** - The hostname of your Dataverse environment URL must be less than or equal to 19 characters in length, otherwise the Finance and Operations Provisioning App fails to install. To bypass this limitation, edit the URL of your environment to be the required length.

- **Finance and Operations URL missing** - After the install is successful, the Finance and Operations URL may not be shown on the environment details page in Power Platform admin center. To bypass this limitation, edit the environment and change a field, such as the **Description** to a new value. This edit operation synchronizes the new URL value and displays it on screen.

## Step-by-step installation guide

### Install on an environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments** in the navigation pane. The **Environments** list page is displayed.
3. Select a given environment that meets the prerequisite criteria.
4. Select **Dynamics 365 apps** in the **Resources** card on the environment's detail page.
5. Select **Install app**.
6. Select the **Dynamics 365 Finance and Operations Platform Tools** app. This application provides platform support for installing ERP-based applications. It must be installed before the next step. You may see multiple entries of the same application if you have more than one license that provides access to it. Select any option with a status of **Enabled** and select **Next**.
   :::image type="content" source="media/tutorial-install-app-platformTools.png" alt-text="A pop-up dialog is shown with the option to proceed to install the platform tools application or to cancel the action.":::
7. Agree to the terms and conditions and select the **Install** button to start the installation. Wait for the installation to finish&mdash;the **Status** column switchs from **Installing** to **Installed**&mdash;before proceeding to the next step.
8. Select **Install app**.
9. Select the **Dynamics 365 Finance and Operations Provisioning app**. This application provides the finance and operations apps capabilities for Dynamics 365 Finance, Supply Chain Management, Project Operations, Human Resources, and Commerce workloads. You may see multiple entries of the same application if you have more than one license that provides access to it. Select any option with a status of **Configured** and select **Next**.
   :::image type="content" source="media/tutorial-install-app1.png" alt-text="A pop-up dialog is shown with the option to proceed to install the application or to cancel the action.":::
10. Select **OK** to go to the installation configuration page for the provisioning app.
    :::image type="content" source="media/tutorial-install-app1.png" alt-text="A pop-up dialog is shown with the option to proceed to install the application or to cancel the action.":::

11. On the **Dynamics 365 Finance and Operations Provisioning App** page, you see options to configure the app.
   :::image type="content" source="media/tutorial-install-app2.png" alt-text="A configuration page is shown with several check boxes for options to enable.":::

   The options are:

   - **Enable Developer Tools for Finance and Operations**:  This option allows you to have a developer-enabled sandbox environment where you can connect Visual Studio and make X++ changes. If you leave this option unchecked, you get a standard, sandbox or production environment.
   - **Enable Demo Data for Finance and Operations**: This option deploys the standard Contoso demo data with your app.
   - **Select the version of the product to be installed**: You may select any of the available, supported versions for install.

12. Agree to the terms and conditions and select the **Install** button to start the installation.

When the install is triggered, it takes roughly an hour for the operation to complete. During the installation, Finance and Operations Provisioning App appears in **Installing** status until the install is completes.

## Application versions

As mentioned in the above instructions, now you have the ability to install any of the available versions of finance and operations apps. Following table represents some example versions you may encounter.

| Application version | Details | Available within |
|---------------------|-------------|------------------|
| 10.0.40.2 (Preview) | Version 10.0.40, with 3 proactive quality updates installed. It's also a preview build. | [Early release cycle environments](/power-platform/admin/early-release) only. |
| 10.0.39.4           | Version 10.0.39, with 5 proactive quality updates installed. | All geos. |
| 10.0.38.9           | Version 10.0.38, with 10 proactive quality updates installed. | All geos. |

Each application version includes its latest proactive quality update, there's no way to get an earlier build of an application version. Preview builds are only available to [Early release cycle environments](/power-platform/admin/early-release).
