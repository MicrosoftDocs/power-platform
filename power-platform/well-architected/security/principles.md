---
title: Security design principles for well-architected Power Platform workloads
description: Understand the design principles of the Power Platform Well-Architected Security pillar.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: concept-article
ms.date: 08/18/2025
---

# Security design principles

A Well-Architected workload must be built with a zero-trust approach to security. A secure workload is resilient to attacks and incorporates the interrelated security principles of confidentiality, integrity, and availability (also known as the *CIA triad*) in addition to meeting business goals. Any security incident has the potential to become a major breach that damages your brand and reputation. To assess how well your security strategy works for your workload, ask yourself these questions:

- How much do your security measures slow down or stop attackers from breaking into your workload?
- How much do your security measures limit the damage or spread of an attack if it happens?
- How valuable is your workload to an attacker? How much would it hurt your business if your workload or its data were stolen, unavailable, or tampered with?
- How quickly can you detect, respond to, and recover from disruptions in your workload?

As you design your system, use the Microsoft Zero Trust model as the compass to mitigate security risks:

- Verify explicitly so that only trusted identities perform intended and allowed actions that originate from expected locations. This safeguard makes it harder for attackers to impersonate legitimate users and accounts.

- Use least-privilege access for the right identities, with the right set of permissions, for the right duration, and to the right assets. Limiting permissions helps keep attackers from abusing permissions that legitimate users don't even need.

- Assume breach of security controls and design compensating controls that limit risk and damage if a primary layer of defense fails. Doing so helps you to defend your workload better by thinking like an attacker who's interested in success (regardless of how they get it).

Security isn't a one-time effort. You must implement this guidance on a recurring basis. Continuously improve your defenses and security knowledge to protect your workload from attackers who are adept at finding new, innovative attack vectors, often using automated attack kits.

The design principles, based on the [Microsoft Azure Well-Architected Framework](/azure/well-architected), are intended to foster a continuous security mindset, to help you improve the security posture of your workload as threats evolve. These principles should guide the security of your architecture, design choices, and operational processes. Start with the recommended approaches and justify the benefits for a set of security requirements. After you set your strategy, drive actions by using the [Security checklist](checklist.md) as your next step.

If these principles aren't applied properly, a negative impact on business operations and revenue can be expected. Some consequences might be obvious, like penalties for regulatory workloads. However, others may be less apparent and could result in ongoing security problems before they're detected.

In many mission-critical workloads, security is the primary concern, alongside reliability, given that some attack vectors, like data exfiltration, don't affect reliability. Security and reliability can pull a workload in opposite directions because security-focused design can introduce points of failure and increase operational complexity. The effect of security on reliability is often indirect, introduced by way of operational constraints. Carefully consider tradeoffs between security and reliability.

By following these principles, you can improve security effectiveness, harden workload assets, and build trust with your users.

## Plan your security readiness

|![Goal icon](../_images/goal.svg) Aim to adopt and implement security practices in architectural design decisions and operations with minimal friction.|
|--|

As a workload owner, you share the responsibility with the organization to protect assets. Make a security readiness plan that matches your business priorities. It will assist you in establishing clear processes, sufficient investments, and appropriate responsibilities. The plan should communicate the workload requirements to the organization, which also shares responsibility for protecting assets. Security plans should be part of your strategy for reliability, health modeling, and self-preservation.

Learn more about [planning your security readiness](/azure/well-architected/security/principles#plan-your-security-readiness) in the Azure Well-Architected Framework.

## Design to protect confidentiality

|![Goal icon](../_images/goal.svg) Prevent exposure of privacy, regulatory, application, and proprietary information by using access restrictions and obfuscation techniques.|
|--|  

Workload data can be classified by user, usage, configuration, compliance, intellectual property, and more. You shouldn't share or access that data beyond the established trust boundaries. To protect confidentiality, you should focus on access controls, opacity, and keeping an audit trail of activities that involve data and the system.

Learn more about [designing to protect confidentiality](/azure/well-architected/security/principles#design-to-protect-confidentiality) in the Azure Well-Architected Framework.

## Design to protect integrity

|![Goal icon](../_images/goal.svg) Avoid damage to design, implementation, operations, and data to prevent disruptions that can stop the system from delivering its expected value or cause it to operate outside the defined limits. The system should provide information assurance throughout the workload lifecycle.|
|--|

The key is to use controls that prevent tampering of business logic, flows, deployment processes, data, and even the lower stack components, like the operating system and boot sequence. Lack of integrity can create vulnerabilities that can lead to breaches in confidentiality and availability.

Learn more about [designing to protect integrity](/azure/well-architected/security/principles#design-to-protect-integrity) in the Azure Well-Architected Framework.

## Design to protect availability

|![Goal icon](../_images/goal.svg) Avoid or minimize system and workload downtime and degradation in the event of a security incident by using strong security controls. You must keep data integrity during the incident and after the system recovers.|
|--|

You must balance availability architecture choices with security architecture choices. The system should provide availability guarantees to ensure that users can access data and that the data is reachable. From a security perspective, users should operate within the allowed access scope, and the data must be trusted. Security controls should stop bad actors, but they shouldn't stop legitimate users from accessing the system and data.

Learn more about [designing to protect availability](/azure/well-architected/security/principles#design-to-protect-availability) in the Azure Well-Architected Framework.

## Sustain and evolve your security posture

|![Goal icon](../_images/goal.svg) Include continuous improvement and apply vigilance to stay ahead of attackers who are continuously evolving their attack strategies.|
|--|

Your security posture must not deteriorate over time. You must keep improving security operations so that new disruptions are handled more effectively. Aim to align improvements with the phases defined by industry standards. Doing so leads to better readiness, faster time to incident detection, and effective containment and mitigation. Continuous improvement should be based on lessons learned from past incidents.

Learn more about [sustaining and evolving your security posture](/azure/well-architected/security/principles#sustain-and-evolve-your-security-posture) in the Azure Well-Architected Framework.

## Next steps

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
