---
title: Recommendations for formalizing routine and nonroutine tasks
description: Learn how to standardize and formalize routine, as-needed, and emergency operational tasks to enhance operational efficiency.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/16/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for formalizing routine and nonroutine tasks

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:02](checklist.md)| **Formalize the way you run routine, as-needed, and emergency operational tasks by using documentation, checklists, or automation. Strive for consistency and predictability for team processes and deliverables by adopting industry-leading practices and approaches, such as a "shift left" approach.** |
|---|---|

This guide describes the recommendations for formalizing routine and nonroutine tasks. Formalizing routine and nonroutine tasks is crucial for efficient and successful workload management practices. Adoption of industry-proven tools and practices helps workload teams optimize efficiency and consistency and automate processes when practical. This practice helps minimize the risk of being unprepared when issues arise and ensures that workload support is efficient. By being consistent about how routine, improvised, and emergency tasks are handled, workload team members can minimize the risk of errors and reinforce a common sense of ownership.

## Key design strategies

Consistent processes make your work quality predictable, and predictable work quality makes workload support smoother. To achieve consistency in your processes, you need to standardize processes and document standard operating procedures. Standardization helps workload teams maintain and continuously improve their workload under the overall governance of the organization. Use strategies like automation and shift-left approaches to minimize potential areas of unpredictability.

Process standardization takes many shapes. Here are some general recommendations:

- The processes that you standardize should cover all aspects of workload management: reliability, security, performance, experience, and operational processes. The workload team should have as much ownership of the processes as it needs to maintain and continuously improve the workload under the overall governance of the organization.

- The documentation that you produce captures your standard operating procedures and dictates how things are done, but the documentation is never final. Procedures should evolve as your workload and your team evolve. Regularly review and challenge standards to ensure that they're the right standards for your team right now. Your documentation should be templatized and version-controlled to ensure consistency in the documentation formats and that there's a record of reviews and updates.

- Break down routine, improvised, and emergency tasks into checklist items that are easy to understand so that workload teams can achieve consistency in their processes and minimize potential areas of unpredictability.

An example of a routine task is the process of applying an upgrade to a solution that is in the production environment. When you determine that you need to perform a solution upgrade, the workload team might create a checklist that includes items such as:

- Test the update in test and staging environments.
- Create a change management request to deploy the upgrade in production.
- Update the documentation, such as a wiki or knowledge base, to reflect the latest information.
- Review the outage window to minimize disruption to users.

    Focus each checklist item on a discrete task that is clearly defined.

- Improvised and emergency tasks are scenario-specific, but operators should still clearly understand their roles and responsibilities. They need to know how to interact with the workload team and with other teams in the organization to efficiently work through those types of tasks.

    For example, an improvised task might involve turning on a new environment setting or feature, or using code components for developer experiences. There might not be a fully realized checklist for the testing of this type of resource. However, there should be general checklists for adding new resources or features to your environments and standards that cover testing for performance, security, and reliability at each stage.

    Likewise, your emergency response plan should clearly define roles and responsibilities and general processes and procedures. You must adhere to this plan in emergency situations to ensure that you handle them efficiently.

    Improvised and emergency operations are also good opportunities to learn how to improve your standard operating procedures. Ask the workload team to reflect on ways that the operations could have gone smoother, and determine whether an update to existing processes could be beneficial going forward.

- Adopt industry-proven practices to minimize the time your team spends on inventing processes and standards. Following [Agile practices](/azure/devops/boards/plans/agile-culture) with Scrum, organizing your work through Kanban boards, and adopting a shift-left ethos are all examples of practices that are effective for organizations of any size. Many mature organizations use version-controlled standard operating procedures, wikis, new employee manuals, and operations manuals to enforce consistency.

    Rely on your team's experience to decide which practices fit your workload life cycle management. Learn from other teams about the standards they successfully implemented to understand how particular practices fit into your organizational structure.

- Incorporate organizational requirements and cross-cutting functions into your standard operating procedures. Your organization might have standards for some processes that you should adopt, such as change management and support. However, you might also be empowered to develop your own standards for other processes, so look for ways to incorporate required standards into your processes. The processes that you own are likely to intersect with other teams' processes, so strive to align standards to a practicable extent.

    Document where the workload team's and other teams' processes diverge to ensure that the workload team can work better with other teams when there are intersection points. Central security teams might use different tools and procedures than the workload team, and the teams can collaborate more easily if they're aware of those differences.

- Use automation to achieve consistency. Automate tasks that are repetitive and prone to human error to relieve management burden from your team. Look for opportunities to automate processes, such as generating IT service management tickets. Learn more in [Recommendations for implementing automation](automate-tasks.md).

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Codifying standard operating procedures can carry the risk of leading to stagnation or complacency. Standards should be followed, but they shouldn't be rigid or static. Strive to find a balance between strict adherence and allowance for innovation so that your processes can evolve safely over time.

## Power Platform facilitation

Although there are no Power Platform products that directly facilitate the formalization of processes and procedures, Microsoft publishes comprehensive guidance on this subject. Use this guidance to understand industry-proven and recommended practices and to consider how to apply them to your workload.

Power Platform Well-Architected also provides detailed guidance on the processes and procedures that should be codified to ensure that your workload and workload team run according to industry standards:

- [Recommendations for implementing automation](automate-tasks.md)
- [Recommendations for enabling automation in your workload](enable-automation.md)
- [Recommendations for formalizing software development management practices](formalize-development-practices.md)
- [Promote an Agile culture within your team](/azure/devops/boards/plans/agile-culture)

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
