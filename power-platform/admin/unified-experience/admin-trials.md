---
title: "Unified admin trials (preview)"
description: "Subscription based trial environments for administrators of finance and operations apps."
author: laneswenka
ms.topic: conceptual
ms.date: 08/25/2023
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks

---

# Unified admin trials (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Historically administrators, partners, and ISVs have had to use cloud-hosted environments in Lifecycle Services (LCS) to create demo or trial environments for finance and operations apps.  This was to demonstrate the software capabilities and try out new features of the product on a low-cost basis.

To improve this experience, Microsoft has made available free subscription-based trial environments for Dynammics 365 finance and operations apps, including Finance, Supply Chain Management, Project Operations, and Commerce apps. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Acquire a free subscription-based trial license

The first step in deploying a trial environment is to acquire a trial license.  This can be done by a tenant administrator in the [Microsoft 365 Admin Center](https://admin.microsoft.com/) and visiting the **Marketplace** option.  

From there, you can search for many different products offered by Microsoft.  To find a Dynamics 365 license for finance and operations apps please search for the terms **Finance**, **Supply Chain Management**, **Project Operations**, or **Commerce**.  Locate the free trial offer and purchase this product.

After the product is purchased, assign the license to an admin who can sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com) and perform the environment creation.

## Deploy the trial in Power Platform admin center

1. After the trial license is assigned to your user account, sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane. The **Environments** page is displayed.
1. Select **New** to create a new environment.
1. Give the environment a name in the pane that is displayed.
1. change the enviornment type to **Subscription-based trial**.
1. Move on to the next tab where you will need to select a **Security group** and choose to **Enable Dynamics 365 apps**.
1. In the drop down menu, select the template that is related to the trial license you were given, such as **Finance (preview)**.
1. Start the deployment, which may take an hour to complete.  

After the deployment is finished, you may use both Dataverse and finance and operations apps capabilities in a unified trial environment. This includes add-ins, such as **Export to Data Lake**, **Planning Optimization**, and **Finance Insights**, which were previously only available to paid customer environments in Lifecycle Services.

### Related articles

- [Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)
- [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)
- [Manage Dynamics 365 apps](/power-platform/admin/manage-apps)
