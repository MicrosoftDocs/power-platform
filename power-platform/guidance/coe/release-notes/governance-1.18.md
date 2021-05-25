---
title: "Release notes and latest version of the CoE starter kit Governance components | MicrosoftDocs"
description: "Release notes and latest version of the CoE Starter Kit."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/08/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Released version Governance Components 1.18

Version 1.18 for the CoE Starter Kit Governance Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on July 8, 2020.

## Admin \| Flow archive and clean up

This version introduces new flows that checks for flows that haven't been modified in the last six months (configurable) and asks the flow owner (via flow approvals) if the flow can be archived. If approved, archives the flow files to SharePoint. It archives two files per flow, one with the flow content, the other with the flow connections.

The flows names are: Admin \| Flow archive and clean up - Start Approval and Admin \| Flow archive and clean up - Check Approval.


[!INCLUDE[footer-include](../../../includes/footer-banner.md)]