---
title: "Power Platform security FAQs | MicrosoftDocs"
description: Provides information about the security concepts in Microsoft Dataverse.
ms.date: 12/08/2020
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
  - "intro-internal"
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Power Platform security FAQs

The following questions are common security questions and answers for Power Platform Security. These are categorized into 2 sections.
  - The first section covers Top 10 OWASP Risks and how Power platform has been designed to help mitigate those risks.
  - The second section covers some of the common security questions that have been raised by customers in the past. These are organized based on when they were added to this white paper, to facilitate your ability to quickly find new questions and answers when this paper is updated. The newest questions are added to the end of this list.

# OWASP Top 10 Risks - Mitigations in Power Platform
  The Open Web Application Security Project® ([OWASP](https://owasp.org/about/)) is a nonprofit foundation that works to improve the security of software. Through community-led open-source software projects, hundreds of local chapters worldwide, tens of thousands of members, and leading educational and training conferences, the OWASP Foundation is the source for developers and technologists to secure the web.

  The [OWASP Top 10](https://owasp.org/www-project-top-ten/) is a standard awareness document for developers and web application security. It represents a broad consensus about the most critical security risks to web applications.

  [A01:2021-Broken Access Control](https://owasp.org/Top10/A01_2021-Broken_Access_Control/):
  - To be updated

  [A02:2021-Cryptographic Failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/):
  - Encryption of data in transit - Power Platform uses TLS to encrypt all HTTP-based network traffic. It uses other mechanisms to encrypt non-HTTP network traffic that contains customer or confidential data (IPSec, SMTP, SQL).
  - Using a hardened TLS configuration - Uses only TLS 1.2 or above. Uses ECDHE-based ciphers suites and NIST curves. Uses strong keys. Enables HTTP Strict Transport Security (HSTS). *To be validated* Turns off TLS compression and does not use ticket-bassed session resumption.
  - Encryption of data at rest - All customer data will be encrypted before being written to non-volatile storage media.
  

  [A03:2021-Injection](https://owasp.org/Top10/A03_2021-Injection/):
  - To be updated

  [A04:2021–Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/):
  - Power Platform has been built on a culture and methodology of Secure Design which gets constantly reinforced through Microsoft's industry leading [SDL](https://www.microsoft.com/en-us/securityengineering/sdl/practices) practices of [Threat Modeling](https://www.microsoft.com/en-us/securityengineering/sdl/threatmodeling).
  - The robust Threat Modeling review process ensures that Power Platform identifies the threats during design phase, tracks them, mitigates them, and validates to make sure that the threats have been mitigated.
  - The process also accounts for all new changes to the services that are already live, through regular reviews so that this is a continuous process that helps to address most common insecure design issues by relying on [STRIDE](https://docs.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats#stride-model) model.
  - Microsoft's SDL is equivalent of OWASP Software Assurance Maturity Model ([SAMM](https://owaspsamm.org/)) with both of them built on the premise that Secure Design is integral to web application security.

  [A05:2021-Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/):
  - To be updated

  [A06:2021-Vulnerable and Outdated Components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/):
  - Power Platform follows Microsoft's industry leading [SDL](https://www.microsoft.com/en-us/securityengineering/sdl/practices) practices to manage open-source and third-party components. As part of this process, the [Tools and Techniques](https://www.microsoft.com/en-us/securityengineering/opensource/?activetab=security+analysis%3aprimaryr3) involve maintaining complete inventory, performing security analysis, keeping the components up to date, and aligning them with a tested and tried security incident response process.
  - In some rare cases, the process takes time due to external dependencies which is why there will still be some copies of outdated components in some applications. However, as per above process, those will be tracked, and updated once dependencies have been addressed.

  [A07:2021-Identification and Authentication Failures](https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/):
  - To be updated
  - Focus on AAD

  [A08:2021-Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/):
  - Power Platform's Component Governance process ensures that software integrity is maintained by enforcing package source files are securely configured.
  - The process ensurres that it will only serve internally-sourced packages to address [substitution attack](https://azure.microsoft.com/en-us/resources/3-ways-to-mitigate-risk-using-private-package-feeds/) which is a technique aka dependency confusion that can be used to poison the app-building process inside secure enterprise environments.
  - All encrypted data has integrity protection applied before it is transmitted, and all the integrity protection metadata present for incoming encrypted data will be validated. *To be validated*

  [A09:2021-Security Logging and Monitoring Failures](https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/):
  - To be updated
  - Focus on Azure Security logging features and Incident response

  [A10:2021-Server-Side Request Forgery](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/):
  - To be updated
  - Focus on Azure Security capabilities 

  # Common Security questions from customers
  The below are some of the common security questions that customers have raised in the past. We are capturing them here along with useful information that helps to answer their questions.

  **How does Power Platform help protect against [Clickjacking](https://owasp.org/www-community/attacks/Clickjacking) risks?**
  - To be updated
  
  **How does Power Platform help protect against Cross-Site Scripting ([XSS](https://owasp.org/www-community/attacks/Clickjacking)) risks?**
  - To be updated

  **How does Power Platform help protect against Cross Site Request Forgery ([CSRF](https://owasp.org/www-community/attacks/csrf)) risks?**
  - To be updated
  
  **Does Power Platform support Content Security Policy ([CSP](https://owasp.org/www-community/controls/Content_Security_Policy))?**
  - There are various directives that can be configured as part of CSP. Currently only the [frame-ancestors](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) directive is supported by UCI/CRM as documented in the [Developer Reference](https://docs.microsoft.com/en-us/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfiguration). 
  - Supporting CSP is an extremely important priority for Power Platform. There will be more updates coming up in future roadmap regarding CSP support like below:
    - Full blog post on how to implement CSP for UCI
    - Supporting all available CSP directives
    - Same CSP support for Canvas applications as well

  **How can we connect to SQL Server securely?**
  - The best practices for securely connecting to external data sources has been documented [here](https://powerapps.microsoft.com/en-us/blog/best-security-practices-for-power-apps/).

  **What Ciphers are supported by Power Platform? What's the roadmap of continuously moving towards stronger Ciphers?**
  - All Microsoft services and products are configured to use the approved cipher suites, in the exact order as mentioned by Microsoft Crypto Board. The exact list and order can be found in [Power Platform documentation](https://docs.microsoft.com/en-us/power-platform/admin/server-cipher-tls-requirements).
  - Any changes related to deprecations of cipher suites will be communicated through Power Platform's [Important Changes](https://docs.microsoft.com/en-us/power-platform/important-changes-coming#tls-rsa-cipher-suites-are-deprecated) documentation.

  **Why does Power Platform still support RSA-CBC ciphers (TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xC027) and TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xC028)) which are considered weaker?**
  - Microsoft weighs in the relative risk and customer disruption in choosing the support of cipher suites. Since these cipher suites are not broken yet, to ensure consistency across all services, and products, and also to support all customer configurations, these were enabled. However, these are at the bottom of the priority list. These will be deprecated at the right time and Microsoft's Crypto Board makes continuous assessement time-to-time.

  **How does Power Platform protect against Distributed Denial of Service ([DDoS](https://owasp.org/www-project-automated-threats-to-web-applications/assets/oats/EN/OAT-015_Denial_of_Service.html)) attacks?**
  - Power Platform is built on top of Microsoft Azure. As such, Power Platform leverages [Azure DDoS Protection](https://docs.microsoft.com/en-us/azure/ddos-protection/ddos-protection-standard-features) to guard against Distributed Denial of Service (DDoS) attacks.
  
  **Does Power Platform detect jailbroken iOS devices and rooted Android devices to help with protecting organizational data?**
  - The recommendation is to use Microsoft Intune, a Mobile Device Management (MDM) solution which can help protect organizational data by requiring users and devices to meet some requirements. For more details, please see Intune's [Compliance Policy settings](https://docs.microsoft.com/en-us/mem/intune/protect/device-compliance-get-started#compliance-policy-settings).

  **Why are the session cookies scoped to parent domain?**
  - This is to allow Auth across Orgs. The subdomains aren't used as security boundaries and also don't host customer contents.

  **How can we set the application session to timeout after, say, 15 minutes?**
  - Power Platform uses Azure Active Directory (AAD) for Identity and Access Management (IAM). Power Platform follows AAD's [recommended configuration](https://docs.microsoft.com/en-us/azure/active-directory/develop/access-tokens#access-token-lifetime) for session management for optimal user experience. Together with upcoming AAD's Continuous Access Evaluation (CAE), the experience will be secure, reliable, and performant for end users.

  **The application allows the same user to access from more than one machine/browser at the same time. How can we prevent that?**
  - Accessing the application from more than one machine/browser at the same time is a convenience. However, the access needs to be continuously evaluated to ensure that the access is from legitimate source and still valid.
  - Azure Active Directory (AAD) has rolled out Continuous Access Evaluation ([CAE](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-continuous-access-evaluation)) feature which will be coming to Power Platform to help with the above.


  ****
  - To be updated





### See also
[Add related articles]


