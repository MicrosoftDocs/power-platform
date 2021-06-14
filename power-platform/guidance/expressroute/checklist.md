---
title: "ExpressRoute Readiness Checklist | MicrosoftDocs"
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

# ExpressRoute Readiness Checklist

As part of determining if you are ready to implement ExpressRoute for Power
Platform, the following scenarios should be validated.

## Client routing

Using ExpressRoute for Power Platform and Microsoft 365 requires traffic routing
from the client via ExpressRoute circuit, rather than via the Internet. This is
typically done through proxy setup.

-   Has it been confirmed how the client connectivity will be configured to make
    sure that appropriate traffic will be routed via the ExpressRoute circuit?

-   Are the clients able to connect via the Internet for non-private resources,
    e.g. CDN?

-   Has the client been configured to use a proxy to route traffic to the
    ExpressRoute subnet rather than across the internet?

-   Are the clients connecting from public IP address or hidden behind NAT?

![Diagram showing customer's company network, datacenter and partner edge, with points to consider on ](media/checklist-client-routing.png)

## WAN performance

When using ExpressRoute, the performance from a client will only be as good as
the slowest link on the connection. Because most clients will be connected to
the ExpressRoute circuit via a WAN, the capacity and speed of the WAN connection
is critical.

-   Will the capacity and speed of the WAN connection be sufficient for the
    required traffic?

![Diagram showing customer's company network, datacenter and partner edge, with points to consider on WAN latency and bandwidth. ](media/checklist-wan-performance.png)

## Peering

Power Platform uses a Microsoft Peering.

-   Has the appropriate Microsoft Peering been configured for your needs?

    ![Diagram showing customer's company network, datacenter and partner edge, with points to consider on peering type. ](media/checklist-microsoft-peering.png)

## Asymmetric routing

-   Have you configured the network and ExpressRoute to ensure you avoid
    asymmetric routing?

![Diagram showing network route from customer's company network, then request sent to the internet, routed to Microsoft services, response is then routed back via ExpressRoute and the traffic back is rejected by customer's firewall.](media/checklist-asymmetric-routing.png)

## Geographical distribution

-   If a geographically distributed user base is to be served, has this been
    considered in the ExpressRoute circuit connectivity?

-   Are multiple circuits needed distributed geographically for different areas
    or regions?

![Diagram showing two operations, one in US and one in UK, and individual ExpressRoute circuit is setup.](media/checklist-geo-distribution.png)

## On-Premises integration

-   Are connections back into the on-premises network from Microsoft cloud
    across ExpressRoute protected (validated as if coming from the public
    Internet)?

![Diagram showing customer network set up with on-premise data gateway. Connection to on-premise data gateway also is routed through ExpressRoute connection.](media/checklist-onprem-integration.png)
