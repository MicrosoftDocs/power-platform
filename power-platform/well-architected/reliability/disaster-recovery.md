---
title: Design a disaster recovery strategy recommendation for Power Platform workloads
description: Learn how to design a disaster recovery strategy for a Power Platform workload and prepare to handle incidents and outages. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for designing a disaster recovery strategy

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

|[RE:07](checklist.md)| **Implement structured, tested, and documented business continuity and disaster recovery (BCDR) plans that align with the recovery targets. Plans must cover all components and the system as a whole.**  |
|---|---|

This guide describes recommendations for designing a reliable disaster recovery strategy for a workload. To meet internal service-level objectives (SLOs) or even a service-level agreement (SLA) that you have guaranteed for your customers, you must have a robust and reliable disaster recovery strategy. Failures and other major issues are expected. Your preparations to deal with these incidents determine how much your customers can trust your business to reliably deliver for them. A disaster recovery strategy is the backbone of preparation for major incidents.

**Definitions**

| Term | Definition |
| --- | --- |
| Failover | The automated and/or manual shifting of production workload traffic from an unavailable region to an unaffected region. |
| Failback | The automated and/or manual shifting of production workload traffic from a failover region back to the primary region. |

## Key design strategies

This guide assumes that you have already performed the following tasks as part of your reliability planning:

- Identify [critical and noncritical flows](identify-flows.md).

- Perform [failure mode analysis (FMA)](failure-mode-analysis.md) for your flows.

- Identify [reliability targets](metrics.md).

- Design a robust [testing strategy](testing-strategy.md).

A reliable workload architecture is the basis for a reliable disaster recovery (DR) strategy. Consider reliability at every stage of creating your workload to make sure that you have the needed components for efficient recovery before you begin planning your DR strategy. This foundation ensures that your workload's reliability goals, such as recovery time objective (RTO) and recovery point objective (RPO), are practical and attainable.

## Maintain a disaster recovery plan

The key to a reliable DR strategy for a workload is the *DR plan*. Your plan should be a living document that's regularly revised and updated as your environment changes. Share the plan with the relevant teams (operations, technology leadership, and business stakeholders) regularly (for example, every six months). Keep it in a highly available, secure data store like OneDrive.

Follow these recommendations to develop your DR plan:

- Clearly define what constitutes a disaster and requires activation of the DR plan.

    Disasters are large-scale issues. They might be regional outages, outages of services like Microsoft Entra ID or Azure DNS, or severe malicious attacks like ransomware attacks or DDoS attacks.

    Include examples of failure modes that aren't considered disasters, such as the unavailability or failure of a single resource, in your DR plan so that operators don't mistakenly invoke their DR escalations.

- Build the DR plan on your FMA documentation. Ensure that your DR plan captures the failure modes and mitigation strategies for outages that are defined as disasters. If updates are required, update both your DR plan and your FMA documents at the same time so they're accurate when the environment changes or when testing uncovers unexpected behaviors.

- Clearly define roles and responsibilities within the workload team and understand any related external roles within your organization. If the disaster is caused by the outage of an external service, such as Microsoft Entra ID, ensure that you have a role defined that's responsible for communication with the external party and can share updates with the workload team. Roles should include:

  - The party responsible for declaring a disaster
  - The party responsible for declaring incident closure
  - Operations roles
  - Testing and validation roles
  - Internal and external communications roles
  - Retrospective and root-cause analysis (RCA) lead roles

- Define the escalation paths that the workload team must follow to ensure that recovery status is communicated to stakeholders.

- Include the prescribed order in which components of the workload should be recovered to cause the least impact. For example, recover databases and restart cloud flows before you recover the application.

  - Detail each component's recovery procedure as a step-by-step guide. Include screenshots if possible, and prerequisites for running the procedure. For example, list the required scripts or credentials that need to be gathered.

  - Define your team's responsibilities versus your cloud hosting provider's responsibilities. For example, Microsoft is responsible for restoring a PaaS (platform as a service), but you're responsible for rehydrating data and applying your configuration to the service.

  - Capture the root cause of the incident and perform mitigation before you start recovery. For example, if the cause of the incident is a security issue, mitigate that issue before you recover the affected systems in your failover environment.

- If you need to redeploy your app in the failover environment, use tooling to automate the deployment process as much as possible. Ensure that your Azure Pipelines are predeployed and correctly configured in the failover environments so that you can immediately begin your deployments. Use automated end-to-end deployments, with manual approval gates where necessary, to ensure a consistent and efficient deployment process. When a stage of the deployment process requires manual intervention, document the manual steps. Clearly define roles and responsibilities.

- Automate as much of the procedure as you can. Use retry logic to avoid wasting time on scripts that are stuck on a broken task. Because you run these scripts only in emergencies, you don't want incorrectly developed scripts to cause more damage or slow down your recovery process.

> [!NOTE]
> Automation poses risks. Trained operators need to monitor the automated processes carefully and intervene if any process encounters issues. To minimize the risk that automation will react to false positives, be thorough in your DR drills. Test all phases of the plan. Simulate detection to generate alerting, and then move through the entire recovery procedure.

## Conduct disaster recovery drills

A DR testing practice is essential for a good DR plan. Many industries have compliance frameworks that demand regular DR drills. Regardless of your industry, frequent DR drills are crucial for your success.

Follow these recommendations for successful DR drills:

- Perform at least one production DR drill per year. Dry run drills or nonproduction drills help ensure that the parties involved are familiar with their roles and responsibilities. These drills also help operators build familiarity by following recovery processes. But only production drills truly test the validity of the DR plan and the RTO and RPO metrics. Use your production drills to time recovery processes for components and flows to ensure that the RTO and RPO targets that have been defined for your workload are achievable. For functions that are out of your control, like Microsoft Entra ID outages, ensure that the RTO and RPO targets for the flows that involve those functions account for possible delays beyond your control.

- Use dry run drills to educate new operators about DR processes and procedures. Senior operators should take time to let new operators perform their role and should watch for improvement opportunities. If a new operator is hesitant or confused by a step in a procedure, review that procedure to ensure that it's clearly written.

### Considerations

Performing DR drills in production can cause unexpected catastrophic failures. Be sure to test recovery procedures in nonproduction environments during your initial deployments.

Give your team as much maintenance time as possible during drills. When planning for maintenance time, use the recovery metrics that you capture during testing as *minimum time necessary* allotments.

As your DR drill practices mature, you learn which procedures you can run in parallel and which you must run in sequence. Early in your drill practices, assume that every procedure must be run in sequence and that you need extra time in each step to handle unanticipated issues.

## Failover capabilities

Microsoft Business Applications provide business continuity and disaster recovery (BCDR) capabilities to all [production](/power-platform/admin/environments-overview) environments in Dynamics 365 and Power Platform software as a service (SAAS) applications. [Learn how Microsoft ensures your production data is resilient during regional outages](/power-platform/admin/business-continuity-disaster-recovery).

## Power Platform facilitation

[Self-service disaster recovery](/power-platform/admin/business-continuity-disaster-recovery) enables you to define, test, and execute a cross-region failover approach for your Power Platform environments. This approach helps you meet compliance requirements and ensures that your workloads continue to run during an unexpected region-wide issue.

With self-service disaster recovery, you control when to execute failover drills to meet compliance requirements and when to perform emergency failovers and failbacks. Perform drills on a copy of the production environment because this process involves downtime that can last several minutes. For example, copy the production environment to a sandbox environment, and then change its type to production.

## Related information

- [Plan mission critical workloads](/power-platform/guidance/adoption/plan-mission-critical)
- [Build a disaster recovery plan](/power-platform/guidance/adoption/plan-disaster-recovery)

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
