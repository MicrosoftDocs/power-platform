---
title: "Known issues for data loss prevention (DLP) policies | MicrosoftDocs"
description:  DLP policies known issues.
ms.service: power-platform
ms.topic: conceptual
ms.date: 09/14/2021
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
  - mihaelablendea
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
- Classifying connectors as "business", "non-business", and "blocked" is only permitted in the latest version (v2) of the Power Platform admin connectors. The v1 version only supports classifying connectors as "business" (i.e., HBI - High Business Impact) and "non-business" (i.e., LBI - Low Business Impact).
- Blocking the HTTP Request connector via DLP currently will block child flows, because child flows are implemented by using the HTTP connector. Work is underway to separate DLP enforcement for child flows so they'll be treated no differently than other flows.
- Existing apps that were last published before October 2020 won't see endpoint filtering enforcement for custom connectors. 
- Endpoint filtering enforcement on **environment variables** and **dynamically bound endpoints** during runtime is currently **out of scope**. Similarly, endpoints provided as a **custom input** in the flow are out of scope. Only static endpoints known and selected during design time are in scope. For example, if a custom connector definition includes the Route Request policy template to route the request to an alternate URL pattern, DLP policies aren't applied to routed URLs and can only classify the original host URL pattern of the custom connector. 
- If a custom connector has been added by name to a tenant-level policy (by using Powershell cmdlets), the custom connector URL pattern rules will be superseded by the existing classification for the connector by name. Use the Remove-DlpPolicy cmdlet to remove the custom connectors from the policy for these rules to take effect. We recommend that tenant-level policies only use custom connector host URL patterns. Don't manage custom connectors by name in tenant-level policies, because individual custom connector scope is limited to the environment boundary and a custom connector's name has no significance at the tenant level. 
- Connector action control is out of scope for tabular functions.
- Custom connector parity: When an environment admin creates or updates an environment-level DLP policy, they can only view custom connectors for which they are an owner or that have been shared with them.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
