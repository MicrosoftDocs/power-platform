---
title: "Unified admin trials (preview)"
description: "Subscription based trial environments for administrators of Finance and operations apps"
author: laneswenka
ms.topic: overview
ms.date: 06/13/2023
ms.author: laswenka
---

# Unified admin trials (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Historically administrators, partners, and ISVs have had to use cloud-hosted environments in Lifecycle Services to create demo or trial environments for Finance and operations apps.  This was to demonstrate the software capabilities, as well as try out new features of the product on a low-cost basis.

To improve this experience, Microsoft has made available free subscription-based trial environments for Finance, Supply Chain Management, Project Operations, and Commerce apps. 

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.


## Acquire a free subscription-based trial license

The first step in deploying a trial environment is to acquire a trial license.  This can be done by a tenant administrator in the [Microsoft 365 Admin Center](https://admin.microsoft.com/) and visiting the **Marketplace** option.  

From there, you can search for many different products offered by Microsoft.  To find a Dynamics license for Finance and operations apps please search for the terms "Finance", "Supply Chain Management", "Project Operations", or "Commerce".  Locate the free trial offer and purchase this product.

Once purchased, assign the license to the administrative user who will login to Power Platform admin center and perform the environment creation.

## Deploy the trial in Power Platform admin center

After the trial license is assigned to your user account, visit Power Platform admin center and then click on the **Environments** tab in the navigation.  From there you can create a new environment using the **New** button in the action pane.  

Give the environment a name in the slider window that opens, and change the enviornment type to **Subscription-based trial**.  Then move on to the next tab where you will need to select a **Security group** and choose to **Enable Dynamics 365 apps*.  In the drop down menu,  you will find a template that related to the trial license you were given such as **Finance (preview)**.  You may then start the deployment which will take roughly an hour to complete.  

Once the deployment is finished you may use both Dataverse and Finance and operations apps capabilities in a unified trial environment.  This includes add-ins such as Export to Data Lake, Planning Optimization, and Finance Insights which were previously only available to paid customer environments in Lifecycle Services.

### Related articles

[Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)<br/>
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)<br/>
[Manage Dynamics 365 apps](/power-platform/admin/manage-apps)
