---
title: Establish a security baseline recommendation for Power Platform workloads
description: Learn how to establish a security baseline for Power Platform workloads, including how to reduce cyber risks, data breaches, and unauthorized access.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/18/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for establishing a security baseline

**Applies to Power Platform Well-Architected Security checklist recommendation:**

|[SE:01](checklist.md)| **Establish a security baseline aligned to compliance requirements, industry standards, and platform recommendations. Regularly measure your workload architecture and operations against the baseline to sustain or improve your security posture over time.** |
|---|---|

This guide describes the recommendations for establishing a security baseline for developing workloads with Microsoft Power Platform. A security baseline is a set of minimum-security standards and best practices that an organization applies to its IT systems and services. A security baseline helps to reduce the risk of cyberattacks, data breaches, and unauthorized access. A security baseline also helps to ensure consistency, accountability, and auditability across the organization.

A good security baseline helps you:

- Reduce the risk of cyberattacks, data breaches, and unauthorized access.
- Ensure consistency, accountability, and auditability across the organization.
- Keep your data and systems secure.
- Comply with regulatory requirements.
- Minimize risk of oversight.

Security baselines should be published widely throughout your organization so that all stakeholders are aware of the expectations.

Establishing a security baseline for Microsoft Power Platform involves several steps and considerations, such as:

- Understanding the architecture and components of Power Platform, such as environments, connectors, Dataverse, Power Apps, Power Automate, and Copilot Studio.

- Configuring the security settings and roles for Power Platform at the tenant, environment and resource level, such as Data policies, environment permissions, and security groups.

- Leveraging Microsoft Entra ID to manage user identities, authentication, and authorization for Power Platform, and integrating with other Entra ID features such as conditional access and multifactor authentication.

- Applying data protection and encryption methods to secure the data stored and processed by Power Platform, such as sensitivity labels and customer-managed keys.

- Monitoring and auditing the activities and usage of Power Platform, using tools such as the Power Platform Admin Center, Managed Environments, and Microsoft Purview.

- Implementing governance policies and processes for Power Platform, such as defining the roles and responsibilities of different stakeholders, establishing approval workflows and change management, and providing guidance and training for users and developers.

This guide helps you set a security baseline that considers both internal and external factors. Internal factors include your business needs, risk factors, and asset evaluation. External factors include industry benchmarks and regulatory standards. By following these steps and considerations, an organization can establish a security baseline for Power Platform that aligns with its business objectives, compliance requirements, and risk appetite. A security baseline can help an organization to maximize the benefits of Power Platform while minimizing the potential threats and challenges.

**Definitions**

| Term | Definition |
|---|---|
| Baseline | The minimum level of security affordances that a workload must have to avoid being exploited. |
| Benchmark | A standard that signifies the security posture that the organization aspires to. It's evaluated, measured, and improved over time. |
| Controls | Technical or operational controls on the workload that help prevent attacks and increase attacker costs. |
| Regulatory requirements | A set of business requirements, driven by industry standards, that laws and authorities impose. |

## Key design strategies

A security baseline is a guideline that describes the security requirements and features that the workload must meet to improve and maintain security. You can make a baseline more advanced by adding policies that you use to set boundaries. The baseline should be the standard that you use to measure your security level. Aim to always achieve the full baseline while covering a wide scope.

Create the baseline by gaining consensus among business and technical leaders. The baseline should include technical controls, but also operational aspects of managing and maintaining the security posture.

To establish a security baseline for Power Platform, consider the following key design strategies:

- Use the [Microsoft cloud security benchmark (MCSB)](/security/benchmark/azure/overview) as a reference framework. The MCSB is a comprehensive set of security best practices that covers various aspects of cloud security, such as identity and access management, data protection, network security, threat protection, and governance. You can use the MCSB to assess your current security posture and identify gaps and improvement areas.

- Customize the MCSB to suit your specific business needs, compliance requirements, and risk appetite. You might need to add, modify, or remove some of the MCSB controls based on your organizational context and objectives. For example, you might need to align your security baseline with industry standards (such as ISO 27001 or NIST 800-53) or regulatory frameworks (such as GDPR, the General Data Protection Regulation, or HIPAA, the Health Insurance Portability and Accountability Act) that are relevant to your domain or region.

- Define the scope and applicability of your security baseline for Power Platform. You should clearly specify which Power Platform components, features, and services are covered by your security baseline, and which ones are out of scope or require special considerations. For example, you might need to define different security requirements for different types of Power Platform environments (such as production, development, or sandbox), connectors (such as standard, custom, or premium), or apps (such as canvas, model-driven, or pages).

By following these design strategies, you can create a security baseline document for Power Platform that reflects your security goals and standards, and helps you protect your data and assets in the cloud.

As the workload changes and the environment grows, it’s important to keep your baseline updated with the changes to make sure the basic controls are still working.
Here are some recommendations for the process to create a security baseline:

- **Asset inventory**. Identify stakeholders of workload assets and the security objectives for those assets. In the asset inventory, classify by security requirements and criticality. For information about data assets, see [Data classification recommendations](data-classification.md).

- **Define tiers of workloads**. As you define your security baseline, it's important to consider how you'll categorize solutions built based on criticality so that you can develop processes that ensure that critical applications have the necessary guardrails to support them, while at the same time not stifling the innovation of productivity scenarios.

- **Risk assessment**. Identity potential risks associated with each asset and prioritize them.

- **Compliance requirements**. Baseline any regulatory or compliance for those assets and apply industry best practices.

- **Configuration standards**. Define and document specific security configurations and settings for each asset. If possible, create a template or find a repeatable, automated way to apply the settings consistently across the environment. Consider configurations at all levels. Start with tenant-level security configurations related to access or network. Then, consider Power Platform resource-specific security configurations such as specific Power Pages configurations, as well as workload specific security configurations, such as how the workload is shared.

- **Access control and authentication**. Specify the role-based access control (RBAC) and multifactor authentication (MFA) requirements. Document what just enough access means at the asset level. Always start with the principle of least privilege.

- **Documentation and communication**. Document all configurations, policies, and procedures. Communicate the details to the relevant stakeholders.

- **Enforcement and accountability**. Establish clear enforcement mechanisms and consequences for noncompliance with the security baseline. Hold individuals and teams accountable for maintaining security standards.

- **Continuous monitoring**. Assess the effectiveness of the security baseline through observability and make improvements overtime.

### Composition of a baseline

Here are some common categories that should be part of a baseline. The following list isn't exhaustive. It's intended as an overview of the document's scope

#### Regulatory compliance

Your design choices may be impacted by regulatory compliance requirements for specific industry segments or due to geographic restrictions. It’s key to understand the regulatory compliance requirements and include them in the architecture of your workload.

The baseline should include regular evaluation of the workload against regulatory requirements. Take advantage of platform-provided tools, such as Microsoft Power Advisor, which can identify areas of noncompliance. Work with your organization's compliance team to make sure all requirements are met and maintained.

##### Example

Life sciences organizations build solutions that must meet the requirements under Good Clinical, Laboratory, and Manufacturing Practices (GxP). You can take advantage of the cloud's efficiencies while also protecting patient safety, product quality, and data integrity. For more information, see the [Microsoft GxP guidelines for Dynamics 365 and Power Platform](/azure/compliance/offerings/offering-gxp#dynamics-365-and-power-platform-support-for-gxp-fda-21-cfr-part-11).

While there is no specific GxP certification for cloud service providers, Microsoft Azure (which hosts Power Platform) has undergone independent third-party audits for quality management and information security, including ISO 9001 and ISO/IEC 27,001 certifications. If you're deploying applications on Power Platform, consider the following steps:

- Determine the GxP requirements applicable to your computerized system based on its intended use.
- Follow internal procedures for qualification and validation processes to demonstrate compliance with GxP requirements.

#### Development processes

The baseline must have recommendations about:

- Power Platform resource types approved to be used.
- Monitoring the resources.
- Implementing logging and auditing capabilities.
- Sharing resources.
- Enforcing policies for using or configuring resources.
- Data protection and network security.

The development team needs to have a clear understanding of the scope for security checks, how to design and develop Power Platform solutions with security in mind, and of how to perform regular security assessments. For example, applying the principle of least privilege, separating development and production environments, using secure connectors and gateways, and validating user inputs and outputs are requirements in making sure that the workload is secure. Communicate how potential threats can be identified and be specific about how to perform checks.

For more information, see [Recommendations on threat analysis](threat-model.md).

The development process should also set standards on various testing methodologies. For more information, see [Recommendations on security testing](testing.md).

#### Operations

The baseline must include standards on how to detect threats and how to raise alerts on anomalous activities that indicate actual incidents.

The baseline should include recommendations for setting up incident response processes, including communication and a recovery plan, and note which of those processes can be automated to expedite detection and analysis. For examples, see [Microsoft cloud security benchmark: Incident response](/security/benchmark/azure/mcsb-incident-response).

Use industry standards to develop security incident and data breach plans, and ensure that the operations team has a comprehensive plan to follow when a breach is discovered. Check with your organization to see if there's coverage through cyberinsurance.

#### Training

Training is critical. Bear in mind that often those developing the applications aren't fully aware of security risks. If your organization does any training on how to build workloads with Power Platform, incorporate your security baseline into those efforts. Alternatively, if your organization conducts organization-wide security training, include your Power Platform security baseline in that training.

Your training should include education on tenant-wide guardrails and configurations that might impact the workloads that are being built. They also require training on configurations the makers need to make for their workloads, such as security roles and how to connect to data. Determine the process for collaborating with them on any requests they might have.

Develop and maintain a security training program to ensure the workload team is equipped with the appropriate skills to support the security goals and requirements. The team needs fundamental security training, and training about security concepts in Power Platform.

### Use the baseline

Use the baseline to drive initiatives and decisions. Here are some ways to use the baseline to drive improvements in your workload security posture:

- **Prepare design decisions**. Use the security baseline to understand the security requirements and expectations for your Power Platform workloads. Ensure team members are educated on the expectations before they start the architecture design. Prevent expensive adjustments during the implementation phase by ensuring team members are aware of the security baseline and their role in fulfilling security requirements. Use the security baseline as a workload requirement and design your workload within the boundaries and constraints defined by the baseline.

- **Measure your design**. Use the security baseline to assess your current security posture and identify gaps and improvement areas. Document any deviations that are deferred or deemed acceptable long-term, and clearly state any decisions made regarding deviations.

- **Drive improvements**. The security baseline defines your goals, but you may not be able to meet all of them immediately. Document any gaps and prioritize them based on importance. Clearly specify which gaps are acceptable in the short term or long term, and provide reasons for these decisions.

- **Track your progress against the baseline**. Monitor your security measures against the security baseline to identify trends and reveal deviations from the baseline. Use automation where possible, and use the data gathered from tracking the progress to identify and address current issues and prepare for future threats.

- **Set guardrails**. Use your security baseline to establish and manage guardrails and a governance framework for your Power Platform workloads. Guardrails enforce required security configurations, technologies, and operations, based on internal factors and external factors. Guardrails help minimize the risk of inadvertent oversight and punitive fines for noncompliance. You can use out of the box features in the Power Platform Admin Center and Managed Environments to establish guardrails, or build your own by using the CoE Starter Kit reference implementation or your own scripts/tooling. You'll likely use a combination of out-of-the-box and custom tools to set up your guardrails and governance framework. Think about which parts of your security baseline can be enforced proactively, and which ones you'll monitor reactively.

Explore Microsoft Purview for Power Platform, Power Advisor, built-in concepts in the Power Platform Admin Center like Data Policies and Tenant Isolation, and reference implementations like the CoE Starter Kit to implement and enforce security configurations and compliance requirements.

### Evaluate the baseline regularly

Continuously improve security standards towards the ideal state to ensure continual risk reduction. Keep track of the latest security updates in Power Platform by checking the [roadmap](/dynamics365/release-plans/) and announcements regularly. Then, identify which new features could enhance your security baseline and plan how to implement them. Any modifications to the baseline must be officially approved and go through the appropriate change management processes.

Measure the system against the new baseline and prioritize remediations based on their relevance and effect on the workload.

Ensure that the security posture doesn't degrade over time by instituting auditing and monitoring compliance with organizational standards.

## Security in Microsoft Power Platform

Power Platform is built on a strong foundation of security. It uses the same security stack that has positioned Azure as a trusted custodian of the world's most sensitive data, and integrates with Microsoft 365's most advanced information protection and compliance tools. Power Platform delivers end-to-end protection designed around our customers' most challenging concerns.

The Power Platform service is governed by the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31) and the [Microsoft Enterprise Privacy Statement](https://www.microsoft.com/privacystatement/OnlineServices/Default.aspx). For the location of data processing, refer to the Microsoft Online Services Terms and the [Data Protection Addendum](https://www.microsoft.com/download/details.aspx?id=101581).

The [Microsoft Trust Center](https://www.microsoft.com/trustcenter) is the primary resource for Power Platform compliance information. For more information, see [Microsoft Compliance Offerings](/compliance/regulatory/offering-home).

The Power Platform service follows the Security Development Lifecycle (SDL). The SDL is a set of strict practices that support security assurance and compliance requirements. For more information, see [Microsoft Security Development Lifecycle Practices](https://www.microsoft.com/securityengineering/sdl/practices).

## Power Platform facilitation

The Microsoft cloud security benchmark (MCSB) is a comprehensive security best-practice framework you can use as a starting point for your security baseline. Use it along with other resources that provide input to your baseline. For more information, see [Introduction to the Microsoft cloud security benchmark](/security/benchmark/azure/introduction).

The [Security page](/power-platform/admin/security/security-posture-overview) in the Power Platform admin center helps you to manage your organization's security with best practices and a comprehensive set of features to ensure maximum security. For example, to:

- **Assess your security status:** Understand and improve your organization's security policies to meet your specific needs.
- **Act on recommendations:** Identify and implement the most impactful recommendations to improve the assessment.
- **Set up proactive policies:** Use the rich set of tools and security capabilities available to gain deep visibility, detect threats, and proactively establish policies to help safeguard the organization from vulnerabilities and risks.

## Organizational alignment

Ensure the security baseline you establish for Power Platform is well aligned with your organization's security baselines. Work closely with IT security teams in your organization to leverage their expertise.

- [Security Baseline discipline overview](/azure/cloud-adoption-framework/govern/security-baseline/)
- [Security Baseline discipline template](/azure/cloud-adoption-framework/govern/security-baseline/template)

## Related information

- [Microsoft compliance](/compliance/)
- [Microsoft Power Platform security and governance documentation](/power-platform/admin/security)
- [Microsoft Copilot Studio security and governance documentation](/microsoft-copilot-studio/security-and-governance)
- [Microsoft Copilot Studio compliance offerings](/microsoft-copilot-studio/admin-certification)
- [Responsible AI FAQs for Microsoft Power Platform](/power-platform/responsible-ai-overview)
- [Responsible AI FAQs for Copilot Studio](/microsoft-copilot-studio/responsible-ai-overview)
- [Overview of the Microsoft cloud security benchmark](/security/benchmark/azure/overview)
- [What is incident response? Plan and steps](https://www.microsoft.com/security/business/security-101/what-is-incident-response)
- [Understand your security posture and challenges](/power-platform/guidance/adoption/assess-security-posture)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
