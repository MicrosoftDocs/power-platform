---
title: Power Well-Architected stub
description: Power Well-Architected stub
author: robstand
ms.author: rstand
ms.reviewer: sericks
ms.subservice: guidance
ms.topic: conceptual
ms.date: 11/30/2023
---

# Power Well-Architected pillars

The Well-Architected Framework pillars drive architectural excellence at the fundamental level of a workload.

Use this matrix to familiarize yourself with the key concepts:

| Pillar | Workload concern | Apply the principles | Strike a balance
|--------|-------------|-------------------|-----------
| [**Reliability**][resiliency-pillar] | Resiliency, availability, recovery| Design for business requirements, resilience, recovery, operations, while keeping it simple. <br> [Design principles](reliability/principles.md) | [Tradeoffs](./reliability/tradeoffs.md)
| [**Operational Excellence**][devops-pillar] | Holistic observability, DevOps practices |Streamline operations with standards, comprehensive monitoring, and safe deployment practices. <br> [Design principles](operational-excellence/principles.md)|[Tradeoffs](./operational-excellence/tradeoffs.md)|
| [**Performance Efficiency**][scalability-pillar] |Scalability, load testing| Scale horizontally, test early and often, and monitor health of the solution. <br>[Design principles](./performance-efficiency/principles.md)|[Tradeoffs](performance-efficiency/tradeoffs.md)|
| [**Experience Optimization**][experience-pillar] | Usability, relevance, composition | Create seamless, intuitive, and meaningful experiences. <br> [Design principles](./experience-optimization/principles.md)|[Tradeoffs](experience-optimization/tradeoffs.md)|
| [**Security**][security-pillar] | Data protection, threat detection, mitigation |Protect confidentiality, integrity, and availability. <br> [Design principles](security/principles.md)|[Tradeoffs](security/tradeoffs.md)

> [!IMPORTANT]
>
> The reference architectures have been designed with the principles in mind. The architecture articles describe a prescriptive path by applying the design principles that provide a holistic view on the architectures.

## Assessment review tool

Assess your workload using the core pillars to **identify and prioritize opportunities** to improve the posture of your workloads.

## Integration with Power Platform guidance

TBD
<!-- pillars -->
[experience-pillar]: ./experience-optimization/index.yml
[security-pillar]: ./security/index.yml
[resiliency-pillar]: ./reliability/index.yml
[scalability-pillar]: ./performance-efficiency/index.yml
[devops-pillar]: ./operational-excellence/index.yml
