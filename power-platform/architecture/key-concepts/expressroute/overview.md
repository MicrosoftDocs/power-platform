---
title: Use Azure ExpressRoute with Power Platform
description: Learn how Azure ExpressRoute enables private connectivity to Power Platform, ensuring secure and predictable performance for mission-critical applications.
#customer intent: As a network administrator, I want to understand how to use Azure ExpressRoute with Microsoft Power Platform so that I can ensure secure and predictable performance for mission-critical applications.  
author: taiki-yoshida
ms.topic: overview
ms.date: 04/17/2025
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

[Microsoft Azure ExpressRoute](https://azure.microsoft.com/services/expressroute/) provides a way to connect your on-premises network to Microsoft cloud services by using private connectivity.

:::image type="complex" source="media/expressroute-overview.png" alt-text="Overview diagram of an ExpressRoute-enabled network configuration with Microsoft public services and Azure." lightbox="media/expressroute-overview.png":::
   The customer's network connects directly to Microsoft public services using public internet traffic. Another network connection is set up to connect to the network partner edge, which has an ExpressRoute connection set up to the Microsoft edge. There are two connections, one primary and one secondary. From the Microsoft edge, Microsoft peering is used to connect to Microsoft public services, and Azure private peering is used to connect from the Microsoft edge to Azure services.
:::image-end:::

Azure ExpressRoute also supports private connectivity to services built on top of Azure, such as Microsoft 365, Power Platform, and Dynamics 365.

:::image type="complex" source="media/powerplatform-overview.png" alt-text="Diagram of the Microsoft technology ecosystem.":::
    The foundation layer of the ecosystem consists of identity, security, management, and compliance. Azure spans that foundation. GitHub and Power Platform are built on Azure, and Microsoft 365, LinkedIn, and Microsoft Dynamics 365 are at the top layer.
:::image-end:::

ExpressRoute is a valuable technology, especially when used with Azure infrastructure as a service (IaaS). However, its deployment shouldn't be undertaken lightly, particularly for use with Power Platform and Microsoft 365 services. Consider using these services with ExpressRoute only after reviewing your business justification and planning its configuration in your organization.

This section focuses on planning and configuring ExpressRoute for use with Power Platform. Learn more in [What is Azure ExpressRoute?](/azure/expressroute/expressroute-introduction).

Typically, organizations consider ExpressRoute when they have one or more of the following requirements:

- They need to make sure that their network or internet connection can handle the added traffic of a rich business application.
- The predictability of the traffic that supports mission-critical applications&mdash;as opposed to other, less-critical, internet traffic&mdash;is key to ensuring user performance and business success.
- They need to comply with regulatory requirements that prevent data from transiting across the public internet.

ExpressRoute can address these concerns, but it's important to understand what ExpressRoute does and doesn't do so that you can accurately judge its value in your situation.

## Next step

> [!div class="nextstepaction"]
> [Understand the benefits of using ExpressRoute](benefits.md)
