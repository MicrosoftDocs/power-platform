---
title: How ExpressRoute works with Power Platform
description: Learn how ExpressRoute integrates with Microsoft Power Platform to optimize connectivity and improve performance for your cloud services.
#customer intent: As a network administrator, I want to understand how ExpressRoute integrates with Microsoft Power Platform so that I can optimize connectivity for my organization.  
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

# How ExpressRoute works with Power Platform

An ExpressRoute circuit represents a logical connection between your on-premises infrastructure and Microsoft cloud services through a connectivity provider. [ExpressRoute connectivity providers](/azure/expressroute/expressroute-locations#partners) are partners who help you set up ExpressRoute to connect your on-premises infrastructure and the Microsoft Cloud. The availability of these providers depends on the location you choose to connect from.

You can use multiple ExpressRoute circuits. Circuits can be in the same or different regions and connect to your on-premises network through different connectivity providers.

An ExpressRoute circuit can offer performance advantages because a dedicated and optimized connection is set up directly through the ExpressRoute connectivity provider's infrastructure to the edge of the Microsoft network. The connection can be optimized without ExpressRoute, but internet connectivity often relies on multiple telecommunications providers, which might route your network traffic through suboptimal paths. Working with a connectivity provider ensures an optimized connection to the Microsoft network, resulting in a better experience.

## Peerings

One critical factor to consider is that ExpressRoute doesn't allow you to directly configure specific services to be transported across the ExpressRoute circuit. Instead, services are transported in groups called *peerings*. ExpressRoute peerings can be either Microsoft or private.

- **Microsoft peering**: Routes requests to Microsoft public services, such as Microsoft 365 and Power Platform, through ExpressRoute by default. This peering is used for public IP addresses.

    :::image type="complex" source="media/traffic-using-microsoft-peering.png" alt-text="Diagram showing the traffic using Microsoft peering.":::
        Traffic using Microsoft peering. After a connection reaches the Microsoft edge, it's no longer a designated connection within the Microsoft network.
    :::image-end:::

    With Microsoft peering, connections go to shared services at Microsoft. That is, ExpressRoute is a dedicated connection between your network and the edge of the Microsoft network. It isn't a dedicated connection all the way to a specific service endpoint or Power Platform environment. When traffic reaches the Microsoft network and is identified through peering rules as targeting a public resource such as Azure, Microsoft 365, or Power Platform, the ongoing connection traverses an internal shared network.

  :::image type="complex" source="media/no-direct-link.png" alt-text="Network diagram showing there are no direct links between Azure IaaS and Microsoft Power Platform services.":::
     Network diagram showing there are no direct links between Azure IaaS and Microsoft Power Platform services. Within the same datacenter, this traffic is routed normally.
  :::image-end:::
  
- **Private peering**: Routes requests to the customer's private Azure services, such as virtual machines in an Azure environment. This peering is used for private IP addresses and private Azure infrastructure as a service (IaaS) services.

    :::image type="complex" source="media/microsoft-peering-private-peering-differences.png" alt-text="Diagram showing network overview with Microsoft peering and private peering.":::
       Diagram showing a network overview with Microsoft peering and private peering. Microsoft peering establishes a private connection from the customer's network to the Microsoft edge. After it reaches the edge, traffic is routed as ordinary traffic, where the private connection provided by ExpressRoute doesn't extend all the way to the destination service endpoint itself. For Azure private peering, the traffic remains private up to the endpoint of the Azure service.
    :::image-end:::

    Microsoft doesn't use private services for Power Platform, so configuring private peering for ExpressRoute isn't necessary. If you separately use Azure private services, it's fine to configure private peering, unless the introduction of more workloads saturates the connection.

An ExpressRoute circuit can have up to two separate peerings, depending on which kind of service is being requested. Each circuit has a fixed bandwidth. The bandwidth limitation depends on [the ExpressRoute plan you choose](https://azure.microsoft.com/pricing/details/expressroute/). The available bandwidth is shared across the peerings for the circuit.

Each peering is a pair of independent Border Gateway Protocol (BGP) sessions, each configured redundantly for high availability.

> [!TIP]
> To ensure true resilience, make sure that these BGP sessions transit over physically different connections.

Microsoft advertises the IP subnets, or prefixes, of its cloud services to the public internet. For the services that are specified in the peerings defined for an ExpressRoute circuit, it advertises the IP prefixes through the ExpressRoute BGP connection.

:::image type="complex" source="media/traffic-route-onprem-to-cloud.png" alt-text="Diagram of network traffic routed from on-premises to Microsoft online services via ExpressRoute.":::
   Internal router configuration traffic for Microsoft online services to the ExpressRoute connected subnet. Router configuration routes traffic via the BGP session through the ExpressRoute circuit. After traffic reaches the Microsoft edge, the internal routing configuration routes traffic to the appropriate service.
:::image-end:::

For traffic to Microsoft, the internal routing configuration in the customer network sets up and manages the following aspects:

- Prioritizing the route for Microsoft online services traffic through the subnet connected to ExpressRoute, as opposed to the public internet connection.

- Routing the Microsoft online services traffic from the connected subnet through the BGP session established through ExpressRoute.

At the other side, Microsoft is responsible for routing the traffic to the appropriate service in the Microsoft datacenter.

The following image shows the requirements for routing traffic from Microsoft online services to an external service.

:::image type="complex" source="media/traffic-route-msol-external.png" alt-text="Diagram of network traffic routed from Microsoft online services to an external service.":::
   Requests to external services are looked up against the DNS. If the IP address is registered against an ExpressRoute circuit, it's routed internally. Traffic to the IP address registered against ExpressRoute, routed over the BGP session through the customer private circuit, goes to the ExpressRoute connection. The router configuration routes traffic internally as appropriate, either by using public IP or network address translation (NAT) IP. Lastly, the connection is made to the internal service.
:::image-end:::

When the request is made:

- It must be made through a public URL, which must first be resolved to a public IP address.

- If the IP address is registered against an ExpressRoute peering, the traffic is routed internally to be sent through the appropriate ExpressRoute circuit.

- If the IP address isn't registered, the online service's routing configuration directs the traffic to the public internet.

- After the traffic arrives at the customer network, internal routing in the customer network is responsible for routing it to the final destination, either through direct routing of the IP address or through network address translation first.

Connect to Microsoft cloud services only from a subnet that uses public IP addresses owned by you or your ExpressRoute connectivity provider. If you're using private IP addresses in your on-premises network, you or your provider need to translate the private IP addresses to the public IP addresses using NAT before connecting to ExpressRoute. This configuration allows requests from Microsoft services to resolve to the service endpoint and route through the network across shared network segments.

It's possible to use BGP communities to configure the network to route traffic only for certain services, such as only Microsoft Teams or only SharePoint Online services, through an ExpressRoute Microsoft peering circuit. This functionality isn't supported for Power Platform. Learn more in [Ability to restrict ExpressRoute use to only certain Microsoft services](things-to-consider.md#ability-to-restrict-expressroute-use-to-only-certain-microsoft-services).

## Next step

> [!div class="nextstepaction"]
> [Things to consider before using ExpressRoute](things-to-consider.md)
