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

The on-premises data sources visible here include all on-prem data source definitions on gateways you are administrator of. The cloud data sources shown here are cloud connections in your published Power BI reports. In addition, you can review the following information about these data sources:​

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

Select a data source and then select **Manage Users** to see the list of current data source users. These users can use this data source in published reports and data flows. Currently you cannot add but can remove users.​ 


## Remove data source

Use **Remove** to remove a data source. 

need image

## Data source status

Select a data source, then select **Details** > **Check status** (![Data source status](media/gateway-status.png "Data source status")) to check the status of a data source.

need image

## Search

Use **Search** to find data sources. need info

## Get Help
For faster troubleshooting and assistance, select **Get help** to open a Get Help panel. Include the session ID in a customer support ticket for any issues on the Data Gateways feature in the Power Platform admin center.

> [!div class="mx-imgBorder"] 
> ![Get help](media/get-help.png "Get help")

### See also
 [On-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-onprem)<br/>
 [Connecting to on-premises data sources with On-premises Data Gateway](https://docs.microsoft.com/azure/analysis-services/analysis-services-gateway)<br/>