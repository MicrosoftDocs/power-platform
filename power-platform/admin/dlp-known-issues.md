---
title: "Known issues | MicrosoftDocs"
description:  DLP policies known issues.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/03/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Known issues

We're working to address the following known issues and limitations: 

- Sorting by **Created** and **Modified** fields in the **Data policies** list view doesn't work correctly.
- Three-way DLP policy creation isn't available through admin connectors. Also, the Power Platform for Admins connector always blocks LBI/**Non-business** group.
- Blocking the HTTP Request connector via DLP currently will block child flows, because child flows are implemented by using the HTTP connector. Work is underway to separate DLP enforcement for child flows so they'll be treated no differently than other flows.
- Existing apps that were last published before October 2020 won't see endpoint filtering enforcement for custom connectors. 
- Endpoint filtering enforcement on environment variables and dynamically bound endpoints during runtime is currently out of scope. Only static endpoints defined during design time are in scope. For example, if a custom connector definition includes the Route Request policy template to route the request to an alternate URL pattern, DLP policies aren't applied to routed URLs and can only classify the original host URL pattern of the custom connector. 
- If a custom connector has been added by name to a tenant-level policy (by using Powershell cmdlets), the custom connector URL pattern rules will be superseded by the existing classification for the connector by name. Use the Remove-DlpPolicy cmdlet to remove the custom connectors from the policy for these rules to take effect. We recommend that tenant-level policies only use custom connector host URL patterns. Don't manage custom connectors by name in tenant-level policies, because individual custom connector scope is limited to the environment boundary and a custom connector's name has<!--note from editor: Edit okay? --> no significance at the tenant level. 
- Connector action control is out of scope for tabular functions.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
