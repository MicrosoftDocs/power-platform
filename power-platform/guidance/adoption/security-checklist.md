---
title: Security checklist for key activities to secure your Power Platform environment
description: Secure your Power Platform environment with this comprehensive checklist covering data protection, threat detection, identity management, and compliance best practices.
#customer intent: As a Power Platform admin, I want to understand the key activities to secure my Power Platform environment so that I can protect my organization's data and applications.
author: manuelap-msft
ms.component: pa-admin
ms.topic: checklist
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/14/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/02/2025
---

# Security checklist for key activities to secure your Power Platform environment

This article provides a security checklist for key activities essential to maintaining a secure Power Platform environment. It summarizes the articles in this section into an action plan and covers activities such as data protection, threat detection, identity and access management, and compliance with regulatory standards. By following this checklist, administrators and security professionals can ensure that their Power Platform deployments are robust, resilient, and aligned with best practices. Whether you're setting up new environments or enhancing existing ones, this guide helps you implement effective security measures to protect your organization's data and applications.

## Security posture management

| Done? | Task |
| :-----: | ---- |
| &check; | Understand the responsibilities of the service provider as a data processor and the customer responsibilities as the owner and data controller. Make sure both sides comply with the relevant laws and regulations. Familiarize yourself with Power Platform's architecture, including environments, connectors, Dataverse, Power Apps, Power Automate, and Copilot Studio. |
| &check; | Understand your security requirements and assess your existing security measures, tools, and practices to identify gaps and areas for improvement. Create a security baseline aligned with compliance requirements and industry standards. |
| &check; | Review the Security page in the Power Platform Admin Center and assess recommended actions to improve the security score. |
| &check; | Educate makers and developers on security, compliance, and privacy best practices. Ensure training materials are easily accessible through a central source like a SharePoint site or wiki. |
| &check; | Define and test incident response plans. Ensure clear roles and responsibilities for handling security incidents. |
| &check; | Regularly review and update security policies to adapt to changing threats and business needs. |

## Threat protection

| Done? | Task |
| :-----: | ---- |
| &check; | Use the Power Platform Admin Center and Microsoft Sentinel to track user activities. Conduct regular audits to detect anomalies and ensure compliance. |
| &check; | Configure Microsoft Sentinel and set up alerts for suspicious activities and policy violations. |
| &check; | Monitor identity-related risk events on potentially compromised identities and remediate those risks |
| &check; | Investigate security incidents thoroughly to understand the root cause and impact. Use the findings to improve threat detection and response strategies. |
|  &check; | Define and test incident response plans. Define clear roles and responsibilities for handling security incidents. |

## Data protection and privacy

| Done? | Task |
| :-----: | ---- |
| &check; | Create data policies to control data flow between connectors and environments. Regularly review and update data policies to align with security requirements. |
| &check; | Consider using customer-managed keys for additional control over encryption. |
| &check; | Incorporate privacy considerations into the design and development of applications. Ensure privacy is a fundamental aspect of your development process.|
| &check; | Configure tenant isolation to control and restrict data access between different tenants. |
| &check; | Evaluate and configure network security features like IP firewall and Virtual Network. |
| &check; | Set up Microsoft Purview to discover, classify, and manage sensitive data across your Power Platform environment. |
| &check; | Use Dataverse's built-in RBAC security model to manage user permissions and access to data effectively. Implement field-level security, hierarchical security, and team-based security to enhance data protection. |

## Identity and access management

| Done? | Task |
| :-----: | ---- |
| &check; | Create an identity management strategy that covers user access, service accounts, application users, federation requirements for single sign-on, and conditional access policies. |
| &check; | Create administrative access policies for different admin roles on the platform, such as service admin and Microsoft 365 admin. |
| &check; | Have the necessary controls to manage access to specific environments. |
| &check; | Assign roles and permissions based on the principle of least privilege. Use security roles to manage access efficiently. | 

## Compliance

| Done? | Task |
| :-----: | ---- |
| &check; | Determine which regulatory standards apply to your organization (for example, GDPR, HIPAA, CCPA, PCI Data Security Standard). Understand the specific requirements and obligations of each regulation. |
| &check; | Use the Power Platform admin center and Microsoft Sentinel to track user activities. Conduct regular audits to detect anomalies and ensure compliance with regulatory standards. |
| &check; | Educate makers and developers on regulatory requirements and compliance best practices. |
| &check; | Maintain detailed records of compliance efforts, including policies, procedures, and audit logs. Ensure documentation is up to date and readily available for regulatory audits.|

## Workload security

| Done? | Task |
| :-----: | ---- |
| &check; | Apply security guidance to your architecture to guard confidentiality, integrity, and availability of your data and systems. Review [security recommendations](/power-platform/well-architected/security/) of the Power Platform Well-Architected guidance to ensure your workload is resilient to attacks and incorporates the interrelated security principles of confidentiality, integrity, and availability (also known as the CIA triad) in addition to meeting business goals. |
