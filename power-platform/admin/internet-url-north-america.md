---
title: "Required URLs for North America-based organizations  | MicrosoftDocs"
description: Required URLs for North America-based organizations
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/03/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Required URLs for North America-based organizations

If you cannot access Microsoft Dynamics 365 apps, or specific URLs fail to load when you use Microsoft Dynamics 365, a proxy or firewall may be configured to prevent  Dynamics 365 URLs from accessing server resources.

Add the following URLs to the approved list to allow traffic to proceed to these URLs.

To select a different region, see [Internet accessible URLs required](online-requirements.md#internet-accessible-urls-required).

- http://login.microsoftonline-p.com
- https://login.live.com
- https://secure.aadcdn.microsoftonline-p.com
- http://crl.microsoft.com/pki/crl/products/microsoftrootcert.crl
- https://mbs.microsoft.com
- https://go.microsoft.com
- https://urs.microsoft.com
- https://auth.gfx.ms
- https://sc.imp.live.com
- https://dynamicscrmna.accesscontrol.windows.net
- https://*.windows.net
- https://*.microsoftonline.com
- http://*.passport.net
- http://*.crm.dynamics.com
- https://*.crm.dynamics.com
- https://home.dynamics.com
- https://cloudredirectornam.cloudapp.net
- https://cloudredirectornamsec.cloudapp.net
- https://*.azureedge.net
- https://www.crmdynint.com



|URL  |Justification  |
|---------|---------|
|http://login.microsoftonline-p.com     |Required for Microsoft Cloud Authentication. Includes B2C/Guest scenarios.         |
|https://login.live.com     |         |
|https://secure.aadcdn.microsoftonline-p.com     |         |
|https://auth.gfx.ms     |         |
|https://*.windows.net     |         |
|http://*.passport.net     |         |
|http://*.crm.dynamics.com     | Required for D365CE / CDS Orgs/environments access. Includes integration  and static CDN content endpoints. (Replace URLs for other geos as needed)        |
|https://*.crm.dynamics.com     |         |
|https://home.dynamics.com     |         |
|https://www.crmdynint.com     |         |
|https://*.azureedge.net     |         |
|https://*.microsoftonline.com     | Required for authentication and M365 Services such as M365 Admin Center        |
|https://go.microsoft.com     |Required for product documentation and context sensitive help pages         |
|https://urs.microsoft.com     | Required for Microsoft defender SmartScreen filtering      |
|http://crl.microsoft.com/pki/crl/products/microsoftrootcert.crl     | Required for Certification Revocation List checks        |
|https://dynamics.microsoft.com     |      |



### See also
[Internet accessible URLs required](online-requirements.md#internet-accessible-urls-required)

[!INCLUDE[footer-include](../includes/footer-banner.md)]