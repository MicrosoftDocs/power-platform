---
title: Recommendations for establishing a security baseline
description: Learn about hardening resources recommendations for security. Reduce the attack surface and increase attackers' costs in the remaining area to limit the opportunities for malicious actors to exploit vulnerabilities.
author: RobStand
ms.author: mapichle
ms.reviewer: sericks
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for establishing a security baseline

This guide describes the recommendations for establishing a security baseline for developing workloads with Microsoft Power Platform. A security baseline is a set of minimum-security standards and best practices that an organization applies to its IT systems and services. A security baseline helps to reduce the risk of cyberattacks, data breaches, and unauthorized access. A security baseline also helps to ensure consistency, accountability, and auditability across the organization.

A good security baseline helps you:

- Reduce the risk of cyberattacks, data breaches, and unauthorized access.
- Ensure consistency, accountability, and auditability across the organization. 
- Keep your data and systems secure.
- Comply with regulatory requirements.
- Minimize risk of oversight.

Security baselines should be published widely throughout your organization so that all stakeholders are aware of the expectations.

Establishing a security baseline for Microsoft Power Platform involves several steps and considerations, such as:

- Understanding the architecture and components of Power Platform, such as environments, connectors, Dataverse, Power Apps, and Power Automate.
- Reviewing the licensing and pricing options for Power Platform and choosing the appropriate plan for each user and scenario.
- Configuring the security settings and roles for Power Platform at the tenant, environment and resource level – such as Data Loss Prevention policies, environment permissions, and security groups.
- Leveraging Microsoft Entra ID to manage user identities, authentication, and authorization for Power Platform, and integrating with other Entra ID features such as conditional access and multi-factor authentication.
- Applying data protection and encryption methods to secure the data stored and processed by Power Platform, such as sensitivity labels, and customer-managed keys.
- Monitoring and auditing the activities and usage of Power Platform, using tools such as the Power Platform Admin Center, the Power Platform Center of Excellence (CoE) Starter Kit, and Azure Sentinel.
- Implementing governance policies and processes for Power Platform, such as defining the roles and responsibilities of different stakeholders, establishing approval workflows and change management, and providing guidance and training for users and developers.

This guide helps you set a security baseline that considers both internal and external factors. Internal factors include your business needs, risk factors and asset evaluation. External factors include industry benchmarks and regulatory standards. By following these steps and considerations, an organization can establish a security baseline for Microsoft Power Platform that aligns with its business objectives, compliance requirements, and risk appetite. A security baseline can help an organization to maximize the benefits of Power Platform while minimizing the potential threats and challenges.

**Definitions**

| Term | Definition |
|---|---|
| Baseline | The minimum level of security affordances that a workload must have to avoid being exploited. |
| Benchmark | A standard that signifies the security posture that the organization aspires to. It's evaluated, measured, and improved over time. |
| Controls | Technical or operational controls on the workload help prevent attacks and increase attacker costs. |
| Regulatory requirements | A set of business requirements, driven by industry standards, that laws and authorities impose. |

## Key design strategies

A security baseline is a document that describes the security requirements and features that the workload must meet to improve security. You can make a baseline more advanced by adding policies that you use to set boundaries. The baseline should be the standard that you use to measure your security level. You should always aim to achieve the full baseline while covering a wide scope.

Create the baseline by gaining consensus among business and technical leaders. The baseline should include technical controls, but also operational aspects of managing and maintaining the security posture.

To establish a security baseline for Microsoft Power Platform, you need to consider the following key design strategies:

**Use the Microsoft cloud security benchmark (MCSB) as a reference framework.** The MCSB is a comprehensive set of security best practices that cover various aspects of cloud security, such as identity and access management, data protection, network security, threat protection, and governance. You can use the MCSB to assess your current security posture and identify gaps and improvement areas.

**Customize the MCSB to suit your specific business needs, compliance requirements, and risk appetite.** You may need to add, modify, or remove some of the MCSB controls based on your organizational context and objectives. For example, you may need to align your security baseline with industry standards (such as ISO 27001 or NIST 800-53) or regulatory frameworks (such as GDPR or HIPAA) that are relevant to your domain or region.

**Define the scope and applicability of your security baseline for Power Platform.** You should clearly specify which Power Platform components, features, and services are covered by your security baseline, and which ones are out of scope or require special considerations. For example, you may need to define different security requirements for different types of Power Platform environments (such as production, development, or sandbox), connectors (such as standard, custom, or premium), or apps (such as canvas, model-driven, or portal).

By following these design strategies, you can create a security baseline document for Microsoft Power Platform that reflects your security goals and standards, and helps you protect your data and assets in the cloud.

As the workload changes and the environment grows, it’s important to keep your baseline updated with the changes to make sure the basic controls are still working. .

Here are some recommendations for the process to create a security baseline:

**Asset inventory**. Identify stakeholders of workload assets and the security objectives for those assets. In the asset inventory, classify by security requirements and criticality. For information about data assets, see [link to data classification recommendation].

**Define tiers of workloads**. As you define your security baseline, it's important to consider how you will categorize solutions built based on criticality—this will allow you to come up with processes that ensure that critical applications have the necessary guardrails to support them while at the same time not stifling the innovation of productivity scenarios.

**Risk assessment**. Identity potential risks associated with each asset and prioritize them.

**Compliance requirements**. Baseline any regulatory or compliance for those assets and apply industry best practices.

**Configuration standards**. Define and document specific security configurations and settings for each asset. If possible, templatize or find a repeatable, automated way to apply the settings consistently across the environment.

**Access control and authentication**. Specify the role-based access control (RBAC) and multifactor authentication (MFA) requirements. Document what _just enough access_ means at the asset level. Always start with the principle of least privilege.

**Documentation and communication**. Document all configurations, policies, and procedures. Communicate the details to the relevant stakeholders.

**Enforcement and accountability**. Establish clear enforcement mechanisms and consequences for noncompliance with the security baseline. Hold individuals and teams accountable for maintaining security standards.

**Continuous monitoring**. Assess the effectiveness of the security baseline through observability and make improvements overtime.

### Composition of a baseline

Here are some common categories that should be part of a baseline. The following list isn't exhaustive. It's intended as an overview of the document's scope.

#### Regulatory compliance

Your design choices may be impacted by regulatory compliance requirements for specific industry segments or due to geographic restrictions. It’s key to understand the regularly compliance requirements and include them in the architecture of your workload. 

The baseline should include regular evaluation of the workload against regulatory requirements. Take advantage of platform-provided tools, such as Microsoft Power Platform Security Center and Microsoft Power Advisor which can identify areas of noncompliance. Work with your organization's compliance team to make sure all requirements are met and maintained.

Example of regulatory compliance is GxP: 

<https://servicetrust.microsoft.com/DocumentPage/fb579b09-0874-4197-a97e-a25992383482> 

#### Architecture components

The baseline needs prescriptive recommendations for the main components of the workload. These usually include technical controls for networking, identity, and data. 

Refer to [Example](https://learn.microsoft.com/azure/well-architected/security/establish-baseline?branch=main).

#### Development processes

The baseline must have recommendations about:

Power Platform resource types approved to be used. 

Monitoring the resources.

Implementing logging and auditing capabilities. 

Sharing resources. 

Enforcing policies for using or configuring resources.

The development team needs to have a clear understanding of the scope for security checks, and of how to design and develop Power Platform solutions with security in mind. For example, applying the principle of least privilege, separating development and production environments, using secure connectors and gateways, and validating user inputs and outputs are requirements in making sure that the workload is secure. Communicate how potential threats can be identified, and be specific about how to perform checks.

The development process should also set standards on various testing methodologies. For more information, see [link to security testing recommendation]

#### Operations

The baseline must include standards on how to detect threats and how to raise alerts on anomalous activities that indicate actual incidents.  

The baseline should include recommendations for setting up incident response processes, including communication and a recovery plan, and which of those processes can be automated to expedite detection and analysis. For examples, see [Microsoft cloud security benchmark - Incident Response](https://learn.microsoft.com/security/benchmark/azure/mcsb-incident-response).

Use industry standards to develop security incident and data breach plans, and ensure that the operations team has a comprehensive plan to follow when a breach is discovered. Check with your organization to see if there's coverage through cyberinsurance.

#### Training

This category is one of the most important items because, in many cases, those building the applications just aren’t aware of the risks you are concerned about. If your organization does any training on how to build workloads with Power Platform, you could incorporate your security baseline into those efforts. Or, if your organization does any organization wide security training, you could also incorporate your Power Platform security baseline there. 

Your training should include education on tenant wide guardrails and configurations that might impact the workloads that are being built, as well as training on configurations the maker needs to make for their workload – such as security roles and how to connect to data. Establish how you will collaborate with them on any requests they may have.

Develop and maintain a security training program to ensure the workload team is equipped with the appropriate skills to support the security goals and requirements. The team needs fundamental security training, and training about security concepts in Microsoft Power Platform. 

### Use the baseline

Use the baseline to drive initiatives, such as:

**Prepare design decisions**. Use the security baseline to understand the security requirements and expectations for your Power Platform workloads. Ensure team members are educated on the expectations before they start the architecture design. Avoid costly rework during the implementation phase which can be caused if team members aren’t aware of the security baseline and the role they play in meeting security requirements. Use the security baseline as a workload requirement and design your workload within the boundaries and constraints defined by the baseline. 

**Measure your design**. Use the security baseline to assess your current security posture and identify gaps and improvement areas. Document any deviations that are deferred or deemed long-term acceptable, and clearly state any decisions made on deviations. 

**Drive improvements**. The security baseline will define your goals, but you may not be able to meet all of them immediately. Document any gaps and prioritize them based on importance. Clearly define what gaps are acceptable short-term or longer-term and why. 

**Track your progress against the baseline**. Monitor your security measures against the security baseline to identify trends and reveal deviations from the baseline. Use automation where possible, and use the data gathered from tracking the progress to identify and address current issues and prepare for future threats. 

**Set guardrails**. Use your security baseline to establish and manage guardrails and a governance framework for your Power Platform workloads. Guardrails enforce required security configurations, technologies, and operations, based on internal factors and external factors. Guardrails help minimize the risk of inadvertent oversight and punitive fines for noncompliance. You can use out of the box features in the Power Platform Admin Center and Managed Environments to establish guardrails, or build your own by using the CoE Starter Kit reference implementation or your own scripts/tooling. Likely, you will use a combination of out of the box and custom tools to establish your guardrails and governance framework. Think about which parts of your security baseline can be enforced proactively, and which ones you will monitor reactively. 

Explore Microsoft Purview for Power Platform, Microsoft Power Platform Security Center, built-in concepts in the Power Platform Admin Center like Data Policies and Tenant Isolation and reference implementations like the CoE Starter Kit to implement and enforce security configurations and compliance requirements.

### Evaluate the baseline regularly

Continuously improve security standards towards the ideal state to ensure continual risk reduction. Stay up to date with security enhancements coming to Microsoft Power Platform by following the [roadmap](https://learn.microsoft.com/dynamics365/release-plans/) and announcements, and evaluate which new features are relevant to your security baseline and how you will implement them. Any change to the baseline must be formal, agreed upon, and sent through proper change management processes.

Measure the system against the new baseline and prioritize remediations based on their relevance and effect on the workload.

Ensure that the security posture doesn't degrade over time by instituting auditing and monitoring compliance with organizational standards.

## Security in Microsoft Power Platform

Power Platform builds on this strong foundation. It uses the same security stack that earned Azure the right to serve and protect the world's most sensitive data, and integrates with Microsoft 365's most advanced information protection and compliance tools. Power Platform delivers end-to-end protection designed around our customers' most challenging concerns.

The Power Platform service is governed by the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31) and the [Microsoft Enterprise Privacy Statement](https://www.microsoft.com/privacystatement/OnlineServices/Default.aspx). For the location of data processing, refer to the Microsoft Online Services Terms and the [Data Protection Addendum](https://www.microsoft.com/download/details.aspx?id=101581).

The [Microsoft Trust Center](https://www.microsoft.com/trustcenter) is the primary resource for Power Platform compliance information. Learn more at [Microsoft Compliance Offerings](https://learn.microsoft.com/compliance/regulatory/offering-home).

The Power Platform service follows the Security Development Lifecycle (SDL). The SDL is a set of strict practices that support security assurance and compliance requirements. Learn more at [Microsoft Security Development Lifecycle Practices](https://www.microsoft.com/securityengineering/sdl/practices).

## Power Platform facilitation

The Microsoft cloud security benchmark (MCSB) is a comprehensive security best practice framework that you can use as a starting point for your security baseline. Use it along with other resources that provide input to your baseline.

For more information, see [Introduction to the Microsoft cloud security benchmark](https://learn.microsoft.com/security/benchmark/azure/introduction).

Use the Microsoft Power Platform Security Center regulatory compliance dashboard to track those baselines and be alerted if a pattern outside of a baseline is detected. 

## Example

This logical diagram shows an example security baseline for architectural components that encompass network, infrastructure, endpoint, application, data, and identity to demonstrate how a common IT environment may be securely protected. Other recommendation guides build on this example.

**Infrastructure**

A common IT environment, with an on-premises layer with basic resources.

**Azure Security services**

Azure security services and features by the types of resources they protect.

**Azure security monitoring services**

The monitoring services available on Azure that go beyond simple monitoring services, including security information event management (SIEM) and security orchestration automated response (SOAR) solutions and Microsoft Defender for Cloud.

**Threats**

This layer brings a recommendation and reminder that threats may be mapped according to your organization's concerns regarding threats, regardless of the methodology or matrix-like Mitre Attack Matrix or Cyber Kill chain.

## Organizational alignment

Ensure the security baseline you establish for Microsoft Power Platform is well aligned with your organization’s security baselines. Work closely with IT security teams (??) in your organization to leverage their learnings. 

Cloud Adoption Framework provides guidance for central teams about establishing a baseline with a suggested template:

[Security Baseline discipline overview](https://learn.microsoft.com/azure/cloud-adoption-framework/govern/security-baseline/)

[Security Baseline discipline template](https://learn.microsoft.com/azure/cloud-adoption-framework/govern/security-baseline/template)

## Related links

- [Microsoft Compliance | Microsoft Learn](https://learn.microsoft.com/compliance/?branch=main)
- [Microsoft Power Platform security and governance documentation - Power Platform | Microsoft Learn](https://learn.microsoft.com/power-platform/admin/security)
- [Overview of the Microsoft cloud security benchmark | Microsoft Learn](https://learn.microsoft.com/security/benchmark/azure/overview?branch=main)



**Applies to Power Well-Architected Security checklist recommendation:** 

|[SE:01](checklist.md)| Establish a security baseline aligned to compliance requirements, industry standards, and platform recommendations. Regularly measure your workload architecture and operations against the baseline to sustain or improve your security posture over time.|
|---|---|

This guide describes the recommendations for establishing a security baseline for developing workloads with Microsoft Power Platform. A security baseline is a set of minimum-security standards and best practices that an organization applies to its IT systems and services. A security baseline helps to reduce the risk of cyberattacks, data breaches, and unauthorized access. A security baseline also helps to ensure consistency, accountability, and auditability across the organization.

A good security baseline helps you:

- Keep your data and systems secure.
- Comply with regulatory requirements.
- Minimize risk of oversight.
- Reduce the likelihood of breaches and subsequent business effects.

Security baselines should be published widely throughout your organization so that all stakeholders are aware of the expectations.

This guide provides recommendations about setting a security baseline that's based on internal and external factors. Internal factors include business requirements, risks, and asset evaluation. External factors include industry benchmarks and regulatory standards.

**Definitions** 

| Term | Definition |
|---|---|
| Baseline | The minimum level of security affordances that a workload must have to avoid being exploited. |
| Benchmark | A standard that signifies the security posture that the organization aspires to. It's evaluated, measured, and improved over time. |
| Controls | Technical or operational controls on the workload that help prevent attacks and increase attacker costs. |
| Regulatory requirements | A set of business requirements, driven by industry standards, that laws and authorities impose. |

## Key design strategies

A security baseline is a structured document that defines a set of security criteria and capabilities that the workload must fulfill in order to increase security. In a more mature form, you can extend a baseline to include a set of policies that you use to set guardrails.

The baseline should be considered the standard for measuring your security posture. The goal should always be full attainment while keeping a broad scope.

Your security baseline should never be an ad-hoc effort. Industry standards, compliance (internal or external) or regulatory requirements, regional requirements, and the cloud platform benchmarks are main drivers for the baseline. Examples include Center for Internet Security (CIS) Controls, National Institute of Standards and Technology (NIST), and platform-driven standards, such as Microsoft cloud security benchmark (MCSB). All of these standards are considered a starting point for your baseline. Build the foundation by incorporating security requirements from the business requirements.

For links to the preceding assets, see [Related links](#related-links).

Create the baseline by gaining consensus among business and technical leaders. The baseline shouldn't be restricted to technical controls. It should also include the operational aspects of managing and maintaining the security posture. So, the baseline document also serves as the organization's commitment to investment toward workload security. The security baseline document should be distributed widely within your organization to ensure there's awareness about the workload's security posture.

As the workload grows and the ecosystem evolves, it's vital to keep your baseline in synch with the changes to ensure the fundamental controls are still effective.

Creating a baseline is a methodical process. Here are some recommendations about the process:

- **Asset inventory**. Identify stakeholders of workload assets and the security objectives for those assets. In the asset inventory, classify by security requirements and criticality. For information about data assets, see [Recommendations on data classification](data-classification.md).

- **Risk assessment**. Identity potential risks associated with each asset and prioritize them.

- **Compliance requirements**. Baseline any regulatory or compliance for those assets and apply industry best practices.

- **Configuration standards**. Define and document specific security configurations and settings for each asset. If possible, templatize or find a repeatable, automated way to apply the settings consistently across the environment.

- **Access control and authentication**. Specify the role-based access control (RBAC) and multifactor authentication (MFA) requirements. Document what *just enough access* means at the asset level. Always start with the principle of least privilege.

- **Patch management**. Apply latest versions on all the resource types to strengthen against attack.

- **Documentation and communication**. Document all configurations, policies, and procedures. Communicate the details to the relevant stakeholders.

- **Enforcement and accountability**. Establish clear enforcement mechanisms and consequences for noncompliance with the security baseline. Hold individuals and teams accountable for maintaining security standards.

- **Continuous monitoring**. Assess the effectiveness of the security baseline through observability and make improvements overtime.

### Composition of a baseline

Here are some common categories that should be part of a baseline. The following list isn't exhaustive. It's intended as an overview of the document's scope.

#### Regulatory compliance

A workload might be subject to regulatory compliance for specific industry segments, there might be some geographic restrictions, and so on. It's key to understand the requirements as given in the regulatory specifications because those influence the design choices and in some cases must be included in the architecture. 

The baseline should include regular evaluation of the workload against regulatory requirements. Take advantage of the platform-provided tools, such as Microsoft Defender for Cloud, which can identify areas of noncompliance. Work with the organization's compliance team to make sure all requirements are met and maintained.

#### Architecture components

The baseline needs prescriptive recommendations for the main components of the workload. These usually include technical controls for networking, identity, compute, and data. Reference the security baselines provided by the platform and add the missing controls to the architecture.

> Refer to [Example](#example).

#### Development processes

The baseline must have recommendations about:

- System classification.
- The approved set of resource types.
- Tracking the resources.
- Enforcing policies for using or configuring resources.

The development team needs to have a clear understanding of the scope for security checks. For example, threat modeling is a requirement in making sure that potential threats are identified in code and in deployment pipelines. Be specific about static checks and vulnerability scanning in your pipeline and how regularly the team needs to perform those scans.  

For more information, see [Recommendations on threat analysis](threat-model.md).

The development process should also set standards on various testing methodologies and their cadence. For more information, see [Recommendations on security testing](test.md).

#### Operations

The baseline must set standards on using threat detection capabilities and raising alerts on anomalous activities that indicate actual incidents. Threat detection needs to include all layers of the workload, including all the endpoints that are reachable from hostile networks.

The baseline should include recommendations for setting up incident response processes, including communication and a recovery plan, and which of those processes can be automated to expedite detection and analysis. For examples, see [Security baselines for Azure overview](/security/benchmark/azure/security-baselines-overview).

The incident response should also include a recovery plan and the requirements for that plan, such as resources for regularly taking and protecting backups.

You develop data breach plans by using industry standards and recommendations provided by the platform. The team then has a comprehensive plan to follow when a breach is discovered. Also, check with your organization to see if there's coverage through cyberinsurance.

#### Training

Develop and maintain a security training program to ensure the workload team is equipped with the appropriate skills to support the security goals and requirements. The team needs fundamental security training, but use what you can from your organization to support specialized roles. Role-based security training compliance and participation in drills are part of your security baseline.

### Use the baseline

Use the baseline to drive initiatives, such as:

- **Preparedness toward design decisions**. Create the security baseline and publish it before you start the architecture design process. Ensure team members are fully aware of your organization's expectations early, which avoids costly rework caused by a lack of clarity. You can use baseline criteria as workload requirements that the organization has committed to and design and validate controls against those constraints.  

- **Measure your design**. Grade the current decisions against the current baseline. The baseline sets actual thresholds for criteria. Document any deviations that are deferred or deemed long-term acceptable.

- **Drive improvements**. While the baseline sets attainable goals, there are always gaps. Prioritize the gaps in your backlog and remediate based on prioritization.

- **Track your progress against the baseline**. Continuous monitoring of security measures against a set baseline is essential. Trend analysis is a good way of reviewing security progress over time and can reveal consistent deviations from the baseline. Use automation as much as possible, pulling data from various sources, internal and external, to address current issues and prepare for future threats.

- **Set guardrails**. Where possible, your baseline criteria must have guardrails. Guardrails enforce required security configurations, technologies, and operations, based on internal factors and external factors. Internal factors include business requirements, risks, and asset evaluation. External factors include benchmarks, regulatory standards, and threat environment. Guardrails help minimize the risk of inadvertent oversight and punitive fines for noncompliance.

Explore Azure Policy for custom options or use built-in initiatives like CIS benchmarks or Azure Security Benchmark to enforce security configurations and compliance requirements. Consider creating Azure Policies and initiatives out of baselines.

### Evaluate the baseline regularly

Continuously improve security standards incrementally towards the ideal state to ensure continual risk reduction. Conduct periodic reviews to ensure that the system is up-to-date and in compliance with external influences. Any change to the baseline must be formal, agreed upon, and sent through proper change management processes.

Measure the system against the new baseline and prioritize remediations based on their relevance and effect on the workload.

Ensure that the security posture doesn't degrade over time by instituting auditing and monitoring compliance with organizational standards.

## Azure facilitation

The Microsoft cloud security benchmark (MCSB) is a comprehensive security best practice framework that you can use as a starting point for your security baseline. Use it along with other resources that provide input to your baseline.

For more information, see [Introduction to the Microsoft cloud security benchmark](/security/benchmark/azure/introduction).

Use the Microsoft Defender for Cloud (MDC) regulatory compliance dashboard to track those baselines and be alerted if a pattern outside of a baseline is detected. For more information, see the [Customize the set of standards in your regulatory compliance dashboard](/azure/defender-for-cloud/update-regulatory-compliance-packages).

Other features that help in establishing and improving the baseline:

- [Create custom Azure security policies](/azure/defender-for-cloud/custom-security-policies?pivots=azure-portal)

- [Understand security policies, initiatives, and recommendations](/azure/defender-for-cloud/security-policy-concept)

- [Regulatory compliance checks](/azure/defender-for-cloud/regulatory-compliance-dashboard)

## Example

This logical diagram shows an example security baseline for architectural components that encompass network, infrastructure, endpoint, application, data, and identity to demonstrate how a common IT environment may be securely protected. Other recommendation guides build on this example.

:::image type="content" source="images/baseline/security-baseline.svg" alt-text="Diagram that shows an example of an organization's security baseline IT environment with architecture components." lightbox="images/baseline/security-baseline.svg":::

**Infrastructure**

A common IT environment, with an on-premises layer with basic resources.

**Azure Security services**

Azure security services and features by the types of resources they protect.

**Azure security monitoring services**

The monitoring services available on Azure that go beyond simple monitoring services, including  security information event management (SIEM) and security orchestration automated response (SOAR) solutions and Microsoft Defender for Cloud.

**Threats**

This layer brings a recommendation and reminder that threats may be mapped according to your organization's concerns regarding threats, regardless of the methodology or matrix-like Mitre Attack Matrix or Cyber Kill chain.

## Organizational alignment

Cloud Adoption Framework provides guidance for central teams about establishing a baseline with a suggested template:

- [Security Baseline discipline overview](/azure/cloud-adoption-framework/govern/security-baseline/)

- [Security Baseline discipline template](/azure/cloud-adoption-framework/govern/security-baseline/template)

## Related links

- [Microsoft compliance](/compliance/)

- [Security baselines for Azure overview](/security/benchmark/azure/security-baselines-overview)

- [What is incident response? Plan and steps](https://www.microsoft.com/security/business/security-101/what-is-incident-response)

- [Azure Security benchmarks](/security/benchmark/azure/overview)

## Community links

- [CIS Microsoft Azure Foundations Benchmark](https://www.cisecurity.org/benchmark/azure/)

- [Cybersecurity framework | NIST](https://www.nist.gov/cyberframework)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)