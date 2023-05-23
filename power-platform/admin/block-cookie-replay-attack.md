---
title: Block cookie replay attacks in Dataverse
description: Learn how to use IP-based cookie binding to block session hijacking attacks in Dataverse.
ms.date: 05/17/2023
ms.topic: conceptual
author: ritesp
ms.reviewer: sericks
ms.author: ritesp
ms.subservice: admin
search.audienceType: 
  - admin
---
# Block cookie replay attacks in Dataverse

Prevent session hijacking exploits in Dataverse with IP address-based cookie binding. Let's say that a malicious user copies a valid session cookie from an authorized computer that has cookie IP binding enabled. The user then tries to use the cookie on a different computer to gain unauthorized access to Dataverse. In real time, Dataverse compares the IP address of the cookie's origin against the IP address of the computer making the request. If the two are different, the attempt is blocked, and an error message is shown.

IP-based cookie binding is available only for [Managed Environments](managed-environment-licensing.md) across all tenants, including government clouds. You can enable this feature in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).


## Enable IP address-based cookie binding

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator.

1. Select **Environments**, and then select an environment.

1. Select **Settings** > **Product**, and then select **Privacy + Security**.

1. Under **IP address settings**, select **Enable IP address-based cookie binding**.

1. Select **Save**.

## How does IP address-based cookie binding work?

IP-based cookie binding sets the IP address claim in the session cookie. Each request is evaluated to compare the current IP address with the source IP address that was stored in the cookie when it was created. If the addresses don't match, the user is denied access.

## Scenarios in which users will be asked to reauthenticate

- When any VPN client is turned on or off
- When connecting to a wireless hotspot
- When the Internet connection is reset by the Internet service provider
- When a router is reset or restarted

## How to test the feature

1. Clear all the cookies from the browser. This step is important to ensure that a new cookie is generated.

2. Sign in to a Dynamics 365 environment that has IP-based cooking binding enabled.

3. Use a client tool such as Fiddler to copy the session cookie.

4. On a different computer (not in the same network), open [Postman](https://www.postman.com/).

5. Fill in the required details along with the copied cookie.

6. Submit the request. An HTTP 403 code should be returned.

## Exclusions

- If the user connects to Dataverse from the same IP address with the old, valid cookie, Dataverse will accept the cookie.
- If the traffic between your network and Power Platform is configured to use reverse proxy having dynamic IP address, IP-based cookie binding won't work.

## FAQ 

### Is this feature available in Dataverse?

Cookie IP binding is available for the `CrmOwinAuth` cookie in Unified Interface.

### How soon does the change take effect once it's made in the Power Platform admin center?

The change typically takes effect in about five minutes.

### Does this feature work in real time?

The feature evaluates the cookie in real time, except for the initial request that's made after the feature is enabled.

### Is this feature enabled by default in all environments?

The cookie IP binding feature is disabled by default. Administrators must enable it in the Power Platform admin center.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
