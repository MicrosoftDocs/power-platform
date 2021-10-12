---
title: "Server cipher suites and TLS requirements  | MicrosoftDocs"
description: Power Platform settings
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/04/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Server cipher suites and TLS requirements

A [cipher suite](/windows/win32/secauthn/cipher-suites-in-schannel) is a set of cryptographic algorithms. This is used to encrypt messages between clients/servers and other servers.  

Before a secure connection is established, the protocol and cipher are negotiated between server and client based on availability on both sides. 

You can use your on-premises/local servers to integrate with the following Dataverse services:
1. Syncing emails from your Exchange server.
2. Running Outbound plug-ins.
3. Running native/local clients to access your Dataverse environments.

To comply with our security policy for a secure connection, your server must have the following: 

1. Transport Layer Security (TLS) 1.2 compliance
2. At least one of the following ciphers: 

   TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 <br />
   TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 <br />
   TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 <br />
   TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 <br />
   TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 <br />
   TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 <br />
   TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 <br />
   TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384

> [!IMPORTANT]
> Older TLS 1.0 & 1.1 and cipher suites, (for example TLS_RSA) have been deprecated; see the [announcement](../important-changes-coming.md#tls-rsa-cipher-suites-are-deprecated).
> 
> Your servers must have the above security protocol to continue running the Dataverse services.

You may either upgrade the [Windows version](/windows/win32/secauthn/cipher-suites-in-schannel) or update the [Windows TLS registry](/windows-server/security/tls/tls-registry-settings) to make sure that your server endpoint supports one of these ciphers.

To verify that your server complies with the security protocol, you can perform a test using a TLS cipher and scanner tool:
1. Test your hostname using [SSLLABS](https://www.ssllabs.com/ssltest/analyze.html), or
2. Scan your server using [NMAP](https://nmap.org/)

### See also
[Connect to Exchange Server (on-premises)](connect-exchange-server-on-premises.md) <br />
[Dynamics 365 Server-side sync](/powerapps/developer/common-data-service/server-side-synchronization-entities)  <br />
[Exchange server TLS guidance](https://techcommunity.microsoft.com/t5/exchange-team-blog/exchange-server-tls-guidance-part-1-getting-ready-for-tls-1-2/ba-p/607649) <br />
[Cipher Suites in TLS/SSL (Schannel SSP)](/windows/win32/secauthn/cipher-suites-in-schannel)  <br />
[Manage Transport Layer Security (TLS)](/windows-server/security/tls/manage-tls)  <br />
[How to enable TLS 1.2](/mem/configmgr/core/plan-design/security/enable-tls-1-2)  



[!INCLUDE[footer-include](../includes/footer-banner.md)]