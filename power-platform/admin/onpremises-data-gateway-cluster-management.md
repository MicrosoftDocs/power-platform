---
title: "Gateway cluster management (preview) | MicrosoftDocs"
description: View and manage on-premises gateway clusters.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/04/2022
author: arthiriyer
ms.author: arthii
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Gateway cluster management (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

In the **Data** page of the Power Platform admin center (https://admin.powerplatform.microsoft.com), you can view and manage gateway clusters.

> [!div class="mx-imgBorder"] 
> ![Gateway clusters tab](media/data-gateways-tenant-admin-off-gwcluster.png "Gateway clusters tab")

- **Gateway cluster name**: The name of the gateway cluster.
- **Contact info**: Admin contact information for the gateway cluster. 
- **Users**: The list of gateway users.
- **Status**: Select (![Check status](media/gateway-status.png "Check status")) to check the status of a gateway member.
- **Gateways**: The number of gateway members in the gateway cluster.

## Details

Select a gateway cluster and then select **Details** to see the following information on gateway members.

> [!div class="mx-imgBorder"] 
> ![Gateway details](media/data-gateways-details.png "Gateway details")

> [!div class="mx-imgBorder"] 
> ![Gateway member details](media/data-gateways-member-details.png "Gateway member details")

- **Gateway name**: The name of the gateway member.
- **Device name**: The physical device on which the gateway is installed.
- **Version**: The gateway software version installed on the machine.
- **Status**: Select (![Gateway status](media/gateway-status.png "Gateway status")) to check the status of a gateway member.
- **State**: Select to enable or disable a gateway member.

After selecting a gateway member, you can select **Remove** to remove it. This does not uninstall the gateway from the physical machine but removes all the metadata regarding the gateway.

## Gateway cluster settings

Use **Settings** to set on-premises data gateway settings such as the gateway cluster name, department, General settings and Power BI settings. 

> [!div class="mx-imgBorder"] 
> ![Data gateway settings tab](media/data-gateways-settings-tab.png "Data gateway settings tab")

> [!div class="mx-imgBorder"] 
> ![Data gateway settings](media/data-gateways-settings.png "Data gateway settings")

For more information on **Allow user's cloud datasources to refresh through this gateway cluster**, see [Merge or append on-premises and cloud data sources](https://go.microsoft.com/fwlink/p/?linkid=2005525).

For more information on **Allow user's custom data connectors to refresh through this gateway cluster**, see [Use custom data connectors with the on-premises data gateway](/power-bi/service-gateway-custom-connectors).

For more information on **Distribute requests across all active gateways in this cluster**, see [Load balance across gateways in a cluster](/data-integration/gateway/service-gateway-high-availability-clusters#load-balance-across-gateways-in-a-cluster).

## Remove a gateway cluster

Select **Remove** to remove a gateway cluster. This operation is available for data gateways in standard mode as well as personal mode.

> [!div class="mx-imgBorder"] 
> ![Remove gateway cluster](media/data-gateways-remove.png "Remove gateway cluster")

For more information, see [Remove or delete an on-premises data gateway](/data-integration/gateway/service-gateway-manage#remove-or-delete-an-on-premises-data-gateway).

## Get Help
For faster troubleshooting and assistance, select **Get help** to open a Get Help panel. Include the session ID in a customer support ticket for any issues on the Data Gateways feature in the Power Platform admin center.

> [!div class="mx-imgBorder"] 
> ![Get help](media/get-help.png "Get help")

## Manage gateways by region

Select the region drop-down to see the list of gateway regions. When you select one of the regions, you'll see a list of gateways installed in that region. You can manage users or view gateway members for these gateways. By default, you'll see gateways within your tenant's default region.

> [!div class="mx-imgBorder"] 
> ![Manage by gateway region](media/manage-gateway-by-region.png "Manage by gateway region")

## Filter by gateway type

Select the gateway type drop-down to filter by gateway type. By default, you'll see all data gateways running in standard mode. Use the filter to see data gateways in personal mode or all gateways. For more information, see [Types of gateways](/power-bi/service-gateway-onprem#types-of-gateways).

> [!div class="mx-imgBorder"] 
> ![Filter by type](media/filter-by-type.png "Filter by type")

## Search

Select **Search** to find gateway clusters and see their details. You can search for gateway cluster names and contact info, but not administrators.

> [!div class="mx-imgBorder"] 
> ![Search](media/manage-search.png "Search")

### See also
 [On-premises data gateway](/data-integration/gateway/service-gateway-onprem)<br/>
 [Connecting to on-premises data sources with On-premises Data Gateway](/azure/analysis-services/analysis-services-gateway)<br/>

