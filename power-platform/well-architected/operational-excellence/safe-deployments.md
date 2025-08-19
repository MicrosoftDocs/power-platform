---
title: Recommendations for safe deployment practices
description: Learn how to establish safe deployment practices and define processes for rolling out changes to your workload. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for safe deployment practices

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:10](checklist.md)| **Clearly define your workload's safe deployment practices. Emphasize the ideals of small, incremental, quality-gated release methods. Use modern deployment patterns to control risk. Account for routine deployments and emergency, or hotfix, deployments.** |
|---|---|

This guide describes the recommendations for using safe deployment practices. Safe deployment processes and procedures define how to safely make and deploy changes to your workload. Implementing them requires you to think about deployments through the lens of managing risk. You can minimize the risk of human error in your deployments and limit the effects of problematic deployments on your users by implementing these practices.

## Key design strategies

There are important guidelines to keep in mind when implementing safe deployment practices:

- **Safety and consistency**: All changes to the production workload are inherently risky and must be made with a focus on safety and consistency.
- **Health models**: Deployments must pass health checks before each phase of progressive exposure can begin.
- **Issue detection**: When issues are detected, the deployment should be immediately halted and recovery initiated.

The following sections provide detailed recommendations on each of these points.

### Safety and consistency

Whether you're deploying an update to your application code, infrastructure as code (IaC), feature flag, or configuration, you're introducing risk to the workload. There are no low-risk deployments to production. Every deployment must follow a standard pattern and should be automated to enforce consistency and minimize the risk of human error. It's critical that your workload supply chain and deployment pipelines are reliable, secure, and have clearly defined deployment standards. Treat every deployment as a possible risk and subject every deployment to the same level of risk management.

Despite the risks, you should continue to deploy regular changes to your workload. Failing to deploy regular updates introduces other risks, like security vulnerabilities that must be addressed through deployments. Learn more in [Recommendations for designing a workload development supply chain](workload-supply-chain.md).

Frequent small deployments are preferable to infrequent large deployments. Small changes are easier to resolve when issues arise and frequent deployments help your team build confidence in the deployment process. It's also important that you learn from production by reviewing your workload processes when you encounter an anomaly during deployment. You might find weaknesses in the design of your infrastructure or rollout. When issues occur during deployments, ensure that blameless postmortems are part of your process to capture lessons about the incident.

### Health models

Develop a robust health model as part of your observability monitoring platform and reliability strategies. Your health model should provide in-depth visibility into the components and overall health of the workload. Monitor the health metrics closely following a rollout. If you receive an alert about a health change during the rollout, investigate the issue immediately and determine the next course of action, such as rolling back the change. If users don't report issues and all health indicators stay green, the rollout should continue. Be sure to include usage metrics in your health model to help ensure that a lack of user-reported issues and negative health signals isn't hiding an issue. Learn more in [Recommendations for performing failure mode analysis](../reliability/failure-mode-analysis.md).

### Issue detection

When your deployment causes an issue in one of the rollout groups, the rollout must stop immediately. Investigate the cause of the issue and the severity of the effects as soon as the alert is received. Recovery from the issue can include:

- **Rolling back** by undoing the changes made in the deployment and reverting back to the last known working configuration.
- **Rolling forward** by addressing the issue during the rollout. You can address issues mid-rollout by applying a hotfix or otherwise minimizing the issue.
- **Deploying new infrastructure** by using the last known working configuration.

Rolling back changes, especially database, schema, or other stateful component changes, can be complex. Your safe deployment practices guidelines should provide clear instructions on how to deal with data changes according to the data estate design for your workload. Similarly, rolling forward must be handled carefully to ensure that safe deployment processes aren't neglected and that the hotfix or other minimizing efforts are performed safely.

### General recommendations

- Implement versioning across your build artifacts to help ensure that you can roll back and roll forward when necessary.

- Use a release flow or trunk-based branching structure, which enforces tightly synced collaboration across the development team, instead of a Gitflow or environment-based branching structure.

- Automate as much of your safe deployment practice as possible. Learn more in [Recommendations for implementing automation](automate-tasks.md).

- Use continuous integration (CI) practices to regularly integrate code changes into repositories. CI practices can help you identify integration conflicts and reduce the likelihood of large, risky merges. Learn more in [Recommendations for continuous integration](release-engineering-continuous-integration.md).

- Use feature flags to selectively enable or disable new features or changes in production. Feature flags can help you control the exposure of new code and quickly roll back deployment if issues arise.

- Deploy changes to staging environments that mirror your production environment. Practice environments allow you to test changes in a controlled setting before deploying to the live environment.

- Establish predeployment checks, including code review, security scans, and compliance checks, to help ensure that changes are safe to deploy.

- Implement circuit breakers to automatically halt traffic to a service that's experiencing issues and help prevent further degradation of the system.

### Emergency protocols

Establish prescriptive protocols that define how your safe deployment processes can be adjusted for a hotfix or for emergency issues like a security breach or vulnerability exposure. For example, your emergency protocols might include:

- Promotion and approval stage acceleration
- Smoke testing and integration testing acceleration
- Bake time reduction

In some cases, the emergency might limit quality and testing gates, but gates should still be run as quickly as possible as an out-of-band exercise. Make sure that you define who can approve safe deployment acceleration in an emergency and the criteria that must be met for acceleration to be approved. Align your emergency protocols with your [emergency response plan](emergency-response.md) to help ensure that all emergencies are handled according to the same protocols.

## Considerations

Building and maintaining safe deployment practices is complex. Your success in fully implementing robust standards depends on the maturity of your practices across many areas of software development. Use of automation, IaC-only for infrastructure changes, consistency in branching strategies, feature flags, and other practices can help ensure safe deployment. Use this guide to optimize your workload and inform your plans for improvement as your practices evolve.

## Power Platform facilitation

The [Deployment page](/power-platform/alm/admin-deployment-hub) in the Power Platform admin center provides a streamlined experience to help administrators navigate the complexities of managing Power Platform application lifecycle management (ALM) workloads, including managing pipelines deployments at enterprise scale. Admins have visibility to all the deployments in their tenant and can approve deployment requests and troubleshoot issues.

[Pipelines in Power Platform](/power-platform/alm/pipelines) aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service. Pipelines can be custom tailored to serve the unique needs of an organization, For example you can add approvals, deploy via service principals, and integrate with internal systems of record, Azure DevOps, GitHub, and more. Learn more in [Extend pipelines in Power Platform](/power-platform/alm/extend-pipelines).

[Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) can be used to automate common build and deployment tasks related to apps built on Power Platform.

[GitHub Actions for Power Platform](/power-platform/alm/devops-github-actions) enable developers to build automated software development life cycle workflows. With [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions), you can create workflows in your repository to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Power Platform.

[Automate tests with Azure Pipelines](/power-apps/maker/canvas-apps/test-studio-classic-pipeline-editor).

[Environment variables in solutions](/power-apps/maker/data-platform/environmentvariables) store the parameter keys and values, which then serve as input to other application objects. Separating the parameters from the consuming objects allows you to change the values within the same environment or when you migrate solutions to other environments.

[Power Platform environments](/power-platform/admin/backup-restore-environments) provide point-in-time restore functionality that can help you roll back.

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
