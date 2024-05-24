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

In this tutorial, you will learn how to:

> [!div class="checklist"]
> * Locate an existing environment in the Power Platform admin center with Finance and Operations Provisioning App installed.
> * Update the Finance and Operations Provisioning app to a newer application version.

For example, a customer has read that a new service update has been made available. The customer would like to update their sandbox enviornment to evaluate the new capabilities.  

## Step-by-step update guide

### Update a sandbox environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments** in the navigation pane. The **Environments** list page is displayed.
3. Select a given environment that has the Finance and Operations Provisioning App already installed.
4. Select **Dynamics 365 apps** under the **Resources** card on the environment details page.
5. Find the **Dynamics 365 Finance and Operations Provisioning App** and then click on it to select it.
6. Click on the **Manage** button that will open the update experience in a new browser tab or window.

   :::image type="content" source="media/tutorial-install-app1.png" alt-text="A pop-up dialog is shown with the option to proceed to install the application or to cancel the action.":::
7. You will see options to select a new application version.  The drop down list will include only versions that are higher than your currently installed version.
9. Agree to the terms and conditions and select the **Install** button to start the update.

When the update is triggered, it will take roughly an hour for the operation to complete.  During the update, you will see the Finance and Operations Provisioning App is in an **Installing** status until it completes.

## Application versions

As mentioned in the above instructions, you will have the ability to install various supported versions of finance and operations apps.  Below is a table that represents some example versions you may encounter.

| Application version | Details | Available within |
|---------------------|-------------|------------------|
| 10.0.40.2 (Preview) | This is version 10.0.40, with 3 proactive quality updates installed. It is also a preview build. | [Early release cycle environments](/power-platform/admin/early-release) only. |
| 10.0.39.4           | This is version 10.0.39, with 5 proactive quality updates installed. | All geos. |
| 10.0.38.9           | This is version 10.0.38, with 10 proactive quality updates installed. | All geos. |

You will notice that each application version will include its latest proactive quality update, there is no way to get an earlier build of an application version.  Preview builds are only available to [Early release cycle environments](/power-platform/admin/early-release).