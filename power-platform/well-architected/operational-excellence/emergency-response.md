---
title: Emergency response recommendations
description: Learn how to design an emergensy response strategy for your workload. Set up a set of processes and procedures that everyone involved in the response will follow to ensure that the issue is handled in a calm, orderly manner.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: sericks
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for designing an emergency response strategy

**Applies to this Power Well-Architected Operational Excellence checklist recommendation:**

|[OE:08](checklist.md)| Ensure that your workload emits meaningful health signals across infrastructure and code. Collect the resulting data and use it to generate actionable alerts that enact emergency responses via dashboards and queries. Clearly define human responsibilities, such as on-call rotations, incident management, emergency resource access, and running post-mortems.|
|---|---|

This guide describes the recommendations for designing an emergency response strategy. Some of your workloads may be mission critical, and issues that arise over the course of a workload's lifecycle may be severe enough to warrant declaring them emergencies. You can implement tightly controlled and focused processes and procedures that your team can follow to ensure that an issue is handled in a calm, orderly manner. Emergencies naturally raise everyone's stress levels and can lead to a chaotic environment if your team isn't well-prepared. To help minimize stress and confusion, design a response strategy, share the response strategy with your organization, and perform regular emergency response training.

## Key design strategies

An emergency response strategy should be a well-defined set of processes and procedures. Each process and procedure should have scripts to ensure that each step progresses your team towards quickly and safely resolving an issue. To develop an emergency response strategy, consider the following overview:

- Prerequisites
  - Develop an monitoring system
  - Create an incident response plan
- Incident phases
  - Detection
  - Containment
  - Triage
- Post-incident phases
  - Root cause analysis (RCA)
  - Postmortem
- Ongoing activity
  - Emergency response drills

The following sections provide recommendations for each of these phases.

## Observability

To have a robust emergency response strategy, you need to have a robust observability platform in place. Your observability platform should have the following characteristics:

- **Holistic monitoring**: Ensure that you thoroughly monitor your workload from a configuration and application perspective, include infrastructure monitoring if components of your workload are hosted in the cloud or on-prem.
- **Verbose logging**: Enable verbose logging for your components to assist with investigations when you triage an issue. Structure logs so that they're easy to manage. Automatically send logs to data sinks to be prepared for analysis.
- **Useful dashboards**: Create health model-based dashboards that are tailored to each team across your organization. Different teams are responsible for different aspects of workload health.
- **Actionable alerts**: Create alerts that are useful for your workload teams. Avoid alerts that don't require action from your teams. Too many alerts of this kind can lead to people ignoring or blocking alert notifications.
- **Automatic notifications**: Ensure that appropriate teams automatically receive alerts that require action from them. For example, your tier-1 support team should get notifications for all alerts, whereas your security engineers should only get alerts for security events.

For more information, see Recommendations for designing and creating a monitoring framework.

## Incident response plan

The foundation of an emergency response strategy is an incident response plan. Like a disaster recovery plan, clearly and thoroughly define roles, responsibilities, and procedures for an incident response plan. The plan should be a version-controlled document that's subject to regular reviews that ensure it's up to date.

Clearly define the following components in your plan.

### Roles

Identify an incident response manager. This person owns the incident from initiation to remediation to the root cause analysis. An incident response manager ensures that processes are followed and the appropriate parties are informed as the response team performs their work.

Identify a postmortem leader. This individual ensures that postmortems are performed soon after the incident is resolved. They produce a report, which helps you apply the findings that come out of the incident.

### Processes and procedures

Your workload team should define and understand emergency criteria. When your team determines that a case is severe, you can declare a disaster and initiate the disaster recovery plan. In less severe cases, the issue might not meet the criteria of a disaster. But you should still consider the issue an emergency, which necessitates initiating the emergency response plan. Emergencies can either be internal to your workload, e.g. bugs in your application code, or be a result of an issue with a dependency of your workload, e.g. unavailability of an API or a database. The support team must be able to determine whether an issue meets the emergency criteria, even if they have no visibility into the underlying issue.

Precisely define communication and escalation plans. Based on the type of alert notification that they receive, ensure that your tier-1 support can easily contact the appropriate teams to escalate issues to. 

### Other items to include

Document all standard tools that will be used during incidents for internal communication, like Microsoft Teams, and for tracking the activities over the course of the incident, like ticketing tools or backlog planning tools.

Document your emergency credentials, otherwise known as _break-glass accounts_. Include a step-by-step guide that describes how they should be used.

Create emergency response drill instructions, and keep a record of when drills have been performed.

Document any legal or regulatory measures necessary, for example communicating data breaches.

## Incident detection

When you have a well-designed monitoring system that monitors for anomalies and automatically alerts on them, you can quickly detect issues and determine their severity. If the issue is deemed an emergency, the plan can be initiated. In some cases, the support team isn't notified via the monitoring system. Users might report issues to support by using support team communication avenues. Or they might reach out to people that they regularly work with or that they know are working with Power Platform, like your Power Platform service admins or Center of Excellence team. No matter how the support team is notified, they should always follow the same steps to validate the issue and determine the severity. Deviation from the response plan can add stress and confusion.

## Triage

The first step in issue remediation is to identify the component of the workload that is causing the issue. The steps that you follow during triage depend on the type of issue. The team for a certain area of workload support should create procedures for incidents that are related to their team. For example, security teams should triage security issues, and they should follow scripts that they develop. It's important that teams follow well-defined scripts as they work through their triage efforts. These scripts should be step-by-step processes that include rollback processes to undo changes that are ineffective or can cause other issues. After the issue is resolved, follow well-defined processes to safely bring the affected component back into the workload flow paths.

## Root Cause Analysis reporting

The service-level agreements (SLAs) to your customers might dictate that you have to issue root cause analysis (RCA) reports within a certain time period after the incident is resolved. The incident owner or someone who worked closely with them should create the RCA reports. This strategy ensures an accurate accounting of the incident. Typically, organizations have a defined RCA template with guidelines about how information is presented and what kinds of information can or can't be shared. If you need to create your own template and guidelines, ensure that they are reviewed and approved by stakeholders.

## Incident postmortems

An impartial individual should lead blameless postmortems. In postmortem sessions, everyone shares their findings from an incident. Each team that was involved in the incident response should be represented by individuals that worked on the incident. Those individuals should come to the session prepared with examples of the areas that were successful and areas that can be improved. The session isn't a forum for assigning blame for the incident or issues that might have come up during the response. The postmortem leader should leave the session with a clear list of action items that focus on improvement, such as:

- **Improvements to the response plan.** Processes or procedures might need to be reevaluated and rewritten to better capture appropriate actions.
- **Improvements to the** **monitoring system.** Thresholds might need to be reevaluated to catch the specific type of incident earlier, or new monitoring might need to be implemented to catch behavior that wasn't accounted for.
- **Improvements to the workload.** The incident might expose a vulnerability in the workload that must be addressed as a permanent remediation.

## Considerations

Your emergency response strategy should be closely aligned to your overall [Power Platform support strategy](/power-platform/guidance/adoption/support-strategy-solutions). Work with your Power Platform administrators and Center of Excellence team to discuss support and emergency response options and processes that may already be defined. 

As you define your support process and escalation path, it's important to [categorize solutions](/power-platform/guidance/adoption/support-strategy-solutions) built based on criticality—this will allow you to come up with processes that ensure that critical applications have the necessary guardrails to support them while at the same time not stifling innovation of productivity scenarios, or overwhelming your incident response teams. As you define your support models, also think about a graduation path—a solution may start off only requiring productivity-level support but grow in functionality or user base to require important-level support. Define how makers can request more formal support and transition a solution to supported environments.

## Power Platform facilitation

Azure Application Insights and [Azure Monitor](/azure/azure-monitor/overview) is a comprehensive solution for collecting, analyzing, and responding to monitoring data from cloud and on-premises environments. It includes a robust alerting platform that you can configure for [automatic notifications and other actions](/azure/azure-monitor/alerts/action-groups), like automatic scaling and other self-healing mechanisms.

## Related links

- [Recommendations for designing and creating an observability framework](/azure/well-architected/operational-excellence/observability)
- [Recommendations for designing a reliable monitoring and alerting strategy](/azure/well-architected/reliability/monitoring-alerting-strategy)
- [User and maker support strategies - Microsoft Power Platform - Power Platform | Microsoft Learn](/power-platform/guidance/adoption/support-strategy)
