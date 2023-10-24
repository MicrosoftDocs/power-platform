---
title: Power Well-Architected stub
description: Power Well-Architected stub
author: robstand
ms.author: rstand
ms.reviewer: sericks
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/25/2023
---

# Power Well-Architected pillars

The Well-Architected Framework pillars drive architectural excellence at the fundamental level of a workload. 

Use this matrix to familiarize yourself with the key concepts:

| Pillar | Workload concern | Apply the principles | Strike a balance
|--------|-------------|-------------------|-----------
| [**Reliability**][resiliency-pillar] | Resiliency, availability, recovery| Design for business requirements, resilience, recovery, operations, while keeping it simple. <br> [Design principles](reliability/principles.md) | [Tradeoffs](./reliability/tradeoffs.md)
| [**Operational Excellence**][devops-pillar] | Holistic observability, DevOps practices |Streamline operations with standards, comprehensive monitoring, and safe deployment practices. <br> [Design principles](operational-excellence/principles.md)|[Tradeoffs](./operational-excellence/tradeoffs.md)|
| [**Performance Efficiency**][scalability-pillar] |Scalability, load testing| Scale horizontally, test early and often, and monitor health of the solution. <br>[Design principles](./performance-efficiency/principles.md)|[Tradeoffs](performance-efficiency/tradeoffs.md)|
| [**Experience Optimization**][cost-pillar] | Create seamless, intuitive, and meaningful experiences.
 <br> [Design principles](./cost-optimization/principles.md)|[Tradeoffs](cost-optimization/tradeoffs.md)|
| [**Security**][security-pillar] | Data protection, threat detection, mitigation |Protect confidentiality, integrity, and availability. <br> [Design principles](security/principles.md)|[Tradeoffs](security/tradeoffs.md)

> [!IMPORTANT]
>
> The reference architectures have been designed with the principles in mind. The architecture articles describe a prescriptive path by applying the design principles that provide a holistic view on the architectures. 

## Assessment review tool

Assess your workload using the core pillars to **identify and prioritize opportunities** to improve the posture of your workloads.

:::image type="content" source="./_images/well-architected-review.png" alt-text="Screenshot of the Microsoft Azure Well-Architected Review." lightbox="./_images/well-architected-review.png":::

> [!TIP]
> 
> Start your assessment with [**Azure Well-Architected Review**](/assessments/?id=azure-architecture-review&mode=pre-assessment).

## Integration with Power Platform guidance

- [**Azure Advisor**](/azure/advisor/) uses the **core pillars** as a basis for analyzing your resource configuration and usage telemetry and provides appropriate recommendations. 

- [**Advisor Score**](/azure/advisor/azure-advisor-score) is a core feature of Azure Advisor that aggregates Advisor recommendations into a simple, actionable score. The overall score can be categorized into the core pillars of the Well-Architected Framework. Use the score to  prioritize the actions that yield the biggest improvement.

## Get started with this video series

To learn about how to architect successful workloads on Azure by using the Well-Architected Framework, watch this video:

<!-- markdownlint-disable MD034 -->
> [Design well-architected workloads](/shows/azure-enablement/architect-successful-workloads-on-azure--introduction-ep-1-well-architected-series/player)

For more information about resiliency, watch the following video that shows you how to start improving the reliability of your Azure workloads:

<!-- markdownlint-disable MD034 -->

> [Improve the reliability of your workloads](/shows/azure-enablement/start-improving-the-reliability-of-your-azure-workloads--reliability-ep-1--well-architected-series/player)

Learn to ask the right questions about secure application development on Azure by watching the following video:

<!-- markdownlint-disable MD034 -->
> [Secure your workloads](/shows/azure-enablement/ask-the-right-questions-about-secure-application-development-on-azure/player)


Adopt an optimization mindset and start evaluating your Azure costs:

<!-- markdownlint-disable MD034 -->

> [Optimize costs](/shows/azure-enablement/start-optimizing-your-azure-costs--cost-optimization-ep-1--well-architected-series/player)



<!-- links -->

[resiliency]: ./resiliency/principles.md

<!-- practices -->
[autoscale]: /azure/architecture/best-practices/auto-scaling
[background-jobs]: /azure/architecture/best-practices/background-jobs
[caching]: /azure/architecture/best-practices/caching
[cdn]: /azure/architecture/best-practices/cdn
[data-partitioning]: /azure/architecture/best-practices/data-partitioning
[monitoring]: /azure/architecture/best-practices/monitoring
[retry-service-specific]: /azure/architecture/best-practices/retry-service-specific
[transient-fault-handling]: /azure/architecture/best-practices/transient-faults

<!-- pillars -->
[cost-pillar]: ./cost-optimization/index.yml
[security-pillar]: ./security/index.yml
[resiliency-pillar]: ./resiliency/index.yml
[scalability-pillar]: ./scalability/index.yml
[devops-pillar]: ./devops/index.yml
