---
title: IP firewall in Power Platform environments (preview)
description: Learn how to configure the IP firewall in Microsoft Power Platform environments to help keep your organizational data secure.
ms.date: 11/13/2023
ms.topic: how-to
author: ritesp
ms.author: ritesp
ms.reviewer: sericks
ms.custom:
  - template-overview
  - bap-template
---

# IP firewall in Power Platform environments (preview)

[This article is prerelease documentation and is subject to change.]

The IP firewall helps to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. The IP firewall analyses the IP address of each request in real time. For example, suppose the IP firewall is turned on in your production Dataverse environment and allowed IP addresses are in the ranges associated with your office locations and not any external IP location like a coffee shop. If a user tries to access organizational resources from a coffee shop, Dataverse denies access in real time.

:::image type="content" source="media/ip-firewall-dataverse-diagram.png" alt-text="Diagram illustrating the IP firewall feature in Dataverse.":::

> [!IMPORTANT]
>
> - The IP firewall feature is only available with [Managed Environments](managed-environment-overview.md).
> - The IP firewall feature only supports OData endpoints for accessing Dataverse data. Support for [TDS endpoints](settings-features.md#tds-endpoint) will be included in future release.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

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

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator.
1. Select **Environments**, and then select an environment.
1. Select **Settings** > **Product** > **Privacy + Security**.
1. Under **IP address settings**, set **Enable IP address based firewall rule** to **On**.
1. Under **Allowed list of IPv4 ranges**, specify the allowed IP ranges in classless interdomain routing (CIDR) format as per [RFC 4632](https://datatracker.ietf.org/doc/html/rfc4632). If you have multiple IP ranges, separate them with a comma. This field accepts up to 4,000 alphanumeric characters and allows a maximum of 200 IP ranges.
1. Select other settings, as appropriate:

   - **Service tags to be allowed by IP firewall**: From the list, select service tags that can bypass IP firewall restrictions.
   - **Allow access for Microsoft trusted services**: This setting enables Microsoft trusted services like monitoring and [support user](support-environment.md) etc. to bypass the IP firewall restrictions to access the Power Platform environment with Dataverse. Enabled by default.
   - **Allow access for all application users**: This setting allows [all application users](system-application-users.md) third-party and first-party access to Dataverse APIs. Enabled by default.
   - [**Enable IP firewall in audit-only mode**](#what-is-audit-only-mode): This setting enables the IP firewall but allows requests regardless of their IP address. Enabled by default.
   - **Reverse proxy IP addresses**: If your organization has reverse proxies configured, enter the IP addresses of one or more, separated by commas. The reverse proxy setting applies to both IP-based cookie binding and the IP firewall.

1. Select **Save**.

> [!IMPORTANT]
> When **Allow Access for Microsoft trusted services** and **Allow access for all application users** are disabled, some services that use Dataverse, such as Power Automate flows, might no longer work.

### Test the IP firewall

You should test the IP firewall to verify that it's working.

1. From an IP address that isn't in the allowed list of IP addresses for the environment, browse to your Power Platform environment URI.

   Your request should be rejected with a message that says, "The request you are trying to make is rejected as access to your IP is blocked. Contact your administrator for more information."

1. From an IP address that's in the allowed list of IP addresses for the environment, browse to your Power Platform environment URI.

   You should have the access to the environment that's defined by your security role.

We recommend that you should test the IP firewall in your test environment first, followed by audit-only mode in Production environment before enforcing the IP firewall on your Production environment.

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

### What should I do if requests to Dataverse starts to fail?

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

### Some of the calls from Power BI are failing after I enabled the IP firewall on the Power Platform environment. What should I do?
Currently, you can ony use IP firewall for OData endpoints in Dataverse to access data from configured IP location. If you want to continue using [TDS endpoints](settings-features.md#tds-endpoint), you must disable IP firewall in the environment.

### IP firewall audit functionality isn't working in my environment. What should I do?
IP firewall audit logs aren't supported in tenants enabled for bring-your-own-key [(BYOK)](manage-encryption-key.md) encryption keys. If your tenant is enabled for bring-your-own-key, then all environments in a BYOK-enabled tenant are locked down to SQL only, therefore audit logs can only be stored in SQL. We recommend that you migrate to [customer-managed key](customer-managed-key.md). To migrate from BYOK to customer-managed key (CMKv2), follow the steps in [Migrate bring-your-own-key (BYOK) environments to customer-managed key](cmk-migrate-from-byok.md).

## Next steps

[Security in Microsoft Dataverse](wp-security.md)
