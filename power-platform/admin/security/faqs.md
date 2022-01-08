---
title: "Power Platform security FAQs | MicrosoftDocs"
description: Provides information about the security concepts in Microsoft Dataverse.
ms.date: 01/10/2022
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
  - "intro-internal"
author: RajSesMicrosoft
ms.subservice: admin
ms.author: rajses
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

The following questions are common security questions and answers for Power Platform security. These are categorized into 2 sections.
  - The first section covers the Top 10 Open Web Application Security Project® (OWASP) risks and how Power platform has been designed to help mitigate those risks.
  - The second section covers some of the common security questions that have been raised by customers in the past. These are organized based on when they were added to this white paper to facilitate your ability to quickly find new questions and answers when this paper is updated. The newest questions are added to the end of this list.

## OWASP Top 10 Risks - Mitigations in Power Platform
  The Open Web Application Security Project® ([OWASP](https://owasp.org/about/)) is a nonprofit foundation that works to improve the security of software. Through community-led open-source software projects, hundreds of local chapters worldwide, tens of thousands of members, and leading educational and training conferences, the OWASP Foundation is the source for developers and technologists to secure the web.

  The [OWASP Top 10](https://owasp.org/www-project-top-ten/) is a standard awareness document for developers and web application security. It represents a broad consensus about the most critical security risks to web applications.

  [A01:2021-Broken Access Control](https://owasp.org/Top10/A01_2021-Broken_Access_Control/):
  - The Power Platform security model is built on Least Privileged Access (LPA) and enables customers to build applications with more granular access control.
  - The platform uses Azure Active Directory's (Azure AD) [Microsoft Identity Platform](/azure/active-directory/develop/v2-overview) for authorization of all API calls with industry-standard OAuth 2.0 protocol.  
  - Dataverse, which powers the underlying data for Power Platform, has a rich security model that can adapt to many business scenarios like environment-level security, role-based security, and record and field-level security. 

  [A02:2021-Cryptographic Failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/):
  - Encryption of data in transit - Power Platform uses TLS to encrypt all HTTP-based network traffic. It uses other mechanisms to encrypt non-HTTP network traffic that contains customer or confidential data (IPSec, SMTP, SQL).
  - Using a hardened TLS configuration:
    - Uses only TLS 1.2 or above 
    - Uses ECDHE-based ciphers suites and NIST curves
    - Uses strong keys
    - Enables HTTP Strict Transport Security (HSTS) 
  - Encryption of data at rest - All customer data will be encrypted before being written to non-volatile storage media.
  
  [A03:2021-Injection](https://owasp.org/Top10/A03_2021-Injection/):
  - To be updated.

  [A04:2021–Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/):
  - Power Platform has been built on a culture and methodology of Secure Design which gets constantly reinforced through Microsoft's industry leading [SDL](https://www.microsoft.com/securityengineering/sdl/practices) practices of [Threat Modeling](https://www.microsoft.com/securityengineering/sdl/threatmodeling).
  - The robust Threat Modeling review process ensures that Power Platform identifies the threats during design phase, tracks them, mitigates them, and validates to make sure that the threats have been mitigated.
  - The process also accounts for all new changes to the services that are already live, through regular reviews so that this is a continuous process that helps to address most common insecure design issues by relying on the [STRIDE](https://docs.microsoft.com/azure/security/develop/threat-modeling-tool-threats#stride-model) model.
  - Microsoft's SDL is equivalent of the OWASP Software Assurance Maturity Model ([SAMM](https://owaspsamm.org/)) with both of them built on the premise that Secure Design is integral to web application security.

  [A05:2021-Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/):
  - One of the foundations of the Power Platform design principles is "Default Deny" where customers need to review, and opt-in for new features and configurations.
  - Any misconfigurations during the build time will be caught through integrated security analysis by leveraging [Secure Development Tools](https://marketplace.visualstudio.com/items?itemName=securedevelopmentteam.vss-secure-development-tools)
  - In addition, Power Platform goes through Dynamic Analysis Security Testing ([DAST](https://www.microsoft.com/securityengineering/sdl/practices#practice10)) by leveraging an internal service that is built on OWASP Top 10 risks.

  [A06:2021-Vulnerable and Outdated Components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/):
  - Power Platform follows Microsoft's industry leading [SDL](https://www.microsoft.com/securityengineering/sdl/practices) practices to manage open-source and third-party components. As part of this process, the [Tools and Techniques](https://www.microsoft.com/securityengineering/opensource/?activetab=security+analysis%3aprimaryr3) involve maintaining complete inventory, performing security analysis, keeping the components up to date, and aligning them with a tested and tried security incident response process.
  - In some rare cases, the process takes time due to external dependencies which is why there will still be some copies of outdated components in some applications. However, as per the above process, those will be tracked and updated once dependencies have been addressed.

  [A07:2021-Identification and Authentication Failures](https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/):
  - Power Platform is built on and depends on Azure Active Directory (Azure AD) for both identification and authentication.
  - Azure AD helps Power Platform to enable multiple [secure features](https://azure.microsoft.com/services/active-directory/#features) such as single sign on (SSO), multifactor authentication, and single platform to engage with both internal and external users more securely.
  - Together with Power Platform's upcoming implemenation of Azure AD's Continuous Access Evaluation ([CAE](https://docs.microsoft.com/azure/active-directory/conditional-access/concept-continuous-access-evaluation)), the experience will be even more secure, reliable, and performant for end users.

  [A08:2021-Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/):
  - Power Platform's Component Governance process ensures that software integrity is maintained by enforcing that package source files are securely configured.
  - The process ensures that it will only serve internally-sourced packages to address [substitution attack](https://azure.microsoft.com/resources/3-ways-to-mitigate-risk-using-private-package-feeds/) which is a technique (also know as dependency confusion) that can be used to poison the app-building process inside secure enterprise environments.
  - All encrypted data has integrity protection applied before it is transmitted, and all the integrity protection metadata present for incoming encrypted data will be validated. <!-- *To be validated* -->

  [A09:2021-Security Logging and Monitoring Failures](https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/):
  - To be updated
  <!-- *Focus on Azure Security logging features and Incident response* -->

  [A10:2021-Server-Side Request Forgery](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/):
  - To be updated
  <!--  *Focus on Azure Security capabilities* -->

  ## Common Security questions from customers
  The below are some of the common security questions that customers have raised in the past. We are capturing them here along with useful information that helps to answer their questions.

  ### How does Power Platform help protect against [Clickjacking](https://owasp.org/www-community/attacks/Clickjacking) risks?
  - Clickjacking is a significant threat for sign-in pages as it can allow them to steal credentials. In Power Platform, all sign-in pages are not iframeable which significantly reduces the risk of clickjacking.
  - In addition, Content Security Policy (CSP) policies can be used to restrict embedding to trusted domains with org settings.
  
  ### How does Power Platform help protect against cross-site scripting ([XSS](https://owasp.org/www-community/attacks/Clickjacking)) risks?
  - To be updated

  ### How does Power Platform help protect against cross-site request forgery ([CSRF](https://owasp.org/www-community/attacks/csrf)) risks?
  - To be updated
  
  ### Does Power Platform support Content Security Policy ([CSP](https://owasp.org/www-community/controls/Content_Security_Policy))?
  - There are various directives that can be configured as part of CSP. Currently only the [frame-ancestors](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) directive is supported by UCI/CRM as documented in the [Developer Reference](/powerapps/developer/data-platform/reference/entities/organization#BKMK_ContentSecurityPolicyConfiguration). 
  - Supporting CSP is an extremely important priority for Power Platform. There will be more updates coming in a future roadmap regarding CSP support like:
    - Full blog post on how to implement CSP for Unified Interface
    - Supporting all available CSP directives
    - Same CSP support for Canvas applications

  ### How can we connect to SQL Server securely?
  - The best practices for securely connecting to external data sources has been documented [here](https://powerapps.microsoft.com/blog/best-security-practices-for-power-apps/).

  ### What ciphers are supported by Power Platform? What's the roadmap of continuously moving towards stronger ciphers?
  - All Microsoft services and products are configured to use the approved cipher suites, in the exact order as mentioned by Microsoft Crypto Board. The exact list and order can be found in [Power Platform documentation](/power-platform/admin/server-cipher-tls-requirements).
  - Any changes related to deprecations of cipher suites will be communicated through Power Platform's [Important Changes](/power-platform/important-changes-coming#tls-rsa-cipher-suites-are-deprecated) documentation.

  ### Why does Power Platform still support RSA-CBC ciphers (TLS_ECDHE_RSA_with AES_128_CBC_SHA256 (0xC027) and TLS_ECDHE_RSA_with_AES_256_CBC_SHA384 (0xC028)) which are considered weaker?
  - Microsoft weighs the relative risk and customer disruption in choosing the support of cipher suites. Since these cipher suites are not broken yet, to ensure consistency across all services and products, and also to support all customer configurations, these were enabled. However, these are at the bottom of the priority list. These will be deprecated at the right time; Microsoft's Crypto Board makes continuous assessement time-to-time.

  ### How does Power Platform protect against Distributed Denial of Service ([DDoS](https://owasp.org/www-project-automated-threats-to-web-applications/assets/oats/EN/OAT-015_Denial_of_Service.html)) attacks?
  - Power Platform is built on top of Microsoft Azure. As such, Power Platform leverages [Azure DDoS Protection](/azure/ddos-protection/ddos-protection-standard-features) to guard against Distributed Denial of Service (DDoS) attacks.
  
  ### Does Power Platform detect jailbroken iOS devices and rooted Android devices to help with protecting organizational data?
  - The recommendation is to use Microsoft Intune, a Mobile Device Management (MDM) solution which can help protect organizational data by requiring users and devices to meet some requirements. For more details, see Intune's [Compliance Policy settings](/mem/intune/protect/device-compliance-get-started#compliance-policy-settings).

  ### Why are the session cookies scoped to the parent domain?
  - This is to allow Auth across orgs. The subdomains aren't used as security boundaries and also don't host customer content.

  ### How can we set the application session to timeout after, say, 15 minutes?
  - Power Platform uses Azure Active Directory (Azure AD) for Identity and Access Management (IAM). Power Platform follows Azure AD's [recommended configuration](/azure/active-directory/develop/access-tokens#access-token-lifetime) for session management for an optimal user experience. 
  - Together with Power Platform's upcoming implementation of Azure AD's Continuous Access Evaluation ([CAE](/azure/active-directory/conditional-access/concept-continuous-access-evaluation)), the experience will be even more secure, reliable, and performant for end users.

  ### The application allows the same user to access from more than one machine/browser at the same time. How can we prevent that?
  - Accessing the application from more than one machine/browser at the same time is a convenience. However, the access needs to be continuously evaluated to ensure that the access is from legitimate sources and still valid.
  - Azure Active Directory (Azure AD) has rolled out the Continuous Access Evaluation ([CAE](/azure/active-directory/conditional-access/concept-continuous-access-evaluation)) feature which will be coming to Power Platform to help with the above.



### See also



