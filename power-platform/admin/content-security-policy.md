---
title: "Content security policy"
description: "Use content security policy to control which assets can be downloaded by model-driven app customizations."  
ms.date: 01/09/2022
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: 
caps.latest.revision: 63
author: jeparson
ms.subservice: admin
ms.author: jeparson
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
---
# Content security policy

[Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP) (CSP) is currently supported in model-driven apps via two organization entity attributes which control whether the CSP header is sent and, to an extent, what it contains.

> [!NOTE]
> CSP is curently only supported in model-driven apps.  Canvas app support is on the roadmap, and will be enabled by April 2022.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
