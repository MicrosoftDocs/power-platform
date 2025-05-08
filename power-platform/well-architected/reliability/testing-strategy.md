---
title: Design a reliability testing strategy recommendation for Power Platform workloads
description: Learn how to establish a reliability testing strategy that tests resiliency and availability scenarios. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for designing a reliability testing strategy

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

|[RE:06](checklist.md)| **Test for resiliency and availability scenarios by applying the principles of chaos engineering in your test and production environments. Use testing to ensure that your graceful degradation implementation strategies are effective by performing active malfunction and simulated load testing.** |
|---|---|

This guide describes the recommendations for designing a reliability testing strategy to validate and optimize the reliability of your workload. Reliability testing focuses on the resiliency and availability of your workload, specifically the critical flows that you identify when you design your solution. This guide provides general testing guidance and guidance that's specific to fault injection and chaos engineering.

**Definitions**

| Term | Definition |
| --- | --- |
| Availability | The amount of time that an application workload runs in a healthy state without significant downtime. |
| Chaos engineering | The practice of subjecting applications and services to real-world stresses and failures. The goal of chaos engineering is to build and validate resilience to unreliable conditions and missing dependencies. |
| Fault injection | The act of introducing an error to a system to test the resiliency of the system. |
| Recoverability | A synonym for resiliency. |
| Resiliency | An application workload's ability to withstand and recover from failure modes. |

## Key design strategies

Testing is essential to ensure that your workload meets its reliability targets and can handle failures gracefully. Fault injection is a type of testing that deliberately introduces faults or stress into your system to simulate real-world scenarios. By using fault injection and chaos engineering techniques, you can proactively discover and fix issues before they affect your production environment. This section provides general guidance on testing, fault injection, and chaos engineering for your workload.

### General testing guidance

Routinely perform testing to validate existing thresholds, targets, and assumptions. When a major change occurs in your workload, run regular testing. Perform most testing in testing and staging environments. It's also beneficial to run a subset of tests against the production system.

Automate testing to help ensure consistent test coverage and reproducibility. Automate common testing tasks and integrate them into your build processes. Manually testing software is tedious and susceptible to error, but you can conduct manual exploratory testing. For cases in which you need to develop automated testing, use manual testing to determine the scope of the tests to develop.

Adopt a shift-left testing approach to perform resiliency and availability testing early in the development cycle.

Adapt a simple documentation format, so it's easy for everyone to understand the process and the results of every regular test.

Share the documented results with the appropriate teams, like operational teams, technology leadership, business stakeholders, and disaster recovery stakeholders. The results should inform the refinement of reliability targets, such as service-level objectives (SLOs), service-level agreements (SLAs), recovery time objectives (RTOs), and recovery point objectives (RPOs).

Create a regular testing cadence for your backups. Restore the data to isolated systems to help ensure that the backups are valid and that restores are functional.

Document and share recovery time metrics with your disaster recovery stakeholders to ensure that expectations for recovery are appropriate.

Use industry-standard deployment testing procedures to help ensure that you have an automated, predictable, and efficient deployment process.

Test your workload's ability to withstand transient failures. For more information, see [Recommendations for handling transient faults](./handle-transient-faults.md).

Test how your workload handles failures in dependent services or other dependencies by using fault injection.

Test your [disaster recovery plan](disaster-recovery.md) to respond to catastrophic failures and other major incidents.

Test your workload's ability to degrade gracefully and minimize the blast radius of component malfunction by using fault injection.

### Take advantage of planned and unplanned outages

When your workload is offline due to planned maintenance or an unplanned outage, you have a unique opportunity to perform testing and improve your understanding of your workload. The following sections provide recommendations for each scenario.

#### Planned maintenance

When you have planned maintenance windows for updates or patches, you can test components and flows that aren't involved in the maintenance work. Perform tests without the potential risk of unexpectedly degrading the workload or taking it offline altogether. If you have enough time during your maintenance window, you can also test the components and flows that are involved in the maintenance after the maintenance work is complete.

#### Unplanned outage

Use every outage incident as an opportunity to learn more about your workload and improve its resiliency by following these steps, ordered by priority:

1. Get the workload back online for your users. You might need to perform a workaround for the issue, resolve the issue, or initiate the recovery processes.

1. Determine the root cause of the outage and address it. If you can fix the root cause as part of the investigation, document the root cause and the measures that you took to fix it. If the issue requires taking another maintenance window later, ensure that your mitigation measures can handle the expected load by thoroughly testing them. Ensure that you have set up sufficient monitoring to cover your mitigation measures.

1. If applicable, look for the same issue, or configuration weaknesses that might be affected by similar issues, across all the components in your workload. Use this opportunity to proactively address those components. Consult your incident history to detect patterns of similar issues across your workload.

1. Use your findings to improve your testing strategy. Ensure that you have successfully addressed the root cause and similar problems by directly testing the same failure.

### Fault injection and chaos engineering guidance

Fault injection testing follows the principles of chaos engineering by highlighting the workload's ability to react to component failures. Perform fault injection testing in preproduction and production environments. Apply the information that you learned from [performing failure mode analysis](failure-mode-analysis.md) to ensure that you test only faults that you prioritize and that you have mitigation strategies that address faults.

The key guidelines of chaos engineering are:

- **Be proactive.** Don't wait for failures to happen. Try to anticipate failures by conducting chaos experiments to discover and fix issues before they affect your production environment.

- **Embrace failure.** Accept and learn from the failures that occur in your system. See failures as a natural part of complex systems and use them as opportunities to learn and improve your system's reliability.

- **Break the system.** Deliberately inject faults or stress into your system to test its resilience. Simulate real-world failures or disruptions to test and improve your workload's recovery capabilities.

- **Build immunity.** Use chaos engineering experiments to improve your workload's ability to prevent and recover from failures.

Chaos engineering is an integral part of workload team culture and an ongoing practice, not a short-term tactical effort in response to a single outage. Follow this standard method when you design your chaos experiments:

1. Start with a hypothesis. Each experiment should have a clear goal, like testing a flow's ability to withstand the loss of a particular component.

1. Measure baseline behavior. Ensure that you have consistent reliability and performance metrics for the flow and components involved in an experiment to compare with the degraded state when running your experiment.

1. Inject a fault or faults. The experiment should intentionally target specific components that can be recovered quickly, and you should have an informed expectation of the effect that the fault injection will cause to help control the experiment's blast radius.

1. Monitor the resulting behavior. Gather telemetry about the individual flow components and the end-to-end flow behavior that the experiment targets to properly understand the effects of the fault. Compare the metrics that you gather with the baseline metrics for a full picture of the fault injection results.

1. Document the process and observations. Keeping detailed records of your experiments will inform future decisions about the workload design, ensuring that you address the gaps that have been revealed over time.

1. Identify and act on the result. Plan for remediation steps that can be added to your workload backlog as improvements. Ensure that design improvement plans are reviewed and tested in nonproduction environments according to the same processes as other deployments.

Periodically validate your process, architecture choices, and code to quickly detect technical debt, integrate new technologies, and adapt to changing requirements.

When you conduct fault-injection experiments, you:

- Confirm that monitoring is in place and alerts are set up.

- Validate your process of assigning a directly responsible individual (DRI) to take ownership of an incident.

- Ensure that your documentation and investigation processes are up to date.

Integrate the following recommendations and considerations to optimize your chaos testing strategy:

- Challenge system assumptions. With testing, you try to improve the resiliency of your workload and your workload design strategies. Look for opportunities to inject faults into components and flows that you assume are reliable based on past experiences. They might not be reliable in your new workload.

- Validate change. Without thorough testing, including fault injection testing, you might have an incomplete picture of your workload after changes are made. For example, you might introduce new dependencies that aren't immediately apparent.

- Use SLA buffers. Limit chaos testing to stay within your SLAs and avoid potential adverse effects from outages. Your flow and component recovery targets help define the scope of your testing.

- Establish an error budget as an investment in chaos and fault injection. Your error budget is the difference between achieving 100% of the SLO and achieving the agreed-on SLO.

- Stop the experiment if it goes beyond scope. Unknown results are an expected outcome of chaos experiments. Strive to achieve balance between collecting substantial result data and affecting as few production users as possible.

- Work closely with development teams to ensure the relevance of the injected failures. Use past incidents or issues as a guide. Examine dependencies and evaluate the results when you remove those dependencies.

- Identify and document previously undiscovered dependencies between different components within your workload that are revealed through chaos testing.

- Adjust recovery plans as necessary to account for dependencies that are discovered during chaos testing.

- Use the results from your experiments and tests as the basis for new experiments and tests. As unexpected behaviors arise, new tests might target those behaviors directly and give you the opportunity to design remediation strategies for them.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Fault injection testing in production can be disruptive and can potentially cause downtime. Be transparent with stakeholders about this possibility and ensure that you have safeguards in place to terminate experiments and rollback plans to quickly reverse the failures that you introduce.

## Power Platform facilitation

You can use [static results in Power Automate](/azure/logic-apps/test-logic-apps-mock-data-static-results?tabs=consumption#set-up-mock-outputs-on-an-action) to return a fixed result to test your workload.

[Power Apps Test Engine (preview)](/power-apps/developer/test-engine/overview) is a Power Platform CLI component that you can use to test standalone canvas apps in Power Apps.

[Azure Test Plans](/azure/devops/test/overview) is an easy-to-use, browser-based test management solution that provides all the capabilities required for planned manual testing, user acceptance testing, exploratory testing, and gathering feedback from stakeholders.

If your workload includes Azure resources, you can use [Azure Chaos Studio](https://azure.microsoft.com/services/chaos-studio), a managed service that uses chaos engineering to help you measure, understand, and improve your cloud application and service resilience.

If your workload includes a Microsoft Copilot Studio agent, you can use the [Power CAT Copilot Studio Kit](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit) to configure agents and tests. By running individual tests against the Copilot Studio APIs (Direct Line), the agent responses are evaluated against expected results.

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
