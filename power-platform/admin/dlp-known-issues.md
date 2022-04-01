---
title: "Known limitations for data loss prevention (DLP) policies | MicrosoftDocs"
description:  DLP policies known limitations.

ms.topic: conceptual
ms.date: 12/03/2021
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

[!INCLUDE[footer-include](../includes/footer-banner.md)]
