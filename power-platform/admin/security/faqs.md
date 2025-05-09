---
title: Power Platform security FAQs
description: Get answers to common questions about Power Platform security.
ms.date: 04/11/2024
ms.service: power-platform
ms.topic: faq
ms.custom: 
  - "admin-security"
author: lancedMicrosoft
ms.subservice: admin
ms.author: lanced
ms.reviewer: sericks
ms.contributors: JesseParsons
search.audienceType: 
  - admin
---
# Power Platform security FAQs

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Commonly asked questions about Power Platform security fall into two categories:

- How Power Platform has been designed to help mitigate the top 10 Open Web Application Security Project® (OWASP) risks

- Questions our customers ask

To make it easier for you to find the latest information, new questions are added at the end of this article.

## OWASP top 10 risks: Mitigations in Power Platform

The Open Web Application Security Project® ([OWASP](https://owasp.org/about/)) is a nonprofit foundation that works to improve software security. Through community-led open-source software projects, hundreds of chapters worldwide, tens of thousands of members, and leading educational and training conferences, the OWASP Foundation is the source for developers and technologists to secure the web.

The [OWASP top 10](https://owasp.org/www-project-top-ten/) is a standard awareness document for developers and others who are interested in web application security. It represents a broad consensus about the most critical security risks to web applications. In this section, we'll discuss how Power Platform helps to mitigate these risks.

[A01:2021 Broken Access Control](https://owasp.org/Top10/A01_2021-Broken_Access_Control/)

- The Power Platform security model is built on Least Privileged Access (LPA). LPA enables customers to build applications with more granular access control.
- Power Platform uses Microsoft Entra ID's (Microsoft Entra ID) [Microsoft Identity Platform](/azure/active-directory/develop/v2-overview) for authorization of all API calls with the industry-standard OAuth 2.0 protocol.  
- Dataverse, which provides the underlying data for Power Platform, has a rich security model that includes environment-level, role-based, and record- and field-level security.

[A02:2021 Cryptographic Failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/)  

Data in transit:

- Power Platform uses TLS to encrypt all HTTP-based network traffic. It uses other mechanisms to encrypt non-HTTP network traffic that contains customer or confidential data.
- Power Platform employs a hardened TLS configuration that enables HTTP Strict Transport Security (HSTS):
  - TLS 1.2 or above
  - ECDHE-based ciphers suites and NIST curves
  - Strong keys

Data at rest:

- All customer data is encrypted before being written to non-volatile storage media.

[A03:2021 Injection](https://owasp.org/Top10/A03_2021-Injection/)

Power Platform uses industry-standard best practices to prevent injection attacks, including:

- Using safe APIs with parameterized interfaces
- Applying the ever-evolving capabilities of front-end frameworks to sanitize input
- Sanitizing the output with server-side validation
- Using static analysis tools during build time
- Reviewing the Threat Model of every service every six months whether the code, design, or infrastructure has been updated or not

[A04:2021 Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/)

- Power Platform is built on a culture and methodology of secure design. Both culture and methodology are constantly reinforced through Microsoft's industry-leading [Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl/practices) (SDL) and [Threat Modeling](https://www.microsoft.com/securityengineering/sdl/threatmodeling) practices.
- The Threat Modeling review process ensures that threats are identified during the design phase, mitigated, and validated to make sure they've been mitigated.
- Threat Modeling also accounts for all changes to services that are already live through continuous regular reviews. Relying on the [STRIDE model](/azure/security/develop/threat-modeling-tool-threats#stride-model) helps to address the most common issues with insecure design.
- Microsoft's SDL is equivalent to the [OWASP Software Assurance Maturity Model](https://owaspsamm.org/) (SAMM). Both are built on the premise that secure design is integral to web application security.

[A05:2021 Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)

- "Default Deny" is one of the foundations of Power Platform design principles. With "Default Deny," customers need to review and opt in to new features and configurations.
- Any misconfigurations during build time are caught by integrated security analysis using [Secure Development Tools](https://marketplace.visualstudio.com/items?itemName=securedevelopmentteam.vss-secure-development-tools).
- In addition, Power Platform undergoes [Dynamic Analysis Security Testing](https://www.microsoft.com/securityengineering/sdl/practices#practice10) (DAST) using an internal service that's built on OWASP Top 10 risks.

[A06:2021 Vulnerable and Outdated Components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/)

- Power Platform follows Microsoft's SDL practices to manage [open-source and third-party components](https://www.microsoft.com/securityengineering/opensource). These practices include maintaining complete inventory, performing security analyses, keeping the components up to date, and aligning the components with a tried and tested security incident response process.
- In rare cases, some applications may contain copies of outdated components because of external dependencies. However, after those dependencies have been addressed in accordance with the practices outlined earlier, the components are tracked and updated.

[A07:2021 Identification and Authentication Failures](https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/)

- Power Platform is built on and depends on Microsoft Entra ID identification and authentication.
- Microsoft Entra helps Power Platform to enable [secure features](https://azure.microsoft.com/services/active-directory/#features). These features include single sign-on, multi-factor authentication, and a single platform to engage with internal and external users more securely.
- With Power Platform's upcoming implementation of Microsoft Entra ID [Continuous Access Evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation) (CAE), user identification and authentication will be even more secure and reliable.

[A08:2021 Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/)

- Power Platform's Component Governance process enforces the secure configuration of package source files to maintain software integrity.
- The process ensures that only internally sourced packages are served to address [substitution attack](https://azure.microsoft.com/resources/3-ways-to-mitigate-risk-using-private-package-feeds/). Substitution attack, also known as dependency confusion, is a technique that can be used to poison the app-building process inside secure enterprise environments.
- All encrypted data has integrity protection applied before it's transmitted. All integrity protection metadata present for incoming encrypted data is validated.

## OWASP top 10 Low Code/No Code risks: Mitigations in Power Platform

For guidance on mitigating the top 10 Low Code/No Code security risks published by OWASP, see this document: 

[Power Platform - OWASP Low Code No Code Top 10 Risks (April 2024)](https://servicetrust.microsoft.com/DocumentPage/23c411ed-71e7-46eb-a6fd-0cf89a9117f3)

## Common security questions from customers

Following are some of the security questions our customers ask.

### How does Power Platform help to protect against clickjacking?

[Clickjacking](https://owasp.org/www-community/attacks/Clickjacking) uses embedded iframes, among other components, to hijack a user's interactions with a web page. It's a significant threat to sign-in pages in particular. Power Platform prevents the use of iframes on sign-in pages, significantly reducing the risk of clickjacking.

In addition, organizations can use [Content Security Policy](../content-security-policy.md) (CSP) to restrict embedding to trusted domains.

### Does Power Platform support Content Security Policy?

Power Platform supports [Content security policy](../content-security-policy.md) (CSP) for model-driven apps. We do not support the following headers which are replaced by CSP:
- `X-XSS-Protection`
- `X-Frame-Options`

### How can we connect to SQL Server securely?

See [Use Microsoft SQL Server securely with Power Apps](/powerapps/maker/canvas-apps/connections/sql-server-security).

### What ciphers are supported by Power Platform? What's the roadmap of continuously moving towards stronger ciphers?

All Microsoft services and products are configured to use the approved cipher suites, in the exact order directed by the Microsoft Crypto Board. For the full list and exact order, see the [Power Platform documentation](../server-cipher-tls-requirements.md). 

Information about deprecations of cipher suites is communicated through Power Platform's [Important Changes](../../important-changes-coming.md#tls-rsa-cipher-suites-are-deprecated) documentation. 

### Why does Power Platform still support RSA-CBC ciphers (TLS_ECDHE_RSA_with AES_128_CBC_SHA256 (0xC027) and TLS_ECDHE_RSA_with_AES_256_CBC_SHA384 (0xC028)), which are considered weaker?

Microsoft weighs the relative risk and disruption to customer operations in choosing cipher suites to support. The RSA-CBC cipher suites haven't been broken yet. We've enabled them to ensure consistency across our services and products, and to support all customer configurations. However, they're at the bottom of the priority list.

We'll deprecate these ciphers at the right time, based on the Microsoft Crypto Board's continuous assessment.

### Why does Power Automate expose MD5 content hashes in trigger/action inputs and outputs?

Power Automate passes the optional content-MD5 hash value returned by Azure Storage as-is to its clients. This hash is used by Azure Storage to verify the integrity of the page during transport as a checksum algorithm and it isn't used as a cryptographic hash function for security purposes in Power Automate. You can find more details of this in the Azure Storage documentation on how to [Get Blob Properties](/rest/api/storageservices/get-blob-properties#response) and how to work with [Request Headers](/rest/api/storageservices/put-page#request-headers).

### How does Power Platform protect against Distributed Denial of Service (DDoS) attacks?

Power Platform is built on Microsoft Azure and uses [Azure DDoS Protection](/azure/ddos-protection/ddos-protection-standard-features) to guard against [DDoS attacks](https://owasp.org/www-project-automated-threats-to-web-applications/assets/oats/EN/OAT-015_Denial_of_Service.html).

### Does Power Platform detect jailbroken iOS devices and rooted Android devices to help with protecting organizational data?

We recommend you use Microsoft Intune. Intune is a mobile device management solution. It can help protect organizational data by requiring users and devices to meet certain requirements. For more information, see [Intune's compliance policy settings](/mem/intune/protect/device-compliance-get-started#compliance-policy-settings).

### Why are session cookies scoped to the parent domain?

Power Platform scopes session cookies to the parent domain to allow authentication across organizations. Subdomains aren't used as security boundaries. They also don't host customer content.

### How can we set the application session to time out after, say, 15 minutes?

Power Platform uses Microsoft Entra ID identity and access management. It follows [Microsoft Entra ID's recommended session management configuration](/azure/active-directory/develop/access-tokens#access-token-lifetime) for an optimal user experience.

However, you can customize environments to have explicit session and/or activity timeouts.  For more information, see [User session and access management](../user-session-management.md).  

With Power Platform's upcoming implementation of Microsoft Entra ID [Continuous Access Evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation), user identification and authentication will be even more secure and reliable.

### The application allows the same user to access from more than one machine or browser at the same time. How can we prevent that?

Accessing the application from more than one device or browser at the same time is a convenience for users. Power Platform's upcoming implementation of Microsoft Entra ID [Continuous Access Evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation) will help to ensure that access is from authorized devices and browsers and is still valid.

### Why do some Power Platform services expose server headers with verbose information?

Power Platform services have been working to remove unnecessary information in the server header. The goal is to balance the level of detail with the risk of [exposing information](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Server) that might weaken the overall security posture.

### How do Log4j vulnerabilities impact Power Platform? What should customers do in this regard?

Microsoft has assessed that no Log4j vulnerabilities impact Power Platform. See our blog post on [preventing, detecting, and hunting for exploitation of Log4j vulnerabilities](https://www.microsoft.com/security/blog/2021/12/11/guidance-for-preventing-detecting-and-hunting-for-cve-2021-44228-log4j-2-exploitation/).

### How can we ensure there are no unauthorized transactions due to browser extensions or Unified Interface Client APIs allowing disabled controls to be enabled?

The Power Apps security model doesn't include the concept of disabled controls. Disabling controls is a UI enhancement. You shouldn't rely on disabled controls to provide security. Instead, use Dataverse controls such as field-level security to prevent unauthorized transactions.

### Which HTTP security headers are used to protect response data?

| Name | Details |
| ---- | ------- |
| [Strict-Transport-Security](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security) | This is set to `max-age=31536000; includeSubDomains` on all responses. |
| [X-Frame-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options) | This is deprecated in favor of CSP. |
| [X-Content-Type-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options) | This is set to `nosniff` on all asset responses. |
| [Content-Security-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) | This is set if user [enables CSP](/power-platform/admin/content-security-policy). |
| [X-XSS-Protection](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection) | This is deprecated in favor of CSP. |

### Where can I find Power Platform or Dynamics 365 penetration tests?

The latest penetration tests and security assessments can be found on the [Microsoft Service Trust Portal](https://servicetrust.microsoft.com/viewpage/PenTest). 

> [!NOTE]
> To access some of the resources on the Service Trust Portal, you must sign in as an authenticated user with your Microsoft cloud services account (Microsoft Entra organization account) and review and accept the Microsoft non-disclosure agreement for compliance materials.

### Related articles

[Security in Microsoft Power Platform](overview.md)  
[Authenticating to Power Platform services](authenticate-services.md)  
[Connecting and authenticating to data sources](connect-data-sources.md)  
[Data storage in Power Platform](data-storage.md)  

### See also

- [Microsoft Identity Platform](/azure/active-directory/develop/v2-overview)  
- [Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl/practices)  
- [Threat Modeling](https://www.microsoft.com/securityengineering/sdl/threatmodeling)  
- [Microsoft Entra Continuous Access Evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation)  
- [Content Security Policy](../content-security-policy.md) 
- [Azure DDoS Protection](/azure/ddos-protection/ddos-protection-standard-features)  
- [Intune's compliance policy settings](/mem/intune/protect/device-compliance-get-started#compliance-policy-settings)
