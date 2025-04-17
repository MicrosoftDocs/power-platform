---
title: Benefits of using ExpressRoute with Power Platform
description: Learn how ExpressRoute enhances compliance and network predictability for Power Platform by avoiding public internet traffic and ensuring dedicated connections.
#customer intent: As a network administrator, I want to learn how ExpressRoute minimizes internet traffic contention so that I can improve network security and predictability.  
author: taiki-yoshida
ms.topic: concept-article
ms.date: 04/17/2025
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

- **Compliance**: Customer information isn't routed over the public internet.
- **Predictability**: A dedicated connection avoids conflicts with other internet traffic.

:::image type="complex" source="media/expressroute-network-overview.png" alt-text="Overview network diagram of using ExpressRoute." lightbox="media/expressroute-network-overview.png":::
   Overview diagram of an ExpressRoute-enabled network configuration with Microsoft public services and Azure. The customer's network includes two offices, one in Texas and one in Seattle. The Texas office uses the public internet to make a direct connection to Microsoft public services. For the Seattle office, the network connection is to the network partner edge, which has an ExpressRoute connection to the Microsoft edge. Two connections are set up, one primary and one secondary. From the Microsoft edge, Microsoft peering is used to connect to Microsoft public services, and Azure private peering is used to connect from the Microsoft edge to Azure services.
:::image-end:::

## Compliance

For regulatory purposes, some organizations need to prove that sensitive data is never passed over the public internet. In these situations, standard connections to cloud services might not be acceptable. Routing the traffic to Power Platform through a private connection avoids exposing sensitive data to the public internet.

Most regulations don't specify that the internet can't be used. They simply require that data is protected in transit&mdash;typically through encryption at the level of 256-bit Advanced Encryption Standard. The TLS (Transport Layer Security) encryption used by Power Platform meets this standard.

However, some organizations might have requirements that are more stringent. For example, data might need to be protected both in transit and at rest. ExpressRoute can help meet these requirements by demonstrating that all network activities occur under a private connection, which streamlines the process of attesting that data is protected and isn't exposed to the public internet.

ExpressRoute isn't the only way to comply with these requirements. You can comply even if you're using the public internet if you establish proper security and protection measures.

## Network traffic predictability

In most organizations, many users share a single internet connection, which can lead to contention for bandwidth. The connection from the internet service provider can also contend with other customers.

ExpressRoute can establish a private and direct connection to Microsoft datacenters, reducing the chances of contention with other traffic from the same organization or from other customers.  

The main issue might be related to bandwidth availability, internal routing through the ExpressRoute connectivity provider, or traffic between the customer and the connectivity provider. If so, increasing bandwidth and using more reliable or better-optimized connections can resolve the problem without requiring ExpressRoute.  

## Next step

> [!div class="nextstepaction"]
> [Understand how ExpressRoute works](how-expressroute-works.md)
