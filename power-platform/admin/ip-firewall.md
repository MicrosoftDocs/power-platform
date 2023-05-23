---
title: IP firewall in Power Platform environments
description: Learn about how to use IP firewall in Power Platform environments.
author: ritesp
ms.author: ritesp
ms.topic: overview
ms.date: 05/23/2023
ms.reviewer: sericks
ms.custom: template-overview

---

# IP firewall in Power Platform environments (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Limit access to users with IP firewall by IP location to reduce unauthorized access to Dataverse. By using the IP firewall feature, you can apply the right access controls when needed to help keep your organization's data secure and out of your users' way when not needed. IP firewall analyses and enforces the IP address of each request in real time. 

For example, suppose the IP firewall is turned on in your production Dataverse environment, and IP ranges are set with the IP address of your office location. Then, when a user tries to access the resources from another location, such as a coffee shop, Dataverse denies access to Power Platform resources in real time.

:::image type="content" source="media/ip-firewall-dataverse-diagram.png" alt-text="IP firewall feature in Dataverse":::

> [!IMPORTANT]
> - This is a preview feature.
> - [!include [preview](../includes/cc-preview-features-definition.md)]
> - The IP firewall feature is only available with Managed Environments. More information: [Managed Environments overview](managed-environment-overview.md)

## Key benefits

- Helps mitigate insider threats like data exfiltration in real time. A malicious user who tries to download data from Dataverse using a client tool, such as Excel or Power BI, is blocked from downloading the data bssed on the IP location.
- Helps prevent token replay attacks from outside configured IP ranges. If a user steals a token and tries to use it to access Dataverse from outside configured IP ranges, the access is denied by Dataverse in real time.
- It works for both interactive and non-interactive scenarios.

## How does IP firewall work?

When a request is made to Dataverse, the request IP address is evaluated in real time against the IP ranges configured for the Power Platform environment. If the IP address is from the IP ranges configured for the Power Platform environment, the request is allowed. If the IP address is not from the IP ranges configured for the environment, the request is rejected by the IP firewall with error message: *The request you are trying to make is rejected as access to your IP is blocked. Contact your administrator for more information*.

## Prerequisites

- IP firewall is a feature of Managed Environments. More information: [Managed Environments overview](managed-environment-overview.md)
- You must have a Power Platform admin role to enable or disable IP firewall.

## Enable IP firewall

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator.
1. Select **Environments**, and then open the environment you want.
1. Select **Settings** > **Product** > **Privacy + Security**.
1. Under **IP address settings**, set **Enable IP address based firewall rule** to **On**.
1. Under **Allowed list of IPv4 or IPv6 ranges**, specify the allowed IP ranges in classless inter-domain routing (CIDR) format. If you have multiple IP ranges, separate them using a comma. This field excepts alphanumeric characters with a maximum length of 4000 and allows a maximum of 200 IP ranges.
1. Choose additional settings as appropriate:

   - **Service tags to be allowed by IP firewall**: You can select a list of service tags from the drop-down list to bypass the IP firewall restrictions.
   - **Allow access for Microsoft trusted services**: Enabled by default. Enabling this setting allows access to the Power Platform environment with Dataverse for service tags `PowerPlatformInfra`, `GenevaSynthetics`, and `GenevaActions` and for internal first-party applications.
   - **Allow access for all application users**: Enabled by default. This setting allows all application users third-party and first-party access to Dataverse APIs.
   - **Enable IP firewall in audit only mode**: Enabled by default. This setting allows you to enable IP firewall where a request by a user is allowed regardless of their IP address.
   - **Reverse proxy IP addresses**: If your organization has reverse proxies configured, enter the IP addresses of one or more reverse proxy separated by comma. This reverse proxy settings apply to both IP-based cookie binding and IP firewall.

1. Select **Save**.

> [!IMPORTANT]
> When **Allow Access for Microsoft trusted services** and **Allow access for all application users** IP firewall settings are disabled, some services that use Dataverse might no longer work, such as Power Automate flows.

### Test IP firewall

Once enabled, you can test the IP firewall to verify that it's working.

1. Open the Power Platform environment URI that starts with `https://*environmentname*.crm*.dynamics.com` from an IP address, which isn't in the allow list of the IP addresses for the environment.

   Your request to access should be rejected with a message that says, "The request you are trying to make is rejected as access to your IP is blocked. Contact your administrator for more information".
   
1. Open the Power Platform environment URI that starts with `https://*environmentname*.crm*.dynamics.com` from an IP address, which is in the allowed list of IP address ranges.

   You'll have the appropriate access to the environment, as defined by your security role membership.

## Frequently asked questions (FAQ)

### What does IP firewall cover in Power Platform?

Currently, IP firewall is supported for any Power Platform environment that includes Dataverse. 

### How soon does a change to the IP address list take effect once it's made in the Power Platform admin center?

The change typically takes effect in about five minutes.

### Does this feature work in real time?

Yes, this feature works in real time. Since the feature works at the network layer, it evaluates the request even before the authentication flow begins.

### Is this feature enabled by default in all the environments?

No, the Power Platform administrator needs to explicitly enable the IP firewall feature for a given environment.

### What is audit-only mode?

Audit-only mode allows you to identify the IP addresses that are making calls to a Power Platform environment and helps you in configuring restrictions without breaking or blocking any users from the allow-listed IP ranges. We recommend that you enable audit-only mode for at least a week and after careful review of the audit logs, before you start the enforcement of IP firewall restrictions on a Power Platform environment.

### Is this feature available to all the environments?

No, it's available with Managed Environments only.

### Is there a limit in the number of IP addresses that I can add in the IP address text box? 

Yes, you can add 200 IP addresses separated by comma (,). 

### What should I do in case I am locked out due to incorrect configuration of IP addresses in IP firewall?

Contact Microsoft Customer Support to get the environment unlocked.

### How do I download the audit log for audit only mode? 

Download the audit log data in JSON format by using Dataverse OData API. The format of the audit log API is:

`https://{orgURI}/api/data/v9.1/audits?$select=createdon,changedata,action&$filter=action%20eq%20116&$orderby=createdon%20desc&$top=1` 

- Replace **{orgURI}** with the Dataverse environment URI.
- Set the action value to **116** for this event.
- Set the number of items to return in **top=1** or specifyc the number you want to return.

### My Power Automate flows are not working as expected after configuring the IP firewall on my Power Platform environment. What should I do?

You can allow the service tags in the IP firewall settings. Verify that you have allowed the related service tags listed the [Managed connectors outbound IP addresses](/connectors/common/outbound-ip-addresses) article.

## Next steps

[Security in Microsoft Dataverse](wp-security.md)
