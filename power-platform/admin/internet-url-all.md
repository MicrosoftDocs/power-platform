---
title: "Required URLs for Canada-based organizations  | MicrosoftDocs"
description: Required URLs for Canada-based organizations 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/04/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Required URLs for Canada-based organizations 

If you cannot access Microsoft Dynamics 365 apps, or specific URLs fail to load when you use Microsoft Dynamics 365, a proxy or firewall may be configured to prevent  Dynamics 365 URLs from accessing server resources.

Add the following URLs to the approved list to allow traffic to proceed to these URLs.

To select a different region, see [Internet accessible URLs required](online-requirements.md#internet-accessible-urls-required).

<table>
<thead>
  <tr>
    <th>URL</th>
    <th>Justification</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>http://login.microsoftonline-p.com </td>
    <td rowspan="6">Required for Microsoft Cloud Authentication. Includes business-to-consumer (B2C) and guest scenarios. </td>
  </tr>
  <tr>
    <td>https://login.live.com </td>
  </tr>
  <tr>
    <td>https://secure.aadcdn.microsoftonline-p.com    </td>
  </tr>
  <tr>
    <td>https://auth.gfx.ms  </td>
  </tr>
  <tr>
    <td>https://*.windows.net  </td>
  </tr>
  <tr>
    <td>http://*.passport.net </td>
  </tr>
  <tr>
    <td>http://*.crm#.dynamics.com </td>
    <td rowspan="5">Required for Dynamics 365 and Dataverse environments access. Includes integration and static Content Delivery Network (CDN) content endpoints. <br /><br />Replace # in http://*.crm#.dynamics.com and https://*.crm#.dynamics.com with your region's number: <ul><li>Asia/Pacific: 5</li><li>Canada: 3 </li><li>Europe, Africa, and Middle East: 15 and 4</li><li>France: 12</li><li>Germany: 16</li><li>India: 8</li><li>Japan: 7</li><li>North America: no number</li><li>Oceania: 6</li><li>South Africa: 14</li><li>South America: 2</li><li>Switzerland: 17</li><li>UAE: 15</li><li>United Kingdom: 11</li><li>Dynamics 365 US Government: 9</li></ul></td>
  </tr>
  <tr>
    <td>https://*.crm#.dynamics.com </td>
  </tr>
  <tr>
    <td>https://home.dynamics.com </td>
  </tr>
  <tr>
    <td>https://www.crmdynint.com  </td>
  </tr>
  <tr>
    <td>https://*.azureedge.net  </td>
  </tr>
  <tr>
    <td>https://*.microsoftonline.com  </td>
    <td>Required for authentication and Microsoft 365 services such as the Microsoft 365 admin center.</td>
  </tr>
  <tr>
    <td>https://go.microsoft.com  </td>
    <td>Required for product documentation and context-sensitive help pages.   </td>
  </tr>
  <tr>
    <td>https://urs.microsoft.com   </td>
    <td>Required for Microsoft defender SmartScreen filtering.   </td>
  </tr>
  <tr>
    <td>http://crl.microsoft.com/pki/crl/products/microsoftrootcert.crl  </td>
    <td>Required for Certification Revocation List checks.    </td>
  </tr>
  <tr>
    <td>https://dynamics.microsoft.com  </td>
    <td>  </td>
  </tr>
</tbody>
</table>

### See also
[Internet accessible URLs required](online-requirements.md#internet-accessible-urls-required)

[!INCLUDE[footer-include](../includes/footer-banner.md)]