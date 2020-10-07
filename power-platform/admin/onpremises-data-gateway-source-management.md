---
title: "Preview: Data source management  | MicrosoftDocs"
description: View and manage on-premises data sources.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/06/2020
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Preview: Data source management

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

In the **Data** page of the Power Platform admin center (https://admin.powerplatform.microsoft.com), you can view and manage Power BI cloud and on-premises data sources. The on-premises data sources on this page include all on-premises data source definitions for gateways you administer. The cloud data sources on this page are cloud connections in your published Power BI reports.

> [!NOTE]
> Data sources tab will not be available when **Tenant Administration** is turned on.​

> [!div class="mx-imgBorder"] 
> ![Data sources tab](media/data-gateways-tenant-admin-off-data-sources.png "Data sources tab")

- **Data source name**: The name of the data source.
- **Data source type**: The type of the data source. For supported data sources, see [Power BI data sources](https://docs.microsoft.com/power-bi/connect-data/power-bi-data-sources).
- **Users**: Users who can use this data source in data sets and data flows.
- **Status**: Select (![Check status](media/gateway-status.png "Check status")) to check the status of a gateway member.
- **Gateway cluster name**: The gateway cluster on which this data source was created. If it is a cloud data source, this value will say “Cloud”.

## Data source settings

Select a data source and then select **Settings** to see the following information. This view is currently read-only. ​

> [!div class="mx-imgBorder"] 
> ![Data gateway settings tab](media/data-gateways-settings-tab.png "Data gateway settings tab")

> [!div class="mx-imgBorder"] 
> ![Data source settings](media/data-gateways-data-source-settings.png "Data source settings")

- **Data source name**: The name of the data source.
- **Data source type**: The type of the data source. For supported data sources, see [Power BI data sources](https://docs.microsoft.com/power-bi/connect-data/power-bi-data-sources).
- **Connection Details**: Connection information. Check back for updated information.
- **Authentication method**: The authentication method chosen for this connection.​

## Manage users

Select a data source and then select **Manage Users** to see the list of current data source users. These users can use this data source in published reports and data flows. Currently, you can remove users but not add users.​ 

## Remove a data source

Select a data source and then select **Remove** to remove the data source. 

## Get Help
For faster troubleshooting and assistance, select **Get help** to open a Get Help panel. Include the session ID in a customer support ticket for any issues on the Data Gateways feature in the Power Platform admin center.

> [!div class="mx-imgBorder"] 
> ![Get help](media/get-help.png "Get help")

## Manage gateways by region

Select the region drop-down to see the list of gateway regions. When you select one of the regions, you'll see a list of gateways installed in that region. You can manage users or view gateway members for these gateways. By default, you'll see gateways within your tenant's default region.

> [!div class="mx-imgBorder"] 
> ![Manage by gateway region](media/manage-gateway-by-region.png "Manage by gateway region")

## Search

Select **Search** to find data sources and see their details. You currently can search on data source names, data source types, and gateway cluster names, but not users and status.​

## Data source status

Select a data source, then select **Check status** (![Data source status](media/gateway-status.png "Data source status")) to see the status of a data source.

### See also
 [On-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-onprem)<br/>
 [Connecting to on-premises data sources with On-premises Data Gateway](https://docs.microsoft.com/azure/analysis-services/analysis-services-gateway)<br/>