---
title: Performance Efficiency design principles for well-architected Power Platform workloads
description: Understand the design principles of the Power Platform Well-Architected Performance Efficiency pillar.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: concept-article
ms.date: 08/15/2025
---

# Performance Efficiency design principles

Performance is a key factor in the success of any Power Platform workload. Poor performance can frustrate users, reduce productivity, and increase costs. To avoid these problems, you need to design your solutions with performance in mind from the start. A performant workload is able to handle changes in load without compromising the user experience or exceeding throughput and request limits of the platform.

Use the following design principles from the [Microsoft Azure Well-Architected Framework](/azure/well-architected) to help build a strategy that ensures the performance meets your business requirements whilst at the same time staying within the limits and capabilities of Power Platform services. Start with the recommended best practices and justify the benefits of each performance efficiency principle. Once you set your strategy, use the [Performance Efficiency checklist](checklist.md) as your next step.

Without a clear understanding of the performance expectations of your workload, you might end up spending too much or too little on resources and fail to satisfy user needs.

## Negotiate realistic performance targets

|![Goal icon](../_images/goal.svg) The intended user experience is defined, and there's a strategy to develop a benchmark and measure targets against the pre-established business requirements.|
|--|

Start your design process with clear performance targets based on the business needs and expectations. Rather than just focusing on technical metrics, work with business stakeholders to set expectations and define targets that are aligned with the expected user experience of the workload.

Learn more about [establishing achievable goals for performance](/azure/well-architected/performance-efficiency/principles#negotiate-realistic-performance-targets) in the Azure Well-Architected Framework.

## Design to meet performance requirements

|![Goal icon](../_images/goal.svg) Select the right services to meet performance targets.|
|--|

It's important to proactively measure performance. Choose services and features across the technology stack that enable you to meet your performance goals, monitor performance, and track which components of the workload might pose challenges. Also, define a process for testing performance.

Learn more about [designing to meet performance requirements](/azure/well-architected/performance-efficiency/principles#design-to-meet-capacity-requirements) in the Azure Well-Architected Framework.

## Achieve and sustain performance

|![Goal icon](../_images/goal.svg) Protect against performance degradation while the system is in use and as it evolves.|
|--|

Performance isn't a one-time activity. You need to keep working on it throughout the development of the workload. Expect to test and optimize your workload multiple times. Any changes to requirements, configuration, code, or product features can affect performance. 

Learn more about [achieving and maintaining performance](/azure/well-architected/performance-efficiency/principles#achieve-and-sustain-performance) in the Azure Well-Architected Framework.

## Improve efficiency through optimization

|![Goal icon](../_images/goal.svg) Improve system efficiency within the defined performance targets to increase workload value.|
|--|

Establish a performance culture that allows developers to spend time on performance optimization. Adjust performance targets based on user experience, and monitor which components of your workload experience heavy load. Continue to evaluate new product features that could improve performance. The cycle of monitoring, optimizing, testing, and deploying is a continuous process.

Learn more about [improving efficiency through optimization](/azure/well-architected/performance-efficiency/principles#improve-efficiency-through-optimization) in the Azure Well-Architected Framework.

## Next steps

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
