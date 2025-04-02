---
title: Benefits of using ExpressRoute with Power Platform
description: Learn how ExpressRoute enhances compliance and network predictability for Power Platform by avoiding public internet traffic and ensuring dedicated connections.
#customer intent: As a network administrator, I want to learn how ExpressRoute minimizes internet traffic contention so that I can improve network security and predictability.  
author: taiki-yoshida
ms.topic: concept-article
ms.date: 04/02/2025
ms.subservice: architecture-center
ms.author: tayoshi
ms.reviewer: jhaskett-msft
contributors:
  - rogergilchrist
  - topness-msft
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Benefits of using ExpressRoute with Power Platform

The benefits of using ExpressRoute for your organization include:

- **Compliance**: You won't route customer information via the public internet.
- **Predictability**: A dedicated connection avoids conflicts with other internet traffic.

:::image type="complex" source="media/expressroute-network-overview.png" alt-text="Overview network diagram of using ExpressRoute." lightbox="media/expressroute-network-overview.png":::
   Overview diagram of the ExpressRoute-enabled network configuration with Microsoft public services and Azure. In the customer's network includes two offices, one in Texas and the other in Seattle. A direct connection to Microsoft public services is made by using public internet traffic from the Texas office. For the Seattle office, the network connection is set up to connect to the network partner edge, which has an ExpressRoute connection set up to the Microsoft edge. Two connections are set up, one primary and one secondary. From the Microsoft edge, Microsoft peering is used to connect to Microsoft public services, and Azure private peering is used to connect from the Microsoft edge to Azure services. 
:::image-end:::

## Compliance

Routing the traffic to Power Platform through a private connection avoids routing sensitive data over the public internet. For regulatory purposes, some organizations need to prove that data is never passed
through the public internet. In these situations, using standard connections
via the public internet to cloud services might not be acceptable.

Most regulations don't specify that the internet can't be used. They simply require that data is protected in transit—typically through encryption at the level of 256-bit Advanced Encryption Standard, which the TLS (Transport Layer Security) encryption used by Power Platform meets.

### GDPR

One of the regulations that might make ExpressRoute the right choice for your
organization is GDPR. Learn more: [General Data Protection Regulation Summary](/compliance/regulatory/gdpr)

One reason to consider ExpressRoute for GDPR compliance is to demonstrate that all network activities occur under a private connection, which streamlines the process of attesting that data is protected and isn't exposed to the public internet. However, ExpressRoute isn't the only way to comply with GDPR. You can comply using the public internet if you establish proper security and protection measures.  

## Network traffic predictability

In most organizations the internet connection is shared by many users, which can lead to contention for bandwidth. The connection within the internet service provider can also suffer from contention from other customers.

ExpressRoute can establish a private and direct connection to Microsoft datacenters. Connecting directly to Microsoft datacenters reduces the chances of contention with other traffic from the same organization or others.  

The main issue might be related to bandwidth availability, internal routing through the ExpressRoute connectivity provider, or traffic between the customer and the connectivity provider. If so, increasing bandwidth and using more reliable or better-optimized connections can resolve the problem without requiring ExpressRoute.  

## Next step

> [!div class="nextstepaction"]
> [Understand how ExpressRoute works](how-expressroute-works.md)
