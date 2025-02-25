---
title: Meet compliance requirements
description: As an IT admin, I want to configure identity and access management for Microsoft Power Platform so that I can ensure secure access to resources.
#customer intent: As a Power Platform user, I want to configure identity and access management for Microsoft Power Platform so that I can ensure secure access to resources.
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 02/28/2025
---

# Meet compliance requirements

Every organization must comply with the legal and regulatory standards of the industry and region they operate in. They might also have additional contractual requirements and corporate policies.

Regional, industry-wide, and organization-specific regulations are top of mind as the race towards AI adoption continues. With Power Platform, you can feel confident that your organization’s business applications and copilots meet [all compliance requirements](/power-platform/admin/wp-compliance-data-privacy) including assured visibility, granular traceability, and comprehensive audits.

Microsoft is responsible for the platform, including the services it offers. We provide a cloud service that can meet or exceed your security, privacy, and compliance needs. Microsoft complies with data protection and privacy laws for cloud services, and our compliance with world-class industry standards is verified. Detailed information about compliance for our cloud services and solutions that help you meet regulatory requirements for data security is available in our [Microsoft Trust Center](https://www.microsoft.com/trust-center).

As with security and privacy, compliance with laws and regulations is a shared responsibility of cloud service providers and their customers. The Trust Center offers tools that help you comply with national, regional, and industry-specific requirements for data collection and use, and audit reports that help you verify technical compliance and control requirements.

- [Compliance Manager](https://servicetrust.microsoft.com/ComplianceManager/V3): A cross-Microsoft cloud services solution that helps you meet complex compliance obligations. It performs real-time risk assessment that shows your compliance posture against data protection regulations when you use Microsoft cloud services. It also gives you recommended actions and step-by-step guidance.

- [Service Trust Portal](https://servicetrust.microsoft.com/): This portal has details and documents such as whitepapers, ISO reports, and other resources that explain Microsoft's implementation of controls and processes that protect cloud services and customer data.

Learn more: [Manage compliance in the cloud at Microsoft Trust Center](https://www.microsoft.com/trust-center/compliance/compliance-overview).

## Personal data

The European Union (EU) General Data Protection Regulation (GDPR) gives significant rights to individuals regarding their data. Refer to the [Microsoft Learn General Data Protection Regulation Summary](/compliance/regulatory/gdpr) for an overview of GDPR, including terminology, an action plan, and readiness checklists to help you meet your obligations under GDPR when using Microsoft products and services.

Learn more about GDPR and how Microsoft helps support it and our customers:

- The [Microsoft Trust Center](/dynamics365/guidance/implementation-guide/security) provides general information, compliance best practices, and documentation helpful to GDPR accountability, such as data protection impact assessments, data subject requests, and data breach notification.
- The [Service Trust Portal](https://servicetrust.microsoft.com/ViewPage/GDPRGetStarted) provides information about how Microsoft services help support compliance with GDPR.
Use the links in the following table to help you respond to requests for personal data.

Learn more: [Resources to manage GDPR compliance](/power-platform/admin/wp-compliance-data-privacy#resources-to-manage-gdpr-compliance)

## Responsible AI

Power Platform workloads that use AI must adhere to responsible AI principles to ensure fairness, accountability, transparency, and ethical behavior.

Design the AI system to treat all users fairly, hold developers and users accountable for its performance, ensure transparency in AI operations, and adhere to ethical standards.

At Microsoft, we're committed to the advancement of AI driven by principles that put people first. Generative models have significant potential benefits, but without careful design and thoughtful mitigations, such models can generate incorrect or even harmful content. Microsoft has made significant investments to help guard against abuse and unintended harm, which includes incorporating Microsoft's [principles for responsible AI use](https://www.microsoft.com/ai/responsible-ai?activetab=pivot1:primaryr6), adopting a [Code of Conduct](/legal/cognitive-services/openai/code-of-conduct?context=/azure/ai-services/openai/context/context), building content filters to support customers, and providing responsible AI [information and guidance](/legal/cognitive-services/openai/transparency-note?context=%2Fazure%2Fai-services%2Fopenai%2Fcontext%2Fcontext&tabs=image) that customers should consider when using generative AI.

Power Platform copilots and generative AI features follow a set of core security and privacy practices and the [Microsoft Responsible AI Standard](https://www.microsoft.com/ai/principles-and-approach). Power Platform data is protected by comprehensive, industry-leading compliance, security, and privacy controls.

## Dataverse auditing

With Dataverse audit capabilities in the Power Platform admin center, you can dive deeper with comprehensive logging capabilities, including admin, maker, and user activity logs, all critical for identifying potential security threats. By monitoring unusual activity, such as a sudden surge in sign in attempts or changes to security settings, you can easily detect and respond to attacks before they escalate.

[Microsoft Purview](/purview/register-scan-dataverse?) supports detailed auditing across Power Platform, including Copilot Studio events, to meet compliance requirements. It allows customized audit logs and provides detailed reports for AI-driven scenarios, enhancing security and compliance.

Moreover, to meet your enterprise’s compliance requirements with greater granularity, Dataverse offers robust data logging capabilities within [managed security](/power-platform/admin/security/managed-security). This feature is essential for investigating security incidents and is designed to meet the external and internal auditing, compliance, security, and governance policies that are common to many enterprises. You can easily customize your Dataverse audit for various entities and fields to ensure that you have comprehensive visibility into your data interactions, helping to maintain a secure and compliant environment.

:::image type="content" source="media/sec-envauditing.png" alt-text="Environment auditing":::

## Understand security and compliance requirements

As Microsoft's customer, you must identify which controls apply to your business and understand how to implement and configure them to manage security and compliance with the legal and regulatory requirements of your nation, region, and industry. Understand the key requirements for the Power Platform workloads you're implementing. Ask yourself the following questions to help identify the security measures to address.

- What data residency requirements apply to the data used in the intelligent application workload? Do you know where your data resides and if the location aligns with your legal or regulatory obligations?
- What regulatory and compliance requirements must be met for the intelligent application workload?
- How are ethical considerations and responsible AI practices incorporated into the intelligent application workload?
- How do you ensure secure and seamless user authentication?
- Are you properly handling personal and sensitive information with encryption and role-based access?
- What is the nature and sensitivity of the data used in this solution?

Learn more: [Regulatory compliance standards and Microsoft products](https://www.microsoft.com/trust-center/compliance/compliance-overview?rtc=1).

## Understand how regulatory requirements affect your project

Identify and adhere to regulatory requirements and norms applicable to your industry, such as GDPR (General Data Protection Regulation), HIPAA (Health Insurance Portability and Accountability Act), or CCPA (California Consumer Privacy Act). Implement necessary controls to ensure compliance. Schedule regular compliance audits to verify adherence to regulatory standards and address any gaps. Assess if there are specific requirements for data location, such as a requirement for data to be stored in a particular country or region. Ensure your data storage strategy meets these requirements.

Ensure data is protected and managed in compliance with regulatory requirements. Protecting the data handled by the intelligent application workload is critical to maintaining trust and adherence to legal and regulatory standards.

## Provide employee training

Train employees on data protection best practices and the importance of adhering to data residency requirements. Tailor training materials to the specific roles and responsibilities of different employees. Data protection laws and regulations are constantly evolving. Ensure that training programs are regularly updated to reflect the latest legal requirements and best practices. Use interactive methods such as workshops, simulations, and real-life scenarios to make the training engaging and effective. Provide continuous support and resources, such as access to data protection officers or legal advisors, to help employees stay informed and compliant.

## Resources

- [Compliance and data privacy](/power-platform/admin/wp-compliance-data-privacy)
- [Microsoft Trust Center](https://www.microsoft.com/trustcenter)
- [Data Subject Requests](/power-platform/admin/about-privacy)
- [Copilot Studio GDPR compliance](/microsoft-copilot-studio/personal-data-summary)
