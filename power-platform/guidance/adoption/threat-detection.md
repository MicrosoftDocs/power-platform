---
title: Detect threats to your organization
description: Learn how to secure your Power Platform organization with activity logging, identity monitoring, and threat detection tools.
#customer intent: As a security analyst, I want to detect threats to my organization so that I can protect data and applications.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/01/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/01/2025
---

# Detect threats to your organization

As reliance on digital technology and AI integration to drive enterprise solutions grows, detecting threats becomes increasingly critical. Cybercrime is rising, with data breaches occurring more frequently each year.

Mitigate potential security incidents before they escalate into significant breaches by using effective threat detection. By implementing robust monitoring and alerting systems, you can quickly detect suspicious activities and respond promptly to protect data and applications.

This article outlines the threat detection capabilities you can use to effectively manage and secure Power Platform environments.

## Microsoft Sentinel

Microsoft Sentinel equips admins with a comprehensive security and monitoring solution that intelligently detects and responds to suspicious activities such as mass data deletion or app execution from unauthorized geographies.

The [Microsoft Sentinel](/azure/sentinel/business-applications/solution-overview) solution lets customers investigate detected threats and identify the suspicious app's name, its environment, the user who created or modified it, the users using it, and more. It helps organizations:

- Collect Power Platform activity logs, audits, and events into the Microsoft Sentinel workspace.
- Detect execution of suspicious, malicious, or illegitimate activities within Power Platform.
- Investigate threats detected in Power Platform and contextualize them with other user activities across the organization.
- Respond to Power Platform-related threats and incidents manually, automatically, or via a predefined workflow.

The Microsoft Sentinel solution includes [built-in threat coverage](/azure/sentinel/business-applications/power-platform-solution-security-content#built-in-analytics-rules) for the following scenarios commonly encountered in business applications:

- Power Apps activity from an unauthorized geographic location
- Access to malicious links through Power Apps
- Bulk deletion of Power Apps data
- Destruction of Power Apps data in Dataverse
- A new Power Platform connector in a sensitive environment
- Automated Power Automate activity by departing employees
- Change or removal of a Power Platform data loss prevention (DLP) policy

The SecOps team can use Microsoft Sentinel tools to investigate and respond to these incidents. The following screenshot shows an example of an incident: a Power Automate flow created by a fired employee.

:::image type="content" source="media/sentinel-example.png" alt-text="Screenshot of a Microsoft Sentinel incident showing a Power Automate cloud flow created by a fired employee.":::

After setting up Microsoft Sentinel to collect Power Platform data, use [threat detection rules](/azure/sentinel/threat-detection) to run regularly, query the collected data, and analyze it to discover threats. Start by using the [built-in analytics rules](/azure/sentinel/business-applications/power-platform-solution-security-content#built-in-analytics-rules) to create these rules. The rules generate alerts when they detect specific conditions. Alerts are aggregated into incidents that you can assign and investigate. You can also build predetermined, automated responses into the rules' configuration.

Learn more:

- [Connect Microsoft Power Platform to Microsoft Sentinel](/azure/sentinel/business-applications/deploy-power-platform-solution)
- [Review the security content reference for Microsoft Power Platform](/azure/sentinel/business-applications/power-platform-solution-security-content)
- [Configure threat detection rules](/azure/sentinel/threat-detection)

## Identity

Monitor identity-related risk events on potentially compromised identities and remediate those risks. Review the reported risk events using:

- Microsoft Entra ID reporting. Learn more in [What is Identity Protection?](/azure/active-directory/reports-monitoring/concept-user-at-risk) and [Identity Protection](/azure/active-directory/active-directory-identityprotection).

- Identity Protection risk detection API to get programmatic access to security detections through Microsoft Graph. Learn more in [riskDetection](/graph/api/resources/riskdetection) and [riskyUser](/graph/api/resources/riskyuser).

Microsoft Entra ID uses adaptive machine learning algorithms, heuristics, and known compromised credentials (username and password pairs) to detect suspicious actions related to your user accounts. These username and password pairs are surfaced by monitoring the public and dark web, and by working with security researchers, law enforcement, security teams at Microsoft, and others.

## Activity logging

[Power Apps](/power-platform/admin/logging-powerapps), [Power Automate](/power-platform/admin/logging-power-automate), [Copilot Studio](/microsoft-copilot-studio/admin-logging-copilot-studio), [Connectors](/power-platform/admin/connector-events-power-platform), [Power Pages](/power-platform/admin/logging-power-pages), [Data Loss Prevention](/power-platform/admin/dlp-activity-logging), and [Power Platform administrative](/power-platform/admin/admin-activity-logging) activity logging are tracked and viewed from Microsoft Purview. Learn more in [Learn about Microsoft Purview](/purview/purview).

[Dataverse auditing](/power-platform/admin/manage-dataverse-auditing) logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or the SDK in an environment. This auditing is enabled at the environment level, and additional configuration is required for individual tables and columns.

Microsoft Power Platform admins use applications like [Microsoft Defender](/defender-endpoint/) or [Microsoft Sentinel](/azure/sentinel/business-applications/solution-overview) to monitor certain types of security threats and build audit reports using available APIs.

Continuous, holistic threat detection and the ability to apply preventative guardrails are essential for enabling frictionless productivity while minimizing cyber risk.

## Threat analysis

A comprehensive analysis to identify threats, attacks, vulnerabilities, and counter measures is crucial during the design phase of a workload. Threat modeling is an engineering exercise that includes defining security requirements, identifying and mitigating threats, and validating those mitigations. You can use this technique at any stage of application development or production, but it's most effective during the design stages of new functionality.

Learn more: [Recommendations for threat analysis](/power-platform/well-architected/security/threat-model#power-platform-facilitation)

## Next steps

Review the other articles in this series to further enhance your security posture:

- [Establish data protection and privacy controls](data-protection.md)
- [Implement a DLP strategy](dlp-strategy.md)
- [Configure identity and access management](conditional-access.md)
- [Meet compliance requirements](compliance.md)
- [Secure the default environment](secure-default-environment.md)

[!INCLUDE [guidance-adoption-security-review.checklist](../../includes/guidance-adoption-security-review.checklist.md)]
