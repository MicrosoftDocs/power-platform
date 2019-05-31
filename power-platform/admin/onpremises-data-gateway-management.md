---
title: "Preview: On-premises data gateway management | MicrosoftDocs"
description: View and manage on-premises gateways. 
ms.custom: ""
ms.date: 05/31/2019
ms.reviewer: ""
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# On-premises data gateway management

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The On-premises data gateway acts as a bridge, providing quick and secure data transfer between on-premises data (data that is not in the cloud) and the Power BI, Microsoft Flow, Logic Apps, and PowerApps services.

You can use the Power Platform Admin center to get visibility into all on-premises data gateways in a tenant. To do so, sign in as a tenant admin and select the **Data Gateway** option.

> [!NOTE]
> Only users who are part of the Azure AD Global administrator role (which includes Office 365 Global admins) and Power BI service administrators can use the **Data Gateway** management feature.

> [!div class="mx-imgBorder"] 
> ![On-premises gateway page](media/onprem-gateway-manage780.png "On-premises gateway page")

The Gateways page lists all on-premises data gateway clusters installed on the tenant. In addition, you can review the following information about these clusters:

- **Gateway Cluster Name**: The name of the gateway cluster.
- **Contact Info**: Admin contact information for the gateway cluster. 
- **Administrators**: The list of gateway administrators.
- **Gateways**: The number of gateway members in the gateway cluster.

The gateway cluster list includes both On-premises data gateways and On-premises data gateways(personal mode).

> [!NOTE]
> On-premises data gateways in non-default environments/regions are currently not included. 

## Display gateway members

Select the **Open in new window** icon (![Open in new window](media/open-in-new-window.png)) next to the gateway cluster name to see the gateway members, device name, and version in each gateway cluster.

> [!div class="mx-imgBorder"] 
> ![Open in new window](media/manage-open-in-new-window75.png "Open in new window")

## Manage gateway admins

Select the **People** icon (![People](media/people.png)) next to the gateway cluster name to see the list of gateway admins. Add or remove gateway admins in the **Manage Administrators** page.

For personal gateways, this would show the owner of the personal gateway and cannot be changed due to the security scope of personal gateways.

> [!div class="mx-imgBorder"] 
> ![Manage admins](media/manage-admins75.png "Manage admins")

## Search

Use **Search** to find gateway clusters and see their details. You can search for gateway cluster names and contact info, but not administrators.

> [!div class="mx-imgBorder"] 
> ![Search](media/manage-search.png "Search")

## Manage installers

As a global admin, use **Manage Gateway installers** to manage who can install the On-premises data gateway in your enterprise. 

1. Go to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com).

2. Select **Data Gateways** from the left-side menu.

3. Select **Manage Gateway installers**.

   > [!div class="mx-imgBorder"] 
   > ![Manage Gateway installers](media/manage-gateway-installers.png "Manage Gateway installers")

4. Enable **Restrict Users in your organization from installing gateways**. This option is off by default allowing anyone in your organization to install gateway.

   > [!div class="mx-imgBorder"] 
   > ![Enable restrict users](media/manage-gateway-installers-turn-on.png "Enable restrict users")

5. Add users who can install gateway, and then select **Add**.

   > [!div class="mx-imgBorder"] 
   > ![Add users](media/manage-gateway-installers-add-users.png "Add users")

   > [!NOTE]
   > Currently, we do not support groups for Manage Installers; you can add individual users. 

6. To remove users who have permission to install gateway, select **Remove installer** (![Remove installer](media/nb-ua-r1-trashbin.png)), and then select **Confirm**.

   > [!div class="mx-imgBorder"] 
   > ![Remove user](media/remove-installer.png "Remove user")

   > [!NOTE]
   > This does not impact gateways which are already installed. This feature only allows or restricts users from installing gateways going forward.

If a person who doesn’t have access to install gateways tries to install one, they will get the following error once they provide their credentials during the gateway registration.

> [!div class="mx-imgBorder"] 
> ![Error message](media/manage-gateway-error-message.png "Error message")

### See also
 [On-premises data gateway](https://docs.microsoft.com/power-bi/service-gateway-onprem)<br/>
 [Connecting to on-premises data sources with On-premises Data Gateway](https://docs.microsoft.com/azure/analysis-services/analysis-services-gateway)<br/>