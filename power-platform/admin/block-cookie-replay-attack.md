---
title: "Block cookie replay attacks in Dataverse (preview)| MicrosoftDocs"
description: Learn how to block the cookie replay attack in Dataverse.
ms.date: 08/25/2022
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

You can stop [cookie replay attacks](https://en.wikipedia.org/wiki/Session_hijacking) by binding the IP address of the computer with a cookie to block unauthorized access to Dataverse. You can apply this control when needed to help keep your organization secure. This vulnerability can only be exploited if the device is compromised or a man-in-the-middle attack happens, and the browser’s valid cookie is copied by a malicious user. This valid cookie can only be replayed until it [expires](user-session-management.md). For example, a user copies a valid browser cookie from one computer using publicly available tools and tries to replay the same cookie from a different computer using any publicly available tool. The cookie IP binding feature will evaluate the IP address of the cookie origin in real time and will prompt the user with a message if the IP address of the cookie origin is different than the IP address of request being made.

> [!IMPORTANT]
> Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Block the cookie replay attack in Dataverse 

IP-based cookie binding blocks the cookie replay attack from other computers or IP addresses. If a user copies the cookie from one computer and tries to replay the cookie from another computer, this feature will reject the cookie and will prompt the user with message as shown below.

:::image type="content" source="media/block-cookie-replay-user-message.png" alt-text="Cookie rejected and a message is displayed.":::

## How does IP address-based cookie binding work?

IP address-based cookie binding sets the IP address claim in the session cookie. Each request is evaluated to compare the current IP address with the cookie stored source IP address (when the cookie was initially created). If there's a mismatch in the current IP address and the cookie stored source IP address, access is denied to the user.

## How can I participate in this feature's public preview?

This feature is available to all environments across all tenants including sovereign clouds. By default, IP address-based cookie binding will be disabled. If you're planning to participate in the public preview of this feature, you need to enable this feature from the Power Platform admin center following the steps below.

## Steps to enable IP address-based cookie binding

1. Sign into the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) as an administrator. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Settings**.

4. Select **Product**, and then select **Privacy + Security**.

5. Under **IP address settings**, set **Enable IP address-based cookie binding (Preview)** to **On**.

6. Select **Save**.

## Scenarios where users will be asked to reauthenticate

- When any VPN client is turned on or off
- When connecting to a Wi-Fi hotspot
- When the internet connection gets reset due to a change from an internet service provider
- When a router is reset or restarted

## How to test this feature

1. Sign in to a Dynamics 365 organization. 
2. From the computer signed in to, copy a cookie using any of the client tools like Fiddler. 
3. Open [postman](https://www.postman.com/) tool from another device.
4. Fill in the required details along with the copied cookie.
5. Submit the request. An HTTP 401 code will be returned.

## Exclusions

If the user connects back via the same IP address and resubmits the old valid cookie, Dataverse will accept this cookie.

## FAQ

### Is this feature available in Dataverse?
Yes, cookie IP binding is available for the CrmOwinAuth cookie on Microsoft Dynamics 365 Unified Interface.

### How much time will it take to reflect the changes once it's made in the Power Platform admin center?
The changes typically reflect in about 5 minutes.

### Does this feature work in real-time?
Yes, this feature evaluates the cookie in real time except for the initial request being made after enabling this feature in the Power Platform admin center.

### Is this feature enabled by default in all environments?
No, this feature isn't enabled by default. Administrators should go to the Power Platform admin center and enable it.

### See also
[Get started with security roles in Dataverse](/learn/modules/get-started-security-roles/)





[!INCLUDE[footer-include](../includes/footer-banner.md)]

