---
title: Workload threat analysis recommendation for Power Platform workloads
description: Learn how to use threat modeling to identify threats, attacks, vulnerabilities, and counter measures that can affect a Power Platform workload.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/18/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for threat analysis

**Applies to this Power Platform Well-Architected Security checklist recommendation:**

|[SE:02](checklist.md)| **Incorporate a secure design by using threat modeling to safeguard against security-defeating implementations.** |
|---|---|

A comprehensive analysis to identify threats, attacks, vulnerabilities, and counter measures is crucial during the design phase of a workload. Threat modeling is an engineering exercise that includes defining security requirements, identifying, and mitigating threats, and validating those mitigations. You can use this technique at any stage of application development or production, but it's most effective during the design stages of new functionality.

This guide describes the recommendations for doing threat modeling so that you can identify security gaps quickly and design your security defenses.

**Definitions** 

| Term | Definition |
|---|---|
| Software development lifecycle (SDLC) | A multistage, systematic process for developing software systems. |
| STRIDE | A Microsoft-defined taxonomy for categorizing types of threats. |
| Threat modeling | A process for identifying potential security vulnerabilities in the application and system, mitigating risks, and validating security controls. |

## Key design strategies

Threat modeling is a crucial process that an organization should integrate into its SDLC. Threat modeling is not solely a developer's task. It's a shared responsibility between:

- The workload team, which is responsible for the technical aspects of the system.
- Business stakeholders, who understand the business outcomes and have a vested interest in security.

There's often a disconnect between organizational leadership and technical teams regarding business requirements for critical workloads. This disconnect can lead to unwanted outcomes, particularly for security investments.

Consider both business and technical requirements when doing the threat modeling exercise. The workload team and business stakeholders must agree on security-specific needs of the workload so that they can make adequate investments in the countermeasures.

The security requirements serve as guide for the entire process of threat modeling. To make it an effective exercise, the workload team should have a security mindset and be trained in threat modeling tools.

### Understand the scope of the exercise

A clear understanding of the scope is crucial for effective threat modeling. It helps focus efforts and resources on the most critical areas. This strategy involves defining the boundaries of the system, taking inventory of the assets that need to be protected, and understanding the level of investment that's required in security controls.

### Gather information about each component

A workload architecture diagram is a starting point for gathering information because it provides a visual representation of the system. The diagram highlights technical dimensions of the system. For example, it shows user flows, how data moves through different parts of the workload, data sensitivity levels and information types, and identity access paths.

This detailed analysis can often provide insight into potential vulnerabilities in the design. It's important to understand the functionality of each component and its dependencies.

### Evaluate the potential threats

Analyze each component from an outside-in perspective. For example, how easily can an attacker gain access to sensitive data? If attackers gain access to the environment, can they move laterally and potentially access or even manipulate other resources? These questions help you understand how an attacker might exploit workload assets.

### Classify the threats by using an industry methodology

One methodology for classifying threats is [STRIDE](/azure/security/develop/threat-modeling-tool-threats), which the Microsoft Security Development Lifecycle uses. Classifying threats helps you understand the nature of each threat and use appropriate security controls.

### Mitigate the threats

Document all the identified threats. For each threat, define security controls and the response to an attack if those controls fail. Define a process and timeline that minimize exposure to any identified vulnerabilities in the workload, so that those vulnerabilities can't be left unaddressed.

Use the *assume breach* approach. It can help identify controls needed in the design to mitigate risk if a primary security control fails. Evaluate how likely it is for the primary control to fail. If it does fail, what is the extent of the potential organizational risk? Also, what is the effectiveness of compensating controls? Based on the evaluation, apply defense-in-depth measures to address potential failures of security controls.

Here's an example:

| Ask this question | To determine controls that... |
|---|---|
| Are connections authenticated through Microsoft Entra ID, and use modern security protocols that the security team approved:<br><br>- Between users and the application?<br><br>- Between application components and services?<br><br>- Between users and an AI assistant (agent)? | Prevent unauthorized access to the application components and data. |
| Are you limiting access to only accounts that need to write or modify data in the application? | Prevent unauthorized data tampering or alteration. |
| Is the application activity logged and fed into a security information and event management (SIEM) system through Azure Monitor or a similar solution? | Detect and investigate attacks quickly. |
| Is critical data protected with encryption that the security team approved? | Prevent unauthorized copying of data at rest. |
| Is inbound and outbound network traffic isolated to domains approved by the security teams? | Prevent unauthorized copying of data. |
| Is the application protected against access from external/public locations such as coffee shops by using IP firewalls on the environment? | Prevent access from unauthorized public locations. |
| Does the application store sign-in credentials or keys to access other applications, databases, or services? | Identify whether an attack can use your application to attack other systems. |
| Do the application controls allow you to fulfill regulatory requirements? | Protect users' private data and avoid compliance fines. |

### Track threat modeling results

We highly recommend that you use a *threat modeling tool*. Tools can automate the process of identifying threats and produce a comprehensive report of all identified threats. Be sure to communicate the results to all interested teams.

Track the results as part of the workload team's backlog to allow for accountability in a timely way. Assign tasks to individuals who are responsible for mitigating a particular risk that threat modeling identified.

As you add new features to the solution, update the threat model and integrate it into the code management process. If you find a security problem, make sure there's a process to triage the problem based on severity. The process should help you determine when and how to remediate the problem (for example, in the next release cycle or in a faster release).

### Regularly review business-critical workload requirements

Meet regularly with executive sponsors to define requirements. These reviews provide an opportunity to align expectations and ensure operational resource allocation to the initiative.

## Power Platform facilitation

Power Platform is built on a culture and methodology of secure design. Both culture and methodology are constantly reinforced through Microsoft's industry-leading [Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl/practices) (SDL) and [Threat Modeling](https://www.microsoft.com/securityengineering/sdl/threatmodeling) practices.

The Threat Modeling review process ensures that threats are identified during the design phase, mitigated, and validated to make sure they've been mitigated.

Threat Modeling also accounts for all changes to services that are already live through continuous regular reviews. Relying on the [STRIDE model](/azure/security/develop/threat-modeling-tool-threats) helps to address the most common issues with insecure design.

Microsoft's SDL is equivalent to the [OWASP Software Assurance Maturity Model](https://owaspsamm.org/) (SAMM). Both are built on the premise that secure design is integral to web application security.

For more information, see [OWASP top 10 risks: Mitigations in Power Platform](/power-platform/admin/security/faqs#owasp-top-10-risks-mitigations-in-power-platform).

## Example

This example builds on the Information Technology (IT) environment established in the [Recommendations for establishing a security baseline](establish-baseline.md). This approach provides a broad understanding of the threat landscape across different IT scenarios.

**Development Lifecycle personas**. There are many personas involved in a development life cycle, including developers, testers, final users, and administrators. All of them may be compromised and put your environment at risk through vulnerabilities or threats created intentionally.

**Potential attackers**. Attackers consider a wide range of tools available easily to be used at any time to explore your vulnerabilities and start an attack.

**Security controls**. As part of threat analysis, identify Microsoft, Azure, and Power Platform security services to be used to protect your solution and how effective those solutions are.

**Log collection**. Logs from Power Platform resources and other components included in your workload, such as Azure resources and on-premises components, may be sent to Application Insights or Microsoft Purview so you may understand the behavior of your solution developed and try to capture initial vulnerabilities.

**Security information event management (SIEM) solution**. Microsoft Sentinel may be added even in an early stage of the solution so you can build some analytics queries to mitigate threats and vulnerabilities, anticipating your security environment when you are in production.

## Related information

- [STRIDE model](/azure/security/develop/threat-modeling-tool-threats)
- [Threat Modeling](https://www.microsoft.com/securityengineering/sdl/threatmodeling)
- [Power Platform security FAQs](/power-platform/admin/security/faqs)
- [Microsoft Identity Platform](/azure/active-directory/develop/v2-overview)
- [Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl/practices)
- [Azure AD Continuous access evaluation](/azure/active-directory/conditional-access/concept-continuous-access-evaluation)
- [Content security policy](/power-platform/admin/content-security-policy)
- [Azure DDoS Protection](/azure/ddos-protection/ddos-protection-standard-features)
- [Microsoft Intune's compliance policy settings](/mem/intune/protect/device-compliance-get-started)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
