---
title: "Power Platform adoption maturity model: Detailed capabilities - Microsoft Power Platform | MicrosoftDocs"
description: "This article describes detailed capabilities in the Power Platform adoption maturity model."
author: manuelap-msft

ms.subservice: guidance
ms.topic: conceptual
ms.date: 10/31/2021
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---
# Power Platform adoption maturity model: Detailed capabilities

The goal of the adoption maturity model is to help define a roadmap for Microsoft Power Platform adoption. The roadmap presents a series of strategic and tactical considerations and action items that directly lead to successful Power Platform adoption.

Advancing adoption and cultivating a low-code culture is about more than implementing technology features. Technology can assist an organization in making the greatest impact, but a healthy low-code culture involves many considerations across the spectrum of people, processes, and technology.

The aim of the adoption maturity model is to provide organizations and their partners with a way to think through how they can improve their capabilities and decide which capabilities matter most to them. Each stage describes the states of individual disciplines such as Strategy and Vision, Administration, Governance, and so on. The purpose of the model is to help organizations understand their capabilities along multiple dimensions on a clearly defined scale, decide which level they would like to achieve for each dimension and in what time frame, and improve their capabilities in tangible ways by progressing to the next level.

The following sections present detailed characteristics and capabilities of an organization in each stage.

## Strategy and Vision

| Level | State of Strategy and Vision |
|----------|-----------|
| 100: Initial | <ul><li>Innovation driven by business areas (bottom up)</li><li>Low-complexity scenarios</li><li>Limited reuse</li><li>Undefined strategy</li></ul> |
| 200: Repeatable | <ul><li>Common vision between IT and business</li><li>Demand-management process</li></ul> |
| 300: Defined | <ul><li>Dedicated Power Platform product owner</li><li>Bottom-up and top-down innovation</li><li>Defined understanding of Power Platform’s role in your organization’s IT portfolio</li></ul> |
| 400: Capable | <ul><li>Established [Center of Excellence](coe.md) team</a></li><li>Increased delivery efficiency supports rapidly changing business needs</li><li>Business plans shared across departments</li></ul> |
| 500: Efficient | <ul><li>Power Platform is key part of the digital transformation strategy</li><li>Vision and strategy understood by all</li><li>Organization-wide initiatives deliver larger-scale apps</li><li>Enterprise architecture decisions include Power Platform capabilities</li></ul> |

## Business Value

| Level | State of Business Value |
|----------|-----------|
| 100: Initial | <ul><li>No formal business value assessment</li><li>Undefined targets</li></ul> |
| 200: Repeatable | <ul><li>No formal business value assessment</li><li>Business cases understood but lacking review</li></ul> |
| 300: Defined | <ul><li>Key performance indicators (KPIs) understood, operationalized, reported on, and reviewed against goals</li><li>Ideas with the highest business value are chosen for development</li><li>Business pain points are quantified before project start and compared after finish</li></ul> |
| 400: Capable | <ul><li>Precise quantitative and qualitative measures used to effectively control, predict, and improve business efficiency</li><li>[CoE Starter Kit and Innovation Backlog](../coe/use-innovationbacklog.md) or equivalent tooling for measuring business value adopted</li></ul> |
| 500: Efficient | <ul><li>“Big picture” analytics visualize business value of Power Platform solutions all-up and per business area</li><li>Advanced dashboard and reporting provide decision-making capabilities and measure business value</li><li>Executive visibility of business value and impact of Power Platform solutions</li></ul> |

## Admin and Governance

| Level | State of Admin and Governance |
|----------|-----------|
| 100: Initial | <ul><li>Environments are creatable by all</li><li>No data loss prevention policies (DLP)</li></ul> |
| 200: Repeatable | <ul><li>[Power Platform service admin](../../admin/overview-role-powerapps-admin.md) role assigned to specific administrators</li><li>Default environment covered by [DLP controls](../../admin/wp-data-loss-prevention.md)</a></li><li>Tenant Isolation configured</li><li>[CoE Starter Kit - Core Module](../coe/core-components.md) adopted to gain tenant-wide insights of existing usage</li></ul> |
| 300: Defined | <ul><li>[Defined environment, DLP, and request management strategies](environment-strategy.md)</li><li>[Monitoring of app usage](resource-usage.md) and adoption</li><li>[Monitoring of new connectors](new-connectors.md), to update DLP policies</li><li>[License, capacity, and consumption monitoring](capacity-and-licenses.md) informs decision making</li><li>[Tiered approach to productivity environments](environment-strategy.md) based on maker maturity</li><li>Custom environments are used for specific use cases and ALM scenarios</li></ul> |
| 400: Capable | <ul><li>Overshared, unused, and orphaned resources are identified and appropriate actions are taken</li><li>Reactive governance to automatically gather business and compliance information</li><li>[CoE Starter Kit - Governance Module](../coe/governance-components.md) adopted to gain compliance insights and archive resources</li><li>Telemetry helps identify business-critical apps</li><li>Power Platform Operations team looks after tenant hygiene</li><li>Maker responsibilities are clearly defined and understood and automatically communicated</li></ul> |
| 500: Efficient | <ul><li>Further automation takes place through chatbots embedded in Teams &#8211; through clear risk profiles, tasks are auto-approved or routed through multi-step approval processes (for example, line manager, information security department, environment or tenant admin)</li><li>Practices that worked in their organization are shared externally at Microsoft or  community events</li></ul> |

## Support

| Level | State of Support |
|----------|-----------|
| 100: Initial | <ul><li>Makers support their own apps</li><li>No or limited rules on how processes should be supported by IT and business stakeholders</li></ul> |
| 200: Repeatable | <ul><li>Community support</li><li>Some degree of commitment and governance measures to manage solution lifecycle stages</li></ul>|
| 300: Defined | <ul><li>Support strategy involves Helpdesk</li><li>Defined risk profile dictates the level of support a solution will receive (for example, IT supported, IT blessed, maker supported)</li></ul> |
| 400: Capable | <ul><li>Dedicated support team</li><li>Continuous improvement plans in line with business strategy</li><li>Clearly understood roles and responsibilities</li></ul>|
| 500: Efficient |<ul><li>Automation of support activities (for example, change ownership, bot for FAQ)</li><li>Responsibilities and ownership to build and operate solutions are fully understood</li></ul> |

## Nurture and Citizen Makers

| Level | State of Nurture and Citizen Makers |
|----------|-----------|
| 100: Initial | <ul><li>Some staff may have attended App in a Day events (Partner or Microsoft delivered)</li><li>Team-based initiatives for nurturing makers</li></ul> |
| 200: Repeatable | <ul><li>[On-boarding strategy](onboard-makers.md) for new makers</li><li>Some staff have participated in a [hackathon](hackathons.md)</li><li>Makers become ambassadors across their departments and evangelize the capabilities</li></ul>|
| 300: Defined |<ul><li>Makers provide insights into business pain points</li><li>[Training and upskilling](training-strategy.md) strategy for makers</li><li>Internal [champions](champions.md) community</li><li>[CoE Starter Kit - Nurture Module](../coe/nurture-components.md) adopted</li></ul> |
| 400: Capable |<ul><li>Regular events for champions</li><li>Regular hackathons</li><li>Maker assessments and certificates</li><li>Sharing and celebrating [success stories](show-and-tell.md)</li><li>Show &amp; Tell sessions</li><li>Adoption campaign</li></ul> |
| 500: Efficient |<ul><li>Large internal community with proven value</li><li>Career path for makers</li><li>Community of mentors</li><li>Common development strategy and goals for citizen and pro developers</li></ul> |

## Automation

| Level | State of Automation |
|----------|-----------|
| 100: Initial |<ul><li>Processes are largely manual and one-off</li></ul> |
| 200: Repeatable | <ul><li>Processes are standardized, but implemented manually</li></ul>|
| 300: Defined | <ul><li>Environment and DLP connector policy requests are automated</li><li>Apps are deployed manually, but using solutions</li><li>Communication about processes and compliance between admin and makers is automated</li></ul>|
| 400: Capable | <ul><li>ALM processes are defined and implemented centrally</li><li>Admin tasks to identify overshared, unused, and orphaned resources are largely automated</li><li>Governance tasks to gather compliance and support information are automated</li></ul>|
| 500: Efficient |<ul><li>ALM processes are owned by each Fusion team</li><li>Environment Lifecycle Management is automated</li><li>[CoE Starter Kit – ALM Accelerator](../coe/almaccelerator-components.md) is adopted</li></ul> |

## Fusion Teams

| Level | State of Fusion Teams |
|----------|-----------|
| 100: Initial | <ul><li>Teams work independently</li><li>No pro dev use of Power Platform</li></ul>  |
| 200: Repeatable | <ul><li>Teams review and ratify each other’s work</li><li>Pro devs pilot high-value use cases</li></ul>  |
| 300: Defined | <ul><li>Teams plan work as a team, but operate independently</li><li>Teams manage source control and app lifecycles</li><li>[Standard libraries, custom connectors and components](reusable.md) to be consumed by makers</li></ul> |
| 400: Capable | <ul><li>Cross-functional teams plan and execute work jointly, including makers, testers, and operational teams.</li><li>Collaborative planning for infrastructure and change enablement</li><li>Use of Common Data Model to aid data reuse</li></ul>|
| 500: Efficient |<ul><li>Teams form seamlessly to accommodate cross-functional skills</li><li>Common development strategy and goals for citizen and pro developers needed for new projects</li></ul>  |

> [!NOTE]
> You can [download a printable version](https://go.microsoft.com/fwlink/?linkid=2174946) of the Power Platform adoption maturity model.

## Power Platform adoption

Successful Power Platform adoption involves making effective processes, support, tools, and data available to makers and users.

A common misconception is that adoption relates primarily to usage or the number of users. There's no question that usage statistics are an important factor. However, usage is not the only factor. Adoption is not just about using the technology regularly; it's about using it *effectively*. Effectiveness is much harder to define and measure.

Whenever possible, adoption efforts should be aligned across low-code platforms, and other Power Platform products, such as Power BI.

> [!NOTE]
> Individuals and the organization itself are continually learning, changing, and improving. That means there's no formal end to adoption-related efforts.

## Target audience

The intended audience of the adoption maturity model is interested in one or more of the following outcomes:

- Improving their organization's ability to effectively use Power Platform.
- Increasing their organization's maturity level related to Power Platform delivery.
- Understanding and overcoming adoption-related challenges faced when scaling Power Platform.
- Increasing their organization's return on investment (ROI) in Power Platform.

Primarily, this series of articles will be helpful to those who work in an organization with one or more of the following characteristics:

- Power Platform is deployed with some successes.
- Power Platform has pockets of viral adoption, but is not purposefully governed across the entire organization.
- Power Platform is deployed with some meaningful scale, but there remains a need to determine:
  - What is effective and what should be maintained?
  - What should be improved?
  - How future deployments could be more strategic.
- Expanded adoption of Power Platform is under consideration or is planned.

Secondarily, this series of articles will be helpful for:

- Organizations that are in the early stages of a Power Platform adoption.
- Organizations that have had success with adoption and now want to evaluate their current maturity level.

## Assumptions and scope

The primary focus of this series of articles is on the Power Platform technology platform, with an emphasis on Power Apps, Power Automate, Power Virtual Agents, and Microsoft Dataverse.

For information about Power BI adoption, see the [Power BI adoption roadmap](/power-bi/guidance/powerbi-adoption-roadmap-overview).

## Next steps

In the articles in this series, learn about the Power Platform adoption maturity levels. The maturity levels are referenced throughout the entire series of articles. Also, see the conclusion article for additional adoption-related resources.

Other helpful resources include:

- [Administering a Power Apps enterprise deployment.](../../admin/admin-powerapps-enterprise-deployment.md)
- Upskilling? See [Power Platform in a Day workshops](https://powerplatform.microsoft.com/instructor-led-training/) and [Microsoft Learn training for Power Platform](/training/powerplatform/).
- Experienced Power Platform partners are available to help your organization succeed with adoption of Power Platform. To engage a Power Platform partner, visit the [Power Apps partner portal](https://powerapps.microsoft.com/partners/).
