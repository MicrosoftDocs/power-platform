---
title: "Benefits of ExpressRoute with Microsoft Power Platform | MicrosoftDocs"
description: "Benefits of using ExpressRoute with Microsoft Power Platform including GDPR, compliance, and network traffic predictability."
author: taiki-yoshida
ms.service: power-platform
ms.topic: conceptual
ms.date: 06/30/2021
ms.subservice: guidance
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

# Benefits of using ExpressRoute with Microsoft Power Platform

The benefits of using ExpressRoute for your organization are:

- **Compliance**: You won't route customer information via the public internet.

- **Predictability**: Having a dedicated connection avoids conflict with other internet traffic

:::image type="complex" source="media/expressroute-network-overview.png" alt-text="Overview network diagram of using ExpressRoute.":::
   Overview diagram of the ExpressRoute-enabled network configuration with Microsoft public services and Azure. In the customer's network there are two offices, one based in Texas and the other in Seattle. A direct connection to Microsoft public services is made by using public internet traffic from the Texas office. For the Seattle office, the network connection is set up to connect to the network partner edge, which has an ExpressRoute connection set up to the Microsoft edge. Two connections are set up - one primary and one secondary. From the Microsoft edge, Microsoft peering is used to connect to Microsoft public services, and Azure private peering is used to connect from the Microsoft edge to Azure services. 
:::image-end:::

## Compliance

Routing the traffic to Microsoft Power Platform through a private connection avoids routing
sensitive data over the public internet. For regulatory purposes, some organizations need to show that data is never passed
through the public internet. In these situations, using standard connections
via the public internet to cloud services might not be acceptable.

This is rare, however. Most regulations don't specify that the internet can't
be used, simply that data must be protected in transit&mdash;typically by
encryption at the level of 256-bit Advanced Encryption Standard, which the TLS encryption used
by Microsoft Power Platform meets.

### GDPR

One of the regulations that might make ExpressRoute the right choice for your
organization is the General Data Protection Regulation (GDPR). The GDPR is a
complex regulation that might require significant changes in how you gather, use, and manage data. Microsoft has a long history of helping our customers comply
with complex regulations, and when it comes to preparing for the GDPR, we're
your partner on this journey.

One of the reasons why you might consider ExpressRoute for GDPR compliance is
to show clearly that all network activities take place under a private connection,
which should streamline the process of attesting that data is protected and isn't being exposed
to the public internet. However, this doesn't
mean that ExpressRoute is the only way to achieve compliance with the GDPR. You can still be compliant by using the
public internet, as long as you've established correct security and protection measures. More information: [GDPR overview](https://www.microsoft.com/trust-center/privacy/gdpr-overview)

## Network traffic predictability

In most organizations, the internet connection is shared by many users. This can
lead to contention for bandwidth. The connection within the internet service provider
can also suffer from contention from other customers.

ExpressRoute can establish a private and direct connection to Microsoft datacenters. Providing a connection directly through to Microsoft datacenters
minimizes the chances of any contention with other traffic, either from the same
organization or any other organization.

The main issue might just be within the bandwidth available, internal routing
through the ExpressRoute connectivity provider, or traffic in the connection
between the customer and the connectivity provider. If so, the problem can be resolved
through higher bandwidth and more reliable&mdash;or better optimized&mdash;connections, without the need for ExpressRoute.

These would in fact be prerequisites to implementing ExpressRoute anyway, so if the problem
can be resolved directly through establishing better internet connections, ExpressRoute
might not provide more value.

> [!div class="nextstepaction"]
> [Next step: Understand how ExpressRoute works](how-expressroute-works.md)
