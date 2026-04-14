---
title: Enterprise Power Platform ALM using Dataverse Git integration, Power Platform pipelines, and AI-assisted release governance
description: Learn how to streamline Power Platform development and releases by integrating Dataverse Git, Power Platform pipelines, and AI-assisted governance.
#customer intent: As a developer, I want to integrate Dataverse environments with Git so that I can manage source control and enable collaborative development.
author: carcla
ms.author: v-caclaesson
ms.date: 04/14/2026
ms.subservice: architecture-center
ms.topic: example-scenario
ms.reviewer: jhaskett-msft
---

# Enterprise Power Platform ALM using Dataverse Git integration, Power Platform pipelines, and AI-assisted release governance

## Architecture diagram

:::image type="content" source="media/enterprise-power-platform-alm/enterprise-power-platform-alm.png" alt-text="Diagram of Dataverse ALM workflow showing DEV, TEST, UAT, and Production environments with Git and Power Platform Pipelines integration.":::

## Workflow

1. **Development and source control workflow**

    1. Makers and developers build changes in one of several development Dataverse environments. In addition to a primary development environment, you might use extra dev environments. Examples include dev environments for junior developers, external resources, work-in-progress from long-running initiatives, or any other work that shouldn't automatically be promoted into the core production pathway.

    1. Each development stream maps to a Git environment or feature branch.

    1. Synchronize changes into Git through [Dataverse Git Integration](https://learn.microsoft.com/en-us/power-platform/alm/git-integration/overview).

    1. Review feature branches and merge them into Git main branch by using pull requests and branch protection policies when ready for submission into the production testing application lifecycle management (ALM) pathway.

    1. To avoid feature drift, pull changes accepted into the main branch into branches corresponding to all dev environments.

    1. The main branch becomes the authoritative source for integration and release promotion.

1. **Test and validation workflow**

        1. From the main branch, a hosted [Power Platform pipelines](https://learn.microsoft.com/en-us/power-platform/alm/custom-host-pipelines) pipeline promotes the packaged solution into TEST directly from the source code in the main branch by using the Source Control deployment type.

    1. Use TEST for technical validation, integration checks, and smoke testing.

        1. After validation, promote the solution to UAT by using Power Platform pipelines. Create or update the corresponding release branch in Git from the main branch.

        1. Generate release notes from DevOps work items in a UAT status and distribute them to UAT responsible testers. Use a Copilot Studio agent to generate and format these release notes by using the DevOps Get Query Results connector action.

    1. UAT supports business validation and release-readiness checks before production approval.

1. **Production release workflow**

        1. Promote approved UAT changes to production by using Power Platform pipelines.

    1. Generate release notes once again from DevOps work items by status for standardized release communication.

    1. Distribute release notes to technical and business stakeholders through approved channels, such as Teams, Outlook, or SharePoint.

1. **Hotfix workflow**

    1. Address urgent production issues in a dedicated hotfix environment.

    1. Connect hotfix environments to the current production Git release branch via Dataverse git integration.

    1. Promote validated hotfixes to production through the same controlled pipeline mechanism.

    1. Merge hotfix changes back from the release branch into the main branch to ensure they're kept intact in future releases.

## Use case details

### Business problem

As Power Platform adoption scales, organizations often struggle to maintain a consistent and governed development model across multiple makers, developers, and environments. Common challenges include shared development environments, limited change traceability, inconsistent release documentation, and difficulty applying standard software development life cycle controls in low-code delivery teams. These challenges increase deployment risk, slow collaboration, and make audit and compliance activities harder to support.

### Use case and value created

This reference architecture addresses these challenges by combining native Dataverse Git integration with Power Platform Pipelines, Azure DevOps governance, and AI-assisted release notes generation to create a repeatable enterprise ALM pattern.

The architecture is especially valuable for organizations that need to support multiple development environments working in parallel (DEV1, DEV2, DEV-n) while maintaining a shared, governed source of truth in Git. Each developer or small team can work in an isolated environment and synchronize changes through branch-based workflows, enabling teams to collaborate without relying on a single shared development environment.

Key value delivered by this architecture includes:

- **Source control as the source of truth** for solution customizations, rather than treating a maker environment as the authoritative deployment source. This approach improves consistency and supports controlled promotion into downstream environments.

- **Safety, auditing, and compliance through SDLC best practices**, including version control, code reviews, change traceability, and integration with enterprise governance processes.

- **Parallel development at scale**, using branches and isolated development environments so multiple contributors can build and iterate simultaneously with less collision risk.

- **Support for short-lived development environments**, enabling teams to rehydrate environments from source control for testing, experimentation, and temporary development scenarios while reducing long-term environment sprawl.

- **Fusion team productivity**, allowing makers, developers, and admins to collaborate through native in-product source control experiences while still aligning to enterprise DevOps practices.

- **Operational protection and recoverability**, because source control preserves version history and supports restoration to prior states when unintended changes occur.

In this architecture, the AI release notes agent additionally extends that value by improving operational communication and release transparency. It transforms approved DevOps work items into standardized, stakeholder-friendly release notes, reducing manual effort while preserving human review and accountability.

## Components

[**Microsoft Dataverse Git integration**](/power-platform/alm/git-integration/overview)

**Role in architecture:** Synchronizes solution changes to and from development environments into Git-based source control.

**Why chosen:**

- Enables source-backed ALM for Dataverse solution assets
- Supports branch-based team collaboration
- Reduces manual export and import handling

[**Azure DevOps Repos, Branching Strategy, and Work Items**](/azure/devops/user-guide/what-is-azure-devops)

**Role in architecture:** Hosts main, feature, and release branches and enforces pull request governance. Also houses work items and acts as the structured source for release scope and change summaries.

**Why chosen:**

- Includes strong enterprise policy controls, such as PR approvals, branch protection, and audit trails
- Enables native alignment with work items and release governance practices
- Provides consistent release scope definition
- Supports automated filtering of release-ready items
- Improves traceability between code changes and communicated release content

**Alternatives considered:**

- GitHub for [code repositories](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories) and [project work items](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)

**Why this architecture favors Azure DevOps:**  
Although GitHub Projects can provide flexible work tracking, including custom fields, roadmap views, and automation, this architecture includes Azure DevOps Boards as the authoritative release work-item source. Azure DevOps Boards currently provides stronger enterprise work item process modeling, shared query and WIQL-based release scoping, and richer built-in development and deployment traceability for governed release operations.

[**Power Platform Pipelines**](/power-platform/alm/custom-host-pipelines)

**Role in architecture:** Promotes solutions across TEST, UAT, and Production, including hotfix promotion paths.

**Why chosen:**

- Native Power Platform deployment experience
- Environment-aware deployment orchestration
- Accessible to both platform admins and solution teams

**Alternatives considered:**

- Azure DevOps or GitHub-only deployment orchestration
- Fully custom PAC CLI pipeline orchestration

**Why this architecture favors Power Platform Pipelines:**  
This architecture includes Power Platform pipelines as the primary environment promotion mechanism. The reason is that they reduce configuration complexity and specialized CI/CD knowledge requirements while providing a native, governed deployment experience for makers, admins, and pro developers.

[**Copilot Studio Release Notes Agent**](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)

**Role in architecture:** Generates standardized release notes from approved work items and release context.

**Why chosen:**

- Reduces manual release documentation effort
- Improves consistency and readability of release communication
- Supports dual audiences (business and technical stakeholders)

**Alternatives considered:**

- Manual authoring in email or wiki pages
- Templated but non-AI automation only

**Why this architecture includes AI:**  
It demonstrates practical, low-risk generative AI augmentation in a high-value operational process, with clear human review and accountability. It's more flexible to changing audiences, projects, and delivery avenues than rigid automation.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, which is a set of guiding tenets that can be used to improve the quality of a workload. For more information, see [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Reliability

This architecture improves reliability by implementing controlled promotion paths and branch-aware release handling.

How reliability is achieved:

- Standardized deployment progression from TEST to UAT to Production
- Dedicated hotfix path with release branch traceability
- Reusable pipeline mechanisms instead of manual deployments
- Validation checkpoints before production promotion

**Reliability outcome:** Reduced deployment failure risk and improved recoverability during urgent production support scenarios.

### Security

This architecture applies security through least privilege, role separation, and controlled automation identities.

How security is achieved:

- Role‑based access control across Power Platform environments and Azure DevOps
- service principals or managed identities for pipeline execution
- restricted production deployment permissions
- auditable branch merge and release activities
- approved channels for release note distribution

**Security outcome:** Reduced risk of unauthorized changes and improved change accountability.

### Operational Excellence

This area scores highly for this architecture.

How operational excellence is achieved:

- Codified branch strategy (feature, main, release)
- Repeatable environment promotion process
- Standardized hotfix handling pattern
- Automated release notes generation integrated into release workflow
- Reduced reliance on tribal knowledge for release communication

**Operational excellence outcome:** Release operations become repeatable, supportable, and easier to scale across teams.

### Performance Efficiency

This architecture optimizes delivery process efficiency more than runtime app performance, which is appropriate for an ALM reference architecture.

How performance efficiency is achieved:

- Automating deployment and release communication steps
- Reducing manual coordination overhead
- Standardizing the workflow for faster release cycle execution
- Scaling to DEV-n parallel streams without redesigning governance

**Performance efficiency outcome:** Increased throughput for change delivery and lower operational effort per release.

### Experience Optimization

This architecture improves the experience for multiple personas:

- **Developers and makers** through clear environment and branch workflows
- **Release managers** through standardized promotion and traceability
- **Business stakeholders** through readable AI-assisted release summaries
- **Support teams** through a defined hotfix route

How experience optimization is achieved:

- Role-aligned workflows
- Predictable promotion model
- Consistent release note format and timing
- Minimized ambiguity in handoffs between teams

**Experience optimization outcome:** Better collaboration and lower friction across the release lifecycle.

## Responsible AI

- **Fairness**: The AI capability summarizes approved release work items and doesn't make personnel, eligibility, or customer-impacting decisions.

- **Reliability and Safety**: Human reviewers check content before distribution.

- **Privacy and Security**: The agent processes scoped enterprise release metadata only, such as approved work items and release context. Follow organizational data governance and connector policies for sensitive data handling.

- **Inclusiveness**: The generated output supports both technical and nontechnical audiences through structured sections and plain-language summaries.

- **Transparency**: Label release notes as AI-assisted and identify the reviewed source of truth through links to the actual source work items in DevOps.

- **Accountability**: A named release owner or deployment approver remains accountable for final release content and production deployment decisions.

## Next steps

1. [Connect your Dataverse development environments to a Git repository](https://learn.microsoft.com/en-us/power-platform/alm/git-integration/connecting-to-git)
1. [Plan your Azure DevOps organizational structure and strategy](https://learn.microsoft.com/en-us/azure/devops/user-guide/plan-your-azure-devops-org-structure)
1. [Pull work items from DevOps with Copilot Studio via connectors as tools](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-connectors)

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Nick Talsma](https://www.linkedin.com/in/biswapm/)**, Power Platform Technical Architect, Ludia Consulting
