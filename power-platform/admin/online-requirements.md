---
title: Power Platform URLs and IP address ranges 
description: Provides information about URLs and IP addresses to be added to the allow list to use Power Platform services.
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/15/2025
ms.subservice: admin
ms.author: sericks
contributors:
  - v-jlandrum 
  - shazichuanshuo 
  - garrettm-msft
  - nanivijay
  - nnyarbro 
ms.contributors:
  - sakarale
  - viotti 
  - psherlekar
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---
# Power Platform URLs and IP address ranges

Microsoft Power Platform requires connectivity to the internet. The endpoints listed in this article should be reachable for customers using the Power Platform services.

## Internet URLs to allow
Add the required URLs to the allow list to ensure communication through firewalls and other security mechanisms. If you can't access a service or specific URLs fail to load, a proxy or firewall might be configured to prevent you from accessing server resources. Review your proxy settings and ensure that you add all the relevant URLs to the allowed list, as per your service.

## Microsoft's consolidated domain initiative
> [Note!]
> In response to customer feedback and to streamline endpoint management, Microsoft has initiated the process of consolidating Microsoft apps and services into a select group of dedicated, secured, and purpose-managed domains within the .microsoft top-level domain.
>
> To avoid connectivity issues for users, ensure that the following essential domains are included in your allowlist and that connectivity to these domains isn't blocked.

|ID| Category| Domain name | Purpose | Ports |
|--|--|--|--|--|
|184|Required| *.cloud.microsoft.com|Dedicated to authenticated user facing Microsoft software-as-a-service product experiences.|TCP: 443<br>UDP: 443|
|184|Required|*.static.microsoft.com|	Dedicated to static (not customer-generated) content hosted on content delivery networks (CDNs).| TCP: 443<br>UDP: 443|
|184|Required|*.usercontent.microsoft.com|Content used in Microsoft experiences that requires domain isolation from applications.| TCP: 443<br>UDP: 443|

### URLs for Power Platform services

Add the following URLs to the allow list.

|Service|URLs|
|--|--|
|Power Apps|- [Public cloud](/powerapps/maker/canvas-apps/limits-and-config#required-services)<br/>- [Government cloud](powerapps-us-government.md#power-apps-us-government-service-urls)|
|Power Automate| - [Public cloud](/power-automate/ip-address-configuration#required-services)<br/>- [Government cloud](/power-automate/us-govt#power-automate-us-government-service-urls)|
|Power BI|- [Public cloud](/power-bi/admin/power-bi-allow-list-urls)<br/>- [Government cloud](/power-bi/admin/service-govus-overview#allow-connections-to-power-bi)|
|Power Pages| - [Public cloud](/power-pages/system-requirements#required-services)<br/>- [Government cloud](/power-pages/system-requirements#required-services)|
|Microsoft Copilot Studio|- [Public cloud](/power-virtual-agents/requirements-quotas#required-services)<br/>- [Government cloud](/power-virtual-agents/requirements-licensing-gcc#power-virtual-agents-us-government-service-urls)

> [!IMPORTANT]
> If you're a customer in China and want to access Power Platform services operated by a local company that stores your data within China, go to [Power Platform and Dynamics 365 apps - operated by 21Vianet in China](about-microsoft-cloud-china.md) 

### URLs for Dynamics 365 services

Add the following URLs to the allow list to use Dynamics 365 apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, and Dynamics 365 Marketing.

|  Endpoint URL | Justification  |
|---|---|
| http://login.microsoftonline-p.com  | Required for Microsoft Cloud Authentication. Includes business-to-consumer (B2C) and guest scenarios.   |
| https://login.live.com  |  |
| https://auth.gfx.ms  |   |
| https://*.windows.net  |    |
| http://*.passport.net  |    |
| https://*.crm#.dynamics.com and http://*.crm#.dynamics.com | Required for environments access. Includes integration and static Content Delivery Network (CDN) content endpoints. <br /><br />Replace # in http://*.crm#.dynamics.com and https://*.crm#.dynamics.com with your region's number: <ul><li>Asia/Pacific: 5</li><li>Canada: 3 </li><li>Europe, Africa, and Middle East: 15 and 4</li><li>France: 12</li><li>Germany: 16</li><li>India: 8</li><li>Japan: 7</li><li>Korea: 21</li><li>North America: no number</li><li>Norway: 19</li><li>Oceania: 6</li><li>Singapore: 20</li><li>South Africa: 14</li><li>South America: 2</li><li>Switzerland: 17</li><li>UAE: 15</li><li>United Kingdom: 11</li><li>Dynamics 365 US Government: 9</li>   |
| https://*.azureedge.net  |    |
| https://*.azurefd.net  |    |
| https://*.microsoftonline.com  | Required for authentication and Microsoft 365 services such as the Microsoft 365 admin center.   |
| https://go.microsoft.com  | Required for product documentation and context-sensitive help pages.    |
| `https://urs.microsoft.com`  |  Required for Microsoft Defender SmartScreen filtering.    |
| https://crl.microsoft.com/pki/crl/products/microsoftrootcert.crl  | Required for Certification Revocation List checks.    |
| https://dynamics.microsoft.com |    |
| https://*.api.powerplatform.com, https://\*.powerplatform.com, https://\*.api.powerplatformusercontent.com, and https://\*.powerplatformusercontent.com  | Required for Power Platform API connectivity and used internally by Microsoft products and admin automation scenarios as described in [Programmability and extensibility overview](programmability-extensibility-overview.md). |
| https://www.d365ccafpi.com |  d365ccafpi service exposes a controller endpoint for token change to achieve client side first party integration with external service from PCF control  |
| https://api.admin.powerplatform.microsoft.com | Required to call Power Platform admin center service in public cloud.|

> [!IMPORTANT]
> - If you're a government cloud customer, go to [Dynamics 365 US Government URLs](microsoft-dynamics-365-government.md#dynamics-365-us-government-urls) 
> - If you' re a customer in China and want to access Dynamics 365 services operated by a local company that stores your data within China, go to [Power Platform and Dynamics 365 apps - operated by 21Vianet in China](about-microsoft-cloud-china.md)

## IP addresses required

All IP addresses for various services for public and government clouds are available in these downloadable JSON files:

- [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519)
- [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063)
- [Azure IP Ranges and Service Tags – China Cloud](https://www.microsoft.com/download/details.aspx?id=57062)
- [Azure IP Ranges and Service Tags – Germany Cloud](https://www.microsoft.com/download/details.aspx?id=57064)

The IP address values in these JSON files are grouped by service tags that define the service they're applicable for. 

Add the IP address values for the following service tags.

|  Service tag | Purpose  |
|---|---|
| `AzureCloud` | Needed for all Power Platform and Dynamics 365 services. |
| `MicrosoftAzureFluidRelay` | Needed for real-time collaboration features. |
| `OneDsCollector` | Needed for gathering telemetry. |
| `PowerPlatformPlex` | Needed to access external web services from Dataverse sandbox plug-ins. |

The service tags also have a regional scope to define the IP addresses required per Azure datacenter region. For example, to find out the required IP address values for accessing services in the **Australia** region, use the [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519) file, and search for `AzureCloud.Australia`. 

If you're using *Power Platform connectors*, see the complete list of required IP addresses in [Connectors docs](/connectors/common/outbound-ip-addresses#power-platform).

> [!NOTE]
> Blocked IPs can also impact connecting Dynamics 365 apps to [Microsoft Exchange Server (on-premises)](connect-exchange-server-on-premises.md).

### IPv6 support in Microsoft Power Platform and Dynamics 365

Starting April 2024, IPv6 network connectivity is supported on Power Platform and Dynamics 365 products and services. If your organization's network doesn't support IPv6 yet, this doesn’t impact your ability to connect to Power Platform and Dynamics 365 services on current prevalent IPv4 connectivity. Microsoft continues to support both IPv4 and IPv6 protocols for Power Platform products and services.

#### What is changing?

In December 2023, we published Power Platform IPv6 address ranges in Azure service tags with plans to introduce IPv6 support for Power Platform products and services. Starting from April 2024, selective Power Platform service endpoints start resolving to both IPv4 and IPv6 addresses with the goal to eventually enable IPv6 on all Power Platform and Dynamics 365 endpoints. If your organization network is configured to consume cloud services on IPv6, and clients prefer IPv6 over IPv4, your connections to Power Platform services happen using IPv6 protocol. Additionally, if you configured the endpoints owned by you in Power Platform and Dynamics 365 and such endpoints announce support for IPv6 connectivity (by DNS names resolving to IPv6 AAAA address), Power Platform and Dynamics 365 services start connecting to your endpoints using IPv6 protocol.  

#### How can my organization be ready for this change?

If your organization network is configured to consume cloud services using IPv6 protocol or your configured endpoints within Power Platform and Dynamics 365 services announce support for IPv6 connectivity, Power Platform and Dynamics 365 service connections are expected to happen using IPv6 protocol. If your organization implements access control lists (ACLs) for such inbound and outbound connections, your organization network needs to be configured to allow Power Platform IPv6 address ranges as published in Azure [service tags](https://www.microsoft.com/download/details.aspx?id=56519) file for successful communication.

More resources for IPv6 support:

- [Azure service tags overview](/azure/virtual-network/service-tags-overview) 
- [IPv6 support in Microsoft Entra ID](/troubleshoot/azure/active-directory/azure-ad-ipv6-support) 
- [IPv6 support in Microsoft 365 services](/microsoft-365/enterprise/ipv6-support)
- [What is IPv6 for Azure Virtual Network?](/azure/virtual-network/ip-services/ipv6-overview) 
- [Internet Protocol version 6 (IPv6) overview](/dotnet/fundamentals/networking/ipv6-overview)

## Ports

Dataverse exposes ports *1433* and *5558* to expose the [Dataverse Tabular Data Stream](/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50). 

### See also  
 [Plan for Deployment and Administration](../admin/plan-for-deployment-and-administration.md)  <br /> 
 [Work with requirements as a solution architect for Power Platform and Dynamics 365](/training/modules/work-with-requirements/index)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
