---
title: Security design principles
description: Understand the design principles of the Security pillar.
author: robstand
ms.author: rstand
ms.reviewer: robstand
ms.subservice: guidance
ms.topic: conceptual
ms.date: 03/28/2024
---

# Security design principles

A Well-Architected workload must be built with a zero-trust approach. A secure workload is **resilient to attacks** and incorporates the interrelated security **principles of confidentiality, integrity, and availability** (also known as the *CIA triad*) in addition to meeting business goals. Any security incident has the potential to become a major breach that damages the brand and reputation of the workload or organization. To measure the security efficacy of your overall strategy for a workload, start with these questions:

- Do your defensive investments provide meaningful cost and friction to prevent attackers from compromising your workload?
- Will your security measures be effective in restricting the blast radius of an incident?
- Do you understand how controlling the workload could be valuable for an attacker? Do you understand the impact to your business if the workload and its data are stolen, unavailable, or tampered with?
- Can the workload and operations quickly detect, respond to, and recover from disruptions?

As you design your system, use the Microsoft Zero Trust model as the compass to mitigate security risks:

- **Verify explicitly** so that **only trusted identities** perform **intended and allowed actions** that originate from **expected locations**. This safeguard makes it harder for attackers to impersonate legitimate users and accounts.

- **Use least-privilege access** for the **right identities**, with the **right set of permissions**, for the **right duration**, and to the **right assets**. Limiting permissions helps keep attackers from abusing permissions that legitimate users don't even need.

- **Assume breach** of security controls and design compensating controls that **limit risk and damage** if a primary layer of defense fails. Doing so helps you to defend your workload better by thinking like an attacker who's interested in success (regardless of how they get it).

Security isn't a one-time effort. You must implement this guidance on a recurring basis. Continuously improve your defenses and security knowledge to help keep your workload safe from attackers who are constantly gaining access to innovative attack vectors as they're developed and added to automated attack kits.

The design principles are intended to establish an ongoing security mindset to help you continuously improve the security posture of your workload as the attempts of attackers continuously evolve. These principles should guide the security of your architecture, design choices, and operational processes. Start with the recommended approaches and **justify the benefits for a set of security requirements**. After you set your strategy, drive actions by using the [**Security checklist**](checklist.md) as your next step.

If these principles aren't applied properly, a negative impact on business operations and revenue can be expected. Some consequences might be obvious, like penalties for regulatory workloads. Others might not be so obvious and could lead to ongoing security problems before they're detected.

In many mission-critical workloads, security is the primary concern, alongside reliability, given that some attack vectors, like data exfiltration, don't affect reliability. Security and reliability can pull a workload in opposite directions because security-focused design can introduce points of failure and increase operational complexity. The effect of security on reliability is often indirect, introduced by way of operational constraints. Carefully consider tradeoffs between security and reliability.

By following these principles, you can improve security effectiveness, harden workload assets, and build trust with your users.

## Plan your security readiness

|![Goal icon](../_images/goal.svg) Strive to adopt and implement security practices in architectural design decisions and operations with minimal friction.|
|--|

As a workload owner, you have a shared responsibility with the organization to protect assets. Create a **security readiness plan** that's aligned with business priorities. It will lead to well-defined processes, adequate investments, and appropriate accountabilities. The plan should provide the workload requirements to the organization, which also shares responsibility for protecting assets. Security plans should factor into your strategy for reliability, health modeling, and self-preservation.

In addition to organizational assets, the workload itself needs to be protected from intrusion and exfiltration attacks. All facets of Zero Trust and the CIA triad should be factored into the plan.

Functional and nonfunctional requirements, budget constraints, and other considerations shouldn't restrict security investments or dilute assurances. At the same time, you need to engineer and plan security investments with those constraints and restrictions in mind.

| Approach | Benefit |
|---|---|
| **Use segmentation as a strategy to plan security boundaries** in the workload environment, processes, and team structure to isolate access and function. Your segmentation strategy should be driven by business requirements. You can base it on criticality of components, division of labor, privacy concerns, and other factors. | You'll be able to **minimize operational friction** by defining roles and establishing **clear lines of responsibility**. This exercise also helps you identify the level of access for each role, especially for critical-impact accounts. Isolation enables you to **limit exposure of sensitive user and system flows** to only roles and assets that need access. Excessive exposure could inadvertently lead to information flow disclosure. To summarize, you'll be able to **right-size security efforts** based on the needs of each segment. |
| Continuously **build skills** through **role-based security training** that meets the requirements of the organization and the use cases of the workload. | A highly skilled team can design, implement, and monitor **security controls that remain effective** against attackers, who constantly look for new ways to exploit the system. Organization-wide training typically focuses on developing a broader skill set for securing the common elements. However, with role-based training, you focus on **developing deep expertise** in the platform offerings and security features that address workload concerns. You need to implement both approaches to defend against adversaries through **good design and effective operations**. |
| **Make sure there's an incident response plan** for your workload. Use industry frameworks that define the standard operating procedure for preparedness, detection, containment, mitigation, and post-incident activity. | At the time of crisis, confusion must be avoided. If you have a well-documented plan, responsible roles can **focus on execution** without wasting time on uncertain actions. Also, a comprehensive plan can help you ensure that **all remediation requirements are fulfilled**. |
| **Strengthen your security posture by understanding the security compliance requirements** that are imposed by influences outside the workload team, like organizational policies, regulatory compliance, and industry standards. | Clarity about compliance requirements will help you **design for the right security assurances** and **prevent non-compliance** issues, which could lead to penalties. Industry standards can provide a baseline and influence your choice of tools, policies, security safeguards, guidelines, risk-management approaches, and training. If you know that the workload adheres to compliance, you'll be able to **instill confidence** in your user base. |
| **Define and enforce team-level security standards** across the lifecycle and operations of the workload. **Strive for consistent practices** in operations like coding, gated approvals, release management, and data protection and retention. | Defining good security practices can **minimize negligence** and the surface area for potential errors. The team will **optimize efforts and the outcome will be predictable** because approaches are made more consistent. Observing security standards over time will enable you to **identify opportunities for improvement, possibly including automation**, which will streamline efforts further and increase consistency. |
| Align your incident response with the **Security Operation Center (SOC) centralized function** in your organization. | Centralizing incident response functions enables you to take advantage of specialized IT professionals who can **detect incidents in real time** to address potential threats as quickly as possible. |

## Design to protect confidentiality

|![Goal icon](../_images/goal.svg) Prevent exposure to privacy, regulatory, application, and proprietary information through access restrictions and obfuscation techniques.|
|--|  

Workload data can be classified by user, usage, configuration, compliance, intellectual property, and more. That data can't be shared or accessed beyond the established trust boundaries. Efforts to protect confidentiality should focus on access controls, opacity, and keeping an audit trail of activities that pertain to data and the system.

| Approach | Benefit |
|---|---|
| Implement **strong access controls** that grant access only on a need-to-know basis. | *Least privilege*. The workload will be protected from **unauthorized access** and prohibited activities. Even when access is from trusted identities, the **access permissions and exposure time will be minimized** because the communication path is open for a limited period. |
| **Classify data based on its type, sensitivity, and potential risk**. Assign a confidentiality level for each. Include system components that are in scope for the identified level. | *Verify explicitly*. This evaluation helps you right-size security measures. You'll also be able to identify data and components that have a **high potential impact** and/or exposure to risk. This exercise adds **clarity** to your information protection strategy and helps ensure **agreement**. |
| Safeguard your data at rest, in transit, and during processing by using **encryption**. Base your strategy on the assigned confidentiality level. | *Assume breach*.  Even if an attacker gets access, they **won't be able to read properly encrypted** sensitive data. Sensitive data includes configuration information that's used to gain further access inside the system. Data encryption can help you **contain risks**. *Verify explicitly* where it is your responsibility to encrypt data, and where Microsoft Power Platform encrypts data by default.  |
| **Guard against exploits** that might cause unwarranted exposure of information. | *Verify explicitly*. It's crucial to minimize vulnerabilities in authentication and authorization implementations, code, configurations, operations, and those that stem from the social habits of the system's users. Up-to-date security measures enable you to **block known security vulnerabilities** from entering the system. You can also **mitigate new vulnerabilities** that can appear over time by implementing routine operations throughout the development cycle, continuously improving security assurances. |
| **Guard against data exfiltration** that results from malicious or inadvertent access to data. | *Assume breach*. You'll be able to contain blast radius by **blocking unauthorized data transfer**. Additionally, controls applied to networking, identity, and encryption will protect data at various layers. |
| **Maintain the level of confidentiality** as data flows through various components of the system. | *Assume breach*. Enforcing confidentiality levels throughout the system enables you to provide a consistent level of hardening. Doing so can **prevent vulnerabilities** that might result from moving data to a lower security tier. |
| Maintain an **audit trail** of all types of access activities. | *Assume breach*. Audit logs support **faster detection and recovery** in case of incidents and help with ongoing security monitoring. |

## Design to protect integrity

|![Goal icon](../_images/goal.svg) Prevent corruption of design, implementation, operations, and data to avoid disruptions that can stop the system from delivering its intended utility or cause it to operate outside the prescribed limits. The system should provide information assurance throughout the workload lifecycle.|
|--|

The key is to implement controls that prevent tampering of business logic, flows, deployment processes, data, and even the lower stack components, like the operating system and boot sequence. Lack of integrity can introduce vulnerabilities that can lead to breaches in confidentiality and availability.

| Approach | Benefit |
|---|---|
| **Implement strong access controls that authenticate and authorize access to the system. Minimize access based on privilege, scope, and time.** | *Least privilege*.   Depending on the strength of the controls, you'll be able to **prevent or reduce risks from unapproved modifications**. This helps ensure that data is consistent and trustworthy. Minimizing access limits the extent of potential corruption. |
| **Continuously protect against vulnerabilities and detect them in your supply chain** to block attackers from injecting software faults into your build system, tools, libraries, and other dependencies. Supply chain should scan for vulnerabilities during **build time and runtime**. | *Assume breach*. Knowing the origin of software and verifying its authenticity throughout the lifecycle will **provide predictability**. You'll **know about vulnerabilities well in advance** so that you can proactively remediate them and keep the system secure in production. |
| **Ensure backup data is immutable and encrypted** when data is replicated or transferred. | *Verify explicitly.* You'll be able to recover data with confidence that backup **data wasn't changed at rest**, inadvertently or maliciously. |
| **Avoid or mitigate system implementations that allow your workload to operate outside its intended limits and purposes.** | *Verify explicitly.* When your system has strong safeguards that check whether usage aligns with its intended limits and purposes, the scope for potential abuse or tampering of your compute, networking, and data stores is reduced. |

## Design to protect availability

|![Goal icon](../_images/goal.svg) Prevent or minimize system and workload downtime and degradation in the event of a security incident by using strong security controls. You must maintain data integrity during the incident and after the system recovers.| 
|--| 

You need to balance availability architecture choices with security architecture choices. The system should have availability guarantees to ensure that users have access to data and that data is reachable. From a security perspective, users should operate within the allowed access scope, and the data must be trusted. Security controls should block bad actors, but they shouldn't block legitimate users from accessing the system and data.

| Approach | Benefit |
|---|---|
| **Prevent compromised identities from misusing access** to gain control of the system. Check for **overly pervasive scope and time limits** to minimize risk exposure. | *Least privilege*. This strategy **mitigates the risks of excessive, unnecessary, or misused access permissions** on crucial resources. Risks include unauthorized modifications and even the deletion of resources. Take advantage of the platform-provided just-in-time (JIT), just-enough-access (JEA), and time-based security modes to replace standing permissions wherever possible. |
| Use security controls and design patterns to **prevent attacks and code flaws from causing resource exhaustion** and blocking access. | *Verify explicitly*. The **system won't experience downtime** caused by malicious actions, like distributed denial of service (DDoS) attacks. |
| Implement **preventative measures for attack vectors that exploit vulnerabilities** in application code, identity systems, malware protection, and other areas. | *Assume breach*. Implement code scanners, apply the latest security patches, update software, and protect your system with effective antimalware on an ongoing basis. You'll be able to reduce the attack surface to ensure business continuity. |
| **Prioritize** security controls on the **critical components and flows** in the system that are susceptible to risk. | *Assume breach*, *verify explicitly*. Regular detection and prioritization exercises can help you **apply security expertise to the critical aspects** of the system. You'll be able to focus on the most likely and damaging threats and start your risk mitigation in areas that need the most attention. |
| Apply at least the same level of **security rigor in your recovery resources and processes** as you do in the primary environment, including security controls and frequency of backup. | *Assume breach*. You should have a preserved safe system state available in disaster recovery. If you do, you can fail over to a secure secondary system or location and restore backups that won't introduce a threat. A well-designed process can prevent a security incident from hindering the recovery process. Corrupted backup data or encrypted data that can't be deciphered can slow down recovery. |

## Sustain and evolve your security posture

|![Goal icon](../_images/goal.svg) Incorporate continuous improvement and apply vigilance to stay ahead of attackers who are continuously evolving their attack strategies.|
|--|

Your security posture must not degrade over time. You must continually improve security operations so that new disruptions are handled more efficiently. Strive to align improvements with the phases defined by industry standards. Doing so leads to better preparedness, reduced time to incident detection, and effective containment and mitigation. Continuous improvement should be based on lessons learned from past incidents.

It's important to measure your security posture, enforce policies to maintain that posture, and regularly validate your security mitigations and compensating controls in order to continuously improve your security posture in the face of evolving threats.

| Approach | Benefit |
|---|---|
| **Create and maintain a comprehensive asset inventory** that includes classified information about resources, locations, dependencies, owners, and other metadata that's relevant to security. As much as possible, **automate** inventory to derive data from the system. | A well-organized inventory provides a **holistic view of the environment**, which puts you in an advantageous position against attackers, especially during post-incident activities. It also creates a business rhythm to drive communication, upkeep of critical components, and the decommissioning of orphaned resources. |
| **Perform threat modeling** to identify and mitigate potential threats. | You'll have a **report of attack vectors** prioritized by their severity level. You'll be able to identify threats and vulnerabilities quickly and set up countermeasures. |
| Regularly **capture data to quantify your current state** against your established security baseline and **set priorities for remediations**. Take advantage of platform-provided features for **security posture management** and **the enforcement of compliance** imposed by external and internal organizations. | You need accurate reports that bring clarity and consensus to focus areas. You'll be able to immediately **execute technical remediations**, starting with the highest priority items. You'll also **identify gaps**, which provide opportunities for improvement. Implementing enforcement helps prevent violations and regressions, which preserves your security posture. |
| **Run periodic security tests** that are conducted by experts external to the workload team who attempt to ethically hack the system. Perform routine and integrated **vulnerability scanning** to detect exploits in infrastructure, dependencies, and application code. | These tests enable you to validate security defenses by **simulating real-world attacks** by using techniques like penetration testing. Threats can be introduced as part of your change management. Integrating scanners into the deployment pipelines enables you to automatically detect vulnerabilities and even quarantine usage until the vulnerabilities are removed. |
| **Detect, respond, and recover** with swift and effective security operations. | The primary benefit of this approach is that it enables you to **preserve or restore the security assurances of the CIA triad** during and after an attack. You need to be alerted as soon as a threat is detected so that you can start your investigations and take appropriate actions. |
| **Conduct post-incident activities** like root-cause analyses, postmortems, and incident reports. | These activities provide insight into the impact of the breach and into resolution measures, which drives improvements in defenses and operations. |
| **Get current, and stay current.** Stay current on updates, patching, and security fixes. Continuously evaluate the system and improve it based on audit reports, benchmarking, and lessons from testing activities. Consider automation, as appropriate. Use threat intelligence powered by security analytics for dynamic detection of threats. At regular intervals, review the workload's conformance to Security Development Lifecycle (SDL) best practices. | You'll be able to ensure that your **security posture doesn't degrade over time**. By integrating findings from real-world attacks and testing activities, you'll be able to combat attackers who continuously improve and exploit new categories of vulnerabilities. Automation of repetitive tasks **decreases the chance of human error** that can create risk. SDL reviews bring clarity around security features. SDL can help you maintain an inventory of workload assets and their security reports, which cover origin, usage, operational weaknesses, and other factors. |

## Next steps

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
