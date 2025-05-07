---
title: Power Platform Well-Architected pillars
description: Learn about the Power Platform Well-Architected pillars for achieving architectural excellence.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: concept-article
ms.date: 05/16/2024
---

# Power Platform Well-Architected pillars

The Power Platform Well-Architected pillars drive architectural excellence at the fundamental level of a workload.

| Pillar | Workload concern | Apply the principles | Strike a balance
|--------|-------------|-------------------|-----------
| [**Reliability**][resiliency-pillar] | Resiliency, availability, recovery| Design for business requirements, resilience, recovery, operations, while keeping it simple. <br> [Design principles](reliability/principles.md) | [Tradeoffs](./reliability/tradeoffs.md)
| [**Security**][security-pillar] | Data protection, threat detection, mitigation |Protect confidentiality, integrity, and availability. <br> [Design principles](security/principles.md)|[Tradeoffs](security/tradeoffs.md) |
| [**Operational Excellence**][devops-pillar] | Holistic observability, Fusion + DevOps practices |Streamline operations with standards, comprehensive monitoring, and safe deployment practices. <br> [Design principles](operational-excellence/principles.md)|[Tradeoffs](./operational-excellence/tradeoffs.md)|
| [**Performance Efficiency**][scalability-pillar] | Scalability, meet usage demand | Scale horizontally, test early and often, and monitor the health of the solution. <br>[Design principles](performance-efficiency/principles.md)|[Tradeoffs](performance-efficiency/tradeoffs.md) |
| [**Experience Optimization**][experience-pillar] | Usability, relevance, composition | Create seamless, intuitive, and meaningful experiences. <br> [Design principles](./experience-optimization/principles.md)|[Tradeoffs](experience-optimization/tradeoffs.md)

## Assessment review

Assess your workload using the core pillars to identify and prioritize opportunities to improve the posture of your workloads.

Start your assessment with the [Power Platform Well-Architected Review](https://aka.ms/powa/assessment).

[experience-pillar]: ./experience-optimization/index.yml
[security-pillar]: ./security/index.yml
[resiliency-pillar]: ./reliability/index.yml
[scalability-pillar]: ./performance-efficiency/index.yml
[devops-pillar]: ./operational-excellence/index.yml
