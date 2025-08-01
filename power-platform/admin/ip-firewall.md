---
title: IP firewall in Power Platform environments
description: Learn how to configure the IP firewall in Microsoft Power Platform environments to help keep your organizational data secure.
ms.date: 04/17/2025
ms.topic: how-to
author: ritesp
ms.author: ritesp
ms.reviewer: sericks
ms.custom:
  - template-overview
  - bap-template
contributors:
  - matapg007 
---

# IP firewall in Power Platform environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The IP firewall helps to protect your organizational data by limiting user access to Microsoft Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real time. For example, suppose the IP firewall is turned on in your production Dataverse environment, and allowed IP addresses are in the ranges associated with your office locations and not any external IP location like a coffee shop. If a user tries to access organizational resources from a coffee shop, Dataverse denies access in real time.

:::image type="content" source="media/ip-firewall-dataverse-diagram.png" alt-text="Diagram illustrating the IP firewall feature in Dataverse.":::

## Key benefits

Enabling the IP firewall in your Power Platform environments offers several key benefits.

- **Mitigate insider threats like data exfiltration**: A malicious user who tries to download data from Dataverse using a client tool like Excel or Power BI from a disallowed IP location is blocked from doing so in real time.
- **Prevent token replay attacks**: If a user steals an access token and tries to use it to access Dataverse from outside allowed IP ranges, Dataverse denies the attempt in real time.

IP firewall protection works in both interactive and noninteractive scenarios.

## How does the IP firewall work?

When a request is made to Dataverse, the request IP address is evaluated in real time against the IP ranges configured for the Power Platform environment. If the IP address is in the allowed ranges, the request is allowed. If the IP address is outside the IP ranges configured for the environment, the IP firewall denies the request with an error message: *The request you are trying to make is rejected as access to your IP is blocked. Contact your administrator for more information*.

## Prerequisites

- The IP firewall is a feature of [Managed Environments](managed-environment-overview.md).
- You must have a Power Platform admin role to enable or disable the IP firewall.

## Enable the IP firewall

You can enable the IP firewall in a Power Platform environment by using either Power Platform admin center or the Dataverse OData API.

### Enable the IP firewall using Power Platform admin center

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator.
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. In the **Identity and access management** page, select **IP firewll**.
1. In the **Set up IP firewall** pane, select an environment. Then select **Set up IP firewall**.
1. In the **Set up IP firewall for this environment** pane, select **IP Firewall** to **On**.
1. Under **Allowed list of IP addresses**, specify the allowed IP ranges in classless interdomain routing (CIDR) format as per [RFC 4632](https://datatracker.ietf.org/doc/html/rfc4632). If you have multiple IP ranges, separate them with a comma. This field accepts up to 4,000 alphanumeric characters and allows a maximum of 200 IP ranges. IPv6 addresses are allowed both in hexadecimal and compressed format.
1. Select other advanced settings, as appropriate:

   - **Allowed list of service tags**: From the list, select service tags that can bypass IP firewall restrictions.
   - **Allow access for Microsoft trusted services**: This setting enables Microsoft trusted services like monitoring and [support user](support-environment.md) etc. to bypass the IP firewall restrictions to access the Power Platform environment with Dataverse. Enabled by default.
   - **Allow access for all application users**: This setting allows [all application users](system-application-users.md) third-party and first-party access to Dataverse APIs. Enabled by default. If you clear this value, it only blocks third-party application users.
   - [**Enable IP firewall in audit-only mode**](#what-is-audit-only-mode): This setting enables the IP firewall but allows requests regardless of their IP address. Enabled by default.
   - **Reverse proxy IP addresses**: If your organization has reverse proxies configured, enter the IP addresses separated by commas. The reverse proxy setting applies to both [IP-based cookie binding](block-cookie-replay-attack.md) and the IP firewall. Reach out to your network administrator to get the reverse proxy IP addresses.
     
     > [!NOTE]
     > Reverse proxy must be configured to send user client IP addresses in the [forwarded](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Forwarded) header.

1. Select **Save**.

### Enable IP firewall at an environment group-level

To configure IP firewall settings at the environment group-level, complete the following steps.
Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. Select a IP firewall pane.
1. In the pane that is displayed, select the **Environment groups** tab to which you want the security setting applied.Then select **Set up IP firewall**.
1. In the **Set up IP firewall** pane, select **IP Firewall** to **On**.
1. Under **Allowed list of IP addresses**, specify the allowed IP ranges in classless interdomain routing (CIDR) format as per [RFC 4632](https://datatracker.ietf.org/doc/html/rfc4632). If you have multiple IP ranges, separate them with a comma. This field accepts up to 4,000 alphanumeric characters and allows a maximum of 200 IP ranges. IPv6 addresses are allowed both in hexadecimal and compressed format.
1. Select other advanced settings, as appropriate:

   - **Allowed list of service tags**: From the list, select service tags that can bypass IP firewall restrictions.
   - **Allow access for Microsoft trusted services**: This setting enables Microsoft trusted services like monitoring and [support user](support-environment.md) etc. to bypass the IP firewall restrictions to access the Power Platform environment with Dataverse. Enabled by default.
   - **Allow access for all application users**: This setting allows [all application users](system-application-users.md) third-party and first-party access to Dataverse APIs. Enabled by default. If you clear this value, it only blocks third-party application users.
   - [**Enable IP firewall in audit-only mode**](#what-is-audit-only-mode): This setting enables the IP firewall but allows requests regardless of their IP address. Enabled by default.
   - **Reverse proxy IP addresses**: If your organization has reverse proxies configured, enter the IP addresses separated by commas. The reverse proxy setting applies to both [IP-based cookie binding](block-cookie-replay-attack.md) and the IP firewall. Reach out to your network administrator to get the reverse proxy IP addresses.
1. Select **Save**.
    > [!Note]
    > Reverse proxy must be configured to send user client IP addresses in the [forwarded](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Forwarded) header.
    > 
    > Selected settings are applied to all the environments in that environment group.

### Enable IP firewall using the Dataverse OData API
You can use the Dataverse OData API to retrieve and modify values within a Power Platform environment. For detailed guidance, see [Query data using the Web API](/power-apps/developer/data-platform/webapi/query-data-web-api) and [Update and delete table rows using the Web API (Microsoft Dataverse)](/power-apps/developer/data-platform/webapi/update-delete-entities-using-web-api#update-a-single-property-value).

You have the flexibility to select the tools that you prefer. Use the following documentation to retrieve and modify values through the Dataverse OData API:

- [Use Insomnia with Dataverse Web API](/power-apps/developer/data-platform/webapi/insomnia)
- [Quick Start Web API with PowerShell and Visual Studio Code](/power-apps/developer/data-platform/webapi/quick-start-ps)

**Configure the IP firewall by using the OData API**

~~~
PATCH https://{yourorg}.api.crm*.dynamics.com/api/data/v9.2/organizations({yourorgID})
HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0
~~~

**Payload**

~~~
[
    {
        "enableipbasedfirewallrule": true,
        "allowediprangeforfirewall": "18.205.0.0/24,21.200.0.0/16",
        "enableipbasedfirewallruleinauditmode": true,
        "allowedservicetagsforfirewall": "AppService,ActionGroup,ApiManagement,AppConfiguration,AppServiceManagement,ApplicationInsightsAvailability,AutonomousDevelopmentPlatform,AzureActiveDirectory,AzureAdvancedThreatProtection,AzureArcInfrastructure,AzureAttestation,AzureBackup,AzureBotService",
        "allowapplicationuseraccess": true,
        "allowmicrosofttrustedservicetags": true
    }
]
~~~

- **enableipbasedfirewallrule** – Enable the feature by setting the value to **true**, or disable it by setting the value to **false**.
- **allowediprangeforfirewall** — List the IP ranges that should be allowed. Provide them in CIDR notation, separated by a comma.

    > [!IMPORTANT]
    > Make sure that the service tag names exactly match what you see on the IP firewall's settings page. If there's any discrepancy, IP restrictions might not work correctly.

- **enableipbasedfirewallruleinauditmode** – A value of **true** indicates audit-only mode, whereas a value of **false** indicates enforcement mode.
- **allowedservicetagsforfirewall** – List the service tags that should be allowed, separated by a comma. If you don't want to configure any service tags, leave the value null.
- **allowapplicationuseraccess** – The default value is **true**.
- **allowmicrosofttrustedservicetags** – The default value is **true**.

> [!IMPORTANT]
> When **Allow Access for Microsoft trusted services** and **Allow access for all application users** are disabled, some services that use Dataverse, such as Power Automate flows, might no longer work.

### Test the IP firewall

You should test the IP firewall to verify that it's working.

1. From an IP address that isn't in the allowed list of IP addresses for the environment, browse to your Power Platform environment URI.

   Your request should be rejected with a message that says, "The request you are trying to make is rejected as access to your IP is blocked. Contact your administrator for more information."

1. From an IP address that's in the allowed list of IP addresses for the environment, browse to your Power Platform environment URI.

   You should have the access to the environment that's defined by your security role.

We recommend that you should test the IP firewall in your test environment first, followed by audit-only mode in Production environment before enforcing the IP firewall on your Production environment.

> [!NOTE]
> By default, [TDS endpoint](settings-features.md#tds-endpoint) is turned on within the Power Platform environment.

## Licensing requirements for IP firewall

IP firewall is only enforced on environments that are activated for Managed Environments. Managed Environments are included as an entitlement in standalone Power Apps, Power Automate, Microsoft Copilot Studio, Power Pages, and Dynamics 365 licenses that give premium usage rights. Learn more about [Managed Environment licensing](managed-environment-licensing.md) with the [Licensing overview for Microsoft Power Platform](pricing-billing-skus.md).

In addition, access to using IP firewall for Dataverse requires users in the environments where the IP firewall is enforced to have one of these subscriptions:

- Microsoft 365 or Office 365 A5/E5/G5
- Microsoft 365 A5/E5/F5/G5 Compliance
- Microsoft 365 F5 Security & Compliance
- Microsoft 365 A5/E5/F5/G5 Information Protection and Governance
- Microsoft 365 A5/E5/F5/G5 Insider Risk Management

[Learn more about these licenses](https://go.microsoft.com/fwlink/?linkid=2214240)


## Frequently asked questions (FAQ)

### What does the IP firewall cover in Power Platform?

The IP firewall is supported in any Power Platform environment that includes Dataverse.

### How soon does a change to the IP address list take effect?

Changes to the list of allowed IP addresses or ranges typically take effect in about 5-10 minutes.

### Does this feature work in real time?

IP firewall protection works in real time. Since the feature works at the network layer, it evaluates the request after the authentication request is completed.

### Is this feature enabled by default in all environments?

The IP firewall isn't enabled by default. The Power Platform administrator needs to enable it for Managed Environments.

### What is audit-only mode?

In audit-only mode, the IP firewall identifies the IP addresses that are making calls to the environment and allows them all, whether they're in an allowed range or not. It's helpful when you're configuring restrictions on a Power Platform environment. We recommend that you enable audit-only mode for at least a week and disable it only after careful review of the [audit logs](#how-do-i-download-the-audit-log-for-audit-only-mode).

### Is this feature available in all the environments?

The IP firewall is available for [Managed Environments](managed-environment-overview.md) only.

### Is there a limit on the number of IP addresses that I can add in the IP address text box?

You can add up to 200 IP addresses ranges in CIDR format as per [RFC 4632](https://datatracker.ietf.org/doc/html/rfc4632), separated by commas.

### What should I do if requests to Dataverse start to fail?

An incorrect configuration of IP ranges for IP firewall might be causing this issue. You can check and verify the IP ranges on the IP firewall settings page. We recommend that you turn on the IP firewall in Audit-only mode before enforcing it.

### How do I download the audit log for audit-only mode?

Use the Dataverse OData API to download the audit log data in JSON format. The format of the audit log API is:

`https://[orgURI]/api/data/v9.1/audits?$select=createdon,changedata,action&$filter=action%20eq%20118&$orderby=createdon%20desc&$top=1`

- Replace **[orgURI]** with the Dataverse environment URI.
- Set the action value to **118** for this event.
- Set the number of items to return in **top=1** or specific the number you want to return.

### My Power Automate flows aren't working as expected after configuring the IP firewall on my Power Platform environment. What should I do?

In the IP firewall settings, allow the service tags listed in [Managed connectors outbound IP addresses](/connectors/common/outbound-ip-addresses).

### I have configured the reverse proxy address correctly, but the IP firewall isn't working. What should I do?

Make sure your reverse proxy is configured to send the client IP address in the forwarded header.

### IP firewall audit functionality isn't working in my environment. What should I do?
IP firewall audit logs aren't supported in tenants enabled for bring-your-own-key [(BYOK)](manage-encryption-key.md) encryption keys. If your tenant is enabled for bring-your-own-key, then all environments in a BYOK-enabled tenant are locked down to SQL only, therefore audit logs can only be stored in SQL. We recommend that you migrate to [customer-managed key](customer-managed-key.md). To migrate from BYOK to customer-managed key (CMKv2), follow the steps in [Migrate bring-your-own-key (BYOK) environments to customer-managed key](cmk-migrate-from-byok.md).

### Does IP firewall support IPv6 IP ranges?
Yes, IP firewall supports IPv6 IP ranges.

## Next steps

[Security in Microsoft Dataverse](wp-security.md)
