---
title: Set up ExpressRoute for Power Platform
description: Discover the steps to set up ExpressRoute for Microsoft Power Platform, including routing configurations and considerations for inbound and outbound traffic.
#customer intent: As a network administrator, I want to configure ExpressRoute for Power Platform so that I can ensure secure and efficient routing of traffic.  
author: taiki-yoshida
ms.component: pa-admin
ms.topic: best-practice
ms.date: 04/02/2025
ms.subservice: architecture-center
ms.author: tayoshi
ms.reviewer: kathyos
search.audienceType:
  - admin
contributors:
  - rogergilchrist
  - topness-msft
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Set up ExpressRoute for Power Platform

Power Platform itself doesn't need to be configured specifically for ExpressRoute. Power Platform as a service uses Microsoft Azure behind the scenes and has been onboarded to support use with ExpressRoute. Therefore, you don't need to make any specific configurations of the Power Platform environments to specify that ExpressRoute is being used.

Within the Microsoft network, ExpressRoute handles traffic by advertising routing for specific IP subnets to the specific ExpressRoute circuit against which they've been configured. Because that routing is advertised across a Border Gateway Protocol (BGP) connection, it's typically chosen as the most efficient connection to reach that destination in preference to routing via the internet.

At the customer side, the BGP connection advertises the IP prefixes for the services for each peering type configured for that ExpressRoute circuit.

Determining what further network configuration you need depends on what interactions you want to route via ExpressRoute.  

## Server traffic

Server traffic is the traffic between Power Platform services and other services, such as on-premises servers or other Microsoft cloud services. This traffic can be either inbound or outbound, depending on the direction of the connection.

### Inbound traffic (traffic to Power Platform services)

Configuring for inbound traffic requires establishing internal routing within the datacenter to prefer connections through the ExpressRoute circuit for traffic to Microsoft services.

### Outbound traffic (traffic from Power Platform services)

Where traffic is routed back out through ExpressRoute, such as to an on-premises server, there are no controls within ExpressRoute to lock down the services that make connections. The routing is all done at the network level, and therefore doesn't validate the particular service making the request before routing the traffic.

Requests can be made from other services to a customer service. Particularly for Power Platform, which is a shared service, it isn't possible to lock down the requests to a particular set of machines. Consider traffic through ExpressRoute as coming from an external source. Although it comes from a Microsoft datacenter, Microsoft doesn't control the source of the requests, and other customer services might attempt connections. Control all connections as if they come from an external gateway.

:::image type="content" source="media/server-outbound-traffic.png" alt-text="Diagram showing outbound traffic routed back via ExpressRoute for Power Platform.":::

To route traffic back through ExpressRoute, the connected service must:

- Have a publicly discoverable URL.
- Have a public IP address that matches a subnet configured for an ExpressRoute circuit peering definition.
- Be in the same region as the requesting service if ExpressRoute (standard) is used, or in any region if ExpressRoute Premium is used.

This approach is valuable for many common integration scenarios between online and on-premises services.

The target IP address for outbound traffic from a Power Platform resource must be a public IP address advertised through an ExpressRoute circuit. Because Microsoft cloud services are shared, all traffic should be treated as if it originated from the internet. Use a reverse proxy or application gateway to inspect and control inbound traffic from ExpressRoute.

Learn more about IP subnets in [System requirements, limits, and configuration values for Power Apps](/powerapps/maker/canvas-apps/limits-and-config#ip-addresses) and [IP address configuration for Power Automate](/power-automate/ip-address-configuration#connectors).

## Client traffic

Users can use various client devices, such as PCs on the corporate network or mobile devices on public connections. Client traffic will typically be inbound to the Microsoft services rather than outbound back to the client. Note that ExpressRoute isn't enforced as the *only* route to Power Platform.

If client traffic is to be routed across the ExpressRoute circuit, the challenge for your network team is to route the traffic internally first from the client through the LAN or WAN to the subnet connected to ExpressRoute. It's also your team's responsibility to ensure that this traffic doesn't accidentally "leak out" and connect via the public internet.

Power Platform doesn't block traffic received directly from the internet. Neither will ExpressRoute block responses from traffic that was originally received directly from the internet. Power Platform service will still be advertised publicly on the internet, so there will be routing paths to the service available separately from ExpressRoute.

Correct traffic routing is ensured by using proxies within the corporate network and, for mobile devices, possibly adding a VPN to connect to the corporate network first. This setup ensures traffic routes through the corporate ExpressRoute circuit. However, this approach can add overhead compared to directly accessing cloud services through a local internet breakout.

Therefore, while ExpressRoute can be configured for use connecting to and from Power Platform, it's important to realize that ExpressRoute:

- Doesn't ensure that traffic from within the corporate network uses ExpressRoute. The proxy and routing rules within the corporate network determine this, and you must set them up to ensure that requests from within the corporate network use ExpressRoute.

- Doesn't prevent other connections (for example, users on the internet) from going directly to Power Platform.

:::image type="content" source="media/direct-access.png" alt-text="Diagram showing that Power Platform doesn't prevent direct access. Setting up ExpressRoute doesn't ensure that direct access will be disabled.":::

The issue of external connectivity is a concern where mobile users are involved, especially from mobile devices such as laptops, tablets, and phones. If this is a concern, you have a few options:

- Where federated authentication is used, ensure that access to Active Directory Federation Services (AD FS) is only possible after a VPN connection to the corporate network is established.

- Microsoft Entra conditional access and Intune can be used to control which devices and locations are allowed access, and to control the device configuration, such as proxies, VPN, and routing.

:::image type="content" source="media/multiple-connectivity.png" alt-text="Diagram showing mobile workers directly connecting to Power Platform, whereas office workers use corporate Wi-Fi or VPN and access via ExpressRoute.":::

## Common questions and scenarios with ExpressRoute

When implementing ExpressRoute, it's as important to understand what it doesn't do as what it does. In this section, we explore some common questions and scenarios for you to consider.

### Configuration of customer network routing

Enabling ExpressRoute handles the configuration of network traffic within the Microsoft network, but doesn't change the routing of traffic within the customer network itself. You must configure the network routing within your network to direct traffic bound for Microsoft cloud services to the subnet connected to ExpressRoute and then across the ExpressRoute circuit.

We advertise more specific routes for Microsoft 365 over ExpressRoute than the routes we advertise on the public internet. If a customer propagates the specific routes from us to their network, their user traffic is routed to ExpressRoute because of the longest prefix matching rule.

Two key reasons you might run into challenges when configuring ExpressRoute are:

- Your internal network routing to route traffic to the ExpressRoute connection point is incorrectly set up.
- You have asymmetric routing, where request and response traffic is routed differently. For example, traffic is routed directly to Microsoft cloud services across the internet but then returns via ExpressRoute, triggering firewall exceptions that block the return traffic.

### Performance

ExpressRoute alone typically doesn't provide significant performance advantages over an efficient network connection with available capacity. Establishing a dedicated and private connection through your connectivity provider might result in a more optimized connection than a shared internet connection.  

### Data load throughput to Power Platform

When performing data loads to Power Platform, the network is rarely the bottleneck for data traffic. More likely it's the application processing that needs to be optimized.

ExpressRoute, therefore, is rarely a direct contributor to higher throughput of data load into Power Platform. However, ExpressRoute makes traffic more predictable and ensures that data isn't sent over the public internet.

## Next step

> [!div class="nextstepaction"]
> [Checklist for ExpressRoute readiness](checklist.md)