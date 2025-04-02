---
title: Checklist for ExpressRoute readiness
description: Learn how to set up ExpressRoute for Microsoft Power Platform with this readiness checklist, covering client routing, WAN performance, and more.
#customer intent: As a network administrator, I want to validate client routing configurations so that traffic is correctly routed via the ExpressRoute circuit.  
author: taiki-yoshida
ms.component: pa-admin
ms.topic: checklist
ms.date: 04/02/2025
ms.subservice: architecture-center
ms.author: tayoshi
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
contributors:
  - rogergilchrist
  - topness-msft
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Checklist for ExpressRoute readiness

As part of determining whether you're ready to implement ExpressRoute for Power Platform, validate the following scenarios.

## Client routing

Using ExpressRoute for Power Platform and Microsoft 365 requires routing traffic from the client via the ExpressRoute circuit rather than via the internet. This process is typically completed through proxy setup.

Verify the following:

> [!div class="checklist"]
>
> * Haw client connectivity will be configured to make sure that appropriate traffic will be routed via the ExpressRoute circuit?
> * Are clients able to connect via the internet for non-private resources, for example, Azure Content Delivery Network?
> * Has the client been configured to use a proxy to route traffic to the ExpressRoute subnet rather than across the internet?
> * Are the clients connecting from a public IP address or are they hidden behind network address translation (NAT)?

:::image type="content" source="media/checklist-client-routing.png" alt-text="Diagram showing a customer's company network, datacenter, and partner edge with client routing considerations.":::

## WAN performance

When using ExpressRoute, client performance  is only as good as the slowest link on the connection. Because most clients connect to the ExpressRoute circuit via a wide-area network (WAN), the capacity and speed of the WAN connection is critical.

> [!div class="checklist"]
>
> * Will the capacity and speed of the WAN connection be sufficient for the traffic you require?

:::image type="content" source="media/checklist-wan-performance.png" alt-text="Diagram showing customer's company network, datacenter, and partner edge, with WAN latency and bandwidth considerations.":::

## Peering

Power Platform uses Microsoft peering.

> [!div class="checklist"]
>
> * Has the appropriate Microsoft peering been configured for your needs?

:::image type="content" source="media/checklist-microsoft-peering.png" alt-text="Diagram showing a customer's company network, datacenter, and partner edge, with peering considerations.":::

## Asymmetric routing

[Asymmetric routing](planning-expressroute.md#avoiding-asymmetric-routing) can cause firewall and other network issues.

> [!div class="checklist"]
>
> * Have you configured the network and ExpressRoute to ensure that you avoid asymmetric routing?

:::image type="complex" source="media/checklist-asymmetric-routing.png" alt-text="Diagram illustrating an asymmetric routing issue.":::
    The diagram shows that a network request to Microsoft is made where the traffic is routed to travel via the public internet. After the request reaches Microsoft and the response is generated, the response is routed via ExpressRoute due to the incorrect configuration of the routing. Because the original request comes via the internet, the customer's firewall rejects the incoming response traffic, failing to complete the standard request and response.
:::image-end::: 

## Geographical distribution

> [!div class="checklist"]
>
> * If a geographically distributed user base is to be served, has this been considered in the ExpressRoute circuit connectivity?  
> * Should multiple circuits be distributed geographically for different areas or regions?  

:::image type="content" source="media/checklist-geo-distribution.png" alt-text="Diagram showing two operations, one in the United States and one in the United Kingdom, with an individual ExpressRoute circuit set up for each.":::  

## On-premises integration

> [!div class="checklist"]
>
> * Are connections from the Microsoft cloud to the on-premises network across ExpressRoute protected (that is, are they validated as if they came from the public internet)?

:::image type="content" source="media/checklist-onprem-integration.png" alt-text="Diagram of customer network with an on-premises data gateway, with the connection to the on-premises data gateway also routed through ExpressRoute.":::