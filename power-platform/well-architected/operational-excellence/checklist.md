---
title: Recommendation checklist for Operational Excellence
description: Follow this checklist of recommendations that help you achieve an Operational Excellence approach in your Power Platform workload team.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: checklist
ms.date: 05/16/2024
---

# Recommendation checklist for Operational Excellence

This checklist presents a set of recommendations to help you build a culture of operational excellence. Start with a fusion development and DevOps approach to integrate specializations from multiple disciplines. This approach creates a rigorous design and development practice that leads to repeatable, reliable, and safe deployments of infrastructure and code.

Prioritize human intervention in areas that benefit from it, and incorporate automation in other areas. Observability serves operational excellence by monitoring health events and validating the current workload design and implementation to inform future product development.

If you don't consider tradeoffs and recommendations for operational excellence, your workload might be at risk. Carefully consider the points covered in the following checklist to instill confidence in your design's success.

## Checklist

| &nbsp; | Code | Recommendation |
|-|-|-|
| &#9744; | [OE:01](fusion-culture.md) | **Determine workload team members' specializations, and integrate them into a robust set of practices** to design, develop, deploy, and operate your workload to specification. Team members must have clarity in decision making and responsibilities, value continuous improvement and optimization, and adopt a blameless culture that incorporates continuous learning. |
| &#9744; | [OE:02](formalize-operations-tasks.md) | **Formalize the way you run routine, as-needed, and emergency operational tasks** by using documentation, checklists, or automation. Strive for consistency and predictability for team processes and deliverables by adopting industry-leading practices and approaches, such as a "shift left" approach. |
| &#9744; | [OE:03](formalize-development-practices.md) | **Formalize software ideation and planning processes.** Draw from established industry and organizational standards. Use a common, prioritized backlog and sufficiently detailed specifications. Based on outcomes, drive continuous improvements in your planning process. |
| &#9744; | [OE:04](tools-processes.md) [OE:04](release-engineering-continuous-integration.md) | **Optimize software development and quality assurance processes** by following industry-proven practices for development and testing. For unambiguous role designation, standardize practices across components such as tooling, source control, application design patterns, documentation, and style guides. |
| &#9744; | [OE:05](workload-supply-chain.md) | **Build a workload supply chain that drives proposed changes** through predictable, automated pipelines. The pipelines test and promote those changes across environments. Optimize a supply chain to make your workload reliable, secure, cost-effective, and performant. |
| &#9744; | [OE:06](observability.md) | **Design and implement a monitoring system** to validate design choices and inform future design and business decisions. This system captures and exposes operational telemetry, metrics, and logs that are emitted from the workload. |
| &#9744; | [OE:07](emergency-response.md) | **Develop an effective emergency operations practice.** Ensure that your workload emits meaningful health signals. Collect the resulting data and use it to generate actionable alerts that enact emergency responses through dashboards and queries. Clearly define human responsibilities, such as on-call rotations, incident management, emergency resource access, and running postmortems. |
| &#9744; | [OE:08](automate-tasks.md) | **Automate all tasks that don't benefit from the insight and adaptability of human intervention, are highly procedural, and have a shelf-life that yields a return on automation investment.** When possible, choose off-the-shelf software for automation versus custom implementations. Treat all automation the same as workload components, and apply the Power Platform Well-Architected pillars to its design and implementation. |
| &#9744; | [OE:09](enable-automation.md) | **Design and implement automation up front** for operations such as life cycle concerns, and apply governance and compliance guardrails. Don't try to retrofit automation later. Choose automation features that your platform provides. |
| &#9744; | [OE:10](safe-deployments.md) | **Clearly define your workload's safe deployment practices.** Emphasize the ideals of small, incremental, quality-gated release methods. Use modern deployment patterns to control risk. Account for routine deployments and emergency, or hotfix, deployments. |
| &#9744; | [OE:11](mitigation-strategy.md) | **Implement a deployment failure mitigation strategy** that addresses unexpected mid-rollout issues with rapid recovery. Combine multiple approaches, such as rollback, feature disablement, or using your deployment pattern's native capabilities. |

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence tradeoffs](tradeoffs.md)
