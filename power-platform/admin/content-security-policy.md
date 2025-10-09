---
title: Content security policy
description: Use content security policy to prevent clickjacking attacks in Power Apps. 
ms.date: 10/07/2025
ms.topic: how-to
author: JesseParsons
ms.subservice: admin
ms.custom: NewPPAC
ms.author: jeparson
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
- ZinanZhang
- sericks
- yingchin
---

# Content security policy

[Content Security Policy](https://developer.mozilla.org/docs/Web/HTTP/CSP) (CSP) is currently supported in model-driven and canvas apps. Admins can control whether the CSP header is sent and, to an extent, what it contains. **The settings are at the environment level, which means it's applied to all apps in the environment once turned on.**

> [!NOTE]
> The content security policy only applies to environments using Dataverse.

Each component of the CSP header value controls the assets that can be downloaded and is described in more detail on the Mozilla Developer Network (MDN). The default values are as follows:

| Directive | Default value | Customizable |
| --------- | ------------- | ------------ |
| [script-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/script-src) | `* 'unsafe-inline' 'unsafe-eval' blob: data:` | No |
| [worker-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/worker-src) | `'self' blob:` | No |
| [style-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/style-src) | `* 'unsafe-inline'` | No |
| [font-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/font-src) | `* data:` | No |
| [frame-ancestors](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) | `'self' https://*.powerapps.com` | Yes |

This configuration results in a default CSP of `script-src * 'unsafe-inline' 'unsafe-eval' blob: data:; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'self' https://*.powerapps.com;`.

### Strict mode

The Strict CSP toggle creates a CSP that mostly does not include wildcards or unsafe directives, such as `unsafe-inline`.  When Strict CSP is on, the above directives become the following.  The `<platform>` notation means that platform domains are provided as required by the product.  The domains in this section may change over time as the product grows.

| Directive | Default value (model-driven) | Default value (canvas) | Customizable |
| --------- | ---------------------------- | ---------------------- | ------------ |
| [script-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/script-src) | `'self' blob: data: <platform>'` | `'self' <platform>'` | Yes |
| [worker-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/worker-src) | `'self' blob:` | `'self' blob:` | No |
| [style-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/style-src) | `'self' 'unsafe-inline' <platform>` | `'self' 'unsafe-inline' <platform>` | Yes |
| [font-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/font-src) | `'self' data: <platform>` | `'self' data: <platform>` | Yes |
| [frame-ancestors](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) | `'self' https://*.powerapps.com` | `'self' https://*.powerapps.com` | Yes |
| [img-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/img-src) | `'self' blob: data: <platform>` | `'self' data: <platform>` | Yes |
| [connect-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/connect-src) | `'self' blob: data: wss: <platform>` | `'self' blob: <platform>` | Yes |
| [frame-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/frame-src) | `'self' blob: <platform>` | `'self' <platform>` | Yes |
| [base-uri](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/base-uri) | `'none'` | N/A | No |
| [form-action](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/form-action) | `<platform>` | N/A | Yes |
| [default-src](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/default-src) | `'self'` | `'self'` | No |

### Prerequisites

- For Dynamics 365 customer engagement apps and other model-driven apps, CSP is only available in online environments and in organizations with Dynamics 365 customer engagement (on-premises), version 9.1 or later version.

## Configure CSP

You can toggle and configure CSP through the Power Platform admin center. **It's important to enable a dev/test environment first** since enabling CSP could start blocking scenarios if the policy is violated. We also support a *report-only* mode to allow for easier ramp-up in production.

To configure CSP:

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, then select **Privacy + Security**.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Product**, then select **Privacy + Security**.

---

The following image shows the default state of the settings:

:::image type="content" source="media/content-security-policy/csp-default-settings.png" alt-text="Content security policy default settings.":::

### Reporting

The **Enable reporting** toggle controls whether model-driven and canvas apps send violation reports. You're required to specify an endpoint to enabling it. Violation reports are sent to this endpoint regardless of whether CSP is enforced or not (using report-only mode if CSP isn't enforced). For more information, see [reporting documentation](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only).

:::image type="content" source="media/content-security-policy/csp-reporting.png" alt-text="Enable the reporting toggle to on.":::

### Enforcement

Enforcement of CSP is controlled independently for model-driven and canvas apps to provide granular control over policies. Use the model-driven/canvas pivot to modify the intended app type.

The **Enforce content security policy** toggle turns on the default policy for enforcement for the given app type. Turning on this toggle changes the behavior of apps in this environment to adhere to the policy. Therefore, the suggested enablement flow would be:

1. Enforce on a dev/test environment.
1. Enable report-only mode in production.
1. Enforce in production once no violations are reported.

### Configure directives

The **Configure directives** section allows you to control individual directives within the policy. Currently, only `frame-ancestors` can be customized.

:::image type="content" source="media/content-security-policy/csp-directives.png" alt-text="Configure CSP directives.":::

Leaving the default directive toggled on uses the default value specified in the [table](#content-security-policy). Turning off the toggle allows admins to specify custom values for the directive and append them to the default value. The example below sets custom values for `frame-ancestors`. The directive would be set to `frame-ancestors: 'self' https://*.powerapps.com https://www.foo.com https://www.bar.com` in this example, meaning the app could be hosted in the same origin, `https://*.powerapps.com`, `https://www.foo.com` and `https://www.bar.com`, but not in other origins. Use the **Add** button to add entries to the list and the **Delete** icon to remove them.

:::image type="content" source="media/content-security-policy/csp-default-directive.png" alt-text="Setting custom CSP directives.":::

### Common configurations

For Microsoft Teams integration using the [Dynamics 365 app](/dynamics365/teams-integration/teams-integration), add the following to `frame-ancestors`:

- `https://teams.microsoft.com/`
- `https://teams.cloud.microsoft/`
- `https://msteamstabintegration.dynamics.com/`

For the Dynamics 365 App for Outlook, add the following to `frame-ancestors`:

- Your Outlook Web App homepage origin
- `https://outlook.office.com`
- `https://outlook.office365.com`

For embedding Power Apps in Power BI reports, add the following to `frame-ancestors`:

- `https://app.powerbi.com`
- `https://ms-pbi.pbi.microsoft.com`

### Important considerations

Turning off the default directive and saving with an empty list *turns off the directive completely* and doesn't send it as part of the CSP response header.

## CSP configuration examples

Let's take a look at a couple examples of CSP configurations.

### Example 1 - reporting turned off

:::image type="content" source="media/content-security-policy/csp-example-1.png" alt-text="CSP example 1.":::

In the example:

- Reporting is turned off.
- Model-driven enforcement is enabled.
  - `frame-ancestors` is customized to `https://www.foo.com` and `https://www.bar.com`
- Canvas enforcement is disabled.

The effective headers would be:

- Model-driven apps: `Content-Security-Policy: script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors https://www.foo.com https://www.bar.com;`
- Canvas apps: CSP header wouldn't be sent.

### Example 2 - reporting turned on

:::image type="content" source="media/content-security-policy/csp-example-2.png" alt-text="CSP example 2.":::

In the example:

- Reporting is turned on.
  - Reporting endpoint is set to `https://www.mysite.com/myreportingendpoint`
- Model-driven enforcement is enabled.
  - `frame-ancestors` is kept as default
- Canvas enforcement is disabled.
  - `frame-ancestors` is customized to `https://www.baz.com`

The effective CSP values would be:

- Model-driven apps: `Content-Security-Policy: script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'self' https://*.powerapps.com; report-uri https://www.mysite.com/myreportingendpoint;`
- Canvas apps: `Content-Security-Policy-Report-Only: script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors https://www.baz.com; report-uri https://www.mysite.com/myreportingendpoint;`

## Modify organization settings directly

You can configure CSP without using the UI by modifying these organization settings directly:

- [IsContentSecurityPolicyEnabled](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabled) controls whether the Content-Security-Policy header is sent in model-driven apps.

- [ContentSecurityPolicyConfiguration](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfiguration) controls the value of the frame-ancestors portion (as seen above, it sets to `'self'` if `ContentSecurityPolicyConfiguration` isn't set). This setting is defined using a JSON object with the following structure – `{ "Frame-Ancestor": { "sources": [ { "source": "foo" }, { "source": "bar" } ] } }`. This configuration translates into `script-src * 'unsafe-inline' 'unsafe-eval'; worker-src 'self' blob:; style-src * 'unsafe-inline'; font-src * data:; frame-ancestors 'foo' 'bar';`
  - (From MDN) The HTTP Content-Security-Policy (CSP) frame-ancestors directive specifies valid parents that may embed a page using `<frame>`, `<iframe>`, `<object>`, `<embed>`, or `<applet>`.

- [IsContentSecurityPolicyEnabledForCanvas](/powerapps/developer/data-platform/reference/entities/organization#BKMK_IsContentSecurityPolicyEnabledForCanvas) controls whether the Content-Security-Policy header is sent in canvas apps.

- [ContentSecurityPolicyConfigurationForCanvas](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfigurationForCanvas) controls the policy for canvas using the same process described in `ContentSecurityPolicyConfiguration`.

- [ContentSecurityPolicyReportUri](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyReportUri) controls whether reporting should be used. This setting is used by both model-driven and canvas apps. A valid string sends violation reports to the specified endpoint, using report-only mode if `IsContentSecurityPolicyEnabled`/`IsContentSecurityPolicyEnabledForCanvas` is turned off. An empty string disables reporting. For more information, see [reporting documentation](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only).

## Configuring CSP without UI

Especially for environments not in the Power Platform admin center such as on-premises configurations, admins may want to configure CSP using scripts to directly modify settings.

### Enable CSP without UI

Take these steps to enable CSP without UI:

- Open browser dev tools while using the model-driven app as a user with organization entity update privileges (System Administrator is a good option).
- Paste and execute the following script into the console.
- To enable CSP, pass the default configuration - `enableFrameAncestors(["'self'"])`
- As an example of enabling other origins to embed the app - `enableFrameAncestors(["*.powerapps.com", "'self'", "abcxyz"])`

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

### Disable CSP without UI

Take these steps to disable CSP without UI:

- Open browser dev tools while using the model-driven app as a user with organization entity update privileges (System Administrator is a good option).
- Paste and execute the following script into the console.
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
