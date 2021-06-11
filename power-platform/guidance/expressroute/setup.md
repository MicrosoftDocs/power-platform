---
title: "Setting up ExpressRoute for Microsoft Power Platform | MicrosoftDocs"
description: "Detailed explanation of the kinds of network setup required for enabling ExpressRoute with Microsoft Power Platform"
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

# Setting up ExpressRoute for Power Platform

Power Platform itself does not need to be configured specifically for
ExpressRoute. Power Platform as a service uses Microsoft Azure behind the scenes
and has been onboarded to support use with ExpressRoute. Therefore, there is no
specific configuration of the Power Platform environments themselves that need
to specify that ExpressRoute is being used.

Within the Microsoft network, ExpressRoute handles traffic by advertising
routing for specific IP subnets to the specific ExpressRoute circuit against
which they have been configured. Because that routing is advertised across a BGP
connection, it is typically chosen as the most efficient connection to reach
that destination in preference to routing via the Internet.

At the customer side, the BGP connection advertises the IP prefixes for the
services for each peering type configured for that ExpressRoute circuit.

Determining what further network configuration is needed will depend on what
interactions you wish to route via ExpressRoute.

## Server traffic

#### Inbound traffic (Traffic to Power Platform services)

Configuring for inbound traffic will require establishing internal routing
within the data center to prefer connections through the ExpressRoute circuit
for traffic to Microsoft services.

#### Outbound traffic (Traffic from Power Platform services)

Where traffic is routed back out through ExpressRoute, such as to an on-premises
server, there are no controls within ExpressRoute to lock down the services that
make connections. The routing is all done at the network level and therefore
does not validate the particular service making the request before routing the
traffic.

Requests could be made from other services to a customer service. Particularly
for Power Platform services, it is a shared service, so it is not possible to
lock the requests down to a particular set of machines. It is necessary to
consider traffic back through ExpressRoute as coming from an external source,
because although it is coming from a Microsoft datacenter, Microsoft is not
controlling the source of the requests and other customer services could attempt
connections. Any connections should be controlled as if they are from an
external gateway.

![Diagram Description automatically generated](media/4b711e6361c08e609fe203a355c37d5b.png)

In order to be routed back through ExpressRoute, any service being connected to
must:

-   Have a publicly-discoverable URL

-   Have a public IP address that matches a subnet configured for an
    ExpressRoute circuit peering definition

-   Be in the same region as the requesting service if ExpressRoute Standard is
    used, or in any region if ExpressRoute Premium is used

This approach is particularly valuable for a number of common integration
scenarios between online and on-premises services.

Outbound traffic from a Power Platform resource will need the target IP address
to be a public IP address and advertised through an ExpressRoute circuit. All
traffic should be treated as from the Internet, though, due to the shared nature
of the Microsoft cloud services. So typically, a reverse proxy or application
gateway should be used to inspect and control inbound traffic from ExpressRoute.

The IP subnets that are used can be found here:

-   [System requirements, limits, and configuration values for Power
    Apps](https://docs.microsoft.com/en-us/powerapps/maker/canvas-apps/limits-and-config#ip-addresses)

-   [IP address configuration for Power
    Automate](https://docs.microsoft.com/en-us/power-automate/ip-address-configuration#connectors)

## Client traffic

Users may be on a variety of clients, such as PCs on the corporate network or
mobile devices on public connections. Client traffic would typically be inbound
to the Microsoft services rather than outbound back to the client. You should
note that ExpressRoute is not enforced as the ONLY route to Power Platform.

If their traffic is to be routed across the ExpressRoute circuit, then the
challenge of routing the traffic internally first from the client through the
LAN or WAN to the subnet connected to ExpressRoute is one for the customer’s
network team to perform. It is also their responsibility to ensure that this
traffic does not accidentally leak out and connect via the public Internet.

Power Platform does not block traffic that is received directly from the
Internet. Neither will ExpressRoute block responses from traffic that was
originally received directly from the Internet. Power Platform service will
still be advertised publicly on the Internet, so there will be routing paths to
the service available separately from ExpressRoute.

Correct traffic routing would typically be ensured through use of proxies within
the corporate network and for mobile devices potentially the additional use of
VPN to connect back into the corporate network first, ensuring that traffic is
routed via the corporate ExpressRoute circuit. However, note that this could
incur overhead compared to directly accessing the cloud services through a local
Internet breakout.

Therefore, while ExpressRoute can be configured for use connecting to/from Power
Platform, it is important to realize that ExpressRoute:

-   Does not ensure that traffic from within the corporate network uses
    ExpressRoute. To ensure that requests from within the corporate network
    utilize ExpressRoute, the proxy/routing rules within the corporate network
    determine this and must be set up by the customer.

-   Does not prevent other connections (e.g., users on the Internet) from going
    directly to Power Platform.

![Diagram Description automatically generated](media/e5e666431c7762e6bbe32f4766ec2b9b.png)

The issue of external connectivity is particularly a concern where mobile users
are involved, especially from mobile devices such as laptops, tablets, and
phones. Where this is a concern, there are number of approaches that can be used
to manage this:

-   Where federated authentication is used, ensuring that access to ADFS is only
    possible after VPN connection to the corporate network is established.

-   Azure AD conditional access and Intune can be used to control from which
    devices and locations access is allowed and to control the device
    configuration such as proxies, VPN and routing.

![Diagram Description automatically generated](media/73bc178ef10d1596348f04599dba5d5d.png)

## Common questions and scenarios with ExpressRoute

When implementing ExpressRoute, it is as important to understand what it does
not do as what it does. In this section we will explore some common questions
and scenarios to be considered.

### Configuration of customer network routing

Enabling ExpressRoute handles the configuration of network traffic within the
Microsoft network, but does not change the routing of traffic within the
customer network itself. It is necessary to configure the network routing within
the customer network to direct traffic to Microsoft cloud services to the subnet
connected to ExpressRoute and then across the ExpressRoute circuit.

We advertise more specific routes for Microsoft 365 over ExpressRoute than the
routes we advertise on the public Internet. If the customer propagates the
specific routes from us to their network, their user traffic will be routed to
ExpressRoute because of Longest Prefix Matching (LPM).

Two key reasons customers run into challenges when configuring ExpressRoute are:

-   Their internal network routing to route traffic to the ExpressRoute
    connection point is incorrectly set up.

-   They have asymmetric routing, where request and response traffic is routed
    differently.

    For example, traffic is routed directly to Microsoft cloud services across
    the Internet but then returns via ExpressRoute, triggering firewall
    exceptions blocking the return traffic.

### Performance

ExpressRoute alone will typically not add significant advantages in performance
over an efficient network connection with available capacity. It is possible
that the process of establishing a dedicated and private connection by your
connectivity provider results in a more optimized connection than your shared
Internet connection.

### Data load throughput to Power Platform

When performing data loads to Power Platform, it is rarely the network that’s
the bottleneck into Power Platform for data traffic. More likely it’s the
application processing that needs to be optimized.

ExpressRoute therefore is rarely a direct contributor to higher throughput of
data load into Power Platform. (However, ExpressRoute would make the traffic
more predictable and ensure the data is not sent over the public Internet.)

> [!div class="nextstepaction"]
> [Next step: ExpressRoute Readiness Checklist](checklist.md)