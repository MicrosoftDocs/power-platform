---
title: View and manage on-premises data gateways 
description: View and manage on-premises gateways. 
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/04/2026
author: arthiriyer
ms.subservice: admin
ms.author: arthii
ms.reviewer: ellenwehrle
ms.contributors:
  - lsuresh
contributors:
  - charls-msft
  - lavanyapg
search.audienceType: 
  - admin
ms.custom:
  - sfi-image-nochange
  - sfi-ga-nochange
---

# On-premises data gateway management

The on-premises data gateway acts as a bridge, providing quick and secure data transfer between on-premises data (data that isn't in the cloud) and the Power BI, Power Automate, Logic Apps, and Power Apps services. For more information, see [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem).

> [!NOTE]
> The gateway management feature in the Power Platform admin center isn't supported on mobile or smaller screens with a resolution lower or equal to 320 x 256. 

On the **Data** page of the [Power Platform admin center](https://admin.powerplatform.microsoft.com), you can view and manage on-premises data gateways.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, under the **Data** section, select **Data (preview)**. 

Users who are part of the Microsoft Entra Global administrator role (which includes Global admins), Power BI service administrators, and Gateway administrators have access to data gateway management on the Power Platform admin center. However, there might be differences in the features available and the operations performed by each of these roles.

The Microsoft Entra Global administrator role (which includes Global admins) and Power BI service administrators can use the **Tenant administration** setting to control the list of gateways exposed. Only these admins see the **Tenant administration** toggle.

- Turn on **Tenant administration** to see and manage all gateways installed in your enterprise.
- Turn off **Tenant administration** to see and manage all gateways for which you're an administrator.

You can switch between these two views by using this toggle in the upper-right corner of the page.

:::image type="content" source="media/tenant-administration.png" alt-text="Power Platform admin.":::

## Data gateways

The **Data (preview)** page lists all on-premises data gateway clusters that you install. You can also review the following information about these clusters:

- **Gateway cluster name**: The name of the gateway cluster.
- **Contact info**: Admin contact information for the gateway cluster. 
- **Users**: The list of gateway users.
- **Status**: Select **Check status** to see whether the gateway connection is online or offline.
- **Gateways**: The number of gateway members in the gateway cluster.

The gateway cluster list includes both on-premises data gateways and on-premises data gateways (personal mode).

:::image type="content" source="media/data-gateways-two-tab-view.png" alt-text="On-premises gateway page.":::

## Details

Select a gateway cluster and then select **Details** to see the following information on gateway members.

:::image type="content" source="media/data-gateways-member-details.png" alt-text="Gateway member details.":::

- **Name**: The name of the gateway member.
- **Device**: The physical device on which the gateway is installed.
- **Status**: Select the **Gateway status** icon to check the status of a gateway member.
- **Version**: The gateway software version installed on the machine.
- **State**: Select to enable or disable a gateway member.

After selecting a gateway member, you can select **Remove** to remove it. This step doesn't uninstall the gateway from the physical machine but removes the metadata regarding the gateway. You can't change the gateway member's name after you install and configure it.

## Settings

Select **Settings** to set on-premises data gateway settings such as the gateway cluster name, department, General settings, and Power BI settings.

:::image type="content" source="media/data-gateways-settings.png" alt-text="Data gateway settings.":::

For more information on **Allow user's cloud datasources to refresh through this gateway cluster**, go to [Merge or append on-premises and cloud data sources](/power-bi/connect-data/service-gateway-mashup-on-premises-cloud).

For more information on **Allow user's custom data connectors to refresh through this gateway cluster**, go to [Use custom data connectors with the on-premises data gateway](/power-bi/service-gateway-custom-connectors).

For more information on **Distribute requests across all active gateways in this cluster**, go to [Load balance across gateways in a cluster](/data-integration/gateway/service-gateway-high-availability-clusters#load-balance-across-gateways-in-a-cluster).

## Manage users

Select a gateway cluster and then select **Manage users** to see the list of gateway users. Add or remove gateway admins on the **Manage users** page.

For personal gateways, this page shows the owner of the personal gateway and you can't change it due to the security scope of personal gateways.

For on-premises data gateways in standard mode, you can add users in any of the following three categories: 
 
- **Admin**: 
  - **Power BI**: Administrators have full control of the gateway, including adding other admins, creating data sources, managing data source users, and deleting the gateway. 
  - **Power Apps and Power Automate**: Administrators have full control of the gateway, including adding other admins, creating connections, additionally sharing gateways in **Can use** and **Can use + share** permission levels, and deleting the gateway.
  - **Others**: Administrators have full control of the gateway, including adding other admins and deleting the gateway.
- **Can use**: Users who can create connections on the gateway to use for apps and flows but can't share the gateway. Use this permission for users who run apps but don't share them. Applies only to Power Apps and Power Automate. 
- **Can use + share**: Users who can create a connection on the gateway to use for apps and flows, and automatically share the gateway when sharing an app. Use this permission for users who need to share apps with other users or with the organization. Applies only to Power Apps and Power Automate. 

> [!NOTE]
> - **Can Use** and **Can use + share** apply only to Power Apps and Power Automate. 
> - While sharing gateways for **Can use** and **Can use + share** permission levels, you can restrict the data source type that the user can connect over the gateway. You must select at least one data source type for the user to be successfully added.
> - **Can Use** and **Can use + share** don't apply to custom connectors in Power Apps and Power Automate.
> - You must share the gateway with the **Admin** permission level to be used by custom connectors.

## Remove a gateway cluster

Use **Remove** to remove a gateway cluster. This operation is available for data gateways in standard mode and personal mode.

For more information, see [Remove or delete an on-premises data gateway](/data-integration/gateway/service-gateway-manage#remove-or-delete-an-on-premises-data-gateway).

## Get help

For faster troubleshooting and assistance, select **Get help** to open a Get Help panel. Include the session ID in a customer support ticket for any issues on the Data Gateways feature in the Power Platform admin center.

:::image type="content" source="media/get-help-gateway.png" alt-text="Get help with managing your gateways.":::

## Manage gateways by region

Select the region drop-down list to see the gateway regions. When you select one of the regions, you see a list of gateways installed in that region. You can manage users or view gateway members for these gateways. By default, you see gateways within your tenant's default region.

:::image type="content" source="media/manage-gateway-by-region.png" alt-text="Manage by gateway region.":::

## Filter by gateway type

Select the gateway type drop-down list to filter by gateway type. By default, you see all data gateways running in standard mode. Use the filter to see data gateways in personal mode or all gateways. For more information, see [Types of gateways](/power-bi/service-gateway-onprem#types-of-gateways).

:::image type="content" source="media/manage-gateway-by-type.png" alt-text="Filter by type.":::

## Search

Use **Search** to find gateway clusters and see their details. You can search for gateway cluster names and contact info, but not administrators.

:::image type="content" source="media/manage-gateway-search.png" alt-text="Search for on-premises gateway clusters.":::

## Status

Select a gateway cluster, then select **Details** > **Check status** to check the status of a gateway cluster.


## Manage gateway installers

As either a Microsoft Entra Global administrator (which includes global admins) or a Power BI service administrator, use **Manage gateway installers** to manage who can install the on-premises data gateway or virtual network data gateway in your enterprise. Gateway admins can't perform this operation.

> [!NOTE]
> This feature doesn't apply to on-premises data gateways (personal mode).
> 
> Although the **Manage gateway installers** option appears only under the **On-premises data gateways** tab, the same restriction applies to both the on-premises data gateway and the virtual network data gateway.

1. Select **Manage gateway installers**.

   :::image type="content" source="media/manage-gateway-installers.png" alt-text="Manage gateway installers.":::

1. Turn on **Restrict Users in your organization from installing gateways**. By default, this option is off, so anyone in your organization can install a gateway.

   :::image type="content" source="media/manage-gateway-installers-users.png" alt-text="Manage gateway installers users.":::

1. Add users who can install gateways, and then select **Add**.

   > [!NOTE]
   > Currently, groups aren't supported for **Manage Installers**. You can add individual users. 

1. To remove users who have permission to install gateways, select **Remove installer** (:::image type="content" source="media/nb-ua-r1-trashbin.png" alt-text="Remove installer.":::), and then select **Confirm**.


   > [!NOTE]
   > This step doesn't impact gateways that are already installed. This feature only allows or restricts users from installing gateways going forward.

If a person who doesn't have access to install gateways tries to install one, they get the following error once they provide their credentials during the gateway registration.

:::image type="content" source="media/manage-gateway-error-message.png" alt-text="Error message.":::

## Remove gateways for tenant migration

If you have gateways in your home (default) region or target region, clean them up fully before [tenant migration](/power-bi/support/service-admin-region-move). You must delete all gateways on both your home and target regions, so any applications that use these gateways lose access to these gateways until they're restored after migration. Follow these steps to clean up your gateways:

1. Select the region drop-down to see the gateway regions, and select your home (default) region. Remove all gateways in this region by using the **Remove** action.


:::image type="content" source="media/home-region-gateways.png" alt-text="Home region selected.":::

1. Select the region drop-down, and select your target region. Remove all gateways in this region.

:::image type="content" source="media/target-region-gateways.png" alt-text="Target region selected.":::

### Related content

[On-premises data gateway](/data-integration/gateway/service-gateway-onprem)<br/>
[Connecting to on-premises data sources with On-premises Data Gateway](/azure/analysis-services/analysis-services-gateway)<br/>
