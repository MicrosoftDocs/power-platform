---
title: Reliability design principles for well-architected Power Platform workloads
description: Understand the design principles of the Power Platform Well-Architected Reliability pillar.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: concept-article
ms.date: 08/18/2025
---

# Reliability design principles

A reliable workload must be resilient so that it can detect and recover from outages and malfunctions and consistently deliver functionality. It must be capable of recovering from failures within a reasonable timeframe. It must also be available so that users can consistently and reliably access the workload during the agreed timeframe and at the agreed quality level.

Use the following design principles from the [Microsoft Azure Well-Architected Framework](/azure/well-architected) to help ensure reliability throughout the entire lifecycle. Start with the recommended best practices and justify the benefits of each reliability principle. Once you set your strategy, use the [Reliability checklist](./checklist.md) as your next step.

If you don't apply these principles to your design, the workload most likely won't be prepared to anticipate or handle problems in production. The outcome might be service disruptions that lead to financial loss. In the case of critical workloads, failing to apply these principles could jeopardize safety.

## Design for business requirements  

| ![Goal icon](../_images/goal.svg) Collect and understand business needs with a focus on the expected use of the workload. |
| -- |

Requirements should include the user experience, workflows, data, and workload-specific features. The goals should be realistic and agreed with all stakeholders, based on a given budget. The requirements should clearly define the expectations with the team and stakeholders. Document requirements to guide technology choices, implementations, and operations.

Learn more about [designing for business requirements](/azure/well-architected/reliability/principles#design-for-business-requirements) in the Azure Well-Architected Framework.

## Design for resilience

| ![Goal icon](../_images/goal.svg) The workload must respond to failures and continue to operate with full or reduced functionality. |
| -- |

Design your workload to be able to identify faults and component outages. Make the system resilient so that it can tolerate faults and handle them smoothly. Inform users about the system state and set the expectations of what components are unavailable and how long expected recovery will take.

Learn more about [designing for resilience](/azure/well-architected/reliability/principles#design-for-resilience) in the Azure Well-Architected Framework.

## Design for recovery

| ![Goal icon](../_images/goal.svg) The workload must be able to recover from failures with minimal disruption to the user experience and business objectives. |
| -- |

Put in place structured, tested, and documented recovery plans that lead to quick recovery. Ensure your support and operations teams have access to these plans and recovery drills are performed frequently to avoid confusion and chaos during an actual outage.

Learn more about [design for recovery](/azure/well-architected/reliability/principles#design-for-recovery) in the Azure Well-Architected Framework.

## Design for operations

| ![Goal icon](../_images/goal.svg) The workload must be observable, and development teams must be able to learn from failures. |
| -- |

Build monitoring into your workload so that development and support teams have enough data to analyze when, why, and what component is failing. Build meaningful alerts to notify support teams in the event of a failure. Use analytics and insights to drive improvements.

Learn more about [designing for operations](/azure/well-architected/reliability/principles#design-for-operations) in the Azure Well-Architected Framework.

## Keep it simple

| ![Goal icon](../_images/goal.svg) Avoid overengineering the architecture design, application code, and operations. |
| -- |

Focus on the business requirements and remove features and components that aren't necessary. Establish standards for development and deployment that increase consistency. Take advantage of platform-provided features and pre-built assets to minimize development time.

Learn more about [keeping it simple](/azure/well-architected/reliability/principles#keep-it-simple) in the Azure Well-Architected Framework.

## Next steps

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
