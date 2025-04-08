---
title: Things to consider before you use ExpressRoute with Power Platform
description: Learn the key considerations for using ExpressRoute with Microsoft Power Platform, including network configuration, costs, and performance impacts.
#customer intent: As a network administrator, I want to understand the considerations for using ExpressRoute with Power Platform so that I can plan and configure my network effectively.  
author: taiki-yoshida
ms.topic: conceptual
ms.date: 04/02/2025
ms.subservice: architecture-center
ms.author: tayoshi
ms.reviewer: jhaskett-msft
contributors:
  - rogergilchrist
  - rjmax
  - carrema
  - topness-msft
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Things to consider before you use ExpressRoute with Power Platform

Setting up ExpressRoute is often more complex than you think it will be. It's easy to overlook or underestimate the following actions and implications, either in planning or in execution:

- Configuring your network to route traffic to the subnet that's connected to ExpressRoute.

- Avoiding asymmetric routing, where traffic goes directly to Power Platform across the internet but is returned by ExpressRoute to the corporate network and rejected by the firewall.

- Determining whether to establish multiple ExpressRoute circuits for distributed deployments.

- The overall costs associated with using ExpressRoute, including Microsoft Azure services, connectivity provider provisioning, and ongoing service and internal IT network routing configuration.

You should also consider the possibility of connectivity performance problems and security risks. This article discusses issues that can arise when using ExpressRoute with Power Platform and how to mitigate them.

## Connectivity performance issues

It's important to understand the connectivity performance issues that can arise with ExpressRoute, which can be caused by several factors.

- Poor LAN connectivity: New services might strain an already saturated local network. For example, your Power Platform solution replaces a thick client application where only the data was transmitted across the network. Although a browser application requires less client-side deployment administration, it requires higher bandwidth to transmit both data and presentation information.

- Poor WAN connectivity: At the level of the wide area network (WAN), traffic might traverse the corporate network rather than routing out to the internet earlier. It might be routed through a proxy server, or the WAN link might be saturated. These factors introduce latency that can significantly affect performance. If Power Platform traffic suffers from these challenges, performance at the client might also suffer.

- Poor internet connectivity: Adding cloud services can introduce extra consumption and load on the corporate connection to the internet. The internet connection might not be able to support the extra load, especially at times of peak usage. The internet provider might inefficiently route traffic to Microsoft's network. The connection might suffer from a mix of traffic that competes for the available bandwidth, which affects the quality of the connection. You can address these issues by getting additional bandwidth or separate connections through the internet provider. A separate connection dedicated to priority traffic can help improve both the performance and predictability of the traffic. Make sure that you set up Quality of Service (QoS) correctly. Learn more in [ExpressRoute QoS requirements](/azure/expressroute/expressroute-qos).

## Security control

The next consideration is security control. ExpressRoute itself doesn't encrypt or filter traffic natively (with the exception of [ExpressRoute Direct with MACsec enabled](/azure/expressroute/expressroute-about-encryption)). It simply establishes a private, rather than shared, connection directly between the Microsoft and customer datacenters through their connectivity provider.

Any request from any Microsoft online service or Azure service to the subnet advertised through an ExpressRoute circuit will be routed through that circuit, regardless of the service or the customer. Because the request routes at the network layer, there's no application-level control to check if the requester is appropriate for the destination service.

Traffic to Microsoft services uses public shared services, which can be accessed directly over the public internet. Application-level authentication and authorization control access to these services. Infrastructure-level protections guard against intrusion and threats like denial-of-service attacks.  

For traffic from Microsoft services to on-premises hosted services, the customer is responsible for providing similar protection to their own services when traffic is received across an ExpressRoute connection.

## Ability to restrict ExpressRoute use to only certain Microsoft services

One of the challenges you might face is wanting to use ExpressRoute for a particular Microsoft cloud service but not for others. Although the different peering options provide some level of control, the peering itself doesn't provide granular control within services of the same peering type (for example, to allow routing only to Azure virtual machines but not to Microsoft 365). It's possible, however, to use Border Gateway Protocol (BGP) communities to configure traffic for specific services only.

BGP communities are relevant for Power Platform services with a Microsoft 365 presence, where routing through ExpressRoute might be desirable for one service but not for both, or only for certain individual services of Microsoft 365, such as Microsoft Teams. ExpressRoute doesn't offer the ability to directly configure services to be routed through a specific circuit. However, you can use BGP communities to do the same thing.

Microsoft advertises routes in the Microsoft peering paths with routes tagged with appropriate BGP community values for geographical locations and service types. You can configure your routers to use the [tags for Microsoft 365 services](/microsoft-365/enterprise/bgp-communities-in-expressroute) to route traffic only for those services through the ExpressRoute circuit, and route the rest either across a different ExpressRoute circuit or the public internet.

BGP community values for Power Platform aren't available the same way they are for Microsoft 365 services. Instead, [regional BGP communities](/azure/expressroute/expressroute-routing#bgp) with corresponding Microsoft Azure regions are used for each Power Platform environment. Because Power Platform environments use two sets of datacenters, be sure to check the [Regions overview](/power-automate/regions-overview) to identify which two datacenters are used.

### Microsoft 365 RHANA

Because Power Platform services and Microsoft 365 services are both offered through Microsoft peering, setting up Microsoft peering would by default advertise all Power Platform services and Microsoft 365 services across the ExpressRoute circuit.

Enabling BGP communities to route traffic for one service would lead to both being routed across ExpressRoute. This can have unfavorable results. For example, if you determine the network bandwidth needed for Power Platform and size the ExpressRoute connection accordingly, but inadvertently route all your Microsoft 365 traffic via ExpressRoute, you can saturate your network and cause performance challenges.

:::image type="content" source="media/microsoft-365-power-platform-network.png" alt-text="Diagram showing that Microsoft peering doesn't allow you to keep specific services out of network traffic.":::

While enabling ExpressRoute for Microsoft peering will route all Power Platform and Microsoft 365 traffic through the ExpressRoute connection, it's possible to use BGP community tags to control the routing so that only specific services&mdash;such as Power Platform services but not other Microsoft 365 services&mdash;use the ExpressRoute connection. Not all Microsoft 365 services are designed to work with ExpressRoute. Currently, Power Platform services don't have a designated BGP community like [some Microsoft 365 services do](/azure/expressroute/expressroute-routing#service-to-bgp-community-value). Instead, you should use [regional BPG communities](/azure/expressroute/expressroute-routing#bgp) to match with the region where the [Power Platform environment](/power-platform/admin/environments-overview) was created.

Learn more about routing Microsoft 365 in [selective routing with Microsoft 365](/microsoft-365/enterprise/azure-expressroute).

Because Power Platform services work partially as part of the Microsoft 365 service, many crossover services such as the admin portal and authentication are also required. It's not possible to protect all of these services by using ExpressRoute&mdash;the Microsoft 365 admin center, for example, isn't published across ExpressRoute.

## Support for sovereign clouds

Customers required to meet government or country/region-specific regulations can choose to use a sovereign cloud. Sovereign clouds are physically located in a region to meet the requirements specific to that particular government or country. For example, Power Apps for Government Community Cloud (GCC) is located in the United States, where it meets US government–specific regulations and certifications and satisfies protocols to meet those requirements.

Watch this video describing how Power Platform is available with sovereign clouds: [Video: Sovereign Clouds with Marty Carreras](https://www.youtube.com/watch?v=DMg3uQ5EFLI).

When you consider using a sovereign cloud environment, you must consider what limitations exist, because not all features are available when compared with public cloud environments. The availability by each environment for Power Platform is listed in the following table. Learn about other differences in availability in [Power Automate regions](/power-automate/regions-overview).

| **Region**                                    | **ExpressRoute support** |
|-----------------------------------------------|--------------------------|
| US Government Community Cloud (GCC)           | Supported <sup>1</sup>  |
| US Government Community Cloud High (GCC High) | Supported <sup>1</sup>  |
| China                                         | Supported <sup>2</sup>  |

<sup>1</sup> Customers must use Azure Government ExpressRoute when using US GCC or GCC High regions, and can't use Azure commercial cloud ExpressRoute.  
<sup>2</sup> Customers must use Azure China ExpressRoute when using China regions, and can't use Azure commercial cloud ExpressRoute.  

## Azure ExpressRoute costs

When estimating the costs for ExpressRoute, you need to consider several elements:

- Azure costs  
- Connectivity provider costs  
- Internal setup effort costs  

To determine the business case accurately, consider all these costs when evaluating ExpressRoute for Power Platform. The following sections discuss each cost.

### Azure costs

- Azure ExpressRoute can be purchased in different models.  

- Billing Type  

  - Metered: A base subscription cost per month with unlimited inbound traffic but a per-GB charge for outbound traffic  
  - Unlimited: A base subscription cost per month with unlimited inbound and outbound traffic  

- SKU / Plan  

  - Standard  

    - Basic connection using ExpressRoute  
    - Offers access to services within a single geographical region  
    - If the ExpressRoute circuit is within the same region as the Power Platform environment that users are connecting to, only ExpressRoute standard is required for that circuit  

  - Premium  

    - Offers access to worldwide geographical services from wherever the connection is made  
    - If a user connects through an ExpressRoute circuit from a different region than their end service, they'll require ExpressRoute Premium for that ExpressRoute circuit.  

Learn more: [Azure ExpressRoute pricing](https://azure.microsoft.com/pricing/details/expressroute/)

### Connectivity provider costs

In some cases, the costs of establishing the connection with the connectivity provider can be significant. These are separate from the Azure costs for ExpressRoute.

### Internal customer effort to configure the network routing

To enable ExpressRoute, the network routing must be set up internally.  

For many customers, this requires an internal cross-charge to the network team, an external cost to an IT outsourcing provider, or at least an opportunity cost for the efforts of internal staff to focus on the configuration.

## Impacts to existing Power Platform, Microsoft 365, and Azure services in use

When you enable Microsoft peering, traffic for Power Platform services, Microsoft 365, and Azure is routed via ExpressRoute.

If you're already using either Power Platform, Dynamics 365 applications, or Microsoft 365 without ExpressRoute, it's important to be sensitive to the impact on these existing services when you enable Microsoft peering through ExpressRoute (which is the default behavior). It might be necessary to configure routing by using BGP communities to separate traffic to different services.

## Reusing ExpressRoute across multiple online services

A single ExpressRoute connection can be used to access multiple online services; for example, Power Platform, Dynamics 365, Microsoft 365, and Azure.

:::image type="complex" source="media/reuse-network.png" alt-text="Diagram showing a shared ExpressRoute connection with Microsoft public services and Azure.":::
   Diagram showing a shared ExpressRoute connection with Microsoft public services and Azure. Microsoft peering for Microsoft 365, Microsoft Power Platform, Dynamics 365, and Azure public services are sharing the same ExpressRoute connection with Azure private peering for virtual networks.
:::image-end:::

ExpressRoute itself doesn't separate different types of Microsoft services from a particular subnet. It's possible to use BGP community tags to control the routing of traffic to particular services across ExpressRoute. Microsoft doesn't route traffic back across ExpressRoute selectively based on BGP community tags. If traffic needs to be returned differently based on the service type, make sure that the traffic comes from different public IP addresses. Because traffic returning to a subnet is handled at the network level, configuring only some traffic from a subnet to use ExpressRoute is dangerous and can lead to asymmetric routing.

## Next step

> [!div class="nextstepaction"]
> [Understand Power Platform architecture](understanding-architecture.md)