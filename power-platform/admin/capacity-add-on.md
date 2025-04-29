---
title: Capacity add-ons for Power Apps and Power Automate  
description: This topic covers the Per app, Power Automate per business process, AI builder, Portal logins, and Portal views. 
ms.date: 04/29/2025
ms.reviewer: sericks
ms.topic: conceptual
author: sericks007
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
search.audienceType: 
  - admin
ms.contributors:
- laneswenka
---
# Capacity add-ons

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Capacity add-ons can be purchased for various business applications products.  The content below describes the process of allocating add-ons, where applicable.  Microsoft Dataverse storage capacity add-ons do not require allocation at an environment level because all storage capacity add-ons accrue to tenant-level storage entitlements.  For more information, see [legacy model storage](legacy-capacity-storage.md) or [new model storage](capacity-storage.md).

There are three stages for using capacity add-ons:

1. Purchase: you buy individual capacity add-ons. For purchasing information, see the [Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).
2. Allocate: assign the purchased add-ons to an environment.
3. Consume: once allocated, you can consume the capacity add-ons.

> [!TIP]
> Consider purchasing Power Apps per app plans which allow individual users to run one application or one portal. See [About Power Apps per app plans](about-powerapps-perapp.md).

## View capacity add-ons in Power Platform admin center

If your organization has purchased capacity add-ons, an **Add-ons** tile appears on the **Capacity** screen in the Microsoft [Power Platform admin center](https://admin.powerplatform.microsoft.com/). 

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Licensing**.
1. In the **Licensing** pane, select **Capacity add-ons**.
1. In the **Capacity** page, select the **Add-ons** tab.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, expand **Resources**, then select **Capacity**.
1. In the **Capacity** page, select the **Add-ons** tab.
---

The **Add-ons** tile shows summary information about the capacity add-ons that your organization has.

![Add-on tile.](media/add-on-tile2.png "Add-on tile")

Each capacity has a usage gauge that shows how many units have been assigned compared to the available capacity. Capacities are measured in different ways depending on the product. For example, App passes are assigned individually, while AI Builder capacity is measured in credits. Refer to the product documentation for more information about metering.

## Allocate or change capacity in an environment

To allocate capacity to an environment:

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Resources**, then choose **Capacity**.
1. Select the **Summary** tab.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Licensing**.
1. In the **Licensing** pane, select **Capacity add-ons**.
1. Select the **Summary** tab.
---

On the **Summary** tab view, do **one** of the following to open the **Manage add-ons** screen:

   - Scroll down to the Add-ons tile, and then select **Manage** on the top-right corner of the Add-ons tile.
   - Select the **Add-ons** tab. Select **Assign to an environment** in the upper-left menu bar.    
   - Select the **Add-ons** tab. Select an environment, and then select **Manage add-ons** in the upper-left menu bar.

   You can also select **Download reports** to download usage reports for various capacities.
   
On the **Manage add-ons** site panel, select the environment where you want to add capacity from the **Environment** drop-down menu, and then allocate from your available capacity.

   > [!div class="mx-imgBorder"] 
   > ![Manage add-ons.](./media/manage-add-ons.png "Manage add-ons")

   **Some examples**

   - If you have 10 users who are going to be using 1 app each, you should assign 10 **app passes** to the app environment.
   - If you want to create 5 flows in an environment which are going to be used for business process flows, assign a capacity of 5 for **flow per business process**.
  - If a company has created a portal and anticipate 50,000 views of the portal, they should allocate 50,000 **portal page views**.

> [!NOTE]
> If you want to update many add-on allocations across environments at scale, see [Tutorial: Allocate add-ons to environments (preview)](./programmability-tutorial-allocate-capacity-addons.md) for more information.

## Control who can allocate add-on capacity

As an admin, you can restrict who can allocate add-on capacity to environments.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. In the command bar, select **Settings**.
3. Select **Power Platform settings**.
4. On the **Tenant settings** page, select **Add-on capacity assignments**, then choose **Only specific admins**.
5. Click **Save** to apply the changes.

The following admins will be able to allocate add-on capacity in the Power Platform admin center:

- Dynamics 365 admins
- Power Platform admins

### See also
[About Power Apps per app plans](about-powerapps-perapp.md)
[AI Builder consumption report](/ai-builder/administer-consumption-report)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
