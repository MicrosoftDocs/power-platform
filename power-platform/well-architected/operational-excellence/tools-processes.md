---
title: Recommendations for standardizing tools and processes
description: Learn how to standardize your tools and processes and optimize your development and quality assurance practices.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for standardizing tools and processes

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:04](checklist.md)| **Optimize software development and quality assurance processes by following industry-proven practices for development and testing. For unambiguous role designation, standardize practices across components such as tooling, source control, application design patterns, documentation, and style guides.** |
|---|---|

This guide describes the recommendations for defining standards for development tools and processes. Defining consistent practices leads to an efficient workload team and high-quality work. High-performing teams use industry-proven tools and processes to minimize wasted effort and potential code errors.

## Key design strategies

The first step to optimize development practices is to standardize tools and processes. Whenever possible, use industry-proven solutions instead of developing your own. For all standardized tools and processes, provide training to ensure that your teams can use them efficiently.

To define standards that help optimize your development practices, consider the following recommendations.

### Use tools available to the platform

Prioritize using Power Platform tools and otherwise use well-known and mature off-the-shelf tools, and standardize their use. Highly effective engineering teams adopt the best-in-class tools. Avoid developing solutions for planning, development, testing, and collaboration. Choose tools that meet the requirements for your workload.

Tools should provide the following functions:

- Work planning and backlog management
- Version control and repositories
- Deployment pipelines
- Testing
- Code development and review

In some cases, one tool or a suite of tools might provide several functions. Ensure that you understand the capabilities of your tools and their limitations so that they meet your requirements across functions.

Determine if you should invest in premium features of the platform or premium versions of tools. Consider the time and effort of developing your own solutions compared to features that the premium tools provide. Consider one-time costs versus recurring costs. In most cases, off-the-shelf tools provide higher value to your team. For example, [Managed Environments](/power-platform/admin/managed-environment-overview) offers out-of-the-box features to set a maker onboarding message or to limit sharing proactively. Building these features yourself requires development and ongoing maintenance effort that might prove more costly than investing in Managed Environments.

Use AI tools when practical. AI tools can help with code development, reviews, and optimization.

### Establish a governance framework for codevelopment

Establish an effective codevelopment governance framework to ensure consistency and repeatability in maker-defined projects and fusion teams.

### Standardize your source control system and practices

Adopt a source code control system like Azure DevOps. [Azure DevOps](/azure/devops) provides developer services for support teams to plan work, collaborate on code development, and build and deploy applications. Export a solution from your development environment containing your apps and customizations, unpack your solution, and store the components in your source control system.

Ensure that solution versioning is accurate, following the sprint and developer guidelines set out in [Implement Scrum practices for your team in Azure Boards](/azure/devops/boards/sprints/scrum-overview). Test results from the pull request can take the form of screenshots or videos that depict the functionality that's being built. Automating the pull-request governance process helps ensure code quality without requiring a manual review of basic checks such as solution versions.

Create templates to deliver efficiency and promote consistency. All aspects of the team's operations benefit from standardization and simplification, from onboarding tasks and story review presentations to [work item templates](/azure/devops/boards/backlogs/work-item-template?tabs=browser) designed to save time and provide guidance to teams when defining user stories, features, bugs, and tasks.

### Evaluate metrics to quantify effectiveness

Development and quality assurance teams can only improve when they quantify their effectiveness. To quantify effectiveness, they must identify the metrics that measure [developer velocity](https://azure.microsoft.com/solutions/developer-velocity) and define key performance indicators (KPIs).

Examples of these metrics include:

- Lead time: The time that it takes for a task or user story to go from the backlog to a production deployment.
- Mean time to resolution: The average time that's spent fixing bugs or defects in code.
- Change failure rate: The percentage of changes that result in a failure.

To help stakeholders and the workload team easily track velocity, visualize KPIs by using dashboards or other reporting tools.

### Standardize how your workload team writes, reviews, and documents code

Standardize how your workload team writes, reviews, and documents code by using a style guide. A standard style makes collaboration easy and helps with on-boarding new developers. To work effectively, new developers need to know how the workload team operates. A style guide with clearly defined standards can ease their training process.

The style guide should cover:

- Naming conventions for solutions, artifacts, controls, actions, environments, branches, and builds
- Error handling standards
- Common patterns or libraries

Learn more about [Power Automate coding guidelines](/power-automate/guidance/coding-guidelines/) and [Power Apps coding guidelines](/power-apps/guidance/coding-guidelines/overview).

[!INCLUDE [pp-tip-powercat-toolkit](~/../shared-content/shared/guidance-includes/pp-tip-powercat-toolkit.md)]

Keep track of architecture decisions to help teams maintain a fresh understanding of the workload and allow new team members to learn about the design decisions made during the workload's life cycle. Include in your architecture decision document the tools and technologies that were considered, the reason for a decision, and functional and nonfunctional requirements that were factored into decisions. Record decisions to avoid repeating explanations or revisiting discussions with new members or stakeholders.

### Implement standards and guidelines for addressing technical debt

The platform and technology change quickly, with new features and capabilities rolling out regularly. Adopt a mindset that technical debt is necessary for your workload team's deliverables. This mindset motivates your team to consider and address technical debt regularly to avoid accumulation. Address technical debt as a regularly recurring task in the backlog. Ensure you have processes in place to remain current with platform changes, both new features and deprecations, and work on an action plan for how to address changes in your workload.

For example, a product feature might become deprecated or replaced with a different version. The workload team must prioritize completing the transition to the new feature to avoid affecting the workload. The team might build a custom solution or control, which over time becomes part of the platform. Your workload team must transition to that platform feature, which lowers technical debt and maintenance of your own workload.

Use industry-proven application design patterns to ensure that your application is reliable, performant, and secure. Use these patterns to save time and effort rather than develop your own solutions for your application. Choose the patterns that benefit your workload. Regularly review design patterns to ensure you use the right patterns as your workload evolves.

### Implement a shift-left approach to testing

Implement a shift-left approach to testing by performing unit testing early and often throughout the development process. Frequent testing in each development environment helps developers gain confidence in their applications.

To help create your testing strategy with a shift-left approach, consider the following principles:

- Write tests at the lowest level possible. Favor tests with the fewest external dependencies, and run tests as part of the build.
- Write tests once, and run tests everywhere, including production. Write tests that you can run in every development environment without accounting for factors that are specific to one environment, like encrypted secrets or configurations.
- Design your workload for testing. When you develop your application, make testability a requirement.
- Consider test ownership, which is based on workload ownership. Your workload team owns its testing and shouldn't rely on other teams to test its code.
- Automate tests as much as possible. Automated code relieves the burden on your workload team and enforces consistent quality.

Require your workload team to understand the security practices related to development and quality assurance. Team members must follow these practices without exception. Learn more in [Recommendations for securing a development life cycle](../security/secure-development-lifecycle.md).

## Power Platform facilitation

[Pipelines in Power Platform](/power-platform/alm/pipelines) aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service.

[Copilot-generated deployment notes](/power-platform/alm/copilot-deployment-notes-pipelines) in pipelines generate a solution summary and prefill the deployment notes field, giving anyone viewing the deployment request or record enough context to understand what the solution does and what it contains.

[Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) can be used to automate common build and deployment tasks related to apps built on Power Platform.

[GitHub Actions for Power Platform](/power-platform/alm/devops-github-actions) enable developers to build automated software development life cycle workflows. With [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions), you can create workflows in your repository to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Power Platform.

[Power Apps checker web API](/power-platform/alm/checker-api/overview) provides a mechanism to run static analysis checks against customizations and extensions to the Microsoft Dataverse platform.

[Test Studio](/power-apps/maker/canvas-apps/test-studio) allows you to build end-to-end UI tests for your canvas app.

[Automate tests with Azure Pipelines](/power-apps/maker/canvas-apps/test-studio-classic-pipeline-editor).

[Power CAT Code Review Tool](https://appsource.microsoft.com/en-us/product/dynamics-365/microsoftpowercatarch.powercattools?tab=Overview) allows you to perform code reviews.

[Power CAT Copilot Studio Kit](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit) allows you to configure agents and tests. By running individual tests against the Copilot Studio APIs (Direct Line), the agent responses are evaluated against expected results.

[ALM Accelerator](/power-platform/guidance/coe/setup-almaccelerator) is an open-source tool that consists of a set of applications, scripts, and pipelines designed to automate the continuous integration/continuous delivery process.

[Microsoft Power Platform CLI](/power-platform/developer/cli/introduction) (PAC CLI) is a command-line tool that supports the import and export of Power Platform solutions, and packing to and unpacking from Power Platform solutions source files. PAC CLI is available as a [standalone command-line tool](https://aka.ms/PowerAppsCLI) or as an [extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode).

Other tools and services that can help you standardize your development practices include:

- [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops), a collection of services that you can use to build a collaborative, efficient, and consistent development practice. Azure DevOps bundles the following solutions:
  - [Azure Pipelines](/azure/devops/pipelines), a cloud service that provides build and release services to support CI/CD of your applications.
  - [Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards), a web-based work management tool that supports Agile practices like Scrum and Kanban.
  - [Azure Repos](/azure/devops/repos/get-started/what-is-repos), a version control tool that supports the Git distributed version control system and the Team Foundation Version Control system.
  - [Azure Test Plans](/azure/devops/test/overview), a browser-based test management solution that provides capabilities that are required for planned manual testing, user acceptance testing, exploratory testing, and gathering feedback from stakeholders.

- [GitHub Projects](https://docs.github.com/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects), a work management tool that you can use to create Kanban boards, reports, dashboards, and other functions.

## Related information

[Codevelopment governance](/power-apps/guidance/co-develop/governance)

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
