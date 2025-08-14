---
title: "Server cipher suites and TLS requirements  | MicrosoftDocs"
description: Configure your servers to meet TLS 1.3/1.2 requirements with the latest cipher suites to use Dataverse services securely.
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: concept-article
ms.date: 12/02/2024
contributors:
    - ColeHarrison-Microsoft 
search.audienceType: 
  - admin
---
# Server cipher suites and TLS requirements

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

A [cipher suite](/windows/win32/secauthn/cipher-suites-in-schannel) is a set of cryptographic algorithms. This is used to encrypt messages between clients/servers and other servers. Dataverse is using the latest **TLS 1.3 & 1.2 cipher suites as approved by Microsoft Crypto Board.** 

Before a secure connection is established, the protocol and cipher are negotiated between server and client based on availability on both sides. 

You can use your on-premises/local servers to integrate with the following Dataverse services:
1. Syncing emails from your Exchange server.
2. Running Outbound plug-ins.
3. Running native/local clients to access your environments.

To comply with our security policy for a secure connection, your server must have the following: 

1. Transport Layer Security (TLS) 1.3/1.2 compliance

1. At least one of the following ciphers: 

    - TLS 1.3 ciphers:
       - TLS_AES_256_GCM_SHA384
       - TLS_AES_128_GCM_SHA256

    - TLS 1.2 ciphers:
       - TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
       - TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
       - TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
       - TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
       - TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
       - TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384
       - TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
       - TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384


   > [!IMPORTANT]
   > Older TLS 1.0 & 1.1 and cipher suites, (for example TLS_RSA) have been deprecated; see the [announcement](../important-changes-coming.md#tls-rsa-cipher-suites-are-deprecated).
   > Your servers must have the above security protocol to continue running the Dataverse services.
   > 
   > **TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 and TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384** may show up as weak when you performed an SSL report test. This is due to known attacks toward OpenSSL implementation. Dataverse uses Windows implementation that is not based on OpenSSL and therefore is not vulnerable. 

   You may either upgrade the [Windows version](/windows/win32/secauthn/cipher-suites-in-schannel) or update the [Windows TLS registry](/windows-server/security/tls/tls-registry-settings) to make sure that your server endpoint supports one of these ciphers.

   To verify that your server complies with the security protocol, you can perform a test using a TLS cipher and scanner tool:
   1. Test your hostname using [SSLLABS](https://www.ssllabs.com/ssltest/analyze.html), or
   2. Scan your server using [NMAP](https://nmap.org/)

1. The following Root CA Certificates installed. Install only those that correspond to your cloud environment.

   **For Public/PROD**

   |Certificate Authority  |Expiry date  |Serial Number/Thumbprint  |Download  |
   |---------|---------|---------|---------|
   |DigiCert Global Root G2     | Jan 15 2038        | 0x033af1e6a711a9a0bb2864b11d09fae5<br />DF3C24F9BFD666761B268073FE06D1CC8D4F82A4  |  [PEM](https://crt.sh/?d=8656329)       |
   |DigiCert Global Root G3     |  Jan 15, 2038       |  0x055556bcf25ea43535c3a40fd5ab4572<br />7E04DE896A3E666D00E687D33FFAD93BE83D349E    | [PEM](https://crt.sh/?d=8568700)        |
   |Microsoft ECC Root Certificate Authority 2017     | Jul 18, 2042        | 0x66f23daf87de8bb14aea0c573101c2ec<br />999A64C37FF47D9FAB95F14769891460EEC4C3C5     | [PEM](https://crt.sh/?d=2565145421)   |
   |Microsoft RSA Root Certificate Authority 2017   |  Jul 18, 2042       | 0x1ed397095fd8b4b347701eaabe7f45b3<br />3A5E64A3BFF8316FF0EDCCC618A906E4EAE4D74     | [PEM](https://crt.sh/?d=2565151295)     |


   **For Fairfax/Arlington/US Gov Cloud**

   |Certificate Authority  |Expiry date  |Serial Number/Thumbprint  |Download  |
   |---------|---------|---------|---------|
   |DigiCert Global Root CA     | Nov 10, 2031      | 0x083be056904246b1a1756ac95991c74a<br />A8985D3A65E5E5C4B2D7D66D40C6DD2FB19C5436  |  [PEM](https://crt.sh/?d=853428)   |
   |DigiCert SHA2 Secure Server CA     |  Sep 22, 2030       |  0x02742eaa17ca8e21c717bb1ffcfd0ca0<br />626D44E704D1CEABE3BF0D53397464AC8080142C  | [PEM](https://crt.sh/?d=3422153451)   |
   |DigiCert TLS Hybrid ECC SHA384 2020 CA1    | Sep 22, 2030        | 0x0a275fe704d6eecb23d5cd5b4b1a4e04<br />51E39A8BDB08878C52D6186588A0FA266A69CF28 | [PEM](https://crt.sh/?d=3422153452)   |

   **For Mooncake/Gallatin/China Gov Cloud**

   |Certificate Authority  |Expiry date  |Serial Number/Thumbprint  |Download  |
   |---------|---------|---------|---------|
   |DigiCert Global Root CA     | Nov 10, 2031  | 0x083be056904246b1a1756ac95991c74a<br />A8985D3A65E5E5C4B2D7D66D40C6DD2FB19C5436 |  [PEM](https://crt.sh/?d=853428)   |
   |DigiCert Basic RSA CN CA G2     |  Mar 4, 2030       |  0x02f7e1f982bad009aff47dc95741b2f6<br />4D1FA5D1FB1AC3917C08E43F65015E6AEA571179  | [PEM](https://crt.sh/?d=2545289014)   |

   **Why is this need?**

   See [The Transport Layer Security (TLS) Protocol Version 1.3](https://datatracker.ietf.org/doc/draft-ietf-tls-rfc8446bis/) and
    [TLS 1.2 Standards Documentation - Section 7.4.2](https://datatracker.ietf.org/doc/html/rfc5246#section-7.4.2) - certificate-list.

## Why do Dataverse SSL/TLS certificates use wildcard domains?

Wildcard SSL/TLS certificates are by design since hundreds of organization URLs must be accessible from each host server. SSL/TLS certificates with hundreds of Subject Alternate Names (SANs) have a negative impact on some web clients and browsers. This is an infrastructure constraint based on the nature of a software as a service (SAAS) offering, which hosts multiple customer organizations on a set of shared infrastructure.

### See also
[Connect to Exchange Server (on-premises)](connect-exchange-server-on-premises.md) <br />
[Dynamics 365 Server-side sync](/powerapps/developer/common-data-service/server-side-synchronization-entities)  <br />
[Exchange server TLS guidance](https://techcommunity.microsoft.com/t5/exchange-team-blog/exchange-server-tls-guidance-part-1-getting-ready-for-tls-1-2/ba-p/607649) <br />
[Cipher Suites in TLS/SSL (Schannel SSP)](/windows/win32/secauthn/cipher-suites-in-schannel)  <br />
[Manage Transport Layer Security (TLS)](/windows-server/security/tls/manage-tls)  <br />
[IETF Datatracker](https://datatracker.ietf.org/) for TLS standards. <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
