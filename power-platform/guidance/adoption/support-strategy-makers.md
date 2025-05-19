---
title: Maker support strategies
description: Learn how to establish effective maker support strategies for Microsoft Power Platform, including team-assisted support, internal communities, and help desk solutions.
#customer intent: As a Power Platform admin, I want to establish effective maker support strategies so that I can reduce formal support queries and improve user experience.  
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/14/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/28/2025
---

# Maker support strategies

This article provides strategies for providing technical guidance and maker support systems in Power Platform. Activities like building a community, training your makers, and co-development assistance can significantly decrease the volume of formal support queries and increase user experience overall. In addition to these activities, it's important to establish ongoing [training and learning opportunities](training-strategy.md) for your makers.

This diagram shows common types of maker support that organizations can use successfully.

:::image type="content" source="media/support-maker.png" alt-text="Diagram showing internal and external maker education and development support.":::

| **Type** | **Description** |
| --- | --- |
| :::image type="icon" source="media/support-1.png" border="false"::: | **Team-assisted support (internal)** is informal. Support occurs when team members learn from each other as they develop Power Platform solutions. |
| :::image type="icon" source="media/support-2.png" border="false"::: | **Internal community support (internal)** can be organized informally and formally. It occurs when colleagues interact with each other via internal community channels. It's often focused on makers solving specific issues as they develop an app or flow. |
| :::image type="icon" source="media/support-3.png" border="false"::: | **Power Platform Nurture team (internal)** is responsible for enabling Power Platform at the organization level. This team can provide mentorship to makers and help them build apps/flows. It can also lead community programs and events like hackathons. |
| :::image type="icon" source="media/support-4.png" border="false"::: | **Help desk support (internal)** handles formal support issues and requests. |
| :::image type="icon" source="media/support-5.png" border="false"::: | **Microsoft support (external)** includes support for users and admins. Makers and users can raise questions through the [Power Apps](https://powerapps.microsoft.com/support/) or [Power Automate](https://flow.microsoft.com/support/) support page. Power Platform and Environment admins can [raise support tickets](/admin/support-overview) through [Power Platform admin center](https://aka.ms/ppac). Different technical support and advisory services are available based on your [support plan](/admin/support-overview). |
| :::image type="icon" source="media/support-6.png" border="false"::: | **[Partner support (external)](https://www.microsoft.com/en-us/power-platform/products/power-apps/partners)** can complement your internal support offering, and provide training to your makers, or handle complex queries from your makers. |
| :::image type="icon" source="media/support-7.png" border="false"::: | **[Community support (external)](https://powerusers.microsoft.com/)** can help get answers directly from other users. |

## Team-assisted support

Team-assisted support means makers learn from each other while building applications. 

Makers who emerge as [your champions](champions.md) tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help.

## Internal community support

At the heart of growth is a [community](wiki-community.md), a place for people to collaborate, share ideas, and discover new ways to apply technology to achieve more. A community is a place to ask questions, share knowledge, and expand skill sets.

Internal communities might start as informal efforts driven by makers who want to share their success with colleagues. Other makers may learn about the community through word of mouth. Often, these communities formalize as your Power Platform maturity grows. New makers are automatically invited to the community, success stories are shared during regular events, and existing champions mentor others to develop their careers.  

> [!TIP]  
> The goal of an internal community is to be self-sustaining, which can lead to reduced formal support demands and costs. However, there's always a need to monitor, manage, and nurture the internal community. Here are specific tips:  
>  
> - Set the community up for success by cultivating multiple experts in different topics.
> - Allow the community a chance to respond, but the Center of Excellence (CoE) should also monitor activity and unanswered questions to help out.  
> - Document FAQs and make them easily accessible to your community.  
> - If makers contact the dedicated support team or CoE leads directly, ask them to post questions in the community instead.  

An internal community discussion channel is often set up as a Teams channel or a Yammer group. The technology chosen should reflect where users already work so that the activities occur within their natural workflow.

An internal community discussion channel allows the Center of Excellence team to monitor the kind of questions people ask. This channel helps the CoE understand user issues and shape its future based on this input. Monitoring also reveals experts and potential champions who might not be known to the CoE.  

## Help desk support

The help desk usually operates as a shared service run by the IT department. The help desk can:

- Support technical issues that require IT involvement, such as installing software like Power Automate Desktop, resolving firewall or network issues, or addressing Power Platform service issues that need an admin to [raise support tickets](/admin/support-overview) through the [Power Platform admin center](https://aka.ms/ppac).  
- Answer governance-related questions, such as how to create new environments or request connectors.  

> [!IMPORTANT]  
> Your Power Platform governance decisions directly affect the volume of help desk requests. For example, if you lock down the creation of new environments for everyone, users will submit help desk tickets. While limiting environment creation is recommended, ensure you satisfy requests quickly to maintain employee and user satisfaction. Automating processes with Power Apps and Power Automate can help make the process more efficient. If you delay too long, users will use what they already have, which might not be ideal. Promptness is critical for certain help desk requests. As an example, learn how to use the [environment request management components in the CoE Starter Kit](/power-platform/guidance/coe/env-mgmt).  

Over time, help desk personnel will improve their troubleshooting and problem resolution skills as they expand their knowledge and experience with Power Platform.

## Microsoft support

Based on your support plan, you might be eligible for advisory support services provided through Premier/Unified support. Learn more about the support available to you in [Get Help + Support](../../admin/get-help-support.md).

Refer to the comprehensive [Microsoft Power Platform documentation](../../index.yml). It's an authoritative resource that helps with troubleshooting and finding information.

## Partner support

Many customers choose to work with partners on their Power Platform adoption, including support. This partnership can include development help for makers, assistance in setting up a CoE, technical support procedures, and training for your help desk and makers.

## Community support

Connect with peers and Power Platform technical experts through our [Power Platform community](https://powerusers.microsoft.com/). The community includes forums to ask questions, training resources, blogs, and sample galleries for inspiration. While the community can be powerful and helpful, it's important to validate the advice and information posted on any public forum.

The Power Platform community is vibrant. Every day, a great number of blog posts, articles, webinars, and videos are published. When you use community information for troubleshooting, consider:  

- How recent the information is, as it might be outdated.  
- Whether the situation and context of the solution online truly fit your circumstances.  
- The credibility of the information.  

## Considerations and key actions

Consider these key actions to improve team-assisted support:

- Provide recognition and encouragement to your champions.  
- If informal team efforts aren't enough, formalize the roles you want to establish in this area, along with the expected contributions and responsibilities.

Consider these key actions to improve your internal community support:

- Encourage people to ask questions in the designated community discussion channel. Over time, this habit normalizes, helping the community support itself.  
- Ensure that your dedicated Power Platform support team actively monitors the discussion channel. They can step in if a question remains unanswered, improve upon answers, or make corrections when appropriate. They can also post links to additional information to raise awareness of existing resources. The community's goal is to become self-supporting, but it still needs dedicated resources to monitor and nurture it.  
- Make sure your user population knows the internal community support area exists. Include a link in regular internal communications and intranet pages, and set up automated welcome emails for new makers with the community link.  
- Set up automation to ensure all Power Platform users have access to the community discussion channel.  

Consider these key actions to improve your internal help desk support:

- Determine the initial scope of Power Platform topics that the help desk will handle.  
- Assess the readiness level of your help desk to handle support.  
- Arrange for more training for help desk staff to address readiness gaps.  
- Determine the escalation path for requests that the help desk can't directly handle.
- Update the help desk knowledge base for known Power Platform topics. Ensure that someone is responsible for regular updates to the knowledge base to reflect new and enhanced features.  
- Be prepared to address specific common issues quickly. For example, handle requests to use a new connector promptly. Slow support responses may result in users finding workarounds.  

Consider these key actions to improve your Power Platform Nurture team support:

- Create a feedback loop from the help desk to the dedicated support team. When support personnel observe redundancies or inefficiencies, they can communicate that information to the Nurture team, who might choose to update existing internal documentation or provide more training paths for makers.
- Consider offering drop-in sessions or office hours for makers to ask questions and get immediate help.  
- Consider hosting frequent webinars to share Power Platform maker and development knowledge, such as how to use specific actions in a cloud flow or how to make canvas apps responsive. Record the sessions and make them available in your Power Platform community space.  

[!INCLUDE[footer-include](../../includes/footer-banner.md)]