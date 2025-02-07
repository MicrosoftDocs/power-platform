---
title:  Detect threats to your organization
description: Guidance for detectmg threats to your Power Platform organization
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
ms.date: 02/28/2025
---

# Detect threats to your organization

As dependency on digital technology and integration with AI to fuel enterprise solutions grows, the importance of being able to detect threats cannot be overstated. Cybercrime is on the rise, with the frequency of data breaches reaching new all-time highs year after year. 

You can only mitigate potential security incidents before they escalate into significant breaches with effective threat detection in place. By implementing robust monitoring and alerting systems, you can quickly detect suspicious activities and respond promptly to protect their data and applications.

This article outlines the threat detection capabilities you can use to effectively manage and secure your Power Platform environments.

## Microsoft Sentinel

Microsoft Sentinel equips admins to have a comprehensive security and monitoring solution that intelligently detect and respond to suspicious activities such as mass data deletion or app execution from unauthorized geographies.

The [Microsoft Sentinel](azure/sentinel/business-applications/solution-overview) solution allows customers to investigate the detected threats and understand what the name of the suspicious app is, the environment it belongs to, the user who created or modified the app, the users using the app, and more. It will help organizations to:

- Collect Microsoft Power Platform and Power Apps activity logs, audits, and events into the Microsoft Sentinel workspace.
- Detect execution of suspicious, malicious, or illegitimate activities within Microsoft Power Platform and Power Apps.
- Investigate threats detected in Microsoft Power Platform and Power Apps and contextualize them with additional user activities across the organization.
- Respond to Microsoft Power Platform-related and Power Apps-related threats and incidents in a simple and canned manner manually, automatically, or via a predefined workflow.

The Microsoft Sentinel solution includes built-in threat coverage for the following scenarios that commonly encountered in business applications:

- Power Apps activity from an unauthorized geographic location
- Access to malicious links through Power Apps
- Bulk deletion of Power Apps data
- Destruction of Power Apps data in Dataverse
- A new Power Platform connector in a sensitive environment
- Automated Power Automate activity by departing employees
- Change or removal of a Power Platform Data Loss Prevention (DLP) policy

The SecOps team can use the Microsoft Sentinel tools to investigate and respond to these incidents. The following screenshot shows an example of such an incident, a Power Automate flow that was created by a fired employee:

:::image type="content" source="media/sentinel-example.png" alt-text="Microsoft Sentinel incident of a Power Automate cloud flow created by a fired employee.":::

The goal of Microsoft Sentinel solutions for business applications is to provide robust capabilities to detect, investigate, and disrupt threats. These solutions monitor for signals such as data exfiltration, unusual changes, unauthorized data access, insider threats, fraud, and anomalous activities. When such signals are detected, they trigger investigations that help SecOps teams better understand the threats through guided steps, context-enriched information, master data integration, threat hunting, cross-correlation, and data integrity impact analysis. Based on the findings, SecOps teams can take actions like blocking sensitive activities, restricting user or endpoint access, modifying permissions, alerting managers, running scanning tools, or performing data restores.

Learn more:

- [Connect Microsoft Power Platform to Microsoft Sentinel](/azure/sentinel/business-applications/deploy-power-platform-solution)
- [Security content reference for Microsoft Power Platform](/azure/sentinel/business-applications/power-platform-solution-security-content)

## Identity

Monitor identity-related risk events on potentially compromised identities and remediate those risks. Review the reported risk events in these ways:

Use Microsoft Entra ID reporting. For more information, see [What is Identity Protection?](/azure/active-directory/reports-monitoring/concept-user-at-risk) and [Identity Protection](/azure/active-directory/active-directory-identityprotection).

Use Identity Protection risk detection API members to get programmatic access to security detections via Microsoft Graph. For more information, see [riskDetection](/graph/api/resources/riskdetection) and [riskyUser](/graph/api/resources/riskyuser).

Microsoft Entra ID uses adaptive machine learning algorithms, heuristics, and known compromised credentials (user name and password pairs) to detect suspicious actions that are related to your user accounts. These user name and password pairs are surfaced by monitoring the public and dark web and by working with security researchers, law enforcement, security teams at Microsoft, and others.

## Threat analysis

A comprehensive analysis to identify threats, attacks, vulnerabilities, and counter measures is crucial during the design phase of a workload. Threat modeling is an engineering exercise that includes defining security requirements, identifying, and mitigating threats, and validating those mitigations. You can use this technique at any stage of application development or production, but it's most effective during the design stages of new functionality.

Learn more: [Recommendations for threat analysis](/power-platform/well-architected/security/threat-model#power-platform-facilitation)

## Incident preparation and response

Establish a comprehensive incident response plan that outlines the procedures for identifying, managing, and mitigating security incidents. This plan should include clear roles and responsibilities, communication protocols, and steps for containment, eradication, and recovery. Regular training and simulations can help ensure that all team members are familiar with the plan and can respond effectively in the event of an incident. Additionally, maintaining detailed logs and audit trails to investigate incidents and understand their impact. By being well-prepared and having a robust incident response strategy in place, you can minimize the damage caused by security breaches and quickly restore normal operations.

Learn more: [Recommendations for security incident response](/power-platform/well-architected/security/incident-response)

## Resources

<!-- TODO -->