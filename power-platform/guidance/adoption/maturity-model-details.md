---
title: "Adoption maturity model: Detailed capabilities"
description: Learn how the Power Platform adoption maturity model helps organizations define a roadmap for successful low-code adoption and digital transformation.
#customer intent: As a business leader, I want to understand the Power Platform adoption maturity model so that I can define a roadmap for successful low-code adoption.
author: manuelap-msft
ms.subservice: guidance
ms.topic: concept-article
ms.date: 05/14/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
---

# Power Platform adoption maturity model: Detailed capabilities

The adoption maturity model helps define a roadmap for Microsoft Power Platform adoption. The roadmap includes strategic and tactical considerations and action items that lead to successful Power Platform adoption.

To advance adoption and cultivate a low-code culture, you need to do more than implement technology features. Technology helps organizations make a significant impact, but a healthy low-code culture depends on people, processes, and technology.

The adoption maturity model helps organizations and their partners evaluate and prioritize their capabilities. Each stage describes the states of individual disciplines such as strategy and vision, administration, governance, and so on. The purpose of the model is to help organizations understand their capabilities across the multiple dimensions, decide the level they would like to achieve for each dimension and the timeline, and improve their capabilities in tangible ways by progressing to the next level. The following sections present detailed characteristics and capabilities of an organization at each stage.  

## Strategy and vision

The following table describes strategy and vision across the five levels of the adoption maturity model.

| Level | State of strategy and vision |
|-------|-------------------------------|
| 100: Initial | <ul><li>Innovation driven by business areas (bottom up)</li><li>Low-complexity scenarios</li><li>Limited reuse</li><li>Undefined strategy</li></ul> |
| 200: Repeatable | <ul><li>Defined [vision, metrics, and goals](vision.md) of what the organization wants to achieve with Power Platform</li><li>Common vision between IT and business</li><li>Demand-management process</li></ul> |
| 300: Defined | <ul><li>[Executive sponsor](executive-sponsorship.md) formulates a strategic vision and priorities for Power Platform and low code</li><li>Dedicated Power Platform product owner</li><li>Bottom-up and top-down innovation</li><li>Defined understanding of Power Platform's role in your organization’s IT portfolio</li><li>Defined [roles and responsibilities](roles.md) for key areas like governance and community</li></ul> |
| 400: Capable | <ul><li>Established [Center of Excellence](coe.md) team</a></li><li>Increased delivery efficiency supports rapidly changing business needs</li><li>Business plans shared across departments</li></ul> |
| 500: Efficient | <ul><li>Power Platform is a key part of the digital transformation strategy</li><li>Vision and strategy understood by all</li><li>Organization-wide initiatives deliver larger-scale apps</li><li>Enterprise architecture decisions include Power Platform capabilities</li></ul> |

## Business value

The following table describes business value across the five levels of the adoption maturity model.

| Level | State of business value |
|-------|--------------------------|
| 100: Initial | <ul><li>No formal business value assessment</li><li>Undefined targets</li></ul> |
| 200: Repeatable | <ul><li>No formal business value assessment</li><li>Business cases understood but lacking review</li></ul> |
| 300: Defined | <ul><li>[Key performance indicators (KPIs) are understood](business-value.md), operationalized, reported on, and reviewed against goals</li><li>Ideas with the highest business value are chosen for development</li><li>Business pain points are quantified before project start and compared after finish</li></ul> |
| 400: Capable | <ul><li>Precise quantitative and qualitative measures are used to effectively control, predict, and improve business efficiency</li><li>[Business Value toolkit](business-value-methods.md#business-value-toolkit) or equivalent tooling for measuring business value is adopted</li><li>Reports on business value of Power Platform solutions are shared with key stakeholders</li></ul> |
| 500: Efficient | <ul><li>"Big picture" analytics visualize the business value of Power Platform solutions all-up and per business area</li><li>Advanced dashboards and reporting provide decision-making capabilities and measure business value</li><li>Executives have visibility into the business value and impact of Power Platform solutions</li></ul> |

## Security

The following table describes security across the five levels of the adoption maturity model.

| Level | State of security |
|-------|-------------------------------|
| 100: Initial | <ul><li>Uses basic Microsoft Entra ID for user authentication and access control</li><li>No data policies</li><li>No monitoring of Power Platform activity</li><li>Compliance requirements aren't understood</li></ul> |
| 200: Repeatable | <ul><li>Default environment covered by [data policy controls](dlp-strategy.md)</a></li><li>[Tenant isolation](data-protection.md#cross-tenant-inbound-and-outbound-restrictions) is configured</li><li>Some workload teams understand compliance and regulatory requirements for the solutions they're building and are taking them into consideration during the workload design</li><li>[Sharing limits](conditional-access.md#configure-sharing-limits) are configured</li><li>Security teams are starting to work with Power Platform admins to define a security strategy</li></ul> |
| 300: Defined | <ul><li>[Data policy strategy](dlp-strategy.md) for all environments is established, and a clear process for requesting a new policy or policy changes is defined<li>Uses some advanced Microsoft Entra ID features, such as Conditional Access, for administrative accounts</li><li>Regularly reviews the [Security page](security-posture-management.md#assess-security-score-and-act-on-recommendations) and acts on recommendations</li><li>Secure coding practices and guidelines are established and shared with makers</li><li>Compliance and regulatory requirements are understood, and audits are conducted to ensure Power Platform workloads comply with these requirements</li></ul> |
| 400: Capable | <ul><li>Uses advanced Microsoft Entra ID features, such as Conditional Access, Privileged Identity Management (PIM), and potentially Continuous Access Evaluation (CAE) for granular control over access</li><li>Uses a well-defined environment strategy with clear security group assignments and role-based access control (RBAC) for different workloads</li><li>Customizes Dataverse security roles, implements column-level security, and uses record-level sharing for fine-grained data access control</li><li>Advanced data policy and network security: Employs extended data protection policies with connector action control and endpoint filtering. Implements IP firewall and potentially virtual network support for network isolation.</li><li>Proactive monitoring: Integrates Power Platform logs with Microsoft Sentinel or a similar security information and event management (SIEM) solution for threat detection and incident response</li></ul>|
| 500: Efficient | <ul><li>Comprehensive identity and access management: Implements a mature identity governance framework with automated provisioning/de-provisioning, access reviews, and entitlement management</li><li>Advanced data security: Implements data masking, customer-managed keys (CMK), and potentially Customer Lockbox for enhanced data protection. Uses Microsoft Purview for data classification and labeling.</li><li>Robust network security: Implements a defense-in-depth network security strategy with Azure Firewall, Network Security Groups (NSGs), and Azure Policy</li><li>Advanced threat protection and monitoring: Employs advanced threat protection capabilities like Microsoft Defender for Cloud Apps. Uses AI and automation for threat detection and response in their SOC. Actively participates in the Security Development Lifecycle (SDL) and uses the [Power Platform Well-Architected Framework](/power-platform/well-architected/) for continuous improvement.</li><li>Defined [security incident](security-posture-management.md#incident-preparation-and-response) process is in place</li><li>[Security training](security-posture-management.md#training) is regularly reviewed and part of all Power Platform training</li><li>Comprehensive analysis to identify threats, attacks, vulnerabilities, and countermeasures is part of the design phase of a workload</li></ul> |

## Governance

The following table describes administration and governance across the five levels of the adoption maturity model.

| Level | State of admin and governance |
|-------|-------------------------------|
| 100: Initial | <ul><li>Environments are creatable by all</li><li>No data policies</li><li>No sharing limits are configured, makers can share solutions broadly from any environment</li></ul> |
| 200: Repeatable | <ul><li>[Power Platform service admin](pp-admin.md) role assigned to specific administrators</li><li>Analytics are used to gain tenant-wide insights of existing usage</li></ul> |
| 300: Defined | <ul><li>[Defined environment, data policy, and request management strategies](environment-strategy.md)</li><li>[Monitoring of app usage](resource-usage.md) and adoption</li><li>[License, capacity, and consumption monitoring](cds-usage.md) informs decision making</li><li>[Tiered approach to productivity environments](environment-strategy.md) based on maker maturity</li><li>A governance framework that defines guidelines and rules that govern the platform is used and shared with makers</li><li>Recommendations from Power Advisor are regularly reviewed and implemented</li></ul> |
| 400: Capable | <ul><li>Overshared, unused, and orphaned resources are identified and appropriate actions are taken</li><li>Reactive governance automatically gathers business and compliance information</li><li>Telemetry helps identify business-critical apps</li><li>Power Platform Operations team ensures tenant hygiene</li><li>Maker responsibilities are clearly defined, understood, and automatically communicated</li><li>Power Advisor recommendations are automated and tasks are routed through approvals</li><li>Environment groups manage adoption at scale</li></ul> |
| 500: Efficient | <ul><li>Further automation takes place through agents embedded in Teams. Tasks are autoapproved or routed through multi-step approval processes based on clear risk profiles (for example, line manager, information security department, environment, or tenant admin)</li><li>Successful practices are shared externally at Microsoft or during community events</li></ul> |

## Support

The following table describes support across the five levels of the adoption maturity model.

| Level | State of support |
|-------|-------------------|
| 100: Initial | <ul><li>Makers support their own apps</li><li>No or limited rules on how processes are supported by IT and business stakeholders</li><li>No application lifecycle management process</li></ul> |
| 200: Repeatable | <ul><li>Community support</li><li>Some degree of commitment and governance measures to manage solution lifecycle stages</li><li>Solutions are manually deployed to production environments with limited manual testing</ul>|
| 300: Defined | <ul><li>Custom environments are used for specific use cases and application lifecycle management (ALM) scenarios</li><li>Pipelines automate solution deployment</li><li>Support strategy involves the Helpdesk</li><li>Defined risk profile dictates the level of support a solution receives (for example, IT supported, IT blessed, maker supported)</li></ul> |
| 400: Capable | <ul><li>Dedicated support team</li><li>Continuous improvement plans align with the business strategy</li><li>Clearly understood roles and responsibilities</li><li>Deployment stages and approvals are clearly defined</li></ul>|
| 500: Efficient |<ul><li>Automation of support activities (for example, change ownership, agent for FAQ)</li><li>Responsibilities and ownership to build and operate solutions are fully understood</li></ul> |

## Community

The following table describes community across the five levels of the adoption maturity model.

| Level | State of nurture and citizen makers |
|-------|-------------------------------------|
| 100: Initial | <ul><li>Some staff might have attended App in a Day events (partner or Microsoft delivered)</li><li>Team-based initiatives for nurturing makers</li></ul> |
| 200: Repeatable | <ul><li>[On-boarding strategy](onboard-makers.md) for new makers</li><li>Some staff participated in a [hackathon](hackathons.md)</li><li>Makers become ambassadors across their departments and evangelize the capabilities</li></ul>|
| 300: Defined |<ul><li>Makers provide insights into business pain points</li><li>[Training and upskilling](training-strategy.md) strategy for makers</li><li>Internal [champions](champions.md) community</li><li>[CoE Starter Kit - Nurture Module](../coe/nurture-components.md) adopted</li></ul> |
| 400: Capable |<ul><li>Regular events for champions</li><li>Regular hackathons</li><li>Maker assessments and certificates</li><li>Sharing and celebrating [success stories](show-and-tell.md)</li><li>Show &amp; Tell sessions</li><li>Adoption campaign</li></ul> |
| 500: Efficient |<ul><li>Large internal community with proven value</li><li>Career path for makers</li><li>Community of mentors</li><li>Common development strategy and goals for citizen and pro developers</li></ul> |

## Responsible AI

The following table describes responsible AI across the five levels of the adoption maturity model.

| Level | State of responsible AI |
|-------|-------------------------------------|
| 100: Initial | <ul><li>Leadership recognizes responsible AI (RAI) as important but has yet to integrate it fully into decision-making processes or embed it into organizational culture</li><li>Little or no formal governance policies or compliance processes in place for responsible AI</li><li>Little or no structured training available for responsible AI, and awareness is low</li><li>AI projects proceed without oversight</li><li>Lack of awareness about what constitutes RAI risks</li><li>No formal processes for managing or governing data used in AI systems</li></ul> |
| 200: Repeatable | <ul><li>Senior leadership begins to recognize the value of responsible AI and promotes it through occasional incentives or support for passionate individuals or teams</li><li>Early efforts are focused on establishing foundational governance policies and drafting compliance processes tailored to the specific challenges of low-code AI systems</li><li>Some training resources might exist, but they aren't accessible or widely adopted</li><li>Some projects begin to integrate responsible AI reviews, typically towards the end of the project lifecycle</li><li>RAI risks are raised in an ad-hoc manner without conducting specific investigations</li><li>Data sources used in custom models are documented, but there's no formal auditing process</li></ul>|
| 300: Defined |<ul><li>Leadership increasingly prioritizes responsible AI, allocating resources such as dedicated budgets and AI champions to promote responsible AI practices</li><li>A comprehensive responsible AI policy is in place, covering most aspects of RAI (for example, fairness, transparency)</li><li>Responsible AI training programs are developed but aren't yet mandatory</li><li>RAI reviews are integrated into the project lifecycle at key stages</li><li>Impact assessments start to be conducted and involve relevant stakeholders to identify risks relating to RAI</li><li>Data governance practices are formalized, with regular data quality assessments and sensitivity classifications for all unstructured data used in AI</li></ul> |
| 400: Capable |<ul><li>Responsible AI is fully integrated into leadership decision-making. Resources are allocated for governance, training, and compliance.</li><li>Governance and compliance processes are well-established and automated where appropriate</li><li>Responsible AI training is mandatory for key roles</li><li>Projects are reviewed for responsible AI risks at regular intervals, and some teams begin to allocate specific resources for responsible AI oversight</li><li>RAI risks are managed with a recognized risk management framework (for example, NIST AI risk management framework)</li><li>Automated frameworks are in place for managing unstructured data quality and sensitivity, with ongoing monitoring of compliance requirements</li></ul> |
| 500: Efficient |<ul><li>Leadership drives responsible AI at every level of the organization. It's seen as a strategic priority, with regular reviews of responsible AI initiatives, cross-team collaboration, and continuous investment in culture, tooling, and governance.</li><li>Governance policies and compliance processes are continuously updated, and responsible AI is seamlessly integrated into all operations</li><li>Responsible AI training is a continuous process that is accessible to all employees</li><li>Responsible AI is fully embedded in the project management lifecycle</li><li>Findings from compliance incidents are incorporated into planning</li><li>Data management is fully integrated into the AI lifecycle with real-time monitoring</li></ul> |

## Automation

The following table describes automation across the five levels of the adoption maturity model.

| Level | State of automation |
|-------|----------------------|
| 100: Initial |<ul><li>Processes are largely manual and one-off</li></ul> |
| 200: Repeatable | <ul><li>Processes are standardized, but implemented manually</li></ul>|
| 300: Defined | <ul><li>Environment and DLP connector policy requests are automated</li><li>Apps are deployed manually, but using solutions</li><li>Communication about processes and compliance between admin and makers is automated</li></ul>|
| 400: Capable | <ul><li>ALM processes are defined and implemented centrally</li><li>Admin tasks to identify overshared, unused, and orphaned resources are largely automated</li><li>Governance tasks to gather compliance and support information are automated</li></ul>|
| 500: Efficient |<ul><li>ALM processes are owned by each fusion team</li><li>Environment lifecycle management is automated</li></ul> |

## Fusion teams

The following table describes characteristics of fusion teams across the five levels of the adoption maturity model.

| Level | State of fusion teams |
|-------|------------------------|
| 100: Initial | <ul><li>Teams work independently</li><li>No pro dev use of Power Platform</li></ul>  |
| 200: Repeatable | <ul><li>Teams review and ratify each other’s work</li><li>Pro devs pilot high-value use cases</li></ul>  |
| 300: Defined | <ul><li>Teams plan work as a team, but operate independently</li><li>Teams manage source control and app lifecycles</li><li>[Standard libraries, custom connectors, and components](reusable.md) are made available centrally and used by makers</li></ul> |
| 400: Capable | <ul><li>Cross-functional teams plan and execute work jointly, including makers, testers, and operational teams</li><li>Collaborative planning for infrastructure and change enablement</li><li>Use of Common Data Model to aid data reuse</li></ul>|
| 500: Efficient |<ul><li>Teams form seamlessly to accommodate cross-functional skills</li><li>Common development strategy and goals for citizen and pro developers are required for new projects</li></ul>  |

## Power Platform adoption

Successful Power Platform adoption involves making effective processes, support, tools, and data available to makers and users.

A common misconception is that adoption relates primarily to usage or the number of users. While usage statistics are important, adoption isn't just about regular use&mdash;it's about using the technology *effectively*. Effectiveness is harder to define and measure.

Whenever possible, align adoption efforts across low-code platforms and other Power Platform products, such as Power BI.

> [!NOTE]  
> Individuals and the organization itself are continually learning, changing, and improving. There's no formal end to adoption efforts.  

## Target audience

The intended audience of the adoption maturity model is interested in one or more of the following outcomes:

- Improving their organization's ability to effectively use Power Platform.  
- Increasing their organization's maturity level related to Power Platform delivery.  
- Understanding and overcoming challenges related to adoption when scaling Power Platform.  
- Increasing their organization's return on investment (ROI) in Power Platform.  

Primarily, this series of articles is helpful to those who work in an organization with one or more of the following characteristics:

- Power Platform is deployed with some successes.  
- Power Platform has pockets of viral adoption, but isn't purposefully governed across the entire organization.  
- Power Platform is deployed at a meaningful scale, but it's important to determine:  
    - What is effective and should be maintained
    - What needs improvement
    - How to make future deployments more strategic 
- Expanded adoption of Power Platform is under consideration or is planned.  

This series of articles is also helpful for:

- Organizations that are in the early stages of a Power Platform adoption.  
- Organizations that have had success with adoption and now want to evaluate their current maturity level.  

## Assumptions and scope

This series of articles focuses on the Power Platform technology platform, with the emphasis on Power Apps, Power Automate, Microsoft Copilot Studio, and Microsoft Dataverse.

For information about Power BI adoption, consult the [Power BI adoption roadmap](/power-bi/guidance/powerbi-adoption-roadmap-overview).

## Next steps

Learn about the Power Platform adoption maturity levels in this series of articles. The maturity levels are referenced throughout the series. 

Other helpful resources include:

- [Power Platform adoption guidance](methodology.md)
- Upskilling? See [Power Up](https://powerup.microsoft.com/?referral=learn), [Power Platform in a Day workshops](https://www.microsoft.com/power-platform/instructor-led-training/), and [Microsoft Learn training for Power Platform](/training/powerplatform/).
- Experienced Power Platform partners are available to help your organization succeed with adoption of Power Platform. To engage a Power Platform partner, visit the [Power Apps partner portal](https://powerapps.microsoft.com/partners/).