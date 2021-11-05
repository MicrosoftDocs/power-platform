---
title: "Known limitations for data loss prevention (DLP) policies | MicrosoftDocs"
description:  DLP policies known limitations.
ms.service: power-platform
ms.topic: conceptual
ms.date: 10/21/2021
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

# Known limitations

Below are known limitations to know about when leveraging our suite of data loss prevention (DLP) capabilities:

## General

- There is limited support for DLP actions in the [Power Platform for Admins connector](/connectors/powerplatformforadmins/). The ability to block a connector is only supported in the DLP actions labeled with "V2" (such as "Create DLP Policy V2"). Connector action control, connector endpoint filtering, and DLP for custom connectors cannot be configured using the Power Platform for Admins connector.
- Blocking the [HTTP with Azure AD](/connectors/webcontents/) connector will also block child flows because those child flows are called using the same HTTP connector technology.
- If a child flow violates a DLP policy, it will not result in the parent flow becoming non-compliant.
- Tabular functions in the [Power Apps expression language](/powerapps/maker/canvas-apps/formula-reference) cannot be governed with DLP.

## Connector endpoint filtering

- Endpoint filtering enforcement on **environment variables** and **dynamically bound endpoints** during runtime is currently out of scope. Similarly, endpoints provided as a **custom input** in the flow are out of scope. Only static endpoints known and selected during design time are in scope. For example, if a custom connector definition includes the Route Request policy template to route the request to an alternate URL pattern, DLP policies aren't applied to routed URLs and can only classify the original host URL pattern of the custom connector. 

## DLP support for custom connectors

- Existing apps that were last published before October 2020 won't see endpoint filtering enforcement for custom connectors. 
- If a custom connector has been added by name to a tenant-level policy (by using PowerShell cmdlets), the custom connector URL pattern rules will be superseded by the existing classification for the connector by name. Use the **Remove-DlpPolicy** cmdlet to remove the custom connectors from the policy for these rules to take effect. We recommend that tenant-level policies only use custom connector host URL patterns. Don't manage custom connectors by name in tenant-level policies because individual custom connector scope is limited to the environment boundary and a custom connector's name has no significance at the tenant level. 
- When an environment admin creates or updates an environment-level DLP policy, they can only view custom connectors for which they are an owner or that have been shared with them.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
