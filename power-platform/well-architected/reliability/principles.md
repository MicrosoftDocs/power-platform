---
title: Reliability design principles for well-architected Power Platform workloads
description: Understand the design principles of the Power Platform Well-Architected Reliability pillar.
author: manuelap-msft
ms.author: mipichle
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: conceptual
ms.date: 05/10/2024
---

# Reliability design principles

A reliable workload must survive outages and malfunctions and consistently deliver functionality. It must be resilient, capable of identifying, withstanding, and recovering from failures within a reasonable timeframe. It must also be available so that users can consistently and reliably access the workload during the agreed timeframe and at the agreed quality level.

Use the following design principles from [Microsoft Azure Well-Architected Framework](/azure/well-architected) to help ensure reliability throughout the entire lifecycle. Start with the recommended best practices and justify the benefits of each reliability principle. Once you set your strategy, use the [Reliability checklist](./checklist.md) as your next step.

If you don't apply these principles to your design, the workload most likely won't be prepared to anticipate or handle problems in production. The outcome might be service disruptions that lead to financial loss. In the case of critical workloads, failing to apply these principles could jeopardize safety.

## Design for business requirements  

| ![Goal icon](../_images/goal.svg) Gather business requirements with a focus on the intended utility of the workload. |
| -- |

[Get more information about this principle](/azure/well-architected/reliability/principles#design-for-business-requirements), including approaches and benefits, in Azure Well-Architected Framework.

## Design for resilience

| ![Goal icon](../_images/goal.svg) The workload must continue to operate with full or reduced functionality. |
| -- |

[Get more information about this principle](/azure/well-architected/reliability/principles#design-for-resilience), including approaches and benefits, in Azure Well-Architected Framework.

## Design for recovery

| ![Goal icon](../_images/goal.svg) The workload must be able to anticipate and recover from most failures, of all magnitudes, with minimal disruption to the user experience and business objectives. |
| -- |

[Get more information about this principle](/azure/well-architected/reliability/principles#design-for-recovery), including approaches and benefits, in Azure Well-Architected Framework.

## Design for operations

| ![Goal icon](../_images/goal.svg) Shift left in operations to anticipate failure conditions. |
| -- |

[Get more information about this principle](/azure/well-architected/reliability/principles#design-for-operations), including approaches and benefits, in Azure Well-Architected Framework.

## Keep it simple

| ![Goal icon](../_images/goal.svg) Avoid overengineering the architecture design, application code, and operations. |
| -- |

[Get more information about this principle](/azure/well-architected/reliability/principles#keep-it-simple), including approaches and benefits, in Azure Well-Architected Framework.

## Next steps

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
