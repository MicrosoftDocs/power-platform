---
title: "User support strategy - Microsoft Power Platform | MicrosoftDocs"
description: "Guidance on establishing a support and graduation framework, decision matrix, and user support process for Microsoft Power Platform solutions."
author: manuelap-msft

ms.component: pa-admin
ms.topic: concept-article
ms.date: 02/01/2022
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# User support: Ongoing production solution support

The following section covers formal and informal ways of supporting users of Microsoft Power Platform solutions, such as apps, flows, and chatbots.

This diagram shows a common support and graduation framework that organizations employ successfully:

![Types of ongoing solution support.](media/support1.png "Types of ongoing solution support")

| **Type** | **Description** |
| --- | --- |
| ![Type 1.](media/support-1.png "Type 1") | **Self-support (internal)** occurs when a maker supports their own solution. Users of the solution know to reach out to the maker for support, and there's often no visibility to IT or the team on the level or type of support the maker provides. |
| ![Type 2.](media/support-2.png "Type 2") | **Team-assisted support (internal)** occurs when team members learn from each other as they develop Power Platform solutions. Team members become co-owners of their team's apps, flows, and chatbots. Co-owners are able to support user queries and can make small bug fixes and changes. While team-assisted support sometimes happens informally, it’s a good idea to formalize this process as your adoption and growth matures.  |
| ![Type 3.](media/support-3.png  "Type 3") | **Help desk support (internal)** handles formal support issues and requests. The help desk may help with questions such as how to access an app on a mobile device or how to request access to a back-end datasource. They'll redirect solution-related questions to the channel supporting the solution. |
| ![Type 4.](media/support-4.png  "Type 4") | **Dedicated Power Platform support (internal)** involves handling complex issues escalated by the help desk. Critical applications are handed over to this team, and they're able to deploy bug fixes.  |
| ![Type 5.](media/support-5.png "Type 5") | **Partner support (external)** can complement your internal support offering, and either support critical applications or work with specific departments on supporting their apps. Learn more: [Get expert help from Power Apps partners](https://powerapps.microsoft.com/partners/) |
| ![Type 6.](media/support-6.png  "Type 6") | **Microsoft support (external)** can be used to raise platform-related technical issues. Based on your support plan, different technical support and advisory services are available to you. Learn more: [Support for Microsoft Power Platform](../../admin/support-overview.md) |

Depending on the size of your organization and existing delivery approaches for low-code and pro-code technologies, you might choose different ways of formalizing your support.
If your Power Platform adoption approach is largely [decentralized](delivery-models.md#decentralized), you'll have autonomous teams across the organization delivering and governing Power Platform solutions. With this model, support may also be delegated, and team-assisted support may be the most relevant service for users and makers.

If your Power Platform adoption approach is largely [centralized](delivery-models.md#centralized), you'll have central teams of product owners who own the low-code delivery of departmental solutions from around the organization's business units. With this model, support will also be centralized and a central support team answers queries and questions.

In most organizations, a mix of delivery models is best—even if decentralized teams support solutions for their makers, a help desk and central support team may still be required for technical issues, user queries, and first-tier support.

## Define tiers of applications

As you define your support process and escalation path, it's important to categorize solutions built based on criticality—this will allow you to come up with processes that ensure that critical applications have the necessary guardrails to support them while at the same time not stifling innovation of productivity scenarios.

| **Characteristics and processes** | **Productivity** | **Important** | **Critical** |
| --- | --- |--- |--- |
| **Use case** | Individual productivity and small team use cases that may use existing data.| Simple business applications or team initiatives. Small standalone collaborative processes. | Complex business applications, enterprise-wide initiatives or mission-critical workloads that would result in significant business impact during downtime. |
| **Complexity** | Simple processes. | Medium complexity. | High complexity. |
| **User base** | Small user base – individual users, direct colleagues or small team. | Scoped to business unit. | Large user base or enterprise-wide usage. |
| **Development lifecycle** | High level of iteration. | Typically less than three months to develop. | Longer development cycle. |
| **Impact** | Low business impact. | Important but not business critical (medium impact). | High business impact. |
| **ALM** |  No ALM required. | ALM required – and may be achieved via manual solution import/export. | Robust ALM process required – ALM is achieved using Azure DevOps or GitHub pipelines. |
| **Environment strategy** | Solution is built in the default or a shared productivity environment. | Dedicated development environment, and shared test and prod environments (shared with other solutions – for example, business unit specific). Environments are managed by the business unit (decentralized) or by Central IT (centralized). | Dedicated dev/test/prod environments. Environments are managed by central IT. |
| **Maker permissions** | Maker has the Environment Maker security role in the environments. | Maker has the Environment Maker or System customizer security role in the development environment, but only the end user security role in test and production environments. Solutions may be owned by a service account or Environment Admin in test and production. | Maker has the Environment Maker or System customizer security role in the development environment, but only the user security role in test and production environments. Solution deployment happens automatically and solutions are owned by a service principal in test and production. |
| **IT involvement** | Reactive governance – IT has visibility of solutions being built and monitors usage. | IT blessing at solution or user level. Maker provides solution details, such as potential workarounds and data sources used. | Production environment is managed by IT. |
| **Support model** | Self-supported. | Team-assisted supported. | Formal support. |

As you define your support models, also think about a graduation path—a solution may start off only requiring productivity-level support but grow in functionality or user base to require important-level support. Define how makers can request more formal support and transition a solution to supported environments.

Each of the types of user support introduced above are described in further detail in this article.

## Maker support (self-support)

Maker support refers to the maker supporting their own apps and flows built for themselves, their team or colleagues. This means answering queries from users, fixing bugs, and making change requests. This is an informal way of support; often, users know who the maker is and will reach out directly to them.

>[!IMPORTANT]
>As part of onboarding new makers, make sure makers are aware of support, graduation, and escalation paths—makers who are overwhelmed with the support of their business-important solutions will no longer be able to innovate and create new solutions. Clearly define how makers can graduate their solutions to the next level of support, and what that looks like.

Next to this proactive way of communicating processes to makers, also make sure you have reactive governance in place to identify highly shared and highly used solutions that may be important to your business and reach out to makers to ensure those solutions have the necessary support guardrails. Use [tenant-level analytics](/admin/tenant-level-analytics) to find out more about your application's usage, [export your telemetry to your own data storage account](/admin/self-service-analytics) to build your own enhanced reporting, or use the [CoE Starter Kit](../coe/starter-kit.md) as a starting point.

## Team-assisted support

Team-assisted support refers to when team members take on co-ownership of apps and flows built for their team or used by their team and help support the solutions during their daily work. This means answering queries from users, fixing bugs, and making change requests. Makers who emerge as [your champions](champions.md) tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help.

While this often starts off as an informal process, many organizations formalize team-assisted support to scale their Power Platform efforts. This involves business units owning their dedicated environments, taking on the Environment Admin role, and supporting solutions in those environments. In larger organizations, dedicated Power Platform teams per business unit take on this role.

## Help desk support

The help desk is operated as a shared service by the IT department.

The help desk can:

- Support technical issues that cannot be resolved without IT involvement—for example, Power Platform service issues that require an admin to [raise a support ticket](/power-platform/admin/get-help-support#view-solutions-or-enter-a-support-request-through-the-new-support-center) in the [Power Platform admin center](https://aka.ms/ppac).
- Answering user and governance-related questions, such as how to request access to applications or where to find applications.
- Routing issues with critical apps to the correct support team.

## Dedicated Power Platform support team

As your adoption grows and makers develop more business-important and critical solutions, you may require a dedicated Power Platform support team.

This team should consist of Power Platform technical experts who can support complex issues. Involving this team in the support process should be through a defined path via a support ticket.

This team will support mission-critical Power Platform solutions that are rolled out to dedicated centrally supported environments.

If your organizational structure is decentralized, you may want to consider formalizing team-assisted support to align with their local regions or business units and the central Power Platform support team helping out only with complex queries or central configurations, such as DLP policies.

Some customers chose to outsource this level of support to a partner.

Managing requests as purely an escalation path from the help desk gets difficult to enforce since these Power Platform technical experts are often well-known to business users. To encourage the habit of going through the proper channels, this team should redirect users to submit a help desk ticket. It will also improve the data quality for analyzing help desk requests.

## Partner support

Many customers choose to work with partners on their Power Platform adoption, including support. This can include development assistance for makers, help in establishing a CoE and technical support procedures, and 24/7 technical support for critical apps.

## Microsoft support

Microsoft support is used to raise platform-related technical issues. Based on your [support plan](/admin/support-overview), different technical support and advisory services are available to you.

>[!TIP]
>Before raising a support ticket, also check [Power Apps support](https://powerapps.microsoft.com/support/), [Power Automate support](https://flow.microsoft.com/support/), and [Microsoft Copilot Studio support](https://powervirtualagents.microsoft.com/support/) for high-priority issues that broadly affect all customers.

## Considerations and key actions

Considerations and key actions you can take to improve self and team-assisted supported solutions:

- Provide recognition and encouragement to your makers.
- Ensure makers are aware of graduation processes to graduate their solution to more formal support channels.
- Provide office hours, mentor opportunities, and training sessions for makers to continue to increase their skills.
- Provide escalation paths for makers who get stuck to reach out to Power Platform technical experts.
- Create [template components](/powerapps/maker/canvas-apps/create-component) for makers to include in their apps, such as a form for users to reach out to the help desk.
- Evaluate formalizing team-assisted support based on workload and number of solutions that need support in a specific business area.

Considerations and key actions you can take to improve your internal help desk support:

- Determine the initial scope of Power Platform topics that the help desk will handle.
- Assess the readiness level of your help desk to handle support.
- Arrange for more training for help desk staff, based on readiness gaps.
- Determine what the escalation path will be for requests the help desk can’t directly handle.
- Update the help desk knowledge base for known Power Platform topics. Ensure someone is responsible for regular updates to the knowledge base to reflect new and enhanced features over time. Keep up to date by subscribing to the [Power Apps blog](https://powerapps.microsoft.com/blog/), [Power Automate blog](https://powerautomate.microsoft.com/blog/), and [Microsoft Copilot Studio blog](https://powervirtualagents.microsoft.com/) RSS feeds.
- Ensure a good issue-tracking system is in place. It's often a ticketing system that can manage priority levels.
- Decide if anyone will be on-call for any issues related to Power Platform. If appropriate, ensure the expectations for 24/7 support are clear.
- Determine what SLAs will exist, and that expectations for response and resolution are clearly communicated.
- Be prepared to address specific common issues quickly. For example, a request to use a new connector should be handled quickly. Slow support response may result in users finding workarounds.
- Ensure your help desk has a security role that allows them to [raise support tickets with Microsoft](/admin/get-help-support). Decide if the help desk or the dedicated support team will triage those issues.

Considerations and key actions you can take to improve your internal Power Platform dedicated support:

- Clearly define where help desk responsibilities end, and where dedicated support responsibilities begin.
- Ensure that the Power Platform dedicated support team has a direct escalation path to reach global administrators for Microsoft 365 and Azure. It's critical when a widespread issue arises that's beyond the scope of Power Platform. Such issues could be related to user accounts and permissions, network configuration or data sources used in Power Platform solutions.
- Create a feedback loop from the dedicated support team back to the help desk so that the IT knowledge base can be updated. The goal is for the primary help desk to continually become better equipped at handling more issues in the future.
- Create a feedback loop from the help desk to the dedicated support team. When support personnel observe redundancies or inefficiencies, they can communicate that information to the dedicated support team, which might choose to change and improve internal processes. Example: If the help desk is inundated with creating and configuring new Power Platform environments for makers, the dedicated team may look at automating this process using the [environment request management components in the CoE Starter Kit](../coe/env-mgmt.md).
- Create an escalation path from individuals and teams supporting their solutions to the dedicated support team, so they can get unblocked if they face issues they cannot solve themselves.
- Create a handover path from individuals and teams supporting their solutions to the dedicated support team, so that critical applications can transition.
- Decide on your overall strategy for transitioning solutions to the dedicated team—as your number of important and critical solutions increase, will you increase staffing on the dedicated support team, or will you rely on business units to staff support teams for their areas?

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
