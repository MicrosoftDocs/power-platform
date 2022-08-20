---
title: "Content security policy"
description: "Use content security policy to prevent clickjacking in Power Apps."  
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

[Content Security Policy](https://developer.mozilla.org/docs/Web/HTTP/CSP) (CSP) is currently supported in model-driven and canvas Power Apps. Admins can control whether the CSP header is sent and, to an extent, what it contains. The settings are at the environment level, which means it would be applied to all apps in the environment once turned on. 

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

CSP can be toggled and configured through the Power Platform Admin Center (PPAC). **It is important to enable on a dev/test environment first** since enabling this could start blocking scenarios if the policy is violated.  We also support a "report-only mode" to allow for easier ramp-up in production.

To configure CSP, navigate to [PPAC](https://admin.powerplatform.microsoft.com) -> Environments -> Settings -> Privacy + Security. Below is the default state of the settings:

![Content security policy default settings](media/csp-default-settings.png "Content security policy default settings")

The "Enable reporting" toggle controls whether model-driven and canvas apps send violation reports. Enabling it requires an endpoint to be specified. Violation reports will be sent to this endpoint regardless of whether CSP is enforced or not (using report-only mode if CSP is not enforced).

Enforcement of CSP is controlled independently for model-driven and canvas apps to provide granular control over policies. Use the Model-driven / Canvas pivot to modify the intended app type.

The "Enforce content security policy" turns on the default settings, as specified above, for the given app type. Turning this toggle on will change the behavior of apps in this environment to adhere to the policy, so it is suggested to enable on a dev/test environment, then enable report-only mode in production before enforcing in production.

The final section is "Configure directives". This section allows you to control individual directives within the policy. Currently, only `frame-ancestors` can be customized.

## Organization 

CSP can be configured without using UI by modifying the following organization settings directly:

- [IsContentSecurityPolicyEnabled](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabled) controls whether the Content-Security-Policy header is sent in model-driven apps.

- [ContentSecurityPolicyConfiguration](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfiguration) controls the value of the frame-ancestors portion (as seen above, it is set to `'self'` if `ContentSecurityPolicyConfiguration` is not set).  This setting is represented by a JSON object with the following structure – `{ "Frame-Ancestor": { "sources": [ { "source": "foo" }, { "source": "bar" } ] } }`.  This would translate into `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'foo' 'bar';`
  - (From MDN) The HTTP Content-Security-Policy (CSP) frame-ancestors directive specifies valid parents that may embed a page using `<frame>`, `<iframe>`, `<object>`, `<embed>`, or `<applet>`.

- [IsContentSecurityPolicyEnabledForCanvas](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabledForCanvas) controls whether the Content-Security-Policy header is sent in canvas apps.

- [ContentSecurityPolicyConfigurationForCanvas](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfigurationForCanvas) controls the policy for canvas using the same process described in `ContentSecurityPolicyConfiguration` above.

- [ContentSecurityPolicyReportUri](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyReportUri) controls whether reporting should be used. This is used by both model-driven and canvas apps. A valid string will send violation reports to the specified endpoint, using report-only mode if `IsContentSecurityPolicyEnabled`/`IsContentSecurityPolicyEnabledForCanvas` is turned off. An empty string disables reporting.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
