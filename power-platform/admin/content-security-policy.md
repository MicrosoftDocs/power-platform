---
title: "Content security policy"
description: "Use content security policy to control which assets can be downloaded by model-driven app customizations."  
ms.date: 06/15/2022
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: conceptual
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: 
caps.latest.revision: 63
author: JesseParsons
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

[Content Security Policy](https://developer.mozilla.org/docs/Web/HTTP/CSP) (CSP) is currently supported in model-driven Power Apps via two organization entity attributes. These attributes control whether the CSP header is sent and, to an extent, what it contains. The settings are at the environment level, which means it would be applied to all apps in the environment once turned on. 

> [!NOTE]
> CSP is currently only supported in model-driven apps.  Canvas app support will reach public preview Summer 2022.

Each component of the CSP header value controls the assets that can be downloaded and is described in more detail on the Mozilla Developer Network (MDN). The default values are as follows:

| Directive | Default value | Customizable |
| --------- | ------------- | ------------ |
| [script-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/script-src) | `* 'unsafe-inline' 'unsafe-eval'` | No |
| [worker-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/worker-src) | `'self' blob:` | No |
| [style-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/style-src) | `* 'unsafe-inline'` | No |
| [font-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/font-src) | `* data:` | No |
| [frame-ancestors](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) | `'self'` | Yes |

This results in a default CSP of `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'self';`

## Configuring CSP

CSP can be toggled and configured through the Power Platform Admin Center (PPAC). **It is important to enable on a dev/test environment first** since enabling this could start blocking assets from being downloaded if the policy is violated.  We also support a "report-only mode" to allow for easier ramp-up in production.

## Organization settings

- [IsContentSecurityPolicyEnabled](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabled) controls whether the Content-Security-Policy header is sent in the base app page (main.aspx). 

- [ContentSecurityPolicyConfiguration](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfiguration) controls the value of the frame-ancestors portion (as seen above, it is set to `'self'` if `ContentSecurityPolicyConfiguration` is not set).  This setting is represented by a JSON object with the following structure – `{ "Frame-Ancestor": { "sources": [ { "source": "foo" }, { "source": "bar" } ] } }`.  This would translate into `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'foo' 'bar';`
  - (From MDN) The HTTP Content-Security-Policy (CSP) frame-ancestors directive specifies valid parents that may embed a page using `<frame>`, `<iframe>`, `<object>`, `<embed>`, or `<applet>`.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
