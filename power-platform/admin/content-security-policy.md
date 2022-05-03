---
title: "Content security policy"
description: "Use content security policy to control which assets can be downloaded by model-driven app customizations."  
ms.date: 05/02/2022
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

[Content Security Policy](https://developer.mozilla.org/docs/Web/HTTP/CSP) (CSP) is currently supported in model-driven Power Apps via two organization entity attributes which control whether the CSP header is sent and, to an extent, what it contains. This setting is at the environment level, which means it would be applied to all apps in the environment once turned on. 

> [!NOTE]
> CSP is currently only supported in model-driven apps.  Canvas app support is on the roadmap, and will be enabled by June 2022.

- [IsContentSecurityPolicyEnabled](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabled) controls whether the Content-Security-Policy header is sent in the base app page (main.aspx).  By default, the header is set to `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'self';`. Each component of this header value controls the assets that can be downloaded and is described in more detail on the Mozilla Developer Network (MDN):
  - [script-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/script-src)
  - [worker-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/worker-src)
  - [style-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/style-src)
  - [font-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/font-src)
  - [frame-ancestors](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors)
- [ContentSecurityPolicyConfiguration](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfiguration) controls the value of the frame-ancestors portion (as seen above, it is set to ‘self’ if ContentSecurityPolicyConfiguration is not set).  This setting is represented by a JSON object with the following structure – `{ "Frame-Ancestor": { "sources": [ { "source": "foo" }, { "source": "bar" } ] } }`.  This would translate into `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'foo' 'bar';`
  - (From MDN) The HTTP Content-Security-Policy (CSP) frame-ancestors directive specifies valid parents that may embed a page using `<frame>`, `<iframe>`, `<object>`, `<embed>`, or `<applet>`.

## Configuring CSP

Currently, there is no UI for editing these attributes, but we do plan to expose these in the Power Platform admin center in the future.  In the meantime, you can use the below script to enable and update the frame-ancestors attribute.  **It is important to enable on a dev/test environment first** since enabling this could start blocking assets from being downloaded if the policy is violated.  We plan to support a "report-only mode" in the future to allow for easier ramp-up in production.

### Enabling CSP
Steps:
- Open browser dev tools while using the model-driven app as a user with organization entity update privileges (System Administrator is a good option).
- Paste and execute the below script into the console.
- To simply enable CSP, pass the default configuration - `enableFrameAncestors(["'self'"])`
- As an example of enabling additional origins to embed the app - `enableFrameAncestors(["*.powerapps.com", "'self'", "abcxyz"])`

```js
async function enableFrameAncestors(sources) {
     if (!Array.isArray(sources) || sources.some(s => typeof s !== 'string')) {
        throw new Error('sources must be a string array');
    }

    const orgResponse = await fetch('/api/data/v9.1/organizations');
    if (!orgResponse.ok) throw new Error('Failed to retrieve org info');
    const orgs = await orgResponse.json();
    const { organizationid, contentsecuritypolicyconfiguration, iscontentsecuritypolicyenabled } = orgs.value[0];

    console.log(`Organization Id: ${organizationid}`);
    console.log(`CSP Enabled?: ${iscontentsecuritypolicyenabled}`);
    console.log(`CSP Config: ${contentsecuritypolicyconfiguration}`);

    const orgProperty = prop => `/api/data/v9.1/organizations(${organizationid})/${prop}`;

    console.log('Updating CSP configuration...')
    const config = {
        'Frame-Ancestor': {
            sources: sources.map(source => ({ source })),
        },
    };
    const cspConfigResponse = await fetch(orgProperty('contentsecuritypolicyconfiguration'), {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            value: JSON.stringify(config),
        }),
    });

    if (!cspConfigResponse.ok) {
        throw new Error('Failed to update csp configuration');
    }
    console.log('Successfully updated CSP configuration!')

    if (iscontentsecuritypolicyenabled) {
        console.log('CSP is already enabled! Skipping update.')
        return;
    }

    console.log('Enabling CSP...')
    const cspEnableResponse = await fetch(orgProperty('iscontentsecuritypolicyenabled'), {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            value: true,
        }),
    });

    if (!cspEnableResponse.ok) {
        throw new Error('Failed to enable csp');
    }
    console.log('Successfully enabled CSP!')
}
```
### Disabling CSP
Steps:
- Open browser dev tools while using the model-driven app as a user with organization entity update privileges (System Administrator is a good option).
- Paste and execute the below script into the console.
- To disable CSP, paste into the console: `disableCSP()`

```js
async function disableCSP() {
    const orgResponse = await fetch('/api/data/v9.1/organizations');
    if (!orgResponse.ok) throw new Error('Failed to retrieve org info');
    const orgs = await orgResponse.json();
    const { organizationid, iscontentsecuritypolicyenabled } = orgs.value[0];

    console.log(`Organization Id: ${organizationid}`);
    console.log(`CSP Enabled?: ${iscontentsecuritypolicyenabled}`);

    const orgProperty = prop => `/api/data/v9.1/organizations(${organizationid})/${prop}`;

    if (!iscontentsecuritypolicyenabled) {
        console.log('CSP is already disabled! Skipping update.')
        return;
    }

    console.log('Disabling CSP...')
    const cspEnableResponse = await fetch(orgProperty('iscontentsecuritypolicyenabled'), {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            value: false,
        }),
    });

    if (!cspEnableResponse.ok) {
        throw new Error('Failed to disable csp');
    }
    console.log('Successfully disabled CSP!')
}
```

[!INCLUDE[footer-include](../includes/footer-banner.md)]
