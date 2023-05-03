---
title: IP firewall in Power Platform environments
description: Learn about how to use IP firewall in Power Platform environments.
author: Mattp123
ms.author: matp
ms.topic: overview
ms.date: 05/03/2023 format.
ms.custom: template-overview
---
# IP firewall in Power Platform environments

Limit access to users with IP firewall by IP location to reduce unauthorized access. By using the IP firewall feature, you can apply the right access controls when needed to help keep your organization's data secure and out of your users' way when not needed. IP firewall analyses and enforces the IP address of each request in real time. 

For example, consider when the IP firewall is turned on in your production Microsoft Dataverse environment, and IP ranges are set with the IP address of your office location. Then, when a user tries to access the resources from another location, such as a coffee shop, Dataverse denies access to Power Platform resources in real time.

## Key benefits

- Helps mitigate insider threats like data exfiltration in real time. A malicious user who tries to download data from Dataverse using any of the client tools like Excel, Power BI, and so on is blocked from downloading the data from IP location, which is not allowed by the Power Platform environment.
- Helps prevent token replay attacks from outside configured IP ranges. If a user steals a token and tries to use it to access the Dataverse from outside configured IP ranges, the access is denied by Dataverse in real time.
- It works for both interactive and non-interactive scenarios.

## How does IP Firewall work?

When a request is made to Dataverse, the request IP address is evaluated in real time against the IP ranges configured for the Power Platform environment. If the IP address is from the IP ranges configured for the Power Platform environment, the request is allowed, otherwise the request is rejected by the IP firewall with error message: *The request you are trying to make is rejected as access to your IP is blocked. Contact your administrator for more information*.

## Enable IP firewall

1. Sign in to the Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator as a Power Platform administrator.
1. Select **Environments**, and then open the environment you want.
1. Select **Settings** > **Product** > **Privacy + Security**.
1. Under **IP address settings**, set **Enable IP address based firewall rule** to **On**.
1. Under **Allowed list of IPv4 or IPv6 ranges**, specify the allowed IP ranges in classless inter-domain routing (CIDR) format. If you have multiple IP ranges, separate them using a comma (,).
1. Select **Save**.
 
### Test IP firewall

One enabled, you can test the IP firewall to verify it is working.

1. Open the Power Platform environment URI that starts with https://*environmentname*.crm*.dynamics.com from an IP address, which isn't in the allow list of the IP addresses for the environment.
   Your request to access will be rejected with a message "The request you are trying to make is rejected as access to your IP is blocked. Contact your administrator for more information".
1. Open the Power Platform environment URI that starts with https://*environmentname*.crm*.dynamics.com from an IP address, which is in the allowed list of IP address ranges.
   You'll have the appropriate access to the environment, as defined by your security role membership.

## Next steps

[Security in Microsoft Dataverse](wp-security.md)
