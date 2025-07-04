---
title: Recommendations for implementing automation
description: Learn how to establish standards and ensure consistency by automating tasks that are repetitive and might be prone to human error.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/10/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for implementing automation

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:08](checklist.md)| **Automate all tasks that don't benefit from the insight and adaptability of human intervention, are highly procedural, and have a shelf-life that yields a return on the automation investment. Prefer off-the-shelf software for automation over custom implementations where available. Treat all automation as workload components, applying Well-Architected pillars to their design and implementation.** |
|---|---|

This guide describes the recommendations for adopting automation in your workload. You can automate tasks that are repetitive and prone to human error to help your teams gain efficiency and adhere to standards. Automation enables your operations and engineering teams to be more efficient because it gives them more time to work on other improvements. Automation is a powerful tool in all aspects of workload management. Thoughtfully implement automation to empower your organization.

## Key design strategies

As you develop your workload, look for opportunities to take advantage of automation to reduce management burden and minimize human error. Evaluate these opportunities and consider the value that they bring to your organization. To maximize the value of your investment in automation, prioritize tasks that are straightforward, procedural, and have a long shelf-life. Applying automation isn't an all-or-nothing tactic. There are workstreams that might have operations that require human intervention, like decision-making points. These workstreams can still benefit from automation to perform other tasks.

### Target tasks to automate

Consider the following recommendations to ensure that you prioritize tasks that benefit the most from automation:

- **Aim for easy wins.** Focus on tasks that are highly procedural and susceptible to human error. These tasks are highly automatable. They're clearly defined, they're free from variables that add complexity, and they're performed as part of normal operations. Conversely, don't prioritize automating tasks that require writing complex scripts to account for variable phenomena or that rarely occur. Examples of highly automatable tasks include granting permissions, creating environments, or applying policies to environments. These tasks might occur on a schedule, as a response to an event or monitoring alert, or as needed based on external factors.

- **Look for ways to empower operators and free up your SMEs.** You might have subject matter experts (SMEs) in your organization whom you rely on for escalations that might be unnecessary. For example, your Power Platform admin might routinely get requests to create new environments or apply data policies to an environment when new workloads are starting their development. If you build a request management portal, you can enable developers to request environments that automatically get created after approval. You might even decide to automatically approve requests from certain teams.

- **Focus on your return on investment.** High-value automation requires minimal management overhead and adds a demonstrable degree of efficiency. If you can save your operations team an hour each day by automating environment creation, for example, you give them time to find other areas for improvement.

### Areas to implement automation

Adopt automation throughout your entire workload life cycle, from development to day-to-day management. Use the following examples to help you consider the broad areas of your workload life cycle that can benefit from automation:

- **Pipeline definition, execution, and management**: Use continuous integration and continuous delivery (CI/CD) tools, like Azure DevOps and other DevOps tools, to automatically define a pipeline and how it runs. These tools can help you automate CI/CD tasks or other tasks, like creating reports.

- **Deployments**: Use tools like Azure Resource Manager templates, Bicep, Terraform, and Ansible to automate your workload development and release processes.

- **Testing**: Some tools are available for automating your testing processes. These tools can relieve a significant burden from your quality assurance team and ensure that tests are standardized and reliable.

- **Monitoring and alerting**: Use tooling that's available in your monitoring solution to automatically enroll newly deployed resources and configure alert-triggered actions to help hasten remediation when issues arise.

- **Configuration management**: Use orchestration and policy tooling to ensure that all of your resources run the same configuration and that compliance requirements are enforced across your workload.

- **Other administrative tasks**: Use scripts to automate repetitive tasks like creating environments or applying policies.

- **Approvals**: Enable systems to automatically make approval decisions based on predefined rules to improve efficiency for workflows that have approval gates. This method encourages the use of standardized forms and templates, which increases the efficiency of the processes. Automatic approval in high environments can be risky. Tightly focus and test your automated approvals to ensure that specific criteria are defined to grant approval.

- **New user and new employee onboarding**: You can automate many tasks that are associated with onboarding new application users or new employees, like granting permissions or access to resources.

### Choose an appropriate automation tool

Developing your own automation in-house is time-intensive and can introduce management burden to your development team. They need to maintain an in-house automation tool like they do any other in-house software. It's recommended that you use off-the-shelf tools whenever they can meet your needs. Between commercial, open source, and cloud platform tools, there are many options available. It's likely that you'll use a variety of tools to build the automation that you need. Reflect on the tasks that you plan to address with automation, and invest in the tools that can specifically address those tasks. Don't procure tools that you generally prefer and then consider the tasks afterward.

### Integrate automation into your workload

For any tool that you use to build your automation, make it easily accessible and manageable for your operators. Provide clear and easy-to-use interfaces for your workload team. You can provide access to CI/CD pipelines, APIs, and libraries. Like the workload that the automation supports, you need to manage the automation holistically. Secure automation to the same degree as other workload components. Monitor automation and subject it to the same testing protocols as other workload components.

## Considerations

Sometimes the efficiencies that you gain from automation outweigh the management burden of developing your own solution if no off-the-shelf solutions fit your requirements. In these cases, be judicious in your development efforts. Narrowly focus on developing only what you need to cover gaps that you can't solve with off-the-shelf solutions, and minimize complexities like dependencies.

Complex automation that requires a high degree of maintenance can be difficult for operations teams to manage and troubleshoot. Keep automated tasks tightly focused on only performing discrete jobs. Try to minimize dependencies on other tools or components.

Be thoughtful about using manual processes. If you decide not to automate an operation, thoroughly document the manual process by creating a step-by-step checklist for operators. This practice reduces the chances of human error, like an operator mistakenly running the wrong process. Documentation also helps you design automation for that process in the future.

When you use a hybrid manual and automated approach, you need to be especially careful. If a script runs most of a process but then defers to a human for a specific part or decision, it's important that you give the person the necessary context and information to make an informed decision.

## Power Platform facilitation

[Power Automate](https://azure.microsoft.com/products/power-automate/) enables you to automate Power Platform workloads; for example, custom digital process automation to handle workload tasks like approval flows. With Power Automate, you can construct workflows from built-in connectors and templates. The large ecosystem of software as a service (SaaS) connectors enables you to connect apps like Microsoft 365 and Azure, data, and devices in the cloud. You can use [Power Platform admin connectors](/connectors/powerplatformforadmins/) to connect to the Power Platform service itself and perform operational tasks, such as creating environments or sharing applications.

Power Automate approvals (out of the box) or the [approvals kit](https://www.microsoft.com/power-platform/blog/power-automate/introducing-approvals-kit/) (a custom solution) enable you to implement both simple and complex approval flows that can aid in automation scenarios. Learn more in [Business approvals templates overview](/power-automate/guidance/business-approvals-templates/introduction).

[GitHub Actions](https://help.github.com/articles/about-github-actions) enable developers to build automated software development life cycle workflows. With [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions), you can create workflows in your repository to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Power Platform.

[Microsoft Power Platform Build Tools](/power-platform/alm/devops-build-tools) can be used to automate common build and deployment tasks related to apps built on Power Platform.

[ALM Accelerator](/power-platform/guidance/coe/setup-almaccelerator) is a set of applications, scripts, and pipelines designed to automate the continuous integration/continuous delivery process. The toolkit uses Power Platform and Azure DevOps to deliver an end-to-end ALM (application lifecycle management) experience for both low-code and professional developers.

[Power Platform CoE Starter Kit](/power-platform/guidance/coe/starter-kit) is a reference implementation that contains a collection of components and tools designed to help you get started with developing a strategy for adopting and supporting Power Platform. Included with the CoE Starter Kit is a rich set of processes that automate your administrative and governance tasks, such as identifying ownerless and highly used applications.

[Programmability and extensibility](/power-platform/admin/programmability-extensibility-overview#available-tools) tools are available for administrators to orchestrate and automate routine activities for their tenants. Available tools include connectors, the Power Platform CLI, PowerShell cmdlets, and APIs.

## Related information

- [Environment Request Management](/power-platform/guidance/coe/setup-environment-components), part of the CoE Starter Kit
- [Business approvals templates](/power-automate/guidance/business-approvals-templates/introduction)

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
