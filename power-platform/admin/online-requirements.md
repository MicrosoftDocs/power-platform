---
title: "Power Platform URLs and IP address ranges  | MicrosoftDocs"
description: Information on supported URLs and IP addresses.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/10/2022
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

If certain URLs or IP addresses are blocked in your browser or network security devices, users might not be able to reach Microsoft Dynamics 365 apps or environments.

## IP addresses required

See the following:

- [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519)
- [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063)
- [Azure IP Ranges and Service Tags – China Cloud](https://www.microsoft.com/download/details.aspx?id=57062)
- [Azure IP Ranges and Service Tags – Germany Cloud](https://www.microsoft.com/download/details.aspx?id=57064)

> [!NOTE]
> You can search the Azure IP Ranges json file for the AzureCloud service tag for your region. For example, for Japan you'd search for "azurecloud.japaneast" and "azurecloud.japanwest" to find the list of IP addresses to allow.
>
> [!div class="mx-imgBorder"] 
> ![AzureCloud service tag for region IPs.](media/example-azurecloud-tag.png "AzureCloud service tag for region IPs")
  
Blocked IPs can also impact connecting Dynamics 365 apps to [Microsoft Exchange Server (on-premises)](connect-exchange-server-on-premises.md). 

## Internet accessible URLs required

Dynamics 365 apps use several Microsoft URLs to help provide security, services, and features. Blocking any of the required URLs will cause apps in Dynamics 365 to operate incorrectly or not at all. See: [Troubleshooting: Unblock required URLs](troubleshooting-unblock-urls-required.md).

If you cannot access Microsoft Dynamics 365 apps, or specific URLs fail to load when you use Microsoft Dynamics 365 apps, a proxy or firewall might be configured to prevent  Dynamics 365 URLs from accessing server resources.

Add the following URLs to the approved list to allow traffic to proceed to these URLs.

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
| https://*.api.powerplatform.com | Required for Power Platform API connectivity used internally by Microsoft products as well as admin automation scenarios as  [documented here](programmability-extensibility-overview.md).

### URLs required for specific apps

- **Power Apps**: [Required services](/powerapps/maker/canvas-apps/limits-and-config)
- **Power Automate**: [Required services](/power-automate/ip-address-configuration#required-services)
- **Power Virtual Agents**: [Required services](/power-virtual-agents/requirements-quotas#required-services)
- **Power BI**: [Add Power BI URLs to your allowlist](/power-bi/admin/power-bi-allow-list-urls)

### URLs required for Power Apps US Government and Dynamics 365 US Government

- [Power Apps US Government service URLs](powerapps-us-government.md#power-apps-us-government-service-urls)
- [Dynamics 365 US Government URLs](microsoft-dynamics-365-government.md#dynamics-365-us-government-urls)

## Ports
Dataverse exposes ports *18085* and *8085* to perform maintenance operations for customer databases.  The maintenance operations are executed to ensure that Microsoft Dynamics 365 environments are performing at optimal performance standards.  These maintenance operations include but are not limited to: 

- Database Update Operation
- App Update Operation

These maintenance operations are executed by the [Asynchronous Service](/powerapps/developer/data-platform/asynchronous-service).

Dataverse exposes ports *1433* and *5558* to expose the [Dataverse Tabular Data Stream](/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50). 

### See also  
 [Plan for Deployment and Administration](../admin/plan-for-deployment-and-administration.md)  <br /> 
 [Work with requirements as a solution architect for Power Platform and Dynamics 365](/learn/modules/work-with-requirements/index)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
