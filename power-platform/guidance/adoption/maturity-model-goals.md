---
title: 'Adoption maturity model: Goals and opportunities'
description: Discover the five stages of the Power Platform adoption maturity model and explore opportunities to enhance your organization's capabilities.
#customer intent: As a business leader, I want to understand the Power Platform adoption maturity model so that I can align it with my organization's digital transformation strategy.
author: manuelap-msft
ms.subservice: guidance
ms.topic: concept-article
ms.date: 05/14/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/21/2025
---

# Power Platform adoption maturity model: Goals and opportunities

The Microsoft Power Platform adoption maturity model helps organizations and their partners improve their capabilities and prioritize what matters most. Decisions are based on the organization's technology capabilities, digital transformation strategy, and goals.

This article explains the five stages of the model and highlights the opportunities in each stage.

## Level 100 – Initial

*The initial phase describes the starting point for use of a new or undocumented process.*

An *Initial* organization is beginning to explore the capabilities of Power Platform and low-code AI. Individual business areas drive innovation, often in a bottom-up approach. The scenarios addressed are usually not overly complex and solutions are rarely reused. Strategy and vision are undefined, and there's no formal assessment of business value. The organization has no visibility into organization-wide adoption and use. There's no formal governance approach or compliance process for responsible AI.

Apps are typically used by a single team and supported by the makers. Apps mainly use Excel and SharePoint as data sources. The organization sees the potential of investing in Power Platform and low-code AI but lacks a clear path for organization-wide execution.

### Characteristics - Initial

- Innovation driven by business areas
- Low-complexity scenarios
- Limited reuse
- Undefined strategy and vision
- No formal business value assessment
- No formal governance policies or compliance processes in place for responsible AI

### Opportunities - Initial

- Define your [vision, metrics, and goals](vision.md).
- Get an [executive sponsor](executive-sponsorship.md) and teams as you review the [roles and responsibilities](roles.md) needed for your Power Platform adoption.
- Understand and assess your current [security posture](assess-security-posture.md).
- Designate a [Power Platform admin](pp-admin.md).
- [Secure the default environment](secure-default-environment.md).
- Organize [training events](in-a-day.md), [hackathons](hackathons.md), and [lunch and learn sessions](in-a-day.md#lunch-and-learn)
- Find and nurture [champions](champions.md) or recognize early success.
- Establish foundational governance policies and compliance processes tailored to the specific challenges of low-code AI systems. Begin to raise awareness about the ethical and societal implications of AI.

## Level 200 – Repeatable

This phase describes a process well-documented, so you can repeat the same steps if needed.

In the *Repeatable* stage, organizations start to establish a common vision between IT and business units. There's a demand-management process in place, and while business cases are understood, they might lack thorough review. This stage marks the beginning of structured efforts to align Power Platform and low-code AI initiatives with organizational goals. 

A *Repeatable* organization uses what it learned in the Initial stage to structure the deployment of Power Platform and low-code AI. A central IT team or other team focused on Power Platform and low-code AI implements these controls. Early efforts are focused on establishing foundational governance policies and on drafting compliance processes tailored to the specific challenges of low-code AI systems. Senior leadership begins to recognize the value of responsible AI and promotes it through occasional incentives or support for passionate individuals or teams. Some training resources might exist, but they aren't accessible or widely adopted.

Environments are used as needed. For example, various production environments and different data policies might be created without a consistent strategy. These organizations sometimes believe Power Platform is running "out of control" until they implement administrative and governance controls for Power Platform and transition to the [Defined](#level-300--defined) stage.

### Characteristics - Repeatable

- Common vision between IT and business units
- Demand-management process
- Business cases understood but lacking review
- Early efforts to establish Power Platform and low-code AI governance policies and compliance processes

### Opportunities - Repeatable

- Establish a [Center of Excellence](coe.md) team.
- Gain tenant-wide [oversight of resources](resource-usage.md) being created in your tenant.
- [Establish data policies](dlp-strategy.md) in the default environment. Reduce the risk of apps and flows breaking by performing a [Data Policy Impact Analysis](../coe/core-components.md#dlp-impact-analysis) first.
- [Manage the default environment](manage-default-environment.md).
- Embrace new makers with an [onboarding process](onboard-makers.md), informing them of internal training resources and policies.
- Develop responsible AI training programs.
- Integrate responsible AI into strategic discussions and project planning.

## Level 300 – Defined

*This phase describes a process that is defined as a standard business process.*

The *Defined* stage is characterized by a more structured approach to Power Platform and low-code AI adoption. Organizations have a dedicated Power Platform and low-code AI product owner and a clear understanding of the platform's role within the IT portfolio. Innovation is driven both bottom-up and top-down, and key performance indicators (KPIs) are operationalized and reviewed against goals. Responsible AI (RAI) practices are increasingly prioritized, with dedicated budgets and AI champions promoting responsible AI practices. Comprehensive responsible AI policies are in place, covering most aspects of RAI (for example, fairness, transparency). Responsible AI training programs are developed but not yet mandatory.

A *Defined* organization standardizes the repeatable practices that evolved in the Repeatable phase. You can define practices like environment and data policy automation, solutions that move apps and flows between environments, and commonly shared components among makers.

The organization is achieving measurable success with Power Platform to digitally transform and has a defined Power Platform and low-code AI Center of Excellence team.

Much of this transformation may reflect the organic growth of the organization. However, the Center of Excellence team is working to automate those processes and define standard approaches to move the organization to the [Capable](#level-400--capable) stage.

### Characteristics - Defined

- Dedicated Power Platform product owner
- Bottom-up and top-down innovation
- Defined understanding of Power Platform’s role in IT portfolio
- KPIs understood, operationalized, and reviewed
- Comprehensive policies covering most aspects of responsible AI
- Responsible AI training programs developed but not yet mandatory

### Opportunities - Defined

- Define [key roles and responsibilities for your CoE](roles.md), admins, and makers to ensure everyone understands and agrees with them.
- [Measure and communicate business value](business-value.md) of Power Platform solutions.
- [Establish license assignment strategies](license-assignment-strategies.md).
- Develop an [environment strategy](environment-strategy.md) and configure layers of security to support productive development in your organization, while securing and organizing resources.
- Enhance your [security posture](security-posture-management.md) and evaluate managed security features.
- Create a vibrant [Power Platform community](community-goals.md) and define its goals.
- Establish a [training and upskilling strategy](training-strategy.md).
- Celebrate your makers and champions by [sharing their success stories](show-and-tell.md). Focus on the business value and impact they have on the organization.
- Make responsible AI training mandatory for key roles, and establish a dedicated community of practice to share best practices.

## Level 400 – Capable

*This phase describes a process that is quantitatively managed in accordance with agreed-upon metrics.*

At the *Capable* stage, organizations have established a Center of Excellence (CoE) team that drives increased delivery efficiency to support rapidly changing business needs. Business plans are shared across departments, and precise quantitative and qualitative measures are used to control, predict, and improve business efficiency. Responsible AI is fully integrated into leadership decision-making, with resources allocated for governance, training, and compliance. Governance and compliance processes are well-established and automated where appropriate. Responsible AI training is mandatory for key roles, and a dedicated community of practice is established to share best practices.

A *Capable* organization has standard processes for managing and monitoring Power Platform and low-code AI. Makers automate and deeply understand the processes of the Defined stage.

Power Platform and low-code AI capabilities transform the business broadly and support enterprise-critical apps and integrations. Platform champions establish channels for sharing best practices, training new makers, and conducting regular hackathons.

Standard, branded app templates and components are available to all makers. Business value assessments are carried out to measure and understand the impact of Power Platform and low-code AI.

### Characteristics - Capable

- Established CoE team
- Increased delivery efficiency
- Business plans shared across departments
- Precise measures for business efficiency
- Responsible AI is fully integrated into leadership decision-making

### Opportunities – Capable

- Create [reusable components](reusable.md) with common design patterns, such as headers and navigation to ensure consistency across apps.
- Automate the communication between CoE, IT, and admins through approvals and Teams messages.
- Establish a [support strategy](support-strategy.md) for your makers, end users, and solutions.
- [Modernize applications with Power Platform](application-modernization.md).
- Continuously update governance policies and compliance processes.
- Establish feedback loops to refine training based on real-world experiences.
- Incentivize all teams and departments to prioritize responsible AI.

## Level 500 – Efficient

*This phase describes a process that is quantitatively managed in accordance with agreed-upon metrics.*

The *Efficient* stage represents the pinnacle of Power Platform and low-code AI adoption maturity. Power Platform and low-code AI capabilities are a key part of the organization's digital transformation strategy, with vision and strategy understood by all. Organization-wide initiatives deliver larger-scale apps, and enterprise architecture decisions include Power Platform and low-code AI capabilities. Responsible AI is driven at every level of the organization, seen as a strategic priority with regular reviews of responsible AI initiatives, cross-team collaboration, and continuous investment in culture, tooling, and governance. Governance policies and compliance processes are continuously updated, and responsible AI is seamlessly integrated into all operations. Responsible AI training is a continuous process that is highly accessible to all employees.

An *Efficient* organization proves the capabilities of Power Platform and low-code AI to rapidly transform mission-critical capabilities. Standardized automated processes and an established community of experts enable new digitization opportunities to be implemented rapidly. These opportunities allow the organization to recognize value quickly and begin to integrate more advanced capabilities, such as AI.

Fusion teams enable legacy capabilities and modern cloud architecture to be used easily within Power Platform, unlocking broad use of existing data and automation.

In organizations at the Efficient stage, Power Platform and low-code AI capabilities are a key part of the digital transformation strategy and enterprise architecture in the organization. Organizations at this stage have executive sponsorship for Power Platform and influence best practices in the community to drive new uses of Power Platform and low-code AI.

### Characteristics - Efficient

- Power Platform integral to digital transformation strategy
- Vision and strategy understood by all
- Organization-wide initiatives for larger-scale apps
- Enterprise architecture includes Power Platform capabilities
- Responsible AI is a strategic priority at every level of the organization

### Opportunities - Efficient

- [Establish application lifecycle management processes](alm.md). Help makers more easily manage their solutions and deployment.
- Plan [mission critical workloads](plan-mission-critical.md) and [build a disaster recovery plan](plan-disaster-recovery.md).
- [Envision and uncover high-value use cases](solution-envisioning.md).
- [Promote your Power Platform community](community-promote.md) and establish relationships with other teams in your organization.
- [Tell your story](https://aka.ms/powerplatformstories). Influence our best practices and inspire other leaders to go on the same journey.
- Ensure responsible AI training is continuous and accessible to all employees.
- Embed responsible AI deeply into organizational culture with AI champions and subject matter experts who lead initiatives.

## Next steps

Review detailed capabilities across disciplines such as strategy and vision, administration, governance, and community. Learn more in [Detailed capabilities](maturity-model-details.md).
