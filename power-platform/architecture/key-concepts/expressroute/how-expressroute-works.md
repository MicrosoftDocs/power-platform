---
title: How ExpressRoute work with Power Platform
description: Learn how ExpressRoute integrates with Microsoft Power Platform to optimize connectivity and improve performance for your cloud services.
#customer intent: As a network administrator, I want to understand how ExpressRoute integrates with Microsoft Power Platform so that I can optimize connectivity for my organization.  
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

# How ExpressRoute works with Power Platform

To understand how ExpressRoute integrates with Microsoft Power Platform, start by learning the basics of how ExpressRoute works.

An ExpressRoute circuit represents a logical connection between your on-premises infrastructure and Microsoft cloud services through a connectivity provider. You can use multiple ExpressRoute circuits. Each circuit can be in the same or different regions and can be connected to your premises through different connectivity providers.

Connectivity providers are a set of partners who help you set up ExpressRoute so that your on-premises infrastructure and Microsoft cloud are connected. For the complete list of ExpressRoute connectivity partners, go to [ExpressRoute connectivity providers](/azure/expressroute/expressroute-locations#partners). The availability of these providers will depend on the location you choose to connect from.

An ExpressRoute circuit can offer performance advantages because a dedicated and optimized connection is set up directly through the ExpressRoute connectivity provider's infrastructure to the edge of the Microsoft network. This connection can be optimized without ExpressRoute, but because internet connectivity is typically provided through a series of partnerships and relationships among telecommunications providers, your network traffic might be routed through suboptimal connectivity paths to its destination.

When you agree with a connectivity provider to set up a dedicated and private connection, the provider takes direct responsibility for creating an optimized connection to the Microsoft network. This ownership often results in a better experience.

## Peerings

Each circuit has fixed bandwidth, with the bandwidth limitation dependent on [which plan you choose](https://azure.microsoft.com/pricing/details/expressroute/). This circuit is mapped to a connectivity provider and a peering location. The available bandwidth is shared across the peerings for the circuit. A circuit can have up to two separate peerings. These peerings represent the different routings used, depending on which kind of service is being requested:

- **Microsoft peering** routes requests to Microsoft public services such as Microsoft 365, Dynamics 365, or Power Platform services.

- **Private peering** routes requests to the customer's private Azure services, for example, Azure Virtual Machines.

Each peering is a pair of independent Border Gateway Protocol (BGP) sessions, each configured redundantly for high availability. To ensure true resilience, make sure these sessions transit over physically different connections.

Microsoft advertises the IP subnets or prefixes of the cloud services to the public internet. Microsoft also advertises the IP prefixes for the relevant services through the ExpressRoute BGP connection for the services specified in the peerings defined for that circuit.

:::image type="complex" source="media/traffic-route-onprem-to-cloud.png" alt-text="Diagram of network traffic routed from on-premises to Microsoft online services via ExpressRoute.":::
   Internal router configuration traffic for Microsoft online services to the ExpressRoute connected subnet. Router configuration routes traffic via the BGP session through the ExpressRoute circuit. After traffic reaches the Microsoft edge, the internal routing configuration routes traffic to the appropriate service.
:::image-end:::

For traffic to Microsoft, the internal routing configuration within the customer network needs to set up&mdash;and is responsible for&mdash;the following:

- Prioritizing the route for Microsoft online services traffic via the subnet connected to ExpressRoute, as opposed to the public internet connection

- Routing the Microsoft online services traffic from the connected subnet through the BGP session established through ExpressRoute

At the other side, Microsoft is then responsible for routing the traffic to the appropriate service within the Microsoft datacenter.

This image shows the requirements for traffic routed from Microsoft online services to an external service.

:::image type="complex" source="media/traffic-route-msol-external.png" alt-text="Diagram of network traffic routed from Microsoft online services to an external service.":::
   Requests to external services are looked up against DNS. If the IP address is registered against an ExpressRoute circuit, it's routed internally. Traffic to the IP address registered against ExpressRoute, routed over the BGP session through the customer private circuit, goes to the ExpressRoute connection. The router configuration routes traffic internally as appropriate, either by using public IP or network address translation (NAT) IP. Lastly, the connection is made to the internal service.
:::image-end:::

When the request is made:

- It must be made through a public URL, which must first be resolved to a public IP address.

- If the IP address is registered against an ExpressRoute peering, the traffic will be routed internally to be sent via the appropriate ExpressRoute circuit.

- If the IP address isn't registered, the routing configuration within the online service will route the traffic out to the public internet.

- After the traffic arrives at the customer network, internal routing within the customer network is responsible for routing it to the final destination, either through direct routing of the IP address or through network address translation (NAT) first.

You must connect to Microsoft cloud services only from a subnet that uses public IP addresses that are owned by you or your ExpressRoute connectivity provider. If you're using private IP addresses in your on-premises network, you or your provider need to translate the private IP addresses to the public IP addresses, by using NAT, before connecting to ExpressRoute. This configuration enables requests from Microsoft services to resolve to the service endpoint and route through the network across shared network segments.

## ExpressRoute peering

One critical factor to consider is that ExpressRoute doesn't currently allow you to directly configure specific services to be transported across the ExpressRoute circuit; rather; it allows you to enable groups of services&mdash;called *peerings*&mdash;to be transported.

There are two types of ExpressRoute peerings: Microsoft and private.

### Microsoft peering

Configuring ExpressRoute for Power Platform services requires Microsoft peering, which by default will jointly route both Power Platform services and Microsoft 365 via ExpressRoute. This means that the traffic will be routed to go to public IP address ranges that are used by these services.

It's possible to use BGP communities to configure the network to route traffic only for certain services, such as only Microsoft Teams or only SharePoint Online services, through an ExpressRoute Microsoft peering circuit. This is currently not supported for  Power Platform. The alternatives are explained in the following section.

Connectivity to Microsoft online services&mdash;such as Microsoft 365 and Power Platform services&mdash;will be routed through Microsoft peering. Microsoft assigns the URLs and IP addresses for Power Platform, Dynamics 365 customer engagement applications, and Microsoft 365 services to the Microsoft peering, so any traffic routed to them will be advertised and enabled through the Microsoft peering. Unlike Microsoft 365, Power Platform doesn't have designated BGP communities. (Learn more about BGP communities in [Ability to restrict ExpressRoute use to only certain Microsoft services](things-to-consider.md#ability-to-restrict-expressroute-use-to-only-certain-microsoft-services).)

:::image type="complex" source="media/traffic-using-microsoft-peering.png" alt-text="Diagram showing the traffic using Microsoft peering.":::
    Traffic using Microsoft peering. After a connection reaches the Microsoft edge, it's no longer a designated connection within the Microsoft network.
:::image-end:::

Using Microsoft peering, connections go to shared services at Microsoft. This means that after a connection arrives at the Microsoft datacenter, the ongoing connection traverses an internal shared network. The private connection provided by ExpressRoute doesn't extend all the way to the destination service endpoint itself.

### Private peering

Private peering is used for your private Azure infrastructure as a service (IaaS) services, and not directly used by Power Platform services. This type of peering typically connects to private IP addresses in an Azure virtual network.

:::image type="complex" source="media/microsoft-peering-private-peering-differences.png" alt-text="Diagram showing network overview with Microsoft peering and private peering.":::
   Diagram showing a network overview with Microsoft peering and private peering. Microsoft peering establishes a private connection from the customer's network to the Microsoft edge. After reaching the edge, traffic is routed as ordinary traffic, where the private connection provided by ExpressRoute doesn't extend all the way to the destination service endpoint itself. For Azure private peering, the traffic remains private up to the endpoint of the Azure service you created.
:::image-end:::

For Power Platform, Microsoft doesn't use private services that you can access directly, so it isn't necessary to configure private peering for ExpressRoute. If you separately use Azure private services, configuring private peering won't be harmful unless the introduction of additional workloads causes the connection to become saturated.

### ExpressRoute controls traffic to the Microsoft network, not within it

When connections are made to a private Azure resource&mdash;such as an Azure virtual machine&mdash;ExpressRoute links the connection you made directly to your private Azure resources.

For Microsoft peering, ExpressRoute is a dedicated connection between your network and the edge of the Microsoft network. It isn't a dedicated connection all the way to your specific Power Platform environment. After the traffic reaches the Microsoft network and is identified through the peering rules as targeting a public resource&mdash;either Azure or a Microsoft service like Microsoft 365 or Power Platform&mdash;the end target is a shared service so the network connection to it's also shared within the Microsoft network.

Traffic between services in Microsoft datacenters is routed within the Microsoft network rather than via the public internet.

:::image type="complex" source="media/no-direct-link.png" alt-text="Network diagram showing there are no direct links between Azure IaaS and Microsoft Power Platform services.":::
   Network diagram showing there are no direct links between Azure IaaS and Microsoft Power Platform services. Within the same datacenter, this traffic will be routed normally.
:::image-end:::

## Next step

> [!div class="nextstepaction"]
> [Things to consider before using ExpressRoute](things-to-consider.md)
