---
title: Build a disaster recovery plan
description: Learn how to create a disaster recovery plan for Power Platform and Dynamics 365 to ensure business continuity during regional outages.
#customer intent: As a solution architect, I want to build a disaster recovery plan so that I can ensure business continuity during regional outages.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/14/2025
---

# Build a disaster recovery plan

Microsoft Business Applications provide business continuity and disaster recovery (BCDR) capabilities to all production environments in Dynamics 365 and Power Platform software as a service (SaaS) applications. Learn how [Microsoft ensures your production data is resilient during regional outages](/power-platform/admin/business-continuity-disaster-recovery).

> [!NOTE]
> Review workload specific [recommendations for designing a disaster recovery strategy](/power-platform/well-architected/reliability/disaster-recovery). This article summarizes key recommendations and best practices for building a disaster recovery plan.

## Document your disaster recovery plan

The key to a reliable disaster recovery strategy for a workload is the disaster recovery plan. Perform disaster recovery drills or an emergency response before a real disaster strikes to document all steps required for any integration points external to Power Platform. This preparation ensures your company is ready for recovery during a real disaster.

While your disaster recovery plan might be tailored to your specific workload or environment, providing templates and guidance to workload teams ensures that they address all essential steps.

Here are some steps involved in creating a comprehensive disaster recovery plan for Power Platform, along with the roles and responsibilities of the team members involved:

- **Risk assessment and business impact analysis**: Workload teams assess the types of disasters that can affect their solutions and determine the potential impact of these risks on business operations, including data loss, downtime, and financial implications. Workload teams [identify critical flows](/power-platform/well-architected/reliability/identify-flows) and [perform failure mode analysis](/power-platform/well-architected/reliability/failure-mode-analysis).
- **Define recovery objectives**: Establish the maximum acceptable downtime for your Power Platform applications and determine the maximum acceptable data loss, measured in time. Learn more about [availability and recovery target metrics](/power-platform/well-architected/reliability/metrics).
- **Develop recovery strategies**: Regularly back up environments and define, test, and execute a failover approach with self-service disaster recovery.
- **Create a communication plan**: Develop a plan for communicating with all stakeholders during a disaster, including roles and responsibilities.
- **Document the disaster recovery plan**: Document step-by-step procedures for disaster recovery, including how to restore data, switch to backup systems, and verify system integrity. Include contact details for key personnel, vendors, and emergency services.
- **Test and update the disaster recovery plan**: Conduct regular disaster recovery drills to ensure the plan is effective and team members are familiar with their roles. Update the plan regularly based on test results, changes in the environment, and lessons learned from actual incidents.

Learn more: [Maintain a disaster recovery plan](/power-platform/well-architected/reliability/disaster-recovery#maintain-a-disaster-recovery-plan)

## Roles and responsibilities

Here are some of the roles and their responsibilities involved when planning and documenting your disaster recovery plan:

- **Head of Operations**: Oversees the development, implementation, and maintenance of the disaster recovery plan. Coordinates risk assessments, manages recovery efforts, and ensures regular testing and updates of the plan.
- **IT Operations team and Power Platform administrator**: Provides technical support and expertise during disaster recovery. Implements backup and redundancy solutions, restores systems and data, and verifies system integrity.
- **Business continuity planner**: Ensures business operations can continue during and after a disaster. Develops and maintains the business continuity plan, coordinates with the disaster recovery manager, and communicates with stakeholders.
- **Communication lead**: Manages internal and external communication during a disaster. Develops communication plans, prepares communication templates, and ensures timely dissemination of information.
- **Executive sponsor**: Provides leadership and support for disaster recovery efforts. Allocates resources, approves the disaster recovery plan, and ensures alignment with business objectives.
- **Workload team**: Ensures specific workloads are recoverable and operational post-disaster. Follows provided templates and guidance to address all necessary steps, performs regular backups, and tests recovery procedures.
- **Business stakeholders**: Represent the interests of the business and ensure alignment with business goals. Provide input on critical business functions, approve recovery objectives, and participate in testing and review of the disaster recovery plan.

## Define and execute a failover approach with self-service disaster recovery

With [self-service disaster recovery](/power-platform/admin/business-continuity-disaster-recovery), you can define, test, and execute a cross-region failover approach for your Power Platform environments. This approach helps you meet compliance requirements and ensures that your workloads continue to run during an unexpected region-wide issue.

When self-service disaster recovery is enabled for an environment, a copy of the environment is maintained in a secondary region. This setup ensures business continuity by letting workloads fail over to the secondary region during large-scale disruptions, minimizing downtime and impact.  

Self-service disaster recovery also supports an emergency response mode. If there's a major outage, switching to emergency response mode prioritizes restoring services as quickly as possible. This means skipping data replication and instead switching to the last fully validated copy to restore operations quickly. You can monitor each phase of the failover process, from validation to execution, ensuring transparency and control. Whether performing a disaster recovery drill or an emergency response failover, replication lag between regions is typically under 15 minutes.  

## Conduct disaster recovery drills

Disaster recovery testing is essential for a strong disaster recovery plan. Many industries have compliance frameworks that demand regular disaster recovery drills. Frequent disaster recovery drills are crucial for success, regardless of industry.

With [self-service disaster recovery](/power-platform/admin/business-continuity-disaster-recovery), you control when to execute failover drills to meet compliance requirements and when to perform emergency failovers and failbacks.  

Perform drills on a copy of the production environment because this process involves downtime that can last several minutes. For example, copy the production environment to a sandbox environment, and then change its type to production.

## Related resources

- [Business continuity and disaster recovery](/power-platform/admin/business-continuity-disaster-recovery)
- [Cross-region self-service disaster recovery](/power-platform/admin/business-continuity-disaster-recovery?tabs=new#cross-region-self-service-disaster-recovery-preview)
