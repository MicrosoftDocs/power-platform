---
title: "View and manage on-premises data gateways | MicrosoftDocs"
description: View and manage on-premises gateways. 
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/26/2025
author: arthiriyer
ms.subservice: admin
ms.author: arthii
ms.reviewer: sericks
ms.contributors:
  - lsuresh
contributors:
  - lavanyapg
search.audienceType: 
  - admin
---

# On-premises data gateway management

The on-premises data gateway acts as a bridge, providing quick and secure data transfer between on-premises data (data that is not in the cloud) and the Power BI, Power Automate, Logic Apps, and Power Apps services. More information, see [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem).

> [!NOTE]
> The gateway management feature in the Power Platform admin center isn’t supported on mobile or smaller screens with a resolution lower or equal to 320 x 256. 

On the **Data** page of the [Power Platform admin center](https://admin.powerplatform.microsoft.com), you can view and manage on-premises data gateways.

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, under **Data** section, select **Data (preview)**. 
**
# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Data(preview)** in the left-side menu.

---

Users who are part of the Microsoft Entra Global administrator role (which includes Global admins), Power BI service administrators, and Gateway administrators will have access to data gateway management on the Power Platform admin center. However, there might be differences in the features available and the operations that can be performed by each of these roles.

The Microsoft Entra Global administrator role (which includes Global admins) and Power BI service administrators can use the **Tenant administration** setting to control the list of gateways exposed. Only these admins will see the **Tenant administration** toggle.

- Turn on **Tenant administration** to see and manage all gateways installed in your enterprise.
- Turn off **Tenant administration** to see and manage all gateways for which you are an administrator.

You can switch between these two views using this toggle in the upper-right corner of the page.

> [!div class="mx-imgBorder"] 
> ![Power Platform admin.](media/tenant-administration.png "Power Platform admin")

## Data gateways

The **Data (preview)** page lists all on-premises data gateway clusters installed. In addition, you can review the following information about these clusters:

- **Gateway cluster name**: The name of the gateway cluster.
- **Contact info**: Admin contact information for the gateway cluster. 
- **Users**: The list of gateway users.
- **Status**: Select **Check status** to see whether the gateway connection is online or offline.
- **Gateways**: The number of gateway members in the gateway cluster.

The gateway cluster list includes both on-premises data gateways and on-premises data gateways (personal mode).

> [!div class="mx-imgBorder"] 
> ![On-premises gateway page.](media/data-gateways-two-tab-view.png "On-premises gateway page")   

## Details

Select a gateway cluster and then select **Details** to see the following information on gateway members.

> [!div class="mx-imgBorder"] 
> ![Gateway details.](media/data-gateways-details.png "Gateway details")

> [!div class="mx-imgBorder"] 
> ![Gateway member details.](media/data-gateways-member-details.png "Gateway member details")

- **Name**: The name of the gateway member.
- **Device**: The physical device on which the gateway is installed.
- **Status**: Select (![Gateway status.](media/gateway-status.png "Gateway status")) to check the status of a gateway member.
- **Version**: The gateway software version installed on the machine.
- **State**: Select to enable or disable a gateway member.

After selecting a gateway member, you can select **Remove** to remove it. This does not uninstall the gateway from the physical machine but removes all the metadata regarding the gateway. It's not possible to change the gateway member's name once it is installed and configured.

## Settings

Select **Settings** to set on-premises data gateway settings such as the gateway cluster name, department, General settings and Power BI settings. 

> [!div class="mx-imgBorder"] 
> ![Data gateway settings tab.](media/data-gateways-settings-tab.png "Data gateway settings tab")

> [!div class="mx-imgBorder"] 
> ![Data gateway settings.](media/data-gateways-settings.png "Data gateway settings")

For more information on **Allow user's cloud datasources to refresh through this gateway cluster**, go to [Merge or append on-premises and cloud data sources](/power-bi/connect-data/service-gateway-mashup-on-premises-cloud).

For more information on **Allow user's custom data connectors to refresh through this gateway cluster**, go to [Use custom data connectors with the on-premises data gateway](/power-bi/service-gateway-custom-connectors).

For more information on **Distribute requests across all active gateways in this cluster**, go to [Load balance across gateways in a cluster](/data-integration/gateway/service-gateway-high-availability-clusters#load-balance-across-gateways-in-a-cluster).

## Manage users

Select a gateway cluster and then select **Manage users** to see the list of gateway users. Add or remove gateway admins on the **Manage users** page.

For personal gateways, this would show the owner of the personal gateway and cannot be changed due to the security scope of personal gateways.

For on-premises data gateways in standard mode, users can be added in any of the following three categories: 
 
- **Admin**: 
  - **Power BI**: Administrators have full control of the gateway, including adding other admins, creating data sources, managing data source users, and deleting the gateway. 
  - **Power Apps and Power Automate**: Administrators have full control of the gateway, including adding other admins, creating connections, additionally sharing gateways in **Can use** and **Can use + share** permission levels and deleting the gateway.
  - **Others**: Administrators have full control of the gateway, including adding other admins and deleting the gateway.
- **Can use**: Users who can create connections on the gateway to use for apps and flows but cannot share the gateway. Use this permission for users who will run apps but not share them. Applies only to Power Apps and Power Automate. 
- **Can use + share**: Users who can create a connection on the gateway to use for apps and flows, and automatically share the gateway when sharing an app. Use this permission for users who need to share apps with other users or with the organization. Applies only to Power Apps and Power Automate. 

> [!NOTE]
> - **Can Use** and **Can use + share** apply only to Power Apps and Power Automate. 
> - While sharing gateways for **Can use** and **Can use + share** permission levels, you can restrict the data source type that the user can connect over the gateway. At least one data source type should be selected for the user to be successfully added.
> - **Can Use** and **Can use + share** do not apply to custom connectors in Power Apps and Power Automate.
> - The gateway must be shared with the **Admin** permission level to be used by custom connectors.

## Remove a gateway cluster

Use **Remove** to remove a gateway cluster. This operation is available for data gateways in standard mode as well as personal mode.

> [!div class="mx-imgBorder"] 
> ![Remove gateway cluster.](media/data-gateways-remove.png "Remove gateway cluster")

For more information, go to [Remove or delete an on-premises data gateway](/data-integration/gateway/service-gateway-manage#remove-or-delete-an-on-premises-data-gateway).

## Get help

For faster troubleshooting and assistance, select **Get help** to open a Get Help panel. Include the session ID in a customer support ticket for any issues on the Data Gateways feature in the Power Platform admin center.

> [!div class="mx-imgBorder"] 
> ![Get help.](media/get-help-gateway.png "Get help")

## Manage gateways by region

Select the region drop-down list to see the gateway regions. When you select one of the regions, you'll see a list of gateways installed in that region. You can manage users or view gateway members for these gateways. By default, you'll see gateways within your tenant's default region.

> [!div class="mx-imgBorder"] 
> ![Manage by gateway region.](media/manage-gateway-by-region.png "Manage by gateway region")

## Filter by gateway type

Select the gateway type drop-down list to filter by gateway type. By default, you'll see all data gateways running in standard mode. Use the filter to see data gateways in personal mode or all gateways. For more information, see [Types of gateways](/power-bi/service-gateway-onprem#types-of-gateways).

> [!div class="mx-imgBorder"] 
> ![Filter by type.](media/manage-gateway-by-type.png "Filter by type")

## Search

Use **Search** to find gateway clusters and see their details. You can search for gateway cluster names and contact info, but not administrators.

> [!div class="mx-imgBorder"] 
> ![Search.](media/manage-gateway-search.png "Search")

## Status

Select a gateway cluster, then select **Details** > **Check status** (![Gateway status.](media/gateway-status.png "Gateway status")) to check the status of a gateway cluster.

> [!div class="mx-imgBorder"] 
> ![Check status.](media/data-gateways-status.png "Check status")

## Manage gateway installers

As either a Microsoft Entra Global administrator (which includes Global admins) or a Power BI service administrator, use Manage gateway installers to manage who can install the on-premises data gateway in your enterprise. This operation isn't available for gateway admins.

> [!NOTE]
> This feature does not apply to on-premises data gateways (personal mode).

1. Select **Manage gateway installers**.

   > [!div class="mx-imgBorder"] 
   > ![Manage gateway installers.](media/manage-gateway-installers.png "Manage gateway installers")

1. Enable **Restrict Users in your organization from installing gateways**. This option is off by default, allowing anyone in your organization to install a gateway.

1. Add users who can install gateways, and then select **Add**.

   > [!NOTE]
   > Currently, we do not support groups for Manage Installers; you can add individual users. 

1. To remove users who have permission to install gateways, select **Remove installer** (![Remove installer.](media/nb-ua-r1-trashbin.png)), and then select **Confirm**.

   > [!NOTE]
   > This does not impact gateways that are already installed. This feature only allows or restricts users from installing gateways going forward.

If a person who doesn't have access to install gateways tries to install one, they will get the following error once they provide their credentials during the gateway registration.

> [!div class="mx-imgBorder"] 
> ![Error message.](media/manage-gateway-error-message.png "Error message")

### See also

[On-premises data gateway](/data-integration/gateway/service-gateway-onprem)<br/>
[Connecting to on-premises data sources with On-premises Data Gateway](/azure/analysis-services/analysis-services-gateway)<br/>


[!INCLUDE[footer-include](../includes/footer-banner.md)]
