---
title: "Tutorial: Update the Finance and Operations Provisioning app   | Microsoft Docs"
description: This tutorial demonstrates how to use the Power Platform admin center to provision an environment with finance and operations apps installed.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 09/20/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Update the Finance and Operations Provisioning app

Finance and operations apps are reimagined as an application that is hosted by Microsoft Dataverse. Customers no longer have to provision their enterprise resource planning (ERP) system separately from their low-code applications and other Dynamics 365 applications. Most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this tutorial, learn how to:

- Find an existing environment in the Power Platform admin center where the Finance and Operations Provisioning app is installed.
- Update the Finance and Operations Provisioning app to a newer application version.

For example, a customer reads that a new service update is available and wants to update their sandbox environment to evaluate the new capabilities.

## Update the application to a newer version

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. On the navigation pane, select **Environments**. The **Environments** list page is shown.
1. Select an environment where the Finance and Operations Provisioning app is already installed.
1. On the environment details page, on the **Resources** card, select **Dynamics 365 apps**.
1. Select the checkbox next to **Dynamics 365 Finance and Operations Provisioning App**, select the **More applications actions** button (**&hellip;**), and then select **Manage**.

    > [!NOTE]
    > If the **Manage** command isn't available, you're running the latest version, and no update is available.

1. A message box informs you that you're about to go to a new page where you can manage the Finance and Operations Provisioning app. Select **OK**.

    :::image type="content" source="media/tutorial-install-app1.png" alt-text="Message box that gives you the option to proceed with management of the application or cancel the action.":::

1. The **Dynamics 365 Finance and Operations Provisioning App** update experience page is opened on a new browser tab or in a new browser window. In the dropdown list, select a new application version.

    > [!NOTE]
    > The dropdown list includes only versions that are later than your currently installed version. If no versions are listed, the current version of your environment is the latest version.
    
    > [!IMPORTANT]
    > If the application version dropdown list shows no options, the environment is already up to date. In this situation, please refrain from submitting an update request.

1. Agree to the terms and conditions, and then select **Install** to start the update.

    The update takes about an hour to be completed. While the update is still in progress, the status of the Finance and Operations Provisioning app is shown as **Installing**.

## Application versions

As was mentioned in the previous section, if you're able to update your environment, you must select a version of finance and operations apps. The following table represents some example versions that you might encounter.

| Application version | Details | Available in |
|---------------------|---------|--------------|
| 10.0.40.2 (Preview) | Version 10.0.40, with three proactive quality updates (PQUs) installed. This version is also a preview build. | [Early release cycle environments](/power-platform/admin/early-release) only. |
| 10.0.39.4           | Version 10.0.39, with five PQUs installed. | All geos. |
| 10.0.38.9           | Version 10.0.38, with ten PQUs installed. | All geos. |

Each application version includes its latest PQU. There's no way to get an earlier build of an application version. Preview builds are only available to [early release cycle environments](/power-platform/admin/early-release).
