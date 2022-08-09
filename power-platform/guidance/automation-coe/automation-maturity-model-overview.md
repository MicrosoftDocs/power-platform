---
title: Microsoft Power Platform automation maturity model overview | Microsoft Docs
description: Helps organizations and their partners think through how they can improve their current RPA and hyperautomation capabilities and align them to business outcomes.
author: ashVancouver

ms.subservice: guidance
ms.topic: conceptual
ms.date: 08/08/2022
ms.author: ashwinrajuk
ms.reviewer: deonhe
search.audienceType: 
  - admin
search.app: 
  - Flow
  - Powerplatform
---

# Power Platform automation maturity model

Microsoft Power Automate helps organizations to drive their digital journey. Automation is more than just a buzzword today; it's critical for successful organizations. Power Automate helps bridge the technology gap, enabling citizen developers to build robust and secure automation to improve their efficiency.

It is our goal to empower everyone to use Power Automate to automate their processes with flows. Using low-code, drag-and-drop tools, and hundreds of pre-built connectors that automate repetitive, mundane tasks with ease, Power Automate empowers business users to build automation. Through lessons learnt and best practices observed from many customer engagements, we have curated a sequence of patterns across a progressive scale.

The [Automation adoption best practices overview](https://aka.ms/autocoeblueprint) contains proven guidance for establishing and scaling an Automation Center of Excellence in your organization. The goal of the automation maturity model is to help organizations and their partners think through how they can improve their current capabilities and align them to business outcomes.

<!--Todo The pngs are not displaying in the doc-->

:::image type="content" source="media/autocoe.png" alt-text="The Automation CoE layer cake details the activities that various stakeholders would perform. The stakeholders considered here are citizen developers, automation CoE members, infrastructure ops, automation/M365 CoE team and executive sponsors.":::

A successful automation implementation requires technology, process, and people to be aligned. The automation maturity model is inspired by HEAT – [Holistic Enterprise Automation Techniques](heat.md) and the [Capability Maturity Model](https://cmmiinstitute.com/learning/appraisals/levels).

:::image type="content" source="media/HEAT-Snap.png" alt-text="Diagram explains the various HEAT pillars.":::

This article explains the automation maturity levels. You can find further details of the capabilities at each level in [Power Platform automation maturity model details](automation-maturity-model-details.md).

## Level 100 – Initial

*Failing forward, experimentation, feasibility analysis, cautious optimism*

In the *Initial* phase, the organization begins its journey with Power Automate, evaluating its alignment and integration with the organization's architecture/automation vision. Technology and business vertical representatives discuss the overarching technology and business goals, encompassing organization-specific networking, information security, legal and privacy requirements. Organization charters technology upskilling endeavors to enable Power Automate adoption across the organization. Key performance indicators (KPIs) measuring automation benefits and its subsequent influence on the operational metrics across the organization are established, however, recording progress is still manual at this phase.

## Level 200 – Repeatable

*Organization “on-board,” digital stewardship, bias to action*

In the *Repeatable* phase, the organization evolves in its automation journey by codifying lessons learned from the *Initial* phase. An automation Center of Excellence (CoE) is established to evangelize automation adoption and serve as a liaison between technology and business stakeholders.

The CoE also defines best practices on automation, including process selection, infrastructure setup and maintenance, security management, application life cycle management, and license management. The organization understands the value proposition automation offers, promotes Power Automate training across the board and drives change management initiatives. Based on the experiences from the *Initial* phase, teams highlight potential automation opportunities.

## Level 300 – Defined

*Iterative standardization, feedback elicitation, gaps fulfillment, business/technology resilience*

In the *Defined* phase, the organization continues to standardize and refine processes that were established in the *Repeatable* phase. Organizations may choose to redefine goals based on lessons learnt and progress made in prior phases, while striving towards continuous improvement. The groundwork established in the prior phases are further evolved with a bias towards scale, security, and resilience. Therefore, the CoE drives initiatives to automate governance and platform-related concerns to promote scale. Platform governance-related initiatives, encompassing environment provisioning, Data Loss Prevention (DLP) policy requests, licensing and machine management are implemented in this phase.

The security posture of the organization is enhanced by addressing network security concerns including, firewall setup, intrusion detection system (IDS), intrusion prevention system (IPS), and industry-specific network security protocol standards. Findings with potential policy violations, exploits, and vulnerabilities should be addressed promptly. The organization's maturity to address network concerns should be gauged periodically. As the practice matures, Power Automate emerges to be an integral part of the technology landscape in the organization. Hence, the need to build fault tolerant processes is inevitable. As a result, the automation CoE formalizes internal guard rails by defining disaster recovery scenarios including, business impact analysis, risk analysis, and network/cloud/data recovery with a definitive business continuity plan in the event of a failure.

## Level 400 – Capable

*Strategic benchmarking, technology driven optimization, “business led, CoE supported”*

In this phase, the organization has established processes for monitoring and managing automation health from both a quantitative and qualitative perspective. The organization is successful in democratizing automation across both business and technical verticals. Automation initiatives shift from being CoE-driven to a citizen-developer-driven model. The organization builds on its technology capabilities, enriching their automation landscape. Process mining tools are leveraged to optimize processes and improve process efficiency. Pro developers collaborate to build the necessary APIs to enable citizen developers to build automation. AI-based capabilities are implemented to solve business problems in the context of process automation. Organizations can attend to a wider array of use cases based on the fusion of technologies.

## Level 500 – Efficient

*Community beacons, cross team collaboration, addressing gaps hindering excellence*

In the *Efficient* phase, the organization is at a mature state in its automation journey from a business process, technology enablement, and automation adoption perspective. In the context of automation, the organization has established its capabilities to harmoniously integrate Power Automate to its digital landscape. Governance, security management, KPI dashboarding, and application lifecycle management procedures are thoroughly automated with minimal to no manual effort required to sustain these processes.

A well-established community of experts helps to resolve any issues and queries that citizen developers have while they're building automation. Fusion teams involving experts from cloud, AI, and other modern technological capabilities collaborate to build elegant automation processes that leverage the benefits that the combination of these technologies offers. Organizations at the *efficient* phase have executive sponsorship and they play a pivotal role in the digitization of the organization. *Efficient* organizations serve as beacons for other organizations that are looking to progress in their automation maturity by sharing best practices and helping organizations overcome any challenges they may face.

## Automation maturity model details

The detailed Automation Maturity Model captures goals, indicators, and required resources across the various phases of maturity.

> [!div class="nextstepaction"]
> [Next step: Detailed capabilities](automation-maturity-model-details.md)

## Resources for rolling out an automation program

- [Automation CoE Blueprint](https://aka.ms/autocoeblueprint)
- [Automation CoE Strategy](https://aka.ms/autocoestrategy)
- [HEAT](https://aka.ms/rpapnp)
- [HEAT video series](https://aka.ms/rpapnpvideo)
- [Admin and Governance Whitepaper](https://aka.ms/autocoeadminwhitepaper)
- [Manage Power Automate for desktop on Windows](https://aka.ms/padonwindowspnp)
- [Hyper-automation SAP playbook](https://aka.ms/MicrosoftRPAPlaybookForSAPGUI) and [video series](https://aka.ms/AutomateItSAPSeries)

## Customer Stories

- [Coca-Cola](https://aka.ms/cocacolaautomationplatform)
- [Coca-Cola United](https://aka.ms/cocacolaunitedrpa)
- [TC Energy Bot Wars](https://aka.ms/Bot-Wars)
- [Inter Pipeline Botwars](https://youtu.be/bzN3CkOt_go?t=1773)
- [Chemours](https://www.youtube.com/watch?v=ZnSsixwJDQ0)
- [Customer stories collection](https://aka.ms/powerautomatestories)

## Learning resources

- [Automate It](https://aka.ms/AutomateIt)
- [Holistic Enterprise Automation Techniques (HEAT)](https://aka.ms/rpapnp)
- [RPA in a Day training](https://aka.ms/RPAinaDayPackage)
- [Power Automate learn](/learn/browse/?expanded=power-platform&amp%3Bproducts=power-automate&amp%3Bresource_type=learning%20path&amp%3Broles=maker)

