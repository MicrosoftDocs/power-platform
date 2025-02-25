---
title:  Detect threats to your organization
description: Detect threats to your Power Platform organization with our comprehensive guide. Learn how to use Microsoft Sentinel for effective threat detection and response.
#customer intent: As a Power Platform user, I want to detect threats to my organization so that I can protect data and applications.
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 02/28/2025
---

# Detect threats to your organization

As dependency on digital technology and integration with AI to fuel enterprise solutions grow, the importance of detecting threats can't be overstated. Cybercrime is on the rise, with the frequency of data breaches reaching new all-time highs year after year.

Mitigate potential security incidents before they escalate into significant breaches with effective threat detection. By implementing robust monitoring and alerting systems, you can quickly detect suspicious activities and respond promptly to protect your data and applications.

This article outlines the threat detection capabilities you can use to effectively manage and secure your Power Platform environments.

## Microsoft Sentinel

Microsoft Sentinel equips admins with a comprehensive security and monitoring solution that intelligently detects and responds to suspicious activities such as mass data deletion or app execution from unauthorized geographies.

The [Microsoft Sentinel](azure/sentinel/business-applications/solution-overview) solution lets customers investigate detected threats and understand the name of the suspicious app, the environment it belongs to, the user who created or modified the app, the users using the app, and more. It helps organizations:

- Collect Microsoft Power Platform and Power Apps activity logs, audits, and events into the Microsoft Sentinel workspace.
- Detect execution of suspicious, malicious, or illegitimate activities within Microsoft Power Platform and Power Apps.
- Investigate threats detected in Microsoft Power Platform and Power Apps and contextualize them with another user activities across the organization.
- Respond to Microsoft Power Platform-related and Power Apps-related threats and incidents manually, automatically, or via a predefined workflow.

The Microsoft Sentinel solution includes [built-in threat coverage](/azure/sentinel/business-applications/power-platform-solution-security-content#built-in-analytics-rules) for the following scenarios that commonly encountered in business applications:

- Power Apps activity from an unauthorized geographic location
- Access to malicious links through Power Apps
- Bulk deletion of Power Apps data
- Destruction of Power Apps data in Dataverse
- A new Power Platform connector in a sensitive environment
- Automated Power Automate activity by departing employees
- Change or removal of a Power Platform Data Loss Prevention (DLP) policy

The SecOps team can use the Microsoft Sentinel tools to investigate and respond to these incidents. The following screenshot shows an example of such an incident, a Power Automate flow that was created by a fired employee:

After setting up Microsoft Sentinel to collect Power Platform data, you can use [threat detection rules](/azure/sentinel/threat-detection) to run regularly query the collected data and analyze it to discover threats. Start by using the [built-in analytics rules](/azure/sentinel/business-applications/power-platform-solution-security-content#built-in-analytics-rules) to create these rules. These rules generate alerts when they find what they're looking for; alerts are then aggregated into incidents that you can assign and investigate. You can also build predetermined, automated responses into the rules' configuration.

:::image type="content" source="media/sentinel-example.png" alt-text="Microsoft Sentinel incident of a Power Automate cloud flow created by a fired employee.":::

Learn more:

- [Connect Microsoft Power Platform to Microsoft Sentinel](/azure/sentinel/business-applications/deploy-power-platform-solution)
- [Review the security content reference for Microsoft Power Platform](/azure/sentinel/business-applications/power-platform-solution-security-content)
- [Configure threat detection rules](/azure/sentinel/threat-detection)

## Identity

Monitor identity-related risk events on potentially compromised identities and remediate those risks. Review the reported risk events in these ways:

Use Microsoft Entra ID reporting. For more information, see [What is Identity Protection?](/azure/active-directory/reports-monitoring/concept-user-at-risk) and [Identity Protection](/azure/active-directory/active-directory-identityprotection).

Use Identity Protection risk detection API members to get programmatic access to security detections via Microsoft Graph. For more information, see [riskDetection](/graph/api/resources/riskdetection) and [riskyUser](/graph/api/resources/riskyuser).

Microsoft Entra ID uses adaptive machine learning algorithms, heuristics, and known compromised credentials (user name and password pairs) to detect suspicious actions that are related to your user accounts. These user name and password pairs are surfaced by monitoring the public and dark web and by working with security researchers, law enforcement, security teams at Microsoft, and others.

## Activity logging

[Power Apps](/power-platform/admin/logging-powerapps), [Power Automate](/power-platform/admin/logging-power-automate), [Copilot Studio](/microsoft-copilot-studio/admin-logging-copilot-studio), [Connectors](/power-platform/admin/connector-events-power-platform), [Power Pages](/power-platform/admin/logging-power-pages), [Data Loss Prevention](/power-platform/admin/dlp-activity-logging) and [Power Platform administrative](/power-platform/admin/admin-activity-logging) activity logging are tracked and viewed from the Microsoft Purview compliance portal. For more information, see [Learn about Microsoft Purview](/purview/purview).

[Dataverse auditing](/power-platform/admin/manage-dataverse-auditing) logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment. This auditing is enabled at the environment level, and additional configuration is required for individual tables and columns.

From there, Microsoft Power Platform admins can use available applications such as Microsoft Defender or Microsoft Sentinel to monitor certain types of security threats or build audit reports using the available APIs.

Having continuous, more holistic threat detection and the ability to apply preventative guardrails is essential to enable frictionless productivity while minimizing cyber risk.

## Threat analysis

A comprehensive analysis to identify threats, attacks, vulnerabilities, and countermeasures are crucial during the design phase of a workload. Threat modeling is an engineering exercise that includes defining security requirements, identifying, and mitigating threats, and validating those mitigations. You can use this technique at any stage of application development or production, but it's most effective during the design stages of new functionality.

Learn more: [Recommendations for threat analysis](/power-platform/well-architected/security/threat-model#power-platform-facilitation)

## Resources

<!-- TODO -->