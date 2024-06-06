---
title: " Tutorial: Update the Finance and Operations Provisioning app   | Microsoft Docs"
description: This tutorial demonstrates how to use the Power Platform to provision an environment with finance and operations apps installed.
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

# Tutorial: Update the Finance and Operations Provisioning app 

Finance and operations apps are reimagined as an application hosted by Microsoft Dataverse. Customers don't need to provision their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 applications. Most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this tutorial, learn how to:

- Locate an existing environment in the Power Platform admin center with the Finance and Operations Provisioning app installed.
- Update the Finance and Operations Provisioning app to a newer application version.

For example, a customer reads that a new service update is available and wants to update their sandbox environment to evaluate the new capabilities.  

## Update the application to a newer version

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments** in the navigation pane. The **Environments** list page is displayed.
3. Select a given environment that has the Finance and Operations Provisioning app already installed.
4. Select **Dynamics 365 apps** in the **Resources** card on the environment's details page.
5. Select the checkmark next to **Dynamics 365 Finance and Operations Provisioning App**. Then select the **More applications actions** icon (**...**) and select **Manage**.

   > [Note]
   > If the **Manage** button isn't available, then you're running the latest version and no update is available.
   
6. A window appears stating that a new admin page will appear. Select OK.

    :::image type="content" source="media/tutorial-install-app1.png" alt-text="A pop-up dialog is shown with the option to proceed to install the application or to cancel the action.":::
   
7. The **Dynamics 365 Finance and Operations Provisioning App** update experience page is displayed in a new browser tab or window. Options to select a new application version is shown.

   The drop-down list includes only versions that are higher than your currently installed version. You may see no version option to select, in that case there are no newer versions beyond the current version of your environment.

8. Agree to the terms and conditions, and then select **Install** to start the update.

  When the update is triggered, it takes roughly an hour for the operation to complete. During the update, Finance and Operations Provisioning app appears in **Installing** status until the update is completes.

## Application versions

As mentioned in the above instructions, when you have the ability to update your environment, you must select a version of finance and operations apps. The following table represents some example versions you may encounter.

| Application version | Details | Available within |
|---------------------|-------------|------------------|
| 10.0.40.2 (Preview) | Version 10.0.40, with three proactive quality updates installed. It's also a preview build. | [Early release cycle environments](/power-platform/admin/early-release) only. |
| 10.0.39.4           | Version 10.0.39, with five proactive quality updates installed. | All geos. |
| 10.0.38.9           | Version 10.0.38, with ten proactive quality updates installed. | All geos. |

Each application version includes its latest proactive quality update, there's no way to get an earlier build of an application version. Preview builds are only available to [Early release cycle environments](/power-platform/admin/early-release).
