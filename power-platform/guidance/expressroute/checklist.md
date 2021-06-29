---
title: "Readiness checklist for using ExpressRoute with Microsoft Power Platform | MicrosoftDocs"
description: "Checklist of points to consider when setting up ExpressRoute for Microsoft Power Platform"
author: taiki-yoshida
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/30/2021
ms.author: tayoshi
ms.reviewer: kathyos
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# ExpressRoute readiness checklist

As part of determining whether you're ready to implement ExpressRoute for Microsoft Power
Platform, you need to validate the following scenarios.

## Client routing

Using ExpressRoute for Microsoft Power Platform and Microsoft 365 requires routing traffic
from the client via the ExpressRoute circuit rather than via the internet. This is
typically done through proxy setup. Verify the following:

-   Have you confirmed how client connectivity will be configured to make
    sure that appropriate traffic will be routed via the ExpressRoute circuit?

-   Are clients able to connect via the internet for non-private resources,
    for example Azure Content Delivery Network?

-   Has the client been configured to use a proxy to route traffic to the
    ExpressRoute subnet rather than across the internet?

-   Are the clients connecting from a public IP address or are they hidden behind network address translation (NAT)?
<!--note from editor: I deleted "and points to consider" because the points all seem to have been described in the preceding text (which is good!). -->
![Diagram showing a customer's company network, datacenter, and partner edge with client routing considerations.](media/checklist-client-routing.png)

## WAN performance

When using ExpressRoute, the performance from a client will only be as good as
the slowest link on the connection. Because most clients will be connected to
the ExpressRoute circuit via a wide-area network (WAN), the capacity and speed of the WAN connection
is critical.

-   Will the capacity and speed of the WAN connection be sufficient for the traffic you'll require?
<!--note from editor: Please make sure the preceding text or the image alt text covers the "points to consider" that you refer to. (I think it does.)-->
![Diagram showing customer's company network, datacenter and partner edge, with WAN latency and bandwidth considerations.](media/checklist-wan-performance.png)

## Peering

Microsoft Power Platform uses Microsoft peering.

-   Has the appropriate Microsoft peering been configured for your needs?
<!--note from editor: Please make sure the preceding text of the image alt text covers the "points to consider" that you refer to. (I think it does.)-->
![Diagram showing a customer's company network, datacenter, and partner edge, with peering considerations.](media/checklist-microsoft-peering.png)

## Asymmetric routing

-   Have you configured the network and ExpressRoute to ensure that you avoid
    asymmetric routing?
<!--note from editor: The alt text for this image exceeds the 150-character limit, and actually it should be even longer to fully describe the image. Please verify my edits to alt text and flesh out the long description. Also, please change "ER" in the image to "ExpressRoute."
![Diagram a showing a network request sent via the internet to Microsoft services and a response routed back via ExpressRoute - asymmetric routing.](media/checklist-asymmetric-routing.png)
-->
<!--tayoshi: Fixed alt-text-->
:::image type="complex" source="media/checklist-asymmetric-routing.png" alt-text="Diagram a showing a network request sent via the internet to Microsoft services and a response routed back via ExpressRoute - asymmetric routing.":::
   The diagram is showing a network request to Microsoft is made where the traffic is routed to travel through via the public internet. Once the request reaches Microsoft and the response is generated, the responce is routed via ExpressRoute due to incorrect configuration of the routing. As the original request is via the internet, customer's firewall rejects the incoming response traffic, failing to complete the standard request and response. 
:::image-end:::

## Geographical distribution

-   If a geographically distributed user base is to be served, has this been
    considered in the ExpressRoute circuit connectivity?

-   Should multiple circuits be distributed geographically for different areas
    or regions?
![Diagram showing two operations, one in the United States and one in the United Kingdom, with an individual ExpressRoute circuit set up for each.](media/checklist-geo-distribution.png)

## On-premises integration

-   Are connections back into the on-premises network from the Microsoft cloud
    across ExpressRoute protected (that is, are they validated as if they came from the public internet)?

![Diagram showing a customer network set up with an on-premises data gateway. The connection to the on-premises data gateway also is routed through ExpressRoute.](media/checklist-onprem-integration.png)
