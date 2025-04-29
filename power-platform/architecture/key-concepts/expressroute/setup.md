---
title: Set up ExpressRoute for Power Platform
description: Learn how to set up ExpressRoute for Microsoft Power Platform, including routing configurations and considerations for inbound and outbound traffic.
#customer intent: As a network administrator, I want to configure ExpressRoute for Power Platform so that I can ensure secure and efficient routing of traffic.  
author: taiki-yoshida
ms.component: pa-admin
ms.topic: best-practice
ms.date: 04/17/2025
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

Power Platform services and environments don't need to be configured to use ExpressRoute. However, to use ExpressRoute, you must configure the network routing in your organization to ensure that Power Platform traffic is routed through the ExpressRoute circuit.

In the Microsoft network, ExpressRoute handles traffic by advertising routing for specific IP subnets to the ExpressRoute circuit against which they're configured. Because that routing is advertised across a Border Gateway Protocol (BGP) connection, it's typically chosen as the most efficient connection to reach that destination in preference to routing over the internet.

At the customer side, the BGP connection advertises the IP prefixes for the services for each peering type configured for that ExpressRoute circuit.

Determining what further network configuration you need depends on what interactions you want to route through ExpressRoute. This article describes the different types of traffic that can be routed through ExpressRoute and how to configure your network routing to ensure that traffic is routed correctly.

## Server traffic

Server traffic is the traffic between Power Platform services and other services, such as on-premises servers or other Microsoft cloud services. This traffic can be either inbound or outbound, depending on the direction of the connection.

### Inbound traffic (to Power Platform services)

Configure internal routing in your datacenter to prefer connections through the ExpressRoute circuit for traffic to Microsoft services.

### Outbound traffic (from Power Platform services)

Where traffic is routed back out through ExpressRoute, such as to an on-premises server, ExpressRoute doesn't offer controls to lock down the services that make connections. Because the routing is all done at the network level, it doesn't validate the service that's making the request before routing the traffic.

Other services can send requests to a customer service. It isn't possible to lock down requests to a particular set of machines. As a best practice, consider traffic through ExpressRoute as coming from an external source. Although it comes from a Microsoft datacenter, Microsoft doesn't control the source of the requests. Other customer services might attempt connections. Control all connections as if they come from an external gateway.

:::image type="content" source="media/server-outbound-traffic.png" alt-text="Diagram showing outbound traffic routed back through ExpressRoute for Power Platform.":::

To route traffic back through ExpressRoute, the connected service must:

- Have a publicly discoverable URL.
- Have a public IP address that matches a subnet that's configured for an ExpressRoute circuit peering definition.
- Be in the same region as the requesting service if ExpressRoute (standard) is used, or in any region if ExpressRoute Premium is used.

This approach is valuable for many common integration scenarios between online and on-premises services.

The target IP address for outbound traffic from a Power Platform resource must be a public IP address advertised through an ExpressRoute circuit. Because Microsoft cloud services are shared, all traffic should be treated as if it originated from the internet. Use a reverse proxy or application gateway to inspect and control traffic from ExpressRoute.

Learn more about IP subnets in [System requirements, limits, and configuration values for Power Apps](/powerapps/maker/canvas-apps/limits-and-config#ip-addresses) and [IP address configuration for Power Automate](/power-automate/ip-address-configuration#connectors).

## Client traffic

Traffic on client devices, such as PCs on the corporate network or mobile devices on public connections, is typically inbound to Microsoft services rather than outbound to the client. ExpressRoute isn't enforced as the *only* route to Power Platform. Power Platform doesn't block traffic that's received directly from the internet, and ExpressRoute doesn't block responses from traffic that was originally received directly from the internet. Power Platform services are advertised publicly on the internet, so routing paths to the service are available separately from ExpressRoute.

If client traffic is to be routed across the ExpressRoute circuit, the challenge for your network team is to route the traffic internally first from the client through the LAN or WAN to the subnet that's connected to ExpressRoute. It's also your team's responsibility to ensure that this traffic doesn't accidentally "leak out" and connect to the public internet.

Use proxies in the corporate network and possibly add a VPN to mobile devices to force them to connect to the corporate network first. This setup ensures that traffic routes through the corporate ExpressRoute circuit. However, this approach can add overhead compared to directly accessing cloud services through a local internet breakout.

It's important to understand that ExpressRoute doesn't ensure that traffic in the corporate network uses ExpressRoute. The proxy and routing rules in the corporate network do, and you must set them up to ensure that requests from within the corporate network use ExpressRoute.

ExpressRoute also doesn't prevent other connections&mdash;for example, users on the internet&mdash;from going directly to Power Platform.

:::image type="content" source="media/direct-access.png" alt-text="Diagram showing that Power Platform doesn't prevent direct access and ExpressRoute doesn't ensure that direct access is disabled.":::

External connectivity is a concern where mobile users are involved, especially from mobile devices such as laptops, tablets, and phones. You have a few options:

- If your organization uses federated authentication, make sure that access to Active Directory Federation Services is only possible after a VPN connection to the corporate network is established.

- Use Microsoft Entra conditional access and Intune to control which devices and locations are allowed access and to control the device configuration, such as proxies, VPN, and routing.

:::image type="content" source="media/multiple-connectivity.png" alt-text="Diagram showing mobile workers directly connecting to Power Platform, whereas office workers use corporate wireless networks or VPN and access through ExpressRoute.":::

## Limitations of ExpressRoute

When you consider implementing ExpressRoute, it's as important to understand what it doesn't do as what it does.

### Configuration of customer network routing

ExpressRoute handles the configuration of traffic in the Microsoft network. It doesn't change the routing of traffic in your network. You must configure the network routing in your network to direct traffic that's bound for Microsoft cloud services to the subnet that's connected to ExpressRoute and then across the ExpressRoute circuit.

We advertise more specific routes for Microsoft 365 over ExpressRoute than we advertise on the public internet. If you propagate the specific routes from us to your network, your user traffic is routed to ExpressRoute because of the longest prefix matching rule.

You might run into either or both of the following challenges when you configure ExpressRoute:

- Your internal network routing is incorrectly set up to route traffic to the ExpressRoute connection point.

- You have asymmetric routing, where request and response traffic is routed differently. For example, traffic is routed directly to Microsoft cloud services across the internet but then returns through ExpressRoute, triggering firewall exceptions that block the return traffic.

### Performance

ExpressRoute alone typically doesn't provide significant performance advantages over an efficient network connection with sufficient capacity. A dedicated and private connection through your connectivity provider might result in more optimized connectivity than a shared internet connection.  

### Data load throughput to Power Platform

Because the network is rarely the bottleneck when performing data loads to Power Platform&mdash;more likely, the application processing needs to be optimized&mdash;ExpressRoute is rarely a direct contributor to higher throughput of data into Power Platform. However, ExpressRoute makes traffic more predictable and ensures that data isn't sent over the public internet.

## Next step

> [!div class="nextstepaction"]
> [Checklist for ExpressRoute readiness](checklist.md)
