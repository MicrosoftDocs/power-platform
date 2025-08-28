---
title: Recommendations for designing an emergency response strategy
description: Learn how to design an effective emergency operations practice that clearly defines roles and responsibilities to ensure timely issue resolution.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for designing an emergency response strategy

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:07](checklist.md)| **Develop an effective emergency operations practice. Ensure that your workload emits meaningful health signals. Collect the resulting data and use it to generate actionable alerts that enact emergency responses through dashboards and queries. Clearly define human responsibilities, such as on-call rotations, incident management, emergency resource access, and running postmortems.** |
|---|---|

This guide describes the recommendations for designing an emergency response strategy. Some of your workloads might be mission-critical, and issues that arise over the course of a workload's life cycle might be severe enough to warrant declaring them emergencies. You can implement tightly controlled and focused processes and procedures that your team can follow to ensure that an issue is handled in a calm, orderly manner. Emergencies naturally raise everyone's stress levels and can lead to a chaotic environment if your team isn't well-prepared. To help minimize stress and confusion, design a response strategy, share the response strategy with your organization, and perform regular emergency response training.

## Key design strategies

An emergency response strategy should be a well-defined set of processes and procedures. Each process and procedure should have scripts to ensure that each step progresses your team toward quickly and safely resolving an issue. To develop an emergency response strategy, consider the following overview:

- Prerequisites
  - Develop a monitoring system
  - Create an incident response plan
- Incident phases
  - Detection and containment
  - Triage
- Post-incident phases
  - Root cause analysis (RCA)
  - Postmortem
- Ongoing activity
  - Emergency response drills

The following sections provide recommendations for each of these phases.

### Monitoring system

To have a robust emergency response strategy, you need to have a robust monitoring system, or observability platform, in place. Your observability platform should have the following characteristics:

- **Holistic monitoring**: Ensure that you thoroughly monitor your workload from a configuration and application perspective, and include infrastructure monitoring if components of your workload are hosted in the cloud or on-premises. Make sure that all components of your workload are covered by your monitoring strategy. For example, if your workload interacts with Azure resources or an on-premises system, include those components in your monitoring.

- **Verbose logging**: Enable verbose logging for your components to assist with investigations when you triage an issue. Structure logs so that they're easy to manage. Automatically send logs to data sinks to be prepared for analysis.

- **Useful dashboards**: Create dashboards based on your health model that are tailored to each team across your organization. Different teams are responsible for different aspects of workload health.

- **Actionable alerts**: Create alerts that are useful for your workload teams. Avoid alerts that don't require action from your teams. Too many alerts of this kind can lead to people ignoring or blocking alert notifications.

- **Automatic notifications**: Ensure that appropriate teams automatically receive alerts that require action from them. For example, your Tier 1 support team should get notifications for all alerts, whereas your security engineers should only get alerts for security events.

Learn more in [Recommendations for designing and creating a monitoring framework](observability.md).

### Incident response plan

The foundation of an emergency response strategy is an incident response plan. As with a disaster recovery plan, clearly and thoroughly define roles, responsibilities, and procedures for responding to an incident. The plan should be a version-controlled document that's subject to regular reviews that ensure it's up to date.

Clearly define the following components in your plan.

#### Roles

Identify an incident response manager. This person owns the incident from initiation to remediation to the root cause analysis. An incident response manager ensures that processes are followed and the appropriate parties are informed as the response team performs its work.

Identify a postmortem leader. This individual ensures that postmortems are performed soon after the incident is resolved. They produce a report, which helps you apply the findings that come out of the incident.

#### Processes and procedures

Your workload team should define and understand emergency criteria. When your team determines that a case is severe, you can declare a disaster and initiate the disaster recovery plan. In less severe cases, the issue might not meet the criteria of a disaster, but you should still consider the issue an emergency, which requires initiating the emergency response plan. Emergencies can either be internal to your workload, such as bugs in your application code, or a result of an issue with a dependency of your workload, such as unavailability of an API or a database. An emergency might also be caused by an outage of your supplier (such as an issue with Microsoft Entra ID or Power Platform). The support team must be able to determine whether an issue meets the emergency criteria, even if the team has no visibility into the underlying issue.

Precisely define communication and escalation plans. Based on the type of alert notification that they receive, ensure that your Tier 1 support team members can easily contact the appropriate teams for escalating issues.

#### Other items to include

Document all standard tools that are used during incidents for internal communication, like Microsoft Teams, and for tracking the activities over the course of the incident, like ticketing tools or backlog planning tools.

Document your emergency credentials, otherwise known as *break-glass accounts*. Include a step-by-step guide that describes how they should be used.

Create emergency response drill instructions, and keep a record of when drills are performed.

Document any legal or regulatory measures necessary, such as communicating data breaches.

### Incident detection and containment

When you have a well-designed monitoring system that monitors for anomalies and automatically alerts on them, you can quickly detect issues and determine their severity. If the issue is deemed an emergency, the plan can be initiated. In some cases, the support team isn't notified through the monitoring system. Users might report issues to support by using support team communication avenues. Or they might reach out to people whom they regularly work with or who they know are working with Power Platform, like your Power Platform service admins or Center of Excellence team. No matter how the support team is notified, they should always follow the same steps to validate the issue and determine the severity. Deviation from the response plan can add stress and confusion.

### Triage

The first step in issue remediation is to identify the component of the workload that is causing the issue. The steps that you follow during triage depend on the type of issue. The team for a certain area of workload support should create procedures for incidents that are related to its work. For example, security teams should triage security issues, and they should follow scripts that they develop. It's important that teams follow well-defined scripts as they work through their triage efforts. These scripts should be step-by-step instructions that include rollback processes to undo changes that are ineffective or can cause other issues. After the issue is resolved, follow well-defined processes to safely bring the affected component back into the workload flow paths.

### Root cause analysis reporting

The incident owner or someone who worked closely with them should create the root cause analysis (RCA) reports. This strategy ensures an accurate accounting of the incident. Typically, organizations have a defined RCA template with guidelines about how information is presented and what kinds of information can or can't be shared. If you need to create your own template and guidelines, ensure that stakeholders review and approve them.

### Incident postmortems

An impartial individual should lead blameless postmortems. In postmortem sessions, everyone shares their findings from an incident. Each team that was involved in the incident response should be represented by individuals who worked on the incident. Those individuals should come to the session prepared with examples of the actions that were successful and areas that can be improved. The session isn't a forum for assigning blame for the incident or issues that might come up during the response. The postmortem leader should leave the session with a clear list of action items that focus on improvement, such as:

- **Improvements to the response plan.** Processes or procedures might need to be reevaluated and rewritten to better capture appropriate actions.
- **Improvements to the monitoring system.** Thresholds might need to be reevaluated to catch the specific type of incident earlier, or new monitoring might need to be implemented to catch behavior that wasn't accounted for.
- **Improvements to the workload.** The incident might expose a vulnerability in the workload that must be addressed as a permanent remediation.

## Considerations

Your emergency response strategy should be closely aligned to your overall [Power Platform support strategy](/power-platform/guidance/adoption/support-strategy-solutions). Work with your Power Platform administrators and Center of Excellence team to discuss support and emergency response options and processes that might already be defined.

As you define your support process and escalation path, it's important to [categorize solutions](/power-platform/guidance/adoption/support-strategy-solutions#define-tiers-of-applications) built based on criticality. This practice allows you to establish processes that ensure that critical applications have the necessary guardrails to support them, while not stifling innovation of productivity scenarios or overwhelming your incident response teams. As you define your support models, also think about a graduation path. A solution might start off only requiring productivity-level support but grow in functionality or user base to require a higher level of support. Define how makers can request more formal support and transition a solution to supported environments.

## Power Platform facilitation

Power Platform integrates with [Application Insights](/azure/azure-monitor/app/app-insights-overview), which is part of the [Azure Monitor](/azure/azure-monitor/overview) ecosystem. Use this integration to:

- Receive telemetry on diagnostics and performance captured by the [Dataverse platform in Application Insights](/power-platform/admin/overview-integration-application-insights). You can subscribe to receive telemetry about operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.

- Connect your [canvas apps to Application Insights](/power-apps/maker/canvas-apps/application-insights). You can use these analytics to diagnose issues and understand what users do with your apps. You can collect information to help you drive better business decisions and improve the quality of your apps.

- Configure [Power Automate telemetry](/power-platform/admin/app-insights-cloud-flow) to flow into Application Insights; for example, to monitor cloud flow executions and create alerts for cloud flow run failures.

- Capture telemetry data from your [Microsoft Copilot Studio agent](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry) for use in Azure Application Insights. You can use this telemetry to monitor logged messages and events sent to and from your agent, topics to be triggered during user conversations, and custom telemetry events that can be sent from your topics.

Application Insights is a comprehensive solution for collecting, analyzing, and responding to monitoring data from cloud and on-premises environments. It includes a robust alerting platform that you can configure for [automatic notifications and other actions](/azure/azure-monitor/alerts/action-groups).

The [Power Platform Automation Kit](/power-automate/guidance/automation-kit/overview/introduction) is set of tools that accelerates the use and support of Power Automate for desktop for automation projects. The kit provides tools that help you manage automation projects and monitor them to estimate money saved and return on investment (ROI). Part of the Automation Kit is the [control center](/power-automate/guidance/automation-kit/control-center-overview), which complements the existing Monitor desktop flow runs feature. The key focus of the control center is an orchestrator view for support analysts and organizations to monitor, take action, and alert when necessary.

## Related information

- [Recommendations for designing and creating a monitoring system](observability.md)
- [Recommendations for designing a reliable monitoring and alerting strategy](../reliability/monitoring-alerting-strategy.md)
- [User and maker support strategy](/power-platform/guidance/adoption/support-strategy)

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
