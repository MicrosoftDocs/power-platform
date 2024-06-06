---
title: "Tutorial: Update the Finance and Operations Provisioning App  | Microsoft Docs"
description: Learn how to update the Finance and Operations Provisioning App within existing Power Platform environment.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 05/23/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Update the Finance and Operations Provisioning App 

Finance and operations apps are reimagined as an application hosted by Microsoft Dataverse. Customers don't need to provision their enterprise resource planning (ERP) system separately from their low-code and other Dynamics 365 platform applications. Most administrative actions in Power Platform are available through the admin center and an API-based experience.

In this tutorial, learn how to:

> [!div class="checklist"]
> * Locate an existing environment in the Power Platform admin center with Finance and Operations Provisioning App installed.
> * Update the Finance and Operations Provisioning app to a newer application version.

For example, a customer reads that a new service update is available wants update their sandbox environment to evaluate the new capabilities.  

## Step-by-step update guide

### Update the application to a newer version

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments** in the navigation pane. The **Environments** list page is displayed.
3. Select a given environment that has the Finance and Operations Provisioning App already installed.
4. Select **Dynamics 365 apps** under the **Resources** card on the environment details page.
5. Find the **Dynamics 365 Finance and Operations Provisioning App** and then click on it to select it.
6. After Clicking on the **Manage** button, update experience opens up in a new browser tab or window. If the manage button isn't available, then you're running the latest version and can't.

   :::image type="content" source="media/tutorial-install-app1.png" alt-text="A pop-up dialog is shown with the option to proceed to install the application or to cancel the action.":::
7. Options to select a new application version is shown. The drop-down list includes only versions that are higher than your currently installed version. You may see no version option to select, in that case there are no newer versions beyond current version of your environment.
9. Agree to the terms and conditions and select the **Install** button to start the update.

When the update is triggered, it takes roughly an hour for the operation to complete. During the update, Finance and Operations Provisioning App appears in **Installing** status until the update is completes.

## Application versions

As mentioned in the above instructions, now you have the ability to update your environment to any of the available versions of finance and operations apps. Following table represents some example versions you may encounter.

| Application version | Details | Available within |
|---------------------|-------------|------------------|
| 10.0.40.2 (Preview) | Version 10.0.40, with 3 proactive quality updates installed. It's also a preview build. | [Early release cycle environments](/power-platform/admin/early-release) only. |
| 10.0.39.4           | Version 10.0.39, with 5 proactive quality updates installed. | All geos. |
| 10.0.38.9           | Version 10.0.38, with 10 proactive quality updates installed. | All geos. |

Each application version includes its latest proactive quality update, there's no way to get an earlier build of an application version. Preview builds are only available to [Early release cycle environments](/power-platform/admin/early-release).