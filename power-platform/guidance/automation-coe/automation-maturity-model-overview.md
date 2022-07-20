---
title: "Microsoft Power Platform automation maturity model overview | Microsoft Docs"
description: "Helps organizations and their partners think through how they can improve their current RPA and hyperautomation capabilities and align them to business outcomes."
author: ashVancouver

ms.subservice: guidance
ms.topic: conceptual
ms.date: 07/25/2022
ms.author: ashwinrajuk
ms.reviewer: deonhe
search.audienceType: 
  - admin
search.app: 
  - Flow
  - Powerplatform
---

# Power Platform Automation Maturity Model

Microsoft Power Automate helps organizations truly drive their digital journey. Automation is more than just a buzzword today; it is the lifeline of successful organizations. Power Automate helps bridge the technology gap, enabling citizen developers to build robust and secure automation to address their automation needs.

It is our goal to empower everyone to build automated processes with flows in Power Automate. Using low-code, drag-and-drop tools and hundreds of pre-built connectors that automate repetitive, mundane tasks with ease, Power Automate truly empowers business users to build automation. Through lessons learnt and best practices observed from many of our customer engagements we have curated a sequence of patterns across a progressive scale.

The [Automation CoE Blueprint](https://aka.ms/autocoeblueprint) contains proven guidance for establishing and scaling an Automation Center of Excellence in your organization. The goal of the Automation Maturity Model is to help organizations and their partners think through how they can improve their current capabilities and align them to business outcomes.

:::image type="content" source="media/autocoe.png" alt-text="The Automation CoE layer cake talks about activities the various stakeholders would perform. The stakeholders considered here are Citizen developers, Automation CoE members, Infrastructure Ops, Automation/M365 CoE team and the Executive Sponsors.":::

A successful automation implementation requires technology, process, and people to be aligned. The Automation Maturity Model is inspired by HEAT – [Holistic Enterprise Automation Techniques](https://powerautomate.microsoft.com/blog/heat-holistic-enterprise-automation-techniques-for-rpa-and-more/) and the [Capability Maturity Model](https://cmmiinstitute.com/learning/appraisals/levels)

:::image type="content" source="media/HEAT-Snap.png" alt-text="Diagram explains the various HEAT pillars.":::

This article explains the automation maturity levels. Further details of capabilities at each level are in the next article, [Power Platform automation maturity model: Details](automation-maturity-model-details.md).

## Level 100 – Initial

*Failing forward, experimentation, feasibility analysis, cautious optimism*

In the “Initial” phase, the organization has just begun its journey with Power Automate – tool capabilities, its alignment and integration with the Enterprise Architecture/Automation vision is evaluated. Technology and Business vertical representatives, discuss overarching technology and business goals encompassing organization specific Enterprise Networking, Information Security, Legal and Privacy requirements. Organization charters technology upskilling endeavors to enable Power Automate adoption across the enterprise. Key Performance Indicators measuring automation benefits and its subsequent influence on the operational metrics across the enterprise is established (albeit the process of recording progress is still manual at this phase).

## Level 200 – Repeatable

*Enterprise “on-board,” digital stewardship, bias to action*

In the “Repeatable” phase, the enterprise evolves in its automation journey by “codifying” lessons learned from the “Initial” phase. An automation Center of Excellence (CoE) is established to evangelize automation adoption and serve as a liaison between technology and business stakeholders. The CoE also defines best practices on automation, including – process selection, infrastructure setup/maintenance, security management, application life cycle management, and license management. The enterprise understands the value proposition automation offers, promotes Power Automate training across the board and drives change management initiatives. Based on the experiences from the prior phase, teams highlight potential automation opportunities.

## Level 300 – Defined

*Iterative standardization, feedback elicitation, gaps fulfillment, business/technology resilience*

In the “Defined” phase, the enterprise continues to standardize and refine processes established in the “Repeatable” phase. Organizations may choose to redefine goals based on lessons learnt and progress made in prior phases, whilst striving towards continuous improvement. The groundwork established in the prior phases are further evolved with a bias towards scale, security and resilience. Therefore, the CoE drives initiatives to automate governance and platform related concerns to promote scale. Platform governance related initiatives, encompassing environment provisioning, Data Loss Prevention (DLP) policy requests, licensing and machine management are implemented in this phase.

Security posture of the organization is enriched by addressing network security concerns including firewall setup, Intrusion Detection System (IDS), Intrusion Prevention System (IPS) and industry specific network security protocol standards. Concerning findings (potential policy violations, exploits and vulnerabilities) should be readily addressed. The enterprise’s maturity to address network concerns should be gauged periodically. As the practice matures, Power Automate emerges to be an integral part of the technology landscape of the organization. Hence, the need to build fault tolerant processes is inevitable. As a result, the Automation CoE formalizes internal guard rails by defining disaster recovery scenarios including – business impact analysis, risk analysis, network/cloud/data recovery with a definitive business continuity plan in the event of a failure.

## Level 400 – Capable

*Strategic benchmarking, technology driven optimization, “business led, CoE supported”*

In this phase, the enterprise has established processes for monitoring and managing automation health from both a quantitative and qualitative perspective. The enterprise is successful in democratizing automation across both business and technical verticals. Automation initiatives shift from a CoE driven to a citizen developer driven model. The enterprise builds on their technology capabilities enriching their automation landscape. Process mining tools are leveraged to optimize processes and improve process efficiency. Pro developers collaborate to build the necessary APIs (Application Programming Interfaces) to facilitate citizen developers to build automation. AI (Artificial Intelligence) based capabilities are implemented to solve business problems in the context of process automation. Enterprises can attend to a wider array of use cases as a result of fusion of technologies.

## Level 500 – Efficient

*Community beacons, cross team collaboration, addressing gaps hindering excellence*

In the efficient phase, the enterprise is at a mature state in its automation journey from a business process, technology enablement and automation adoption perspective. In the context of automation, the enterprise has established its capabilities to harmoniously integrate Power Automate to its digital landscape. Governance, security management, KPI dashboarding, application lifecycle management procedures are thoroughly automated with minimal to no manual effort required to sustain these processes.

A well-established community of experts help resolve any issues and queries citizen developers may have in building automation. Fusion teams involving experts from cloud, AI and other modern technological capabilities collaborate to build elegant automation processes leveraging the benefits a mélange of these technologies can offer. Organizations at the Efficient phase have executive sponsorship  play a pivotal role in the digitization of the enterprise. “Efficient” enterprises serve as beacons for other organizations looking to progress in their automation maturity by sharing best practices and helping organizations overcome the challenges they may face.

## Automation Maturity Model details

Here is a high-level snapshot of [The Automation Maturity Model](/automation-maturity-model-details.md), which captures goals, realization and required resources across the various phases of maturity.

:::image type="content" source="media/Maturity-Snap.png" alt-text="High Level Snapshot of the Automation Maturity Model - Groups Goals based of the various HEAT pillars, namely Empower, Discover &amp; Plan, Design, Build and Test, Deploy &amp; Manage, Secure &amp; Govern and Nurture. The CMMI levels across the various phases Initial, Repeatable, Defined, Capable and Efficient in relation to the HEAT pillars are defined." link="https://aka.ms/automationmaturitymodel":::


> [!div class="nextstepaction"]
> [Next step: Detailed capabilities](automation-maturity-model-details.md)

## Resources for rolling out an automation program

- [Automation CoE Blueprint](https://aka.ms/autocoeblueprint)
- [Automation CoE Strategy](https://aka.ms/autocoestrategy)
- [HEAT](https://aka.ms/rpapnp)
- [HEAT video series](https://aka.ms/rpapnpvideo)
- [Admin &amp; Governance Whitepaper](https://aka.ms/autocoeadminwhitepaper)
- [Manage Power Automate for Desktop on Windows](https://aka.ms/padonwindowspnp)
- [Hyper-automation SAP playbook](https://aka.ms/MicrosoftRPAPlaybookForSAPGUI) &amp; [video series](https://aka.ms/AutomateItSAPSeries)

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
- [RPA in a Day Training](https://aka.ms/RPAinaDayPackage)
- [Power Automate Learn](https://docs.microsoft.com/learn/browse/?expanded=power-platform&amp;products=power-automate&amp;resource_type=learning%20path&amp;roles=maker")
