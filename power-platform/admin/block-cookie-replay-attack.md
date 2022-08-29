---
title: Block cookie replay attacks in Dataverse (preview)
description: Learn how to use IP-based cookie binding to block session hijacking attacks in Dataverse.
ms.date: 08/26/2022
ms.topic: conceptual
author: ritesp
ms.reviewer: jimholtz
ms.author: ritesp
ms.subservice: admin
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Block cookie replay attacks in Dataverse (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Prevent session hijacking exploits in Dataverse with IP address-based cookie binding. Let's say that a malicious user copies a valid session cookie from an authorized computer that has cookie IP binding enabled. The user then tries to use the cookie on a different computer to gain unauthorized access to Dataverse. In real time, Dataverse compares the IP address of the cookie's origin against the IP address of the computer making the request. If the two are different, the attempt is blocked, and an error message is shown.

IP-based cookie binding is available in all environments across all tenants, including government clouds. The feature is disabled by default during the public preview. To participate in the public preview, enable the feature in the Power Platform admin center.

> [!IMPORTANT]
> Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Enable IP address-based cookie binding

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator.

1. Select **Environments**, and then select an environment.

1. Select **Settings** > **Product**, and then select **Privacy + Security**.

1. Under **IP address settings**, select **Enable IP address-based cookie binding (Preview)**.

1. Select **Save**.

## How does IP address-based cookie binding work?

IP-based cookie binding sets the IP address claim in the session cookie. Each request is evaluated to compare the current IP address with the source IP address that was stored in the cookie when it was created. If the addresses don't match, the user is denied access.

## Scenarios in which users will be asked to reauthenticate

- When any VPN client is turned on or off
- When connecting to a wireless hotspot
- When the Internet connection is reset by the Internet service provider
- When a router is reset or restarted

## How to test the feature

1. Sign in to a Dynamics 365 environment that has IP-based cooking binding enabled.
1. Use a client tool such as Fiddler to copy the session cookie.
1. On a different computer, open [Postman](https://www.postman.com/).
1. Fill in the required details along with the copied cookie.
1. Submit the request. An HTTP 401 code should be returned.

## Exclusions

If the user connects to Dataverse from the same IP address with the old, valid cookie, Dataverse will accept the cookie.

## FAQ

### Is this feature available in Dataverse?

Cookie IP binding is available for the `CrmOwinAuth` cookie in Microsoft Dynamics 365 Unified Interface.

### How soon does the change take effect once it's made in the Power Platform admin center?

The change typically takes effect in about five minutes.

### Does this feature work in real time?

The feature evaluates the cookie in real time, except for the initial request that's made after the feature is enabled.

### Is this feature enabled by default in all environments?

The cookie IP binding feature is disabled by default. Administrators must enable it in the Power Platform admin center.

### See also

[Get started with security roles in Dataverse](/learn/modules/get-started-security-roles/)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
