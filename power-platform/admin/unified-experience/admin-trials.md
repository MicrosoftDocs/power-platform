---
title: "Unified admin trials"
description: "Subscription-based trial environments for administrators of finance and operations apps."
author: laneswenka
ms.topic: concept-article
ms.date: 11/25/2025
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks

---

# Unified admin trials

Administrators, partners, and ISVs historically had to use cloud-hosted environments in Dynamics 365 Lifecycle Services to create demo or trial environments for finance and operations apps. This approach helped them demonstrate the software capabilities and try out new features of the product at a low cost.

To improve this experience, Microsoft provides free subscription-based trial environments for finance and operations apps, including Dynamics 365 Finance, Supply Chain Management, Project Operations, and Commerce apps.

> [!IMPORTANT]
> The trial environments don't support development with Visual Studio. For development, you need a developer-focused sandbox environment. For more information, see [Install and configure development tools](/power-platform/developer/unified-experience/finance-operations-install-config-tools).

## Acquire a free subscription-based trial license

To deploy a trial environment, first acquire a trial license. A tenant administrator can get a trial license in the [Microsoft 365 admin center](https://admin.microsoft.com/) by visiting the **Marketplace** option.  

From the marketplace, you can search for many different products offered by Microsoft. To find a Dynamics 365 license for finance and operations apps, search for the terms **Finance**, **Supply Chain Management**, **Project Operations**, or **Commerce**. Locate the free trial offer and purchase this product.

After you purchase the product, assign the license to an admin who can sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and create the environment.

## Deploy the trial in Power Platform admin center

1. After assigning the trial license to your user account, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments** to display the **Environments** page.
1. Select **New** to create a new environment. The **New environment** pane is displayed.
1. Enter a name for the environment.
1. Select your region.
1. Change the environment type to **Trial (subscription-based)**.
1. Select **Next**.
1. Select a **Security group** and choose to **Enable Dynamics 365 apps**.
1. In the dropdown menu, select the template that is related to the trial license you were given, such as **Finance (Preview)**.
1. Select **Save** to start the deployment, which might take an hour to complete.  

After the deployment is finished, you may use both Dataverse and finance and operations apps capabilities in a unified trial environment. This includes add-ins, such as **Export to Data Lake**, **Planning Optimization**, and **Finance Insights**, which were previously only available to paid customer environments in Lifecycle Services.

### Related articles

- [Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)
- [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)
- [Manage Dynamics 365 apps](/power-platform/admin/manage-apps)
