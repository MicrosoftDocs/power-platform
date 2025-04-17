---
title: Power Platform adoption maturity model - Detailed capabilities
description: Learn how the Power Platform adoption maturity model helps organizations define a roadmap for successful low-code adoption and digital transformation.
customer intent: As a Power Platform user, I want to understand the Power Platform adoption maturity model so that I can define a roadmap for successful low-code adoption.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: sericks
search.audienceType:
  - admin
---

# Power Platform adoption maturity model - Detailed capabilities

The adoption maturity model helps define a roadmap for Microsoft Power Platform adoption. The roadmap includes strategic and tactical considerations and action items that lead to successful Power Platform adoption.

Advancing adoption and building a low-code culture involves more than implementing technology features. Technology helps organizations make a significant impact, but a healthy low-code culture requires considering people, processes, and technology.

The adoption maturity model helps organizations and their partners evaluate and prioritize their capabilities. Each stage describes the states of disciplines such as strategy and vision, administration, and governance. The model helps organizations understand their capabilities across multiple dimensions, decide their target level for each dimension and timeline, and improve capabilities by progressing to the next level.

The following sections present detailed characteristics and capabilities of an organization in each stage.  

## Strategy and vision

The following table describes different states of strategy and vision for different levels.

| Level | State of strategy and vision |
|-------|-------------------------------|
| 100: Initial | - Innovation driven by business areas (bottom up) <br>- Low-complexity scenarios <br>- Limited reuse - Undefined strategy |
| 200: Repeatable | - Defined [vision, metrics, and goals](vision.md) of what the organization wants to achieve with Power Platform <br>- Common vision between IT and business <br>- Demand-management process |
| 300: Defined | - [Executive sponsor](executive-sponsorship.md) formulates a strategic vision and priorities for Power Platform and low code <br> - Dedicated Power Platform product owner <br> - Bottom-up and top-down innovation <br> - Defined understanding of Power Platform’s role in your organization’s IT portfolio <br> - Defined [roles and responsibilities](roles.md) for key areas like governance and community |
| 400: Capable | - Established [Center of Excellence](coe.md) team <br>- Increased delivery efficiency supports rapidly changing business needs<br> - Business plans shared across departments |
| 500: Efficient | - Power Platform is a key part of the digital transformation strategy<br> - Vision and strategy are understood by all <br>- Organization-wide initiatives deliver larger-scale apps<br> - Enterprise architecture decisions include Power Platform capabilities |

## Business value

The following table describes different states of business value for different levels.

| Level | State of business value |
|-------|--------------------------|
| 100: Initial | - No formal business value assessment<br> - Undefined targets |
| 200: Repeatable | - No formal business value assessment <br>- Business cases are understood but lacking review |
| 300: Defined | - [Key performance indicators (KPIs) are understood](business-value.md), operationalized, reported on, and reviewed against goals <br> - Ideas with the highest business value are chosen for development <br> - Business pain points are quantified before the project starts and compared after it finishes. |
| 400: Capable | - Precise quantitative and qualitative measures are used to effectively control, predict, and improve business efficiency <br>- [Business Value toolkit](business-value-methods.md#business-value-toolkit) or equivalent tooling for measuring business value are adopted<br> - Reports on business value of Power Platform solutions are shared with key stakeholders |
| 500: Efficient | - “Big picture” analytics visualize the business value of Power Platform solutions all-up and per business area.<br> - Advanced dashboards and reporting provide decision-making capabilities and measure business value.<br> - Executives have visibility into the business value and impact of Power Platform solutions. |

## Security

The following table describes different states of admin and governance for different levels.

| Level | State of admin and governance |
|-------|-------------------------------|
| 100: Initial | - Uses basic Microsoft Entra ID for user authentication and access control.<br> - No data loss prevention policies (DLP).<br> - No monitoring of Power Platform activity.<br> - Compliance requirements aren't understood. |
| 200: Repeatable | - Default environment is covered by [DLP controls](dlp-strategy.md). <br>- [Tenant isolation](data-protection.md#cross-tenant-inbound-and-outbound-restrictions) is configured.<br> - Some workload teams understand compliance and regulatory requirements for the solutions they build and consider them during workload design.<br> - [Sharing limits](conditional-access.md#configure-sharing-limits) are configured.<br> - Security teams are starting to work with Power Platform admins to define a security strategy. |
| 300: Defined | - [DLP strategy](dlp-strategy.md) for all environments is established, and a clear process for requesting a new policy or policy changes is defined.<br> - Uses some advanced Microsoft Entra ID features, such as Conditional Access, for administrative accounts.<br> - Regularly reviews the [Security page](security-posture-management.md#assess-security-score-and-act-on-recommendations) and acts on recommendations. <br>- Secure coding practices and guidelines are established and shared with makers.<br> - Compliance and regulatory requirements are understood, and audits are conducted to ensure Power Platform workloads comply with these requirements. |
| 400: Capable | - Uses advanced Microsoft Entra ID features, such as Conditional Access, Privileged Identity Management (PIM), and potentially Continuous Access Evaluation (CAE) for granular control over access.<br> - Uses a well-defined environment strategy with clear security group assignments and role-based access control (RBAC) for different workloads.<br> - Customizes Dataverse security roles, implements column-level security, and uses record-level sharing for fine-grained data access control.<br> - Advanced DLP and Network Security. Employs extended DLP with connector action control and endpoint filtering. Implements IP firewall and potentially uses virtual network support for network isolation.<br> - Proactive monitoring. Integrates Power Platform logs with Microsoft Sentinel or a similar security information and event management (SIEM) solution for threat detection and incident response. |
| 500: Efficient | - Comprehensive Identity and Access management. Implements a mature identity governance framework with automated provisioning/de-provisioning, access reviews, and entitlement management.<br> - Advanced Data Security: Implements data masking, customer-managed keys (CMK), and potentially Customer Lockbox for enhanced data protection. Uses Microsoft Purview for data classification and labeling.<br> - Robust Network Security. Implements a defense-in-depth network security strategy with Azure Firewall, Network Security Groups (NSGs), and Azure Policy. <br>- Advanced threat protection and monitoring. Employs advanced threat protection capabilities like Microsoft Defender for Cloud Apps. Uses AI and automation for threat detection and response in their SOC. Actively participates in the Security Development Lifecycle (SDL) and uses the [Power Platform Well-Architected Framework](/power-platform/well-architected/) for continuous improvement.<br> - A defined [security incident](security-posture-management.md#incident-preparation-and-response) process is in place. <br>- [Security training](security-posture-management.md#training) is regularly reviewed and part of all Power Platform training.<br> - Comprehensive analysis to identify threats, attacks, vulnerabilities, and countermeasures is part of the design phase of a workload. |

## Governance

The following table describes different states of admin and governance for different levels.

| Level | State of admin and governance |
|-------|-------------------------------|
| 100: Initial | - All users can create environments.<br> - Data loss prevention (DLP) policies aren't configured. <br>- Sharing limits aren't set, so makers can share solutions broadly from any environment. |
| 200: Repeatable | - [Power Platform service admin](pp-admin.md) role assigned to specific administrators. <br>- Analytics are used to gain tenant-wide insights of existing usage. |
| 300: Defined | - [Defined environment, DLP, and request management strategies](environment-strategy.md) are implemented. <br>- [App usage](resource-usage.md) and adoption are monitored.<br> - [License, capacity, and consumption monitoring](cds-usage.md) informs decision-making. <br>- A [tiered approach to productivity environments](environment-strategy.md) is used based on maker maturity. <br>- A governance framework defines and shares guidelines and rules with makers. <br>- Recommendations from Power Advisor are regularly reviewed and implemented. |
| 400: Capable | - Overshared, unused, and orphaned resources are identified, and appropriate actions are taken. - Reactive governance automatically gathers business and compliance information.<br> - Telemetry identifies business-critical apps. <br>- The Power Platform Operations team ensures tenant hygiene.<br> - Maker responsibilities are clearly defined, understood, and automatically communicated.<br> - Power Advisor recommendations are automated, and tasks are routed through approvals. <br>- Environment groups manage adoption at scale. |
| 500: Efficient | - Further automation occurs through agents embedded in Teams. Tasks are autoapproved or routed through multi-step approval processes based on clear risk profiles (for example, line manager, information security department, environment, or tenant admin). <br>- Organizations share successful practices externally at Microsoft or community events. |

## Operations

The following table describes different states of support for different levels.

| Level | State of support |
|-------|-------------------|
| 100: Initial | - Makers support their own apps. <br>- No or limited rules define how processes are supported by IT and business stakeholders. <br>- No application lifecycle management process exists. |
| 200: Repeatable | - Community support.<br> - Some degree of commitment and governance measures manage solution lifecycle stages.<br> - Solutions are manually deployed to production environments with limited manual testing. |
| 300: Defined | - Custom environments are used for specific use cases and application lifecycle management (ALM) scenarios.<br> - Pipelines automate solution deployment. <br>- The support strategy involves the helpdesk. <br>- A defined risk profile dictates the level of support a solution receives (for example, IT-supported, IT-blessed, maker-supported). |
| 400: Capable | - A dedicated support team exists.<br> - Continuous improvement plans align with the business strategy.<br> - Roles and responsibilities are clearly understood.<br> - Deployment stages and approvals are clearly defined. |
| 500: Efficient | - Automation of support activities (for example, change ownership, agent for FAQ). <br>- Responsibilities and ownership to build and operate solutions are fully understood. |

## Community

The following table describes different states of nurture and citizen makers for different levels.

| Level | State of nurture and citizen makers |
|-------|-------------------------------------|
| 100: Initial | - Some staff might attend App in a Day events (partner or Microsoft delivered).<br> - Team-based initiatives for nurturing makers. |
| 200: Repeatable | - [On-boarding strategy](onboard-makers.md) for new makers <br>- Some staff participated in a [hackathon](hackathons.md) <br>- Makers become ambassadors across their departments and evangelize the capabilities |
| 300: Defined | - Makers provide insights into business pain points<br> - [Training and upskilling](training-strategy.md) strategy for makers<br> - Internal [champions](champions.md) community <br>- [CoE Starter Kit - Nurture Module](../coe/nurture-components.md) adopted |
| 400: Capable | - Regular events for champions.<br> - Regular hackathons. <br>- Maker assessments and certificates. <br>- Sharing and celebrating [success stories](show-and-tell.md).<br> - Show & Tell sessions. - Adoption campaign. |
| 500: Efficient | - Large internal community with proven value. - Career path for makers.<br> - Community of mentors.<br> - Common development strategy and goals for citizen and pro developers. |

## Responsible AI

The following table describes different states of nurture and citizen makers for different levels.

| Level | State of nurture and citizen makers |
|-------|-------------------------------------|
| 100: Initial | - Leadership recognizes responsible AI (RAI) as important but hasn't integrated it fully into decision-making processes or embedded it into organizational culture.<br> - There are little or no formal governance policies or compliance processes in place for responsible AI.<br> - There's little or no structured training available for responsible AI, and awareness is low.<br> - AI projects proceed without oversight. <br>- There's a lack of awareness about what constitutes RAI risks. <br>- There are no formal processes for managing or governing data used in AI systems. |
| 200: Repeatable | - Senior leadership begins to recognize the value of responsible AI and promotes it through occasional incentives or support for passionate individuals or teams.<br> - Early efforts are focused on establishing foundational governance policies and drafting compliance processes tailored to the specific challenges of low-code AI systems.<br> - Some training resources might exist, but they aren't accessible or widely adopted.<br> - Some projects begin to integrate responsible AI reviews, typically towards the end of the project lifecycle.<br> - RAI risks are raised in an ad-hoc manner without conducting specific investigations.<br> - Data sources used in custom models are documented, but there's no formal auditing process. |
| 300: Defined | - Leadership increasingly prioritizes responsible AI, allocating resources such as dedicated budgets and AI champions to promote responsible AI practices.<br> - A comprehensive responsible AI policy is in place, covering most aspects of RAI (for example, fairness, transparency).<br> - Responsible AI training programs are developed but aren't yet mandatory.<br> - RAI reviews are integrated into the project lifecycle at key stages.<br> - Impact assessments start to be conducted, involving relevant stakeholders to identify risks relating to RAI.<br> - Data governance practices are formalized, with regular data quality assessments and sensitivity classifications for all unstructured data used in AI. |
| 400: Capable | - Responsible AI is fully integrated into leadership decision-making. Resources are allocated for governance, training, and compliance. <br>- Governance and compliance processes are well-established and automated where appropriate.<br> - Responsible AI training is mandatory for key roles.<br> - Projects are reviewed for responsible AI risks at regular intervals, and some teams begin to allocate specific resources for responsible AI oversight. <br>- RAI risks are managed with a recognized risk management framework (for example, NIST AI risk management framework).<br> - Automated frameworks are in place for managing unstructured data quality and sensitivity, with ongoing monitoring of compliance requirements. |
| 500: Efficient | - Leadership drives responsible AI at every level of the organization. It's seen as a strategic priority, with regular reviews of responsible AI initiatives, cross-team collaboration, and continuous investment in culture, tooling, and governance.<br> - Governance policies and compliance processes are continuously updated, and responsible AI is seamlessly integrated into all operations.<br> - Responsible AI training is a continuous process that is highly accessible to all employees.<br> - Responsible AI is fully embedded in the project management lifecycle. <br>- Findings from compliance incidents are incorporated into planning. <br>- Data management is fully integrated into the AI lifecycle with real-time monitoring. |

## Automation

The following table describes different states of automation for different levels.

| Level | State of automation |
|-------|----------------------|
| 100: Initial | - Processes are largely manual and one-off |
| 200: Repeatable | - Processes are standardized, but implemented manually |
| 300: Defined | - Environment and DLP connector policy requests are automated.<br> - Apps are deployed manually, but using solutions.<br> - Communication about processes and compliance between admins and makers is automated. |
| 400: Capable | - ALM processes are defined and implemented centrally. <br>- Admin tasks to identify overshared, unused, and orphaned resources are largely automated.<br> - Governance tasks to gather compliance and support information are automated. |
| 500: Efficient | - ALM processes are owned by each Fusion team. <br>- Environment Lifecycle Management is automated. |

## Fusion teams

The following table describes different states of fusion teams for different levels.

| Level | State of fusion teams |
|-------|------------------------|
| 100: Initial | - Teams work independently <br>- No pro dev use of Power Platform |
| 200: Repeatable | - Teams review and ratify each other’s work <br>- Pro devs pilot high-value use cases |
| 300: Defined | - Teams plan work as a team, but operate independently. <br>- Teams manage source control and app lifecycles. <br>- [Standard libraries, custom connectors, and components](reusable.md) are made available centrally and used by makers. |
| 400: Capable | - Cross-functional teams plan and execute work jointly, including makers, testers, and operational teams. <br>- Collaborative planning for infrastructure and change enablement. <br>- Use of Common Data Model to aid data reuse. |
| 500: Efficient | - Teams form seamlessly to accommodate cross-functional skills.<br> - Common development strategy and goals for citizen and pro developers needed for new projects. |

## Power Platform adoption

Successful Power Platform adoption means making effective processes, support, tools, and data available to makers and users.

A common misconception is that adoption relates primarily to usage or the number of users. Usage statistics are an important factor. But usage isn't the only factor. Adoption isn't just about using the technology regularly; it's about using it *effectively*. Effectiveness is harder to define and measure.

Whenever possible, align adoption efforts across low-code platforms and other Power Platform products, such as Power BI.

> [!NOTE]  
> Individuals and organizations are continually learning, changing, and improving. That means there's no formal end to adoption efforts.  

## Target audience

The intended audience of the adoption maturity model is interested in one or more of the following outcomes:

- Improving their organization's ability to effectively use Power Platform.  
- Increasing their organization's maturity level related to Power Platform delivery.  
- Understanding and overcoming challenges related to adoption when scaling Power Platform.  
- Increasing their organization's return on investment (ROI) in Power Platform.  

Primarily, this series of articles is helpful to those who work in an organization with one or more of the following characteristics:

- Power Platform is deployed with some successes.  
- Power Platform has pockets of viral adoption, but isn't purposefully governed across the entire organization.  
- Power Platform is deployed with some meaningful scale, but there remains a need to determine:  
  - What is effective and what should be maintained?  
  - What should be improved?  
  - How future deployments could be more strategic.  
- Expanded adoption of Power Platform is being considered or planned.  

Secondarily, this series of articles is helpful for:

- Organizations that are in the early stages of a Power Platform adoption.  
- Organizations that have had success with adoption and now want to evaluate their current maturity level.  

## Assumptions and scope

This series of articles focuses on the Power Platform technology platform, emphasizing Power Apps, Power Automate, Microsoft Copilot Studio, and Microsoft Dataverse.

For information about Power BI adoption, see the [Power BI adoption roadmap](/power-bi/guidance/powerbi-adoption-roadmap-overview).

## Next steps

Learn about the Power Platform adoption maturity levels in this series of articles. 

The maturity levels are referenced throughout the series.

## Related resources

- [Power Platform adoption guidance](methodology.md)

- Upskilling? See [Power Up](https://powerup.microsoft.com/?referral=learn), [Power Platform in a Day workshops](https://www.microsoft.com/power-platform/instructor-led-training/), and [Microsoft Learn training for Power Platform](/training/powerplatform/).

- Experienced Power Platform partners are available to help your organization succeed with adoption of Power Platform. To engage a Power Platform partner, visit the [Power Apps partner portal](https://powerapps.microsoft.com/partners/).