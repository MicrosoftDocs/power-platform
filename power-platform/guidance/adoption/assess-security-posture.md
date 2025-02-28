---
title: Assess your security posture
description: Assess your Power Platform security posture with our comprehensive guide. Learn how to protect your data and ensure compliance with best practices.
#customer intent: As a Power Platform admin, I want to assess my Power Platform security posture so that I can protect my data and ensure compliance with best practices.
author: manuelap-msft
ms.component: pa-admin
ms.topic: best-practice
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 02/28/2025
---

# Assess your security posture

The core objectives of security teams don't change with the adoption of Power Platform. However, the methods to achieve these objectives evolve. Security teams must continue to prioritize reducing business risk from attacks and ensure that confidentiality, integrity, and availability are embedded in all information systems and data.

Security is the protection of IT systems and networks from theft, damage, or disruption. Power Platform is a cloud offering from Microsoft, which means you own your data, but share some control over the workloads with Microsoft. Therefore, operational and security responsibilities for workloads are split between you and Microsoft.

This diagram illustrates how security responsibilities are distributed between you and Microsoft:

:::image type="content" source="media/shared-responsibility.png" alt-text="Diagram showing the distribution of security responsibilities shared between the customer and Microsoft." lightbox="media/shared-responsibility.png":::

This article explains the security principles and practices that apply to Power Platform. It also prompts you to assess what you are doing today to secure Power Platform solutions and provides next steps to design your action plan.

## Microsoft security foundation

Organizations don't exist in isolation. They work with each other and their customers. They form the vital supply chains we all depend on. We need to work together to protect our people, data, and infrastructure. Microsoft takes a bold, comprehensive approach to security that is end-to-end, best-in-breed, and AI-powered.

Microsoft has made massive investments in security since the mid-2000s. More than 3,500 Microsoft engineers work to proactively address the ever-shifting threat landscape. Microsoft security starts at the on-chip BIOS kernel and extends all the way up to the user experience. Today, our security stack is the most advanced in the industry. Microsoft is broadly viewed as the global leader in the fight against malicious actors. Billions of computers, trillions of logins, and zettabytes of data are entrusted to Microsoft's protection.

Microsoft works toward this goal by focusing on tools and capabilities that support the following high level goals:

- Protect everything. Keep your entire organization safe with integrated business security solutions that work well across platforms and cloud environments. This goal includes making your organization's Power Platform solutions part of your protected resources.
- Simplify the complex. Prioritize the right risks with management tools that make the best use of the human expertise in your company. Include security management of Power Platform business applications in your management tools to avoid adding more complexity.
- Catch what others miss. Use leading AI, automation, and expertise to find and stop cyberthreats fast and fortify your security position.

These security goals drive the innovation in the following Microsoft integrated security products:

- [Microsoft Defender](/defender-cloud-apps/what-is-defender-for-cloud-apps): Stop cyberattacks on your devices, identities, apps, email, and clouds with industry-leading extended detection and response (XDR) products.
- [Microsoft Sentinel](/azure/sentinel/overview): Stay ahead of cyberthreats with AI-powered security information and event management (SIEM) that aggregates data from your entire enterprise to give you unmatched visibility.
- [Microsoft Entra](/entra/identity/): Verify every identity and access request across your clouds, platforms, and devices with a unified set of identity and access products.
- [Microsoft Purview](/purview/): Protect data wherever it is with information protection, governance, and compliance products that are designed to work together.
- [Microsoft Priva](/privacy/priva/priva-overview): Respect customer and employee privacy with products that reduce risk and manage compliance on a single platform.
- [Microsoft Intune](/mem/intune/fundamentals/what-is-intune): Strengthen device security and enable seamless hybrid work experiences with a family of endpoint management products.

These products work together to form a stronger defense. Power Platform builds on this foundation to add security to the business applications you create.

## Security in Power Platform

Power Platform is built on a strong foundation of security. It uses the same security stack that positions Azure as a trusted custodian of the world's most sensitive data and integrates with Microsoft 365's advanced information protection and compliance tools. Power Platform delivers end-to-end protection designed around our customers' most challenging concerns.

The Power Platform service is governed by the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31) and the [Microsoft Enterprise Privacy Statement](https://www.microsoft.com/privacystatement/OnlineServices/Default.aspx). For the location of data processing, refer to the Microsoft Online Services Terms and the [Data Protection Addendum](https://www.microsoft.com/download/details.aspx?id=101581).

<!-- Please check first link above, it's redirecting to https://www.microsoft.com/licensing/docs -->

The [Microsoft Trust Center](https://www.microsoft.com/trustcenter) is the primary resource for Power Platform compliance information. Learn more in [Microsoft Compliance Offerings](/compliance/regulatory/offering-home).

The Power Platform service follows the Security Development Lifecycle (SDL). The SDL is a set of strict practices that support security assurance and compliance requirements. Learn more: [Microsoft Security Development Lifecycle Practices](https://www.microsoft.com/securityengineering/sdl/practices)

Learn more about individual security features and find answers to frequent security questions:

- [Microsoft Power Platform security and governance documentation](/power-platform/admin/security)
- [Overview of Power Platform security](/power-platform/admin/security/overview)
- [Data storage and governance](/power-platform/admin/security/data-storage)
- [Power Platform security FAQs](/power-platform/admin/security/faqs)

## Evaluate your current security posture

Evaluating your current security posture is important to ensure that your Power Platform environments and workloads are secure and compliant with organizational and regulatory requirements. This process involves thoroughly assessing your existing security measures, tools, and practices to identify gaps and areas for improvement. 

Here's a detailed look at what this evaluation entails:

1. **Security tools and technologies**: Examine the security tools and technologies you're currently using to protect your Power Platform environment. Consider:
  - **Data Loss Prevention (DLP) policies**: Are you using DLP policies to prevent unauthorized data sharing?
  - **Encryption**: Is your data encrypted both at rest and in transit?
  - **Identity and Access Management (IAM)**: Are you using advanced features of Microsoft Entra ID, such as Conditional Access or Privileged Identity Management (PIM), for authentication and authorization?
1. **Security policies and guidelines**: Review any existing security policies or guidelines specific to Power Platform. Consider whether these policies are up-to-date and comprehensive enough to address current threats. Key areas to evaluate include:
  - **User access controls**: Are there clear policies on who can access what data and resources?
  - **Development guidelines**: Have you established secure coding practices for app and workflow development? Are these guidelines easily accessible to your makers? Do you have processes in place to train new makers on these guidelines?
1. **Monitoring and auditing**: Assess how you currently monitor and audit activities within Power Platform. Effective monitoring and auditing are essential for detecting and responding to security incidents. Key questions to ask include:
  - **Activity logs**: Are you capturing detailed logs of user activities and changes within the platform?
  - **Alerting mechanisms**: Do you have alerts set up for suspicious activities or policy violations?
1. **Regulatory and compliance requirements**: Identify any specific regulatory or compliance requirements that apply to your organization. For example, General Data Protection Regulation (GDPR), Health Insurance Portability and Accountability (HIPAA), or other industry-specific standards. Ensure that your Power Platform security measures align with these requirements. Consider:
  - **Compliance audits**: Are you regularly conducting audits to ensure compliance?
  - **Documentation**: Do you have the necessary documentation to demonstrate compliance during audits?

By thoroughly evaluating these aspects, you can gain a clear understanding of your current security posture. This understanding is crucial for developing a strategic plan to enhance your security measures, ensuring that your Power Platform environment is robust, secure, and compliant.

Understanding your security maturity level is essential for developing a robust security strategy for Power Platform. Assess your current security posture to identify where you stand in terms of security practices and controls. Categorize your organization into a specific maturity level—initial, capable, or efficient—to establish a clear baseline. This baseline helps you pinpoint specific action items needed to advance to the next maturity level. By addressing these action items, you enhance your security measures and ensure better protection for your data, applications, and users.

| | Initial | Capable | Efficient |
| --- | --- | --- | --- |
| **Identity and Access Management (IAM)** | Uses basic Microsoft Entra ID for user authentication and access control. | Uses advanced Microsoft Entra ID features, such as Conditional Access, Privileged Identity Management (PIM), and potentially Continuous Access Evaluation (CAE) for granular control over access. | Comprehensive Identity and Access management. Implements a mature identity governance framework with automated provisioning/de-provisioning, access reviews, and entitlement management. |
| **Environment strategy** | Limited environment strategy. Employs a few environments with broad security group assignments. | Structured environment strategy. Uses a well-defined environment strategy with clear security group assignments and role-based access control (RBAC) for different workloads. | Optimized environment management. Uses environment lifecycle management, deployment pipelines, and potentially environment routing for efficient and secure application deployment. |
| **Dataverse security** | Implements out-of-the-box Dataverse security roles and basic table permissions. | Customizes Dataverse security roles, implements column-level security, and uses record-level sharing for fine-grained data access control. | Advanced Data Security: Implements data masking, customer-managed keys (CMK), and potentially Customer Lockbox for enhanced data protection. Uses Microsoft Purview for data classification and labeling. |
| **Data protection** | Has Data Loss Prevention (DLP) policies in place but with limited connector actions and endpoint filtering. | Advanced DLP and Network Security. Employs extended DLP with connector action control and endpoint filtering. Implements IP firewall and potentially virtual network support for network isolation. | Robust Network Security. Implements a defense-in-depth network security strategy with Azure Firewall, Network Security Groups (NSGs), and Azure Policy. |
| **Monitoring** | Basic monitoring. Relies on basic audit logs and might not have integrated Power Platform into their broader security operations center (SOC). | Proactive monitoring. Integrates Power Platform logs with Microsoft Sentinel or a similar security information and event management (SIEM) solution for threat detection and incident response. | Advanced threat protection and monitoring. Employs advanced threat protection capabilities like Microsoft Defender for Cloud Apps. Uses AI and automation for threat detection and response in their SOC. Actively participates in the Security Development Lifecycle (SDL) and uses the [Power Platform Well-Architected Framework](/power-platform/well-architected/) for continuous improvement. |

## Typical security challenges in business applications

In the age of AI, the data protection landscape is rapidly evolving. As attacks become more sophisticated and enterprises increasingly use data in AI-driven scenarios, the demand for data access grows. Simultaneously, regulations and requirements are adapting to meet these new needs. Business applications face unique security challenges that span all industries.

Here are some of the typical challenges and how Power Platform can help address them:

- Limited controls to stop attackers: Most business applications have minimal controls to prevent attackers once they gain access. Traditional security measures often fall short in stopping sophisticated attacks that exploit vulnerabilities within the system.
- Insider threats: Attackers are often insiders who have legitimate permissions to use the systems. These insiders know how to bypass built-in controls and exploit exceptions within the organization. Detecting and mitigating insider threats requires advanced security measures that go beyond standard access controls.
- Subtle attacks: The most challenging attacks to detect are those that make minor adjustments, benefiting the attacker while causing harm to the organization. These subtle changes can easily go unnoticed without robust monitoring and analysis.

Power Platform offers a range of security controls and tools designed to tackle these challenges effectively.

1. **Comprehensive monitoring and integration**: Relying solely on monitoring the activities within your business applications isn't enough to spot problems. You need to integrate these applications with other data sources to identify and respond to suspicious activities that might otherwise go unnoticed. For example, seeing that a cloud flow is getting customer information from Dataverse and sending an email might not be suspicious on its own. However, when combined with other signals, such as frequency of the cloud flow runs, unusual geo-locations, or off-hours activity, you can detect more complex insider threats. Power Platform's integration with [Microsoft Sentinel](/azure/sentinel/overview) allows for advanced threat detection and response. By correlating data from various sources, Microsoft Sentinel can identify patterns and anomalies that indicate potential security threats, enabling proactive measures to mitigate risks.

1. **Data protection**: Implementing [DLP policies](/power-platform/admin/wp-data-loss-prevention) within Power Platform helps prevent unauthorized data sharing and ensures that sensitive information is protected. These policies can be tailored to meet specific organizational needs and compliance requirements. The [IP firewall](/power-platform/admin/ip-firewall) feature in Power Platform allows administrators to define and enforce IP-based access controls, ensuring that only authorized IP addresses can access the Power Platform environment. With IP firewall organizations can mitigate risks associated with unauthorized access and data breaches, enhancing the overall security of their Power Platform deployments. [Virtual Network support](/power-platform/admin/vnet-support-overview) in Power Platform allows organizations to isolate their network traffic and enforce stringent security policies. Virtual Network integration allows Power Platform environments to securely connect to on-premises networks and other Azure services, ensuring that data remains within trusted network boundaries.

1. **Identity and Access Management (IAM)**: Use [Microsoft Entra ID](/entra/identity/) for robust identity and access management. Features like conditional access and multifactor authentication enhance security by ensuring that only authorized users can access critical resources.

1. **Secure development practices**: Establishing [secure coding practices](/power-platform/well-architected/security/secure-development-lifecycle) for workload development is essential. Ensure that these guidelines are easily accessible to your makers and provide training to new makers on these practices. This strategy helps build secure applications from the ground up.

## Consider your security challenges and OWASP Top 10

The Open Worldwide Application Security Project® ([OWASP](https://owasp.org/about/)) is a nonprofit foundation dedicated to improving software security. OWASP identified the [top 10 security risks](https://aka.ms/OWASPLowCodeSecurityRisks) associated with low-code/no-code platforms. This list is essential for users to understand and is regularly updated based on feedback from the security community to ensure it remains relevant and comprehensive.

These risks are common across all low-code/no-code platforms, and addressing them requires a combination of platform-specific security features and organizational security processes. While using a low-code/no-code platform can mitigate some security risks, it doesn't eliminate all of them.

While OWASP's guidance is generic and applies to any product and organization, Microsoft publishes specific guidance on mitigating the top 10 low-code/no-code security risks tailored for Power Platform. This guidance provides detailed strategies and best practices to help you secure your Power Platform environment effectively. Learn more: [Microsoft's guidance on low code/no code security risks for Power Platform](https://aka.ms/MSFTLowCodeSecurityRisks)

By understanding and addressing these top 10 security risks, you can significantly enhance the security of your low-code/no-code solutions. Consider your current security challenges and how they align with these risks. Implementing the recommended security measures helps protect your organization's data and applications, ensuring a secure and resilient Power Platform environment.

## Find the right level of security friction

Finding the right balance in security measures is critical to maintaining both productivity and safety within an organization. Users need sufficient security guidance to protect their assets, but overly restrictive measures can hinder their efficiency. When security protocols are too cumbersome or not well understood, users might become frustrated and attempt to bypass them, leading to risky "Shadow IT" practices. Such practices not only undermine security efforts but also increase the overall risk to the organization. Therefore, it's essential to implement robust yet user-friendly security measures, ensuring that users can work efficiently while keeping their assets secure.

:::image type="content" source="media/find-balance.png" alt-text="Diagram illustrating the balance between security and productivity." lightbox="media/find-balance.png":::

Security naturally creates friction that might slow down processes. It's important to identify which elements are healthy in your IT processes and which are not.

- **Healthy friction**: Much like exercise resistance strengthens a muscle, integrating the right level of security friction strengthens the system or application by forcing critical thinking at the right time. This process involves considering how and why an attacker might try to compromise an application or system during design (known as threat modeling), and reviewing, identifying, and fixing potential vulnerabilities that attackers can exploit in software code, configurations, or operational practices.

- **Unhealthy friction**: Unhealthy friction impedes value more than it protects. Examples include security bugs generated by tools that return a high false positive rate (such as false alarms) or when the effort to discover or fix security issues far exceeds the potential effect of an attack.

## Make security a priority

Security should be your first concern when you start your Power Platform adoption, not an afterthought. Ignoring security requirements can lead to serious legal, financial, and business risks, and delays in your project. It can also affect the overall scalability and performance of the solution. 

Make security a priority from day one. Consider the security impacts on scalability, performance, compliance, rollout plans, reporting, and operational aspects. Include specific examples from each product that build on the concepts discussed.

## Next step

A comprehensive security strategy for Power Platform adoption creates a framework that ensures protection of sensitive data, compliance with regulatory standards, and supports enterprise scalability. To develop your security strategy, be sure to implement a robust security posture.

> [!div class="nextstepaction"]
> [Manage your security posture](security-posture-management.md)

## Resources
<!-- TODO UPDATE WITH MORE LINKS AND SECTIONS -->

- [Low-code security and governance](https://www.microsoft.com/en-us/power-platform/trusted-cloud?msockid=32e5014d245262fc0dd6128a2508631d)
- [Microsoft compliance](/compliance/)
- [Microsoft Power Platform security and governance documentation](/power-platform/admin/security)
- [Microsoft Copilot Studio security and governance documentation](/microsoft-copilot-studio/security-and-governance)
- [Microsoft Copilot Studio compliance offerings](/microsoft-copilot-studio/admin-certification)
- [Responsible AI FAQs for Microsoft Power Platform](/power-platform/responsible-ai-overview)
- [Responsible AI FAQs for Copilot Studio](/microsoft-copilot-studio/responsible-ai-overview)