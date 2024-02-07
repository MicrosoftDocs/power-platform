---
title: "Power Platform URLs and IP address ranges  | MicrosoftDocs"
description: Provides information about URLs and IP addresses to be added to the allow list to use Power Platform services.
author: KumarVivek
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/25/2023
ms.subservice: admin
ms.author: kvivek
contributors:
  - shazichuanshuo 
  - garrettm-msft
  - nanivijay
ms.contributors:
  - viotti 
search.audienceType: 
  - admin
---
# Power Platform URLs and IP address ranges

Microsoft Power Platform requires connectivity to the internet. The endpoints listed in this article should be reachable for customers using the Power Platform services.

## Internet URLs to allow

Ensure that you have added the required URLs to the allow list to ensure communication through firewalls and other security mechanisms. If you cannot access a service or specific URLs fail to load, a proxy or firewall might be configured to prevent you from accessing server resources. Review your proxy settings and ensure that you add all the relevant URLs to the allowed list as per your service.

### URLs for Power Platform services

Add the following URLs to the allow list.

|Service|URLs|
|--|--|
|Power Apps|- [Public cloud](/powerapps/maker/canvas-apps/limits-and-config#required-services)<br/>- [Government cloud](powerapps-us-government.md#power-apps-us-government-service-urls)|
|Power Automate| - [Public cloud](/power-automate/ip-address-configuration#required-services)<br/>- [Government cloud](/power-automate/us-govt#power-automate-us-government-service-urls)|
|Power BI|- [Public cloud](/power-bi/admin/power-bi-allow-list-urls)<br/>- [Government cloud](/power-bi/admin/service-govus-overview#allow-connections-to-power-bi)|
|Power Pages| - [Public cloud](/power-pages/system-requirements#required-services)<br/>- [Government cloud](/power-pages/system-requirements#required-services)|
|Power Virtual Agents|- [Public cloud](/power-virtual-agents/requirements-quotas#required-services)<br/>- [Government cloud](/power-virtual-agents/requirements-licensing-gcc#power-virtual-agents-us-government-service-urls)

> [!IMPORTANT]
> If you are a customer in China and want to access Power Platform services operated by a local company that stores your data within China, go to [Power Platform and Dynamics 365 apps - operated by 21Vianet in China](about-microsoft-cloud-china.md) 

### URLs for Dynamics 365 services

Add the following URLs to the allow list to use Dynamics 365 apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, and Dynamics 365 Marketing.

|  Endpoint URL | Justification  |
|---|---|
| http://login.microsoftonline-p.com  | Required for Microsoft Cloud Authentication. Includes business-to-consumer (B2C) and guest scenarios.   |
| https://login.live.com  |  |
| https://secure.aadcdn.microsoftonline-p.com  |   |
| https://auth.gfx.ms  |   |
| https://*.windows.net  |    |
| http://*.passport.net  |    |
| https://*.crm#.dynamics.com and http://*.crm#.dynamics.com | Required for environments access. Includes integration and static Content Delivery Network (CDN) content endpoints. <br /><br />Replace # in http://*.crm#.dynamics.com and https://*.crm#.dynamics.com with your region's number: <ul><li>Asia/Pacific: 5</li><li>Canada: 3 </li><li>Europe, Africa, and Middle East: 15 and 4</li><li>France: 12</li><li>Germany: 16</li><li>India: 8</li><li>Japan: 7</li><li>Korea: 21</li><li>North America: no number</li><li>Norway: 19</li><li>Oceania: 6</li><li>Singapore: 20</li><li>South Africa: 14</li><li>South America: 2</li><li>Switzerland: 17</li><li>UAE: 15</li><li>United Kingdom: 11</li><li>Dynamics 365 US Government: 9</li>   |
| https://*.azureedge.net  |    |
| https://*.microsoftonline.com  | Required for authentication and Microsoft 365 services such as the Microsoft 365 admin center.   |
| https://go.microsoft.com  | Required for product documentation and context-sensitive help pages.    |
| `https://urs.microsoft.com`  |  Required for Microsoft defender SmartScreen filtering.    |
| https://crl.microsoft.com/pki/crl/products/microsoftrootcert.crl  | Required for Certification Revocation List checks.    |
| https://dynamics.microsoft.com |    |
| https://*.api.powerplatform.com and https://\*.powerplatform.com | Required for Power Platform API connectivity and used internally by Microsoft products and admin automation scenarios as described in [Programmability and extensibility overview](programmability-extensibility-overview.md). |
| https://mem.gfx.ms  | Me Control is a Microsoft feature that provides a consistent way for users to do core authentication functions like signing in, switching between accounts and more.    |
| https://www.d365ccafpi.com |  d365ccafpi service exposes a controller endpoint for token change to achieve client side first party integration with external service from PCF control  |
| https://api.admin.powerplatform.microsoft.com | Required to call Power Platform admin center service in public cloud.|
| https://eu-mobile.events.data.microsoft.com/Collector/3.0 (Europe)<br/>https://browser.pipe.aria.microsoft.com (Rest of the world) | Required for model-driven apps telemetry information.|

> [!IMPORTANT]
> - If you are Government cloud customer, go to [Dynamics 365 US Government URLs](microsoft-dynamics-365-government.md#dynamics-365-us-government-urls) 
> - If you are a customer in China and want to access Dynamics 365 services operated by a local company that stores your data within China, go to [Power Platform and Dynamics 365 apps - operated by 21Vianet in China](about-microsoft-cloud-china.md)

## IP addresses required

All IP addresses for various services for public and government clouds are available in these downloadable JSON files:

- [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519)
- [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063)
- [Azure IP Ranges and Service Tags – China Cloud](https://www.microsoft.com/download/details.aspx?id=57062)
- [Azure IP Ranges and Service Tags – Germany Cloud](https://www.microsoft.com/download/details.aspx?id=57064)

The IP address values in these JSON files are grouped by service tags that define the service they're applicable for. 

For Power Platform and Dynamics 365 services, you must add the IP address values specified under the `AzureCloud` service tag. The service tags also have a regional scope to define the IP addresses required per Azure datacenter region. For example, to find out the required IP address values for accessing services in the *Australia* region, use the [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519) file, and search for `AzureCloud.Australia`.

:::image type="content" source="media/ip-example.png" alt-text="PowerPlatformInfra service tag for Power Platform IPs":::  

If you are using *Power Platform connectors*, see the complete list of required IP addresses in [Connectors docs](/connectors/common/outbound-ip-addresses#power-platform).

> [!NOTE]
> Blocked IPs can also impact connecting Dynamics 365 apps to [Microsoft Exchange Server (on-premises)](connect-exchange-server-on-premises.md). 



## Ports

Dataverse exposes ports *1433* and *5558* to expose the [Dataverse Tabular Data Stream](/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50). 

### See also  
 [Plan for Deployment and Administration](../admin/plan-for-deployment-and-administration.md)  <br /> 
 [Work with requirements as a solution architect for Power Platform and Dynamics 365](/training/modules/work-with-requirements/index)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
