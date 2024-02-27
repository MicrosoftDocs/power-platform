---
title: "Tutorial: Install the Finance and Operations Provisioning App (preview) | Microsoft Docs"
description: Learn how to install the Finance and Operations Provisioning App onto an existing Power Platform environment.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 09/29/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Install the Finance and Operations Provisioning App (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Finance and operations apps are reimagined as an application hosted by Microsoft Dataverse. Customers don't need to provision their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 platform applications. Most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this article, learn how to:

- Locate an existing environment in the Power Platform admin center with other Dynamics 365 apps installed.
- Install the Finance and Operations Provisioning app to see finance and operations apps capabilities.

For example, a customer who already purchased other Dynamics 365 apps wants to add finance and operations apps capabilities to one of their existing environments.  

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Prerequisites

- You must have a license to install finance and operations apps in Power Platform.

  Example licenses:

  - Dynamics 365 Finance
  - Dynamics 365 Supply Chain Management for customers
  - Dynamics 365 Operations Application Partner Sandbox for partners and ISVs

- Your license administrator must assign the license to your user account in Microsoft Entra. You can review the licenses currently assigned to you from the [Subscriptions](https://portal.office.com/account/?ref=MeControl#subscriptions) page.

- Have at least 1 GB of available Operations and Dataverse database capacities. For more information, see [Manage storage and capacity](../finance-operations-storage-capacity.md).

- You can only install finance and operations apps into a Power Platform environment created with Microsoft Dataverse. The Dataverse instance must have the **Enable Dynamics 365 apps** option enabled during creation. For more information on how to create a Dataverse instance, see [Create and manage environments in the Power Platform admin center](../create-environment.md).

## Known limitations

Limitations for an installation of the provisioning app:  

1. You must use an environment with the **Enable Dynamics 365 apps** enabled when the environment is created. This enabling is a prerequisite for all Dynamics 365 apps, including Sales, Customer Service, Field Service, and all finance and operations apps.

   > [!NOTE]
   > If you try to install without enabling Dynamics 365 apps, you receive an error such as **Dynamics 365 Finance and Operations Provisioning App isn't supported on SchemaType: Standard**. The schema isn't a visible property in Power Platform admin center and can't be changed after the environment is created. You can try installing finance and operations apps in another environment, or [Create an environment with an ERP template](./tutorial-deploy-new-environment-with-ERP-template.md).

2. You must first install the Platform tools app before installing the Provisioning app. The detailed steps are outlined in [Install on an environment](#install-on-an-environment).

   > [!NOTE]
   > If you don't install the Provisioning app first, you get an error such as **Please install the Dynamics 365 Finance and Operations Platform Tools application before installing the Dynamics 365 Finance and Operations Provisioning app**. You can install the missing app, and then retry the installation of the Provisioning app.

## Step-by-step installation guide

### Install on an environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane. The **Environments** list page is displayed.
1. Select a given environment that meets the prerequisite criteria.
1. Select **Dynamics 365 apps** under the **Resources** card on the environment details page.
1. Select **Install app**.
1. Locate and install the **Dynamics 365 Finance and Operations Platform Tools** app. This application provides platform support for installing ERP-based applications.
1. Locate and install the **Dynamics 365 Finance and Operations Provisioning app**. This application provides the finance and operations apps capabilities for Dynamics 365 Finance, Supply Chain Management, Project Operations, Human Resources, and Commerce workloads.
   :::image type="content" source="media/tutorial-install-app1.png" alt-text="A pop-up dialog is shown with the option to proceed to install the application or to cancel the action.":::
1. Select **OK** to go to the installation configuration page for the provisioning app.
   :::image type="content" source="media/tutorial-install-app2.png" alt-text="A configuration page is shown with several check boxes for options to enable.":::

   You see options to configure the app.

   - **Enable Developer Tools**:  This option allows you to have a developer-enabled sandbox where you can connect Visual Studio and make X++ changes. If you leave this option unchecked, you get a standard environment—sandbox or production.
   - **Enable Demo Data**: This option deploys the standard Contoso Demo Data with your app.
     > [!NOTE]
     > This option is going to be available soon.

1. Agree to the terms and conditions and select the **Install** button to start the installation.

   Once installed successfully, you see the Finance and Operations URL available from the environment details page.
