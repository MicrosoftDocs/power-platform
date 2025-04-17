---
title:Power Platform adoption maturity model - Detailed capabilities
description: Learn how the Power Platform adoption maturity model helps organizations define a roadmap for successful low-code adoption and digital transformation.
#customer intent: As a Power Platform user, I want to understand the Power Platform adoption maturity model so that I can define a roadmap for successful low-code adoption.
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

The following table describes different state of Strategy and Vision for different levels.

| Level | State of Strategy and Vision |
|----------|-----------|
| 100: Initial | <ul><li>Innovation driven by business areas (bottom up)</li><li>Low-complexity scenarios</li><li>Limited reuse</li><li>Undefined strategy</li></ul> |
| 200: Repeatable | <ul><li>Defined [vision, metrics, and goals](vision.md) of what the organization wants to achieve with Power Platform</li><li>Common vision between IT and business</li><li>Demand-management process</li></ul> |
| 300: Defined | <ul><li>[Executive sponsor](executive-sponsorship.md) formulates a strategic vision and priorities for Power Platform and low code</li><li>Dedicated Power Platform product owner</li><li>Bottom-up and top-down innovation</li><li>Defined understanding of Power Platform’s role in your organization’s IT portfolio</li><li>Defined [roles and responsibilities](roles.md) for key areas like governance and community</li></ul> |
| 400: Capable | <ul><li>Established [Center of Excellence](coe.md) team</a></li><li>Increased delivery efficiency supports rapidly changing business needs</li><li>Business plans shared across departments</li></ul> |
| 500: Efficient | <ul><li>Power Platform is a key part of the digital transformation strategy</li><li>Vision and strategy are understood by all</li><li>Organization-wide initiatives deliver larger-scale apps</li><li>Enterprise architecture decisions include Power Platform capabilities</li></ul> |

## Business value

The following table describes different state of Business Value for different levels.

| Level | State of Business Value |
|----------|-----------|
| 100: Initial | <ul><li>No formal business value assessment</li><li>Undefined targets</li></ul> |
| 200: Repeatable | <ul><li>No formal business value assessment</li><li>Business cases are understood but lacking review</li></ul> |
| 300: Defined | <ul><li>[Key performance indicators (KPIs) are understood](business-value.md), operationalized, reported on, and reviewed against goals</li><li>Ideas with the highest business value are chosen for development</li><li>Business pain points are quantified before the project starts and compared after it finishes.</li></ul> |
| 400: Capable | <ul><li>Precise quantitative and qualitative measures are used to effectively control, predict, and improve business efficiency</li><li>[Business Value toolkit](business-value-methods.md#business-value-toolkit) or equivalent tooling for measuring business value are adopted</li><li>Reports on business value of Power Platform solutions are shared with key stakeholders</li></ul> |
| 500: Efficient | <ul><li>“Big picture” analytics visualize the business value of Power Platform solutions all-up and per business area.</li><li>Advanced dashboards and reporting provide decision-making capabilities and measure business value.</li><li>Executives have visibility into the business value and impact of Power Platform solutions.</li></ul> |

## Security

The following table describes different state of Admin and Governance for different levels.

| Level | State of Admin and Governance |
|----------|-----------|
| 100: Initial | <ul><li>Uses basic Microsoft Entra ID for user authentication and access control.</li><li>No data loss prevention policies (DLP)</li><li>No monitoring of Power Platform activity</li><li>Compliance requirements aren't understood</li></ul> |
| 200: Repeatable | <ul><li>Default environment is covered by [DLP controls](dlp-strategy.md)</a></li><li>[Tenant isolation](data-protection.md#cross-tenant-inbound-and-outbound-restrictions) is configured</li><li>Some workload teams understand compliance and regulatory requirements for the solutions they build and consider them during workload design.</li><li>[Sharing limits](conditional-access.md#configure-sharing-limits) are configured.</li><li>Security teams are starting to work with Power Platform admins to define a security strategy</li></ul> |
| 300: Defined | <ul><li>[DLP strategy](dlp-strategy.md) for all environments is established, and a clear process for requesting a new policy or policy changes is defined.<li>Uses some advanced Microsoft Entra ID features, such as Conditional Access, for administrative accounts</li><li>Regularly reviews the [Security page](security-posture-management.md#assess-security-score-and-act-on-recommendations) and acts on recommendations.</li><li>Secure coding practices and guidelines are established and shared with makers.</li><li>Compliance and regulatory requirements are understood and audits are conducted to ensure Power Platform workload comply with these requirements.</li></ul> |
| 400: Capable | <ul><li>Uses advanced Microsoft Entra ID features, such as Conditional Access, Privileged Identity Management (PIM), and potentially Continuous Access Evaluation (CAE) for granular control over access</li><li>Uses a well-defined environment strategy with clear security group assignments and role-based access control (RBAC) for different workloads</li><li>Customizes Dataverse security roles, implements column-level security, and uses record-level sharing for fine-grained data access control</li><li>Advanced DLP and Network Security. Employs extended DLP with connector action control and endpoint filtering. Implements IP firewall and potentially uses virtual network support for network isolation</li><li>Proactive monitoring. Integrates Power Platform logs with Microsoft Sentinel or a similar security information and event management (SIEM) solution for threat detection and incident response</li></ul>|
| 500: Efficient | <ul><li>Comprehensive Identity and Access management. Implements a mature identity governance framework with automated provisioning/de-provisioning, access reviews, and entitlement management</li><li>Advanced Data Security: Implements data masking, customer-managed keys (CMK), and potentially Customer Lockbox for enhanced data protection. Uses Microsoft Purview for data classification and labeling</li><li>Robust Network Security. Implements a defense-in-depth network security strategy with Azure Firewall, Network Security Groups (NSGs), and Azure Policy</li><li>Advanced threat protection and monitoring. Employs advanced threat protection capabilities like Microsoft Defender for Cloud Apps. Uses AI and automation for threat detection and response in their SOC. Actively participates in the Security Development Lifecycle (SDL) and uses the [Power Platform Well-Architected Framework](/power-platform/well-architected/) for continuous improvement</li><li>A defined [security incident](security-posture-management.md#incident-preparation-and-response) process is in place</li><li>[Security training](security-posture-management.md#training) is regularly reviewed and part of all Power Platform training</li><li>Comprehensive analysis to identify threats, attacks, vulnerabilities, and countermeasures is part of the design phase of a workload</li></ul> |

## Governance

The following table describes different state of Admin and Governance for different levels. 

| Level | State of Admin and Governance |
|----------|-----------|
| 100: Initial | <ul><li>All users can create environments.</li><li>Data loss prevention (DLP) policies aren't configured.</li><li>Sharing limits aren't set, so makers can share solutions broadly from any environment.</li></ul> |
| 200: Repeatable | <ul><li>[Power Platform service admin](pp-admin.md) role assigned to specific administrators</li><li>Analytics are used to gain tenant-wide insights of existing usage</li></ul> |
| 300: Defined | <ul><li>[Defined environment, DLP, and request management strategies](environment-strategy.md) are implemented.</li><li>[App usage](resource-usage.md) and adoption are monitored.</li><li>[License, capacity, and consumption monitoring](cds-usage.md) informs decision-making.</li><li>A [tiered approach to productivity environments](environment-strategy.md) is used based on maker maturity.</li><li>A governance framework defines and shares guidelines and rules with makers.</li><li>Recommendations from Power Advisor are regularly reviewed and implemented.</li></ul> |
| 400: Capable | <ul><li>Overshared, unused, and orphaned resources are identified, and appropriate actions are taken.</li><li>Reactive governance automatically gathers business and compliance information.</li><li>Telemetry identifies business-critical apps.</li><li>The Power Platform Operations team ensures tenant hygiene.</li><li>Maker responsibilities are clearly defined, understood, and automatically communicated.</li><li>Power Advisor recommendations are automated, and tasks are routed through approvals.</li><li>Environment groups manage adoption at scale.</li></ul> |
| 500: Efficient | <ul><li>Further automation occurs through agents embedded in Teams. Tasks are autoapproved or routed through multi-step approval processes based on clear risk profiles (for example, line manager, information security department, environment, or tenant admin).</li><li>Organizations share successful practices externally at Microsoft or community events.</li></ul> |

## Operations

The following table describes different state of Support for different levels.

| Level | State of Support |
|----------|-----------|
| 100: Initial | <ul><li>Makers support their own apps.</li><li>No or limited rules define how processes are supported by IT and business stakeholders.</li><li>No application lifecycle management process exists.</li></ul> |
| 200: Repeatable | <ul><li>Community support.</li><li>Some degree of commitment and governance measures manage solution lifecycle stages.</li><li>Solutions are manually deployed to production environments with limited manual testing.</li></ul>|
| 300: Defined | <ul><li>Custom environments are used for specific use cases and application lifecycle management (ALM) scenarios.</li><li>Pipelines automate solution deployment.</li><li>The support strategy involves the helpdesk.</li><li>A defined risk profile dictates the level of support a solution receives (for example, IT-supported, IT-blessed, maker-supported).</li></ul> |
| 400: Capable | <ul><li>A dedicated support team exists.</li><li>Continuous improvement plans align with the business strategy.</li><li>Roles and responsibilities are clearly understood.</li><li>Deployment stages and approvals are clearly defined.</li></ul>|
| 500: Efficient |<ul><li>Automation of support activities (for example, change ownership, agent for FAQ)</li><li>Responsibilities and ownership to build and operate solutions are fully understood</li></ul> |

## Community

The following table describes different state of Nurture and Citizen Makers for different levels.

| Level | State of Nurture and Citizen Makers |
|----------|-----------|
| 100: Initial | <ul><li>Some staff might attend App in a Day events (partner or Microsoft delivered).</li><li>Team-based initiatives for nurturing makers.</li></ul> |
| 200: Repeatable | <ul><li>[On-boarding strategy](onboard-makers.md) for new makers</li><li>Some staff participated in a [hackathon](hackathons.md)</li><li>Makers become ambassadors across their departments and evangelize the capabilities</li></ul>|
| 300: Defined |<ul><li>Makers provide insights into business pain points</li><li>[Training and upskilling](training-strategy.md) strategy for makers</li><li>Internal [champions](champions.md) community</li><li>[CoE Starter Kit - Nurture Module](../coe/nurture-components.md) adopted</li></ul> |
| 400: Capable |<ul><li>Regular events for champions.</li><li>Regular hackathons.</li><li>Maker assessments and certificates.</li><li>Sharing and celebrating [success stories](show-and-tell.md).</li><li>Show &amp; Tell sessions.</li><li>Adoption campaign.</li></ul> |
| 500: Efficient |<ul><li>Large internal community with proven value.</li><li>Career path for makers.</li><li>Community of mentors.</li><li>Common development strategy and goals for citizen and pro developers.</li></ul> |

## Responsible AI

The following table describes different state of Nurture and Citizen Makers for different levels.

| Level | State of Nurture and Citizen Makers |
|----------|-----------|
| 100: Initial | <ul><li><li>Leadership recognizes responsible AI (RAI) as important but hasn't integrated it fully into decision-making processes or embedded it into organizational culture.</li><li>There are little or no formal governance policies or compliance processes in place for responsible AI.</li><li>There's little or no structured training available for responsible AI, and awareness is low.</li><li>AI projects proceed without oversight.</li><li>There's a lack of awareness about what constitutes RAI risks.</li><li>There are no formal processes for managing or governing data used in AI systems.</li> |
| 200: Repeatable | <ul><li>Senior leadership begins to recognize the value of responsible AI and promotes it through occasional incentives or support for passionate individuals or teams</li><li>Early efforts are focused on establishing foundational governance policies and drafting compliance processes tailored to the specific challenges of low-code AI systems</li><li>Some training resources might exist, but they aren't accessible or widely adopted</li><li>Some projects begin to integrate responsible AI reviews, typically towards the end of the project lifecycle</li><li>RAI risks are raised in an ad-hoc manner without conducting specific investigations</li><li>Data sources used in custom models are documented, but there's no formal auditing process</li></ul>|
| 300: Defined |<ul><li>Leadership increasingly prioritizes responsible AI, allocating resources such as dedicated budgets and AI champions to promote responsible AI practices</li><li>A comprehensive responsible AI policy is in place, covering most aspects of RAI (for example, fairness, transparency)</li><li>Responsible AI training programs are developed but aren't yet mandatory</li><li>RAI reviews integrated into project lifecycle at key stages</li><li>Impact assessments start to be conducted, involving relevant stakeholders to identify risks relating to RAI</li><li>Data governance practices are formalized, with regular data quality assessments and sensitivity classifications for all unstructured data used in AI</li></ul> |
| 400: Capable |<ul><li>Responsible AI is fully integrated into leadership decision-making. Resources are allocated for governance, training, and compliance</li><li>Governance and compliance processes are well-established and automated where appropriate</li><li>Responsible AI training is mandatory for key roles</li><li>Projects are reviewed for responsible AI risks at regular intervals and some teams begin to allocate specific resources for responsible AI oversight</li><li>RAI risks are managed with a recognized risk management framework (for example, NIST AI risk management framework)</li><li>Automated frameworks are in place for managing unstructured data quality and sensitivity, with ongoing monitoring of compliance requirements</li></ul> |
| 500: Efficient |<ul><li>Leadership drives responsible AI at every level of the organization. It's seen as a strategic priority, with regular reviews of responsible AI initiatives, cross-team collaboration, and continuous investment in culture, tooling, and governance</li><li>Governance policies and compliance processes are continuously updated, and responsible AI is seamlessly integrated into all operations</li><li>Responsible AI training is a continuous process that is highly accessible to all employees</li><li>Responsible AI is fully embedded in project management lifecycle</li><li>Findings from compliance incidents are incorporated into planning</li><li>Data management is fully integrated into the AI lifecycle with real-time monitoring</li></ul> |

## Automation

The following table describes different state of Automation for different levels.

| Level | State of Automation |
|----------|-----------|
| 100: Initial |<ul><li>Processes are largely manual and one-off</li></ul> |
| 200: Repeatable | <ul><li>Processes are standardized, but implemented manually</li></ul>|
| 300: Defined | <ul><li>Environment and DLP connector policy requests are automated.</li><li>Apps are deployed manually, but using solutions.</li><li>Communication about processes and compliance between admins and makers is automated.</li></ul>|
| 400: Capable | <ul><li>ALM processes are defined and implemented centrally</li><li>Admin tasks to identify overshared, unused, and orphaned resources are largely automated</li><li>Governance tasks to gather compliance and support information are automated</li></ul>|
| 500: Efficient |<ul><li>ALM processes are owned by each Fusion team</li><li>Environment Lifecycle Management is automated</li></ul> |

## Fusion Teams

The following table describes different state of Fusion Teams for different levels.

| Level | State of Fusion Teams |
|----------|-----------|
| 100: Initial | <ul><li>Teams work independently</li><li>No pro dev use of Power Platform</li></ul>  |
| 200: Repeatable | <ul><li>Teams review and ratify each other’s work</li><li>Pro devs pilot high-value use cases</li></ul>  |
| 300: Defined | <ul><li>Teams plan work as a team, but operate independently.</li><li>Teams manage source control and app lifecycles.</li><li>[Standard libraries, custom connectors, and components](reusable.md) are made available centrally and used by makers.</li></ul> |
| 400: Capable | <ul><li>Cross-functional teams plan and execute work jointly, including makers, testers, and operational teams.</li><li>Collaborative planning for infrastructure and change enablement.</li><li>Use of Common Data Model to aid data reuse.</li></ul>|
| 500: Efficient |<ul><li>Teams form seamlessly to accommodate cross-functional skills.</li><li>Common development strategy and goals for citizen and pro developers needed for new projects.</li></ul>  |

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

Learn about the Power Platform adoption maturity levels in this series of articles. The maturity levels are referenced throughout the series. 

## Related resources

- [Power Platform adoption guidance](methodology.md)
- Upskilling? See [Power Up](https://powerup.microsoft.com/?referral=learn), [Power Platform in a Day workshops](https://www.microsoft.com/power-platform/instructor-led-training/) and [Microsoft Learn training for Power Platform](/training/powerplatform/).
- Experienced Power Platform partners are available to help your organization succeed with adoption of Power Platform. To engage a Power Platform partner, visit the [Power Apps partner portal](https://powerapps.microsoft.com/partners/).
