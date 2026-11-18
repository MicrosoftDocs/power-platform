---
title: Safeguarding Dataverse sessions with IP cookie binding
description: Discover methods for using IP-based cookie binding to stop cookie replay, ensuring secure sessions in Dataverse against unauthorized access by internet service providers.
ms.date: 11/17/2026
ms.topic: how-to
author: monis-azaroth
ms.reviewer: ellenwehrle
ms.author: mohdmonis
ms.subservice: admin
ai-usage: ai-assisted
search.audienceType: 
  - admin
---

# Safeguard Dataverse sessions with IP cookie binding

Prevent session hijacking exploits in Dataverse with IP address-based cookie binding. If a malicious user copies a valid session cookie from an authorized computer that has cookie IP binding enabled, the user can't use the cookie on a different computer to gain unauthorized access to Dataverse. Dataverse compares the IP address of the cookie's origin against the IP address of the computer making the request. If the two are different, Dataverse blocks the request and shows an error message.

IP-based cookie binding is available only for [managed environments](managed-environment-licensing.md) across all tenants, including government clouds. You can enable this feature in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

## Enable IP address-based cookie binding

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. Select **Settings** > **Product** > **Privacy + Security**.
1. Under **IP address settings**, select the **Enable IP address based cookie binding** option.
1. **(Optional)**: If your organization has reverse proxies configured, enter the IP addresses separated by commas in the **Reverse proxy IP addresses** field. The reverse proxy setting applies to both IP-based cookie binding and the [IP firewall](ip-firewall.md). Contact your network administrator to get the reverse proxy IP addresses.

     > [!NOTE]
     > Reverse proxy must be configured to send user client IP addresses in the [forwarded](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Forwarded) header.
     
1.  Select **Save**.

## Turn on cookie binding for an environment 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an administrator.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. Select **Settings** in the command bar. The **Settings** page is displayed.
1. Select **Product** > **Privacy + Security**.
1. Find the **IP address settings** heading.
1. Turn the **Enable IP address-based cookie binding** setting to **On**.
1. Select **Save** to save your changes.

## How cookie binding uses your IP address to work

IP-based cookie binding sets the IP address claim in the session cookie. Each request is evaluated to compare the current IP address with the source IP address that was stored in the cookie when it was created. If the addresses don't match, the user is denied access.

## Scenarios in which users are asked to reauthenticate

- When any VPN client is turned on or off
- When connecting to a wireless hotspot
- When the Internet connection is reset by the Internet service provider
- When a router is reset or restarted
- Changes to the user's network or IP address during an active session can require reauthentication if the observed source IP address changes.

## How to test the feature

1. Clear all the cookies from the browser. This step is important to ensure that a new cookie is generated.
1. Sign in to a Dynamics 365 environment that has IP-based cookie binding enabled.
1. Use a client tool such as Fiddler to copy the session cookie.
1. Submit a request from an alternate computer (outside of the original network) by using the previously obtained session cookie. You should receive an HTTP 403 error in response.

## Exclusions

- If the user connects to Dataverse from the same IP address with the old, valid cookie, Dataverse accepts the cookie.
- If you configure the traffic between your network and Power Platform to use a reverse proxy with a dynamic IP address, IP-based cookie binding doesn't work.

## FAQ

### Is this feature available in Dataverse?

Cookie IP binding is available for the `CrmOwinAuth` cookie in Unified Interface.

### How soon does the change take effect once it's made in the Power Platform admin center?

The change typically takes effect in about five minutes.

### Does this feature work in real time?

The feature evaluates the cookie in real time, except for the initial request that's made after the feature is enabled.

### Is this feature enabled by default in all environments?

The cookie IP binding feature is disabled by default. Administrators must enable it in the Power Platform admin center.
