---
title: "Tutorial: Install the Finance and Operations Provisioning App (preview) | Microsoft Docs"
description: This tutorial demonstrates how to install the Finance and Operations Provisioning App on to an existing Power Platform environment.
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

Finance and operations apps have been reimagined as an application hosted by Microsoft Dataverse.  No longer do customers need to provision their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 platform applications.  Additionally, most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this tutorial, learn how to:

- Go to the Power Platform admin center and locate an existing environment with other Dynamics 365 apps installed.
- Install the Finance and Operations Provisioning app to finance and operations apps capabilities.

As an example of this scenario, a customer who already has purchased other Dynamics 365 apps and has existing environments would like to add finance and operations apps capabilities to one of these existing environments.  

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

### Before you begin

You can't install finance and operations apps in Power Platform unless you have a license assigned that grants this permission. An example license is Dynamics 365 Finance or Dynamics 365 Supply Chain Management for customers, and Dynamics 365 Operations Application Partner Sandbox for partners and ISVs.  This must be assigned by your license administrator to your user account in Microsoft Entra.  You can review the licenses currently assigned to you in the Subscription table on the [MyAccount](https://portal.office.com/account/?ref=MeControl) page.

You also must have at least 1 gigabyte of available Operations and Dataverse database capacities.  For more information, see [Manage storage and capacity](../finance-operations-storage-capacity.md).

Additionally, you can only install finance and operations apps in to a Power Platform environment that was created with Microsoft Dataverse.  The Dataverse instance also must have had the "Enable Dynamics365 apps" option enabled during creation to have the supporting infrastructure for customer engagement or finance and operations apps capabilities.  For more information on how to create this kind of Dataverse instance, see [Create and manage environments in the Power Platform admin center](../create-environment.md).

### Known limitations

Be sure to check out the latest known limitations available in the overview article [Unified admin experience for finance and operations apps (preview)](finance-operations-apps-overview.md#known-limitations-during-preview).

## Step-by-step installation guide

# [Power Platform admin center]

### Install on an environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments** in the navigation pane.  The **Environments** list page is displayed.
3. Select a given environment that  meets the criteria in the prior section.
4. Select **Dynamics 365 apps** under the **Resources** card on the environment details page.
5. Click on the **Install app** button.
6. Locate and install the **Dynamics 365 Finance and Operations Platform Tools** app.  This application provides platform support for installing ERP-based applications.
7. Locate and install the **Dynamics 365 Finance and Operations Provisioning app**.  This application provides the finance and operations apps capabilities for Dynamics 365 Finance, Supply Chain Management, Project Operations, Human Resources, and Commerce workloads.
    :::image type="content" source="media/tutorial-install-app1.png" alt-text="A pop-up dialog is shown with the option to proceed to install the application or to cancel the action.":::
8. Click **Ok** to proceed to the installation configuration page for the provisioning app.
    :::image type="content" source="media/tutorial-install-app2.png" alt-text="A configuration page is shown with several check boxes for options to enable.":::

At this step, you will be presented with some options to configure the app as you require.  
- **Enable Developer Tools**:  This option will allow you to have a developer-enabled sandbox where you can connect Visual Studio and make X++ changes.  If you leave this unchecked, you will get a standard environment (Sandbox or Production).
- **Enable Demo Data**:  This option will deploy the standard Contoso Demo Data with your app.  Note this option is going to be available soon.

After you have made your selections, agree to the terms and conditions and click the **Install** button to start the installation.

9. Once installed successfully, you will see the Finance and Operations URL available from the environment details page.