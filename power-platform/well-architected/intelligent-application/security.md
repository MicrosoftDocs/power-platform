---
title: Security considerations for intelligent application workloads
description: Implement robust security for intelligent application workloads, ensuring compliance and proactive threat detection.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Security and compliance considerations for intelligent application workloads

Security is critical for any architecture. Microsoft Power Platform offers a comprehensive range of tools to effectively secure your intelligent application workload. This article describes security considerations and recommendations for developing intelligent application workloads with Power Platform.

Copilot for Dynamics 365 and Power Platform features follow a set of core security and privacy practices and the Microsoft [Responsible AI Standard](https://www.microsoft.com/ai/principles-and-approach). Dynamics 365 and Power Platform data is protected by comprehensive, industry-leading compliance, security, and privacy controls. For more information on Microsoft Copilot Studio and Power Platform security features, see [Copilot Studio security and governance](/microsoft-copilot-studio/security-and-governance), [FAQ for Copilot data security and privacy for Dynamics 365 and Power Platform](/power-platform/faqs-copilot-data-security-privacy), and [Security in Microsoft Power Platform](/power-platform/admin/security/overview).

You should periodically assess the services and technologies you employ to ensure that your security measures align with the changing threat landscape.

## Understand security requirements

Understand the key requirements for the intelligent application workload you're implementing. Ask yourself the following questions to help identify the security measures to address.

### Access control and authentication

- How will you implement access control and authentication mechanisms to ensure only authorized users can access the intelligent application workload?
- How do you ensure secure and seamless user authentication?
- How do you control which apps can interact with the generative AI (agent) and what measures ensure these restrictions are effective?
 
### Security and incident management

- How will you manage and secure application secrets, such as API keys and passwords?
- What network security requirements impact the intelligent application workload? For example, are internal APIs only accessible in a virtual network?
- How will you monitor and audit access and usage of the intelligent application?
- What is the incident response plan for addressing security breaches or vulnerabilities?
 
### Compliance and data residency

- What data residency requirements apply to the data used in the intelligent application workload? Do you know where your data will reside and if the location aligns with your legal or regulatory obligations?
- What regulatory and compliance requirements must be met for the intelligent application workload?
 
### System integration and network requirements

- How will the intelligent application workload securely integrate with other internal and external systems?
- What are the network and integration requirements for your workload? Is there a need to integrate with internal or external data sources or APIs?

### Ethical considerations and Responsible AI

- How will ethical considerations and responsible AI practices be incorporated into the intelligent application workload?

## Implement robust authentication and access control measures

Authentication allows users to sign in, giving your agent access to a restricted resource or information. Users can sign in with [Microsoft Entra ID](/microsoft-copilot-studio/configuration-authentication-azure-ad) or with any [OAuth2 identity provider](/azure/active-directory/develop/v2-oauth2-auth-code-flow) such as Google or Facebook.

Implement robust authentication and access control measures to ensure authorized users can access the agent. Ensuring only authorized users can access the agent is the foundation of security. [Implementing multifactor authentication](/entra/identity/authentication/concept-mfa-howitworks) adds an extra layer of security. To minimize the risk of unauthorized access, define roles and permissions to ensure that users have access only to the resources they need. Implement conditional access policies to control access based on specific conditions, such as user location, device compliance, or risk level.
 
Learn more:

- [Configure user authentication](/microsoft-copilot-studio/configuration-authentication-azure-ad)
- [Configure single sign-on](/microsoft-copilot-studio/configure-sso?tabs=webApp)
- [Configure web and Direct Line channel security](/microsoft-copilot-studio/configure-web-security)

## Understand how regulatory requirements affect your project

Identify and adhere to regulatory requirements and norms applicable to your industry, such as GDPR (General Data Protection Regulation), HIPAA (Health Insurance Portability and Accountability Act), or CCPA (California Consumer Privacy Act). Implement necessary controls to ensure compliance. Schedule regular compliance audits to verify adherence to regulatory standards and address any gaps. Assess if there are specific requirements for data location, such as a requirement for data to be stored in a particular country or region. Ensure that your data storage strategy meets these requirements. 

Ensure that data is protected and managed in compliance with regulatory requirements. Protecting the data handled by the intelligent application workload is critical to maintaining trust and adherence to legal and regulatory standards.

Microsoft complies with data protection and privacy laws applicable to cloud services. Our compliance with world-class industry standards is verified. Environments can be created in specific regions, even if different from the region where the tenant resides. By default, conversation transcripts are only kept for 30 days in Dataverse. You can adjust this retention period on a per-environment basis.

Learn more:

- [Security and geographic data residency in Copilot Studio](/microsoft-copilot-studio/geo-data-residency-security)
- [Geographic data residency in Copilot Studio](/microsoft-copilot-studio/geo-data-residency)
- [Copilot Studio compliance offerings](/microsoft-copilot-studio/admin-certification)
- [Copilot Studio GDPR compliance](/microsoft-copilot-studio/personal-data-summary)
- [Copilot Studio Data locations](/microsoft-copilot-studio/data-location?tabs=web)
- [Managing compliance in the cloud](https://www.microsoft.com/trust-center/compliance/compliance-overview)
- [Service Trust Portal](https://servicetrust.microsoft.com/ViewPage/HomePageVNext)
- [Change the default retention period for conversation transcripts](/microsoft-copilot-studio/analytics-sessions-transcripts#change-the-default-retention-period)
- [Move data across geographic locations for generative AI features outside United States](/microsoft-copilot-studio/manage-data-movement-outside-us)
- [Design to protect confidentiality](/power-platform/well-architected/security/principles#design-to-protect-confidentiality)

## Secure all integrations

Ensure secure communication between your intelligent application workload and data sources. Your intelligent application workload needs to integrate with other systems to access and process data. To simplify identity management and enhance security, use service principals for nonhuman access to resources and managed identities for Azure resources. Secure APIs by using OAuth2 for authentication and by ensuring that all API communications are encrypted. Using service principals ensures connections are secure and don't rely on individual credentials.

Learn more:

- [Design for integration security](/power-platform/well-architected/security/principles#design-for-integration-security)
- [Service principal support](/power-automate/service-principal-support)

## Implement ongoing monitoring and auditing

The main purpose of security monitoring is threat detection. The primary objective is to prevent potential security breaches and maintain a secure environment. Continuously monitor and audit the intelligent application workload's activities to detect and respond proactively. Security is an ongoing process, not a one-time configuration task. Regular monitoring and auditing of user access and interactions are essential to keep your intelligent application workload secure.

Learn more:

- [Recommendations for monitoring and threat detection](/power-platform/well-architected/security/monitor-threats)
- [View Copilot Studio audit logs](/microsoft-copilot-studio/admin-logging-copilot-studio)
- [Capture Copilot Studio telemetry with Azure Application Insights](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry?tabs=webApp)

## Use Azure security tools to enforce security policies

Use Azure's built-in security tools, such as [Microsoft Defender for Cloud](/azure/defender-for-cloud/) (formerly known as Azure Security Center) and [Azure Policy](/azure/governance/policy/overview), to monitor and enforce security policies.

## Provide employee training

Train employees on data protection best practices and the importance of adhering to data residency requirements. Tailor training materials to the specific roles and responsibilities of different employees. Data protection laws and regulations are constantly evolving. Ensure that training programs are regularly updated to reflect the latest legal requirements and best practices. Use interactive methods such as workshops, simulations, and real-life scenarios to make the training engaging and effective. Provide continuous support and resources, such as access to data protection officers or legal advisors, to help employees stay informed and compliant. 
