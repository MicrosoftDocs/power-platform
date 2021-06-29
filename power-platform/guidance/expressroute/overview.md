---
title: "Overview of using Azure ExpressRoute with Microsoft Power Platform | MicrosoftDocs"
description: "Introduction to using Azure ExpressRoute with Microsoft Power Platform"
author: taiki-yoshida
ms.service: power-platform
ms.topic: conceptual
ms.date: 06/30/2021
ms.author: tayoshi
ms.reviewer: kathyos
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Use Azure ExpressRoute with Microsoft Power Platform
<!--note from editor: Some edits in this article (and throughout this doc set) are aimed at clarifying that the primary audience for this guidance is the person at the company that's going to implement ExpressRoute, not the partner who will likely do the actual implementation for the reader. If this is wrong, please excuse!-->
[Microsoft Azure ExpressRoute](https://azure.microsoft.com/services/expressroute/) provides a way to connect your on-premises network
to Microsoft cloud services by using private connectivity.
<!--note from editor: Here and throughout the images in this doc set: Please make the labels sentence case, to avoid branding confusion. I see you've done this for "Microsoft edge" (which is perfect), but it's also important to use "Microsoft cloud," "Microsoft peering," and "Azure private peering for virtual networks". Also, this alt text isn't very descriptive. I suggest using the :::image::: extension and describing it vividly enough that someone who can't see the image can understand what it illustrates.-->
![Overview diagram of the ExpressRoute-enabled network configuration with Microsoft public services and Azure.](media/expressroute-overview.png)

Although the name of the service is Azure ExpressRoute, it also supports private
connectivity to services built on top of Azure, such as Microsoft 365,
Microsoft Power Platform, and Dynamics 365.
<!--note from editor: The following alt text exceeds the 150-character limit, we need to use the :::image::: extension. Please verify my edits. "The entire Microsoft technology" seemed like too bold a claim, so I thought "ecosystem" might work.
![Diagram of the Microsoft ecosystem. The foundation layer consists of identity, security, management, and compliance. Azure spans that foundation. GitHub and Microsoft Power Platform are built on Azure, and Microsoft 365, LinkedIn and Microsoft Dynamics 365 are at the top layer.](media/powerplatform-overview.png)
-->
:::image type="complex" source="media/powerplatform-overview.png" alt-text="Diagram of the Microsoft technology ecosystem.":::
   <!--NOTE FROM EDITOR: PLEASE FLESH OUT THE LONG DESCRIPTION FOR THIS IMAGE. IF MY EDITS ARE OKAY (see commented-out text above), MAYBE YOU CAN USE THEM.-->
:::image-end:::

ExpressRoute is a valuable technology, particularly when used with Azure infrastructure as a service (IaaS),
but its deployment shouldn't be undertaken lightly, particularly for use with
Microsoft Power Platform and Microsoft 365 services. You should consider using these services for ExpressRoute only after you've comprehensively reviewed your business justification and carefully planned how you'll configure it in your organization<!--note from editor: Suggested. The passive voice was hard to follow here.-->.

This document focuses on planning and configuring ExpressRoute
for use with Microsoft Power Platform. More information: [What is Azure ExpressRoute?](/azure/expressroute/expressroute-introduction)

Typically, an organization will look into ExpressRoute if they have one or more
of the following concerns:

-   Making sure their network or internet connection can handle the additional
    traffic of a rich business application

-   Managing the predictability of the traffic supporting mission-critical
    applications—as opposed to other, less critical, internet traffic—to ensure
    performance for their users and the business

-   Ensuring compliance with a regulatory need for data to never transit across
    the public internet

Using ExpressRoute can address these concerns, but it's important to understand
what ExpressRoute does and doesn't do so that you can accurately judge its
value for your situation.

> [!div class="nextstepaction"]
> [Next step: Understand the benefits of using ExpressRoute](benefits.md)
