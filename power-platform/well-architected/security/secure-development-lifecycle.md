---
title: Recommendations for securing a development lifecycle
description: Learn about Well-Architected Framework Security recommendations for securing a development lifecycle. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: sericks
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for securing a development lifecycle

**Applies to this Power Well-Architected Security checklist recommendation:**

|[SE:02](checklist.md)|Maintain a secure development lifecycle by using a hardened, mostly automated, and auditable software supply chain. Incorporate a secure design by using threat modeling to safeguard against security-defeating implementations.|
|--|---|

This guide describes the **recommendations for** **securing your code and development** **environment** by applying security best practices throughout the development cycle. 

At the core of a workload are the components that implement the business logic –these can be made up of both low code components, such as canvas apps and flows, as well as code first components, such as plugins. All components that make up your workload must be **free of security defects** to ensure confidentiality, integrity, and availability.

It's not enough to secure just the infrastructure plane by using controls on identity and networking and other measures. **Prevent bad implementation of** **Power Platform workloads,** **compromised** **activities in those workloads** to strengthen your overall security posture. The process of integrating security into your development lifecycle is essentially a hardening process. Like resource hardening, tightening up code development is also context-agnostic. The focus is on enhancing security and not the functional requirements of the application. 

**Definitions**

| Term | Definition |
|---|---|
| Security Development Lifecycle (SDL) | A set of practices provided by Microsoft that supports security assurance and compliance requirements. |
| Software development lifecycle (SDLC) | A multistage, systematic process for developing software systems. |

## Key design strategies

Security measures should be integrated at multiple points into your existing Software Development Lifecycle (SDLC) to ensure:

Design choices don't lead to security gaps.

Low code and code first components as well configuration don't create vulnerabilities because of exploitable implementation and improper coding practices.

Low code and code first components and deployment processes aren't tampered with.

Vulnerabilities revealed through incidents are mitigated.

Compliance requirements aren't compromised or reduced.

Audit logging is implemented in all environments.

The following sections provide security strategies for the commonly practiced phases of SDLC.

### Requirements phase

The goal of the requirements phase is to **gather and analyze the functional and non-functional requirements** for a workload or a new feature of an workload. This phase is important because it facilitates the creation of guardrails that are tailored to the objectives of the workload. Protecting the data and integrity of your workload should be a core requirement throughout every phase of the development lifecycle.

For example, consider a workload that needs to support critical user flows that enable the user to upload and manipulate data. The security design choices should cover assurances for the user's interaction with the workload, like authenticating and authorizing the user identity, and allowing only permitted actions on the data. Non-functional requirements cover availability, usability, and maintainability. Security choices should include segmentation boundaries, firewall ingress and egress, and other cross-cutting security concerns.

All these decisions should lead to a good definition of the security posture of the workload. **Document the security requirements in an agreed-upon specification** and reflect them in the backlog. The document should explicitly state the security investments and the tradeoffs and risks that the business is willing to take on if the investments aren't approved by business stakeholders. For example, you might document the need to use IP firewall in Power Platform environments to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. If business stakeholders aren't prepared to accept the additional cost of using this Managed Environments feature, they need to accept the risk that organizational resources are accessed from external IP locations like a coffee shop. 

Security requirement gathering is a critical part of this phase. Without this effort, the design and implementation phases will be based on unstated choices, which can lead to either security gaps or to continuously changing requirements that will increase development time. You might need to change the implementation later to accommodate security, which can be expensive.

### Design phase

During this phase, **the security requirements are converted to technical requirements**. In your technical specification, document all design decisions to prevent ambiguity during implementation. Here are some typical tasks:

**Define the security dimension of the architecture.**

Overlay the architecture with security controls. For example, controls that are practical on the network isolation boundaries, the types of identities and authentication methods needed for the components of the workload, and the type of encryption methods to use. For some example architectures, see […]

**Evaluate platform-provided affordances.**

It's important to understand the **division of responsibility between you and** **Microsoft Power Platform**. Avoid overlap or duplication with Power Platform native security controls, for example. You'll get better security coverage and be able to reallocate development resources to the needs of the application.

For example, 

**Choose only trusted reference implementations, templates, code components, scripts, and libraries.** Your design should also specify secure version control. Application dependencies should be sourced from trusted parties. Third-party vendors should be able to meet your security requirements and share their responsible disclosure plan. Any security incident should be promptly reported so that you can take necessary actions. Also, certain libraries or reference implementations might be prohibited by your organization. For example, it might be secure from vulnerabilities but still disallowed because it’s using features not yet approved by your organization, licensing restrictions or because of the support model of the reference implementation. 

To ensure that this guidance is followed, maintain a list of approved and/or unapproved frameworks, libraries, and vendors and ensure your makers are familiar with this list**. When possible, place guardrails in the development pipelines to support the list. As much as possible, automate the use of tools to scan dependencies for vulnerabilities.

**Determine the security design patterns that the application code should implement.** Patterns can support security concerns like segmentation and isolation, strong authorization, uniform application security, and modern protocols.

For more information, see [Cloud design patterns that support security](/azure/well-architected/security/design-patterns).

**Store application secrets securely.**

Securely implement the use of application secrets and pre-shared keys that your application uses. **Credentials and application secrets should never be stored in the source** **code of the workload (app or flow).** Use external resources like Azure Key Vault to ensure that, if your source code becomes available to a potential attacker, no further access can be obtained.

**Connect to your data securely.** Use connectors that support secure authentication methods. Use Dataverse with xyz benefits to security. Don’t use implicit connection sharing. Don’t use queries where username and password are stored in plain text. Don’t use HTTP.

**Define how end users will interact with the workload and data.** Will they have direct access to the data, will you use application users to surface data in the app, where will they access the app (e.g. do you need conditional access policies), how will apps be shared (e.g. with security groups). Avoid complex security models that encourage work arounds to avoid security blockers.<br>

**Avoid hard coding.** Avoid hard-coding of URLs and keys. For example, avoid hard coding in a Power Automate HTTP action the URL or key to the backend service. Instead use a custom connector or use an environment variable for the URL, and Azure Key Vault for the API key.<br>

**Define test plans.** Define clear test cases for security requirements. Evaluate whether you can automate those tests in your pipelines. If your team has processes for manual testing, include security requirements for those tests.

** Note**

Perform threat modeling during this phase. Threat modeling can confirm that design choices are aligned with security requirements and expose gaps that you should mitigate. If your workload handles highly sensitive data, invest in security experts who can help you conduct threat modelling.

The initial threat modeling exercise should occur during the design phase when the software's architecture and high-level design are being defined. Doing it during that phase helps you to identify potential security issues before they're incorporated into the system's structure. However, this exercise isn't a one-time activity. It's a continuous process that should continue throughout the software's evolution.

For more information, see […].

### Development and testing phase

During this phase, the goal is to **prevent security defects** and tampering in code, build, and deployment pipelines.

**Be well-trained in secure code practices.**

The development team should **have training in secure coding practices**. For example, developers should be familiar with security concepts in Microsoft Dataverse to implement a least-privilege security model, content security policies for model-driven apps to restrict embedding to trusted domains, and connector/on-premise gateway authentication methods. 

Developers should be required to complete this training before they can start working on Power Platform workloads.

You should also perform internal peer code reviews to promote continuous learning.

**Use code analysis tools.** Solution Checker should be used for Power Platform resources and source code of any traditional code could be checked for potential security flaws, including the presence of credentials in code. Identify possible instances of credential and secret exposure in source code and configuration files. This is a good time to review how connection credentials will be handled in production.<br>

**Perform fuzz testing.** Use malformed and unexpected data to check for vulnerabilities and validate error handling. This can be particularly important with solutions that include Power Pages.

**Write just enough code.**

When you reduce your code footprint, you also reduce the chances of security defects. **Reuse code and libraries that are already in use and have been through security validations** instead of duplicating code. Open-source software detection and checking of version, vulnerability, and legal obligations. There is a growing amount of open-source Power Platform resources so this should not be overlooked. When possible, this should be discussed during the design phase to avoid last-minute issues.

**Protect developer environments.**

Developer workstations need to be protected with strong network and identity controls to prevent exposure. Make sure security updates are applied diligently.

**The source code repository must be safeguarded** as well. Grant access to code repositories on a need-to-know basis and reduce exposure of vulnerabilities as much as possible to avoid attacks. **Have a thorough process to review code** for security vulnerabilities. Use security groups for that purpose, and implement an approval process that's based on business justifications.

**Secure code deployments.**

It's not enough to just secure code. If it runs in exploitable pipelines, all security efforts are futile and incomplete. **Build and release environments must also be protected** because you want to prevent bad actors from running malicious code in your pipeline.

**Maintain an up-to-date inventory of every component that's integrated into your application.**

Every new component that's integrated into an application increases the attack surface. To ensure proper accountability and alerting when new components are added or updated, you should have an inventory of these components. **On a regular basis, check that your manifest matches what's in your build process.** Doing so helps ensure that no new components that contain back doors or other malware are added unexpectedly.

**We recommend using** [Pipelines for Power Platform](/power-platform/alm/set-up-pipelines)** for** **your deployments. Extend pipelines using GitHub Actions.** If you use GitHub workflows, prefer Microsoft-authored tasks. Also, validate tasks because they run in the security context of your pipeline.

Explore the use of service principals for deployment. 

### Production phase

The production phase presents the **last responsible opportunity to fix security gaps**. Keep a record of the golden image that's released in production.

**Keep versioned** **artifacts.**

**Keep a catalog of all deployed assets and their versions.** This information is useful during incident triage, when you're mitigating issues, and when you're getting the system back to working state. Versioned assets can also be compared against published Common Vulnerabilities and Exposures (CVE) notices. You should use automation to perform these comparisons.

**Emergency** **fixes.**

Your automated pipeline design should have the flexibility to **support both regular and emergency deployments**. This flexibility is important to support rapid and responsible security fixes.

A release is typically associated with multiple approval gates. Consider creating an emergency process to accelerate security fixes. The process might involve communication among teams. The pipeline should allow for quick roll-forward and rollback deployments that address security fixes, critical bugs, and code updates that occur outside of the regular deployment lifecycle.

** Note**

Always prioritize security fixes over convenience. A security fix shouldn't introduce a regression or bug. If you want to accelerate the fix through an emergency pipeline, carefully consider which automated tests can be bypassed. Evaluate the value of each test against the execution time. For example, unit tests usually complete quickly. Integration or end-to-end tests can run for a long time.

**Keep different environments separate.**

Data used in different environments must be kept separate. **Production data shouldn't be used in lower environments** because those environments might not have the strict security controls that production has. Avoid connecting from a non-production application to a production database, and avoid connecting non-production components to production networks.

**Progressive exposure.**

Use progressive exposure to **release features to a subset of users** based on chosen criteria. If there are issues, the impact is minimized to those users. This approach is a common risk mitigation strategy because it reduces surface area. As the feature matures and you have more confidence in security assurances, you can gradually release it to a broader set of users.

### Maintenance phase

The goal of this phase is to **make sure security posture doesn't decay over time**. SDLC is an ongoing agile process. Concepts covered in the preceding phases apply to this phase because requirements change over time.

**Continuous improvement.** Continuously assess and improve the security of the software development process by taking into account code reviews, feedback, lessons learned, and evolving threats as well as new features made available by Microsoft Power Platform to increase your security baseline. 

**Decommission legacy assets** that are stale or no longer in use. Doing so reduces the surface area of the application.

Maintenance also includes incident fixes. If issues are found in production, they need to be promptly integrated back into the process so that they don't recur.

Continuously improve your secure coding practices to keep up with the threat landscape.

## Power Platform facilitation

Power Platform is built on a culture and methodology of secure design. Both culture and methodology are constantly reinforced through Microsoft's industry-leading [Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl/practices) (SDL) and [Threat Modeling](https://www.microsoft.com/securityengineering/sdl/threatmodeling) practices.

The Threat Modeling review process ensures that threats are identified during the design phase, mitigated, and validated to make sure they've been mitigated.

Threat Modeling also accounts for all changes to services that are already live through continuous regular reviews. Relying on the [STRIDE model](/azure/security/develop/threat-modeling-tool-threats) helps to address the most common issues with insecure design.

Microsoft's SDL is equivalent to the [OWASP Software Assurance Maturity Model](https://owaspsamm.org/) (SAMM). Both are built on the premise that secure design is integral to web application security. Learn more: [OWASP Top 10 Risks: Mitigations in Power Platform](/power-platform/admin/security/faqs)

Microsoft Security Development Lifecycle (SDL) recommends secure practices that you can apply to your development lifecycle. For more information, see [Microsoft Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl/).

Defender for DevOps and the SAST tools are included as part of GitHub Advanced Security or Azure DevOps. These tools can help you track a security score for your organization.

With the solution checker feature, you can perform a rich static analysis check on your solutions against a set of best practice rules and quickly identify these problematic patterns. [Use solution checker to validate your solutions - Power Apps | Microsoft Learn](/power-apps/maker/data-platform/use-powerapps-checker)

## Related links

- [Application lifecycle management (ALM) with Microsoft Power Platform - Power Platform | Microsoft Learn](/power-platform/alm/)
- [Overview of pipelines in Power Platform - Power Platform | Microsoft Learn](/power-platform/alm/pipelines)
- [Application lifecycle management for the Power Platform - Training | Microsoft Learn](/training/paths/application-lifecycle-management/)
- [Solution Architect series: Plan application lifecycle management for Power Platform - Training | Microsoft Learn](/training/modules/application-lifecycle-management-architect/)
- [Use environment variables in solutions - Power Apps | Microsoft Learn](/power-apps/maker/data-platform/environmentvariables)
- [Use solution checker to validate your solutions - Power Apps | Microsoft Learn](/power-apps/maker/data-platform/use-powerapps-checker)

  

