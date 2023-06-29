---
title: "Content security policy"
description: "Use content security policy to prevent clickjacking in Power Apps."  
ms.date: 05/16/2023
ms.topic: conceptual
author: JesseParsons
ms.subservice: admin
ms.author: jeparson
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Content security policy

[Content Security Policy](https://developer.mozilla.org/docs/Web/HTTP/CSP) (CSP) is currently supported in model-driven and canvas Power Apps. Admins can control whether the CSP header is sent and, to an extent, what it contains. **The settings are at the environment level, which means it would be applied to all apps in the environment once turned on.**

Each component of the CSP header value controls the assets that can be downloaded and is described in more detail on the Mozilla Developer Network (MDN). The default values are as follows:

| Directive | Default value | Customizable |
| --------- | ------------- | ------------ |
| [script-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/script-src) | `* 'unsafe-inline' 'unsafe-eval'` | No |
| [worker-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/worker-src) | `'self' blob:` | No |
| [style-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/style-src) | `* 'unsafe-inline'` | No |
| [font-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/font-src) | `* data:` | No |
| [frame-ancestors](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) | `'self'` | Yes |

This results in a default CSP of `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'self';`. In our roadmap, we have the ability to modify currently non-customizable headers.

### Prerequisites
- For Dynamics 365 Customer Engagement apps and other model-driven apps, CSP is only available in online environments and in organizations with Dynamics 365 Customer Engagement (on-premises), version 9.1 or later version.

## Configuring CSP

CSP can be toggled and configured through the Power Platform admin center. **It is important to enable on a dev/test environment first** since enabling this could start blocking scenarios if the policy is violated.  We also support a "report-only mode" to allow for easier ramp-up in production.

To configure CSP, navigate to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) -> **Environments** -> **Settings** -> **Privacy + Security**. Below is the default state of the settings:

![Content security policy default settings](media/csp-default-settings.png "Content security policy default settings")

### Reporting

The "Enable reporting" toggle controls whether model-driven and canvas apps send violation reports. Enabling it requires an endpoint to be specified. Violation reports are sent to this endpoint regardless of whether CSP is enforced or not (using report-only mode if CSP isn't enforced). For more information, see [reporting documentation](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only).

![Enabling reporting endpoint](media/csp-reporting.png "Enabling reporting endpoint")

### Enforcement

Enforcement of CSP is controlled independently for model-driven and canvas apps to provide granular control over policies. Use the model-driven/canvas pivot to modify the intended app type.

The "Enforce content security policy" toggle turns on the default policy for enforcement, as specified above, for the given app type. Turning on this toggle changes the behavior of apps in this environment to adhere to the policy. Therefore, the suggested enablement flow would be:
1. Enforce on a dev/test environment.
2. Enable report-only mode in production.
3. Enforce in production once no violations are reported.

### Configuring directives

The final section is "Configure directives". This section allows you to control individual directives within the policy. Currently, only `frame-ancestors` can be customized.

![Configure CSP directives](media/csp-directives.png "Configure CSP directives")

Leaving the default directive toggled on uses the default value specified in the table above. Turning off the toggle allows admins to specify custom values for the directive. The example below sets custom values for `frame-ancestors`. The directive would be set to `frame-ancestors: https://www.foo.com https://www.bar.com` in this example, meaning the app could be hosted in `https://www.foo.com` and `https://www.bar.com`, but not in other origins. Use the Add button to add entries to the list and the delete icon to remove them.

![Setting custom CSP directives](media/csp-default-directive.png "Setting custom CSP directives")

### Common configurations
For Microsoft Teams integration using the [Dynamics 365 app](/dynamics365/teams-integration/teams-integration), add the following to `frame-ancestors`:
- `https://teams.microsoft.com/`
- `https://msteamstabintegration.dynamics.com/`

For Dynamics 365 App for Outlook, you must add your Outlook Web App homepage origin to `frame-ancestors`.

### Important considerations
Turning off the default directive and saving with an empty list *turns off the directive completely* and doesn't send it as part of the CSP response header.

## Examples

Let's take a look at a couple examples of CSP configuration:

### Example 1

![CSP example 1](media/csp-example-1.png "CSP example 1")

In the above example:
- Reporting is turned off.
- Model-driven enforcement is enabled.
  - `frame-ancestors` is customized to `https://www.foo.com` and `https://www.bar.com`
- Canvas enforcement is disabled.

The effective headers would be:
- Model-driven apps: `Content-Security-Policy: script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors https://www.foo.com https://www.bar.com;`
- Canvas apps: CSP header wouldn't be sent.

### Example 2

![CSP example 2](media/csp-example-2.png "CSP example 2")

In the above example:
- Reporting is turned on.
  - Reporting endpoint is set to `https://www.mysite.com/myreportingendpoint`
- Model-driven enforcement is enabled.
  - `frame-ancestors` is kept as default
- Canvas enforcement is disabled.
  - `frame-ancestors` is customized to `https://www.baz.com`

The effective CSP values would be:
- Model-driven apps: `Content-Security-Policy: script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'self'; report-uri https://www.mysite.com/myreportingendpoint;`
- Canvas apps: `Content-Security-Policy-Report-Only: script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors https://www.baz.com; report-uri https://www.mysite.com/myreportingendpoint;`

## Organization settings

CSP can be configured without using the UI by modifying the following organization settings directly:

- [IsContentSecurityPolicyEnabled](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabled) controls whether the Content-Security-Policy header is sent in model-driven apps.

- [ContentSecurityPolicyConfiguration](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfiguration) controls the value of the frame-ancestors portion (as seen above, it is set to `'self'` if `ContentSecurityPolicyConfiguration` is not set).  This setting is represented by a JSON object with the following structure – `{ "Frame-Ancestor": { "sources": [ { "source": "foo" }, { "source": "bar" } ] } }`.  This would translate into `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'foo' 'bar';`
  - (From MDN) The HTTP Content-Security-Policy (CSP) frame-ancestors directive specifies valid parents that may embed a page using `<frame>`, `<iframe>`, `<object>`, `<embed>`, or `<applet>`.

- [IsContentSecurityPolicyEnabledForCanvas](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabledForCanvas) controls whether the Content-Security-Policy header is sent in canvas apps.

- [ContentSecurityPolicyConfigurationForCanvas](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfigurationForCanvas) controls the policy for canvas using the same process described in `ContentSecurityPolicyConfiguration` above.

- [ContentSecurityPolicyReportUri](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyReportUri) controls whether reporting should be used. This setting is used by both model-driven and canvas apps. A valid string sends violation reports to the specified endpoint, using report-only mode if `IsContentSecurityPolicyEnabled`/`IsContentSecurityPolicyEnabledForCanvas` is turned off. An empty string disables reporting. For more information, see [reporting documentation](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only).

## Configuring CSP without UI
Especially for environments not in the Power Platform admin center such as on-premises configurations, admins may want to configure CSP using scripts to directly modify settings.

### Enabling CSP without UI
Steps:
- Open browser dev tools while using the model-driven app as a user with organization entity update privileges (System Administrator is a good option).
- Paste and execute the below script into the console.
- To simply enable CSP, pass the default configuration - `enableFrameAncestors(["'self'"])`
- As an example of enabling additional origins to embed the app - `enableFrameAncestors(["*.powerapps.com", "'self'", "abcxyz"])`

```js
async function enableFrameAncestors(sources) {
    const baseUrl = Xrm.Utility.getGlobalContext().getClientUrl();

    if (!Array.isArray(sources) || sources.some(s => typeof s !== 'string')) {
        throw new Error('sources must be a string array');
    }

    const orgResponse = await fetch(`${baseUrl}/api/data/v9.1/organizations`);
    if (!orgResponse.ok) throw new Error('Failed to retrieve org info');
    const orgs = await orgResponse.json();
    const { organizationid, contentsecuritypolicyconfiguration, iscontentsecuritypolicyenabled } = orgs.value[0];

    console.log(`Organization Id: ${organizationid}`);
    console.log(`CSP Enabled?: ${iscontentsecuritypolicyenabled}`);
    console.log(`CSP Config: ${contentsecuritypolicyconfiguration}`);

    const orgProperty = prop => `${baseUrl}/api/data/v9.1/organizations(${organizationid})/${prop}`;

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
### Disabling CSP without UI
Steps:
- Open browser dev tools while using the model-driven app as a user with organization entity update privileges (System Administrator is a good option).
- Paste and execute the below script into the console.
- To disable CSP, paste into the console: `disableCSP()`

```js
async function disableCSP() {
    const baseUrl = Xrm.Utility.getGlobalContext().getClientUrl();

    const orgResponse = await fetch(`${baseUrl}/api/data/v9.1/organizations`);
    if (!orgResponse.ok) throw new Error('Failed to retrieve org info');
    const orgs = await orgResponse.json();
    const { organizationid, iscontentsecuritypolicyenabled } = orgs.value[0];

    console.log(`Organization Id: ${organizationid}`);
    console.log(`CSP Enabled?: ${iscontentsecuritypolicyenabled}`);

    const orgProperty = prop => `${baseUrl}/api/data/v9.1/organizations(${organizationid})/${prop}`;

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
