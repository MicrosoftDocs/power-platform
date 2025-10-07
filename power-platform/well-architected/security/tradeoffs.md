---
title: Security tradeoffs for Power Platform workloads
description: Learn about the Security tradeoffs you might encounter when optimizing for the other Power Platform Well-Architected pillars.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: concept-article
ms.date: 08/18/2025
---

# Security tradeoffs for Power Platform workloads

Security provides confidentiality, integrity, and availability assurances of a workload's system and its users' data. Security controls are required for the workload and for the software development and operational components of the system. When teams design and operate a workload, they can almost never compromise on security controls.

During the design phase of a workload, it's important to consider how decisions based on the [Security design principles](./principles.md) and recommendations in the [Design review checklist for Security](./checklist.md) might influence the goals and optimization efforts of other pillars. Certain decisions may benefit some pillars, while being tradeoffs for others. This article lists example tradeoffs that a workload team might encounter when designing workload architecture and operations for experience optimization.

## Security tradeoffs with Reliability

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased complexity.** The Reliability pillar prioritizes simplicity and recommends that points of failure are minimized.

- Some security controls can increase the risk of misconfiguration, which can lead to service disruption. Examples of security controls that can introduce misconfiguration include network traffic rules, IP firewall settings, and role-based or attribute-based access control assignments.

- Workload security tooling is often incorporated into many layers of a workload's architecture, operations, and runtime requirements. These tools might affect resiliency, availability, and capacity planning. Failure to account for limitations in the tooling can lead to a reliability event, like Source Network Address Translation (SNAT) port exhaustion on an egress firewall.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff:  Increased critical dependencies.** The Reliability pillar recommends minimizing critical dependencies. A workload that minimizes critical dependencies, especially external ones, has more control over its points of failure.

The Security pillar requires a workload to explicitly verify identities and actions. Verification occurs via critical dependencies on key security components. If those components aren't available or if they malfunction, verification might not complete. This failure puts the workload in a degraded state. Some examples of these critical single-point-of-failure dependencies are:

- Ingress and egress firewalls
- Certificate revocation lists
- Identity providers, like Microsoft Entra ID

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff:  Increased complexity of disaster recovery.** A workload must reliably recover from all forms of disaster.

- Security controls might affect recovery time objectives. This effect can be caused by the additional steps that are needed to decrypt backed up data or by operational access delays created by site reliability triage.

- Security controls themselves, for example secret vaults and their contents, need to be part of the disaster recovery plan of the workload and must be validated via recovery drills.

- Security or compliance requirements might limit data residency options or access control restrictions for backups, potentially further complicating recovery.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased rate of change.** A workload that experiences runtime change is exposed to more risk of reliability impact due to that change.

- Stricter solution update policies lead to more changes in a workload's production environment. This change comes from sources like these:
  - Releasing application code more frequently because of updates to solutions
  - Applying Power Platform release wave updates
  - Updating configurations of Power Platform environment settings in the environment
  - Applying patches to libraries or components used in the environment

- Rotation activities for keys, service principal credentials, and certificates increase the risk of transient issues due to the timing of the rotation and clients using the new value.

## Security tradeoffs with Operational Excellence

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Complications in observability and serviceability.** Operational Excellence requires architectures to be serviceable and observable. The most serviceable architectures are those that are the most transparent to everyone involved.

- Security benefits from extensive logging that provides high fidelity insight into the workload for alerting on deviations from baselines and for incident response. This logging can generate a significant volume of logs, which can make it harder to provide insights that are targeted at reliability or performance.

- When compliance guidelines for data masking are followed, specific segments of logs or even large amounts of tabular data are redacted to protect confidentiality. The team needs to evaluate how this observability gap might affect alerting or hinder incident response.

- Some security controls impede access by design. During incident response, these controls can slow down workload operators' emergency access. Therefore, incident response plans need to include more emphasis on planning and drills in order to reach acceptable efficacy.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Decreased agility and increased complexity.** Workload teams measure their velocity so that they can improve the quality, frequency, and efficiency of delivery activities over time. Workload complexity factors into the effort and risk involved in operations.

- Stricter change control and approval policies to reduce the risk of introducing security vulnerabilities can slow down the development and safe deployment of new features. However, the expectation of addressing security updates and patching can increase demand for more frequent deployments. Additionally, human-gated approval policies in operational processes can make it more difficult to automate those processes.

- Security testing results in findings that need to be prioritized, potentially blocking planned work.

- Routine, ad hoc, and emergency processes might require audit logging to meet compliance requirements. This logging increases the rigidity of running the processes.

- Workload teams might increase the complexity of identity management activities as the granularity of role definitions and assignments is increased.

- An increased number of routine operational tasks that are associated with security, like certificate management, increases the number of processes to automate.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased coordination efforts.** A team that minimizes external points of contact and review can control their operations and timeline more effectively.

- As external compliance requirements from the larger organization or from external entities increase, the complexity of achieving and proving compliance with auditors also increases.

- Security requires specialized skills that workload teams don't typically have. Those proficiencies are often sourced from the larger organization or from third parties. In both cases, coordination of effort, access, and responsibility needs to be established.

- Compliance or organizational requirements often require maintained communication plans for responsible disclosure of breaches. These plans must be factored into security coordination efforts.

## Security tradeoffs with Experience Optimization

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased friction**. Optimizing the experience focuses on helping users be more productive and make faster decisions.

- Security surface areas should be minimized, which can negatively impact the use of third-party components and integrations that are desired for optimizing the experience.

- Data classification can make finding and consuming data in the workload more difficult.

- Security protocols increase the complexity of user interactions and can result in challenges for usability.

## Security tradeoffs with Performance Efficiency

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased latency and overhead.** A performant workload reduces latency and overhead.

- Inspection security controls, like firewalls and content filters, are located in the flows that they secure. Those flows are therefore subject to additional verification, which adds latency to requests.

- Identity controls require each invocation of a controlled component to be verified explicitly. This verification consumes compute cycles and might require network traversal for authorization.

- Encryption and decryption require dedicated compute cycles. These cycles increase the time and resources consumed by those flows. This increase is usually correlated with the complexity of the algorithm and the generation of high-entropy and diverse initialization vectors (IVs).

- As the extensiveness of logging increases, the impact on system resources and network bandwidth for streaming those logs can also increase.

- Resource segmentation frequently introduces network hops in a workload's architecture.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased chance of misconfiguration.** Reliably meeting performance targets depends on predictable implementations of the design.

A misconfiguration or overextension of security controls can impact performance because of inefficient configuration. Examples of security control configurations that can affect performance include:

- Firewall rule ordering, complexity, and quantity (granularity).

- Failing to exclude key files from file integrity monitors or virus scanners. Neglecting this step can lead to lock contention.

- Web application firewalls performing deep packet inspection for languages or platforms that are irrelevant for the components that are being protected.

## Related information

- [Reliability tradeoffs](../reliability/tradeoffs.md)
- [Operational Excellence tradeoffs](../operational-excellence/tradeoffs.md)
- [Experience Optimization tradeoffs](../experience-optimization/tradeoffs.md)
- [Performance Efficiency tradeoffs](../performance-efficiency/tradeoffs.md)
