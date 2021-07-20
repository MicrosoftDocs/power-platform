---
title: "Known issues | MicrosoftDocs"
description:  DLP policies known issues.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/19/2021
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

We are working to address the following known issues and limitations: 

1. Sorting by Created and Modified fields on Data Policy list view doesn’t work correctly.
2. Three-way DLP policy creation isn't available through admin connectors. Also, the Power Platform for Admins connector always blocks LBI/Non-business group.
3. Blocking the HTTP Request connector via DLP will currently block child flows, since child flows are implemented using the HTTP connector. Work is underway to separate DLP enforcement for child flows so they are treated no differently than other flows.
4. Existing Power apps that last published before October, 2020 will not see endpoint filtering enforcement for custom connectors. 
5. Endpoint filtering enforcement on environment variables and dynamically binded endpoints during runtime is currently out of scope. Only static endpoints defined during design time are in scope. For example, if custom connector definition includes the Route Request policy template to route the request an alternate URL pattern then DLP policies are not applied to routed URLs and can only classify the original host URL pattern of the custom connector. 
6. If a custom connector by name is already added to a tenant-level policy (using Powershell cmdlets), the custom connector URL pattern rules will be superseded by the existing classification for the connector by name. Use the Remove-DlpPolicy cmdlet to remove the custom connectors from the policy for these rules to take effect. We recommend that tenant level policies only use custom connector host URL patterns. Do not manage custom connectors by name in the tenant-level policies since individual custom connector scope is limited to the environment boundary and they have no significance at the tenant level. 
7. Connector action control is out of scope for tabular functions.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
