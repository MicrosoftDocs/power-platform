---
title: Use Azure ExpressRoute with Power Platform
description: Learn how Azure ExpressRoute enables private connectivity to Power Platform, ensuring secure and predictable performance for mission-critical applications.
#customer intent: As a network administrator, I want to understand how to use Azure ExpressRoute with Microsoft Power Platform so that I can ensure secure and predictable performance for mission-critical applications.  
author: taiki-yoshida
ms.topic: overview
ms.date: 04/02/2025
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.author: tayoshi
contributors:
  - rogergilchrist
  - topness-msft
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Use Azure ExpressRoute with Power Platform

[Microsoft Azure ExpressRoute](https://azure.microsoft.com/services/expressroute/) provides a way to connect your on-premises network
to Microsoft cloud services by using private connectivity.

:::image type="complex" source="media/expressroute-overview.png" alt-text="Overview diagram of the ExpressRoute-enabled network configuration with Microsoft public services and Azure." lightbox="media/expressroute-overview.png":::
   The customer's network connects directly to Microsoft public services using public internet traffic. Another network connection is set up to connect to the network partner edge, which has an ExpressRoute connection set up to the Microsoft edge. There are two connections, one primary and one secondary. From the Microsoft edge, Microsoft peering is used to connect to Microsoft public services, and Azure private peering is used to connect from the Microsoft edge to Azure services. 
:::image-end:::

Although the name of the service is Azure ExpressRoute, it also supports private connectivity to services built on top of Azure, such as Microsoft 365, Power Platform, and Dynamics 365.

:::image type="complex" source="media/powerplatform-overview.png" alt-text="Diagram of the Microsoft technology ecosystem.":::
    The foundation layer of the ecoystem consists of identity, security, management, and compliance. Azure spans that foundation. GitHub and Power Platform are built on Azure, and Microsoft 365, LinkedIn, and Microsoft Dynamics 365 are at the top layer.
:::image-end:::

ExpressRoute is a valuable technology, especially when used with Azure infrastructure as a service (IaaS), but its deployment shouldn't be undertaken lightly, particularly for use with Power Platform and Microsoft 365 services. Consider using these services for ExpressRoute only after reviewing your business justification and planning its configuration in your organization.

This section focuses on planning and configuring ExpressRoute for use with Power Platform. Learn more about ExpressRoute in [What is Azure ExpressRoute?](/azure/expressroute/expressroute-introduction)

Typically, an organization will look into ExpressRoute if they have one or more of the following concerns:

- Making sure their network or internet connection can handle the additional traffic of a rich business application.
- Managing the predictability of the traffic supporting mission-critical applications—as opposed to other, less critical, internet traffic—to ensure performance for users and the business.
- Ensuring compliance with a regulatory need for data to never transit across the public internet.

ExpressRoute can address these concerns, but it's important to understand what ExpressRoute does and doesn't do so that you can accurately judge its value given your situation.

## Next step

> [!div class="nextstepaction"]
> [Understand the benefits of using ExpressRoute](benefits.md)
