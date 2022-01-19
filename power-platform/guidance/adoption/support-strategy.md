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

There are two types of support considerations to keep in mind - ongoing production solution support, and maker education and development support.

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

![Types of ongoing solution support.](media/support1.png "Types of ongoing solution support")

| **Type** | **Description** |
| --- | --- |
| ![Type 1.](media/support-1.png "Type 1") | **Self-support (internal)** occurs when a maker supports their own solution. End users of the solution know to reach out to the maker for support, and there is often no visibility to IT or the team on the level or type of support the maker provides. |
| ![Type 2.](media/support-2.png "Type 2") | **Team-assisted support (internal)** occurs when team members learn from each other as they develop Power Platform solutions. Team members become co-owners of their teams apps, flows and chatbots, and are able to support end user queries and can make small bug fixes and changes. Whilst this sometimes happens informally, it’s a good idea to formalize this process as your adoption and growth matures.  |
| ![Type 3.](media/support-3.png  "Type 3") | **Help desk support (internal)** handles formal support issues and requests. They may help with non-solution related questions, such as how to access an app on a mobile device or how to request access to a backend datasource. They will redirect solution related questions to the channel supporting the solution. |
| ![Type 4.](media/support-4.png  "Type 4") | **Dedicated Power Platform support (internal)** involves handling complex issues escalated by the help desk. Critical applications are handed over to this team, and they are able to deploy bug fixes.  |
| ![Type 5.](media/support-5.png "Type 5") | **Partner support (external)** can complement your internal support offering, and support either critical applications or work with specific departments on supporting their apps. Learn more: [Get expert help from Power Apps partners](https://powerapps.microsoft.com/partners/). |
| ![Type 6.](media/support-6.png  "Type 6") | **Microsoft support (external)** often occurs to raise platform related technical issues. Based on your support plan, different technical support and advisory services are available to you. Learn more: [Support for Microsoft Power Platform](/power-platform/admin/support-overview) |

Depending on the size of your organization and existing delivery approaches for low code and pro code technologies, you might choose different ways of formalizing your support.
If your Power Platform adoption approach is largely [decentralized](delivery-models#decentralized), you will have autonomous teams across the organization delivering and governing Power Platform solutions. With this model, support may also be delegated, and team-assisted support may be the most relevant service for end users and makers.

If your Power Platform adoption approach is largely [centralized](delivery-models#centralized), you will have central teams of product owners who own the low-code delivery of departmental solutions from around the organization's business units. With this model, support will also be centralized and a central support team answers queries and questions.

In most organizations, a mix of delivery models is best – even if decentralized teams support solutions for their makers, a helpdesk and central support team may still be required for technical issues, end user queries and Level 100 support.

### Define tiers of applications

As you define your support process and escalation path, it is important to categorize solutions built based on criticality – this will allow you to come up with processes that ensure that critical applications have the necessary guardrails around them to support them whilst at the same time not stifling innovation of productivity scenarios.

| **Characteristics and Processes** | **Productivity** | **Important** | **Critical** |
| --- | --- |--- |--- |
| **Use Case** |  Individual or small team productivity, individual productivity and small team use cases that use existing data.| Simple business applications or team initiatives, Small standalone collaborative processes that. | Complex business applications, enterprise-wide initiatives or mission critical workloads that would result in significant business impact during downtime. |
| **Complexity** | Simple processes | Medium complexity | High complexity |
| **User Base** | Small user base – individual users, direct colleagues or small team | Scoped to business unit | Large use base or enterprise-wide usage |
| **Development Lifecycle** | High level of iteration | Typically less than three months to develop | Longer development cycle |
| **Impact** | Low business impact | Important but not business critical (medium impact) | High business impact |
| **ALM** |  No ALM Required. | ALM required – and may be achieved via manual solution import/export. | Robust ALM process required - ALM is achieved using Azure DevOps or GitHub pipelines. |
| **Environment strategy** | Solution is built in the default or a shared productivity environment. | Dedicated development environment, and shared test and prod environments (shared with other solutions, for example business unit specific). Environments are managed by the business unit (decentralized) or by Central IT (centralized) | Dedicated Dev/Test/Prod environments. Environments are managed by Central IT. |
| **Maker permissions** | Maker has the Environment Maker security role in the environments. | Maker has the Environment Maker or System customizer security role in the development environment, but only the end user security role in test and production environments. Solutions may be owned by a service account or Environment Admin in test and production. | Maker has the Environment Maker or System customizer security role in the development environment, but only the end user security role in test and production environments. Solution deployment happens automatically and solutions are owned by a service principal in test and production. |
| **IT involvement** | Reactive governance – IT has visibility of solutions being built and monitors usage. | IT blessing at solution or user level. Maker provides solution details, such as potential workarounds, data sources used etc. | Production environment is managed by IT. |
| **Support model** | Self-supported | Team-assisted supported | Formal support |

In most organizations, a mix of support models is best – not every solution built with Power Platform will require critical and formal support, but equally not everything built will be only a productivity solution either.

As you define your support models, also think about a graduation path – a solution may start off only requiring productivity-level support but grow in functionality or user base to require important-level support. Define how makers can request more formal support, and transition a solution to supported environments.

Each of the types of internal user support introduced above are described in further detail in this article.

### Self-support

Self-support refers to when the maker supports their own apps and flows built for themselves, their team or colleagues. This means answering queries from end users, fixing bugs and making change requests. This is an informal way of support; often end users know who the maker is and will reach out directly to them.

>[!IMPORTANT]
>As part of onboarding new makers, make sure makers are aware of support, graduation and escalation paths – makers that are overwhelmed with the support of their business important solutions will no longer be able to innovate and create new solutions. Clearly define how makers can graduate their solutions to the next level of support, and what that looks like.

Additional to this proactive way of communicating processes to makers, also make sure you have reactive governance in place to identify highly shared and highly used solutions that may be important to your business and reactively reach out to makers to make sure those solutions have the necessary support guardrails around them. Use [tenant-level analytics](/admin/tenant-level-analytics) to find out more about your applications usage, [export your telemetry to your own data storage account](/admin/self-service-analytics) to build your own enhanced reporting or use the [CoE Starter Kit](https://aka.ms/coestarterkit) as a starting point.

### Team-assisted support

Team-assisted support refers to when team members take on co-ownership of apps and flows built for their team/used by their team and help support the solutions during their daily work. This means answering queries from end users, fixing bugs, and making change requests. Makers who emerge as [your champions](champions) tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help.

Whilst this often starts off as an informal process, many organizations formalize team-assisted support to scale their Power Platform efforts. This involves business units owning their dedicated environments, taking on the Environment Admin role and supporting solutions in those environments. In larger organizations, dedicated Power Platform teams per business unit take on this role.

### Help desk support

The help desk is usually operated as a shared service by the IT department.

The help desk can

- Support technical issues that can not be resolved without IT involvement, for example Power Platform service issues that require an admin to [raise a support ticket](/admin/get-help-support#view-solutions-or-enter-a-support-request-through-the-new-support-center) in [Power Platform admin center](https://aka.ms/ppac).
- Answering end user and governance related questions, such as how to request access to applications, where to find applications.
- Providing routing of issues with critical apps to the dedicated or team-assisted support team.

### Dedicated Power Platform support team

As your adoption grows and makers develop more business important and critical solutions, you may require a dedicated Power Platform support team.

This team should consist of subject matter experts that can support complex issues. Involving this team in the support process should be through a defined path via a support ticket.

This team will support mission critical Power Platform solution that are rolled out to dedicated centrally supported environments.

If your organizational structure is decentralized, you may want to consider formalizing team-assisted support to align with their local regions or business units and the central Power Platform support team only helping out with complex queries or central configurations, such as DLP policies.

Some customers chose to outsource this level of support to a partner.

Managing requests as purely an escalation path from the help desk gets difficult to enforce since these subject matter experts are often well-known to business users. To encourage the habit of going through the proper channels, this team should redirect users to submit a help desk ticket. It will also improve the data quality for analyzing help desk requests.

### Partner support

Many customers choose to work with partners on their Power Platform adoption, including support. This can include development support for makers, support in establishing a CoE and support procedures, as well as 24/7 support for critical apps.

### Microsoft support

Often occurs to raise platform related technical issues. Based on your [support plan](/admin/support-overview), different technical support and advisory services are available to you.

>[!TIP]
>Before raising a support ticket, also check [Power Apps support](https://powerapps.microsoft.com/support/), [Power Automate support](https://flow.microsoft.com/support/) and [Power Virtual Agents support](https://powervirtualagents.microsoft.com/support/) for high-priority issues that broadly affect all customers.

### Considerations and key actions

Considerations and key actions you can take to improve self and team-assisted supported solutions:

- Provide recognition and encouragement to your makers.
- Ensure makers are aware of graduation processes to graduate their solution to more formal support channels.
- Provide office hours, mentor opportunities, training sessions for makers to continue to increase their skills.
- Provide escalation paths for makers who get stuck to reach out to subject matter experts.
- Create [template components](/powerapps/maker/canvas-apps/create-component) for makers to include in their apps, such as a form for end users to reach out to the help desk.
- Evaluate formalizing team-assisted support based on workload and number of solutions that need support in a specific business area.

Considerations and key actions you can take to improve your internal help desk support:

- Determine the initial scope of Power Platform topics that the help desk will handle.
- Assess the readiness level of your help desk to handle support.
- Arrange for additional training for help desk staff, based on readiness gaps.
- Determine what the escalation path will be for requests the help desk cannot directly handle.
- Update the help desk knowledge base for known Power Platform topics. Ensure someone is responsible for regular updates to the knowledge base to reflect new and enhanced features over time.
- Ensure a good issue tracking system is in place. It's often a ticketing system that can manage priority levels.
- Decide if anyone will be on-call for any issues related to Power Platform. If appropriate, ensure the expectations for 24/7 support are clear.
- Determine what SLAs will exist, and that expectations for response and resolution are clearly communicated.
- Be prepared to address specific common issues extremely quickly. For example, a request to use a new connector should be handled quickly. Slow support response may result in users finding workarounds.
- Ensure your help desk has a security role that allows them to [raise support tickets with Microsoft](/admin/get-help-support). Decide if the help desk or the dedicated support team will triage those issues.

Considerations and key actions you can take to improve your internal Power Platform dedicated support:

- Clearly define where help desk responsibilities end, and where dedicated support responsibilities begin.
- Ensure that the Power Platform dedicated support team have a direct escalation path to reach global administrators for Microsoft 365 and Azure. It's critical when a widespread issue arises that's beyond the scope of Power Platform. Such issues could be related to user accounts and permissions, network configuration or data sources used in Power Platform solutions.
- Create a feedback loop from the dedicated support team back to the help desk so that the IT knowledge base can be updated. The goal is for the primary help desk to continually become better equipped at handling more issues in the future.
- Create a feedback loop from the help desk to the dedicated support team. When support personnel observe redundancies or inefficiencies, they can communicate that information to the dedicated support team, who might choose to change and improve internal processes. Example: If the help desk is inundated with creating and configuring new Power Platform environments for makers, the dedicated team may look at automating this process.
- Create an escalation path from individuals and teams supporting their solutions to the dedicated support team, so they can get unblocked if they face issues they can not solve themselves.
- Create a handover path from individuals and teams supporting their solutions to the dedicated support team, so that critical applications can transition.
- Decide on your overall strategy for transitioning solutions to the dedicated team – as your number of important and critical solutions increase, will you increase staffing on the dedicated support team, or will you rely on business units to staff support teams for their areas?

## Maker education and development support

The following section covers maker education and development support. Activities like building a community, training your makers and co-development assistance can significantly decrease the volume of formal support queries and increase user experience overall.

![Types of maker education and development support.](media/support-maker.png "Types of maker education and development support")

The diagram shows some common types of maker support that organizations employ successfully:

| **Type** | **Description** |
| --- | --- |
| ![Type 1.](media/support-1.png "Type 1") | **Team-assisted support (internal)** is very informal. Support occurs when team members learn from each other as they develop Power Platform solutions.  |
| ![Type 2.](media/support-2.png "Type 2") | **Internal community support (internal)** can be organized informally and formally. It occurs when colleagues interact with each other via internal community channels. It’s often focused on makers solving specific issues as they develop an app or flow.   |
| ![Type 3.](media/support-3.png  "Type 3") | **Power Platform Nurture team (internal)** is responsible for enabling Power Platform at the organization. This team may provide mentorship to makers and help them build apps/flows. It will also lead community programs and events, such as hackathons.   |
| ![Type 4.](media/support-4.png  "Type 4") | **Help desk support (internal)** handles formal support issues and requests.  |
| ![Type 5.](media/support-5.png  "Type 5") | **Microsoft support (external)** includes support for users and admins. Makers and end users can raise questions through the [Power Apps](https://powerapps.microsoft.com/support/) or [Power Automate](https://flow.microsoft.com/support/) support page and Power Platform/Environment Admins can [raise support tickets](/admin/support-overview) through [Power Platform admin center](https://aka.ms/ppac). Based on your [support plan](/admin/support-overview), different technical support and advisory services are available to you. |
| ![Type 6.](media/support-6.png  "Type 6") | **[Partner support (external)](https://powerapps.microsoft.com/partners/)** can complement your internal support offering, and provide training to your makers or handle complex queries from your makers. |
| ![Type 7.](media/support-7.png  "Type 7") | **[Community support (external)](https://powerusers.microsoft.com/)** can help get answers directly from other users. |

Each of the types of internal user support introduced above are described in further detail in this article.

### Team-assisted support

Team-assisted support refers to makers learning from each other as they build applications. Makers who emerge as [your champions](champions) tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help

### Internal community support

At the heart of growth is a [community](wiki-community), a place for people to collaborate, share ideas, and discover new ways to apply technology to achieve more. A community is a place to ask questions, to share knowledge and expand skill sets.

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

The help desk can

- Support technical issues that can not be resolved without IT involvement, for example installation of software like Power Automate Desktop, firewall/network issues or Power Platform service issues that require an admin to [raise support tickets](/admin/support-overview) through [Power Platform admin center](https://aka.ms/ppac).
- Answering governance related questions, such as how to create new environments, request connectors.

>[!IMPORTANT]
>Your Power Platform governance decisions will directly impact the volume of help desk requests. For example, if you choose to lock down creation of new environments by everyone, it will result in users submitting help desk tickets. While it is our recommendation to limit environment creation, you must be prepared to satisfy the request very quickly to ensure employee / user satisfaction. Automating processes with Power Apps and Power Automate can help make the process efficient. If you delay too long, users will use what they already have, and that may not be the ideal scenario. Promptness is critical for certain help desk requests. As an example, learn [how to use the Environment Management components in the CoE Starter Kit](/guidance/coe/env-mgmt).

Over time, troubleshooting and problem resolution skills become more effective as help desk personnel expand their knowledge base and experience with Power Platform.

### Microsoft support

Based on your support plan, you may be eligible for advisory support services provided through Premier/Unified support. Learn more about support available to you: [Get Help + Support](/power-platform/admin/get-help-support)

Refer to the comprehensive [Microsoft Power Platform documentation](/power-platform/). It's an authoritative resource that can aid troubleshooting and search for information.

### Partner support

Many customers choose to work with partners on their Power Platform adoption, including support. This can include development support for makers, support in establishing a CoE and support procedures, as well as training for your help desk and makers.

### Worldwide community support

Connect with peers and subject matter experts through our worldwide [Power Platform community](https://powerusers.microsoft.com/). The communities feature forums for you to ask questions, trainings, blogs and sample galleries to take inspiration form.  It can be very powerful and exceedingly helpful. However, as is the case with any public forum, it's important to validate the advice and information posted on the forum.

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
- Update the help desk knowledge base for known Power Platform topics. Ensure someone is responsible for regular updates to the knowledge base to reflect new and enhanced features over time.
- Be prepared to address specific common issues extremely quickly. For example, a request to use a new connector should be handled quickly. Slow support response may result in users finding workarounds.

Considerations and key actions you can take to improve your Power Platform Nurture team support:

- Create a feedback loop from the help desk to the dedicated support team. When support personnel observe redundancies or inefficiencies, they can communicate that information to the Nurture team, who might choose to update existing internal documentation or provide additional training paths for makers.
- Consider offering drop-in sessions / office hours where makers can show up with their questions to get immediate help.
- Consider hosting frequent webinars to share Power Platform maker and development knowledge, such as how to use specific actions in a cloud flow or how to make canvas apps responsive. Record those sessions and make them available on your Power Platform community space.

## Maturity levels

The following maturity levels will help you assess the current state of your support strategy:

| **Level** | **State of Power Platform support strategy** |
| --- | --- |
| 100: Initial | Makers support their own apps and flows.<br>No or limited rules on how apps and flows should be supported by IT and Business stakeholders.<br>The help desk is not aware and not prepared to handle Power Platform queries.<br>Individual business units find ways of supporting each other; however this happens in silos and is not consistent across the organization – makers in different business units will receive different support based on the maturity of their department. |
| 200: Repeatable | Community support is getting established, often driven by individual subject matter experts who are passionate about Power Platform. They are working on bringing together and connecting makers to establish a support network.<br>An internal discussion channel is available, and becomes a place for Q&A. This channel may be growing organically, and new makers discover it through word of mouth rather than by being invited to it (automation to invite new makers). The CoE has little oversight of the channel. <br>There is some degree of commitment and governance measures to manage solution lifecycle stages, this often depends on the individual maker and their knowledge (= they learned best practices themselves vs being told by the org what to do).<br>The help desk handles a small number of the most common technical support issues. |
| 300: Defined | Support strategy involves help desk. The help desk is prepared to handle all known and expected Power Platform technical support issues, and the CoE provides appropriate extended support when required.<br>Defined risk profile dictates the level of support a solution will receive (e.g. IT supported, IT blessed, Maker supported). Makers are quickly able to assess the risk profile of their solution through a decision matrix and are able to identify what next steps to take – e.g. get test/prod environments, hand over solution, knowledge transfer to support team. Often this work is reactive, after the solution has been built, meaning IT does not have advance visibility.<br>The internal discussion channel is now popular and largely self-sustaining. CoE members actively monitor and manage the discussion channel to ensure questions are answered quickly and correctly.|
| 400: Capable | Dedicated Support team.<br>Continuous improvement plans in line with business strategy.<br>Clearly understood roles and responsibilities.<br>SLAs are in place to define help desk support expectations, including extended support, and they are clear to everyone involved. |
| 500: Efficient | Automation of support activities (e.g. change ownership, bot for FAQ). <br>Responsibilities and ownership to build and operate solutions are fully understood. <br>Bidirectional feedback loops exist between the help desk and the CoE.<br>Key performance indicators measure community engagement and satisfaction.<br>Automation is in place when it adds direct value to the user experience (for example, automatic access to the community), or for specific help desk activities (for example, use of APIs and scripts that increase speed and reduce error). |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]