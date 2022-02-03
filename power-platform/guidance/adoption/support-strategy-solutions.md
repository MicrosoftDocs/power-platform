---
title: "End-user support strategy - Microsoft Power Platform | MicrosoftDocs"
description: "Guidance on establishing a support and graduation framework, decision matrix and user support process for ongoing solution support of Microsoft Power Platform solutions."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/01/2022
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# End-user support: Ongoing production solution support

The following section covers formal and informal ways of supporting end-users using solutions that have been built with Microsoft Power Platform, such as apps, flows and chatbots.

This diagram shows a common support and graduation framework that organizations employ successfully:

The six types of support shown in the above diagram include:

![Types of ongoing solution support.](media/support1.png "Types of ongoing solution support")

| **Type** | **Description** |
| --- | --- |
| ![Type 1.](media/support-1.png "Type 1") | **Maker support (internal)** occurs when a maker supports their own solution. End users of the solution know to reach out to the maker for support, and there is often no visibility to IT or the team on the level or type of support the maker provides. |
| ![Type 2.](media/support-2.png "Type 2") | **Team-assisted support (internal)** occurs when team members learn from each other as they develop Power Platform solutions. Team members become co-owners of their team's apps, flows and chatbots, and are able to support end user queries and can make small bug fixes and changes. Whilst this sometimes happens informally, it’s a good idea to formalize this process as your adoption and growth matures.  |
| ![Type 3.](media/support-3.png  "Type 3") | **Help desk support (internal)** handles formal support issues and requests. They may help with non-solution related questions, such as how to access an app on a mobile device or how to request access to a backend datasource. They will redirect solution related questions to the channel supporting the solution. |
| ![Type 4.](media/support-4.png  "Type 4") | **Dedicated Power Platform support (internal)** involves handling complex issues escalated by the help desk. Critical applications are handed over to this team, and they are able to deploy bug fixes.  |
| ![Type 5.](media/support-5.png "Type 5") | **Partner support (external)** can complement your internal support offering, and either support critical applications or work with specific departments on supporting their apps. Learn more: [Get expert help from Power Apps partners](https://powerapps.microsoft.com/partners/). |
| ![Type 6.](media/support-6.png  "Type 6") | **Microsoft support (external)** can be used to raise platform-related technical issues. Based on your support plan, different technical support and advisory services are available to you. Learn more: [Support for Microsoft Power Platform](/power-platform/admin/support-overview) |

Depending on the size of your organization and existing delivery approaches for low code and pro code technologies, you might choose different ways of formalizing your support.
If your Power Platform adoption approach is largely [decentralized](delivery-models.md#decentralized), you will have autonomous teams across the organization delivering and governing Power Platform solutions. With this model, support may also be delegated, and team-assisted support may be the most relevant service for end users and makers.

If your Power Platform adoption approach is largely [centralized](delivery-models.md#centralized), you will have central teams of product owners who own the low-code delivery of departmental solutions from around the organization's business units. With this model, support will also be centralized and a central support team answers queries and questions.

In most organizations, a mix of delivery models is best – even if decentralized teams support solutions for their makers, a help desk and central support team may still be required for technical issues, end user queries and first-tier support.

## Define tiers of applications

As you define your support process and escalation path, it is important to categorize solutions built based on criticality – this will allow you to come up with processes that ensure that critical applications have the necessary guardrails around them to support them whilst at the same time not stifling innovation of productivity scenarios.

| **Characteristics and Processes** | **Productivity** | **Important** | **Critical** |
| --- | --- |--- |--- |
| **Use Case** | Individual productivity and small team use cases that may use existing data.| Simple business applications or team initiatives. Small standalone collaborative processes that. | Complex business applications, enterprise-wide initiatives or mission-critical workloads that would result in significant business impact during downtime. |
| **Complexity** | Simple processes | Medium complexity | High complexity |
| **User Base** | Small user base – individual users, direct colleagues or small team | Scoped to business unit | Large user base or enterprise-wide usage |
| **Development Lifecycle** | High level of iteration | Typically less than three months to develop | Longer development cycle |
| **Impact** | Low business impact | Important but not business critical (medium impact) | High business impact |
| **ALM** |  No ALM Required. | ALM required – and may be achieved via manual solution import/export. | Robust ALM process required - ALM is achieved using Azure DevOps or GitHub pipelines. |
| **Environment strategy** | Solution is built in the default or a shared productivity environment. | Dedicated development environment, and shared test and prod environments (shared with other solutions, for example business unit specific). Environments are managed by the business unit (decentralized) or by Central IT (centralized) | Dedicated Dev/Test/Prod environments. Environments are managed by Central IT. |
| **Maker permissions** | Maker has the Environment Maker security role in the environments. | Maker has the Environment Maker or System customizer security role in the development environment, but only the end user security role in test and production environments. Solutions may be owned by a service account or Environment Admin in test and production. | Maker has the Environment Maker or System customizer security role in the development environment, but only the end user security role in test and production environments. Solution deployment happens automatically and solutions are owned by a service principal in test and production. |
| **IT involvement** | Reactive governance – IT has visibility of solutions being built and monitors usage. | IT blessing at solution or user level. Maker provides solution details, such as potential workarounds, data sources used etc. | Production environment is managed by IT. |
| **Support model** | Self-supported | Team-assisted supported | Formal support |

As you define your support models, also think about a graduation path – a solution may start off only requiring productivity-level support but grow in functionality or user base to require important-level support. Define how makers can request more formal support and transition a solution to supported environments.

Each of the types of internal user support introduced above are described in further detail in this article.

## Maker support

Maker support refers to when the maker supports their own apps and flows built for themselves, their team or colleagues. This means answering queries from end users, fixing bugs and making change requests. This is an informal way of support; often end users know who the maker is and will reach out directly to them.

>[!IMPORTANT]
>As part of onboarding new makers, make sure makers are aware of support, graduation and escalation paths – makers who are overwhelmed with the support of their business-important solutions will no longer be able to innovate and create new solutions. Clearly define how makers can graduate their solutions to the next level of support, and what that looks like.

Additional to this proactive way of communicating processes to makers, also make sure you have reactive governance in place to identify highly shared and highly used solutions that may be important to your business and reach out to makers to make sure those solutions have the necessary support guardrails around them. Use [tenant-level analytics](/admin/tenant-level-analytics) to find out more about your applications usage, [export your telemetry to your own data storage account](/admin/self-service-analytics) to build your own enhanced reporting or use the [CoE Starter Kit](https://aka.ms/coestarterkit) as a starting point.

## Team-assisted support

Team-assisted support refers to when team members take on co-ownership of apps and flows built for their team/used by their team and help support the solutions during their daily work. This means answering queries from end users, fixing bugs, and making change requests. Makers who emerge as [your champions](champions.md) tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help.

Whilst this often starts off as an informal process, many organizations formalize team-assisted support to scale their Power Platform efforts. This involves business units owning their dedicated environments, taking on the Environment Admin role and supporting solutions in those environments. In larger organizations, dedicated Power Platform teams per business unit take on this role.

## Help desk support

The help desk is usually operated as a shared service by the IT department.

The help desk can:

- Support technical issues that can not be resolved without IT involvement, for example Power Platform service issues that require an admin to [raise a support ticket](/admin/get-help-support#view-solutions-or-enter-a-support-request-through-the-new-support-center) in [Power Platform admin center](https://aka.ms/ppac).
- Answering end user and governance related questions, such as how to request access to applications, where to find applications.
- Routing issues with critical apps to the correct support team.

## Dedicated Power Platform support team

As your adoption grows and makers develop more business-important and critical solutions, you may require a dedicated Power Platform support team.

This team should consist of Power Platform technical experts who can support complex issues. Involving this team in the support process should be through a defined path via a support ticket.

This team will support mission-critical Power Platform solutions that are rolled out to dedicated centrally supported environments.

If your organizational structure is decentralized, you may want to consider formalizing team-assisted support to align with their local regions or business units and the central Power Platform support team helping out only with complex queries or central configurations, such as DLP policies.

Some customers chose to outsource this level of support to a partner.

Managing requests as purely an escalation path from the help desk gets difficult to enforce since these Power Platform technical experts are often well-known to business users. To encourage the habit of going through the proper channels, this team should redirect users to submit a help desk ticket. It will also improve the data quality for analyzing help desk requests.

## Partner support

Many customers choose to work with partners on their Power Platform adoption, including support. This can include development assistance for makers, help in establishing a CoE and technical support procedures, as well as 24/7 technical support for critical apps.

## Microsoft support

Microsoft support is used to raise platform related technical issues. Based on your [support plan](/admin/support-overview), different technical support and advisory services are available to you.

>[!TIP]
>Before raising a support ticket, also check [Power Apps support](https://powerapps.microsoft.com/support/), [Power Automate support](https://flow.microsoft.com/support/) and [Power Virtual Agents support](https://powervirtualagents.microsoft.com/support/) for high-priority issues that broadly affect all customers.

## Considerations and key actions

Considerations and key actions you can take to improve self and team-assisted supported solutions:

- Provide recognition and encouragement to your makers.
- Ensure makers are aware of graduation processes to graduate their solution to more formal support channels.
- Provide office hours, mentor opportunities, training sessions for makers to continue to increase their skills.
- Provide escalation paths for makers who get stuck to reach out to Power Platform technical experts.
- Create [template components](/powerapps/maker/canvas-apps/create-component) for makers to include in their apps, such as a form for end users to reach out to the help desk.
- Evaluate formalizing team-assisted support based on workload and number of solutions that need support in a specific business area.

Considerations and key actions you can take to improve your internal help desk support:

- Determine the initial scope of Power Platform topics that the help desk will handle.
- Assess the readiness level of your help desk to handle support.
- Arrange for additional training for help desk staff, based on readiness gaps.
- Determine what the escalation path will be for requests the help desk cannot directly handle.
- Update the help desk knowledge base for known Power Platform topics. Ensure someone is responsible for regular updates to the knowledge base to reflect new and enhanced features over time. Keep up to date by subscribing to the [Power Apps blog](https://powerapps.microsoft.com/blog/feed/), [Power Automate blog](https://flow.microsoft.com/blog/feed/) and [Power Virtual Agents blog](https://powervirtualagents.microsoft.com/blog/feed/) RSS feeds.
- Ensure a good issue tracking system is in place. It's often a ticketing system that can manage priority levels.
- Decide if anyone will be on-call for any issues related to Power Platform. If appropriate, ensure the expectations for 24/7 support are clear.
- Determine what SLAs will exist, and that expectations for response and resolution are clearly communicated.
- Be prepared to address specific common issues extremely quickly. For example, a request to use a new connector should be handled quickly. Slow support response may result in users finding workarounds.
- Ensure your help desk has a security role that allows them to [raise support tickets with Microsoft](/admin/get-help-support). Decide if the help desk or the dedicated support team will triage those issues.

Considerations and key actions you can take to improve your internal Power Platform dedicated support:

- Clearly define where help desk responsibilities end, and where dedicated support responsibilities begin.
- Ensure that the Power Platform dedicated support team have a direct escalation path to reach global administrators for Microsoft 365 and Azure. It's critical when a widespread issue arises that's beyond the scope of Power Platform. Such issues could be related to user accounts and permissions, network configuration or data sources used in Power Platform solutions.
- Create a feedback loop from the dedicated support team back to the help desk so that the IT knowledge base can be updated. The goal is for the primary help desk to continually become better equipped at handling more issues in the future.
- Create a feedback loop from the help desk to the dedicated support team. When support personnel observe redundancies or inefficiencies, they can communicate that information to the dedicated support team, who might choose to change and improve internal processes. Example: If the help desk is inundated with creating and configuring new Power Platform environments for makers, the dedicated team may look at automating this process using the [environment request management components in the CoE Starter Kit](/guidance/coe/env-mgmt).
- Create an escalation path from individuals and teams supporting their solutions to the dedicated support team, so they can get unblocked if they face issues they can not solve themselves.
- Create a handover path from individuals and teams supporting their solutions to the dedicated support team, so that critical applications can transition.
- Decide on your overall strategy for transitioning solutions to the dedicated team – as your number of important and critical solutions increase, will you increase staffing on the dedicated support team, or will you rely on business units to staff support teams for their areas?

[!INCLUDE[footer-include](../../includes/footer-banner.md)]