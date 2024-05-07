---
title: Security design principles for well-architected Power Platform workloads
description: Understand the design principles of the Power Platform Well-Architected Security pillar.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: conceptual
ms.date: 05/10/2024
---

# Security design principles

A Well-Architected workload must be built with a zero-trust approach to security. A secure workload is **resilient to attacks** and incorporates the interrelated **security principles of confidentiality, integrity, and availability** (also known as the *CIA triad*) in addition to meeting business goals. Any security incident has the potential to become a major breach that damages your brand and reputation. To assess how well your security strategy works for your workload, ask yourself these questions:

- How much do your security measures slow down or stop attackers from breaking into your workload?
- How much do your security measures limit the damage or spread of an attack if it happens?
- How valuable is your workload to an attacker? How much would it hurt your business if your workload or its data were stolen, unavailable, or tampered with?
- How quickly can you detect, respond to, and recover from disruptions in your workload?

As you design your system, use the Microsoft Zero Trust model as the compass to mitigate security risks:

- Verify explicitly so that only trusted identities perform intended and allowed actions that originate from expected locations. This safeguard makes it harder for attackers to impersonate legitimate users and accounts.

- Use least-privilege access for the right identities, with the right set of permissions, for the right duration, and to the right assets. Limiting permissions helps keep attackers from abusing permissions that legitimate users don't even need.

- Assume breach of security controls and design compensating controls that limit risk and damage if a primary layer of defense fails. Doing so helps you to defend your workload better by thinking like an attacker who's interested in success (regardless of how they get it).

Security isn't a one-time effort. You must implement this guidance on a recurring basis. Continuously improve your defenses and security knowledge to help keep your workload safe from attackers who are constantly gaining access to innovative attack vectors as they're developed and added to automated attack kits.

The design principles are intended to establish an ongoing security mindset to help you continuously improve the security posture of your workload as the attempts of attackers continuously evolve. These principles should guide the security of your architecture, design choices, and operational processes. Start with the recommended approaches and justify the benefits for a set of security requirements. After you set your strategy, drive actions by using the [Security checklist](checklist.md) as your next step.

If these principles aren't applied properly, a negative impact on business operations and revenue can be expected. Some consequences might be obvious, like penalties for regulatory workloads. Others might not be so obvious and could lead to ongoing security problems before they're detected.

In many mission-critical workloads, security is the primary concern, alongside reliability, given that some attack vectors, like data exfiltration, don't affect reliability. Security and reliability can pull a workload in opposite directions because security-focused design can introduce points of failure and increase operational complexity. The effect of security on reliability is often indirect, introduced by way of operational constraints. Carefully consider tradeoffs between security and reliability.

By following these principles, you can improve security effectiveness, harden workload assets, and build trust with your users.

## Plan your security readiness

|![Goal icon](../_images/goal.svg) Aim to adopt and implement security practices in architectural design decisions and operations with minimal friction.|
|--|

As a workload owner, you share the responsibility with the organization to protect assets. Make a **security readiness plan** that matches your business priorities. It will help you create clear processes, enough investments, and appropriate accountabilities. The plan should give the workload requirements to the organization, which also shares the responsibility for protecting assets. Security plans should be part of your strategy for reliability, health modeling, and self-preservation.

Besides organizational assets, you also need to protect the workload itself from attacks that try to get in or get data out. You should consider all aspects of Zero Trust and the CIA triad in your plan.

You shouldn't let functional and nonfunctional requirements, budget constraints, or other considerations reduce your security investments or guarantees. But you also need to design and plan your security investments with those factors in mind.

| Approach | Benefit |
|---|---|
| **Use segmentation as a strategy to plan security boundaries** in the workload environment, processes, and team structure to separate access and function. Your segmentation strategy should be based on business requirements. You can use criteria like component importance, division of labor, and privacy concerns. | You'll be able to **minimize operational friction** by defining roles and establishing **clear lines of responsibility**. This exercise also helps you decide the level of access for each role, especially for critical-impact accounts. Isolation lets you **limit exposure of sensitive user and system flows** to only roles and assets that need access. Too much exposure could accidentally lead to information flow disclosure. In short, you'll be able to **fit security efforts** to the needs of each segment. |
| Keep **building skills** through **role-based security training** that meets the needs of the organization and the use cases of the workload. | A skilled team can design, implement, and monitor **security controls that remain effective** against attackers, who always look for new ways to exploit the system. Organization-wide training usually focuses on developing a broader skill set for securing the common elements. But with role-based training, you focus on **developing deep expertise** in the platform offerings and security features that address workload concerns. You need to use both approaches to defend against adversaries with **good design and effective operations**. |
| **Make sure you have an incident response plan** for your workload. Use industry frameworks that define the standard operating procedure for readiness, detection, containment, mitigation, and post-incident activity. | In a crisis situation, you want to avoid confusion. If you have a well-documented plan, responsible roles can **focus on execution** without wasting time on uncertain actions. Also, a comprehensive plan can help you make sure that **all remediation requirements are met**. |
| **Strengthen your security posture by understanding the security compliance requirements** that come from influences outside the workload team, like organizational policies, regulatory compliance, and industry standards. | Knowing your compliance requirements will help you **design for the right security guarantees** and **prevent non-compliance** issues, which could lead to penalties. Industry standards can provide a baseline and influence your choice of tools, policies, security safeguards, guidelines, risk management approaches, and training. If you know that the workload follows compliance, you'll be able to **build confidence** in your user base. |
| **Define and enforce team-level security standards** across the lifecycle and operations of the workload. **Aim for consistent practices** in operations like coding, gated approvals, release management, and data protection and retention. | Defining good security practices can **minimize negligence** and the surface area for potential errors. The team will **optimize efforts and the outcome will be predictable** because approaches are more consistent. Following security standards over time will let you **identify opportunities for improvement, possibly including automation**, which will make efforts easier and increase consistency. |
| Align your incident response with the **Security Operation Center (SOC) centralized function** in your organization. | Centralizing incident response functions lets you take advantage of specialized IT professionals who can **detect incidents in real time** to address possible threats as fast as possible. |

## Design to protect confidentiality

|![Goal icon](../_images/goal.svg) Prevent exposure of privacy, regulatory, application, and proprietary information by using access restrictions and obfuscation techniques.|
|--|  

Workload data can be classified by user, usage, configuration, compliance, intellectual property, and more. You shouldn't share or access that data beyond the established trust boundaries. To protect confidentiality, you should focus on access controls, opacity, and keeping an audit trail of activities that involve data and the system.

| Approach | Benefit |
|---|---|
| Use **strong access controls** that give access only when needed. | *Least privilege*. The workload will be safe from **unauthorized access** and prohibited activities. Even when access is from trusted identities, the **access permissions and exposure time will be minimized** because the communication path is open for a short time. |
| **Classify data based on its type, sensitivity, and possible risk**. Assign a confidentiality level for each. Include system components that are in scope for the identified level. | *Verify explicitly*. This evaluation helps you fit security measures. You'll also be able to spot data and components that have a **high potential impact** and/or exposure to risk. This exercise adds **clarity** to your information protection strategy and helps ensure **agreement**. |
| Protect your data at rest, in transit, and during processing by using **encryption**. Base your strategy on the assigned confidentiality level. | *Assume breach*. Even if an attacker gets access, they **won't be able to read properly encrypted** sensitive data. Sensitive data includes configuration information that's used to get more access inside the system. Data encryption can help you **contain risks**. *Verify explicitly* where you need to encrypt data yourself, and where Microsoft Power Platform encrypts data by default.  |
| **Defend against exploits** that might cause unwanted exposure of information. | *Verify explicitly*. It's important to minimize vulnerabilities in authentication and authorization implementations, code, configurations, operations, and those that come from the social habits of the system's users. Up-to-date security measures let you **block known security vulnerabilities** from entering the system. You can also **mitigate new vulnerabilities** that can appear over time by doing routine operations throughout the development cycle, continuously improving security guarantees. |
| **Defend against data exfiltration** that happens from malicious or accidental access to data. | *Assume breach*. You'll be able to limit the blast radius by **blocking unauthorized data transfer**. Also, controls applied to networking, identity, and encryption will protect data at different layers. |
| Keep the **level of confidentiality** as data flows through various components of the system. | *Assume breach*. Enforcing confidentiality levels throughout the system lets you provide a consistent level of hardening. Doing so can **prevent vulnerabilities** that might happen from moving data to a lower security tier. |
| Keep an **audit trail** of all types of access activities. | *Assume breach*. Audit logs support **faster detection and recovery** in case of incidents and help with ongoing security monitoring. |

## Design to protect integrity

|![Goal icon](../_images/goal.svg) Avoid damage to design, implementation, operations, and data to prevent disruptions that can stop the system from delivering its expected value or cause it to operate outside the defined limits. The system should provide information assurance throughout the workload lifecycle.|
|--|

The key is to use controls that prevent tampering of business logic, flows, deployment processes, data, and even the lower stack components, like the operating system and boot sequence. Lack of integrity can create vulnerabilities that can lead to breaches in confidentiality and availability.

| Approach | Benefit |
|---|---|
| **Use strong access controls that authenticate and authorize access to the system. Minimize access based on privilege, scope, and time.** | *Least privilege*. Depending on the strength of the controls, you'll be able to **prevent or reduce risks from unauthorized changes**. This helps make sure that data is consistent and reliable. Minimizing access limits the extent of possible corruption. |
| **Keep protecting against vulnerabilities and detecting them in your supply chain** to stop attackers from injecting software faults into your build system, tools, libraries, and other dependencies. The supply chain should scan for vulnerabilities during **build time and runtime**. | *Assume breach*. Knowing the source of software and verifying its authenticity throughout the lifecycle will **provide predictability**. You'll **know about vulnerabilities well in advance** so that you can fix them proactively and keep the system secure in production. |
| **Make sure backup data is immutable and encrypted** when data is replicated or transferred. | *Verify explicitly.* You'll be able to restore data with confidence that backup **data wasn't changed at rest**, accidentally or maliciously. |
| **Avoid or reduce system implementations that let your workload operate outside its intended limits and purposes.** | *Verify explicitly.* When your system has strong safeguards that check whether usage matches its intended limits and purposes, the scope for potential abuse or tampering of your compute, networking, and data stores is lower. |

## Design to protect availability

|![Goal icon](../_images/goal.svg) Avoid or minimize system and workload downtime and degradation in the event of a security incident by using strong security controls. You must keep data integrity during the incident and after the system recovers.|
|--|

You need to balance availability architecture choices with security architecture choices. The system should have availability guarantees to make sure that users have access to data and that data is reachable. From a security perspective, users should operate within the allowed access scope, and the data must be trusted. Security controls should stop bad actors, but they shouldn't stop legitimate users from accessing the system and data.

| Approach | Benefit |
|---|---|
| **Stop compromised identities from misusing access** to take control of the system. Check for **too broad scope and time limits** to minimize risk exposure. | *Least privilege*. This strategy **reduces the risks of excessive, unnecessary, or misused access permissions** on important resources. Risks include unauthorized changes and even the deletion of resources. Use the platform-provided just-in-time (JIT), just-enough-access (JEA), and time-based security modes to replace standing permissions wherever possible. |
| Use security controls and design patterns to **stop attacks and code flaws from using up resources** and blocking access. | *Verify explicitly*. The **system won't experience downtime** caused by malicious actions, like distributed denial of service (DDoS) attacks. |
| Use **preventive measures for attack vectors that exploit vulnerabilities** in application code, identity systems, malware protection, and other areas. | *Assume breach*. Use code scanners, apply the latest security patches, update software, and protect your system with effective antimalware regularly. You'll be able to shrink the attack surface to ensure business continuity. |
| **Prioritize** security controls on the **critical components and flows** in the system that are susceptible to risk. | *Assume breach*, *verify explicitly*. Regular detection and prioritization exercises can help you **apply security expertise to the critical aspects** of the system. You'll be able to focus on the most likely and damaging threats and start your risk mitigation in areas that need the most attention. |
| Apply at least the same level of **security rigor in your recovery resources and processes** as you do in the primary environment, including security controls and frequency of backup. | *Assume breach*. You should have a preserved safe system state available in disaster recovery. If you do, you can fail over to a secure secondary system or location and restore backups that won't introduce a threat. A well-designed process can prevent a security incident from hindering the recovery process. Corrupted backup data or encrypted data that can't be deciphered can slow down recovery. |
| Apply at least the same level of **security rigor in your recovery resources and processes** as you do in the primary environment, including security controls and frequency of backup. | *Assume breach*. You should have a preserved safe system state available in disaster recovery. If you do, you can fail over to a secure secondary system or location and restore backups that won't introduce a threat. A well-designed process can prevent a security incident from interfering with the recovery process. Corrupted backup data or encrypted data that can't be decoded can slow down recovery. |

## Sustain and evolve your security posture

|![Goal icon](../_images/goal.svg) Include continuous improvement and apply vigilance to stay ahead of attackers who are continuously evolving their attack strategies.|
|--|

Your security posture must not get worse over time. You must keep improving security operations so that new disruptions are handled more effectively. Aim to align improvements with the phases defined by industry standards. Doing so leads to better readiness, faster time to incident detection, and effective containment and mitigation. Continuous improvement should be based on lessons learned from past incidents.

It's important to measure your security posture, enforce policies to maintain that posture, and regularly check your security mitigations and compensating controls to continuously improve your security posture in the face of evolving threats.

| Approach | Benefit |
|---|---|
| **Make and maintain a comprehensive asset inventory** that includes classified information about resources, locations, dependencies, owners, and other metadata that's relevant to security. As much as possible, **automate** inventory to get data from the system. | A well-organized inventory provides a **holistic view of the environment**, which puts you in an advantageous position against attackers, especially during post-incident activities. It also creates a business rhythm to drive communication, upkeep of critical components, and the decommissioning of orphaned or unused resources. |
| **Do threat modeling** to find and reduce potential threats. | You'll have a **report of attack vectors** ranked by their severity level. You'll be able to identify threats and vulnerabilities quickly and set up countermeasures. |
| Regularly **collect data to compare your current state** against your established security baseline and **set priorities for fixes**. Use platform-provided features for **security posture management** and **the enforcement of compliance** required by external and internal organizations. | You need accurate reports that bring clarity and consensus to focus areas. You'll be able to immediately **do technical fixes**, starting with the highest priority items. You'll also **find gaps**, which provide opportunities for improvement. Implementing enforcement helps prevent violations and regressions, which preserves your security posture. |
| **Run periodic security tests** that are conducted by experts outside the workload team who try to ethically hack the system. Do routine and integrated **vulnerability scanning** to find exploits in infrastructure, dependencies, and application code. | These tests let you check security defenses by **simulating real-world attacks** using techniques like penetration testing. Threats can be introduced as part of your change management. Integrating scanners into the deployment pipelines lets you automatically find vulnerabilities and even quarantine usage until the vulnerabilities are removed. |
| **Detect, respond, and recover** with fast and effective security operations. | The main benefit of this approach is that it lets you **preserve or restore the security guarantees of the CIA triad** during and after an attack. You need to be alerted as soon as a threat is found so that you can start your investigations and take appropriate actions. |
| **Do post-incident activities** like root-cause analyses, postmortems, and incident reports. | These activities provide insight into the impact of the breach and into resolution measures, which drives improvements in defenses and operations. |
| **Get current, and stay current.** Stay current on updates, patching, and security fixes. Continuously evaluate the system and improve it based on audit reports, benchmarking, and lessons from testing activities. Consider automation, as appropriate. Use threat intelligence powered by security analytics for dynamic detection of threats. At regular intervals, review the workload's conformance to Security Development Lifecycle (SDL) best practices. | You'll be able to make sure that your **security posture doesn't get worse over time**. By integrating findings from real-world attacks and testing activities, you'll be able to fight attackers who continuously improve and exploit new types of vulnerabilities. Automation of repetitive tasks **decreases the chance of human error** that can create risk. SDL reviews bring clarity around security features. SDL can help you maintain an inventory of workload assets and their security reports, which cover source, usage, operational weaknesses, and other factors. |

## Next steps

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
