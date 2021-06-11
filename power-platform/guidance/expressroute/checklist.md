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

![](media/e09e6e079007a501c385b80a133fc55f.png)

## WAN performance

When using ExpressRoute, the performance from a client will only be as good as
the slowest link on the connection. Because most clients will be connected to
the ExpressRoute circuit via a WAN, the capacity and speed of the WAN connection
is critical.

-   Will the capacity and speed of the WAN connection be sufficient for the
    required traffic?

![](media/62b02c1c2c5ef0fc8eb5044a5f99d340.png)

## Peering

Power Platform uses a Microsoft Peering.

-   Has the appropriate Microsoft Peering been configured for your needs?

    ![](media/42e8353616bab0cff36871c174064243.png)

## Asymmetric routing

-   Have you configured the network and ExpressRoute to ensure you avoid
    asymmetric routing?

![](media/7c7145429611b95f680443b6c6b1cc10.png)

## Geographical distribution

-   If a geographically distributed user base is to be served, has this been
    considered in the ExpressRoute circuit connectivity?

-   Are multiple circuits needed distributed geographically for different areas
    or regions?

![](media/7278fcb3bfebce681ff4f9e96e3b0e1c.png)

## On-Premises integration

-   Are connections back into the on-premises network from Microsoft cloud
    across ExpressRoute protected (validated as if coming from the public
    Internet)?

![](media/726698bc4076e7cdf0dc312124322ef7.png)
