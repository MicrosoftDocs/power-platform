---
title: Publishing considerations for intelligent application workloads
description: Publishing considerations for intelligent application workloads TODO
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Publishing considerations for intelligent application workloads

It’s key to have a healthy application lifecycle management (ALM) process to avoid production issues and catch and fix any regression early.

## Determine Your ALM Strategy

Develop a comprehensive ALM strategy that includes version control, continuous integration/continuous deployment (CI/CD), and automated testing. This ensures that your development process is efficient and scalable.

Evaluate options from simple to advanced continuous integration & delivery (CI/CD)

- Manual deployment of solutions
- Automated deployment with user-friendly [pipelines in Power Platform](/power-platform/alm/pipelines) (no source control).
- Automated deployment + source control with [Azure DevOps](/power-platform/alm/devops-build-tools) or [GitHub Power Platform](/power-platform/alm/devops-github-actions) tools.
- Automated testing of the copilot as part of the deployment process.

## Use solutions for environment management

Maintain separate environments for development, testing, and production. This helps in isolating issues and ensures that changes are thoroughly tested before reaching end users.

Utilize solutions to move plug-ins created in Copilot Studio across different environments. This makes it easier to manage and deploy your projects.

Key recommendations and considerations:

- **Work within the context of solutions**: Ensure all development is conducted within the framework of solutions.
- **Separate solutions for independent deployment**: Create distinct solutions only when there is a need to deploy components independently.
- **Understand limitations**: Understand limitations of automated deployment, and evaluate which settings have to be set or updated manually after deployment - such as Azure Application Insights integration, deployed channels and security settings.
- **Utilize a custom publisher and prefix**: Implement a custom publisher and prefix for better organization and management.
- **Use environment variables**: Use [environment variables](/power-apps/maker/data-platform/environmentvariables) for settings and secrets that vary across environments.
- **Export and deploy as managed solutions**: Export and deploy solutions as managed, except when setting up a development environment.
- **Restrict customizations to development**: Avoid making customizations outside of the development environment.
- **Automate ALM processes**: Consider automating ALM for source control and automated deployments.

### Example

The example provides an overview of the deployment strategy for your intelligent application workload, detailing the roles and processes associated with each environment: Development (Dev), Testing (Test), Quality Assurance (QA), and Production (Prod).

![Example solution configuration](media/solutionconfig.png)

1. **Development Environment (Dev):**
   - **Purpose:** This environment is dedicated to the initial creation and customization of the solution.
   - **Activities:** Developers build and modify components such as apps, flows, and copilots. All customizations and configurations are performed here.
   - **Key Practices:**
     - Use a custom publisher and prefix for all components.
     - Implement environment variables for settings and secrets.
     - Ensure all changes are version-controlled and documented.

2. **Testing Environment (Test):**
   - **Purpose:** This environment is used for preliminary validation and testing of the developed solution.
   - **Activities:** Solutions are exported from the Dev environment as managed solutions and imported into the Test environment. Functional and integration testing is conducted to identify and resolve issues early.
   - **Key Practices:**
     - Maintain a separate Test environment to simulate real-world scenarios.
     - Use environment variables to manage settings and secrets specific to the Test environment.
     - Automate deployment processes to ensure consistency and repeatability.

3. **Quality Assurance Environment (QA):**
   - **Purpose:** This environment is dedicated to thorough quality assurance and user acceptance testing (UAT).
   - **Activities:** Managed solutions are imported from the Test environment into the QA environment. Extensive testing, including performance, security, and UAT, is conducted to ensure the solution meets all requirements and standards.
   - **Key Practices:**
     - Use environment variables to manage QA-specific settings and secrets.
     - Involve end-users in UAT to gather feedback and ensure the solution meets their needs.
     - Automate testing processes where possible to enhance efficiency and accuracy.

4. **Production Environment (Prod):**
   - **Purpose:** This environment hosts the live, user-facing version of the solution.
   - **Activities:** After successful QA testing, the managed solution is exported from the QA environment and imported into the Production environment. This environment is strictly controlled to ensure stability and reliability.
   - **Key Practices:**
     - Deploy solutions as managed to prevent unauthorized changes.
     - Use environment variables to manage production-specific settings and secrets.
     - Monitor and maintain the solution to ensure optimal performance and address any issues promptly.

**Overall Strategy:**

- **Separation of Concerns:** Each environment serves a distinct purpose, ensuring that development, testing, QA, and production activities do not interfere with one another.
- **Automation:** Automate ALM processes, including source control, testing, and deployments, to enhance efficiency and reduce the risk of errors.
- **Consistency:** Maintain consistency across environments by using environment variables and automated deployment scripts.

## Establish a test strategy

Understand your plans to validate that your copilots and integrations work as expected.

Define your test strategy for intelligent application workloads. Use of the [Test Framework](https://aka.ms/PVASamples/PVATestFramework) to bulk test user utterances and validate that the appropriate topic triggers or that the first ‘did you mean’ option is the correct one in 90% of the time.
Integrations will be tested as part the full end-to-end conversation testing with the Test Framework scale test capability.

Use the [Power CAT Copilot Studio Kit](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit) to configure copilots and tests. By running individual tests against the Copilot Studio APIs (Direct Line), the copilot responses are evaluated against expected results.

Ensure that you understand nonfunctional requirements like availability, compliance, data retention/residency, performance, privacy, recovery time, security, and scalability. For example, a chat widget on the website should load and start the conversation in less then 5 seconds when clicked or a cloud flows triggered to return information to the user need to return the desired data in a maximum of 10s.

## See also

- [Power Platform ALM](/power-platform/alm/)
- [Recommendations for safe deployment practices](../operational-excellence/safe-deployments.md)