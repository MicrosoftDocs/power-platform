---
title: Checklist for ExpressRoute readiness
description: Make sure your network is ready for ExpressRoute with this checklist, which addresses routing, peering, and geographical distribution for optimal performance.
#customer intent: As a network administrator, I want to validate client routing configurations so that traffic is correctly routed via the ExpressRoute circuit.
author: taiki-yoshida
ms.component: pa-admin
ms.topic: checklist
ms.date: 04/17/2025
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

Use the following checklist to help you determine whether your organization is ready to implement ExpressRoute for Power Platform.

## Client routing

The use of ExpressRoute for Power Platform and Microsoft 365 requires routing traffic from the client through the ExpressRoute circuit rather than over the internet.

> [!div class="checklist"]
>
> * Are clients configured to use a proxy to route traffic to the ExpressRoute subnet rather than across the internet?
> * Are clients connecting from a public IP address, or are they hidden behind network address translation?
> * Are clients able to connect through the internet for non-private resources, such as Azure Content Delivery Network?

:::image type="content" source="media/checklist-client-routing.png" alt-text="Diagram showing a customer's company network, datacenter, and partner edge with client routing considerations.":::

## WAN performance

When you use ExpressRoute, client performance is only as good as the slowest link on the connection. Because most clients connect to the ExpressRoute circuit through a wide area network (WAN), the capacity and speed of the WAN connection are critical.

> [!div class="checklist"]
>
> * Are the capacity and speed of the WAN connection sufficient for the traffic it will handle?

:::image type="content" source="media/checklist-wan-performance.png" alt-text="Diagram showing customer's company network, datacenter, and partner edge, with WAN latency and bandwidth considerations.":::

## Peering

Power Platform uses Microsoft peering.

> [!div class="checklist"]
>
> * Have you configured Microsoft peering appropriately for your needs?

:::image type="content" source="media/checklist-microsoft-peering.png" alt-text="Diagram showing a customer's company network, datacenter, and partner edge, with peering considerations.":::

## Asymmetric routing

[Asymmetric routing](planning-expressroute.md#avoid-asymmetric-routing) can cause firewall and other network issues.

> [!div class="checklist"]
>
> * Have you configured the network and ExpressRoute to ensure that you avoid asymmetric routing?

## Geographical distribution

> [!div class="checklist"]
>
> * If your users are distributed geographically, have you considered how to optimize the ExpressRoute circuit connectivity?  
> * Have you determined whether multiple circuits should be distributed geographically for different areas or regions?  

:::image type="content" source="media/checklist-geo-distribution.png" alt-text="Diagram showing two operations, one in the United States and one in the United Kingdom, with an individual ExpressRoute circuit set up for each.":::  

## On-premises integration

> [!div class="checklist"]
>
> * Are connections from the Microsoft Cloud to the on-premises network across ExpressRoute protected as if they came from the public internet?

:::image type="content" source="media/checklist-onprem-integration.png" alt-text="Diagram of customer network with an on-premises data gateway, with the connection to the on-premises data gateway also routed through ExpressRoute.":::
