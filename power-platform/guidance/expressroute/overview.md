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
contributors:
  - rogergilchrist
  - topness-msft
---

# Use Azure ExpressRoute with Microsoft Power Platform

[Microsoft Azure ExpressRoute](https://azure.microsoft.com/services/expressroute/) provides a way to connect your on-premises network
to Microsoft cloud services by using private connectivity.

:::image type="complex" source="media/expressroute-overview.png" alt-text="Overview diagram of the ExpressRoute-enabled network configuration with Microsoft public services and Azure.":::
   Overview diagram of the ExpressRoute-enabled network configuration with Microsoft public services and Azure. From the customer's network, a direct connection to Microsoft public services is made by using public internet traffic. Another network connection is set up to connect to the network partner edge, which has an ExpressRoute connection set up to the Microsoft edge. Two connections are set up, one primary and one secondary. From the Microsoft edge, Microsoft peering is used to connect to Microsoft public services, and Azure private peering is used to connect from the Microsoft edge to Azure services. 
:::image-end:::

Although the name of the service is Azure ExpressRoute, it also supports private
connectivity to services built on top of Azure, such as Microsoft 365,
Microsoft Power Platform, and Dynamics 365.

:::image type="complex" source="media/powerplatform-overview.png" alt-text="Diagram of the Microsoft technology ecosystem.":::
   Diagram of the Microsoft ecosystem. The foundation layer consists of identity, security, management, and compliance. Azure spans that foundation. GitHub and Microsoft Power Platform are built on Azure, and Microsoft 365, LinkedIn and Microsoft Dynamics 365 are at the top layer.
:::image-end:::

ExpressRoute is a valuable technology, particularly when used with Azure infrastructure as a service (IaaS),
but its deployment shouldn't be undertaken lightly, particularly for use with
Microsoft Power Platform and Microsoft 365 services. You should consider using these services for ExpressRoute only after you've comprehensively reviewed your business justification and carefully planned how you'll configure it in your organization.

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
