---
title: Recommendations for designing a deployment failure mitigation strategy
description: Learn how to design a standardized strategy for handling deployment failures, enabling issue mitigation and recovery.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for designing a deployment failure mitigation strategy

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:11](checklist.md)| **Implement a deployment failure mitigation strategy that addresses unexpected mid-rollout issues with rapid recovery. Combine multiple approaches, such as rollback, feature disablement, or using your deployment pattern's native capabilities.** |
|---|---|

This guide describes the recommendations for designing a standardized strategy to effectively handle deployment failures. Like other workload issues, deployment failures are an inevitable part of a workload life cycle. With this mindset, you can be proactive by having a well-designed, intentional strategy for dealing with deployment failures. Such a strategy enables your workload team to efficiently mitigate failures with as little impact as possible on your users.

The absence of such a plan can lead to chaotic and potentially detrimental responses to issues, which can significantly affect team and organizational cohesion, customer trust, and finances.

## Key design strategies

Occasionally, despite the maturity of your development practices, deployment issues occur. Using safe deployment practices and operating a robust workload supply chain can help you minimize the frequency of failed deployments. You also need to design a standardized strategy to handle failed deployments when they happen.

A deployment failure mitigation strategy is composed of five broad phases:

1. **Detection**: To respond to a failed deployment, you must first detect the failure. Detection can take several forms, like failed smoke tests, user reports, or alerts that your monitoring platform generates.
1. **Decision**: You must decide what the best mitigation strategy is for the specific failure type.
1. **Mitigation**: You must perform the identified mitigation action. The mitigation can take the form of a fallback, rollback, or roll forward.
1. **Communication**: Stakeholders and affected users must be made aware of the status as you detect and work through the issue, as required by your emergency response plan.
1. **Postmortem**: Blameless postmortems provide opportunities for the workload team to identify areas for improvement and create plans to apply learnings.

The following sections provide detailed recommendations for these phases.

### Detection

To quickly identify issues with deployments, you need robust testing and monitoring practices that relate to deployments. To help detect anomalies quickly, you can complement your workload monitoring and alerting by using an application performance management tool and logging through instrumentation.

Smoke testing and other quality testing should happen at each phase of your rollout. Successful tests in one deployment group shouldn't influence decisions to test in subsequent groups.

You can implement telemetry that correlates user issues with a deployment phase. Then you can quickly identify which rollout group a particular user is associated with. This approach is especially important for progressive exposure deployments, because you might have multiple configurations running across your user base at any given point in the deployment.

You should be ready to respond to user-reported issues immediately. Whenever practical, deploy your rollout phase during working hours, when you have a full support team available. Ensure support staff are trained on how to escalate deployment issues for proper routing. Escalations should align with your workload emergency response plan.

### Decision

Deciding on an appropriate mitigation strategy for a deployment issue involves considering factors such as:

- The type of progressive exposure model that you use. For example, you might use a blue-green model or a canary model. If you use a blue-green model, falling back is more practical than rolling back. You can easily shift traffic back to the stack that runs the configuration that's not updated. You can then fix the issue in the problematic environment and try your deployment again at an appropriate time.

- The methods that you have at your disposal for bypassing the issue. Examples include the use of feature flags, environmental variables, or any other type of runtime configuration property that you can toggle on and off. Sometimes you can easily bypass an issue by turning off a feature flag or toggling a setting. In this case, you might be able to:

  - Proceed with the rollout.
  - Avoid falling back.
  - Roll back while you fix the offending code.

- The level of effort required to implement a fix in the code. If the level of effort to fix the code is low, rolling forward by implementing a hotfix is the right choice for certain scenarios.

- The level of criticality for the affected workload. Business-critical workloads should always be deployed in a side-by-side manner, like in a blue-green model, to achieve zero-downtime deployments. As a result, falling back is the preferable mitigation strategy for these types of workloads.

### Mitigation

The following are some common mitigation strategies:

- **Rollback**: In a rollback scenario, you revert updated systems to the last-known-good configuration state.

    It's important for the entire workload team to agree about the meaning of "last known good." This expression refers to the last state of the workload that was healthy before the deployment began, which isn't necessarily the prior application version.

    Rolling back can be complex, especially as it relates to data changes. Schema changes can make rolling back risky. Implementing them safely can require considerable planning. As a general recommendation, schema updates should be additive. Records shouldn't be replaced with new records. Instead, older records should be deprecated and should coexist with new records until it's safe to remove the deprecated records.

- **Fallback**: In a fallback scenario, the updated systems are removed from the production traffic routing. All traffic is directed to the stack that isn't updated. This low-risk strategy provides a way for you to address the issues in your code without introducing further disruptions.

    With canary deployments, falling back might not be straightforward or even possible, depending on your infrastructure and app design. If you need to perform scaling to handle load on systems that aren't updated, perform that scaling before you fall back.

- **Bypass the offending function**: If you can bypass the issue by using feature flags or another type of runtime configuration property, you might decide that continuing with the rollout is the right strategy for an issue.

    You should clearly understand the tradeoff of bypassing the function, and you should be able to communicate that tradeoff to stakeholders. Stakeholders should approve the go-forward plan. Stakeholders need to determine the length of time that's tolerable for operating in a degraded state. They also need to weigh that determination against your estimate of the time that's needed to fix the offending code and deploy it.

- **Emergency deployment (hotfix)**: If you can address the issue mid-rollout, a hotfix might be the most practical mitigation strategy.

    Like any other code, hotfixes need to go through your safe deployment practices. But with a hotfix, the timeline is considerably accelerated. You need to use a code promotion strategy throughout your environments. You also need to check hotfix code at all quality gates. But you might need to dramatically shorten bake times, and you might need to modify tests to accelerate them. Ensure that you can run full tests on the updated code as soon as possible after deployment. Automating quality assurance testing to a high degree helps make testing efficient in these scenarios.

### Communication

It's important to clearly define communication responsibilities to help minimize chaos during incidents. These responsibilities should establish how the workload team engages with support teams, stakeholders, and emergency response team personnel, like the emergency response manager.

Standardize the cadence that the workload team follows for providing status updates. Ensure that stakeholders are aware of this standard so that they know when to expect updates.

If the workload team needs to communicate directly with users, clarify the type of information and level of detail that are appropriate for sharing. Also communicate to the workload team any other requirements that apply to these cases.

### Postmortem

Postmortems should follow all failed deployments without exception. Every failed deployment is an opportunity for learning. Postmortems can help you identify weaknesses in your deployment and development processes and misconfigurations in your infrastructure.

Postmortems should always be blameless so that individuals who are involved in the incident feel safe when they share their perspectives on what can be improved. Postmortem leaders should follow up with plans for implementing the improvements that are identified and for adding these plans to the workload backlog.

### Considerations and general recommendations

Ensure that your deployment pipeline can accept distinct versions as parameters so that you can easily deploy last-known-good configurations.

Maintain consistency with the management and data planes as you roll back or roll forward. Keys, secrets, database state data, and configurations that are specific to resources and policies all need to be in scope and accounted for. For example, pay attention to the design of your infrastructure scaling in your last-known-good deployment. Determine whether you need to adjust that configuration when you redeploy your code.

Prefer small, frequent changes over infrequent, large changes so that the difference between your new and last-known-good deployments is small.

Perform a failure mode analysis on your continuous integration and continuous delivery (CI/CD) pipelines to help identify issues that can complicate mitigation efforts. As with your workload as a whole, your pipelines can be analyzed to identify areas that might be problematic when you attempt a given mitigation type.

Use automated rollback functionality judiciously:

- Some CI/CD tools like Azure DevOps have automatic rollback functionality built in. Consider using this functionality if it provides tangible value to you.
- You should adopt automatic rollback functionality only after you test your pipeline thoroughly and regularly. Ensure that your pipeline is mature enough to introduce extra issues if an automatic rollback is triggered.
- You need to trust that the automation deploys only necessary changes and that it's triggered only when necessary. Design your triggers carefully to meet these requirements.

Use platform-provided capabilities during rollbacks. For example, backups and point-in-time restore can help with storage and data rollbacks. Or if you use virtual machines to host your application, it can be helpful to restore your environment to a checkpoint from immediately before an incident.

Test your entire deployment failure mitigation strategy frequently. Like emergency response plans and disaster recovery plans, your deployment failure plan is only successful if your team is trained on it and practices it regularly. [Chaos engineering and fault injection testing](../reliability/testing-strategy.md#fault-injection-and-chaos-engineering-guidance) can be effective techniques for testing your deployment mitigation strategy.

## Power Platform facilitation

The [Deployment page](/power-platform/alm/admin-deployment-hub) in the Power Platform admin center provides a streamlined experience to help administrators navigate the complexities of managing Power Platform application lifecycle management (ALM) workloads, including managing pipelines deployments at enterprise scale. Admins have visibility to all the deployments in their tenant and can approve deployment requests and troubleshoot issues.

[Pipelines in Power Platform](/power-platform/alm/pipelines) aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service.

[Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) can be used to automate common build and deployment tasks related to apps built on Power Platform.

[GitHub Actions for Power Platform](/power-platform/alm/devops-github-actions) enable developers to build automated software development life cycle workflows. With [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions), you can create workflows in your repository to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Microsoft Power Platform.

[ALM Accelerator](/power-platform/guidance/coe/setup-almaccelerator) is an open-source tool that consists of a set of applications, scripts, and pipelines designed to automate the continuous integration/continuous delivery process.

[Automate tests with Azure Pipelines](/power-apps/maker/canvas-apps/test-studio-classic-pipeline-editor).

Use the [Power CAT Copilot Studio Kit](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit) to configure agents and tests. By running individual tests against the Copilot Studio APIs (Direct Line), the agent responses are evaluated against expected results.

[Environment variables in solutions](/power-apps/maker/data-platform/environmentvariables) store the parameter keys and values, which then serve as input to other application objects. Separating the parameters from the consuming objects allows you to change the values within the same environment or when you migrate solutions to other environments.

[Power Platform environments](/power-platform/admin/backup-restore-environments) provide point-in-time restore functionality that can help you roll back.

Power Platform integrates with [Application Insights](/azure/azure-monitor/app/app-insights-overview), which is part of the [Azure Monitor](/azure/azure-monitor/overview) ecosystem. Use this integration to:

- Receive telemetry on diagnostics and performance captured by the [Dataverse platform in Application Insights](/power-platform/admin/overview-integration-application-insights). You can subscribe to receive telemetry about operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.

- Connect your [canvas apps to Application Insights](/power-apps/maker/canvas-apps/application-insights). You can use these analytics to diagnose issues and understand what users do with your apps. You can collect information to help you drive better business decisions and improve the quality of your apps.

- Configure [Power Automate telemetry](/power-platform/admin/app-insights-cloud-flow) to flow into Application Insights; for example, to monitor cloud flow executions and create alerts for cloud flow run failures.

- Capture telemetry data from your [Microsoft Copilot Studio agent](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry) for use in Azure Application Insights. You can use this telemetry to monitor logged messages and events sent to and from your agent, topics to be triggered during user conversations, and custom telemetry events that can be sent from your topics.

## Operational Excellence checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
