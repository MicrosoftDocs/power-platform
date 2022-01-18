---
title: "Ongoing Power Platform solution support strategy - Microsoft Power Platform | MicrosoftDocs"
description: "Guidance on establishing a support and graduation framework, decision matrix and user support process for ongoing solution support of Microsoft Power Platform solutions."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/18/2020
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
# Support

There are two types of support considerations to keep in mind - maker education and development support, and ongoing production solution support.  
The article will focus on providing:

- support and graduation framework
- decision matrix for supporting process
- user support internal to your organization
- external support resources

As you define your support process, it’s important to both review how makers and users will get and learn about support options available inside the organization, how you will support your makers, how your help desk will acquire the skills required and how applications graduate through different support options.

## Ongoing production solution support

The following section covers formal and informal ways of supporting solutions that have been built with Microsoft Power Platform, such as apps, flows and chatbots.
This diagram shows a common support and graduation framework that organizations employ successfully:

The six types of support shown in the above diagram include:

![Types of Power Platform support.](media/support1.png "Types of Power Platform support")

| **Type** | **Description** |
| --- | --- |
| ![Type 1.](media/common/icon-01-red-30x30.png "Type 1") | **Self-support (internal)** occurs when a maker supports their own solution. End users of the solution know to reach out to the maker for support, and there is often no visibility to IT or the team on the level or type of support the maker provides. |
| ![Type 2.](media/common/icon-02-red-30x30.png "Type 2") | **Team-assisted support (internal)** occurs when team members learn from each other as they develop Power Platform solutions. Team members become co-owners of their teams apps, flows and chatbots, and are able to support end user queries and can make small bug fixes and changes. Whilst this sometimes happens informally, it’s a good idea to formalize this process as your adoption and growth matures.  |
| ![Type 3.](media/common/icon-03-red-30x30.png  "Type 3") | **Help desk support (internal)** handles formal support issues and requests. They may help with non-solution related questions, such as how to access an app on a mobile device or how to request access to a backend datasource. They will redirect solution related questions to the channel supporting the solution. |
| ![Type 4.](media/common/icon-04-red-30x30.png  "Type 4") | **Dedicated Power Platform support (internal)** involves handling complex issues escalated by the help desk. Critical applications are handed over to this team, and they are able to deploy bug fixes.  |
| ![Type 5.](media/common/icon-05-red-30x30.png  "Type 5") | **Partner support (external)** can complement your internal support offering, and support either critical applications or work with specific departments on supporting their apps. [Get expert help from Power Apps partners](https://powerapps.microsoft.com/partners/). |
| ![Type 6.](media/common/icon-06-red-30x30.png  "Type 6") | **Microsoft support (external)** often occurs to raise platform related technical issues. Based on your support plan, different technical support and advisory services are available to you. Learn more: [Support for Microsoft Power Platform](/power-platform/admin/support-overview) |

Depending on the size of your organization and existing delivery approaches for low code and pro code technologies, you might choose different ways of formalizing your support.
If your Power Platform adoption approach is largely [decentralized](delivery-models#decentralized), you will have autonomous teams across the organization delivering and governing Power Platform solutions. With this model, support may also be delegated, and team-assisted support may be the most relevant service for end users and makers.

If your Power Platform adoption approach is largely [centralized](delivery-models#centralized), you will have central teams of product owners who own the low-code delivery of departmental solutions from around the organization's business units. With this model, support will also be centralized and a central support team answers queries and questions.

In most organizations, a mix of delivery models is best – even if decentralized teams support solutions for their makers, a helpdesk and central support team may still be required for technical issues, end user queries and Level 100 support.

## Define tiers of applications

As you define your support process and escalation path, it is important to categorize solutions built based on criticality – this will allow you to come up with processes that ensure that critical applications have the necessary guardrails around them to support them whilst at the same time not stifling innovation of productivity scenarios.

### Characteristics

| **Characteristics** | **Productivity** | **Important** | **Critical** |
| --- | --- |--- |--- |
| **Use Case** |  Individual or small team productivity, Individual productivity and small team use cases that use existing data.| Simple business applications or Team initiatives, Small standalone collaborative processes that. | Complex business applications or Org initiatives or mission critical workloads that would result in significant business impact resulting from interruption or downtime. |
| **Complexity** | Simple processes | Medium complexity | High complexity |
| **User Base** | Small user base – individual users, direct colleagues or small team | Scoped to business unit | Large use base or enterprise-wide usage |
| **Development Lifecycle** | High level of iteration | Typically <3 months to develop | Longer development cycle |
| **Impact** | Low business impact | Important but not business critical (medium impact) | High business impact |

### Processes

| **Processes** | **Productivity** | **Important** | **Critical** |
| --- | --- |--- |--- |
| **ALM** |  No ALM Required. | ALM required –and may be achieved via manual solution import/export. | Robust ALM process required - ALM is achieved using Azure DevOps or GitHub pipelines. |
| **Environment strategy** | Solution is built in the default or a shared productivity environment. | Dedicated development environment, and shared test and prod environments (shared with other solutions, e.g. business unit specific)
Environments are managed by the business unit (decentralized) or by Central IT (centralized) | Dedicated Dev/Test/Prod environments. Environments are managed by Central IT. |
| **Maker permissions** | Maker is Environment Maker in the environments. | Maker is Environment Maker or System customizer in Dev, but only user in Test/Prod. Solutions may be owned by a service account or Environment Admin in test and prod. | Maker is Environment Maker or System customer in Dev, but only user in prod. Solution deployment happens automatically and solutions are owned by a service principal in test and prod. |
| **IT involvement** | Reactive governance – IT has visibility of solutions being built and monitors usage. | IT blessing at solution or user level
Maker provides solution details, such as potential workarounds, data sources used etc. | Production environment is managed by IT. |
| **Support** | Self-supported | Team-assisted supported | Formal support |

In most organizations, a mix of support models is best – not every solution built with the Power Platform will require critical and formal support, but equally not everything built will be only a productivity solution either. 
As you define your support models, also think about a graduation path – a solution may start off only requiring Productivity level support but grow in functionality or user base to require Important level support. Define how a maker can request more formal support, and transition a solution to supported environments.

Each of the types of internal user support introduced above are described in further detail in this article.

## Self-support

Self-support refers to when the maker supports their own apps and flows built for themselves, their team or colleagues. This means answering queries from end users, fixing bugs and making change requests. This is an informal way of support; often end users know who the maker is and will reach out directly to them. 

>[!IMPORTANT] 
>As part of onboarding new makers, make sure makers are aware of support, graduation and escalation paths – makers that are overwhelmed with the support of their business important solutions will no longer be able to innovate and create new solutions. Clearly define how makers can graduate their solutions to the next level of support, and what that looks like.

Additional to this proactive way of communicating processes to makers, also make sure you have reactive governance in place to identify highly shared and highly used solutions that may be important to your business and reactively reach out to makers to make sure those solutions have the necessary support guardrails around them. Use the tenant-level analytics to find out more about your application usage, export your telemetry to your own data storage account to build your own enhanced reporting or use the CoE Starter Kit as a starting point.

## Team-assisted support

Team-assisted support refers to when team members take on co-ownership of apps and flows built for their team/used by their team and help support the solutions during their daily work. This means answering queries from end users, fixing bugs, and making change requests. Makers who emerge as your champions tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help.

Whilst this often starts off as an informal process, many organizations formalize team-assisted support to scale their Power Platform efforts. This involves Business Units owning their dedicated environments, taking on the Environment Admin role and supporting solutions in those environments. In larger organizations, dedicated Power Platform teams per business unit take on this role.

## Help desk support

The help desk is usually operated as a shared service, operated by the IT department.

The help desk comes in for

- Supporting technical issues that can not be resolved without IT involvement, for example Power Platform service issues that require an admin to raise a support ticket in PPAC.
- Answering end user and governance related questions, such as how to request access to applications, where to find applications.
- Providing routing of issues with critical apps to the dedicated or team-assisted support team.

## Dedicated Power Platform support team

As your adoption grows and makers develop more business important and critical solutions, you may require a dedicated Power Platform support team. 

This team should consist of subject matter experts that can support complex issues. Involving this team in the support process should be through a defined path via a support ticket.

This team will support mission critical Power Platform solution that are rolled out to dedicated centrally supported environments.

If your organizational structure is decentralized, you may find formalized team-assisted support align to support their local regions or business units and the central Power Platform support team only helping out with complex queries or central configurations, such as DLP policies. 

Some customers chose to outsource this level of support to a partner. 

Managing requests as purely an escalation path from the help desk gets difficult to enforce since these subject matter experts are often well-known to business users. To encourage the habit of going through the proper channels, this team should redirect users to submit a help desk ticket. It will also improve the data quality for analyzing help desk requests.

## Partner support

Many customers choose to work with partners on their Power Platform adoption, including support. This can include development support for makers, support in establishing a CoE and support procedures, as well as 24/7 support for critical apps. 

## Microsoft support

Often occurs to raise platform related technical issues. Based on your support plan, different technical support and advisory services are available to you. Learn more: Support for Microsoft Power Platform and customer engagement apps in Dynamics 365 - Power Platform | Microsoft Docs
Check Support | Microsoft Power Apps, https://flow.microsoft.com/en-us/support/ Support | Microsoft Power Virtual Agents for high-priority issues that broadly affect all customers.

## Considerations and key actions

**Considerations and key actions you can take to improve self-supported solutions:**

- Provide recognition and encouragement to your makers.
- Ensure makers are aware of graduation processes to graduate their solution to more formal support channels.
- Provide office hours, mentor opportunities, training sessions for makers to continue to increase their skills.
- Provide escalation paths for makers who get stuck to reach out to subject matter experts.
- Create template components for makers to include in their apps, such as a form for end users to reach out to the help desk. 

**Considerations and key actions you can take to improve your team assisted support:**

**Considerations and key actions you can take to improve your internal help desk support:**

- Determine the initial scope of Power Platform topics that the help desk will handle.
- Assess the readiness level of your help desk to handle support.
- Arrange for additional training for help desk staff, based on readiness gaps.
- Determine what the escalation path will be for requests the help desk cannot directly handle.
- Update the help desk knowledgebase for known Power Platform topics. Ensure someone is responsible for regular updates to the knowledgebase to reflect new and enhanced features over time.
- Ensure a good issue tracking system is in place. It's often a ticketing system that can manage priority levels.
- Decide if anyone will be on-call for any issues related to Power Platform. If appropriate, ensure the expectations for 24/7 support are clear.
- Determine what SLAs will exist, and that expectations for response and resolution are clearly communicated.
- Be prepared to address specific common issues extremely quickly. For example, a request to use a new connector should be handled quickly. Slow support response may result in users finding workarounds.
- Ensure your helpdesk has a security role that allows them to raise support tickets with Microsoft (Get Help + Support - Power Platform | Microsoft Docs). Decide if the helpdesk or the dedicated support team will triage those issues.

**Considerations and key actions you can take to improve your internal Power Platform dedicated support:**

- Clearly define where help desk responsibilities end, and where dedicated support responsibilities begin.
- Ensure that the Power Platform dedicated support team have a direct escalation path to reach global administrators for Microsoft 365 and Azure. It's critical when a widespread issue arises that's beyond the scope of Power Platform. Such issues could be related to user accounts and permissions, network configuration or data sources used in Power Platform solutions.
- Create a feedback loop from the dedicated support team back to the help desk so that the IT knowledgebase can be updated. The goal is for the primary help desk to continually become better equipped at handling more issues in the future.
- Create a feedback loop from the help desk to the dedicated support team. When support personnel observe redundancies or inefficiencies, they can communicate that information to the dedicated support team, who might choose to change and improve internal processes. Example: If the helpdesk is inundated with creating and configuring new Power Platform environments for makers, the dedicated team may choose to automate this process.
- Create an escalation path from individuals and teams supporting their solutions to the dedicated support team, so they can get unblocked if they face issues they can not solve themselves.
- Create a handover path from individuals and teams supporting their solutions to the dedicated support team, so that critical applications can transition. 
- Decide on your overall strategy for transitioning solutions to the dedicated team – as your number of important and critical solutions increase, will you increase staffing on the dedicated support team, or will you rely on business units to staff support teams for their areas?

## Maker education and development support

The following section covers maker education and development support. Activities like building a community, training your makers and co-development assistance can significantly decrease the volume of formal support queries and increase user experience overall.

The diagram shows some common types of maker support that organizations employ successfully:

| **Type** | **Description** |
| --- | --- |
| ![Type 1.](media/common/icon-01-red-30x30.png "Type 1") | **Team-assisted support (internal)** is very informal. Support occurs when team members learn from each other as they develop Power Platform solutions.  |
| ![Type 2.](media/common/icon-02-red-30x30.png "Type 2") | **Internal community support (internal)** can be organized informally and formally. It occurs when colleagues interact with each other via internal community channels. It’s often focused on makers solving specific issues as they develop an app or flow.   |
| ![Type 3.](media/common/icon-03-red-30x30.png  "Type 3") | **Power Platform Nurture team (internal)** is responsible for enabling Power Platform at the organisation. This team may provide mentorship to makers and help them build apps/flows. It will also lead community programs and events, such as hackathons.   |
| ![Type 4.](media/common/icon-04-red-30x30.png  "Type 4") | **Help desk support (internal)** handles formal support issues and requests.  |
| ![Type 5.](media/common/icon-05-red-30x30.png  "Type 5") | **Microsoft support (external)** includes support for users and admins. Makers and end users can raise questions through the Power Apps or Power Automate support page (Support | Microsoft Power Apps) and Power Platform/Environment Admins can raise support tickets through the Power Platform admin center. Based on your support plan, different technical support and advisory services are available to you – learn more: Support for Microsoft Power Platform and customer engagement apps in Dynamics 365 - Power Platform | Microsoft Docs |
| ![Type 6.](media/common/icon-06-red-30x30.png  "Type 6") | **Partner support (external)** can complement your internal support offering, and provide training to your makers or handle complex queries from your makers.  Partners | Microsoft Power Apps |
| ![Type 7.](media/common/icon-07-red-30x30.png  "Type 7") | **Community support (external)** can help get answers directly from other users Support | Microsoft Power Apps |

Each of the types of internal user support introduced above are described in further detail in this article.

### Team-assisted support

Team-assisted support refers to makers learning from each other as they build applications. Makers who emerge as your champions tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help

### Internal community support

At the heart of growth is a community, a place for people to collaborate, share ideas, and discover new ways to apply technology to achieve more. A community is a place to ask questions, to share knowledge and expand skill sets. 
Internal communities may start as an informal motion, driven by makers who want to share their success with their colleagues – other makers may learn about the community through word of mouth. Often, those communities are formalized as your Power Platform maturity grows – then, new makers are automatically invited to the community, regular events are used to show case success stories and learnings and existing champions take on mentorship opportunities to develop their career.

>[!TIP]
>The goal of an internal community is to be self-sustaining, which can lead to reduced formal support demands and costs. However, there will always be a need to monitor, manage, and nurture the internal community. Here are specific tips:

    - Set the community up for success by cultivating multiple experts in different topics.
    - Allow the community a chance to respond, but the CoE should also monitor activity and unanswered questions to help out. 
    - Document FAQ and make them easily accessible to your community.
    - If makers reach out directly to the dedicated support team or CoE leads, ask them to raise questions in the community instead.

An internal community discussion channel is commonly set up as a Teams channel or a Yammer group. The technology chosen should reflect where users already work, so that the activities occur within their natural workflow.

Use of an internal community discussion channel allows the Center of Excellence (CoE) to monitor the kind of questions people are asking. It's one way the CoE can understand the issues users are experiencing and shape the future of the CoE based on this input. Monitoring the discussion channel can also reveal additional experts and potential champions who were previously unknown to the CoE.

### Help desk support

The help desk is usually operated as a shared service, operated by the IT department. 

The help desk comes in for

-	Supporting technical issues that can not be resolved without IT involvement, for example installation of software like Power Automate Desktop, firewall/network issues or Power Platform service issues that require an admin to raise a support ticket in PPAC
-	Answering governance related questions, such as how to create new environments, request connectors

>[!IMPORTANT]
>Your Power Platform governance decisions will directly impact the volume of help desk requests. For example, if you choose to lock down creation of new environments by everyone, it will result in users submitting help desk tickets. While it is our recommendation to limit environment creation, you must be prepared to satisfy the request very quickly to ensure employee / user satisfaction. Consider that automation with Power Apps and Power Automate can help make the process efficient. If you delay too long, users will use what they already have, and that may not be the ideal scenario. Promptness is critical for certain help desk requests. Learn more: How to use the Environment Management components - Power Platform | Microsoft Docs

Over time, troubleshooting and problem resolution skills become more effective as help desk personnel expand their knowledgebase and experience with Power Platform. 

### Microsoft support

Based on your support plan, you may be eligible for advisory support services provided through Premier/Unified support. Learn more about support available to you: Get Help + Support - Power Platform | Microsoft Docs
Refer to the comprehensive Microsoft Power Platform documentation - Power Platform | Microsoft Docs. It's an authoritative resource that can aid troubleshooting and search for information.

### Partner support

Many customers choose to work with partners on their Power Platform adoption, including support. This can include development support for makers, support in establishing a CoE and support procedures, as well as training for your helpdesk and makers.

### Worldwide community support

Connect with peers and subject matter experts through our worldwide Power Platform community. The communities feature forums for you to ask questions, trainings, blogs and sample galleries to take inspiration form.  It can be very powerful and exceedingly helpful. However, as is the case with any public forum, it's important to validate the advice and information posted on the forum.

The Power Platform community is vibrant. Every day, there are a great number of blog posts, articles, webinars, and videos published. When relying on community information for troubleshooting, watch out for:

- How recent the information is.
- Whether the situation and context of the solution found online truly fits your circumstance.
- The credibility of the information being presented.

### Considerations and key actions

Considerations and key actions you can take to improve your team-assisted support:

- Provide recognition and encouragement to your champions
- If informal team efforts aren't adequate, consider formalizing the roles you want to enact in this area, and the expected contributions and responsibilities.

Considerations and key actions you can take to improve your internal community support:

- Encourage people to ask questions in the designated community discussion channel. As the habit builds over time, it will become normalized to use that as the first option. Over time, it will evolve to become more self-supporting.
- Ensure that Power Platform team members actively monitor this discussion channel. They can step in if a question remains unanswered, improve upon answers, or make corrections when appropriate. They can also post links to additional information to raise awareness of existing resources. Although the goal of the community is to become self-supporting, it still requires dedicated resources to monitor and nurture it.
- Make sure your user population knows the internal community support area exists. Highlight a link to it in regular internal communications, on your intranet pages and set up automated welcome emails for new makers with a link to the community.
- Set up automation to ensure that all your Power Platform users automatically have access to the community discussion channel. 

Considerations and key actions you can take to improve your internal help desk support:

- Determine the initial scope of Power Platform topics that the help desk will handle.
- Assess the readiness level of your help desk to handle support.
- Arrange for additional training for help desk staff, based on readiness gaps.
- Determine what the escalation path will be for requests the help desk cannot directly handle.
- Update the help desk knowledgebase for known Power Platform topics. Ensure someone is responsible for regular updates to the knowledgebase to reflect new and enhanced features over time.
- Be prepared to address specific common issues extremely quickly. For example, a request to use a new connector should be handled quickly. Slow support response may result in users finding workarounds.

Considerations and key actions you can take to improve your Power Platform Nurture team support:

- Create a feedback loop from the help desk to the dedicated support team. When support personnel observe redundancies or inefficiencies, they can communicate that information to the Nurture team, who might choose to update existing internal documentation or provide additional training paths for makers.
- Consider offering drop-in sessions / office hours where makers can show up with their questions to get immediate help.
- Consider hosting frequent webinars to share Power Platform maker and development knowledge, such as how to use specific actions in a cloud flow or how to make canvas apps responsive. Record those sessions and make them available on your Power Platform community space.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]