---
title: Recommendations for continuous integration
description: Learn how to optimize software development and quality by following industry-proven practices for development and testing.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 06/13/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for continuous integration

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:04](checklist.md)| **Optimize software development and quality assurance processes by following industry-proven practices for development and testing. For clear role designation, standardize practices across components such as tooling, source control, application design patterns, documentation, and style guides.** |
|---|---|

Adoption of continuous integration/continuous delivery (CI/CD) can increase development complexity for citizen developers. However, a scalable and automated development process that can quickly incorporate new features and bug correction is critical for a reliable, sustainable fusion development process.

As a developer, you can make small code changes, push these changes to a code repository, and get almost instantaneous feedback on the quality, test coverage, and introduced bugs. This process lets you work faster and with more confidence and less risk. Continuous integration is a practice where source control systems and deployment pipelines are integrated to provide automated build, test, and feedback mechanisms for software development teams.

## Key design strategies

Continuous integration is a software development practice that developers use to integrate software updates into a source control system at a regular cadence.

The continuous integration process starts when an engineer creates a GitHub pull request to signal to the CI system that code changes are ready to be integrated. Ideally, the integration process validates the code against several baselines and tests. It then provides feedback to the requesting engineer on the status of these tests.

If baseline checks and testing go well, the integration process produces and stages assets that deploy the updated software. These assets include compiled code and container images.

Continuous integration can help you deliver high-quality software more quickly by performing the following actions:

- Run automated tests against the code to provide early detection of breaking changes.
- Run code analysis to ensure code standards, quality, and configuration.
- Run compliance and security checks to ensure that the software includes no known vulnerabilities.
- Run acceptance or functional tests to ensure that the software operates as expected.
- Provide quick feedback on detected problems.
- Where applicable, produce deployable assets or packages that include the updated code.

### Environments

Environment setup and configuration are critical to sustainable and reliable CI/CD. Power Platform environments can be set up to isolate different stages of solution development, testing, and deployment. The CI/CD process moves changes through those stages. Establish an [environment strategy](/power-apps/guidance/co-develop/governance) with guiding principles for developer environments.

### Continuous integration pipelines

To achieve continuous integration, use tools to manage, integrate, and automate the process. A continuous integration pipeline provides:

- A platform for running automated tests
- Compliance scans
- Reporting
- All other components that make up the continuous integration process

In most cases, the pipeline software is attached to source control so that when pull requests are created or software is merged into a specific branch, the continuous integration pipeline runs. Source control integration also provides the opportunity to give CI feedback directly on pull requests.

Many solutions, like Azure Pipelines or GitHub Actions, provide the capabilities of continuous integration pipelines. Learn more in [Build CI/CD with Azure for Microsoft Power Platform](/azure/architecture/solution-ideas/articles/azure-devops-continuous-integration-for-power-platform).

### Source control integration

The integration of your continuous integration pipeline with your source control system is key to enabling fast, self-service code contributions.

The CI pipeline runs on a newly created pull request. The pipeline includes all tests, security assessments, and other checks. CI test results appear directly in the pull request to allow for almost real-time feedback on quality.

Another popular practice is building small reports or badges that can be presented in source control to make the current build states visible.

The following image shows the integration between GitHub and an Azure DevOps pipeline. In this example, the creation of a pull request triggers the pipeline. The pipeline status appears in the pull request.

:::image type="content" source="media/release-engineering-continuous-integration/image1.png" alt-text="Screenshot of an Azure DevOps status badge in a GitHub repository.":::

### Test integration

A key element of continuous integration is the continual building and testing of code as developers make code contributions. Testing pull requests as they're created gives immediate feedback that the commit introduced no breaking changes. The advantage is that the tests in the continuous integration pipeline can be the same tests that run during test-driven development.

:::image type="content" source="media/release-engineering-continuous-integration/devops-ci.png" alt-text="Example diagram of continuous integration.":::

#### Quality checks for custom code

When including custom code in your solutions, add code quality checks to a validation pipeline to ensure clean custom code is being committed to source control. Regardless of the coding language and syntax patterns you're using, there are multiple options for maintaining code quality and increasing security and governance.

#### Failed tests

Failed tests should temporarily block a deployment and lead to a deeper analysis of what happened. Failed tests should also lead to either a refinement of the tests or an improvement in the change that caused the tests to fail.

## Power Platform facilitation

[Pipelines in Power Platform](/power-platform/alm/pipelines) aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service.

[Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) can be used to automate common build and deployment tasks related to apps built on Power Platform.

[GitHub Actions for Power Platform](/power-platform/alm/devops-github-actions) enable developers to build automated software development life cycle workflows. With [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions), you can create workflows in your repository to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Microsoft Power Platform.

[ALM Accelerator](/power-platform/guidance/coe/setup-almaccelerator) is an open-source tool that consists of a set of applications, scripts, and pipelines designed to automate the continuous integration/continuous delivery process.

[Automate tests with Azure Pipelines](/power-apps/maker/canvas-apps/test-studio-classic-pipeline-editor).

[Power Apps checker Web API](/power-platform/alm/checker-api/overview) provides a mechanism to run static analysis checks against customizations and extensions to the Microsoft Dataverse platform.

[Microsoft Power Platform CLI](/power-platform/developer/cli/introduction) (PAC CLI) is a command-line tool that supports the import and export of Power Platform solutions, and packing to and unpacking from Power Platform solutions source files. PAC CLI is available as a [standalone command-line tool](https://aka.ms/PowerAppsCLI) or as an [extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode).

## Related information

- [Application lifecycle management (ALM) with Microsoft Power Platform](/power-platform/alm/)
- [Build CI/CD with Azure for Microsoft Power Platform](/azure/architecture/solution-ideas/articles/azure-devops-continuous-integration-for-power-platform)
- [Power Platform environments](/power-platform/admin/environments-overview)
- [Establishing an environment strategy](/power-platform/guidance/white-papers/environment-strategy)
- [Codevelopment governance](/power-apps/guidance/co-develop/governance)
- [Use scenarios to implement healthy ALM with Microsoft Power Apps](/power-platform/alm/implement-healthy-alm)
- [Automate tests with Azure Pipelines](/power-apps/maker/canvas-apps/test-studio-classic-pipeline-editor)

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
