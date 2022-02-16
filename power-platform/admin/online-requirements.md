---
title: "Power Platform URLs and IP address ranges  | MicrosoftDocs"
description: Information on supported URLs and IP addresses for Power Platform.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/14/2022
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Power Platform URLs and IP address ranges

Microsoft Power Platform requires connectivity to the internet. The endpoints listed in this article should be reachable for customers using the Power Platform services.

## Internet URLs to allow

Ensure that you have added the required URLs to the approved URL list.

### URLs for using Power Platform services

Add the following URLs to the approved list.

|Service|URLs|
|--|--|
|Power Apps|- [Public cloud](/powerapps/maker/canvas-apps/limits-and-config#required-services)<br/>- [Government cloud](powerapps-us-government.md#power-apps-us-government-service-urls)|
|Power Automate| - [Public cloud](/power-automate/ip-address-configuration#required-services)<br/>- [Government cloud](/power-automate/us-govt#power-automate-us-government-service-urls)|
|Power BI|- [Public cloud](/power-bi/admin/power-bi-allow-list-urls)<br/>- [Government cloud](/power-bi/admin/service-govus-overview#allow-connections-to-power-bi)|
|Power Virtual Agents|- [Public cloud](/power-virtual-agents/requirements-quotas#required-services)<br/>- [Government cloud](/power-virtual-agents/requirements-licensing-gcc#power-virtual-agents-us-government-service-urls)


### URLs for using Dynamics 365 services

Add the following URLs to the approved list to use Dynamics 365 apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, and Dynamics 365 Marketing, and Dynamics 365 Field Service.

|  Endpoint URL | Justification  |
|---|---|
| http://login.microsoftonline-p.com  | Required for Microsoft Cloud Authentication. Includes business-to-consumer (B2C) and guest scenarios.   |
| https://login.live.com  |  |
| https://secure.aadcdn.microsoftonline-p.com  |   |
| https://auth.gfx.ms  |   |
| https://*.windows.net  |    |
| http://*.passport.net  |    |
| https://*.crm#.dynamics.com and http://*.crm#.dynamics.com | Required for Dynamics 365 and Dataverse environments access. Includes integration and static Content Delivery Network (CDN) content endpoints. <br /><br />Replace # in http://*.crm#.dynamics.com and https://*.crm#.dynamics.com with your region's number: <ul><li>Asia/Pacific: 5</li><li>Canada: 3 </li><li>Europe, Africa, and Middle East: 15 and 4</li><li>France: 12</li><li>Germany: 16</li><li>India: 8</li><li>Japan: 7</li><li>North America: no number</li><li>Oceania: 6</li><li>South Africa: 14</li><li>South America: 2</li><li>Switzerland: 17</li><li>UAE: 15</li><li>United Kingdom: 11</li><li>Dynamics 365 US Government: 9</li>   |
| https://www.crmdynint.com  |    |
| https://*.azureedge.net  |    |
| https://*.microsoftonline.com  | Required for authentication and Microsoft 365 services such as the Microsoft 365 admin center.   |
| https://go.microsoft.com  | Required for product documentation and context-sensitive help pages.    |
| https://urs.microsoft.com  |  Required for Microsoft defender SmartScreen filtering.    |
| http://crl.microsoft.com/pki/crl/products/microsoftrootcert.crl  | Required for Certification Revocation List checks.    |
| https://dynamics.microsoft.com |    |
| https://*.api.powerplatform.com | Required for Power Platform API connectivity used internally by Microsoft products and admin automation scenarios as [documented here](programmability-extensibility-overview.md).

> [!IMPORTANT]
> If you cannot access a service or specific URLs fail to load, a proxy or firewall might be configured to prevent you from accessing server resources. Review your proxy settings and ensure that you add all the relevant URLs to the allowed list as per your service.


## IP addresses required

All IP addresses for various services for public and government clouds are available in these downloadable JSON files:

- [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519)
- [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063)
- [Azure IP Ranges and Service Tags – China Cloud](https://www.microsoft.com/download/details.aspx?id=57062)
- [Azure IP Ranges and Service Tags – Germany Cloud](https://www.microsoft.com/download/details.aspx?id=57064)

The IP address values in these JSON files are grouped by service tags that define the service they're applicable for. For a list of all the service tags and their definition, see [Available service tags](/azure/virtual-network/service-tags-overview#available-service-tags) in Azure docs.

These service tags also have a regional scope to define the IP addresses required per Azure datacenter region. For example, to find out the required IP address values for accessing *Power Platform services* in the *Australia* region, use the [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519) file, and search for **PowerPlatformInfra.Australia**.

:::image type="content" source="media/ip-example.png" alt-text="AzureCloud service tag for Power Platform IPs":::  

Use the following service tag values to find out IP address values required for your service.

| Service | Service tag|Description  |
|---|---|--|
|Power Platform services|`PowerPlatformInfra`|This tag represents the IP addresses used by the infrastructure to host Power Platform services.|
|Dynamics 365|`AzureCloud`|This tag represents all datacenter public IP addresses.|

If you are using [Power Platform connectors](/connectors/connectors), see the complete list of IP addresses required in [Connectors docs](/connectors/common/outbound-ip-addresses#power-platform).

> [!NOTE]
> Blocked IPs can also impact connecting Dynamics 365 apps to [Microsoft Exchange Server (on-premises)](connect-exchange-server-on-premises.md). 



## Ports
Dataverse exposes ports *18085* and *8085* to perform maintenance operations for customer databases.  The maintenance operations are executed to ensure that Microsoft Dynamics 365 environments are performing at optimal performance standards.  These maintenance operations include but aren't limited to: 

- Database Update Operation
- App Update Operation

These maintenance operations are executed by the [Asynchronous Service](/powerapps/developer/data-platform/asynchronous-service).

Dataverse exposes ports *1433* and *5558* to expose the [Dataverse Tabular Data Stream](/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50). 

### See also  
 [Plan for Deployment and Administration](../admin/plan-for-deployment-and-administration.md)  <br /> 
 [Work with requirements as a solution architect for Power Platform and Dynamics 365](/learn/modules/work-with-requirements/index)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
