---
title: IP firewall in Power Platform environments (preview)
description: Learn how to configure the IP firewall in Microsoft Power Platform environments to help keep your organizational data secure.
ms.date: 07/25/2023
ms.topic: how-to
author: ritesp
ms.author: ritesp
ms.reviewer: sericks
ms.custom:
  - template-overview
  - bap-template
---

# IP firewall in Power Platform environments (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The IP firewall helps to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. The IP firewall analyses the IP address of each request in real time. For example, suppose the IP firewall is turned on in your production Dataverse environment and allowed IP addresses are in the ranges associated with your office location. If a user tries to access organizational resources from a coffee shop, Dataverse denies access in real time.

:::image type="content" source="media/ip-firewall-dataverse-diagram.png" alt-text="Diagram illustrating the IP firewall feature in Dataverse.":::

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [preview](../includes/cc-preview-features-definition.md)]
> - The IP firewall feature is only available with [Managed Environments](managed-environment-overview.md).

## Key benefits

Enabling the IP firewall in your Power Platform environments offers several key benefits.

- **Mitigate insider threats like data exfiltration**: A malicious user who tries to download data from Dataverse using a client tool like Excel or Power BI from a disallowed IP location is blocked from doing so in real time.
- **Prevent token replay attacks**: If a user steals an access token and tries to use it to access Dataverse from outside allowed IP ranges, Dataverse denies the attempt in real time.

IT firewall protection works in both interactive and noninteractive scenarios.

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
1. Under **Allowed list of IPv4 or IPv6 ranges**, specify the allowed IP ranges in classless interdomain routing (CIDR) format. If you have multiple IP ranges, separate them with a comma. This field accepts up to 4,000 alphanumeric characters and allows a maximum of 200 IP ranges.
1. Select other settings, as appropriate:

   - **Service tags to be allowed by IP firewall**: From the list, select service tags that can bypass IP firewall restrictions.
   - **Allow access for Microsoft trusted services**: This setting allows service tags `PowerPlatformInfra`, `GenevaSynthetics`, and `GenevaActions` and internal first-party applications to access the Power Platform environment with Dataverse. Enabled by default.
   - **Allow access for all application users**: This setting allows all application users third-party and first-party access to Dataverse APIs. Enabled by default.
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

## Frequently asked questions (FAQ)

### What does the IP firewall cover in Power Platform?

The IP firewall is supported in any Power Platform environment that includes Dataverse.

### How soon does a change to the IP address list take effect?

Changes to the list of allowed IP addresses or ranges typically take effect in about five minutes.

### Does this feature work in real time?

IP firewall protection works in real time. Since the feature works at the network layer, it evaluates the request even before the authentication flow begins.

### Is this feature enabled by default in all environments?

The IP firewall isn't enabled by default. The Power Platform administrator needs to enable it in relevant environments.

### What is audit-only mode?

In audit-only mode, the IP firewall identifies the IP addresses that are making calls to the environment and allows them all, whether they're in an allowed range or not. It's helpful when you're configuring restrictions on a Power Platform environment. We recommend that you enable audit-only mode for at least a week and disable it only after careful review of the audit logs.

### Is this feature available in all the environments?

The IP firewall is available in Managed Environments only.

### Is there a limit on the number of IP addresses that I can add in the IP address text box?

You can add up to 200 IP addresses, separated by commas.

### What should I do if I'm locked out due to incorrect configuration of IP addresses in the IP firewall?

If the IP firewall is misconfigured, contact Microsoft Customer Support to get the environment unlocked.

### How do I download the audit log for audit-only mode?

Use the Dataverse OData API to download the audit log data in JSON format. The format of the audit log API is:

`https://[orgURI]/api/data/v9.1/audits?$select=createdon,changedata,action&$filter=action%20eq%20118&$orderby=createdon%20desc&$top=1`

- Replace **[orgURI]** with the Dataverse environment URI.
- Set the action value to **118** for this event.
- Set the number of items to return in **top=1** or specific the number you want to return.

Reach out to Microsoft Support to get the API enabled for your Power Platform environment.

### My Power Automate flows aren't working as expected after configuring the IP firewall on my Power Platform environment. What should I do?

In the IP firewall settings, allow the service tags listed in [Managed connectors outbound IP addresses](/connectors/common/outbound-ip-addresses).

### I have configured the reverse proxy address correctly, but the IP firewall isn't working

Make sure your reverse proxy is configured to send the client IP address in the forwarded header.

## Next steps

[Security in Microsoft Dataverse](wp-security.md)
