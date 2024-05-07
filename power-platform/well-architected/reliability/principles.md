---
title: Reliability design principles
description: Understand the design principles of the Reliability pillar.
author: manuelap-msft
ms.author: prwilk
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: conceptual
ms.date: 05/10/2024
---

# Reliability design principles

A reliable workload must survive outages and malfunctions and consistently deliver functionality. It must be resilient, capable of identifying, withstanding, and recovering from failures within a reasonable timeframe. Additionally, it must be available so that users can consistently and reliably access the workload during the agreed timeframe and at the agreed quality level.
 
Use the following design principles, modeled on the Microsoft Azure Well-Architected Framework, to help ensure reliability throughout the entire development lifecycle. Start with the recommended best practices and justify the benefits of each reliability principle. Once you set your strategy, use the [Reliability checklist](./checklist.md) as your next step.

- [Design for business requirements](/azure/well-architected/reliability/principles#design-for-business-requirements). Gather business requirements with a focus on the intended utility of the workload.
- [Design for resilience](/azure/well-architected/reliability/principles#design-for-resilience). The workload must continue to operate with full or reduced functionality.
- [Design for recovery](/azure/well-architected/reliability/principles#design-for-recovery). The workload must be able to anticipate and recover from most failures, of all magnitudes, with minimal disruption to the user experience and business objectives.
- [Design for operations](/azure/well-architected/reliability/principles#design-for-operations). Shift left in operations to anticipate failure conditions.
- [Keep it simple](/azure/well-architected/reliability/principles#keep-it-simple). Avoid overengineering the architecture design, application code, and operations.

## Next steps

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
