---
title: "Consider this before using ExpressRoute with Microsoft Power Platform | MicrosoftDocs"
description: "Learn about things to consider before deciding to use ExpressRoute with Microsoft Power Platform"
author: taiki-yoshida
ms.service: power-platform
ms.topic: conceptual
ms.date: 06/30/2021
ms.author: tayoshi
ms.reviewer: kathyos
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Things to consider before using ExpressRoute with Microsoft Power Platform

The complexity of setting up ExpressRoute is often underestimated. In particular,
the following actions and implications are often overlooked, either in
planning or execution:

-   Configuring your network to route traffic to the subnet
    connected to ExpressRoute

-   Avoiding asymmetric routing, where traffic goes directly to Microsoft Power Platform across the
    internet but is returned by ExpressRoute to the corporate network, triggering
    rejection of the traffic by the firewall

-   The overall costs of provisioning ExpressRoute, including Microsoft Azure
    services, connectivity provider provisioning, and ongoing service and
    internal IT network routing configuration

-   Determining whether multiple ExpressRoute circuits should be established for
    distributed deployments

## Connectivity performance issues

### LAN connectivity

Some of the common issues a user might experience are:

-   The connectivity within the local network is already saturated before
    adding a rich browser application to the mix.

-   Microsoft Power Platform is replacing a thick client application where only
    the data was transmitted across the network, rather than both data and
    presentation information.

It's important to understand that a browser application, while requiring less in
terms of client-side deployment administration, will require higher bandwidth
than a thick client application, and therefore an already-saturated local network
will suffer further with the addition of new services.

### Poor WAN connectivity

Based on network analysis of connectivity to the online service, a common pattern
is that at some point network traffic traverses an internal
network route that adds significant latency. This can be because of conditions
such as:

-   Saturation of the WAN link.

-   Proxy processing, incurring more latency and overhead.

-   Inefficient internal routing (for example, routing within the corporate network
    rather routing out to the internet earlier).

If Microsoft Power Platform traffic suffers from those challenges, performance at the
client might also suffer.

### Poor internet connectivity

Adding cloud services can introduce extra consumption and load on the
corporate connection to the internet. This can happen if:

-   The internet connection isn't sufficient to support the additional load.

-   Within the internet service provider's (ISP)'s network, the routing of that traffic to
    Microsoft’s network is controlled by the ISP; the efficiency of that routing
    can vary.

-   The connection suffers from a mix of traffic, which affects the quality of the connection
    (for example, multiple internet-based training sessions, Microsoft Stream, or YouTube videos
    with traffic to a business-critical application competing for the available
    bandwidth). This might be sufficient overall for the volume of traffic, but
    potentially might affect performance through peaks of demand, which activity
    like video streaming will introduce.

These things can be addressed by getting additional bandwidth or separate
connections through the ISP. In particular, having a separate connection
dedicated to priority traffic can help with both the performance and
predictability of the traffic.

Also, make sure that you set up Quality of Service (QoS) correctly. If you're using
Microsoft Teams and Microsoft Stream, refer to the [QoS requirements within ExpressRoute](/azure/expressroute/expressroute-qos).

## Security control

The next configuration you need to consider is the security control.
ExpressRoute itself doesn't encrypt or filter traffic natively (with the exception
of [ExpressRoute Direct with MACsec enabled](/azure/expressroute/expressroute-about-encryption));
it simply establishes a private, rather than shared, connection directly between
the Microsoft and customer datacenters through their connectivity provider.

Any request from any Microsoft online service or Azure service to the subnet
advertised through an ExpressRoute circuit will be routed via that circuit,
regardless of the service or customer. Because the request is routed at the network
layer, there's no application-level control to determine whether that's an appropriate
requester for that destination service.

For traffic to Microsoft services, because these are public shared services they can be
accessed directly across the public internet. Access control to these services
is handled through application-level authentication and authorization services.
They're further protected at an infrastructure level against intrusion and
threats like denial-of-service attacks.

For traffic from Microsoft services to on-premises hosted services, the customer
is responsible for providing similar protection to their own services when
traffic is received across an ExpressRoute connection.

## Ability to restrict ExpressRoute use to only certain Microsoft services

One of the challenges you might face is wanting to use ExpressRoute for a
particular Microsoft cloud service but not for others. Although the different
peering options provide some level of control here, the peering itself doesn't
provide granular control within services of the same peering type (for example
to enable routing only to Azure virtual machines but not to Microsoft 365). It's
possible, however, to use Border Gateway Protocol (BGP) communities to configure traffic for specific
services only.

This is relevant for Microsoft Power Platform services with a Microsoft 365
presence, where routing via ExpressRoute might be desirable for one service but
not for both, or only for certain individual services of Microsoft 365 such as
Microsoft Teams.

ExpressRoute itself doesn't currently offer the ability to directly configure
services to be routed via a specific ExpressRoute circuit at this level of
service granularity, but BGP communities can be used to control this.

Microsoft advertises routes in the Microsoft peering paths with routes tagged
by using appropriate BGP community values for geographical locations and service
types. These can then be configured in the customer's routers to route traffic
for those services through the ExpressRoute circuit.

You can use different [tags for Microsoft 365 services](/microsoft-365/enterprise/bgp-communities-in-expressroute?view=o365-worldwide) to route traffic
only for those services through the ExpressRoute circuit, and route the rest either across
a different ExpressRoute circuit or the public internet.

Microsoft Power Platform&ndash;specific BGP community values aren't available like they are for
Microsoft 365 services. Instead, [regional BGP communities](/azure/expressroute/expressroute-routing#bgp)
are used with corresponding Microsoft Azure regions that are used for each Microsoft Power
Platform environment. Because Microsoft Power Platform environments use two sets of
datacenters, be sure to look at the [Regions overview](/power-automate/regions-overview) to
check which two datacenters are used. More information: [BGP communities for GCC](/azure/azure-government/compare-azure-government-global-azure#azure-expressroute)

### Microsoft 365

Because Microsoft Power Platform services and Microsoft 365 services are both offered through
Microsoft peering, setting up Microsoft peering would by default advertise
all Microsoft Power Platform services and Microsoft 365 services across the ExpressRoute
circuit.

The result of this is that enabling BGP communities to route traffic for one service would
lead to both being routed across ExpressRoute. This might or might not be desirable, but it
can have unfavorable results. For example, if you've determined the network
bandwidth needed for Microsoft Power Platform and sized the ExpressRoute connection
accordingly, but then inadvertently also route all your Microsoft 365 traffic
via ExpressRoute, this might saturate your network and cause performance
challenges.

![Diagram showing that Microsoft peering doesn't allow you to keep specific services out of network traffic.](media/microsoft-365-power-platform-network.png)

While enabling ExpressRoute for Microsoft peering will route all
Microsoft Power Platform and Microsoft 365 traffic through the ExpressRoute connection, it's possible to use BGP community tags to control the routing so that only
specific services&mdash;such as Microsoft Power Platform services but not other Microsoft 365
services&mdash;use the ExpressRoute connection. In particular, not all Microsoft
365 services are designed to work with ExpressRoute. Currently, Microsoft Power Platform
services don't have a designated BGP community like [some Microsoft 365 services do](/azure/expressroute/expressroute-routing#service-to-bgp-community-value).
Instead, you should use [regional BPG communities](/azure/expressroute/expressroute-routing#bgp)
to match with the region where the [Microsoft Power Platform environment](/power-platform/admin/environments-overview)
was created.

For more information about routing Microsoft 365, go to the documentation on
[selective routing with Microsoft 365](/microsoft-365/enterprise/azure-expressroute?view=o365-worldwide).

Because Microsoft Power Platform services work partially as part of the Microsoft 365 service,
many crossover services such as the admin portal and authentication are also
required. It's not possible to protect all of these services by using ExpressRoute; the
Microsoft 365 admin center, for example, isn't published across ExpressRoute.

## Support for sovereign clouds

Customers required to meet government or country-specific regulations can choose
to use a sovereign cloud. Sovereign clouds are physically located in a region
to meet the requirements specific to that particular government or country. For
example, Power Apps for Government Community Cloud (GCC) is located in the
United States, where it meets US government&ndash;specific regulations and
certifications, and satisfies protocols to meet those requirements.

Watch this video describing how Microsoft Power Platform is available with sovereign clouds: [Video: Sovereign Clouds with Marty Carreras](https://www.youtube.com/watch?v=DMg3uQ5EFLI).

When you consider using a sovereign cloud environment, you must consider
what limitations exist, because not all features are available when compared
with public cloud environments. The availability by each environment for Microsoft Power Platform is listed in the following table. For other differences in availability, read through the documentation about [datacenter regions](/power-automate/regions-overview).

| **Region**                                    | **ExpressRoute support** |
|-----------------------------------------------|--------------------------|
| US Government Community Cloud (GCC)           | Supported <sup>1</sup>            |
| US Government Community Cloud High (GCC High) | Supported <sup>1</sup>            |
| China                                         | Supported <sup>2</sup>            |

<sup>1</sup> Customers must use Azure Government ExpressRoute when using US GCC or GCC High regions, and can't use Azure commercial cloud ExpressRoute.
<sup>2</sup> Customers must use Azure China ExpressRoute when using China regions, and can't use Azure commercial cloud ExpressRoute.


## Azure ExpressRoute costs

When estimating the costs for ExpressRoute, you need to consider several
elements:

-   Azure costs

-   Connectivity provider costs

-   Internal setup effort costs

In determining the business case accurately, it's important to consider all
these costs when evaluating ExpressRoute for Microsoft Power Platform. Each is discussed
in the following sections.

### Azure costs

-   Azure ExpressRoute can be purchased in different models.

-   Billing Type

    -   Metered: a base subscription cost per month with unlimited inbound
        traffic but a per-GB charge for outbound traffic

    -   Unlimited: a base subscription cost per month with unlimited inbound and
        outbound traffic

-   SKU / Plan

    -   Standard

        -   Basic connection using ExpressRoute

        -   Offering access to services within a single geographical region

        -   If the ExpressRoute circuit is within the same region as the Microsoft Power
            Platform environment that users are connecting to, only
            ExpressRoute standard is required for that circuit

    -   Premium

        -   Offers access to worldwide geographical services from wherever the
            connection is made

        -   If a user connects through an ExpressRoute circuit from a different
            region than their end service, they'll require ExpressRoute
            Premium for that ExpressRoute circuit.

More information: [Azure ExpressRoute pricing](https://azure.microsoft.com/pricing/details/expressroute/)

### Connectivity provider costs

In some cases, the costs of establishing the connection with the connectivity provider can be significant. These are separate from the Azure costs for ExpressRoute.

### Internal customer effort to configure the network routing

To enable ExpressRoute, the network routing must be set up internally.

For many customers, this will require an internal cross-charge to the network team or an external cost to an IT outsourcing provider, or at least opportunity cost for the efforts of internal staff to focus on the configuration.

## Impacts to existing Microsoft Power Platform, Microsoft 365, and Azure services in use

When Microsoft peering is enabled, this will configure traffic for Microsoft Power
Platform services, Microsoft 365, and Azure to be routed via ExpressRoute.

If you're already using either Microsoft Power Platform, Dynamics 365
applications, or Microsoft 365 without ExpressRoute, it's important to
be sensitive to the impact on these existing services when you enable Microsoft peering
through ExpressRoute (which is the default behavior). It might be necessary
to configure routing by using BGP communities to separate traffic to different
services.

## Reusing ExpressRoute across multiple online services

A single ExpressRoute connection can be used to access multiple online services, for example, Microsoft Power Platform, Dynamics 365, Microsoft 365, and Azure.

:::image type="complex" source="media/reuse-network.png" alt-text="Diagram showing a shared ExpressRoute connection with Microsoft public services and Azure.":::
   Diagram showing a shared ExpressRoute connection with Microsoft public services and Azure. Microsoft peering for Microsoft 365, Microsoft Power Platform, Dynamics 365, and Azure public services are sharing the same ExpressRoute connection with Azure private peering for virtual networks.
:::image-end:::

ExpressRoute itself doesn't separate different types of Microsoft
services from a particular subnet. It's possible to use BGP community tags
to control the routing of traffic to particular services across ExpressRoute.
Microsoft doesn't route traffic back across ExpressRoute selectively based on
BGP community tags. If traffic needs to be returned differently based on the
service type, make sure that the traffic comes from different public IP
addresses. Because any traffic returning to a subnet will be handled at the
network level, it would be dangerous to configure only some traffic from a
subnet to use ExpressRoute, because this can lead to asymmetric routing.

> [!div class="nextstepaction"]
> [Next step: Understanding Microsoft Power Platform architecture](understanding-architecture.md)
